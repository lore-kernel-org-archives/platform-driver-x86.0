From: Dhaval Shah <dhaval.shah@softnautics.com>
Subject: [PATCH] platform/x86: dell-rbtn: Block comments use * on subsequent lines
Date: Wed, 13 Dec 2017 13:53:01 +0530
Message-ID: <20171213082301.23209-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bo1ind01on0124.outbound.protection.outlook.com ([104.47.101.124]:8594
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750880AbdLMIXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Dec 2017 03:23:16 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: pali.rohar@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dhaval Shah <dhaval.shah@softnautics.com>

Resolved Block comments use * on subsequent lines checkpatch warnings.
Issue found by checkpatch.

Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
---
 drivers/platform/x86/dell-rbtn.c | 26 +++++++++++++-------------
 drivers/platform/x86/dell-rbtn.h | 26 +++++++++++++-------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index f3afe778001e..cab93c6dcd34 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -1,17 +1,17 @@
 /*
-    Dell Airplane Mode Switch driver
-    Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-*/
+ *   Dell Airplane Mode Switch driver
+ *   Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
+ *
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
 
 #include <linux/module.h>
 #include <linux/acpi.h>
diff --git a/drivers/platform/x86/dell-rbtn.h b/drivers/platform/x86/dell-rbtn.h
index c59cc6b8ec2b..46337b22f00d 100644
--- a/drivers/platform/x86/dell-rbtn.h
+++ b/drivers/platform/x86/dell-rbtn.h
@@ -1,17 +1,17 @@
 /*
-    Dell Airplane Mode Switch driver
-    Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
-
-    This program is free software; you can redistribute it and/or modify
-    it under the terms of the GNU General Public License as published by
-    the Free Software Foundation; either version 2 of the License, or
-    (at your option) any later version.
-
-    This program is distributed in the hope that it will be useful,
-    but WITHOUT ANY WARRANTY; without even the implied warranty of
-    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-    GNU General Public License for more details.
-*/
+ *   Dell Airplane Mode Switch driver
+ *   Copyright (C) 2014-2015  Pali Rohár <pali.rohar@gmail.com>
+ *
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ */
 
 #ifndef _DELL_RBTN_H_
 #define _DELL_RBTN_H_
-- 
2.11.0
