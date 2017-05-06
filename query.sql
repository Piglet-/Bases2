-- (Query 1) 3. Los bebedores que les gusta al menos una bebida y que 
-- frecuentan al menos una fuente de soda. 
SELECT B.CI, B.NOMBRE
FROM GUSTA G, FRECUENTA F, BEBEDOR B
WHERE   G.ci = F.ci AND
        G.ci = B.ci;

-- (Query 2) 14. Los bebedores que no frecuentan las fuentes de soda que 
-- sirven al menos una de las bebidas que no les gustan.


-- (Query 3) 27. Las bebidas que se sirven en las fuentes de soda que son 
-- frecuentadas por las personas que les gusta la malta
SELECT v.CodBeb, b2.NombreBeb
FROM gusta g, frecuenta f, bebida b, bebedor be, vende v, bebida b2
WHERE   b.NombreBeb = 'Malta' AND
        b.CodBeb = g.CodBeb AND
        g.ci = be.ci AND
        be.ci = f.ci AND
        f.CodFS = v.CodFS AND
        v.CodBeb = b2.CodBeb;

-- (Query 4) 36. La bebida más cara en las fuentes de soda que no venden 
-- al menos una de las bebidas que le gusta a Luis Pérez.


-- (Query 5) 38. Las fuentes de soda que venden las bebidas que 
-- no le gustan a Luis Pérez y que le gustan a José Pérez.
    SELECT fs.CodFS, fs.NombreFS
    FROM FUENTE_SODA fs, VENDE v, BEBEDOR j, GUSTA g
    WHERE   fs.CodFS = v.CodFS AND
            v.CodBeb NOT IN 
                (SELECT g.CodBeb --Bebidas que le gustan a Luis Perez
                 FROM BEBEDOR l, GUSTA g
                 WHERE   l.Nombre = 'Luis Pérez' AND
                         l.CI = g.CI) AND
            j.Nombre = 'José Pérez' AND
            j.CI = g.CI AND
            g.CodBeb = v.CodBeb;