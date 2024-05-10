/* eslint-disable  func-names */
/* eslint-disable  no-console */
"use strict";

/**
 * @typedef {../node_modules/} db
 */
const { Client } = require("pg");

const logger = require("../logger");

/**
 * @typedef {../node_modules/@types/pg/index} client
 */
let client;
class Pgdao {
  constructor() {
    client = new Client({
      user: "root",
      host: "localhost",
      database: "postgres",
      password: "password",
      port: 15432
    });

    client.connect();

    // initialize();
  }
  initialize = async function() {
    // 初期化処理
  };

  insertBuildingData = async function(data) {
    const query = {
      text:
        "INSERT INTO building( \
        url \
        ,building_name \
        ,nearest_station \
        ,year_of_construction \
        ,deleted_dt \
        ,created_dt \
        ,created_user \
        ,updated_dt \
        ,updated_user) \
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9)",
      values: [
        data.buildingUrl,
        data.buildingName,
        data.buildingNs,
        new Date(data.buildingYoc),
        null,
        new Date(),
        "SYSTEM_USER",
        new Date(),
        "SYSTEM_USER"
      ]
    };
    const result = await client.query(query);
    // logger.info("建物情報登録：", JSON.stringify(result));
    return result;
  };
  getBuildingData = async function(url) {
    // logger.info("getBuildingData START", url)
    const query = {
      text: "SELECT * FROM building WHERE url = $1",
      values: [url]
    };

    const result = await client.query(query);
    // logger.info("建物情報取得：", JSON.stringify(result.rows));
    // logger.info("getBuildingData END")
    return result.rows;
  };

  countPropData = async function(data) {
    const query = {
      text: "SELECT COUNT(*) FROM prop WHERE url = $1",
      values: [data.url]
    };

    const result = await client.query(query);
    // console.log("物件情報件数取得：", result);
    return result.rowCount;
  };

  insertPropData = async function(data) {
    // 枝番採番
    const currentBranchRow = await client.query({
      // text: 'SELECT branch + 1 FROM prop WHERE url = $1',
      text: "SELECT MAX(branch) as latest FROM prop WHERE url = $1",
      values: [data.url]
    });
    // logger.info("currentBranchRow", JSON.stringify(currentBranchRow));
    // const nextBranch = nextBranchRow.rows.length === 0 ? 1 : nextBranchRow.rows[0]
    const nextBranch = !currentBranchRow.rows[0].latest ? 1 : currentBranchRow.rows[0].latest + 1;
    // logger.info("data", JSON.stringify(data));
    // logger.info("nextBranch", JSON.stringify(nextBranch));

    const query = {
      text:
        "INSERT INTO prop( \
        url \
        ,branch \
        ,building_url \
        ,building_name \
        ,floor_plan \
        ,prop_price \
        ,ex_area \
        ,direction \
        ,deleted_dt \
        ,created_dt \
        ,created_user \
        ,updated_dt \
        ,updated_user) \
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13)",
      values: [
        data.url,
        nextBranch, // 取得した次の枝番を設定
        data.buildingUrl,
        data.buildingName,
        data.floorPlan,
        data.propPrice,
        data.exArea,
        data.direction,
        data.deletedDt,
        new Date(),
        "SYSTEM_USER",
        new Date(),
        "SYSTEM_USER"
      ]
    };
    /**
     *       const propInfoRet = {
        propName: await propInfoAnchorEl.getText(),
        propUrl: await propInfoAnchorEl.getAttribute("href"),
        buildingUrl: propInfo.propUrl,
        buildingName: propInfo.propName,
        floorPlan: floorPlan,
        propPrice: propPrice,
        exArea: exArea,
        direction: direction,
        servePeriodInfo: servePeriodInfo
      };

     */

    // console.log("query", query);
    const result = await client.query(query);
    // console.log("建物情報登録：", result);
    return result;
  };
  deletePropData = async function(data) {
    const query = {
      text:
        "UPDATE prop SET deleted_dt = ($1), updated_dt = ($2), updated_user = ($3) WHERE url = ($4)",
      values: [new Date(), new Date(), "SYSTEM_USER", data.url]
    };

    // logger.info("物件情報削除クエリ（更新クエリ）：", JSON.stringify(query));
    const result = await client.query(query);
    // logger.info("物件情報削除結果：", JSON.stringify(result));
    return result;
  };

