Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40578C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Sep 2022 16:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiIKQEe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Sep 2022 12:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiIKQEd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 12:04:33 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F732A726
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1662912258;
        bh=tu+9kjmOX2aoEkbmx7LlFzxWymDQnTr3CCrLAOK7SQg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NWwGI14lK3fdH3fd0RVXMFw1ZEdeANKy/R2tJpZCP7JIsBpHP+FGgQq7T09CPJiKV
         E6QDqi1WgCZptHIDM1ZtN9pKmbglBFKOLR9qEcNx9MEcYRxrBfDDgdKH4AsqX72uhR
         2qmwWx1+JrHLdfJVeDpD/U87tyyujddjkupOsjs0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from yoga9.fritz.box ([94.134.182.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N6bjy-1pP17142bW-0184Zk; Sun, 11
 Sep 2022 18:04:18 +0200
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH] Add IdeaPad WMI Fn Keys driver
Date:   Sun, 11 Sep 2022 18:04:04 +0200
Message-Id: <20220911160404.21692-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z8FelCCKrhds0dqum+m+NfYbRARHpHqdDezFPbmyCBx7ayUr0wJ
 YpkJfDl47njbGfypkyShLx+0Z8gZVAVwHTUM2hS2XO77OVQO38d2XUi/LRgyyCk6RbLM5qq
 p7abNgcGaRZw/STYm2O+9+12fQ2E/+6khgNRBWNKoYUy6ZAOzK90WXvXaEVVllMvb/YUitu
 DJX7FUg+Qw1nfBmaZomjQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r29g2fu+e1M=:LfAqX2Z7jY8URuNwMmfHY+
 SKVG/FCXPangtVNnUQvEmPDr0xJgNUTs4nsBe1fyWFP23Aki8vfzpOGiQUjSoT4ukgzr+Pa7S
 0ojhJfqita3pNcLKEvGifBg67JH1nQiKvXgyT7VtNfYD6xlyhV9Ino+371ccn5KkFzLMjAJy2
 zQPIe3B1jw6SEj1hU+ux4h1doRkDSOfZHpADUvwMB7KtCW+pH0tZ2RgCPgkV7uy1jFGcJFeI0
 M3IBQJOJq+581x3AA3eMnIix8CuSyGnehLoKnR1G+WyPqCtN/Xn7TlTFIzWiN0Y4o6aIW2l8o
 GA6XBm3f7qkw3NTo0r+nCoXfv50HLUfbkLMCuqSw7w7R97zvyGF/bZFYJiObidWEtYDHWcIYs
 o7clZi+JUw71WgSH3EZDttmq89Yb1kuHAQVJu4P8b0dJufdULYqyLBX5Bs7KtxEOaL9DnS/yp
 x9bZ9zRToKL/fDWKm2+MUY19DinmM6LWUJcKdJ8ThpF+LsoM+BOoXKThkaIWSqvY6uNzokw7X
 2Ae943yU0za87w+rXZnDn9Jlb6OfeDpx+u1D1Ib8WEd3AVHxVJx6cvnm244J8vXDdPALXuEwD
 QvPZ2sBep7LoDkOpu3AWzW4gJ9uNi2HUMqLrh2BHgFcM6gm21KwbUnQ5AOehybYnQakKFf+T6
 JTwY70G3h0+FPIbwyEbOux4bfFzyYigMjWfFJ0lyCLN6y8fPZuG3JGUmBzy/sTwsvW+cbgNvB
 7d4H5YkY0P+H8T0XZP66dl9cg2+N5M4sJhBDblP1f5QSYt6qmAyYuEcSw//+DWyTuVvMMDKRq
 4YP2w8akJIL5gxnkmW/rvJk3NgXHudzJVdyD4lV+fpqIaxbK5ZNAoY2+pmB0a3J/sgSRSYF/j
 EVdXwc3lkblHIyUjhyfDh/KVzVp8XniUAdSIVggDGr/Hjb4C0bD5AFwVyoR8OreI9r7BD1CSt
 gHIWMv0ZqfAIeTuWw9zKteXDB7P0spUrO1VNu7UQz3MJQxQSPfg8dJmda86iDZvJH75xK+w2q
 qfrReGVqZOQferGL+c3oj8XHa5Q6YLrJvAITOoE94yK7QsLQjGoC25vizciAT90rpyP84uare
 aqLIL7YS70KMiYG9hisR53EvRhSFfs3OWXbkggGETl7BPtcaoVD4MBGAz8R/Swf4vDbLfikja
 46bVsMeHFmpXvR82t+nHTf5zuM
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Create an input device for WMI events corresponding to some special
keys on the 'Lenovo Yoga' line.

This include the 3 keys to the right on the 'Lenovo Yoga9 14IAP7' and
additionally the 'Lenovo Support' and 'Lenovo Favorites' (star with 'S'
inside) in the fn key row as well as the event emitted on 'Fn+R' which
toggles between 60Hz and 90Hz display refresh rate on windows.

Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
I found this patch by poking in the DSDT. I have not submitted any
notable patches yet and hope you can help me improve in case I make
unfortunate choices during submission.

Thank you for your time!
Philipp Jungkamp

 drivers/platform/x86/Kconfig       |  13 +++
 drivers/platform/x86/Makefile      |   1 +
 drivers/platform/x86/ideapad-wmi.c | 153 +++++++++++++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 drivers/platform/x86/ideapad-wmi.c

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index f2f98e942cf2..e7c5148e5cb4 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -140,6 +140,19 @@ config YOGABOOK_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook-wmi.

+config IDEAPAD_WMI
+	tristate "Lenovo IdeaPad WMI Fn Keys"
+	depends on ACPI_WMI
+	depends on INPUT
+	select INPUT_SPARSEKMAP
+	help
+	  Say Y here if you want to receive key presses from some lenovo
+	  specific keys. (Star Key, Support Key, Virtual Background,
+	  Dark Mode Toggle, ...)
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called ideapad-wmi.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5a428caa654a..d8bec884d6bc 100644
=2D-- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_PEAQ_WMI)			+=3D peaq-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
 obj-$(CONFIG_YOGABOOK_WMI)		+=3D lenovo-yogabook-wmi.o
