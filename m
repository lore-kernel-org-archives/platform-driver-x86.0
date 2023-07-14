Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636E3EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 14 Jul 2023 20:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236420AbjGNUpP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jul 2023 16:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236439AbjGNUpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 16:45:13 -0400
Received: from pop36.abv.bg (pop36.abv.bg [194.153.145.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0466CE74
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 13:45:05 -0700 (PDT)
Received: from smtp.abv.bg (localhost [127.0.0.1])
        by pop36.abv.bg (Postfix) with ESMTP id F40A71805D2F;
        Fri, 14 Jul 2023 23:45:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1689367502; bh=vT1EJWWnF7JyoUzwaS/YFuO2RxGAteRXhIV3I1M0Vvk=;
        h=Date:From:To:Cc:Subject:From;
        b=opi8o9VKOatt1+ldANXhvumJQxC9upePL4qTqxG8W0QQd+tz4FqrmzkiEBoilYsKN
         4RrPN3Z/VD4cpwAtiV3p8YWqv3B7ZSV8m0zRtu4h/Z3z9LbglHpgUOD03hkAsGsDqO
         FQSgQvAdeH63vANnHOnzdRn+jpumg8XBpQQVvHyk=
X-HELO: wyvern.localdomain
Authentication-Results: smtp.abv.bg; auth=pass (login) smtp.auth=kristiana2000@abv.bg
Received: from 84-238-195-102.ip.btc-net.bg (HELO wyvern.localdomain) (84.238.195.102)
 by smtp.abv.bg (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted); Fri, 14 Jul 2023 23:45:01 +0300
Date:   Fri, 14 Jul 2023 23:44:54 +0300
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     luke@ljones.dev
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
Subject: [PATCH v2] platform/x86: asus-wmi: Fix setting RGB mode on some TUF
 laptops
Message-ID: <ZLGzxoJN_7Dhl_si@wyvern.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch fixes setting the cmd values to 0xb3 and 0xb4.
This is necessary on some TUF laptops in order to set the RGB mode.

Closes: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
---
 V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
 
 drivers/platform/x86/asus-wmi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 1038dfdcdd32..eb82ed723b42 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -738,13 +738,22 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 cmd, mode, r, g,  b,  speed;
+	u32 cmd, mode, r, g, b, speed;
 	int err;
 
 	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
 		return -EINVAL;
 
-	cmd = !!cmd;
+	/* B3 is set and B4 is save to BIOS. Only set by default*/
+	switch (cmd) {
+	default:
+	case 0:
+		cmd = 0xb3;
+		break;
+	case 1:
+		cmd = 0xb4;
+		break;
+	}
 
 	/* These are the known usable modes across all TUF/ROG */
 	if (mode >= 12 || mode == 9)
-- 
2.40.0

