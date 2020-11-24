Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B31C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 18:15:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0EB3F206D5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 18:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390718AbgKXSOz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 13:14:55 -0500
Received: from mail1.bemta23.messagelabs.com ([67.219.246.115]:9035 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390837AbgKXSOx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 13:14:53 -0500
Received: from [100.112.4.31] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-c.us-east-1.aws.symcld.net id AC/CB-61101-A9D4DBF5; Tue, 24 Nov 2020 18:14:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsWSLveKTXeW795
  4g+vT+S32X5ew+PrtNrvFm+PTmSw+d0xmsVi95wWzA6vHr21rWDzmnQz0eL/vKpvH501yASxR
  rJl5SfkVCawZD9pXsxassKl4fyG7gfGjURcjF4eQwH9GidVfJjNDOK8YJa4vnMnaxcjJwSagL
  bFlyy+2LkYODhEBGYkPaz1BapgFZjNKLOzbzQgSFxZwlWi4WQFSziKgKrG/8wg7iM0rYCPxfM
  JesDESAvIST3uXM4PYnEA1Z7oes4DYQgIqEvcfLGGDqBeUODnzCVicGai+eetsZghbQuLgixf
  MEHPkJN71TGSHsBMklr28wzyBUWAWkvZZSNpnIWlfwMi8itE0qSgzPaMkNzEzR9fQwEDX0NBI
  11zXxFIvsUo3Wa+0WDc1sbhE11AvsbxYr7gyNzknRS8vtWQTIzDsUwrYDXcwLn7zQe8QoyQHk
  5Ior5v73nghvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErz5XkA5waLU9NSKtMwcYAzCpCU4eJREeA
  94A6V5iwsSc4sz0yFSpxgVpcR5r4MkBEASGaV5cG2wuL/EKCslzMvIwMAgxFOQWpSbWYIq/4p
  RnINRSZi3CGQKT2ZeCdx0YJQC3SzCO51zD8jikkSElFQDk3/mip9tqS9MjStn/2YLqZ682dnZ
  VX3H17ZrPO1nd4dxX61q1G/M8EptWfB/4q3M7KqkLM/+RTOMOJPrdv/f9Xbyq//PvGI3TDh+0
  Lx2e0Tb/2fzbl+t3SSzlPl6yAOWxAze+rQj05sa69NeWCUetd9xd3oKU+jD2VJH9zxcr2G26V
  P8qWRBFuuy9yH/8i8Wchx+0un08+7Wpspnvh15exv4TZqXv6+fNUc46tXiFsXCB8lbXe4Ei+z
  PXOKg67fX7mbVqp5Q/Qr2FwdMFp7aE/xK/ftb/gzfB1/+Td7+10RlTWban6Bz0oaPz0QI/LVr
  nLzKqMbMqr9a8dvS3wE9jXst500IOpNQ+7InOExloRJLcUaioRZzUXEiALD/K6h2AwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-406.messagelabs.com!1606241687!21915!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18798 invoked from network); 24 Nov 2020 18:14:49 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-4.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Nov 2020 18:14:49 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id E52809227D6A59A8AA0D;
        Wed, 25 Nov 2020 02:14:44 +0800 (CST)
Received: from localhost.localdomain.com (10.64.85.8) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Tue, 24 Nov 2020 10:14:41 -0800
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <hadess@hadess.net>,
        <bberg@redhat.com>, <njoshi1@lenovo.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add palm sensor support
Date:   Tue, 24 Nov 2020 13:11:54 -0500
Message-ID: <20201124181154.547518-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.85.8]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support to thinkpad_acpi for returning the status of the palm
sensor.

This patch builds on the work done previously for the input device
implementation (which was not needed). Both lap and palm sensor are using
sysfs and they are combined into the proxsensor block.

Note: On some platforms, because of an issue in the HW implementation,
the palm sensor presence may be incorrectly advertised as always
enabled even if a palm sensor is not present. The palm sensor is
intended for WWAN transmission power control and should be available
and correct on all WWAN enabled systems. It is not recommended to use
this interface for other use cases.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 162 +++++++++++++++++----------
 1 file changed, 103 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e3810675090a..6a4c54db38fb 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4021,6 +4021,7 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 }
 
 static void thermal_dump_all_sensors(void);
+static void palmsensor_refresh(void);
 
 static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
@@ -4087,8 +4088,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 
 	case TP_HKEY_EV_PALM_DETECTED:
 	case TP_HKEY_EV_PALM_UNDETECTED:
-		/* palm detected hovering the keyboard, forward to user-space
-		 * via netlink for consumption */
+		/* palm detected  - pass on to event handler */
+		palmsensor_refresh();
 		return true;
 
 	default:
@@ -9828,102 +9829,146 @@ static struct ibm_struct lcdshadow_driver_data = {
 };
 
 /*************************************************************************
- * DYTC subdriver, for the Lenovo lapmode feature
+ * Thinkpad sensor interfaces
  */
 
 #define DYTC_CMD_GET          2 /* To get current IC function and mode */
 #define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
 
-static bool dytc_lapmode;
+#define PALMSENSOR_PRESENT_BIT 0 /* Determine if psensor present */
+#define PALMSENSOR_ON_BIT      1 /* psensor status */
 
-static void dytc_lapmode_notify_change(void)
-{
-	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
-}
+static bool has_palmsensor;
+static bool has_lapsensor;
+static bool palm_state;
+static bool lap_state;
 
