From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 6/6] toshiba_acpi: Bump version number to 0.21
Date: Sat, 31 Jan 2015 12:41:28 -0700
Message-ID: <1422733288-11733-7-git-send-email-coproscefalo@gmail.com>
References: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:62598 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755938AbbAaTlo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 31 Jan 2015 14:41:44 -0500
In-Reply-To: <1422733288-11733-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

Several new features were added on previous patches, so lets bump up
the driver version.

And also, update the copyright year.

Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index c5b1ab5..8b4a78b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -5,7 +5,7 @@
  *  Copyright (C) 2002-2004 John Belmonte
  *  Copyright (C) 2008 Philip Langdale
  *  Copyright (C) 2010 Pierre Ducroquet
- *  Copyright (C) 2014 Azael Avalos
+ *  Copyright (C) 2014-2015 Azael Avalos
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -38,7 +38,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#define TOSHIBA_ACPI_VERSION	"0.20"
+#define TOSHIBA_ACPI_VERSION	"0.21"
 #define PROC_INTERFACE_VERSION	1
 
 #include <linux/kernel.h>
-- 
2.2.2
