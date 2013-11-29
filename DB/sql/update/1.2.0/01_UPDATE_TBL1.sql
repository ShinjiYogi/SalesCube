ALTER TABLE MINE_MST_XXXXX ADD COMPANY_CEO_TITLE VARCHAR(20);
ALTER TABLE MINE_MST_HIST_XXXXX ADD COMPANY_CEO_TITLE VARCHAR(20);

UPDATE MINE_MST_XXXXX SET COMPANY_CEO_TITLE = '代表取締役社長';
commit;


----
-- MINE TRIGGER
----

DROP TRIGGER IF EXISTS MINE_MST_XXXXX_INS;
DROP TRIGGER IF EXISTS MINE_MST_XXXXX_UPD;
DROP TRIGGER IF EXISTS MINE_MST_XXXXX_DEL;

DELIMITER //
SELECT 'MINE_MST_XXXXX'//
CREATE TRIGGER MINE_MST_XXXXX_INS AFTER INSERT ON MINE_MST_XXXXX FOR EACH ROW BEGIN
DECLARE histId INT UNSIGNED DEFAULT 0;
IF NEW.CRE_USER IS NULL OR NEW.CRE_USER <> 'NOLOG' THEN
SET histId = GET_NEXT_VAL_HIST('MINE_MST');

INSERT INTO MINE_MST_HIST_XXXXX(HIST_ID,ACTION_TYPE,ACTION_FUNC,REC_DATETM,REC_USER,COMPANY_NAME,COMPANY_KANA,COMPANY_ABBR,COMPANY_CEO_NAME,COMPANY_CEO_TITLE,COMPANY_ZIP_CODE,COMPANY_ADDRESS_1,COMPANY_ADDRESS_2,COMPANY_TEL,COMPANY_FAX,COMPANY_EMAIL,COMPANY_WEB_SITE,CUTOFF_GROUP,CLOSE_MONTH,STOCK_HOLD_DAYS,STOCK_HOLD_TERM_CALC_CATEGORY,MIN_PO_LOT_CALC_DAYS,MIN_PO_LOT_NUM,MIN_PO_NUM,MAX_PO_NUM_CALC_DAYS,TAX_CATEGORY,PRICE_FRACT_CATEGORY,PRODUCT_FRACT_CATEGORY,UNIT_PRICE_DEC_ALIGNMENT,NUM_DEC_ALIGNMENT,PASSWORD_VALID_DAYS,LOGO_IMG_PATH,REMARKS,TAX_SHIFT_CATEGORY,STATS_DEC_ALIGNMENT,FIND_TERM_INIT_DAYS,TAX_FRACT_CATEGORY,DELIVERY_CUST_ID,DEFICIENCY_RATE,MAX_ENTRUST_PO_TIMELAG,SAFETY_COEFFICIENT,CRE_FUNC,CRE_DATETM,CRE_USER,UPD_FUNC,UPD_DATETM,UPD_USER,DEL_FUNC,DEL_DATETM,DEL_USER) VALUES ( histId, 'INSERT', NEW.CRE_FUNC, now(), NEW.CRE_USER,NEW.COMPANY_NAME,NEW.COMPANY_KANA,NEW.COMPANY_ABBR,NEW.COMPANY_CEO_NAME,NEW.COMPANY_CEO_TITLE,NEW.COMPANY_ZIP_CODE,NEW.COMPANY_ADDRESS_1,NEW.COMPANY_ADDRESS_2,NEW.COMPANY_TEL,NEW.COMPANY_FAX,NEW.COMPANY_EMAIL,NEW.COMPANY_WEB_SITE,NEW.CUTOFF_GROUP,NEW.CLOSE_MONTH,NEW.STOCK_HOLD_DAYS,NEW.STOCK_HOLD_TERM_CALC_CATEGORY,NEW.MIN_PO_LOT_CALC_DAYS,NEW.MIN_PO_LOT_NUM,NEW.MIN_PO_NUM,NEW.MAX_PO_NUM_CALC_DAYS,NEW.TAX_CATEGORY,NEW.PRICE_FRACT_CATEGORY,NEW.PRODUCT_FRACT_CATEGORY,NEW.UNIT_PRICE_DEC_ALIGNMENT,NEW.NUM_DEC_ALIGNMENT,NEW.PASSWORD_VALID_DAYS,NEW.LOGO_IMG_PATH,NEW.REMARKS,NEW.TAX_SHIFT_CATEGORY,NEW.STATS_DEC_ALIGNMENT,NEW.FIND_TERM_INIT_DAYS,NEW.TAX_FRACT_CATEGORY,NEW.DELIVERY_CUST_ID,NEW.DEFICIENCY_RATE,NEW.MAX_ENTRUST_PO_TIMELAG,NEW.SAFETY_COEFFICIENT,NEW.CRE_FUNC,NEW.CRE_DATETM,NEW.CRE_USER,NEW.UPD_FUNC,NEW.UPD_DATETM,NEW.UPD_USER,NEW.DEL_FUNC,NEW.DEL_DATETM,NEW.DEL_USER);
END IF;

