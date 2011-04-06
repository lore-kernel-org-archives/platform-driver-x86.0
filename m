From: Ameya Palande <2ameya@gmail.com>
Subject: [PATCH] platform/x86: Fix Makefile for intel_mid_powerbtn
Date: Wed,  6 Apr 2011 17:45:03 +0300
Message-ID: <1302101103-16896-1-git-send-email-2ameya@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nokia.com ([147.243.128.26]:21274 "EHLO mgw-da02.nokia.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756211Ab1DFOpN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 Apr 2011 10:45:13 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: hong.liu@intel.com

Signed-off-by: Ameya Palande <2ameya@gmail.com>
---
 drivers/platform/x86/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 029e886..662b09a 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -41,4 +41,4 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
 obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
-obj-$(CONFIG_INTEL_MFLD_THERMAL)	+= intel_mid_thermal.o
+obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
-- 
1.7.1
