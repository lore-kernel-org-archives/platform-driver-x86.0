From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: intel_cht_int33fe: Set supplied-from property on max17047 dev
Date: Fri, 26 May 2017 12:53:48 +0200
Message-ID: <20170526105348.16763-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41616 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965647AbdEZKxv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 May 2017 06:53:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Devices with the intel_cht_int33fe ACPI device use a max17047 fuel-gauge
combined with a bq24272i charger, in order for the fuel-gauge driver to
correctly display charging / discharging status it needs to know which
charger is supplying the battery.

This commit sets the supplied-from device property to the name of the
bq24272i charger for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel_cht_int33fe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
index 6a1b2ca5b6fe..da706e2c4232 100644
--- a/drivers/platform/x86/intel_cht_int33fe.c
+++ b/drivers/platform/x86/intel_cht_int33fe.c
@@ -34,6 +34,13 @@ struct cht_int33fe_data {
 	struct i2c_client *pi3usb30532;
 };
 
+static const char * const max17047_suppliers[] = { "bq24190-charger" };
+
+static const struct property_entry max17047_props[] = {
+	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", max17047_suppliers),
+	{ }
+};
+
 static int cht_int33fe_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -70,6 +77,7 @@ static int cht_int33fe_probe(struct i2c_client *client)
 
 	memset(&board_info, 0, sizeof(board_info));
 	strlcpy(board_info.type, "max17047", I2C_NAME_SIZE);
+	board_info.properties = max17047_props;
 
 	data->max17047 = i2c_acpi_new_device(dev, 1, &board_info);
 	if (!data->max17047)
-- 
2.13.0
