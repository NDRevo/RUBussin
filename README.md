# RUBussin
Next Generation Bus Tracker

## Transloc API
Hello there, most functions of RUBussin rely on transloc API. It's therefore essential to understand its limitations and capabilities. The text below will try to provide a basic documentation of transloc available data and endpoints.

### Available Enpoints
**`GET https://feeds.transloc.com/3/agencies`** provides the details about the agency that uses transloc service

**params**: `agencies: id` specifies the id of the involved agencies. Rutgers' id is **1323**. The id is essential as it will be included in almost every request that concerns Rutgers' buses.

**return**: 
```
{
    "agencies": [
        {
            "affiliated_agencies": [],
            "arrival_predictions": boolean,
            "bounds": [int] (two sets of corediantes),
            "color": str,
            "has_notifications": boolean,
            "has_schedules": boolean,
            "has_trip_planning": boolean,
            "id": str,
            "location": str,
            "long_name": str,
            "name": "rutgers",
            "position": [int], set of coredinats
            "short_name": str,
            "text_color": str,
            "timezone": str,
            "timezone_offset": int,
            "url": str (url)
        }
    ],
    "success": boolean
}
```

**`GET https://feeds.transloc.com/3/routes`** Gets all routes that Rutgers has: specifies if they are currently active or not. 

**params**: agencies: (1323 for Rutgers) *reqiured*

**return**:
```
{
    "routes": [
        {
            "agency_id": int,
            "bounds": [int] two sets of corediantes,
            "color": str,
            "description": str
            "id": int,
            "is_active": boolean,
            "long_name": str (ex: "Route LX", "Route REXL"),
            "short_name": str,
            "text_color": str,
            "type": str (mostly equals to "bus"),
            "url": str (mostly empty)
        },
        {...}
    ],
    "success": true
}
```

**`GET https://feeds.transloc.com/3/stops`** gets an array with a code name of all bus stops along with their coordinates 

**params**: include_routes: (boolean) *optional*, agencies: id (1323 for Rutgers) *reqiured*

**return**:
``` 
[
  {
    "code": str,
    "description": str,
    "id": int,
    "location_type": str (mostly equals "stop"),
    "name": str (example: "Student Activities Center Northbound"),
    "parent_station_id": null,
    "position": [int] set of coerdinates,
    "url": str
  },
]
```

**`GET https://feeds.transloc.com/3/segments`** I don't know what this does tbh. I don't know what they mean by segments yet

**params**: agencies: (1323 for Rutgers) *required*

**return example**:
``` {
    "routes": [
        {
            "agency_id": 1323,
            "id": 4012650,
            "segments": [
                -767745186,
                -734871323,
                -731262260,
                -696542286,
                -643958752,
                -606962193,
                -557859489,
                543866636,
                544978387,
                550197149,
                552669912,
                ...
            ]
        },
    ],
    "segments": [
        {
            "id": 538512848,
            "levels": "PAAECBP",
            "points": "_rhvFlgneMPVzKbHfBx@XjJ^dE^@"
        },
    ]
    "success": true
}
```
**`GET https://feeds.transloc.com/3/vehicle_statuses`** gets expected arrival times and current bus locations. This is arguably the most critical endpoint.



**params**: include_arrivals: boolean, agencies: (1323 for Rutgers) *reqiured*

**return example**:
```
{
  agency_service_statuses: [object],
  arrivals: [
            {
            agency_id: int
            call_name: str
            distance: int
            headsign: null
            route_id: int
            stop_id: int
            timestamp: int (epoch)
            trip_id: int
            type: str
            vehicle_id: int
            }, 
            {...}
  ]
    vehicles: [
            {
            "id": int,
            "num_cars": null,
            "service_status": str(ex: "in_service"),
            "agency_id": int,
            "route_id": int,
            "trip_id": int,
            "TripStart": str (ex: "0001-01-01T00:00:00Z"),
            "TripEnd": str,
            "gtfs_trip_id": str,
            "direction": boolean,
            "stop_pattern_id": int,
            "call_name":  str,
            "current_stop_id": null,
            "next_stop": int,
            "arrival_status": str,
            "position": [int],
            "heading": int,
            "speed": int,
            "segment_id": int,
            "off_route": boolean,
            "timestamp": int (epoch time),
            "load": int,
            "apc_status": str
        }
    ]
}
  
}
```

