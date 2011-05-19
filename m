From: Jean Delvare <khali@linux-fr.org>
Subject: [PATCH] x86: Don't enable EEEPC_LAPTOP in default configs
Date: Thu, 19 May 2011 13:47:01 +0200
Message-ID: <20110519134701.1d3a8d55@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:41011 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061Ab1ESLsc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2011 07:48:32 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: x86@kernel.org, Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Can someone explain why CONFIG_EEEPC_LAPTOP=y in x86/configs/*_defconfig
when all other laptop support is off by default?

Signed-off-by: Jean Delvare <khali@linux-fr.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Garrett <mjg@redhat.com>
---
Already sent on: 2011-04-26. Comments anyone?

 arch/x86/configs/i386_defconfig   |    1 -
 arch/x86/configs/x86_64_defconfig |    1 -
 2 files changed, 2 deletions(-)

--- linux-2.6.39-rc4.orig/arch/x86/configs/i386_defconfig	2011-03-15 19:43:58.000000000 +0100
+++ linux-2.6.39-rc4/arch/x86/configs/i386_defconfig	2011-04-26 18:15:20.000000000 +0200
@@ -267,7 +267,6 @@ CONFIG_EDAC=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_HCTOSYS is not set
 CONFIG_DMADEVICES=y
-CONFIG_EEEPC_LAPTOP=y
 CONFIG_EFI_VARS=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
--- linux-2.6.39-rc4.orig/arch/x86/configs/x86_64_defconfig	2011-03-15 19:43:58.000000000 +0100
+++ linux-2.6.39-rc4/arch/x86/configs/x86_64_defconfig	2011-04-26 18:15:14.000000000 +0200
@@ -268,7 +268,6 @@ CONFIG_EDAC=y
 CONFIG_RTC_CLASS=y
 # CONFIG_RTC_HCTOSYS is not set
 CONFIG_DMADEVICES=y
-CONFIG_EEEPC_LAPTOP=y
 CONFIG_EFI_VARS=y
 CONFIG_EXT3_FS=y
 # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set

-- 
Jean Delvare
