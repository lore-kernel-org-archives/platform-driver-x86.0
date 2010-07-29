From: Thomas Renninger <trenn@suse.de>
Subject: [PATCH 2/3] hp-wmi: Fix mixing up of and/or directive
Date: Thu, 29 Jul 2010 12:27:59 +0200
Message-ID: <1280399280-31219-3-git-send-email-trenn@suse.de>
References: <1280399280-31219-1-git-send-email-trenn@suse.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:37897 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756564Ab0G2K2K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 29 Jul 2010 06:28:10 -0400
In-Reply-To: <1280399280-31219-1-git-send-email-trenn@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, trenn@suse.de, linux-acpi@vger.kernel.or, mjg@redhat.com

This should have been an "and". Additionally checking for !obj
is even better.

Signed-off-by: Thomas Renninger <trenn@suse.de>
CC: linux-acpi@vger.kernel.or
CC: platform-driver-x86@vger.kernel.org
CC: mjg@redhat.com
---
 drivers/platform/x86/hp-wmi.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 4c30dd3..f324c55 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -470,7 +470,9 @@ static void hp_wmi_notify(u32 value, void *context)
 
 	obj = (union acpi_object *)response.pointer;
 
-	if (obj || obj->type != ACPI_TYPE_BUFFER) {
+	if (!obj)
+		return;
+	if (obj->type != ACPI_TYPE_BUFFER) {
 		printk(KERN_INFO "hp-wmi: Unknown response received %d\n",
 		       obj->type);
 		kfree(obj);
-- 
1.6.3
