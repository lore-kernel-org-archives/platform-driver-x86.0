From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] eeepc-laptop: constify platform_attribute_group
Date: Fri, 23 Jun 2017 14:40:51 +0530
Message-ID: <9baf6855f23251fed917c90596ea9c6f17d9b9c0.1498208487.git.arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36573 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754032AbdFWJLe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jun 2017 05:11:34 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

File size before:
   text	   data	    bss	    dec	    hex	filename
   9934	   1136	      2	  11072	   2b40	drivers/platform/x86/eeepc-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   9998	   1072	      2	  11072	   2b40	drivers/platform/x86/eeepc-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index 2426399..5a68196 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -445,7 +445,7 @@ static ssize_t cpufv_disabled_store(struct device *dev,
 	NULL
 };
 
-static struct attribute_group platform_attribute_group = {
+static const struct attribute_group platform_attribute_group = {
 	.attrs = platform_attributes
 };
 
-- 
1.9.1
