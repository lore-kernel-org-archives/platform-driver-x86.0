From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH v2 3/3] toshiba_acpi: Bump driver version and update copyright year
Date: Sun, 19 Jun 2016 17:27:03 -0600
Message-ID: <20160619232703.8820-3-coproscefalo@gmail.com>
References: <20160619232703.8820-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f196.google.com ([209.85.214.196]:36175 "EHLO
	mail-ob0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751408AbcFSX1I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 19:27:08 -0400
In-Reply-To: <20160619232703.8820-1-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

After several fixes, and added support for more features (WWAN,
Cooling Method and IIO accelometer axis data), bump the driver
version to 0.24.

Also update the copyright year.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a9760d2..9c8f349 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -4,7 +4,7 @@
  *  Copyright (C) 2002-2004 John Belmonte
  *  Copyright (C) 2008 Philip Langdale
  *  Copyright (C) 2010 Pierre Ducroquet
- *  Copyright (C) 2014-2015 Azael Avalos
+ *  Copyright (C) 2014-2016 Azael Avalos
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -31,7 +31,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.23"
+#define TOSHIBA_ACPI_VERSION	"0.24"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
2.8.4