  /**
   * 建物情報に紐づく物件を削除
   */
  deletePropDataRelatedBuilding = async function(buildingUrl) {
    const query = {
      text:
        "\
      insert into prop(url,branch ,building_url ,building_name ,floor_plan ,prop_price ,ex_area ,direction ,serve_period_info ,deleted_dt ,fetched_prop_info_flg ,created_dt ,created_user ,updated_dt ,updated_user) \
select                          \
	p.url,                      \
	p.branch + 1 as branch,     \
	p.building_url ,            \
	p.building_name ,           \
	p.floor_plan ,              \
	p.prop_price ,              \
	p.ex_area ,                 \
	p.direction ,               \
	p.serve_period_info ,       \
	current_timestamp ,         \
	p.fetched_prop_info_flg ,   \
	current_timestamp ,         \
	'SYSTEM_USER' ,             \
	current_timestamp ,         \
	'SYSTEM_USER'               \
from                            \
	prop p                      \
	inner join (select p2.url,MAX(p2.branch) as latest from prop p2 group by p2.url) as p2 \
	on p.url = p2.url and p.branch = p2.latest \
where \
	p.building_url = $1 \
	and p.deleted_dt is null \
      ",
      values: [buildingUrl]
    };

    // logger.info("物件情報削除クエリ（更新クエリ）：", JSON.stringify(query));
    const result = await client.query(query);
    // logger.info("物件情報削除結果：", JSON.stringify(result));
    return result;
  };

  /**
   * 建物URLに紐づく最新の物件情報を取得
   * @param {*} buildinUrl
   * @returns
   */
  getPropData = async function(buildinUrl) {
    // console.log("getPropData START", buildinUrl)
    const query = {
      // text: 'SELECT * FROM prop WHERE building_url = $1',
      text:
        "SELECT a.* FROM prop a \
      inner join (select url, MAX(branch) as latest from prop group by url) as b \
      on a.url = b.url and a.branch = b.latest \
      WHERE building_url = $1 and deleted_dt is null \
      ",
      values: [buildinUrl]
    };

    const result = await client.query(query);
    // console.log("物件情報取得：", result.rows);
    // console.log("getPropData END");
    // console.log("result.rows", result.rows);
    if (result.rows.length) {
      return result.rows.flatMap(row => {
        return {
          url: row.url,
          branch: row.branch,
          buildingUrl: row.building_url,
          buildingName: row.building_name,
          floorPlan: row.floor_plan,
          propPrice: row.prop_price,
          exArea: row.ex_area,
          direction: row.direction,
          servePeriodInfo: row.serve_period_info,
          deletedDt: row.deleted_dt,
          createdDt: row.created_dt,
          createdUser: row.created_user,
          updatedDt: row.updated_dt,
          updatedUser: row.updated_user
        };
      });
    } else {
      return []; // 空配列
    }
    // return result.rows;
  };

