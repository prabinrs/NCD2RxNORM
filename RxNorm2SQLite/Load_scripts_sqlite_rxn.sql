.mode csv
.separator '|'

.import 'RXNATOMARCHIVE.RRF' RXNATOMARCHIVE

-- If you need to modify or manipulate the data after importing, you can use SQL commands like:
-- UPDATE RXNATOMARCHIVE SET column1 = value1, column2 = value2 WHERE condition;
-- or
-- INSERT INTO RXNATOMARCHIVE (column1, column2, ...) VALUES (value1, value2, ...);


.import 'RXNCONSO.RRF' RXNCONSO

.import 'RXNREL.RRF' RXNREL

.import 'RXNSAB.RRF' RXNSAB

.import 'RXNSAT.RRF' RXNSAT

.import 'RXNSTY.RRF' RXNSTY

.import 'RXNDOC.RRF' RXNDOC

.import 'RXNCUICHANGES.RRF' RXNCUICHANGES

.import 'RXNCUI.RRF' RXNCUI