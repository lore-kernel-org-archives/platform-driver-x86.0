From: Ike Panhc <ike.pan@canonical.com>
Subject: Hi Rene,
Date: Wed, 24 Aug 2011 11:12:42 +0800
Message-ID: <1314155562-4499-1-git-send-email-ike.pan@canonical.com>
References: <CAEWqx59Hr=HBUGyDOstVbr7VEXc2JEaByCJfDZAcce5D3XiF5A@mail.gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50042 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752296Ab1HXDMt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Aug 2011 23:12:49 -0400
In-Reply-To: <CAEWqx59Hr=HBUGyDOstVbr7VEXc2JEaByCJfDZAcce5D3XiF5A@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, xsecute@googlemail.com
Cc: platform-driver-x86@vger.kernel.org

Nice done. Thanks for finding the bug. I write most part of ideapad-laptop.c
though the maintainer is still Matthew.

I think the patch attached below is much simple and we can avoid unnecessary
read_ec_data if blightdev is not set. Since you are the one who find the bug
and have the first patch, I would like to keep you as author and your sign
off. Of course I need your agree. (Hoping I do not break the sign-off rule)

Please review the patch below and reply if you agree with this or disagree.


Hi Matthew,

When acpi_backlight=video, priv->blightdev will be NULL and use it without
checking will cause kernel oops. I suggest we shall have the fix in v3.1
cycle.


====== 8< ======

From 8bd37cd5da31abaca4b906bc84eb45a0834678ea Mon Sep 17 00:00:00 2001
From: Rene Bolldorf <xsecute@googlemail.com>
Date: Wed, 24 Aug 2011 09:56:24 +0800
Subject: [PATCH] ideapad: Check if acpi already handle backlight power in
 'ideapad_backlight_notify_power' to avoid a page fault

This patch avoid a page fault in the ideapad-laptop extras when
turning the backlight power on or off.

Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 0c59541..0d94eec 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -493,6 +493,8 @@ static void ideapad_backlight_notify_power(struct ideapad_private *priv)
 	unsigned long power;
 	struct backlight_device *blightdev = priv->blightdev;
 
+	if (!blightdev)
+		return;
 	if (read_ec_data(ideapad_handle, 0x18, &power))
 		return;
 	blightdev->props.power = power ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
-- 
1.7.5.4
