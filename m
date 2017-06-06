From: "Darren Hart (VMware)" <dvhart@infradead.org>
Subject: [PATCH] platform/x86: wmi*: Add recent copyright statements
Date: Tue, 6 Jun 2017 16:50:20 -0700
Message-ID: <1b4c1bc84ab6f55e9888dca5766eb581e1ad8850.1496792685.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Lutomirski <luto@amacapital.net>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Add copyright statements for Andy Lutomirski and Darren Hart (VMware)
for their contributions to the WMI bus infrastructure and the creation
of the wmi-bmof driver.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
Cc: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/wmi-bmof.c | 1 +
 drivers/platform/x86/wmi.c      | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
index 94922b9..c4530ba 100644
--- a/drivers/platform/x86/wmi-bmof.c
+++ b/drivers/platform/x86/wmi-bmof.c
@@ -2,6 +2,7 @@
  * WMI embedded Binary MOF driver
  *
  * Copyright (c) 2015 Andrew Lutomirski
+ * Copyright (C) 2017 VMware, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify it
  *  under the terms of the GNU General Public License version 2 as published
diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 37f6651..4bfc3b0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -8,6 +8,10 @@
  *   Copyright (c) 2001-2007 Anton Altaparmakov
  *   Copyright (C) 2001,2002 Jakob Kemi <jakob.kemi@telia.com>
  *
+ *  WMI bus infrastructure by Andrew Lutomirski and Darren Hart:
+ *    Copyright (C) 2015 Andrew Lutomirski
+ *    Copyright (C) 2017 VMware, Inc. All Rights Reserved.
+ *
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  *
  *  This program is free software; you can redistribute it and/or modify
-- 
2.9.4


-- 
Darren Hart
VMware Open Source Technology Center
