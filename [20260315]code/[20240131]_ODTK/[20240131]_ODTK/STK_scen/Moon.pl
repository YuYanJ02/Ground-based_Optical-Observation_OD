stk.v.11.0
WrittenBy    STK_v11.6.0

BEGIN Planet

    Name		 Moon

    BEGIN PathDescription

        CentralBody		 Moon
        UseCbEphemeris		 No

        BEGIN EphemerisData

            EphemerisSource		 JplDE

            JplIndex		 9

            JplSpiceId		 301

            ApplyTDTtoTDBCorrectionForDE		 Yes

            OrbitEpoch		  2.4515450000000000e+06
            OrbitMeanDist		  1.4959788645576575e+11
            OrbitEcc		  1.6710220000000785e-02
            OrbitInc		  2.3439340817688866e+01
            OrbitRAAN		  3.5999996261506129e+02
            OrbitPerLong		  4.6294718913083165e+02
            OrbitMeanLong		  8.2046434913083181e+02
            OrbitMeanDistDot		 -2.0478832306639289e-01
            OrbitEccDot		 -1.0414784394250515e-09
            OrbitIncDot		 -3.5013667765767386e-07
            OrbitRAANDot		  1.7494818152674394e-07
            OrbitPerLongDot		  9.1275248714007156e-06
            OrbitMeanLongDot		  9.8560911497638870e-01

        END EphemerisData

    END PathDescription

    BEGIN PhysicalData

        GM		  4.9028003055554004e+12
        Radius		  1.7374000000000000e+06
        Magnitude		  0.0000000000000000e+00
        ReferenceDistance		  0.0000000000000000e+00

    END PhysicalData

    BEGIN AutoRename

        AutoRename		 Yes

    END AutoRename

    BEGIN Extensions

        BEGIN ExternData
        END ExternData

        BEGIN ADFFileData
        END ADFFileData

        BEGIN AccessConstraints
            LineOfSight IncludeIntervals
        END AccessConstraints

        BEGIN Desc
        END Desc

        BEGIN Crdn
        END Crdn

        BEGIN Graphics

            BEGIN Attributes

                MarkerColor		 #ffffff
                LabelColor		 #ffffff
                LineColor		 #ffffff
                LineStyle		 0
                LineWidth		 1
                MarkerStyle		 2
                FontStyle		 0

            END Attributes

            BEGIN Graphics

                Show		 On
                Inherit		 Off
                ShowLabel		 Off
                ShowPlanetPoint		 Off
                ShowSubPlanetPoint		 Off
                ShowSubPlanetLabel		 Off
                ShowOrbit		 Off
                NumOrbitPoints		 360
                OrbitTime		  0.0000000000000000e+00
                OrbitDisplay		                OneOrbit		
                TransformTrajectory		 On

            END Graphics
        END Graphics

        BEGIN VO
        END VO

    END Extensions

END Planet

