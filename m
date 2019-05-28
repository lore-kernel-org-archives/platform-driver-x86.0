From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 2/2] Platform: OLPC: Add INPUT dependencies
Date: Tue, 28 May 2019 17:28:06 +0800
Message-ID: <20190528092806.20080-3-yuehaibing@huawei.com>
References: <20190528092806.20080-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528092806.20080-1-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, lkundrak@v3.sk
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org

Building with CONFIG_INPUT set to m:

drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_complete':
olpc-xo175-ec.c:(.text+0x75d): undefined reference to `input_event'
olpc-xo175-ec.c:(.text+0x76f): undefined reference to `input_event'
olpc-xo175-ec.c:(.text+0x787): undefined reference to `input_event'
olpc-xo175-ec.c:(.text+0x799): undefined reference to `input_event'
drivers/platform/olpc/olpc-xo175-ec.o: In function `olpc_xo175_ec_probe':
olpc-xo175-ec.c:(.text+0x8d5): undefined reference to `devm_input_allocate_device'
olpc-xo175-ec.c:(.text+0x910): undefined reference to `input_set_capability'
olpc-xo175-ec.c:(.text+0x91c): undefined reference to `input_register_device'

This patch add INPUT dependencies to fix this.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 0c3d931b3ab9 ("Platform: OLPC: Add XO-1.75 EC driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/platform/olpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfig
index 1d3244a..1fa676c 100644
--- a/drivers/platform/olpc/Kconfig
+++ b/drivers/platform/olpc/Kconfig
@@ -6,6 +6,7 @@ config OLPC_XO175_EC
 	tristate "OLPC XO 1.75 Embedded Controller"
 	depends on ARCH_MMP || COMPILE_TEST
 	depends on SPI_SLAVE
+	depends on INPUT
 	select OLPC_EC
 	help
 	  Include support for the OLPC XO Embedded Controller (EC). The EC
-- 
2.7.4
