Config = {}

Config.Option = {                                          
    Update = {                                              
        Time = 15                                           
    },

    Display = {                                             
        ID = {                                              
            Enable = true                                   
        },

        Name = {                                           
            Enable = true                                   
        },

        Online = {                                         
            Enable = true                                   
        },
        
        FPS = {                               
            Enable = false                      
        },

        Activity = {                                        
            Enable = true,                                  

            Plate = {                                       
                Enable = true                               
            }
        }
    }
}

Config.Discord = {                                          
    Application = {                                         -- Application (Developer Portal: https://discord.com/developers/applications)
        ID = 
    },

    Asset = {                                               -- Asset (Art Assets: https://discord.com/developers/applications/YOUR_APP_ID/rich-presence/assets)
        Logo = {                                            
            Name = 'logo',                            
            Text = 'Bobs & Co'                    
        },

        Icon = {                                            
            Name = 'logo',                            
            Text = 'Bobs & Co'                    
        }
    },

    Button = {                                              
        [1] = {                                             
            Text = 'Rejoindre Discord',                          
            URL = 'URL'               
        },

        [2] = {                                             
            Text = 'Rejoindre le serveur',                           
            URL = 'URL'         
        }
    }
}

Config.Translate = {                                        
    General = {                                             
        Slot = 'Slots',                                     
        Player = 'Joueurs',                                 
        Loading = 'Chargement...'                              
    },

    Unknown = {                                             
        Zone = 'Zone inconnue',                             
        Activity = 'Activité inconnue'                      
    },

    Activity = {                                            
        Dead = {                                            
            Ground = 'Mort à %s',                          
            Water = 'Mort à %s',                           
            Vehicle = 'Morts sur %s dans un %s %s'           
        },

        Ground = {                                         
            Sprinting = 'Sprint sur %s',                  
            Running = 'Court sur %s',                      
            Walking = 'Marche sur %s',                      
            Standing = 'Debout à %s'                     
        },

        Water = {                                           
            Swimming = 'Nage sur %s'                     
        },

        Vehicle = {                                         
            Sailing = 'Navigue en %s dans un %s %s',           
            Drowning = 'Noyade à %s dans un %s %s',         
            Flying = 'Survole %s dans un %s %s',           
            Landed = 'Atterri à %s dans un %s %s',             
            Parked = 'Stationné à %s dans un %s %s',             
            Cruising = 'En croisière sur %s dans un %s %s',         
            Speeding = 'Excès de vitesse sur %s dans un %s %s'          
        }
    }
}

Config.Zone = {                                             -- Zone (List: https://docs.fivem.net/natives/?_0xCD90657D4C30E1CA)
    AIRP = 'Los Santos International Airport',
    ALAMO = 'Alamo Sea',
    ALTA = 'Alta',
    ARMYB = 'Fort Zancudo',
    BANHAMC = 'Banham Canyon Dr',
    BANNING = 'Banning',
    BEACH = 'Vespucci Beach',
    BHAMCA = 'Banham Canyon',
    BRADP = 'Braddock Pass',
    BRADT = 'Braddock Tunnel',
    BURTON = 'Burton',
    CALAFB = 'Calafia Bridge',
    CANNY = 'Raton Canyon',
    CCREAK = 'Cassidy Creek',
    CHAMH = 'Chamberlain Hills',
    CHIL = 'Vinewood Hills',
    CHU = 'Chumash',
    CMSW = 'Chiliad Mountain State Wilderness',
    CYPRE = 'Cypress Flats',
    DAVIS = 'Davis',
    DELBE = 'Del Perro Beach',
    DELPE = 'Del Perro',
    DELSOL = 'La Puerta',
    DESRT = 'Grand Senora Desert',
    DOWNT = 'Downtown',
    DTVINE = 'Downtown Vinewood',
    EAST_V = 'East Vinewood',
    EBURO = 'El Burro Heights',
    ELGORL = 'El Gordo Lighthouse',
    ELYSIAN = 'Elysian Island',
    GALFISH = 'Galilee',
    GOLF = 'GWC & Golfing Society',
    GRAPES = 'Grapeseed',
    GREATC = 'Great Chaparral',
    HARMO = 'Harmony',
    HAWICK = 'Hawick',
    HORS = 'Vinewood Racetrack',
    HUMLAB = 'Humane Labs & Research',
    JAIL = 'Bolingbroke Penitentiary',
    KOREAT = 'Little Seoul',
    LACT = 'Land Act Reservoir',
    LAGO = 'Lago Zancudo',
    LDAM = 'Land Act Dam',
    LEGSQU = 'Legion Square',
    LMESA = 'La Mesa',
    LOSPUER = 'La Puerta',
    MIRR = 'Mirror Park',
    MORN = 'Morningwood',
    MOVIE = 'Richards Majestic',
    MTCHIL = 'Mount Chiliad',
    MTGORDO = 'Mount Gordo',
    MTJOSE = 'Mount Josiah',
    MURRI = 'Murrieta Heights',
    NCHU = 'North Chumash',
    NOOSE = 'N.O.O.S.E',
    OCEANA = 'Pacific Ocean',
    PALCOV = 'Paleto Cove',
    PALETO = 'Paleto Bay',
    PALFOR = 'Paleto Forest',
    PALHIGH = 'Palomino Highlands',
    PALMPOW = 'Palmer-Taylor Power Station',
    PBLUFF = 'Pacific Bluffs',
    PBOX = 'Pillbox Hill',
    PROCOB = 'Procopio Beach',
    RANCHO = 'Rancho',
    RGLEN = 'Richman Glen',
    RICHM = 'Richman',
    ROCKF = 'Rockford Hills',
    RTRAK = 'Redwood Lights Track',
    SANAND = 'San Andreas',
    SANCHIA = 'San Chianski Mountain Range',
    SANDY = 'Sandy Shores',
    SKID = 'Mission Row',
    SLAB = 'Stab City',
    STAD = 'Maze Bank Arena',
    STRAW = 'Strawberry',
    TATAMO = 'Tataviam Mountains',
    TERMINA = 'Terminal',
    TEXTI = 'Textile City',
    TONGVAH = 'Tongva Hills',
    TONGVAV = 'Tongva Valley',
    VCANA = 'Vespucci Canals',
    VESP = 'Vespucci',
    VINE = 'Vinewood',
    WINDF = 'Ron Alternates Wind Farm',
    WVINE = 'West Vinewood',
    ZANCUDO = 'Zancudo River',
    ZP_ORT = 'Port of South Los Santos',
    ZQ_UAR = 'Davis Quartz',
    PROL = 'Prologue / North Yankton',
    ISHeist = 'Cayo Perico Island'
}
