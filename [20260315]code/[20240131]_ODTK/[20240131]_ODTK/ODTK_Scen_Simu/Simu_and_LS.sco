<?xml version = "1.0" standalone = "yes"?>
<VAR name = "ODTK">
    <PROP name = "Version">
        <STRING>&quot;7.0&quot;</STRING>
    </PROP>
    <SCOPE>
        <VAR name = "Simu_and_LS">
            <SCOPE Class = "Scenario">
                <PROP name = "version">
                    <STRING>&quot;7.2&quot;</STRING>
                </PROP>
                <VAR name = "Description">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "OverrideRunName">
                    <BOOL>false</BOOL>
                </VAR>
                <VAR name = "NewRunFilename">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "DefaultTimes">
                    <SCOPE Class = "DefaultTimes">
                        <VAR name = "Processes">
                            <SCOPE Class = "Processes">
                                <VAR name = "StartMode">
                                    <STRING>&quot;EarliestSatEpoch&quot;</STRING>
                                </VAR>
                                <VAR name = "StartTime">
                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                </VAR>
                                <VAR name = "StopMode">
                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                </VAR>
                                <VAR name = "StopTime">
                                    <DATE>2 Jul 2020 12:00:37.000</DATE>
                                </VAR>
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>24</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Intervals">
                            <SCOPE Class = "Intervals">
                                <VAR name = "TimeSpan">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                        <REAL>4</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Measurements">
                    <SCOPE Class = "TrackingFiles">
                        <VAR name = "Files">
                            <LIST />
                        </VAR>
                        <VAR name = "RoundTripRepresentation">
                            <STRING>&quot;OneWay&quot;</STRING>
                        </VAR>
                        <VAR name = "LookAheadBufferSize">
                            <INT>100</INT>
                        </VAR>
                        <VAR name = "EmbeddedWNSigmas">
                            <SCOPE>
                                <VAR name = "Use">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "OnInputError">
                                    <STRING>&quot;UseDefaultWNSigma&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "ViewAndSave">
                            <SCOPE Class = "ViewAndSave">
                                <VAR name = "CustomDataEditing">
                                    <SCOPE Class = "CustomDataEditing">
                                        <VAR name = "Enabled">
                                            <BOOL>false</BOOL>
                                        </VAR>
                                        <VAR name = "Schedule">
                                            <LIST />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "StateControls">
                    <SCOPE Class = "StateControls">
                        <VAR name = "MinApogeeAltForSRP">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>400</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "MaxPerigeeAltForDrag">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>1000</REAL>
                            </QUANTITY>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "OrbitClassifications">
                    <SCOPE Class = "OrbitClassifications">
                        <VAR name = "LEO">
                            <SCOPE Class = "LEOOrbitClass">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>6441.91837</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "MEO">
                            <SCOPE Class = "MEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GPS">
                            <SCOPE Class = "GPS">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>25512.548</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "GEO">
                            <SCOPE Class = "GEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>41457.8905</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33159999999</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "SGEO">
                            <SCOPE Class = "GSGEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>43371.33159999999</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.2</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HEO">
                            <SCOPE Class = "HEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.73</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "LOeHEO">
                            <SCOPE Class = "LOeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.2</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>0.6899999999999999</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "HIeHEO">
                            <SCOPE Class = "HIeHEO">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>8291.578100000001</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>0.73</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Para">
                            <SCOPE Class = "Para">
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>1</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Hyper">
                            <SCOPE Class = "Hyper">
                                <VAR name = "SemiMajorAxisMin">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>-63781370000000</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "SemiMajorAxisMax">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "EccentricityMin">
                                    <REAL>1</REAL>
                                </VAR>
                                <VAR name = "EccentricityMax">
                                    <REAL>10000000000</REAL>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "EarthDefinition">
                    <SCOPE>
                        <VAR name = "LeapSecondFilename">
                            <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\LeapSecond.dat&quot;</STRING>
                        </VAR>
                        <VAR name = "GravityModel">
                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Earth\EGM2008.grv&quot;</STRING>
                        </VAR>
                        <VAR name = "OverrideGravityProcessNoise">
                            <BOOL>false</BOOL>
                        </VAR>
                        <VAR name = "NutationMethod">
                            <STRING>&quot;IERS1996&quot;</STRING>
                        </VAR>
                        <VAR name = "EclipsingAtmosAlt">
                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                <REAL>23.862995940238</REAL>
                            </QUANTITY>
                        </VAR>
                        <VAR name = "GroundReflectionModel">
                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Earth\SimpleReflectionModel.txt&quot;</STRING>
                        </VAR>
                        <VAR name = "EOPData">
                            <SCOPE>
                                <VAR name = "Filename">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\EOP-All-v1.1.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "FluxData">
                            <SCOPE>
                                <VAR name = "InputMethod">
                                    <STRING>&quot;Read From File&quot;</STRING>
                                </VAR>
                                <VAR name = "InputFluxFile">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\SpaceWeather-v1.2.txt&quot;</STRING>
                                </VAR>
                                <VAR name = "F10">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "F10bar">
                                    <REAL>150</REAL>
                                </VAR>
                                <VAR name = "KpUpdate">
                                    <STRING>&quot;3-Hourly&quot;</STRING>
                                </VAR>
                                <VAR name = "KpSubSamplingRatio">
                                    <INT>1</INT>
                                </VAR>
                                <VAR name = "UseApOrKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "ApVersusKp">
                                    <STRING>&quot;Kp&quot;</STRING>
                                </VAR>
                                <VAR name = "Ap">
                                    <REAL>8.113124895222496</REAL>
                                </VAR>
                                <VAR name = "Kp">
                                    <REAL>2.209975772807119</REAL>
                                </VAR>
                                <VAR name = "ValidateFileSpan">
                                    <BOOL>true</BOOL>
                                </VAR>
                                <VAR name = "WarnThreshold">
                                    <QUANTITY Dimension = "TimeUnit" Unit = "day">
                                        <REAL>1</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "JacchiaBowmanIndices">
                                    <SCOPE>
                                        <VAR name = "InputJBSolarIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "InputJBGeoMagIndicesFile">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "M10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "M10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "S10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "Y10bar">
                                            <REAL>150</REAL>
                                        </VAR>
                                        <VAR name = "DstDTc">
                                            <REAL>0</REAL>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Ionosphere">
                            <SCOPE>
                                <VAR name = "IRI20xxDataDirectory">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\IRI2016ModelData\&quot;</STRING>
                                </VAR>
                                <VAR name = "UseAlternateApData">
                                    <BOOL>false</BOOL>
                                </VAR>
                                <VAR name = "AlternateApDataFilename">
                                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\DynamicEarthData\SpaceWeather-All-v1.2.txt&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "DSNMediaCalibrationData">
                            <SCOPE Class = "DSNMediaCalibrationFile">
                                <VAR name = "Files">
                                    <LIST />
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SuppressICRF">
                    <BOOL>false</BOOL>
                </VAR>
                <VAR name = "CentralBodyList">
                    <LIST>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Ceres&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Ceres\CERES18D.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Mars&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Mars\GMM3.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Mercury&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Mercury\GGMES100v08.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Moon&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Moon\GL0660B.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Moon\SimpleReflectionModel.txt&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Sun&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Sun\ZonalsToJ4.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "CentralBodyList">
                            <SCOPE>
                                <VAR name = "Name">
                                    <STRING>&quot;Venus&quot;</STRING>
                                </VAR>
                                <VAR name = "GravityModel">
                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\CentralBodies\Venus\MGNP180U.grv&quot;</STRING>
                                </VAR>
                                <VAR name = "EclipsingAtmosAlt">
                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                        <REAL>0</REAL>
                                    </QUANTITY>
                                </VAR>
                                <VAR name = "GroundReflectionModel">
                                    <STRING>&quot;&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </LIST>
                </VAR>
                <VAR name = "PlanetaryEphemeris">
                    <SCOPE Class = "PlanetaryEphemeris">
                        <VAR name = "Filename">
                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\STKData\PlanetEphem\lendian\plneph.430&quot;</STRING>
                        </VAR>
                        <VAR name = "UseTDB">
                            <BOOL>true</BOOL>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "SPICE">
                    <SCOPE Class = "SPICE" />
                </VAR>
                <VAR name = "SatEphemeris">
                    <SCOPE Class = "SatEphemeris">
                        <VAR name = "CoordFrame">
                            <LIST>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Ceres&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;ICRF&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Mars&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Mercury&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Moon&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Sun&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;ICRF&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "SatEphemerisCoordFrame">
                                    <SCOPE>
                                        <VAR name = "CBName">
                                            <STRING>&quot;Venus&quot;</STRING>
                                        </VAR>
                                        <VAR name = "CoordFrame">
                                            <STRING>&quot;Inertial&quot;</STRING>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </LIST>
                        </VAR>
                        <VAR name = "CCSDS">
                            <SCOPE Class = "OEM">
                                <VAR name = "Originator">
                                    <STRING>&quot;ODTK&quot;</STRING>
                                </VAR>
                                <VAR name = "DateFormat">
                                    <STRING>&quot;YMD&quot;</STRING>
                                </VAR>
                                <VAR name = "TimePrecision">
                                    <INT>6</INT>
                                </VAR>
                                <VAR name = "EphemerisFormat">
                                    <STRING>&quot;SciNotation&quot;</STRING>
                                </VAR>
                                <VAR name = "OutputVersion">
                                    <STRING>&quot;2.0&quot;</STRING>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Units">
                    <SCOPE Class = "Units">
                        <VAR name = "DateFormat">
                            <STRING>&quot;UTCG&quot;</STRING>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "QuasarDatabaseFilename">
                    <STRING>&quot;C:\ProgramData\AGI\ODTK 7\Databases\Quasars\DSN_RadioSourceCatalog_107E.txt&quot;</STRING>
                </VAR>
                <VAR name = "FacilityAssociationsFile">
                    <STRING>&quot;&quot;</STRING>
                </VAR>
                <VAR name = "Wizard">
                    <SCOPE Class = "WizardClass">
                        <VAR name = "StartTime">
                            <DATE>1 Jul 2020 12:00:37.000</DATE>
                        </VAR>
                        <VAR name = "StopTime">
                            <DATE>2 Jul 2020 12:00:37.000</DATE>
                        </VAR>
                    </SCOPE>
                </VAR>
                <VAR name = "Children">
                    <SCOPE>
                        <VAR name = "Satellite">
                            <SCOPE>
                                <VAR name = "DROA">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.2&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Cartesian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>6678.137</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>6.789530297717651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.686414173013651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>1001</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>21</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>4902794000000</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Sun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>1.32712438e+20</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;CIRA 1972&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;double click to edit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.2</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.044</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>180</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.02</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with perfect absorption&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;Apparent&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;double click to edit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>86400</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1440</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;F:\ODTK\Ephemeris\DROA.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>50</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.06</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.04</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.02</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;DROA&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "DROB">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.2&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Cartesian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>6678.137</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>6.789530297717651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.686414173013651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>1002</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>21</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>4902794000000</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Sun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>1.32712438e+20</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;CIRA 1972&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;double click to edit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.2</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.044</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>180</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.02</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with perfect absorption&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;Apparent&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;double click to edit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>86400</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1440</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;F:\ODTK\Ephemeris\DROB.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>50</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.06</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.04</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.02</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;DROB&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                                <VAR name = "DROL">
                                    <SCOPE Class = "Satellite">
                                        <PROP name = "version">
                                            <STRING>&quot;7.2&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "MotionModel">
                                            <STRING>&quot;Orbiter&quot;</STRING>
                                        </VAR>
                                        <VAR name = "EstimateOrbit">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "EstimateLocation">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "OrbitState">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Cartesian&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Cartesian">
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Epoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "XPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>6678.137</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZPosition">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "XVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "YVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>6.789530297717651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ZVelocity">
                                                    <QUANTITY Dimension = "Rate" Unit = "km*sec^-1">
                                                        <REAL>3.686414173013651</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CentralBody">
                                            <STRING>&quot;Earth&quot;</STRING>
                                        </VAR>
                                        <VAR name = "Position">
                                            <PROP name = "DisplayCoordFlag">
                                                <STRING>&quot;Geodetic&quot;</STRING>
                                            </PROP>
                                            <SCOPE Class = "Geodetic">
                                                <VAR name = "Lat">
                                                    <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Lon">
                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Alt">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisSource">
                                            <STRING>&quot;Reference Trajectory&quot;</STRING>
                                        </VAR>
                                        <VAR name = "ReferenceTrajectory">
                                            <SCOPE>
                                                <VAR name = "EphemerisFileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SpiceID">
                                                    <STRING>&quot;4 MARS BARYCENTER&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceSource">
                                                    <STRING>&quot;Reference Trajectory&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "DynamicReports">
                                            <SCOPE>
                                                <VAR name = "CentralBody">
                                                    <STRING>&quot;Earth&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OrbitState">
                                                    <STRING>&quot;Keplerian&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PhysicalProperties">
                                            <SCOPE>
                                                <VAR name = "Mass">
                                                    <QUANTITY Dimension = "MassUnit" Unit = "kg">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Attitude">
                                            <SCOPE>
                                                <VAR name = "Source">
                                                    <STRING>&quot;AlignedConstrained&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyAlignmentVec">
                                                    <STRING>&quot;MinusZ&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialAlignmentVec">
                                                    <STRING>&quot;Radial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "BodyConstraintVec">
                                                    <STRING>&quot;X&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialConstraintVec">
                                                    <STRING>&quot;Intrack&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Files">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "BodySpinAxisDir">
                                                    <STRING>&quot;Z&quot;</STRING>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisRA">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InertialSpinAxisDec">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>90</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SpinRate">
                                                    <QUANTITY Dimension = "AngleRateUnit" Unit = "deg*sec^-1">
                                                        <REAL>360</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffset">
                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "InitialSpinOffsetEpoch">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "CenterOfMassInBodyFrame">
                                                    <SCOPE>
                                                        <VAR name = "X">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Y">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Z">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MinGrazingAlt">
                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                <REAL>100</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "TransmitFreq">
                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                <REAL>2267.5</REAL>
                                            </QUANTITY>
                                        </VAR>
                                        <VAR name = "MeasurementProcessing">
                                            <SCOPE>
                                                <VAR name = "TrackingID">
                                                    <INT>1003</INT>
                                                </VAR>
                                                <VAR name = "TrackingIDAliases">
                                                    <PROP name = "NewElem"></PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "AllowMeasProcessing">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MeasTypes">
                                                    <PROP name = "EmptyDescription">
                                                        <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                    </PROP>
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "MinPassDelta">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceModel">
                                            <SCOPE>
                                                <VAR name = "Gravity">
                                                    <SCOPE>
                                                        <VAR name = "DegreeAndOrder">
                                                            <INT>21</INT>
                                                        </VAR>
                                                        <VAR name = "Tides">
                                                            <SCOPE>
                                                                <VAR name = "SolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeDependentSolidTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinSolidTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "TruncateSolidTides">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "OceanTides">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MaxDegreeOrderOceanTides">
                                                                    <INT>4</INT>
                                                                </VAR>
                                                                <VAR name = "MinOceanTideAmplitude">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "GeneralRelativityCorrection">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "VariationalEquations">
                                                            <SCOPE>
                                                                <VAR name = "Degree">
                                                                    <INT>2</INT>
                                                                </VAR>
                                                                <VAR name = "Order">
                                                                    <INT>0</INT>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "Use">
                                                                    <STRING>&quot;Based On Orbit Class&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "OmissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "CommissionErrorModeling">
                                                                    <SCOPE>
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Scale">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeanMotionUncertaintyScaling">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ThirdBodies">
                                                            <SCOPE>
                                                                <VAR name = "Settings">
                                                                    <LIST>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>4902794000000</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "Settings">
                                                                            <SCOPE>
                                                                                <VAR name = "Name">
                                                                                    <STRING>&quot;Sun&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "GMUser">
                                                                                    <QUANTITY Dimension = "Grav Parameter" Unit = "m^3*sec^-2">
                                                                                        <REAL>1.32712438e+20</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "GMSource">
                                                                                    <STRING>&quot;JPL DE&quot;</STRING>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "UseInVariationalEquations">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Drag">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityModel">
                                                            <STRING>&quot;CIRA 1972&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "AtmDensityPlugin">
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "PluginID">
                                                                    <STRING>&quot;double click to edit&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "PluginConfig">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "LowAltAtmDensityModel">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "DensityBlendingAltRange">
                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                                <REAL>30</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EstimateDensity">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "EstimateBallisticCoeff">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cd&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Ballistic Coeff Relative&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CD">
                                                                    <REAL>2.2</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeff">
                                                                    <REAL>0.044</REAL>
                                                                </VAR>
                                                                <VAR name = "BallisticCoeffModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>0.044</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>10080</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigma">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrHalfLife">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>180</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DensityCorrInitialEstimate">
                                                            <REAL>0</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityCorrSigmaScale">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioRoot">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "DensityRatioIncreaseThreshold">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;ApparentToTrueCB&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutOfPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "InPlaneFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "Initialization">
                                                            <SCOPE>
                                                                <VAR name = "Duration">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "DensityCorrSigma">
                                                                    <REAL>10</REAL>
                                                                </VAR>
                                                                <VAR name = "DensityCorrHalfLife">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>28800</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SolarPressure">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <STRING>&quot;No&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimateSRP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <PROP name = "Type">
                                                                <STRING>&quot;Spherical&quot;</STRING>
                                                            </PROP>
                                                            <SCOPE Class = "SCOPE">
                                                                <VAR name = "SpecMethod">
                                                                    <STRING>&quot;Mass Area Cr&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CorrectionType">
                                                                    <STRING>&quot;Cr Additive&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Cr">
                                                                    <REAL>1</REAL>
                                                                </VAR>
                                                                <VAR name = "Area">
                                                                    <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                        <REAL>20</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrAoverM">
                                                                    <REAL>0.02</REAL>
                                                                </VAR>
                                                                <VAR name = "CrModel">
                                                                    <PROP name = "Type">
                                                                        <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE>
                                                                        <VAR name = "isModeledTwoWay">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "NominalStored">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Constant">
                                                                            <REAL>1</REAL>
                                                                        </VAR>
                                                                        <VAR name = "InitialEstimate">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SigmaStored">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "Sigma">
                                                                            <REAL>0.2</REAL>
                                                                        </VAR>
                                                                        <VAR name = "HalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>2880</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReflectionModel">
                                                                    <STRING>&quot;Sphere with perfect absorption&quot;</STRING>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SunPosMethod">
                                                            <STRING>&quot;Apparent&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EclipsingBodies">
                                                            <LIST>
                                                                <VAR name = "Planet">
                                                                    <STRING>&quot;Moon&quot;</STRING>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "UseInVariationalEquations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "AddProcessNoise">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "EclipticNorthFraction">
                                                            <REAL>0.3</REAL>
                                                        </VAR>
                                                        <VAR name = "EclipticPlaneFraction">
                                                            <REAL>0.1</REAL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "CentralBodyRadiation">
                                                    <SCOPE>
                                                        <VAR name = "Albedo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "ThermalRadiationPressure">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Ck">
                                                            <REAL>1</REAL>
                                                        </VAR>
                                                        <VAR name = "Area">
                                                            <QUANTITY Dimension = "Area" Unit = "m^2">
                                                                <REAL>20</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Plugin">
                                                    <SCOPE>
                                                        <VAR name = "Use">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PluginID">
                                                            <STRING>&quot;double click to edit&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PluginConfig">
                                                            <SCOPE />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "UnmodeledAccelerations">
                                                    <SCOPE>
                                                        <VAR name = "ProcessNoise">
                                                            <SCOPE>
                                                                <VAR name = "RadialVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "IntrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "CrosstrackVelocitySigma">
                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*sec^-1">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TimeInterval">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UseSquaredTimeFormulation">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "InstantManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "PermanentManeuverStates">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "FiniteManeuvers">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "OrbitErrorTransitionMethod">
                                                    <STRING>&quot;VariationalEquations&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "PropagatorControls">
                                            <SCOPE Class = "PropagatorControls">
                                                <VAR name = "IntegrationMethod">
                                                    <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                </VAR>
                                                <VAR name = "UseVOP">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MinimumAltitude">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "km">
                                                        <REAL>0</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "StepSize">
                                                    <SCOPE Class = "StepSize">
                                                        <VAR name = "StepControlMethod">
                                                            <STRING>&quot;RelativeError&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Time">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0.5</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TrueAnomaly">
                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                <REAL>2</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "EccentricityThreshold">
                                                            <REAL>0.04</REAL>
                                                        </VAR>
                                                        <VAR name = "ErrorTolerance">
                                                            <REAL>1e-13</REAL>
                                                        </VAR>
                                                        <VAR name = "MinStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>1</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "MaxStepSize">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>86400</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "Predict">
                                                    <SCOPE Class = "Predict">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "IntegrationMethod">
                                                            <STRING>&quot;RKF 7(8)&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UseVOP">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "PredictorCorrectorScheme">
                                                            <STRING>&quot;Full Correction&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "MaxCorrectorIterations">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "StepSize">
                                                            <SCOPE Class = "StepSize">
                                                                <VAR name = "StepControlMethod">
                                                                    <STRING>&quot;RelativeError&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Time">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>0.5</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "TrueAnomaly">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "EccentricityThreshold">
                                                                    <REAL>0.04</REAL>
                                                                </VAR>
                                                                <VAR name = "ErrorTolerance">
                                                                    <REAL>1e-13</REAL>
                                                                </VAR>
                                                                <VAR name = "MinStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxStepSize">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>86400</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "EphemerisGeneration">
                                            <SCOPE>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "Span">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1440</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AlignTimeGrid">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CoordFrame">
                                                    <STRING>&quot;ICRF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Acceleration">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Covariance">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "CovarianceType">
                                                    <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                </VAR>
                                                <VAR name = "CovarianceCoordFrame">
                                                    <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StateErrorTransition">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "CreateFile">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "FileFormat">
                                                    <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Filename">
                                                    <STRING>&quot;F:\ODTK\Ephemeris\DROL.e&quot;</STRING>
                                                </VAR>
                                                <VAR name = "SendToScript">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "ScriptFilename">
                                                    <STRING>&quot;&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "OrbitUncertainty">
                                            <SCOPE>
                                                <VAR name = "R_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>50</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "I_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>100</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "C_sigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>20</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Rdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.06</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Idot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.04</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "Cdot_sigma">
                                                    <QUANTITY Dimension = "Rate" Unit = "m*sec^-1">
                                                        <REAL>0.02</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "RI_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IC_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "ICdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CRdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "CCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotIdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "RdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "IdotCdot_correlation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "LocationUncertainty">
                                            <SCOPE>
                                                <VAR name = "SouthSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "EastSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>1000</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "AltitudeSigma">
                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                        <REAL>200</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "SouthEastCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "SouthAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                                <VAR name = "EastAltCorrelation">
                                                    <REAL>0</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Clock">
                                            <SCOPE Class = "Clock">
                                                <VAR name = "Settings">
                                                    <SCOPE Class = "Clock">
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Estimate">
                                                            <SCOPE Class = "Estimate">
                                                                <VAR name = "Phase">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Freq">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "Aging">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockControls">
                                                            <SCOPE Class = "ClockControls">
                                                                <VAR name = "PhaseBias">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "FreqBias">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "AgingBias">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "A0">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>3e-21</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Aminus1">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "Aminus2">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec^-1">
                                                                        <REAL>1.225e-31</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AgingWN">
                                                                    <QUANTITY Dimension = "TimeUnit-3" Unit = "sec^-3">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "ClockUncertainty">
                                                            <SCOPE>
                                                                <VAR name = "Phase_sigma">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                        <REAL>1e-06</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "Freq_sigma">
                                                                    <REAL>1e-07</REAL>
                                                                </VAR>
                                                                <VAR name = "Aging_sigma">
                                                                    <QUANTITY Dimension = "Unitless Per Time" Unit = "sec*day^-2">
                                                                        <REAL>1e-05</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "PhaseFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "PhaseAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "FreqAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "OrbitClockCorrelations">
                                                            <SCOPE>
                                                                <VAR name = "RPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "RdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "IdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotPhase_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotFreq_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                                <VAR name = "CdotAging_correlation">
                                                                    <REAL>0</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "FilterEvents">
                                            <SCOPE>
                                                <VAR name = "MeasurementRejectThreshold">
                                                    <SCOPE>
                                                        <VAR name = "NumForWarning">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "NumForAlert">
                                                            <INT>0</INT>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "MeasurementAcceptTimer">
                                                    <SCOPE>
                                                        <VAR name = "TimeGapForWarning">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "TimeGapForAlert">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "OnWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnReturnFromWarning">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OnAlert">
                                                            <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "MeasTimeBias">
                                            <SCOPE>
                                                <VAR name = "Estimate">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TimeBiasModel">
                                                    <PROP name = "Type">
                                                        <STRING>&quot;RandomWalk&quot;</STRING>
                                                    </PROP>
                                                    <SCOPE>
                                                        <VAR name = "isModeledTwoWay">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "InitialEstimateStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "Constant">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialEstimate">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigmaStored">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "InitialSigma">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>0.001</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "DiffusionCoefficient">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                <REAL>9.999999999999999e-12</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CCSDS">
                                            <SCOPE>
                                                <VAR name = "ObjName">
                                                    <STRING>&quot;DROL&quot;</STRING>
                                                </VAR>
                                                <VAR name = "ObjId">
                                                    <STRING>&quot;2000-000A&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "TrackingSystem">
                            <SCOPE>
                                <VAR name = "trakSys">
                                    <SCOPE Class = "TrackingSystem">
                                        <PROP name = "version">
                                            <STRING>&quot;7.2&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "TroposphereModel">
                                            <SCOPE Class = "TroposphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;SCF&quot;</STRING>
                                                </VAR>
                                                <VAR name = "MappingFunction">
                                                    <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "IonosphereModel">
                                            <SCOPE Class = "IonosphereModel">
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Model">
                                                    <STRING>&quot;IRI2016&quot;</STRING>
                                                </VAR>
                                                <VAR name = "TransmitFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>2267.5</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "ReceiveFreq">
                                                    <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                        <REAL>2267.5</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE>
                                                <VAR name = "Facility">
                                                    <SCOPE>
                                                        <VAR name = "KSX">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.2&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.6894666314021363</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>1.310694947814472</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1317.83</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>10</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>20</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>101</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>10</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>45</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "SYX">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.2&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.3196431048979694</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>1.90786192157558</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>47.63</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>10</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>20</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>102</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>10</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>45</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "MYX">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.2&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.7060147712525735</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>2.039596612017388</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>100</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>10</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>20</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>103</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>10</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>45</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "AGX">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.2&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>-0.951369278988486</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>-1.171387423749616</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>147</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>20</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>10</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>20</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>104</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>10</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>45</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "MYK">
                                                            <SCOPE Class = "Facility">
                                                                <PROP name = "version">
                                                                    <STRING>&quot;7.2&quot;</STRING>
                                                                </PROP>
                                                                <VAR name = "Description">
                                                                    <STRING>&quot;&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "CentralBody">
                                                                    <STRING>&quot;Earth&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "Position">
                                                                    <PROP name = "DisplayCoordFlag">
                                                                        <STRING>&quot;Geodetic&quot;</STRING>
                                                                    </PROP>
                                                                    <SCOPE Class = "Geodetic">
                                                                        <VAR name = "Lat">
                                                                            <QUANTITY Dimension = "LatitudeUnit" Unit = "rad">
                                                                                <REAL>0.7060147712525735</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Lon">
                                                                            <QUANTITY Dimension = "LongitudeUnit" Unit = "rad">
                                                                                <REAL>2.039596612017388</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Alt">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>100</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "PositionType">
                                                                    <STRING>&quot;MeanTide&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "ModelStationMotion">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MotionModel">
                                                                    <SCOPE>
                                                                        <VAR name = "PlateMotion">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Epoch">
                                                                            <DATE>1 Jan 1997 00:00:30.000</DATE>
                                                                        </VAR>
                                                                        <VAR name = "Velocity">
                                                                            <SCOPE>
                                                                                <VAR name = "X">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Y">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Z">
                                                                                    <QUANTITY Dimension = "SlowRate" Unit = "cm*yr^-1">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoading">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "OceanTideLoadingFile">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "SolidEarthTides">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PoleTide">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Estimate">
                                                                    <STRING>&quot;Nothing&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "LocationErrors">
                                                                    <SCOPE>
                                                                        <VAR name = "SouthSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "EastSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "AltitudeSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "SouthEastCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "SouthAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                        <VAR name = "EastAltCorrelation">
                                                                            <REAL>0</REAL>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "UsePositionFromMeasurementFile">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "MeasurementStatistics">
                                                                    <LIST>
                                                                        <VAR name = "Range">
                                                                            <SCOPE>
                                                                                <VAR name = "Type">
                                                                                    <PROP name = "Type">
                                                                                        <STRING>&quot;Range&quot;</STRING>
                                                                                    </PROP>
                                                                                    <SCOPE>
                                                                                        <VAR name = "BiasModel">
                                                                                            <PROP name = "Type">
                                                                                                <STRING>&quot;GaussMarkov&quot;</STRING>
                                                                                            </PROP>
                                                                                            <SCOPE>
                                                                                                <VAR name = "isModeledTwoWay">
                                                                                                    <BOOL>true</BOOL>
                                                                                                </VAR>
                                                                                                <VAR name = "NominalStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Constant">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "InitialEstimate">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>0</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "SigmaStored">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>2</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "Sigma">
                                                                                                    <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                        <REAL>1</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                                <VAR name = "HalfLife">
                                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                                        <REAL>5</REAL>
                                                                                                    </QUANTITY>
                                                                                                </VAR>
                                                                                            </SCOPE>
                                                                                        </VAR>
                                                                                        <VAR name = "WhiteNoiseSigmaTwoWay">
                                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                                <REAL>2</REAL>
                                                                                            </QUANTITY>
                                                                                        </VAR>
                                                                                        <VAR name = "EstimateBias">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "TropoSigma">
                                                                                            <REAL>0.05</REAL>
                                                                                        </VAR>
                                                                                        <VAR name = "LightTimeDelay">
                                                                                            <BOOL>true</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "ModelInSolarSystemBarycenterFrame">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                        <VAR name = "BoresightBiasModel">
                                                                                            <BOOL>false</BOOL>
                                                                                        </VAR>
                                                                                    </SCOPE>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </LIST>
                                                                </VAR>
                                                                <VAR name = "MeasurementProcessing">
                                                                    <SCOPE>
                                                                        <VAR name = "TrackingID">
                                                                            <INT>105</INT>
                                                                        </VAR>
                                                                        <VAR name = "TrackingIDAliases">
                                                                            <PROP name = "NewElem"></PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "AllowMeasProcessing">
                                                                            <BOOL>true</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "MeasTypes">
                                                                            <PROP name = "EmptyDescription">
                                                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                                                            </PROP>
                                                                            <LIST />
                                                                        </VAR>
                                                                        <VAR name = "MinPassDelta">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>20</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "GeometricMeasurementDependencies">
                                                                    <SCOPE Class = "GeometricMeasurementDependencies">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MinElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>10</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>90</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AzElMask">
                                                                    <SCOPE Class = "AzElMask">
                                                                        <VAR name = "Enabled">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "Filename">
                                                                            <STRING>&quot;&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "RangingMethod">
                                                                    <STRING>&quot;Transponder&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaType">
                                                                    <STRING>&quot;Mechanical&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaCorrectionType">
                                                                    <STRING>&quot;None&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "AntennaMountType">
                                                                    <STRING>&quot;AzEl&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "DirectionCosineAzimuthOffset">
                                                                    <QUANTITY Dimension = "LongitudeUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightAzimuth">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>0</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "BoresightElevation">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>45</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "MaxAngleDown">
                                                                    <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                        <REAL>59.99999999999999</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "OpticalProperties">
                                                                    <SCOPE Class = "OpticalProperties">
                                                                        <VAR name = "TargetMustBeLit">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "PolarExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSunElevation">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>90</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinSunExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinMoonExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>0</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MinEarthExclusion">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>10</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "MaxSolarPhaseAngle">
                                                                            <QUANTITY Dimension = "AngleUnit" Unit = "deg">
                                                                                <REAL>180</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReferenceFrame">
                                                                            <STRING>&quot;MEME J2000&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "AberrationCorrections">
                                                                            <STRING>&quot;None&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "ReferenceEmitter">
                                                                    <LINKTOOBJ>
                                                                        <STRING>&quot;not specified&quot;</STRING>
                                                                    </LINKTOOBJ>
                                                                </VAR>
                                                                <VAR name = "TroposphereModel">
                                                                    <SCOPE Class = "TroposphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;SCF&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "MappingFunction">
                                                                            <STRING>&quot;MP Surface Temperature&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "EstimateBias">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "BiasSigma">
                                                                            <QUANTITY Dimension = "DistanceUnit" Unit = "m">
                                                                                <REAL>1</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "BiasHalfLife">
                                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                <REAL>30</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "Data">
                                                                            <SCOPE>
                                                                                <VAR name = "SurfaceRefractivity">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "ConstantValue">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial1">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial2">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial3">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial4">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial5">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial6">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial7">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial8">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial9">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial10">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Polynomial11">
                                                                                    <REAL>0</REAL>
                                                                                </VAR>
                                                                                <VAR name = "DayOfMonth">
                                                                                    <INT>1</INT>
                                                                                </VAR>
                                                                                <VAR name = "Jan">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Feb">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Mar">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Apr">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "May">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jun">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Jul">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Aug">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Sep">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Oct">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Nov">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "Dec">
                                                                                    <REAL>340</REAL>
                                                                                </VAR>
                                                                                <VAR name = "OverrideWavelength">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "Wavelength">
                                                                                    <QUANTITY Dimension = "SmallDistanceUnit" Unit = "nanom">
                                                                                        <REAL>694.3</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetDataSource">
                                                                                    <STRING>&quot;Constant&quot;</STRING>
                                                                                </VAR>
                                                                                <VAR name = "Temperature">
                                                                                    <QUANTITY Dimension = "Temperature" Unit = "K">
                                                                                        <REAL>295.1</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Pressure">
                                                                                    <QUANTITY Dimension = "PressureUnit" Unit = "kPa">
                                                                                        <REAL>101.35</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Humidity">
                                                                                    <QUANTITY Dimension = "Percent" Unit = "%">
                                                                                        <REAL>55</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "MetFiles">
                                                                                    <LIST />
                                                                                </VAR>
                                                                                <VAR name = "OverrideMetData">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "IonosphereModel">
                                                                    <SCOPE Class = "IonosphereModel">
                                                                        <VAR name = "Enabled">
                                                                            <STRING>&quot;Based on Tracking System&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "Model">
                                                                            <STRING>&quot;IRI2016&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "TransmitFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                        <VAR name = "ReceiveFreq">
                                                                            <QUANTITY Dimension = "FrequencyUnit" Unit = "MHz">
                                                                                <REAL>2267.5</REAL>
                                                                            </QUANTITY>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "MeasTimeBias">
                                                                    <SCOPE>
                                                                        <VAR name = "Estimate">
                                                                            <BOOL>false</BOOL>
                                                                        </VAR>
                                                                        <VAR name = "TimeBiasModel">
                                                                            <PROP name = "Type">
                                                                                <STRING>&quot;RandomWalk&quot;</STRING>
                                                                            </PROP>
                                                                            <SCOPE>
                                                                                <VAR name = "isModeledTwoWay">
                                                                                    <BOOL>false</BOOL>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimateStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "Constant">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialEstimate">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigmaStored">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "InitialSigma">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>0.001</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                                <VAR name = "DiffusionCoefficient">
                                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "sec">
                                                                                        <REAL>9.999999999999999e-12</REAL>
                                                                                    </QUANTITY>
                                                                                </VAR>
                                                                            </SCOPE>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "Children">
                                                                    <SCOPE />
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                        <VAR name = "Simulator">
                            <SCOPE>
                                <VAR name = "Simu_groundX">
                                    <SCOPE Class = "Simulator">
                                        <PROP name = "version">
                                            <STRING>&quot;7.2&quot;</STRING>
                                        </PROP>
                                        <VAR name = "Description">
                                            <STRING>&quot;&quot;</STRING>
                                        </VAR>
                                        <VAR name = "SatelliteList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all satellites to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ>
                                                <STRING>&quot;DROA&quot;</STRING>
                                            </SETLINKTOOBJ>
                                        </VAR>
                                        <VAR name = "TrackingStrandList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all tracking strands to be used&quot;</STRING>
                                            </PROP>
                                            <LIST>
                                                <VAR name = "Tracking Strand">
                                                    <STRING>&quot;trakSys.AGX - *&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Tracking Strand">
                                                    <STRING>&quot;trakSys.KSX - *&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Tracking Strand">
                                                    <STRING>&quot;trakSys.MYX - *&quot;</STRING>
                                                </VAR>
                                                <VAR name = "Tracking Strand">
                                                    <STRING>&quot;trakSys.SYX - *&quot;</STRING>
                                                </VAR>
                                            </LIST>
                                        </VAR>
                                        <VAR name = "EmitterList">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all emitters to be used&quot;</STRING>
                                            </PROP>
                                            <SETLINKTOOBJ />
                                        </VAR>
                                        <VAR name = "MeasTypes">
                                            <PROP name = "EmptyDescription">
                                                <STRING>&quot;An empty list allows all measurement types to be processed&quot;</STRING>
                                            </PROP>
                                            <LIST>
                                                <VAR name = "Measurement Type">
                                                    <STRING>&quot;Range&quot;</STRING>
                                                </VAR>
                                            </LIST>
                                        </VAR>
                                        <VAR name = "ProcessControl">
                                            <SCOPE Class = "ProcessControl">
                                                <VAR name = "StartMode">
                                                    <STRING>&quot;Initial&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StartTime">
                                                    <DATE>1 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "SelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2020 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "AutoSelectedRestartTime">
                                                    <STRING>&quot;01 Jul 2020 12:00:00.000 UTCG&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopMode">
                                                    <STRING>&quot;StopTime&quot;</STRING>
                                                </VAR>
                                                <VAR name = "StopTime">
                                                    <DATE>2 Jul 2020 12:00:37.000</DATE>
                                                </VAR>
                                                <VAR name = "TimeSpan">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "hr">
                                                        <REAL>24</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "TimeStep">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>1</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "NumOrbitsAllowedForEpochAlignment">
                                                    <INT>15</INT>
                                                </VAR>
                                                <VAR name = "GlobalAtmosphericDensityEstimation">
                                                    <SCOPE>
                                                        <VAR name = "Mode">
                                                            <STRING>&quot;Nominal&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Model">
                                                            <STRING>&quot;Jacchia 1970&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Parameterization">
                                                            <STRING>&quot;Tc_Tx&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EstimationParameters">
                                                            <LIST>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTc&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                                <SCOPE>
                                                                    <VAR name = "Name">
                                                                        <STRING>&quot;dTx&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "ParameterizationName">
                                                                        <STRING>&quot;Scalar&quot;</STRING>
                                                                    </VAR>
                                                                    <VAR name = "Coefficients">
                                                                        <LIST>
                                                                            <VAR name = "Coefficient">
                                                                                <SCOPE>
                                                                                    <VAR name = "HalfLife">
                                                                                        <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                                            <REAL>180</REAL>
                                                                                        </QUANTITY>
                                                                                    </VAR>
                                                                                    <VAR name = "Sigma">
                                                                                        <REAL>5</REAL>
                                                                                    </VAR>
                                                                                </SCOPE>
                                                                            </VAR>
                                                                        </LIST>
                                                                    </VAR>
                                                                </SCOPE>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "CorrectionFilename">
                                                            <STRING>&quot;&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "LimitCorrectionEpoch">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "LatestCorrectionEpoch">
                                                            <DATE>1 Jul 2000 00:00:32.000</DATE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "EnableDeepSpaceMode">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Restart">
                                            <SCOPE>
                                                <VAR name = "SaveRecordsToFile">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "MaxRecordsInFile">
                                                    <INT>100</INT>
                                                </VAR>
                                                <VAR name = "SaveFrequency">
                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                        <REAL>60</REAL>
                                                    </QUANTITY>
                                                </VAR>
                                                <VAR name = "BackupRestartRecords">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "StochasticModelUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Source">
                                                            <STRING>&quot;None&quot;</STRING>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ClockUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SatelliteMassUpdates">
                                                    <SCOPE>
                                                        <VAR name = "Enabled">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "ResetGPSUTCSteering">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "CustomTrackingIntervals">
                                            <SCOPE>
                                                <VAR name = "Enabled">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "IntervalFileLinks">
                                                    <LIST />
                                                </VAR>
                                                <VAR name = "ImportMeasFileSchedule">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "Schedule">
                                                    <LIST>
                                                        <SCOPE>
                                                            <VAR name = "Enabled">
                                                                <BOOL>true</BOOL>
                                                            </VAR>
                                                            <VAR name = "PrimaryObjects">
                                                                <STRING>&quot;Specific Satellite&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedObject">
                                                                <LINKTOOBJ>
                                                                    <STRING>&quot;DROA&quot;</STRING>
                                                                </LINKTOOBJ>
                                                            </VAR>
                                                            <VAR name = "Trackers">
                                                                <STRING>&quot;Specific Tracker&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedTrackingStrand">
                                                                <STRING>&quot;trakSys.KSX - *&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "TimeStep">
                                                                <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                    <REAL>0.5</REAL>
                                                                </QUANTITY>
                                                            </VAR>
                                                            <VAR name = "InclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                            <VAR name = "ExclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                        </SCOPE>
                                                        <SCOPE>
                                                            <VAR name = "Enabled">
                                                                <BOOL>true</BOOL>
                                                            </VAR>
                                                            <VAR name = "PrimaryObjects">
                                                                <STRING>&quot;Specific Satellite&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedObject">
                                                                <LINKTOOBJ>
                                                                    <STRING>&quot;DROA&quot;</STRING>
                                                                </LINKTOOBJ>
                                                            </VAR>
                                                            <VAR name = "Trackers">
                                                                <STRING>&quot;Specific Tracker&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedTrackingStrand">
                                                                <STRING>&quot;trakSys.SYX - *&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "TimeStep">
                                                                <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                    <REAL>0.5</REAL>
                                                                </QUANTITY>
                                                            </VAR>
                                                            <VAR name = "InclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                            <VAR name = "ExclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                        </SCOPE>
                                                        <SCOPE>
                                                            <VAR name = "Enabled">
                                                                <BOOL>true</BOOL>
                                                            </VAR>
                                                            <VAR name = "PrimaryObjects">
                                                                <STRING>&quot;Specific Satellite&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedObject">
                                                                <LINKTOOBJ>
                                                                    <STRING>&quot;DROA&quot;</STRING>
                                                                </LINKTOOBJ>
                                                            </VAR>
                                                            <VAR name = "Trackers">
                                                                <STRING>&quot;Specific Tracker&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedTrackingStrand">
                                                                <STRING>&quot;trakSys.MYX - *&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "TimeStep">
                                                                <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                    <REAL>0.5</REAL>
                                                                </QUANTITY>
                                                            </VAR>
                                                            <VAR name = "InclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                            <VAR name = "ExclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                        </SCOPE>
                                                        <SCOPE>
                                                            <VAR name = "Enabled">
                                                                <BOOL>true</BOOL>
                                                            </VAR>
                                                            <VAR name = "PrimaryObjects">
                                                                <STRING>&quot;Specific Satellite&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedObject">
                                                                <LINKTOOBJ>
                                                                    <STRING>&quot;DROA&quot;</STRING>
                                                                </LINKTOOBJ>
                                                            </VAR>
                                                            <VAR name = "Trackers">
                                                                <STRING>&quot;Specific Tracker&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "SelectedTrackingStrand">
                                                                <STRING>&quot;trakSys.AGX - *&quot;</STRING>
                                                            </VAR>
                                                            <VAR name = "TimeStep">
                                                                <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                    <REAL>0.5</REAL>
                                                                </QUANTITY>
                                                            </VAR>
                                                            <VAR name = "InclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                            <VAR name = "ExclusionIntervals">
                                                                <LIST>
                                                                    <PROP name = "NewElem"></PROP>
                                                                </LIST>
                                                            </VAR>
                                                        </SCOPE>
                                                    </LIST>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ErrorModeling">
                                            <SCOPE Class = "ErrorModeling">
                                                <VAR name = "NoDeviations">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateOrbits">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateDensity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateBCoeff">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateSolarP">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateTranspDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateRetroDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateMeasBiases">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateTropoBiases">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateManeuvers">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "AddProcessNoise">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "AddManeuverProcessNoise">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "AddMeasWhiteNoise">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateStationLocations">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateAntennaLocations">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateClocks">
                                                    <BOOL>true</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateMeasTimeBias">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateAccelerometers">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateGlobalDensity">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "AddGlobalDensityProcessNoise">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "DeviateEmpiricalForces">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "RandomSeed">
                                                    <LONG>1</LONG>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ErrorScaling">
                                            <SCOPE Class = "ErrorScaling">
                                                <VAR name = "Orbits">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Density">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "BCoeff">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "SolarP">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "TranspDelay">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "RetroDelay">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "MeasBiases">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "TropoBiases">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Maneuvers">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "StationLocations">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "AntennaLocations">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Clocks">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "MeasTimeBias">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "Accelerometers">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "GlobalDensity">
                                                    <REAL>1</REAL>
                                                </VAR>
                                                <VAR name = "EmpiricalForces">
                                                    <REAL>1</REAL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "ForceSequencePositive">
                                            <SCOPE Class = "ForceSequencePositive">
                                                <VAR name = "Density">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "BCoeff">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "SolarP">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "TranspDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                                <VAR name = "RetroDelay">
                                                    <BOOL>false</BOOL>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "UpdateFilterTimes">
                                            <BOOL>true</BOOL>
                                        </VAR>
                                        <VAR name = "Output">
                                            <SCOPE>
                                                <VAR name = "Measurements">
                                                    <SCOPE>
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;F:\ODTK\TrackingData\Simu_and_LS.gobs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputByPass">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "PassFileBaseName">
                                                            <STRING>&quot;C:\Users\chenz\Documents\ODTK 7\TrackingData\Simu_and_LS&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "PassFileDefaultExtension">
                                                            <STRING>&quot;gobs&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "UpdateScenario">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "DataArchive">
                                                    <SCOPE Class = "DataArchive">
                                                        <VAR name = "Filename">
                                                            <STRING>&quot;F:\ODTK\DataArchive\Simu_and_LS.simrun&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileUpdateMethod">
                                                            <STRING>&quot;Overwrite&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputStateHistory">
                                                            <STRING>&quot;AllTimes&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "EveryNSteps">
                                                            <INT>1</INT>
                                                        </VAR>
                                                        <VAR name = "OutputMeasHistory">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputManeuvers">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputEmpiricalForces">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputSummary">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputDataFiles">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputHistograms">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "HistogramSize">
                                                            <INT>3</INT>
                                                        </VAR>
                                                        <VAR name = "NumberHistogramBins">
                                                            <INT>22</INT>
                                                        </VAR>
                                                        <VAR name = "OutputGPSSVMeasInfo">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "OutputPerturbations">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                        <VAR name = "OrbitEvents">
                                                            <SCOPE Class = "OrbitEvents">
                                                                <VAR name = "OutputApoPeriCrossings">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinEccForApoPeri">
                                                                    <REAL>0.001</REAL>
                                                                </VAR>
                                                                <VAR name = "OutputAscDescNodeCrossings">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "MinAbsIncForAscDescNodes">
                                                                    <REAL>0.001</REAL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "STKEphemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeGrid">
                                                                    <STRING>&quot;Uniform&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "MaxTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "UniformTimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>2</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                                <VAR name = "TimeStep">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>1</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "AlignTimeGrid">
                                                                    <BOOL>true</BOOL>
                                                                </VAR>
                                                                <VAR name = "StopMode">
                                                                    <STRING>&quot;TimeSpan&quot;</STRING>
                                                                </VAR>
                                                                <VAR name = "TimeSpan">
                                                                    <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                        <REAL>720</REAL>
                                                                    </QUANTITY>
                                                                </VAR>
                                                                <VAR name = "StopTime">
                                                                    <DATE>2 Jul 2020 00:00:37.000</DATE>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "EphemerisArchiving">
                                                            <STRING>&quot;Final Iteration&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CoordFrame">
                                                            <LIST>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;DROA&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;DROB&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                                <VAR name = "SatCoordFrameList">
                                                                    <SCOPE>
                                                                        <VAR name = "Satellite">
                                                                            <LINKTOOBJ>
                                                                                <STRING>&quot;DROL&quot;</STRING>
                                                                            </LINKTOOBJ>
                                                                        </VAR>
                                                                        <VAR name = "CBName">
                                                                            <STRING>&quot;Earth&quot;</STRING>
                                                                        </VAR>
                                                                        <VAR name = "CoordFrame">
                                                                            <STRING>&quot;ICRF&quot;</STRING>
                                                                        </VAR>
                                                                    </SCOPE>
                                                                </VAR>
                                                            </LIST>
                                                        </VAR>
                                                        <VAR name = "Acceleration">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "Covariance">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "CovarianceType">
                                                            <STRING>&quot;Position 3x3 Covariance&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "CovarianceCoordFrame">
                                                            <STRING>&quot;SameAsEphemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "StateErrorTransition">
                                                            <BOOL>false</BOOL>
                                                        </VAR>
                                                        <VAR name = "FileFormat">
                                                            <STRING>&quot;STK Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "OutputDirectory">
                                                            <STRING>&quot;F:\ODTK\Ephemeris&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "FileNamingOption">
                                                            <STRING>&quot;ProcessStart&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "Files">
                                                            <LIST />
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                                <VAR name = "SP3Ephemeris">
                                                    <SCOPE>
                                                        <VAR name = "DuringProcess">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Predict">
                                                            <SCOPE>
                                                                <VAR name = "Generate">
                                                                    <BOOL>false</BOOL>
                                                                </VAR>
                                                            </SCOPE>
                                                        </VAR>
                                                        <VAR name = "Outputs">
                                                            <STRING>&quot;Position Only&quot;</STRING>
                                                        </VAR>
                                                        <VAR name = "TimeStep">
                                                            <QUANTITY Dimension = "TimeUnit" Unit = "min">
                                                                <REAL>15</REAL>
                                                            </QUANTITY>
                                                        </VAR>
                                                        <VAR name = "CombineGNSSSystems">
                                                            <BOOL>true</BOOL>
                                                        </VAR>
                                                    </SCOPE>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Events">
                                            <SCOPE>
                                                <VAR name = "OnInternalError">
                                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnStart">
                                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnComplete">
                                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                                <VAR name = "OnHalt">
                                                    <STRING>&quot;D:\Program Files\AGI\ODTK 7\ODTK\AppData\Scripts\DoNothing.vbs&quot;</STRING>
                                                </VAR>
                                            </SCOPE>
                                        </VAR>
                                        <VAR name = "Children">
                                            <SCOPE />
                                        </VAR>
                                    </SCOPE>
                                </VAR>
                            </SCOPE>
                        </VAR>
                    </SCOPE>
                </VAR>
            </SCOPE>
        </VAR>
    </SCOPE>
</VAR>