  findAllPropData = async function() {
    // logger.info("findAllPropData START");
    const query = {
      // text: 'SELECT p.url, p.branch FROM prop p LEFT JOIN prop_info pi ON p.url = pi.url AND p.branch = pi.branch WHERE pi.url is null or p.fetched_prop_info_flg = true',
      text:
        "select                                \
      p.*                            \
    from                                  \
      (                                 \
      select                            \
        a.*                           \
      from                              \
        prop a                        \
      inner join (                      \
        select                        \
          url,                      \
          MAX(branch) as latest     \
        from                          \
          prop                      \
        group by                      \
          url) as b                 \
          on                              \
        a.url = b.url                 \
        and a.branch = b.latest) p    \
    left join prop_info pi on            \
      p.url = pi.url                    \
      and p.branch = pi.branch          \
    where                                 \
      (pi.url is null                   \
        and p.deleted_dt is null)     \
      or p.fetched_prop_info_flg = true \
    ",
      values: []
    };
    const result = await client.query(query);

    if (result.rows.length) {
      return result.rows.flatMap(row => {
        return {
          url: row.url,
          branch: row.branch,
          buildingUrl: row.building_url,
          buildingName: row.building_name,
          floorPlan: row.floor_plan,
          propPrice: row.prop_price,
          exArea: row.ex_area,
          direction: row.direction,
          servePeriodInfo: row.serve_period_info,
          deletedDt: row.deleted_dt,
          createdDt: row.created_dt,
          createdUser: row.created_user,
          updatedDt: row.updated_dt,
          updatedUser: row.updated_user
        };
      });
    } else {
      return []; // 空配列
    }
    // logger.info("対象物件情報取得：", JSON.stringify(result.rows));
    // logger.info("findAllPropData END")
  };

  insertPropDetailsData = async function(data) {
    // console.log("data", data);
    const query = {
      text:
        "INSERT INTO prop_info_details( \
        url \
        ,branch \
        ,building_name \
        ,floor_cnt \
        ,item_name \
        ,item_value \
        ,created_dt \
        ,created_user \
        ,updated_dt \
        ,updated_user) \
      VALUES($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
      values: [
        data.url,
        data.branch,
        data.buildingName,
        data.floorCnt,
        data.itemName,
        data.itemValue,
        new Date(),
        "SYSTEM_USER",
        new Date(),
        "SYSTEM_USER"
      ]
    };

    /**
     *       const propInfoRet = {
        propName: await propInfoAnchorEl.getText(),
        propUrl: await propInfoAnchorEl.getAttribute("href"),
        buildingUrl: propInfo.propUrl,
        buildingName: propInfo.propName,
        floorPlan: floorPlan,
        propPrice: propPrice,
        exArea: exArea,
        direction: direction,
        servePeriodInfo: servePeriodInfo
      };
 
     */

    const result = await client.query(query);
    // logger.info("物件情報登録：", JSON.stringify(result));
    return result;
  };

