From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH 5/7] platform/x86: panasonic-laptop: constify attribute_group structures.
Date: Tue, 11 Jul 2017 16:18:18 +0530
Message-ID: <1499770100-18632-6-git-send-email-arvind.yadav.cs@gmail.com>
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
   2505	    600	      4	   3109	    c25	drivers/platform/x86/panasonic-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   2569	    536	      4	   3109	    c25	drivers/platform/x86/panasonic-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 76b0a58..5c39b32 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -437,7 +437,7 @@ static ssize_t set_sticky(struct device *dev, struct device_attribute *attr,
 	NULL,
 };
 
-static struct attribute_group pcc_attr_group = {
+static const struct attribute_group pcc_attr_group = {
 	.name	= NULL,		/* put in device directory */
 	.attrs	= pcc_sysfs_entries,
 };
-- 
1.9.1
