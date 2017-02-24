From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 2/5] apple-gmux: Don't switch external DP port on 2011+
 MacBook Pros
Date: Fri, 24 Feb 2017 20:19:45 +0100
Message-ID: <8c06c7eaf3d4a6ec3e2d75191ef26ebd554c24db.1487938188.git.lukas@wunner.de>
References: <cover.1487938188.git.lukas@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:39227 "EHLO
        mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750995AbdBXTUN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Feb 2017 14:20:13 -0500
In-Reply-To: <cover.1487938188.git.lukas@wunner.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dri-devel@lists.freedesktop.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

On MacBook Pros introduced 2011 and onward, external DP ports are
combined DP/Thunderbolt ports that are no longer fully switchable
between GPUs, they can only be driven by the discrete GPU.

More specifically, the Main Link pins (which transport the actual video
and audio streams) are soldered to the discrete GPU, whereas the AUX
Channel pins are switchable. Because the integrated GPU is missing the
Main Link, external displays appear to it as phantoms which fail to
link-train.

Force the AUX channel to the discrete GPU on these models to avoid any
confusion. Document the switching policy implemented by this commit.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/platform/x86/apple-gmux.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index a66be137324c..623d322447a2 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -60,6 +60,7 @@ struct apple_gmux_data {
 	/* switcheroo data */
 	acpi_handle dhandle;
 	int gpe;
+	bool external_switchable;
 	enum vga_switcheroo_client_id switch_state_display;
 	enum vga_switcheroo_client_id switch_state_ddc;
 	enum vga_switcheroo_client_id switch_state_external;
@@ -358,6 +359,19 @@ static const struct backlight_ops gmux_bl_ops = {
  * ports while the discrete GPU is asleep, but currently we do not make use
  * of this feature.
  *
+ * Our switching policy for the external port is that on those generations
+ * which are able to switch it fully, the port is switched together with the
+ * panel when IGD / DIS commands are issued to vga_switcheroo. It is thus
+ * possible to drive e.g. a beamer on battery power with the integrated GPU.
+ * The user may manually switch to the discrete GPU if more performance is
+ * needed.
+ *
+ * On all newer generations, the external port can only be driven by the
+ * discrete GPU. If a display is plugged in while the panel is switched to
+ * the integrated GPU, *both* GPUs will be in use for maximum performance.
+ * To decrease power consumption, the user may manually switch to the
+ * discrete GPU, thereby suspending the integrated GPU.
+ *
  * gmux' initial switch state on bootup is user configurable via the EFI
  * variable ``gpu-power-prefs-fa4ce28d-b62f-4c99-9cc3-6815686e30f9`` (5th byte,
  * 1 = IGD, 0 = DIS). Based on this setting, the EFI firmware tells gmux to
@@ -414,7 +428,8 @@ static int gmux_switchto(enum vga_switcheroo_client_id id)
 {
 	apple_gmux_data->switch_state_ddc = id;
 	apple_gmux_data->switch_state_display = id;
-	apple_gmux_data->switch_state_external = id;
+	if (apple_gmux_data->external_switchable)
+		apple_gmux_data->switch_state_external = id;
 
 	gmux_write_switch_state(apple_gmux_data);
 
@@ -601,6 +616,11 @@ static struct pci_dev *gmux_get_io_pdev(void)
 	return NULL;
 }
 
+static int is_thunderbolt(struct device *dev, void *data)
+{
+	return to_pci_dev(dev)->is_thunderbolt;
+}
+
 static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 {
 	struct apple_gmux_data *gmux_data;
@@ -755,6 +775,15 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 		gmux_data->gpe = -1;
 	}
 
+	/*
+	 * If Thunderbolt is present, the external DP port is not fully
+	 * switchable. Force its AUX channel to the discrete GPU.
+	 */
+	gmux_data->external_switchable =
+		!bus_for_each_dev(&pci_bus_type, NULL, NULL, is_thunderbolt);
+	if (!gmux_data->external_switchable)
+		gmux_write8(gmux_data, GMUX_PORT_SWITCH_EXTERNAL, 3);
+
 	apple_gmux_data = gmux_data;
 	init_completion(&gmux_data->powerchange_done);
 	gmux_enable_interrupts(gmux_data);
-- 
2.11.0
