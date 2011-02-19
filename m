From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 5/8] sony-laptop: remove unused Type4 define
Date: Sat, 19 Feb 2011 11:52:29 +0900
Message-ID: <1298083952-22493-6-git-send-email-malattia@linux.it>
References: <1298083952-22493-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:60588
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606Ab1BSDAR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Feb 2011 22:00:17 -0500
In-Reply-To: <1298083952-22493-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 1662b05..22519a4 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1442,7 +1442,6 @@ static struct acpi_driver sony_nc_driver = {
 #define SONYPI_DEVICE_TYPE1	0x00000001
 #define SONYPI_DEVICE_TYPE2	0x00000002
 #define SONYPI_DEVICE_TYPE3	0x00000004
-#define SONYPI_DEVICE_TYPE4	0x00000008
 
 #define SONYPI_TYPE1_OFFSET	0x04
 #define SONYPI_TYPE2_OFFSET	0x12
-- 
1.7.2.3
