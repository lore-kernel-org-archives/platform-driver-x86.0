From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 1/2] Platform: OLPC: Fix build error without CONFIG_SPI
Date: Tue, 28 May 2019 17:28:05 +0800
Message-ID: <20190528092806.20080-2-yuehaibing@huawei.com>
References: <20190528092806.20080-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528092806.20080-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, lkundrak@v3.sk
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix gcc build error while CONFIG_SPI is not set

drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_remove':
olpc-xo175-ec.c:(.text+0x190): undefined reference to `spi_slave_abort'
drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_send_command':
olpc-xo175-ec.c:(.text+0x374): undefined reference to `spi_async'
drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_cmd':
olpc-xo175-ec.c:(.text+0x8a0): undefined reference to `spi_slave_abort'
drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_spi_driver_init':
olpc-xo175-ec.c:(.init.text+0x14): undefined reference to `__spi_register_driver'

We should depends on CONFIG_SPI_SLAVE other than directly select it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 0c3d931b3ab9 ("Platform: OLPC: Add XO-1.75 EC driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/olpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfig
index 858ac1d..1d3244a 100644
--- a/drivers/platform/olpc/Kconfig
+++ b/drivers/platform/olpc/Kconfig
@@ -5,7 +5,7 @@ config OLPC_EC
 config OLPC_XO175_EC
 	tristate "OLPC XO 1.75 Embedded Controller"
 	depends on ARCH_MMP || COMPILE_TEST
-	select SPI_SLAVE
+	depends on SPI_SLAVE
 	select OLPC_EC
 	help
 	  Include support for the OLPC XO Embedded Controller (EC). The EC
-- 
2.7.4
