From: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
Subject: [PATCH] eeepc-laptop: fix a Wuninitialized warning
Date: Fri, 12 Sep 2014 16:44:26 +0800
Message-ID: <1410511466-1070-1-git-send-email-chenhanxiao@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cn.fujitsu.com ([59.151.112.132]:11316 "EHLO
	heian.cn.fujitsu.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752859AbaILIoL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 12 Sep 2014 04:44:11 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, Chen Hanxiao <chenhanxiao@cn.fujitsu.com>

Signed-off-by: Chen Hanxiao <chenhanxiao@cn.fujitsu.com>
---
 drivers/platform/x86/eeepc-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x86/eeepc-laptop.c
index bd533c2..738fc0c 100644
--- a/drivers/platform/x86/eeepc-laptop.c
+++ b/drivers/platform/x86/eeepc-laptop.c
@@ -276,7 +276,7 @@ static ssize_t store_sys_acpi(struct device *dev, int cm,
 			      const char *buf, size_t count)
 {
 	struct eeepc_laptop *eeepc = dev_get_drvdata(dev);
-	int rv, value;
+	int rv, value = -1;
 
 	rv = parse_arg(buf, count, &value);
 	if (rv > 0)
-- 
1.9.0
