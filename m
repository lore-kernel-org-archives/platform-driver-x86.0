Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649E1C001B0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Jul 2023 18:09:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbjGMSJb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 13 Jul 2023 14:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbjGMSJb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Jul 2023 14:09:31 -0400
X-Greylist: delayed 316 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 13 Jul 2023 11:09:24 PDT
Received: from smtp-out.abv.bg (smtp-out.abv.bg [194.153.145.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6110126AF
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jul 2023 11:09:24 -0700 (PDT)
Received: from nm83.abv.bg (nm83.ni.bg [192.168.151.146])
        by smtp-out.abv.bg (Postfix) with UTF8SMTP id 848531822EF4;
        Thu, 13 Jul 2023 21:04:02 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1689271442; bh=ywZACtYI5HP42DnktRCREwiDQpPzRYNjm5QRLGG/fBE=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=KQzu2SSgVLXDGmYR5kzj0Sef4s5BYthCnaLL+Ua5x3Zoo/Y1sKV5f53aqk1BHYnIv
         RXTvX9fQvIRyL0zBIZMseMpAk8Ff+XTjtgzedX+Sd9sMW8GDroRzJbGAnMbbmj4LXb
         Qj1OVfXs6nNu1HgpgPg/9hxnm682GqYp2cUnfc/0=
Received: from nm83.abv.bg (localhost [127.0.0.1])
        by nm83.abv.bg (Postfix) with UTF8SMTP id 815469D7FB;
        Thu, 13 Jul 2023 21:04:02 +0300 (EEST)
Date:   Thu, 13 Jul 2023 21:04:02 +0300 (EEST)
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     platform-driver-x86@vger.kernel.org
Cc:     luke@ljones.dev, hdegoede@redhat.com
Message-ID: <1170345346.1954736.1689271442530@nm83.abv.bg>
In-Reply-To: <221464915.1954715.1689271415914@nm83.abv.bg>
References: <221464915.1954715.1689271415914@nm83.abv.bg>
Subject: [PATCH] platform/x86: asus-wmi: Allow setting RGB mode on some TUF  laptops
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Mailer: AbvMail 3.0
X-Originating-IP: 84.238.195.102
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch allows for the manual setting of cmd values 0xb3 and 0xb4.
This is necessary on some TUF laptops in order to set the RGB mode.
This should not break functionality that other machines might depend on.


See bug report: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg/


With this you can pass 179 and 180 to the /sys/class/leds interface.
I think a better solution would be to somehow detect which devices require
these values on driver initialization and then just handle it like before
1 saving to bios and 0 simply setting it.


Please CC.


Best regard,


Kristian


Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
---
 drivers/platform/x86/asus-wmi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)


diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 1038dfdcdd32..8d3d283fb306 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -744,7 +744,12 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
 		return -EINVAL;
 
-	cmd = !!cmd;
+	/*
+	 * Some TUF models need B3 for setting the color and B4 for saving to BIOS.
+	 * Keep old functionality for all other values
+	 */
+	if (cmd != 0xb3 || cmd != 0xb4)
+		cmd = !!cmd;
 
 	/* These are the known usable modes across all TUF/ROG */
 	if (mode >= 12 || mode == 9)
-- 
2.40.0

