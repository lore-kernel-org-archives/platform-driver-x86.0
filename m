From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 09/11] apple-gmux: Assign apple_gmux_data before registering
Date: Sun,  1 Jun 2014 12:38:41 -0400
Message-ID: <1401640723-2058-10-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60157 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752540AbaFAQjf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:35 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

Registering the handler after both GPUs will trigger a DDC switch for
connector reprobing. This will oops if apple_gmux_data hasn't already been
assigned. Reorder the code to do that.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/apple-gmux.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 5594cbc..e9b6d77 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -563,18 +563,20 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		gmux_data->gpe = -1;
 	}
 
+	apple_gmux_data = gmux_data;
+	init_completion(&gmux_data->powerchange_done);
+	gmux_enable_interrupts(gmux_data);
+
 	if (vga_switcheroo_register_handler(&gmux_handler)) {
 		ret = -ENODEV;
 		goto err_register_handler;
 	}
 
-	init_completion(&gmux_data->powerchange_done);
-	apple_gmux_data = gmux_data;
-	gmux_enable_interrupts(gmux_data);
-
 	return 0;
 
 err_register_handler:
+	gmux_disable_interrupts(gmux_data);
+	apple_gmux_data = NULL;
 	if (gmux_data->gpe >= 0)
 		acpi_disable_gpe(NULL, gmux_data->gpe);
 err_enable_gpe:
-- 
1.8.5.3
