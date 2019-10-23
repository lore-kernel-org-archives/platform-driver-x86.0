From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v6 13/15] platform/x86: intel_cht_int33fe: use inline reference properties
Date: Wed, 23 Oct 2019 13:02:31 -0700
Message-ID: <20191023200233.86616-14-dmitry.torokhov@gmail.com>
References: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191023200233.86616-1-dmitry.torokhov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Now that static device properties allow defining reference properties
together with all other types of properties, instead of managing them
separately, let's adjust the driver.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../platform/x86/intel_cht_int33fe_typec.c    | 81 ++++++++++---------
 1 file changed, 41 insertions(+), 40 deletions(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
index 2d097fc2dd46..04138215956b 100644
--- a/drivers/platform/x86/intel_cht_int33fe_typec.c
+++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
@@ -36,30 +36,6 @@ enum {
 	INT33FE_NODE_MAX,
 };
 
-static const struct software_node nodes[];
-
-static const struct software_node_ref_args pi3usb30532_ref = {
-	&nodes[INT33FE_NODE_PI3USB30532]
-};
-
-static const struct software_node_ref_args dp_ref = {
-	&nodes[INT33FE_NODE_DISPLAYPORT]
-};
-
-static struct software_node_ref_args mux_ref;
-
-static const struct software_node_reference usb_connector_refs[] = {
-	{ "orientation-switch", 1, &pi3usb30532_ref},
-	{ "mode-switch", 1, &pi3usb30532_ref},
-	{ "displayport", 1, &dp_ref},
-	{ }
-};
-
-static const struct software_node_reference fusb302_refs[] = {
-	{ "usb-role-switch", 1, &mux_ref},
-	{ }
-};
-
 /*
  * Grrr I severly dislike buggy BIOS-es. At least one BIOS enumerates
  * the max17047 both through the INT33FE ACPI device (it is right there
@@ -95,8 +71,18 @@ static const struct property_entry max17047_props[] = {
 	{ }
 };
 
+/*
+ * We are not using inline property here because those are constant,
+ * and we need to adjust this one at runtime to point to real
+ * software node.
+ */
+static struct software_node_ref_args fusb302_mux_refs[] = {
+	{ .node = NULL },
+};
+
 static const struct property_entry fusb302_props[] = {
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "cht_wcove_pwrsrc"),
+	PROPERTY_ENTRY_REF_ARRAY("usb-role-switch", fusb302_mux_refs),
 	{ }
 };
 
@@ -112,6 +98,8 @@ static const u32 snk_pdo[] = {
 	PDO_VAR(5000, 12000, 3000),
 };
 
+static const struct software_node nodes[];
+
 static const struct property_entry usb_connector_props[] = {
 	PROPERTY_ENTRY_STRING("data-role", "dual"),
 	PROPERTY_ENTRY_STRING("power-role", "dual"),
@@ -119,15 +107,21 @@ static const struct property_entry usb_connector_props[] = {
 	PROPERTY_ENTRY_U32_ARRAY("source-pdos", src_pdo),
 	PROPERTY_ENTRY_U32_ARRAY("sink-pdos", snk_pdo),
 	PROPERTY_ENTRY_U32("op-sink-microwatt", 2500000),
+	PROPERTY_ENTRY_REF("orientation-switch",
+			   &nodes[INT33FE_NODE_PI3USB30532]),
+	PROPERTY_ENTRY_REF("mode-switch",
+			   &nodes[INT33FE_NODE_PI3USB30532]),
+	PROPERTY_ENTRY_REF("displayport",
+			   &nodes[INT33FE_NODE_DISPLAYPORT]),
 	{ }
 };
 
 static const struct software_node nodes[] = {
-	{ "fusb302", NULL, fusb302_props, fusb302_refs },
+	{ "fusb302", NULL, fusb302_props },
 	{ "max17047", NULL, max17047_props },
 	{ "pi3usb30532" },
 	{ "displayport" },
-	{ "connector", &nodes[0], usb_connector_props, usb_connector_refs },
+	{ "connector", &nodes[0], usb_connector_props },
 	{ }
 };
 
@@ -163,9 +157,10 @@ static void cht_int33fe_remove_nodes(struct cht_int33fe_data *data)
 {
 	software_node_unregister_nodes(nodes);
 
-	if (mux_ref.node) {
-		fwnode_handle_put(software_node_fwnode(mux_ref.node));
-		mux_ref.node = NULL;
+	if (fusb302_mux_refs[0].node) {
+		fwnode_handle_put(
+			software_node_fwnode(fusb302_mux_refs[0].node));
+		fusb302_mux_refs[0].node = NULL;
 	}
 
 	if (data->dp) {
@@ -177,25 +172,31 @@ static void cht_int33fe_remove_nodes(struct cht_int33fe_data *data)
 
 static int cht_int33fe_add_nodes(struct cht_int33fe_data *data)
 {
+	const struct software_node *mux_ref_node;
 	int ret;
 
-	ret = software_node_register_nodes(nodes);
-	if (ret)
-		return ret;
-
-	/* The devices that are not created in this driver need extra steps. */
-
 	/*
 	 * There is no ACPI device node for the USB role mux, so we need to wait
 	 * until the mux driver has created software node for the mux device.
 	 * It means we depend on the mux driver. This function will return
 	 * -EPROBE_DEFER until the mux device is registered.
 	 */
-	mux_ref.node = software_node_find_by_name(NULL, "intel-xhci-usb-sw");
-	if (!mux_ref.node) {
-		ret = -EPROBE_DEFER;
-		goto err_remove_nodes;
-	}
+	mux_ref_node = software_node_find_by_name(NULL, "intel-xhci-usb-sw");
+	if (!mux_ref_node)
+		return -EPROBE_DEFER;
+
+	/*
+	 * Update node used in "usb-role-switch" property. Note that we
+	 * rely on software_node_register_nodes() to use the original
+	 * instance of properties instead of copying them.
+	 */
+	fusb302_mux_refs[0].node = mux_ref_node;
+
+	ret = software_node_register_nodes(nodes);
+	if (ret)
+		return ret;
+
+	/* The devices that are not created in this driver need extra steps. */
 
 	/*
 	 * The DP connector does have ACPI device node. In this case we can just
-- 
2.23.0.866.gb869b98d4c-goog
