From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 6/7] platform/x86: asus-wmi: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:19 +0530
Message-ID: <1499770100-18632-7-git-send-email-arvind.yadav.cs@gmail.com>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:33726 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932311AbdGKKtU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2017 06:49:20 -0400
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
  13140	    840	      1	  13981	   369d	drivers/platform/x86/asus-wmi.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
  13268	    712	      1	  13981	   368d	drivers/platform/x86/asus-wmi.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6c7d860..709e3a6 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1433,7 +1433,7 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 	return ok ? attr->mode : 0;
 }
 
-static struct attribute_group hwmon_attribute_group = {
+static const struct attribute_group hwmon_attribute_group = {
 	.is_visible = asus_hwmon_sysfs_is_visible,
 	.attrs = hwmon_attributes
 };
@@ -1821,7 +1821,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 	return ok ? attr->mode : 0;
 }
 
-static struct attribute_group platform_attribute_group = {
+static const struct attribute_group platform_attribute_group = {
 	.is_visible = asus_sysfs_is_visible,
 	.attrs = platform_attributes
 };
-- 
1.9.1