-static int dytc_command(int command, int *output)
+static int lapsensor_get(bool *present, bool *state)
 {
 	acpi_handle dytc_handle;
+	int output;
 
-	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
-		/* Platform doesn't support DYTC */
+	*present = false;
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle)))
 		return -ENODEV;
-	}
-	if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
+	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", DYTC_CMD_GET))
 		return -EIO;
+
+	*present = true; /*If we get his far, we have lapmode support*/
+	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
 	return 0;
 }
 
-static int dytc_lapmode_get(bool *state)
+static int palmsensor_get(bool *present, bool *state)
 {
-	int output, err;
+	acpi_handle psensor_handle;
+	int output;
 
-	err = dytc_command(DYTC_CMD_GET, &output);
-	if (err)
-		return err;
-	*state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
+	*present = false;
+	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "GPSS", &psensor_handle)))
+		return -ENODEV;
+	if (!acpi_evalf(psensor_handle, &output, NULL, "d"))
+		return -EIO;
+
+	*present = output & BIT(PALMSENSOR_PRESENT_BIT) ? true : false;
+	*state = output & BIT(PALMSENSOR_ON_BIT) ? true : false;
 	return 0;
 }
 
-static void dytc_lapmode_refresh(void)
+static void lapsensor_refresh(void)
 {
-	bool new_state;
+	bool state;
 	int err;
 
-	err = dytc_lapmode_get(&new_state);
-	if (err || (new_state == dytc_lapmode))
-		return;
+	if (has_lapsensor) {
+		err = lapsensor_get(&has_lapsensor, &state);
+		if (err)
+			return;
+		if (lap_state != state) {
+			lap_state = state;
+			sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
+		}
+	}
+}
 
-	dytc_lapmode = new_state;
-	dytc_lapmode_notify_change();
+static void palmsensor_refresh(void)
+{
+	bool state;
+	int err;
+
+	if (has_palmsensor) {
+		err = palmsensor_get(&has_palmsensor, &state);
+		if (err)
+			return;
+		if (palm_state != state) {
+			palm_state = state;
+			sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "palmsensor");
+		}
+	}
 }
 
-/* sysfs lapmode entry */
 static ssize_t dytc_lapmode_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
+	if (has_lapsensor)
+		return sysfs_emit(buf, "%d\n", lap_state);
+	return sysfs_emit(buf, "\n");
 }
-
 static DEVICE_ATTR_RO(dytc_lapmode);
 
-static struct attribute *dytc_attributes[] = {
-	&dev_attr_dytc_lapmode.attr,
-	NULL,
-};
-
-static const struct attribute_group dytc_attr_group = {
-	.attrs = dytc_attributes,
-};
+static ssize_t palmsensor_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	if (has_palmsensor)
+		return sysfs_emit(buf, "%d\n", palm_state);
+	return sysfs_emit(buf, "\n");
+}
+static DEVICE_ATTR_RO(palmsensor);
 
-static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
+static int tpacpi_proxsensor_init(struct ibm_init_struct *iibm)
 {
-	int err;
+	int palm_err, lap_err, err;
 
-	err = dytc_lapmode_get(&dytc_lapmode);
-	/* If support isn't available (ENODEV) then don't return an error
-	 * but just don't create the sysfs group
+	palm_err = palmsensor_get(&has_palmsensor, &palm_state);
+	lap_err = lapsensor_get(&has_lapsensor, &lap_state);
+	/*
+	 * If support isn't available (ENODEV) for both devices then quit, but
+	 * don't return an error.
 	 */
-	if (err == -ENODEV)
+	if ((palm_err == -ENODEV) && (lap_err == -ENODEV))
 		return 0;
-	/* For all other errors we can flag the failure */
-	if (err)
-		return err;
-
-	/* Platform supports this feature - create the group */
-	err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
-	return err;
+	/* Otherwise, if there was an error return it */
+	if (palm_err && (palm_err != ENODEV))
+		return palm_err;
+	if (lap_err && (lap_err != ENODEV))
+		return lap_err;
+
+	if (has_palmsensor) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_palmsensor.attr);
+		if (err)
+			return err;
+	}
+	if (has_lapsensor) {
+		err = sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
+		if (err)
+			return err;
+	}
+	return 0;
 }
 
-static void dytc_exit(void)
+static void proxsensor_exit(void)
 {
-	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
+	if (has_lapsensor)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_dytc_lapmode.attr);
+	if (has_palmsensor)
+		sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_palmsensor.attr);
 }
 
-static struct ibm_struct dytc_driver_data = {
-	.name = "dytc",
-	.exit = dytc_exit,
+static struct ibm_struct proxsensor_driver_data = {
+	.name = "proximity-sensor",
+	.exit = proxsensor_exit,
 };
 
 /****************************************************************************
@@ -9975,8 +10020,7 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 	}
 
 	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
-		dytc_lapmode_refresh();
-
+		lapsensor_refresh();
 }
 
 static void hotkey_driver_event(const unsigned int scancode)
@@ -10416,8 +10460,8 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.data = &lcdshadow_driver_data,
 	},
 	{
-		.init = tpacpi_dytc_init,
-		.data = &dytc_driver_data,
+		.init = tpacpi_proxsensor_init,
+		.data = &proxsensor_driver_data,
 	},
 };
 
-- 
2.28.0

