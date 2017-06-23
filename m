From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] platform: x86: toshiba_haps: constify haps_attr_group
Date: Fri, 23 Jun 2017 14:05:56 +0530
Message-ID: <a306a1ed8fd74ec9d9647e96270451b5b4c06edd.1498206793.git.arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:34464 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751217AbdFWIgj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jun 2017 04:36:39 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: coproscefalo@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

File size before:
   text	   data	    bss	    dec	    hex	filename
   1471	    528	      8	   2007	    7d7	drivers/platform/x86/toshiba_haps.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   1519	    464	      8	   1991	    7c7	drivers/platform/x86/toshiba_haps.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/toshiba_haps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index b3dec52..fb27366 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -132,7 +132,7 @@ static ssize_t reset_protection_store(struct device *dev,
 	NULL,
 };
 
-static struct attribute_group haps_attr_group = {
+static const struct attribute_group haps_attr_group = {
 	.attrs = haps_attributes,
 };
 
-- 
1.9.1
