/*
TEAM NAME: Drowsy Duo
TEAM MEMBERS' NAME: Adriean Lemoine, Chris Smith


Instructions
- Descriptions must reflect a business operation's need
- One query for each item (Q..) is enough. E.g.,�for�QD1: CREATE TABLE, write a DDL query to create one of your project's tables. Similar for the others.
- You must use the exact format
- Project a few attributes only unless otherwise said
- Do not change the order of the queries
*/

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DDL QUERIES   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--QD1: CREATE TABLE ...
/*
Instructions:
- Must define PK
- Must define a default value as needed
*/

--QD2: ALTER TABLE ...
----Description: .....................



--QD3: ADD "CHECK" CONSTRAINT:
----Description: .....................


--QD4: ADD FK CONSTRAINT(S) TO THE TABLE
/*
Instructions:
- Must define action
- At least one of the FKs must utilize the default value
*/
----Description: .....................


--QD5: Create TRIGGER ...
----Description: .....................



-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ DML QUERIES   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


--QM1.1: A TEST QUERY FOR THE TRIGGER CREATED in QD5:
----Description: .....................


--QM1.2: A TEST QUERY FOR THE "CHECK" CONSTRAINT DEFINED in QD3:
----Description: .....................


--QM1.3: A TEST QUERY FOR THE FK CONSTRAINT DEFINED in QD4:
----Description: .....................


--QM2: INSERT DATA:
----Description: .....................


--QM3: UPDATE DATA:
----Description: .....................


--QM4: DELETE DATA:
----Description: .....................



--QM5: QUERY DATA WITH WHERE CLAUSE:
----Description: .....................

SELECT ....
FROM ...
WHERE (.....) OR 
      ( (......) AND
        (......) 
      )


--QM6.1: QUERY DATA WITH 'SUB-QUERY IN WHERE CLAUSE':
----Description: .....................

SELECT ....
FROM ...
WHERE ..... (SELECT .... FROM ..... WHERE .....)

--QM6.2: QUERY DATA WITH SUB-QUERY IN FROM CLAUSE:
----Description: .....................

SELECT ....
FROM (SELECT .... FROM ..... WHERE ......) AS <TABLE-NAME> ....
WHERE ...... <TABLE-NAME> ......



--QM6.3: QUERY DATA WITH 'SUB-QUERY IN SELECT CLAUSE':
----Description: .....................

SELECT .... (SELECT .... FROM ... TBI ... WHERE .... TBO.** = TBI.** ... )
FROM ...TBO ...
WHERE ......


--QM7: QUERY DATA WITH EXCEPT:
----Description: .....................


--QM8.1: QUERY DATA WITH ANY/SOME:
----Description: .....................


--QM8.2: QUERY DATA WITH ALL in front of a sub-query:
----Description: .....................


--QM9.1: INNER-JOIN-QUERY WITH WHERE CLAUSE:
----Description: .....................


--QM9.2: LEFT-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES during the outer join:
----Description: .....................


--QM9.3: RIGHT-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES during the outer join:
----Description: .....................


--QM9.4: FULL-OUTER-JOIN-QUERY WITH WHERE CLAUSE:
----Instruction: The query must return NULL DUE TO MISMATCHING TUPLES from LEFT and RIGHT tables due to the outer join:
----Description: .....................


--QM10.1: AGGREGATION-JOIN-QUERY WITH GROUP BY & HAVING:
----Description: .....................

SELECT ...
FROM .... JOIN ....
WHERE ...
GROUP BY ....
HAVING .....

--QM10.2: AGGREGATION-JOIN-QUERY WITH SUB-QUERY:
----Description: .....................



--QM11: WITH-QUERY:
----Description: .....................




