-- (Query 1) 3. Los bebedores que les gusta al menos una bebida y que 
-- frecuentan al menos una fuente de soda. 
SELECT B.CI, B.NOMBRE
FROM GUSTA G, FRECUENTA F, BEBEDOR B
WHERE   G.ci = F.ci AND
        G.ci = B.ci;

-- (Query 3) 27. Las bebidas que se sirven en las fuentes de soda que son 
-- frecuentadas por las personas que les gusta la malta

SELECT v.CodBeb, b2.NombreBeb
FROM gusta g, frecuenta f, bebida b, bebedor be, vende v, bebida b2
WHERE   b.NombreBeb = 'Malta' AND
        b.CodBeb = g.CodBeb AND
        g.ci = be.ci AND
        be.ci = f.ci AND
        f.CodFS = v.CodFS AND
        v.CodBeb = b2.CodBeb