  insertPropInfo = async function(data) {
    // logger.info("prop_info insert data: ", JSON.stringify(data));
    const query = {
      text:
        'INSERT INTO public.prop_info          \
      (url,                                 \
       branch,                              \
       prop_name,                           \
       contact_information,                 \
       other_restrictions,                  \
       other_overview_special_notes,        \
       other_area,                          \
       event_information,                   \
       reform,                              \
       real_estate_company_guide,           \
       transportation,                      \
       company_overview,                    \
       address,                             \
       price,                               \
       repair_reserve_fund,                 \
       repair_reserve_amount,               \
       transaction_conditions_expiry_date,  \
       direction,                           \
       inquiry_contact,                     \
       completion_date_built,               \
       floor_area,                          \
       handover_date,                       \
       information_provision_date,          \
       "location",                          \
       floor,                               \
       floor_structure,                     \
       from_contact_person,                 \
       land_right_form,                     \
       land_area,                           \
       construction,                        \
       highest_price_range,                 \
       structure_building_levels,           \
       next_update_date,                    \
       property_name,                       \
       zoning,                              \
       management_fee,                      \
       total_units,                         \
       various_expenses,                    \
       sales_schedule,                      \
       number_of_units_for_sale,            \
       floor_plan,                          \
       related_links,                       \
       parking_spaces,                      \
       created_dt,                          \
       created_user,                        \
       updated_dt,                          \
       updated_user)                        \
      VALUES(                               \
      $1 ,                                  \
      $2 ,                                  \
      $3 ,                                  \
      $4 ,                                  \
      $5 ,                                  \
      $6 ,                                  \
      $7 ,                                  \
      $8 ,                                  \
      $9 ,                                  \
      $10,                                  \
      $11,                                  \
      $12,                                  \
      $13,                                  \
      $14,                                  \
      $15,                                  \
      $16,                                  \
      $17,                                  \
      $18,                                  \
      $19,                                  \
      $20,                                  \
      $21,                                  \
      $22,                                  \
      $23,                                  \
      $24,                                  \
      $25,                                  \
      $26,                                  \
      $27,                                  \
      $28,                                  \
      $29,                                  \
      $30,                                  \
      $31,                                  \
      $32,                                  \
      $33,                                  \
      $34,                                  \
      $35,                                  \
      $36,                                  \
      $37,                                  \
      $38,                                  \
      $39,                                  \
      $40,                                  \
      $41,                                  \
      $42,                                  \
      $43,                                  \
      $44,                                  \
      $45,                                  \
      $46,                                  \
      $47                                   \
      ) on conflict (url,branch) \
      do update SET url =                                        $1  \
      ,branch                             = $2  \
      ,prop_name                          = $3  \
      ,contact_information                = $4  \
      ,other_restrictions                 = $5  \
      ,other_overview_special_notes       = $6  \
      ,other_area                         = $7  \
      ,event_information                  = $8  \
      ,reform                             = $9  \
      ,real_estate_company_guide          = $10 \
      ,transportation                     = $11 \
      ,company_overview                   = $12 \
      ,address                            = $13 \
      ,price                              = $14 \
      ,repair_reserve_fund                = $15 \
      ,repair_reserve_amount              = $16 \
      ,transaction_conditions_expiry_date = $17 \
      ,direction                          = $18 \
      ,inquiry_contact                    = $19 \
      ,completion_date_built              = $20 \
      ,floor_area                         = $21 \
      ,handover_date                      = $22 \
      ,information_provision_date         = $23 \
      ,"location"                         = $24 \
      ,floor                              = $25 \
      ,floor_structure                    = $26 \
      ,from_contact_person                = $27 \
      ,land_right_form                    = $28 \
      ,land_area                          = $29 \
      ,construction                       = $30 \
      ,highest_price_range                = $31 \
      ,structure_building_levels          = $32 \
      ,next_update_date                   = $33 \
      ,property_name                      = $34 \
      ,zoning                             = $35 \
      ,management_fee                     = $36 \
      ,total_units                        = $37 \
      ,various_expenses                   = $38 \
      ,sales_schedule                     = $39 \
      ,number_of_units_for_sale           = $40 \
      ,floor_plan                         = $41 \
      ,related_links                      = $42 \
      ,parking_spaces                     = $43 \
      ,created_dt                         = $44 \
      ,created_user                       = $45 \
      ,updated_dt                         = $46 \
      ,updated_user                       = $47;\
      ',
      values: [
        data.url,
        data.branch,
        data.buildingName,
        data.contactInformation,
        data.otherRestrictions,
        data.otherOverviewSpecialNotes,
        data.otherArea,
        data.eventInformation,
        data.reform,
        data.realEstateCompanyGuide,
        data.transportation,
        data.companyOverview,
        data.address,
        data.price,
        data.repairReserveFund,
        data.repairReserveAmount,
        data.transactionConditionsExpiryDate,
        data.direction,
        data.inquiryContact,
        data.completionDateBuilt,
        data.floorArea,
        data.handoverDate,
        data.informationProvisionDate,
        data.location,
        data.floor,
        data.floorStructure,
        data.fromContactPerson,
        data.landRightForm,
        data.landArea,
        data.construction,
        data.highestPriceRange,
        data.structureBuildingLevels,
        data.nextUpdateDate,
        data.propertyName,
        data.zoning,
        data.managementFee,
        data.totalUnits,
        data.variousExpenses,
        data.salesSchedule,
        data.numberOfUnitsForSale,
        data.floorPlan,
        data.relatedLinks,
        data.parkingSpaces,
        new Date(),
        "SYSTEM_USER",
        new Date(),
        "SYSTEM_USER"
      ]
    };
    const result = await client.query(query);
    // logger.info("物件情報登録：", JSON.stringify(result));
    return result;
  };

