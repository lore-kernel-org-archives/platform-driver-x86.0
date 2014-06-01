From: Matthew Garrett <matthew.garrett@nebula.com>
Subject: [PATCH 08/11] apple-gmux: Add support for the switch_ddc callback
Date: Sun,  1 Jun 2014 12:38:40 -0400
Message-ID: <1401640723-2058-9-git-send-email-matthew.garrett@nebula.com>
References: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:60137 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752669AbaFAQj2 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 1 Jun 2014 12:39:28 -0400
In-Reply-To: <1401640723-2058-1-git-send-email-matthew.garrett@nebula.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>

We can switch DDC pins in a way that ought (with luck) to work for LVDS.
This isn't sufficient for eDP, which is addressed in later patches.

Signed-off-by: Matthew Garrett <matthew.garrett@nebula.com>
---
 drivers/platform/x86/apple-gmux.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index b9429fb..5594cbc 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -271,6 +271,16 @@ static const struct backlight_ops gmux_bl_ops = {
 	.update_status = gmux_update_status,
 };
 
+static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
+{
+	if (id == VGA_SWITCHEROO_IGD)
+		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 1);
+	else
+		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 2);
+
+	return 0;
+}
+
 static int gmux_switchto(enum vga_switcheroo_client_id id)
 {
 	if (id == VGA_SWITCHEROO_IGD) {
@@ -346,6 +356,7 @@ gmux_active_client(struct apple_gmux_data *gmux_data)
 
 static struct vga_switcheroo_handler gmux_handler = {
 	.switchto = gmux_switchto,
+	.switch_ddc = gmux_switch_ddc,
 	.power_state = gmux_set_power_state,
 	.get_client_id = gmux_get_client_id,
 };
-- 
1.8.5.3
