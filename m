From: "Darren Hart (VMware)" <dvhart@infradead.org>
Subject: [PATCH] MAINTAINERS: Include mlxreg.h in Mellanox Platform Driver
 files
Date: Wed, 6 Mar 2019 21:50:32 -0800
Message-ID: <b0b6ac4eee58fbda83574f020d89651a12a8e40f.1551937716.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Pasternak <vadimp@mellanox.com>, andy@infradead.org
List-Id: platform-driver-x86.vger.kernel.org

Avoid conflicts from other subsystems by including the header with the
rest of the driver files.

Cc: Andy Shevchenko <andy@infradead.org>
Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51029a425dbe..eb0b9aba4802 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9711,6 +9711,7 @@ M:	Vadim Pasternak <vadimp@mellanox.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	drivers/platform/mellanox/
+F:	include/linux/platform_data/mlxreg.h
 
 MELLANOX MLX4 core VPI driver
 M:	Tariq Toukan <tariqt@mellanox.com>
-- 
2.17.2


-- 
Darren Hart
VMware Open Source Technology Center
