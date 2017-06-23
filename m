From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] msi-laptop: constify *_attribute_group
Date: Fri, 23 Jun 2017 16:06:30 +0530
Message-ID: <3369111af9de4ba057d5f52b8ac71235fd9d130b.1498214112.git.arvind.yadav.cs@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35676 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754654AbdFWKhN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Jun 2017 06:37:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: jlee@suse.com, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

File size before:
   text	   data	    bss	    dec	    hex	filename
   5396	   5016	     85	  10497	   2901	drivers/platform/x86/msi-laptop.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   5524	   4888	     85	  10497	   2901	drivers/platform/x86/msi-laptop.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/platform/x86/msi-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 9e90827..61b9014 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -563,11 +563,11 @@ static DEVICE_ATTR(auto_brightness, 0644, show_auto_brightness,
 	NULL
 };
 
-static struct attribute_group msipf_attribute_group = {
+static const struct attribute_group msipf_attribute_group = {
 	.attrs = msipf_attributes
 };
 
-static struct attribute_group msipf_old_attribute_group = {
+static const struct attribute_group msipf_old_attribute_group = {
 	.attrs = msipf_old_attributes
 };
 
-- 
1.9.1