  deleteBuildingData = async function(data) {
    const query = {
      text:
        "UPDATE building SET deleted_dt = $1, updated_dt = $2, updated_user = $3 WHERE url = $4",
      values: [new Date(), new Date(), "SYSTEM_USER", data.url]
    };
    const result = await client.query(query);
    // logger.info("建物情報削除：", JSON.stringify(result));
    return result;
  };

  getAreaMst = async function(data) {
    const query = {
      text: "SELECT prefecture, area_name, url FROM area_mst",
      values: []
    };
    const result = await client.query(query);
    // logger.info("対象エリア", JSON.stringify(result.rows));
    return result.rows;
  };

  getAreaMstById = async function(id) {
    const query = {
      text: "SELECT prefecture, area_name, url FROM area_mst where seq = $1",
      values: [id]
    };
    const result = await client.query(query);
    // logger.info("対象エリア", JSON.stringify(result.rows));
    return result.rows;
  };

  findFavBuildingInfo = async function() {
    const query = {
      text: "SELECT b.* FROM building_fav as bf inner join building as b on bf.url = b.url",
      values: []
    };
    const result = await client.query(query);
    if (result.rows.length) {
      return result.rows.flatMap(row => {
        return {
          url: row.url,
          buildingName: row.building_name,
          nearestStation: row.nearest_station,
          yearOfConstruction: row.year_of_construction,
          deletedDt: row.deleted_dt,
          createdDt: row.created_dt,
          createdUser: row.created_user,
          updatedDt: row.updated_dt,
          updatedUser: row.updated_user
        };
      });
    } else {
      return []; // 空配列
    }
  };

  findUpdatedPropInfoList = async function(buildingInfo) {
    const query = {
      text:
        "with MULTI_ROW as (                                                                                                                                    \
        select * from prop p1 where exists(                                                                                                                    \
        select p.url,count(*) as cnt from prop p where p1.url = p.url group by p.url having count(*) > 1                                                       \
        ) order by url,branch                                                                                                                                  \
        ), ret as(                                                                                                                                             \
        select r.url,r.branch,r.prop_price,r.deleted_dt,                                                                                                       \
        (r.prop_price - lag( r.prop_price ) OVER( PARTITION BY url ORDER BY url,branch )) as price_diff,                                                       \
        (COALESCE(r.deleted_dt,'1900-01-01') = COALESCE(lag( r.deleted_dt ) OVER( PARTITION BY url ORDER BY url,branch ),'1900-01-01')) as is_change_deleted,  \
        (coalesce(r.url,'') = coalesce (lag( r.url ) OVER( PARTITION BY url ORDER BY url,branch ),'')) as is_same_url                                          \
        from MULTI_ROW r                                                                                                                                       \
        order by r.url, r.branch                                                                                                                               \
        )                                                                                                                                                      \
        select r.*,p.ex_area,p.floor_plan,p.building_url,p.created_dt from ret r inner join prop p on r.url = p.url and r.branch = p.branch                                                                       \
        where p.building_url = $1 and p.created_dt >= current_date                                                                                            \
        order by r.url, r.branch                                                                                                                               ",
      values: [buildingInfo.url]
    };
    const result = await client.query(query);
    logger.info("result", result);
    if (result.rows.length) {
      return result.rows.flatMap(row => {
        return {
          url: row.url,
          branch: row.branch,
          propPrice: row.prop_price,
          deletedDt: row.deleted_dt,
          priceDiff: row.price_diff,
          isChangeDeleted: row.is_change_deleted,
          isSameUrl: row.is_same_url,
          exArea: row.ex_area,
          floorPlan: row.floor_plan,
          createdDt: row.created_dt
        };
      });
    } else {
      return []; // 空配列
    }
  };
}

module.exports = { Pgdao };
