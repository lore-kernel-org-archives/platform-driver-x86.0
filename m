From: Prarit Bhargava <prarit@redhat.com>
Subject: [PATCH] x86, wmi fix modalias_show return values
Date: Thu,  3 Oct 2013 19:23:36 -0400
Message-ID: <1380842616-4747-1-git-send-email-prarit@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:9329 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752216Ab3JCXXk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 Oct 2013 19:23:40 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Prarit Bhargava <prarit@redhat.com>, Matthew Garrett <matthew.garrett@nebula.com>

I just fixed this same bug in arch/powerpc/kernel/vio.c and took a quick
look for other similar errors in the kernel.

modalias_show() should return an empty string on error, not errno.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/wmi.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 601ea95..6170b64 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -686,8 +686,10 @@ static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
 	struct wmi_block *wblock;
 
 	wblock = dev_get_drvdata(dev);
-	if (!wblock)
-		return -ENOMEM;
+	if (!wblock) {
+		strcat(buf, "\n");
+		return strlen(buf);
+	}
 
 	wmi_gtoa(wblock->gblock.guid, guid_string);
 
-- 
1.7.9.3
