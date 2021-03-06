SELECT
	DISTINCT
	SLIP.HIST_ID,
	SLIP.ACTION_TYPE,
	SLIP.ACTION_FUNC,
	SLIP.REC_DATETM,
	SLIP.REC_USER,
	SLIP.SALES_SLIP_ID,
	SLIP.STATUS,
	SLIP.SALES_ANNUAL,
	SLIP.SALES_MONTHLY,
	SLIP.SALES_YM,
	SLIP.RO_SLIP_ID,
	SLIP.BILL_ID,
	SLIP.SALES_BILL_ID,
	SLIP.BILL_DATE,
	SLIP.BILL_CUTOFF_GROUP,
	SLIP.PAYBACK_CYCLE_CATEGORY,
	SLIP.BILL_CUTOFF_DATE,
	SLIP.BILL_CUTOFF_PDATE,
	SLIP.SALES_DATE,
	SLIP.DELIVERY_DATE,
	SLIP.RECEPT_NO,
	SLIP.CUSTOMER_SLIP_NO,
	SLIP.SALES_CM_CATEGORY,
	SLIP.SALES_CUTOFF_DATE,
	SLIP.SALES_CUTOFF_PDATE,
	SLIP.USER_ID,
	SLIP.USER_NAME,
	SLIP.REMARKS,
	SLIP.PICKING_REMARKS,
	SLIP.DC_CATEGORY,
	SLIP.DC_NAME,
	SLIP.DC_TIMEZONE_CATEGORY,
	SLIP.DC_TIMEZONE,
	SLIP.CUSTOMER_CODE,
	SLIP.CUSTOMER_NAME,
	SLIP.CUSTOMER_REMARKS,
	SLIP.CUSTOMER_COMMENT_DATA,
	SLIP.CUSTOMER_OFFICE_NAME,
	SLIP.CUSTOMER_OFFICE_KANA,
	SLIP.CUSTOMER_ABBR,
	SLIP.CUSTOMER_DEPT_NAME,
	SLIP.CUSTOMER_ZIP_CODE,
	SLIP.CUSTOMER_ADDRESS_1,
	SLIP.CUSTOMER_ADDRESS_2,
	SLIP.CUSTOMER_PC_POST,
	SLIP.CUSTOMER_PC_NAME,
	SLIP.CUSTOMER_PC_KANA,
	SLIP.CUSTOMER_PC_PRE_CATEGORY,
	SLIP.CUSTOMER_PC_PRE,
	SLIP.CUSTOMER_TEL,
	SLIP.CUSTOMER_FAX,
	SLIP.CUSTOMER_EMAIL,
	SLIP.CUSTOMER_URL,
	SLIP.DELIVERY_CODE,
	SLIP.DELIVERY_NAME,
	SLIP.DELIVERY_KANA,
	SLIP.DELIVERY_OFFICE_NAME,
	SLIP.DELIVERY_OFFICE_KANA,
	SLIP.DELIVERY_DEPT_NAME,
	SLIP.DELIVERY_ZIP_CODE,
	SLIP.DELIVERY_ADDRESS_1,
	SLIP.DELIVERY_ADDRESS_2,
	SLIP.DELIVERY_PC_NAME,
	SLIP.DELIVERY_PC_KANA,
	SLIP.DELIVERY_PC_PRE_CATEGORY,
	SLIP.DELIVERY_PC_PRE,
	SLIP.DELIVERY_TEL,
	SLIP.DELIVERY_FAX,
	SLIP.DELIVERY_EMAIL,
	SLIP.DELIVERY_URL,
	SLIP.BA_CODE,
	SLIP.BA_NAME,
	SLIP.BA_KANA,
	SLIP.BA_OFFICE_NAME,
	SLIP.BA_OFFICE_KANA,
	SLIP.BA_DEPT_NAME,
	SLIP.BA_ZIP_CODE,
	SLIP.BA_ADDRESS_1,
	SLIP.BA_ADDRESS_2,
	SLIP.BA_PC_NAME,
	SLIP.BA_PC_KANA,
	SLIP.BA_PC_PRE_CATEGORY,
	SLIP.BA_PC_PRE,
	SLIP.BA_TEL,
	SLIP.BA_FAX,
	SLIP.BA_EMAIL,
	SLIP.BA_URL,
	SLIP.TAX_SHIFT_CATEGORY,
	SLIP.TAX_FRACT_CATEGORY,
	SLIP.PRICE_FRACT_CATEGORY,
	SLIP.CTAX_PRICE_TOTAL,
	SLIP.PRICE_TOTAL,
	SLIP.GM_TOTAL,
	SLIP.COD_SC,
	SLIP.BILL_PRINT_COUNT,
	SLIP.DELIVERY_PRINT_COUNT,
	SLIP.TEMP_DELIVERY_PRINT_COUNT,
	SLIP.SHIPPING_PRINT_COUNT,
	SLIP.SI_PRINT_COUNT,
	SLIP.ESTIMATE_PRINT_COUNT,
	SLIP.DELBOR_PRINT_COUNT,
	SLIP.PO_PRINT_COUNT,
	SLIP.ADLABEL,
	SLIP.DISCLAIMER,
	SLIP.CRE_FUNC,
	SLIP.CRE_DATETM,
	SLIP.CRE_USER,
	SLIP.UPD_FUNC,
	SLIP.UPD_DATETM,
	SLIP.UPD_USER
FROM
	SALES_SLIP_TRN_HIST_/*$domainId*/ SLIP
	INNER JOIN SALES_LINE_TRN_HIST_/*$domainId*/ LINE ON SLIP.SALES_SLIP_ID = LINE.SALES_SLIP_ID
/*BEGIN*/
WHERE
	/*IF recDateFrom != null */
	AND CAST(SLIP.REC_DATETM AS DATE) >= CAST(/*recDateFrom*/'2010/01/01' AS DATE)
	/*END*/
	/*IF recDateTo != null */
	AND CAST(SLIP.REC_DATETM AS DATE) <= CAST(/*recDateTo*/'2010/01/01' AS DATE)
	/*END*/
	/*IF customerCodeFrom != null */
	AND SLIP.CUSTOMER_CODE >= /*customerCodeFrom*/'S'
	/*END*/
	/*IF customerCodeTo != null */
	AND SLIP.CUSTOMER_CODE <= /*customerCodeTo*/'S'
	/*END*/
	/*IF productCodeFrom != null */
	AND LINE.PRODUCT_CODE >= /*productCodeFrom*/'S'
	/*END*/
	/*IF productCodeTo != null */
	AND LINE.PRODUCT_CODE <= /*productCodeTo*/'S'
	/*END*/
/*END*/
ORDER BY SLIP.HIST_ID
