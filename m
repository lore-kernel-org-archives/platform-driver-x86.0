From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 7/7] platform/x86: toshiba_acpi: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:20 +0530
Message-ID: <1499770100-18632-8-git-send-email-arvind.yadav.cs@gmail.com>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34827 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932311AbdGKKtO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 06:49:14 -0400
In-Reply-To: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
  26360	   1072	     24	  27456	   6b40	drivers/platform/x86/toshiba_acpi.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
  26424	   1008	     24	  27456	   6b40	drivers/platform/x86/toshiba_acpi.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/toshiba_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 88f9f79..bb1dcd7 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2419,7 +2419,7 @@ static umode_t toshiba_sysfs_is_visible(struct kobject *kobj,
 	return exists ? attr->mode : 0;
 }
 
-static struct attribute_group toshiba_attr_group = {
+static const struct attribute_group toshiba_attr_group = {
 	.is_visible = toshiba_sysfs_is_visible,
 	.attrs = toshiba_attributes,
 };
-- 
1.9.1
