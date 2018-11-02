From: Peng Hao <peng.hao2@zte.com.cn>
Subject: [PATCH V6 7/8]  misc/pvpanic: convert to SPDX license tags
Date: Fri, 2 Nov 2018 20:56:16 +0800
Message-ID: <1541163378-54047-7-git-send-email-peng.hao2@zte.com.cn>
References: <1541163378-54047-1-git-send-email-peng.hao2@zte.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541163378-54047-1-git-send-email-peng.hao2@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, arnd@arndb.de, gregkh@linuxfoundation.org, andy@infradead.org, dvhart@infradead.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, hutao@cn.fujitsu.com, linux-doc@vger.kernel.org, Peng Hao <peng.hao2@zte.com.cn>
List-Id: platform-driver-x86.vger.kernel.org

Updates license to use SPDX-License-Identifier instead of
verbose license text.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
---
 drivers/misc/pvpanic.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/misc/pvpanic.c b/drivers/misc/pvpanic.c
index 9c9d9f8..1826cdf 100644
--- a/drivers/misc/pvpanic.c
+++ b/drivers/misc/pvpanic.c
@@ -1,22 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  pvpanic.c - pvpanic Device Support
  *
  *  Copyright (C) 2013 Fujitsu.
  *  Copyright (C) 2018 ZTE.
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
1.8.3.1
