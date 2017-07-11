From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 3/7] platform/x86: samsung-laptop: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:16 +0530
Message-ID: <1499770100-18632-4-git-send-email-arvind.yadav.cs@gmail.com>
References: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1499770100-18632-1-git-send-email-arvind.yadav.cs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

attribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
   8710	   5452	     23	  14185	   3769	drivers/platform/x86/samsung-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   8774	   5388	     23	  14185	   3769	drivers/platform/x86/samsung-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/samsung-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
index 5c4dfe4..0c703fe 100644
--- a/drivers/platform/x86/samsung-laptop.c
+++ b/drivers/platform/x86/samsung-laptop.c
@@ -1232,7 +1232,7 @@ static umode_t samsung_sysfs_is_visible(struct kobject *kobj,
 	return ok ? attr->mode : 0;
 }
 
-static struct attribute_group platform_attribute_group = {
+static const struct attribute_group platform_attribute_group = {
 	.is_visible = samsung_sysfs_is_visible,
 	.attrs = platform_attributes
 };
-- 
1.9.1
