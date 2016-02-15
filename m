From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v5 2/5] dell-wmi, dell-laptop: select DMI
Date: Mon, 15 Feb 2016 08:32:34 -0800
Message-ID: <f134070fe93b5ce81ceea9071497d853b7e7db9c.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34162 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751303AbcBOQcs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 11:32:48 -0500
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>

dell-wmi and dell-laptop will compile but won't work right if DMI
isn't selected.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Changes from v2 and v3: None

Changes from v1:
 - New patch.

drivers/platform/x86/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3e4d9c3e83fd..659e13b1e6f0 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -112,6 +112,7 @@ config DELL_LAPTOP
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
+	select DMI
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
@@ -123,6 +124,7 @@ config DELL_WMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_SPARSEKMAP
+	select DMI
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
 
-- 
2.5.0