+obj-$(CONFIG_IDEAPAD_WMI)		+=3D ideapad-wmi.o

 # Acer
 obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
diff --git a/drivers/platform/x86/ideapad-wmi.c b/drivers/platform/x86/ide=
apad-wmi.c
new file mode 100644
index 000000000000..38f7b3d0c171
=2D-- /dev/null
+++ b/drivers/platform/x86/ideapad-wmi.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * ideapad-wmi.c - Ideapad WMI fn keys driver
+ *
+ * Copyright (C) 2022 Philipp Jungkamp <p.jungkamp@gmx.net>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/wmi.h>
+
+#define IDEAPAD_FN_KEY_EVENT_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
+
+struct ideapad_wmi_private {
+	struct wmi_device *wmi_device;
+	struct input_dev *input_dev;
+};
+
+static const struct key_entry ideapad_wmi_fn_key_keymap[] =3D {
+	/* FnLock (handled by the firmware) */
+	{ KE_IGNORE,	0x02 },
+	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
+	{ KE_KEY,	0x01, { KEY_FAVORITES } },
+	/* Dark mode toggle */
+	{ KE_KEY,	0x13, { KEY_PROG1 } },
+	/* Sound profile switch */
+	{ KE_KEY,	0x12, { KEY_PROG2 } },
+	/* Lenovo Virtual Background application */
+	{ KE_KEY,	0x28, { KEY_PROG3 } },
+	/* Lenovo Support */
+	{ KE_KEY,	0x27, { KEY_HELP } },
+	/* Refresh Rate Toggle */
+	{ KE_KEY,	0x0a, { KEY_DISPLAYTOGGLE } },
+	{ KE_END },
+};
+
+static int ideapad_wmi_input_init(struct ideapad_wmi_private *priv)
+{
+	struct input_dev *input_dev;
+	int err;
+
+	input_dev =3D input_allocate_device();
+	if (!input_dev) {
+		return -ENOMEM;
+	}
+
+	input_dev->name =3D "Ideapad WMI Fn Keys";
+	input_dev->phys =3D IDEAPAD_FN_KEY_EVENT_GUID "/input0";
+	input_dev->id.bustype =3D BUS_HOST;
+	input_dev->dev.parent =3D &priv->wmi_device->dev;
+
+	err =3D sparse_keymap_setup(input_dev, ideapad_wmi_fn_key_keymap, NULL);
+	if (err) {
+		dev_err(&priv->wmi_device->dev,
+			"Could not set up input device keymap: %d\n", err);
+		goto err_free_dev;
+	}
+
+	err =3D input_register_device(input_dev);
+	if (err) {
+		dev_err(&priv->wmi_device->dev,
+			"Could not register input device: %d\n", err);
+		goto err_free_dev;
+	}
+
+	priv->input_dev =3D input_dev;
+	return 0;
+
+err_free_dev:
+	input_free_device(input_dev);
+	return err;
+}
+
+static void ideapad_wmi_input_exit(struct ideapad_wmi_private *priv)
+{
+	input_unregister_device(priv->input_dev);
+	priv->input_dev =3D NULL;
+}
+
+static void ideapad_wmi_input_report(struct ideapad_wmi_private *priv,
+				     unsigned int scancode)
+{
+	sparse_keymap_report_event(priv->input_dev, scancode, 1, true);
+}
+
+static int ideapad_wmi_probe(struct wmi_device *wdev, const void *ctx)
+{
+	struct ideapad_wmi_private *priv;
+	int err;
+
+	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	dev_set_drvdata(&wdev->dev, priv);
+
+	priv->wmi_device =3D wdev;
+
+	err =3D ideapad_wmi_input_init(priv);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void ideapad_wmi_remove(struct wmi_device *wdev)
+{
+	struct ideapad_wmi_private *priv =3D dev_get_drvdata(&wdev->dev);
+
+	ideapad_wmi_input_exit(priv);
+}
+
+static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *data)
+{
+	struct ideapad_wmi_private *priv =3D dev_get_drvdata(&wdev->dev);
+
+	if(data->type !=3D ACPI_TYPE_INTEGER) {
+		dev_warn(&priv->wmi_device->dev,
+			"WMI event data is not an integer\n");
+		return;
+	}
+
+	ideapad_wmi_input_report(priv, data->integer.value);
+}
+
+static const struct wmi_device_id ideapad_wmi_id_table[] =3D {
+	{	/* Special Keys on the Yoga 9 14IAP7 */
+		.guid_string =3D IDEAPAD_FN_KEY_EVENT_GUID
+	},
+	{ }
+};
+
+static struct wmi_driver ideapad_wmi_driver =3D {
+	.driver =3D {
+		.name =3D "ideapad-wmi",
+	},
+	.id_table =3D ideapad_wmi_id_table,
+	.probe =3D ideapad_wmi_probe,
+	.remove =3D ideapad_wmi_remove,
+	.notify =3D ideapad_wmi_notify,
+};
+
+module_wmi_driver(ideapad_wmi_driver);
+
+MODULE_DEVICE_TABLE(wmi, ideapad_wmi_id_table);
+MODULE_AUTHOR("Philipp Jungkamp <p.jungkamp@gmx.net>");
+MODULE_DESCRIPTION("Ideapad WMI fn keys driver");
+MODULE_LICENSE("GPL");
=2D-
2.37.3

