# Architechture Flow

[ Internet ]
     |
 [         `Nginx`         ]  <--- Reverse Proxy
     |
     +-- serves static assets (images, CSS, JS)
     |
     +-- FastCGI to [ `WordPress` ] (PHP-FPM)
     |         |
     |         +-- checks Redis cache for data
     |                |
     |                +-- HIT → return data from memory
     |                +-- MISS → query MariaDB, store result in Redis
     |
     +-- FastCGI to [ `Adminer` ] (PHP-FPM)
                       |
                       +-- directly queries → [ `MariaDB` ]

                         [ `Redis` ] ←→ [ `MariaDB` ]
