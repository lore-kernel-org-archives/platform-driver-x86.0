Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FF3C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 13:38:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21D8623105
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 13:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgLPNig (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPNig (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Dec 2020 08:38:36 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA75C061794
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Dec 2020 05:37:56 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id 51du2400L4C55Sk011du1E; Wed, 16 Dec 2020 14:37:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kpX06-00BB0f-Aw; Wed, 16 Dec 2020 14:37:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kpX05-005Xv1-R3; Wed, 16 Dec 2020 14:37:53 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] platform/surface: SURFACE_PLATFORMS should depend on ACPI
Date:   Wed, 16 Dec 2020 14:37:52 +0100
Message-Id: <20201216133752.1321978-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

All Microsoft Surface platform-specific device drivers depend on ACPI,
but the gatekeeper symbol SURFACE_PLATFORMS does not.  Hence when the
user is configuring a kernel without ACPI support, he is still asked
about Microsoft Surface drivers, even though this question is
irrelevant.

Fix this by moving the dependency on ACPI from the individual driver
symbols to SURFACE_PLATFORMS.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/platform/surface/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
index 33040b0b3b799c2d..2c941cdac9eedc6f 100644
--- a/drivers/platform/surface/Kconfig
+++ b/drivers/platform/surface/Kconfig
@@ -5,6 +5,7 @@
 
 menuconfig SURFACE_PLATFORMS
 	bool "Microsoft Surface Platform-Specific Device Drivers"
+	depends on ACPI
 	default y
 	help
 	  Say Y here to get to see options for platform-specific device drivers
@@ -29,20 +30,19 @@ config SURFACE3_WMI
 
 config SURFACE_3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface 3 tablet"
-	depends on ACPI && KEYBOARD_GPIO && I2C
+	depends on KEYBOARD_GPIO && I2C
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface 3 tablet.
 
 config SURFACE_3_POWER_OPREGION
 	tristate "Surface 3 battery platform operation region support"
-	depends on ACPI && I2C
+	depends on I2C
 	help
 	  This driver provides support for ACPI operation
 	  region of the Surface 3 battery platform driver.
 
 config SURFACE_GPE
 	tristate "Surface GPE/Lid Support Driver"
-	depends on ACPI
 	depends on DMI
 	help
 	  This driver marks the GPEs related to the ACPI lid device found on
@@ -52,7 +52,7 @@ config SURFACE_GPE
 
 config SURFACE_PRO3_BUTTON
 	tristate "Power/home/volume buttons driver for Microsoft Surface Pro 3/4 tablet"
-	depends on ACPI && INPUT
+	depends on INPUT
 	help
 	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
 
-- 
2.25.1

