From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v3 2/3] dell-wmi, dell-laptop: select DMI
Date: Tue, 19 Jan 2016 11:07:25 -0800
Message-ID: <01d835ddde1a66b55a689ae01c7fb4e51989f833.1453229127.git.luto@kernel.org>
References: <cover.1453229127.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58918 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757454AbcASTHf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 19 Jan 2016 14:07:35 -0500
In-Reply-To: <cover.1453229127.git.luto@kernel.org>
In-Reply-To: <cover.1453229127.git.luto@kernel.org>
References: <cover.1453229127.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

dell-wmi and dell-laptop will compile but won't work right if DMI
isn't selected.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---

Changes from v1:
 - New patch.

drivers/platform/x86/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f37821f004f9..a2f3dd525559 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -102,6 +102,7 @@ config DELL_LAPTOP
 	select POWER_SUPPLY
 	select LEDS_CLASS
 	select NEW_LEDS
+	select DMI
 	default n
 	---help---
 	This driver adds support for rfkill and backlight control to Dell
@@ -113,6 +114,7 @@ config DELL_WMI
 	depends on INPUT
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	select INPUT_SPARSEKMAP
+	select DMI
 	---help---
 	  Say Y here if you want to support WMI-based hotkeys on Dell laptops.
 
-- 
2.5.0
