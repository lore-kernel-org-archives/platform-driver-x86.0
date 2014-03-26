From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 7/7] toshiba_acpi: Update version and copyright info
Date: Tue, 25 Mar 2014 20:38:35 -0600
Message-ID: <1395801515-2333-8-git-send-email-coproscefalo@gmail.com>
References: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:38588 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754938AbaCZCjS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 25 Mar 2014 22:39:18 -0400
Received: by mail-ob0-f170.google.com with SMTP id uz6so1728773obc.29
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2014 19:39:18 -0700 (PDT)
In-Reply-To: <1395801515-2333-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Given that some new features were added to the
driver, bump its version to 0.20 and add myself
to the copyright list for these new features
that were added.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c971b0f..c08c12f 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -5,6 +5,7 @@
  *  Copyright (C) 2002-2004 John Belmonte
  *  Copyright (C) 2008 Philip Langdale
  *  Copyright (C) 2010 Pierre Ducroquet
+ *  Copyright (C) 2014 Azael Avalos
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -37,7 +38,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.19"
+#define TOSHIBA_ACPI_VERSION	"0.20"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
1.9.1
