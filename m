From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v5 04/12] apple-gmux: Add switch_ddc support
Date: Mon, 11 Jan 2016 20:09:20 +0100
Message-ID: <17fe8bfb0415d713bb4174f84ac9aae5d7d9a5f8.1452525860.git.lukas@wunner.de>
References: <cover.1452525860.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout1.hostsharing.net ([83.223.95.204]:57719 "EHLO
	mailout1.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934275AbcAKTKc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 14:10:32 -0500
In-Reply-To: <cover.1452525860.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
Cc: Seth Forshee <seth.forshee@canonical.com>, Darren Hart <dvhart@infradead.org>

Originally by Seth Forshee <seth.forshee@canonical.com>, 2012-10-04:
    The gmux allows muxing the DDC independently from the display, so
    support this functionality. This will allow reading the EDID for the
    inactive GPU, fixing issues with machines that either don't have a
    VBT or have invalid mode data in the VBT.

Modified by Lukas Wunner <lukas@wunner.de>, 2015-04 - 2015-12:
    Change semantics of ->switch_ddc handler callback to return previous
    DDC owner. Original version tried to determine previous DDC owner
    with find_active_client() in vga_switcheroo but this fails if the
    inactive client registers before the active client.

    v2.4: Retain semantics of ->switchto handler callback to switch all
          pins, including DDC (Daniel Vetter)

    v4:   Advertise ->switch_ddc handler callback only on the pre-retina
          Macbook Pro. The retina uses eDP instead of LVDS and gmux no
          longer does the muxing itself but merely controls an external
          mux. That mux is incapable of switching the AUX channel
          separately from the main link. It's an NXP CBTL06142
          (alternate parts: TI HD3SS212, Pericom PI3VDP12412,
          see datasheets below).

    v5:   Rebase on "apple-gmux: Track switch state".
          Rebase on "vga_switcheroo: Add handler flags infrastructure".
          Rebase on 5d170139eb10 ("Constify vga_switcheroo_handler"),
          requires 2 structs, 1x with ->switchto for pre-retinas,
          1x without for retinas).
          Add error message if handler registration with vga_switcheroo
          fails.

    Teardowns identifying the mux:
    http://www.electronicproducts.com/-whatsinside_text-145.aspx
    http://slideshare.net/jjwu6266/apple-2012-wwdc-apple-macbook-pro-with-retina-display
    http://www.techrepublic.com/blog/cracking-open/teardown-shows-retina-macbook-pro-is-nearly-impossible-to-upgrade-difficult-to-work-on/

    Mux Datasheets:
    http://www.nxp.com/documents/data_sheet/CBTL06141.pdf
    http://www.ti.com/lit/ds/symlink/hd3ss212.pdf
    https://www.pericom.com/assets/Datasheets/PI3VDP12412.pdf

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=88861
Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=61115
Tested-by: Lukas Wunner <lukas@wunner.de>
    [MBP  9,1 2012  intel IVB + nvidia GK107  pre-retina  15"]
Cc: Seth Forshee <seth.forshee@canonical.com>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/platform/x86/apple-gmux.c | 45 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 5c6c708..1384a39 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -417,6 +417,25 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 	return 0;
 }
 
+static int gmux_switch_ddc(enum vga_switcheroo_client_id id)
+{
+	enum vga_switcheroo_client_id old_ddc_owner =
+		apple_gmux_data->switch_state_ddc;
+
+	if (id == old_ddc_owner)
+		return id;
+
+	pr_debug("Switching DDC from %d to %d\n", old_ddc_owner, id);
+	apple_gmux_data->switch_state_ddc = id;
+
+	if (id == VGA_SWITCHEROO_IGD)
+		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 1);
+	else
+		gmux_write8(apple_gmux_data, GMUX_PORT_SWITCH_DDC, 2);
+
+	return old_ddc_owner;
+}
+
 /**
  * DOC: Power control
  *
@@ -474,12 +493,19 @@ static int gmux_get_client_id(struct pci_dev *pdev)
 		return VGA_SWITCHEROO_DIS;
 }
 
-static const struct vga_switcheroo_handler gmux_handler = {
+static const struct vga_switcheroo_handler gmux_handler_indexed = {
 	.switchto = gmux_switchto,
 	.power_state = gmux_set_power_state,
 	.get_client_id = gmux_get_client_id,
 };
 
+static const struct vga_switcheroo_handler gmux_handler_classic = {
+	.switchto = gmux_switchto,
+	.switch_ddc = gmux_switch_ddc,
+	.power_state = gmux_set_power_state,
+	.get_client_id = gmux_get_client_id,
+};
+
 /**
  * DOC: Interrupt
  *
@@ -730,8 +756,21 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	gmux_enable_interrupts(gmux_data);
 	gmux_read_switch_state(gmux_data);
 
-	if (vga_switcheroo_register_handler(&gmux_handler, 0)) {
-		ret = -ENODEV;
+	/*
+	 * Retina MacBook Pros cannot switch the panel's AUX separately
+	 * and need eDP pre-calibration. They are distinguishable from
+	 * pre-retinas by having an "indexed" gmux.
+	 *
+	 * Pre-retina MacBook Pros can switch the panel's DDC separately.
+	 */
+	if (gmux_data->indexed)
+		ret = vga_switcheroo_register_handler(&gmux_handler_indexed,
+					      VGA_SWITCHEROO_NEEDS_EDP_CONFIG);
+	else
+		ret = vga_switcheroo_register_handler(&gmux_handler_classic,
+					      VGA_SWITCHEROO_CAN_SWITCH_DDC);
+	if (ret) {
+		pr_err("Failed to register vga_switcheroo handler\n");
 		goto err_register_handler;
 	}
 
-- 
1.8.5.2 (Apple Git-48)