END//

CREATE TRIGGER MINE_MST_XXXXX_UPD AFTER UPDATE ON MINE_MST_XXXXX FOR EACH ROW BEGIN
DECLARE histId INT UNSIGNED DEFAULT 0;
IF NEW.UPD_USER IS NULL OR NEW.UPD_USER <> 'NOLOG' THEN
SET histId = GET_NEXT_VAL_HIST('MINE_MST');

INSERT INTO MINE_MST_HIST_XXXXX(HIST_ID,ACTION_TYPE,ACTION_FUNC,REC_DATETM,REC_USER,COMPANY_NAME,COMPANY_KANA,COMPANY_ABBR,COMPANY_CEO_NAME,COMPANY_CEO_TITLE,COMPANY_ZIP_CODE,COMPANY_ADDRESS_1,COMPANY_ADDRESS_2,COMPANY_TEL,COMPANY_FAX,COMPANY_EMAIL,COMPANY_WEB_SITE,CUTOFF_GROUP,CLOSE_MONTH,STOCK_HOLD_DAYS,STOCK_HOLD_TERM_CALC_CATEGORY,MIN_PO_LOT_CALC_DAYS,MIN_PO_LOT_NUM,MIN_PO_NUM,MAX_PO_NUM_CALC_DAYS,TAX_CATEGORY,PRICE_FRACT_CATEGORY,PRODUCT_FRACT_CATEGORY,UNIT_PRICE_DEC_ALIGNMENT,NUM_DEC_ALIGNMENT,PASSWORD_VALID_DAYS,LOGO_IMG_PATH,REMARKS,TAX_SHIFT_CATEGORY,STATS_DEC_ALIGNMENT,FIND_TERM_INIT_DAYS,TAX_FRACT_CATEGORY,DELIVERY_CUST_ID,DEFICIENCY_RATE,MAX_ENTRUST_PO_TIMELAG,SAFETY_COEFFICIENT,CRE_FUNC,CRE_DATETM,CRE_USER,UPD_FUNC,UPD_DATETM,UPD_USER,DEL_FUNC,DEL_DATETM,DEL_USER) VALUES ( histId, 'UPDATE', NEW.UPD_FUNC, now(), NEW.UPD_USER,NEW.COMPANY_NAME,NEW.COMPANY_KANA,NEW.COMPANY_ABBR,NEW.COMPANY_CEO_NAME,NEW.COMPANY_CEO_TITLE,NEW.COMPANY_ZIP_CODE,NEW.COMPANY_ADDRESS_1,NEW.COMPANY_ADDRESS_2,NEW.COMPANY_TEL,NEW.COMPANY_FAX,NEW.COMPANY_EMAIL,NEW.COMPANY_WEB_SITE,NEW.CUTOFF_GROUP,NEW.CLOSE_MONTH,NEW.STOCK_HOLD_DAYS,NEW.STOCK_HOLD_TERM_CALC_CATEGORY,NEW.MIN_PO_LOT_CALC_DAYS,NEW.MIN_PO_LOT_NUM,NEW.MIN_PO_NUM,NEW.MAX_PO_NUM_CALC_DAYS,NEW.TAX_CATEGORY,NEW.PRICE_FRACT_CATEGORY,NEW.PRODUCT_FRACT_CATEGORY,NEW.UNIT_PRICE_DEC_ALIGNMENT,NEW.NUM_DEC_ALIGNMENT,NEW.PASSWORD_VALID_DAYS,NEW.LOGO_IMG_PATH,NEW.REMARKS,NEW.TAX_SHIFT_CATEGORY,NEW.STATS_DEC_ALIGNMENT,NEW.FIND_TERM_INIT_DAYS,NEW.TAX_FRACT_CATEGORY,NEW.DELIVERY_CUST_ID,NEW.DEFICIENCY_RATE,NEW.MAX_ENTRUST_PO_TIMELAG,NEW.SAFETY_COEFFICIENT,NEW.CRE_FUNC,NEW.CRE_DATETM,NEW.CRE_USER,NEW.UPD_FUNC,NEW.UPD_DATETM,NEW.UPD_USER,NEW.DEL_FUNC,NEW.DEL_DATETM,NEW.DEL_USER);
END IF;

