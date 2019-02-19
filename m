From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH 2/2] platform/x86: intel_cht_int33fe: Create fwnode for max17047
Date: Tue, 19 Feb 2019 14:59:59 +0300
Message-ID: <20190219115959.55553-3-heikki.krogerus@linux.intel.com>
References: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190219115959.55553-1-heikki.krogerus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy@infradead.org>, Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Creating a software node for max17047 when ACPI tables don't
have a device node for it.

While here, moving max17047 handling to its own function.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/platform/x86/intel_cht_int33fe.c | 86 +++++++++++++++---------
 1 file changed, 53 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
index 4857a57cfff5..81721976b00c 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe.c
@@ -34,6 +34,7 @@ struct cht_int33fe_data {
 	struct i2c_client *pi3usb30532;
 	struct fwnode_handle *port_node;
 	struct fwnode_handle *fusb302_node;
+	struct fwnode_handle *max17047_node;
 	/* Contain a list-head must be per device */
 	struct device_connection connections[4];
 };
@@ -66,14 +67,6 @@ static int cht_int33fe_check_for_max17047(struct device *dev, void *data)
 	return 1;
 }
 
-static struct i2c_client *cht_int33fe_find_max17047(void)
-{
-	struct i2c_client *max17047 = NULL;
-
-	i2c_for_each_dev(&max17047, cht_int33fe_check_for_max17047);
-	return max17047;
-}
-
 static const char * const max17047_suppliers[] = { "bq24190-charger" };
 
 static const struct property_entry max17047_props[] = {
@@ -81,6 +74,43 @@ static const struct property_entry max17047_props[] = {
 	{ }
 };
 
+static int
+cht_int33fe_max17047(struct device *dev, struct cht_int33fe_data *data)
+{
+	struct i2c_client *max17047 = NULL;
+	struct i2c_board_info board_info;
+	int ret;
+
+	i2c_for_each_dev(&max17047, cht_int33fe_check_for_max17047);
+	if (max17047) {
+		/* Pre-existing i2c-client for the max17047, add device-props */
+		ret = device_add_properties(&max17047->dev, max17047_props);
+		if (ret)
+			return ret;
+		/* And re-probe to get the new device-props applied. */
+		ret = device_reprobe(&max17047->dev);
+		if (ret)
+			dev_warn(dev, "Reprobing max17047 error: %d\n", ret);
+		return 0;
+	}
+
+	data->max17047_node = fwnode_create_software_node(max17047_props, NULL);
+	if (IS_ERR(data->max17047_node))
+		return PTR_ERR(data->max17047_node);
+
+	memset(&board_info, 0, sizeof(board_info));
+	strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
+	board_info.dev_name = "max17047";
+	board_info.fwnode = data->max17047_node;
+	data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
+	if (IS_ERR(data->max17047)) {
+		fwnode_remove_software_node(data->max17047_node);
+		return PTR_ERR(data->max17047);
+	}
+
+	return 0;
+}
+
 static const struct property_entry fusb302_props[] = {
 	PROPERTY_ENTRY_STRING("linux,extcon-name", "cht_wcove_pwrsrc"),
 	{ }
@@ -114,7 +144,6 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct i2c_board_info board_info;
 	struct cht_int33fe_data *data;
-	struct i2c_client *max17047;
 	struct regulator *regulator;
 	unsigned long long ptyp;
 	acpi_status status;
@@ -174,38 +203,25 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	/* Work around BIOS bug, see comment on cht_int33fe_find_max17047 */
+	ret = cht_int33fe_max17047(dev, data);
+	if (ret)
+		return ret;
+
 	/* Node for the FUSB302 controller */
 	data->fusb302_node = fwnode_create_software_node(fusb302_props, NULL);
-	if (IS_ERR(data->fusb302_node))
-		return PTR_ERR(data->fusb302_node);
+	if (IS_ERR(data->fusb302_node)) {
+		ret = PTR_ERR(data->fusb302_node);
+		goto out_remove_max17047_node;
+	}
 
 	/* Node for the connector (FUSB302 is the parent) */
 	data->port_node = fwnode_create_software_node(usb_connector_props,
 						      data->fusb302_node);
 	if (IS_ERR(data->port_node)) {
 		fwnode_remove_software_node(data->fusb302_node);
-		return PTR_ERR(data->port_node);
-	}
-
-	/* Work around BIOS bug, see comment on cht_int33fe_find_max17047 */
-	max17047 = cht_int33fe_find_max17047();
-	if (max17047) {
-		/* Pre-existing i2c-client for the max17047, add device-props */
-		ret = device_add_properties(&max17047->dev, max17047_props);
-		if (ret)
-			return ret;
-		/* And re-probe to get the new device-props applied. */
-		ret = device_reprobe(&max17047->dev);
-		if (ret)
-			dev_warn(dev, "Reprobing max17047 error: %d\n", ret);
-	} else {
-		memset(&board_info, 0, sizeof(board_info));
-		strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
-		board_info.dev_name = "max17047";
-		board_info.properties = max17047_props;
-		data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
-		if (IS_ERR(data->max17047))
-			return PTR_ERR(data->max17047);
+		ret = PTR_ERR(data->port_node);
+		goto out_remove_max17047_node;
 	}
 
 	data->connections[0].endpoint[0] = "port0";
@@ -256,6 +272,9 @@ static int cht_int33fe_probe(struct platform_device *pdev)
 	fwnode_remove_software_node(data->port_node);
 	fwnode_remove_software_node(data->fusb302_node);
 
+out_remove_max17047_node:
+	fwnode_remove_software_node(data->max17047_node);
+
 	return ret;
 }
 
@@ -270,6 +289,7 @@ static int cht_int33fe_remove(struct platform_device *pdev)
 	device_connections_remove(data->connections);
 	fwnode_remove_software_node(data->port_node);
 	fwnode_remove_software_node(data->fusb302_node);
+	fwnode_remove_software_node(data->max17047_node);
 
 	return 0;
 }
-- 
2.20.1
