Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB16C64E7A
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 13:33:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02B1920449
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Dec 2020 13:33:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436913AbgLCNbO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Dec 2020 08:31:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:48858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436902AbgLCNbN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 08:31:13 -0500
From:   Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/14] platform/x86: thinkpad_acpi: Do not report SW_TABLET_MODE on Yoga 11e
Date:   Thu,  3 Dec 2020 08:30:07 -0500
Message-Id: <20201203133010.931600-11-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203133010.931600-1-sashal@kernel.org>
References: <20201203133010.931600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit f2eae1888cf22590c38764b8fa3c989c0283870e ]

The Yoga 11e series has 2 accelerometers described by a BOSC0200 ACPI node.
This setup relies on a Windows service which reads both accelerometers and
then calculates the angle between the 2 halves to determine laptop / tent /
tablet mode and then reports the calculated mode back to the EC by calling
special ACPI methods on the BOSC0200 node.

The bmc150 iio driver does not support this (it involves double
calculations requiring sqrt and arccos so this really needs to be done
in userspace), as a result of this on the Yoga 11e the thinkpad_acpi
code always reports SW_TABLET_MODE=0, starting with GNOME 3.38 reporting
SW_TABLET_MODE=0 causes GNOME to:

1. Not show the onscreen keyboard when a text-input field is focussed
   with the touchscreen.
2. Disable accelerometer based auto display-rotation.

This makes sense when in laptop-mode but not when in tablet-mode. But
since for the Yoga 11e the thinkpad_acpi code always reports
SW_TABLET_MODE=0, GNOME does not know when the device is in tablet-mode.

Stop reporting the broken (always 0) SW_TABLET_MODE on Yoga 11e models
to fix this.

Note there are plans for userspace to support 360 degree hinges style
2-in-1s with 2 accelerometers and figure out the mode by itself, see:
https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/-/issues/216

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20201106140130.46820-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8cc01857bc5c0..79ac62d8ff7ba 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3242,7 +3242,14 @@ static int hotkey_init_tablet_mode(void)
 
 		in_tablet_mode = hotkey_gmms_get_tablet_mode(res,
 							     &has_tablet_mode);
-		if (has_tablet_mode)
+		/*
+		 * The Yoga 11e series has 2 accelerometers described by a
+		 * BOSC0200 ACPI node. This setup relies on a Windows service
+		 * which calls special ACPI methods on this node to report
+		 * the laptop/tent/tablet mode to the EC. The bmc150 iio driver
+		 * does not support this, so skip the hotkey on these models.
+		 */
+		if (has_tablet_mode && !acpi_dev_present("BOSC0200", "1", -1))
 			tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_GMMS;
 		type = "GMMS";
 	} else if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
-- 
2.27.0