END//

CREATE TRIGGER MINE_MST_XXXXX_DEL AFTER DELETE ON MINE_MST_XXXXX FOR EACH ROW BEGIN
DECLARE histId INT UNSIGNED DEFAULT 0;
IF OLD.DEL_USER IS NULL OR OLD.DEL_USER <> 'NOLOG' THEN
SET histId = GET_NEXT_VAL_HIST('MINE_MST');

INSERT INTO MINE_MST_HIST_XXXXX(HIST_ID,ACTION_TYPE,ACTION_FUNC,REC_DATETM,REC_USER,COMPANY_NAME,COMPANY_KANA,COMPANY_ABBR,COMPANY_CEO_NAME,COMPANY_CEO_TITLE,COMPANY_ZIP_CODE,COMPANY_ADDRESS_1,COMPANY_ADDRESS_2,COMPANY_TEL,COMPANY_FAX,COMPANY_EMAIL,COMPANY_WEB_SITE,CUTOFF_GROUP,CLOSE_MONTH,STOCK_HOLD_DAYS,STOCK_HOLD_TERM_CALC_CATEGORY,MIN_PO_LOT_CALC_DAYS,MIN_PO_LOT_NUM,MIN_PO_NUM,MAX_PO_NUM_CALC_DAYS,TAX_CATEGORY,PRICE_FRACT_CATEGORY,PRODUCT_FRACT_CATEGORY,UNIT_PRICE_DEC_ALIGNMENT,NUM_DEC_ALIGNMENT,PASSWORD_VALID_DAYS,LOGO_IMG_PATH,REMARKS,TAX_SHIFT_CATEGORY,STATS_DEC_ALIGNMENT,FIND_TERM_INIT_DAYS,TAX_FRACT_CATEGORY,DELIVERY_CUST_ID,DEFICIENCY_RATE,MAX_ENTRUST_PO_TIMELAG,SAFETY_COEFFICIENT,CRE_FUNC,CRE_DATETM,CRE_USER,UPD_FUNC,UPD_DATETM,UPD_USER,DEL_FUNC,DEL_DATETM,DEL_USER) VALUES ( histId, 'DELETE', OLD.DEL_FUNC, now(), OLD.DEL_USER,OLD.COMPANY_NAME,OLD.COMPANY_KANA,OLD.COMPANY_ABBR,OLD.COMPANY_CEO_NAME,OLD.COMPANY_CEO_TITLE,OLD.COMPANY_ZIP_CODE,OLD.COMPANY_ADDRESS_1,OLD.COMPANY_ADDRESS_2,OLD.COMPANY_TEL,OLD.COMPANY_FAX,OLD.COMPANY_EMAIL,OLD.COMPANY_WEB_SITE,OLD.CUTOFF_GROUP,OLD.CLOSE_MONTH,OLD.STOCK_HOLD_DAYS,OLD.STOCK_HOLD_TERM_CALC_CATEGORY,OLD.MIN_PO_LOT_CALC_DAYS,OLD.MIN_PO_LOT_NUM,OLD.MIN_PO_NUM,OLD.MAX_PO_NUM_CALC_DAYS,OLD.TAX_CATEGORY,OLD.PRICE_FRACT_CATEGORY,OLD.PRODUCT_FRACT_CATEGORY,OLD.UNIT_PRICE_DEC_ALIGNMENT,OLD.NUM_DEC_ALIGNMENT,OLD.PASSWORD_VALID_DAYS,OLD.LOGO_IMG_PATH,OLD.REMARKS,OLD.TAX_SHIFT_CATEGORY,OLD.STATS_DEC_ALIGNMENT,OLD.FIND_TERM_INIT_DAYS,OLD.TAX_FRACT_CATEGORY,OLD.DELIVERY_CUST_ID,OLD.DEFICIENCY_RATE,OLD.MAX_ENTRUST_PO_TIMELAG,OLD.SAFETY_COEFFICIENT,OLD.CRE_FUNC,OLD.CRE_DATETM,OLD.CRE_USER,OLD.UPD_FUNC,OLD.UPD_DATETM,OLD.UPD_USER,OLD.DEL_FUNC,OLD.DEL_DATETM,OLD.DEL_USER);
END IF;

END//

DELIMITER ;

