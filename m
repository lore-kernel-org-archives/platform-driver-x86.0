From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 05/16] asus-wmi: second part of the version starts at 16 not 8
Date: Fri,  1 Jul 2011 11:34:30 +0200
Message-ID: <1309512881-2901-6-git-send-email-corentin.chary@gmail.com>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb1.tech.numericable.fr ([82.216.111.51]:56988 "EHLO
	fb1.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755501Ab1GAJf3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2011 05:35:29 -0400
In-Reply-To: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>

From: Corentin Chary <corentincj@iksaif.net>

Signed-off-by: Corentin Chary <corentincj@iksaif.net>
---
 drivers/platform/x86/asus-wmi.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 35eeb69..688fcf7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1245,7 +1245,7 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 
 	/* We don't know yet what to do with this version... */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_SPEC, 0, 0x9, &rv)) {
-		pr_info("BIOS WMI version: %d.%d", rv >> 8, rv & 0xFF);
+		pr_info("BIOS WMI version: %d.%d", rv >> 16, rv & 0xFF);
 		asus->spec = rv;
 	}
 
-- 
1.7.3.4
