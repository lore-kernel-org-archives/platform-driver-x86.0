From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH 5/5] MAINTAINERS: Update maintainer for dcdbas and dell_rbu
Date: Tue, 25 Sep 2018 14:34:18 -0500
Message-ID: <20180925193418.28493-6-stuart.hayes@dell.com>
References: <20180925193418.28493-1-stuart.hayes@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180925193418.28493-1-stuart.hayes@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

From: Stuart Hayes <stuart.w.hayes@gmail.com>

Assign maintainer for dell_rbu driver, and reassign maintainer of dcdbas
from inactive maintainer (current maintainer is aware of this change--
see https://www.spinics.net/lists/platform-driver-x86/msg16336.html).

Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
---
 MAINTAINERS | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4ece30f15777..455b3fe6954e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4188,6 +4188,12 @@ M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-rbtn.*
 
+DELL REMOTE BIOS UPDATE DRIVER
+M:	Stuart Hayes <stuart.w.hayes@gmail.com>	
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell_rbu.c
+
 DELL LAPTOP SMM DRIVER
 M:	Pali Rohár <pali.rohar@gmail.com>
 S:	Maintained
@@ -4195,10 +4201,11 @@ F:	drivers/hwmon/dell-smm-hwmon.c
 F:	include/uapi/linux/i8k.h
 
 DELL SYSTEMS MANAGEMENT BASE DRIVER (dcdbas)
-M:	Doug Warzecha <Douglas_Warzecha@dell.com>
+M:	Stuart Hayes <stuart.w.hayes@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/dcdbas.txt
-F:	drivers/firmware/dcdbas.*
+F:	drivers/platform/x86/dcdbas.*
 
 DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
-- 
2.19.0.221.g150f307af
