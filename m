From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 11/11] apple_gmux: Wait for switch completion
Date: Sun,  1 Jun 2014 12:38:43 -0400
Message-ID: <1401640723-2058-12-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60244 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751742AbaFAQy1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:54:27 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

The GMUX doesn't appear to switch instantly, which can trigger problems in
panel detection and setup. Wait for an interrupt or 200msec, whichever comes
first.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/apple-gmux.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 17f906d..6826ede 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -38,6 +38,7 @@ struct apple_gmux_data {
 	int gpe;
 	enum vga_switcheroo_client_id resume_client_id;
 	enum vga_switcheroo_state power_state;
+	struct completion switch_done;
 	struct completion powerchange_done;
 };
 
@@ -283,6 +284,8 @@ static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
 
 static int gmux_switchto(enum vga_switcheroo_client_id id)
 {
+	reinit_completion(&apple_gmux_data->switch_done);
+
 	if (id == VGA_SWITCHEROO_IGD) {
 		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 1);
 		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DISPLAY, 2);
@@ -293,6 +296,11 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
 	}
 
+	if (apple_gmux_data->gpe >= 0 &&
+	    !wait_for_completion_interruptible_timeout(&apple_gmux_data->switch_done,
+						       msecs_to_jiffies(200)))
+		pr_warn("Timeout waiting for gmux GPU switch to complete\n");
+
 	return 0;
 }
 
@@ -401,6 +409,9 @@ static void gmux_notify_handler(acpi_handle device, u32 value, void *context)
 	gmux_clear_interrupts(gmux_data);
 	gmux_enable_interrupts(gmux_data);
 
+	if (status & GMUX_INTERRUPT_STATUS_DISPLAY)
+		complete(&gmux_data->switch_done);
+
 	if (status & GMUX_INTERRUPT_STATUS_POWER)
 		complete(&gmux_data->powerchange_done);
 }
@@ -565,6 +576,7 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	}
 
 	apple_gmux_data = gmux_data;
+	init_completion(&gmux_data->switch_done);
 	init_completion(&gmux_data->powerchange_done);
 	gmux_enable_interrupts(gmux_data);
 
-- 
1.8.5.3
