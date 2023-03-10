Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E64C64EC4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 04:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjCJEWW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Mar 2023 23:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjCJEV2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 23:21:28 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 747941F914
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 20:17:45 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id nn12so4153597pjb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 20:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678421865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnpRhZFRZlqtlskeBCSE0AjSXimnl9F7ipnEffSBg3w=;
        b=Wuc4XfVdHYM+LRwYUk6HjM4YxYUPuG9M+8cexAIIzzAgwdwFOTdUFgBWhZiP/OVuHx
         zcPmBYnGCiwXrwuxjOTuAi+4IqvUsLhFngXii+CveUqmKs1PLMZnrM1ERp/cJeVCPtzN
         vjw1f5+a8jeok3GHj1IzoreSl3830y2R1YhRqvuRZSmpLuE17k65ul/xbi/l+iBaiiRR
         e1XJlayEE85BR/aRlt6u9E6w5jzieJ+z5tvyrwGrNgDbQTUmNOcxC1qFbf3eycQgFKTr
         HLIclescjFDxyrw/w3NZ+DwN92fm+pnFGw9oUvjuhZn9lw1S+M+8dmCOy/H4dtZQ6qEh
         quhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LnpRhZFRZlqtlskeBCSE0AjSXimnl9F7ipnEffSBg3w=;
        b=gmbj+myMHuyAUba5oqjyZPE4yzCuSzjeUZaxLClbbzpB3O/8GWFSc9Pztq8oialU8q
         XjLwpqefpn6hQ6P5yLJcRSrBmwux1rOK/nKjaODSBCmiC3FrKMLji/SxVD/nGKQhr/1S
         DdGc4Y+Fn4YsY/ytIbPYtnjUJP8R4ITO9un2V5vEWVFMq/X0HUqZXL+yizgNLfA8rVnC
         iuwEVL5VkHEKjSZN8hQKvERAfiKL5Ur5oeBO2xiIyc+PHN40zdSVnwnQWxQisiJjLJmp
         MTRkXovc9QC7OO47lSb4QzOD+ist2voqMKpBn2/DFVNcEO+eZS3O4xvyg8+PkewgAfNR
         lpdA==
X-Gm-Message-State: AO0yUKXcUim+yFApg2QHQN82nV2Pr+YynUMAtyLsm2LahOF27FejxE1v
        FADZHGhtOXu+mt53GNPG2V34IW/bsZoq1A==
X-Google-Smtp-Source: AK7set8Hlsy9sclB1BOjO15CJa25NpjpLWDtY8jhMFUKPf1+y36PP2+CK+1zEM4OefxkZ5V/rhFdzA==
X-Received: by 2002:a17:902:d353:b0:19e:2e6b:142e with SMTP id l19-20020a170902d35300b0019e2e6b142emr23311036plk.63.1678421864749;
        Thu, 09 Mar 2023 20:17:44 -0800 (PST)
Received: from localhost.localdomain ([47.147.242.129])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902e5c800b0019a928a8982sm388406plf.118.2023.03.09.20.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:17:44 -0800 (PST)
From:   Andrew Kallmeyer <kallmeyeras@gmail.com>
To:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
Cc:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Subject: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Date:   Thu,  9 Mar 2023 20:17:26 -0800
Message-Id: <20230310041726.217447-3-kallmeyeras@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310041726.217447-1-kallmeyeras@gmail.com>
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This WMI driver for the tablet mode control switch for Lenovo Yoga
notebooks was originally written by Gergo Koteles. The mode is mapped to
a SW_TABLET_MODE switch capable input device.

I (Andrew) followed the suggestions that were posted in reply to Gergo's
RFC patch to follow-up and get it merged. Additionally I merged the
lenovo_ymc_trigger_ec function with the ideapad_trigger_ymc_next_read
function since it was no longer external. I have also added the word
"Tablet" to the driver description to hopefully make it more clear.

As Gergo said: It should work with  models like the Yoga C940, Ideapad
flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7.
The 14ARB7 model must trigger the EC to send mode change events. This
might be a firmware bug.

I have additionally tested this on the Yoga 7 14IAL7.

Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
---
 drivers/platform/x86/Kconfig          |  10 ++
 drivers/platform/x86/Makefile         |   1 +
 drivers/platform/x86/ideapad-laptop.h |   1 +
 drivers/platform/x86/lenovo-ymc.c     | 177 ++++++++++++++++++++++++++
 4 files changed, 189 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-ymc.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 5692385e2..858be0c65 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 	  rfkill switch, hotkey, fan control and backlight control.
 
+config LENOVO_YMC
+	tristate "Lenovo Yoga Tablet Mode Control"
+	depends on ACPI_WMI
+	depends on INPUT
+	depends on IDEAPAD_LAPTOP
+	select INPUT_SPARSEKMAP
+	help
+	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
+	  events for Lenovo Yoga notebooks.
+
 config SENSORS_HDAPS
 	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
 	depends on INPUT
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1d3d1b025..10054cdea 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
 # IBM Thinkpad and Lenovo
 obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
+obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
 obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
index 7dd8ce027..2564cb1cd 100644
--- a/drivers/platform/x86/ideapad-laptop.h
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -35,6 +35,7 @@ enum {
 	VPCCMD_W_FAN,
 	VPCCMD_R_RF,
 	VPCCMD_W_RF,
+	VPCCMD_W_YMC = 0x2A,
 	VPCCMD_R_FAN = 0x2B,
 	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
 	VPCCMD_W_BL_POWER = 0x33,
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
new file mode 100644
index 000000000..e29ada1b4
--- /dev/null
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * lenovo-ymc.c - Lenovo Yoga Mode Control driver
+ *
+ * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/wmi.h>
+#include "ideapad-laptop.h"
+
+#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
+#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
+
+#define LENOVO_YMC_QUERY_INSTANCE 0
+#define LENOVO_YMC_QUERY_METHOD 0xAB
+
+static bool ec_trigger __read_mostly;
+module_param(ec_trigger, bool, 0644);
+MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
+
+static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
+	{
+		// Lenovo Yoga 7 14ARB7
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
+		},
+	},
+	{ },
+};
+
+struct lenovo_ymc_private {
+	struct input_dev *input_dev;
+	struct acpi_device *ec_acpi_dev;
+};
+
+static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
+{
+	int err;
+
+	if (!ec_trigger || !priv || !priv->ec_acpi_dev)
+		return;
+	err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
+	if (err)
+		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
+}
+
+static const struct key_entry lenovo_ymc_keymap[] = {
+	// Laptop
+	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
+	// Tablet
+	{ KE_SW, 0x02, { .sw = { SW_TABLET_MODE, 1 } } },
+	// Drawing Board
+	{ KE_SW, 0x03, { .sw = { SW_TABLET_MODE, 1 } } },
+	// Tent
+	{ KE_SW, 0x04, { .sw = { SW_TABLET_MODE, 1 } } },
+	{ KE_END },
+};
+
+static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
+{
+	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
+
+	u32 input_val = 0;
+	struct acpi_buffer input = {sizeof(input_val), &input_val};
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	acpi_status status;
+	union acpi_object *obj;
+	int code;
+
+	status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
+				LENOVO_YMC_QUERY_INSTANCE,
+				LENOVO_YMC_QUERY_METHOD,
+				&input, &output);
+
+	if (ACPI_FAILURE(status)) {
+		dev_warn(&wdev->dev,
+			"Failed to evaluate query method: %s\n",
+			acpi_format_exception(status));
+		return;
+	}
+
+	obj = output.pointer;
+
+	if (obj->type != ACPI_TYPE_INTEGER) {
+		dev_warn(&wdev->dev,
+			"WMI event data is not an integer\n");
+		goto free_obj;
+	}
+	code = obj->integer.value;
+
+	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
+		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
+
+free_obj:
+	kfree(obj);
+	lenovo_ymc_trigger_ec(wdev, priv);
+}
+
+static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct input_dev *input_dev;
+	struct lenovo_ymc_private *priv;
+	int err;
+
+	ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	if (ec_trigger) {
+		pr_debug("Lenovo YMC enable EC triggering.\n");
+		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VCP2004", NULL, -1);
+		if (!priv->ec_acpi_dev) {
+			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
+			return -ENODEV;
+		}
+	}
+
+	input_dev = devm_input_allocate_device(&wdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name = "Lenovo Yoga Tablet Mode Control switch";
+	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->dev.parent = &wdev->dev;
+
+	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
+
+	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
+	if (err) {
+		dev_err(&wdev->dev,
+			"Could not set up input device keymap: %d\n", err);
+		return err;
+	}
+
+	err = input_register_device(input_dev);
+	if (err) {
+		dev_err(&wdev->dev,
+			"Could not register input device: %d\n", err);
+		return err;
+	}
+
+	priv->input_dev = input_dev;
+	dev_set_drvdata(&wdev->dev, priv);
+	lenovo_ymc_trigger_ec(wdev, priv);
+	return 0;
+}
+
+static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
+	{ .guid_string = LENOVO_YMC_EVENT_GUID },
+	{ }
+};
+MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
+
+static struct wmi_driver lenovo_ymc_driver = {
+	.driver = {
+		.name = "lenovo-ymc",
+	},
+	.id_table = lenovo_ymc_wmi_id_table,
+	.probe = lenovo_ymc_probe,
+	.notify = lenovo_ymc_notify,
+};
+
+module_wmi_driver(lenovo_ymc_driver);
+
+MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
+MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
+MODULE_LICENSE("GPL");
-- 
2.39.2

