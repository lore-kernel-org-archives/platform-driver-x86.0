From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 02/19] sony-laptop: fix return path when no ACPI buffer is allocated
Date: Sat, 19 May 2012 22:35:45 +0900
Message-ID: <1337434562-12283-3-git-send-email-malattia@linux.it>
References: <1337434562-12283-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:47657 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758591Ab2ESNpQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 May 2012 09:45:16 -0400
In-Reply-To: <1337434562-12283-1-git-send-email-malattia@linux.it>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

The goto target location would still try to free a buffer that was
never allocated.

Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index c6dc3f7..455beeb 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -1349,8 +1349,8 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
 
 	device_enum = (union acpi_object *) buffer.pointer;
 	if (!device_enum) {
-		pr_err("No SN06 return object\n");
-		goto out_no_enum;
+		pr_err("No SN06 return object.");
+		return;
 	}
 	if (device_enum->type != ACPI_TYPE_BUFFER) {
 		pr_err("Invalid SN06 return object 0x%.2x\n",
-- 
1.7.10
