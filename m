Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A25C433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Nov 2022 11:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbiKPLTX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Nov 2022 06:19:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239117AbiKPLSm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Nov 2022 06:18:42 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745C12BB03
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Nov 2022 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668596823; bh=zKDEflsZJuxcqm1myVhD1gksHCQFBwWS6yl4p9GeiLE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=dOcGGwYvIIp67/v0N4RduUkZpCt59vLLw07q4P0gzc1DQEOu/1awKkujHedIjT976
         pZcSc4SqyV3hgS9C1OZeH/L4qhZjGXyfAgcB1qLMfJuYAeltRWmhd+oNbb6OO1XM9O
         XRJIDRl7KQC9gpmqv1Pe1l6mGqXX73BzNku3/d7hpOSvMCi6wge+2Vvj64wqMv1S1j
         D7/AsEU2SbySbquv9Zj98N5GEMNtw2PNwtvFHwovQQ4QJlTbYEIZxaRE8TjxqWktEh
         HIJCz8FQxwEhyzJ2cTce7SF43cnLG3O50Cl1tKJpjaU1llYht7OMuM3gn+ukZhAdyM
         fwXD3emK/3hZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.223.44.107]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MHGCu-1oi76t2jVA-00DHE4; Wed, 16 Nov 2022 12:07:03 +0100
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH v5] platform/x86: ideapad-laptop: support for more special keys in WMI
Date:   Wed, 16 Nov 2022 12:06:47 +0100
Message-Id: <20221116110647.3438-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <290fa898-9004-fac1-8071-d9864dd039ae@redhat.com>
References: <290fa898-9004-fac1-8071-d9864dd039ae@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E8xIN6uN9Wo4bLvOKdG8gSgC1JRdlj6qxrGN1DpKcyj/G30kDor
 NNprnD2MaudFdz8UoZV0l72Ad7nGih+QB3+WYdnfVOHvbXoMfOaDA3MvLzl895oEDB54zUk
 nUfO3UmY0XZxVD6GA+dl2ty51f7TXM2++WrmIxHuLAgp4qhJ2hDyVHqKpiJkGYMJcPcDZD+
 G7hFNo3RnSje4pD2Km65Q==
UI-OutboundReport: notjunk:1;M01:P0:6glBs7E59Mc=;2lHhzCEmFbIKv6mXMFol9Lo5tRy
 tIBVFEiItsnhGv4T5ghp5+/NKQewgtPXciAuHWoaQuZr6rVIuGSsoJ5ARq3512+BHyICyjXBa
 YtZvBcB8jiUgwmdWPWE7Y04fIy/RFjFWhwZ9URKM94ly//Sv95MqiFzOmF7xsM/315SCjxaSw
 wNe0Bm2fwbh8DzX9JkRSdZIre7ybPKSILDY6lj9g+BFjyQWILr6PLda6RKEDgSsthuXzCWNUd
 BpSeC2TReqVPYc91U7DSGEVlZ/TLFGCG+G38w/cJ/smbLEQhdv+9BhkNzjdI2IgRXihZlwLrJ
 wZ/YHr1Ocy35hKNa0iWndYPXgqKjOFgMmJVncYFmw6CfkPRnoRbhwdDDjQhc5iiAcV+BWJ8HM
 /4KoFwsndAEX8zlPEwilcZUuI9UsPBMTlJS7YOuJgJTTmH2Y/wm+Mw0BkN4oGVKI6sh22HDKB
 zbfEqOMJFDObLEEeWG74PhXaDg980lyVHWcuTimCMi8v32g4d6wdxtNaMaon0BiOIYDCqQD1s
 zjCd1AtYTEWEWxa8PMEBtWsggFsnh8IR74qkRPZkND5OKzbtJlnR66IDq8+bmsYEhCRK+PTxC
 0JgOzK1lbFIOv0HBgqYQY7eoz/sldX12KqM0lgbZO7jcedecOXnqc06JDKKzPszg3J/FVt2Mp
 YFILksoaUeJu4kkqLVn2BxLsOFXCWQi3bb4HX6H2nooJF1RqixgTnxOuPXMTNYMyidd2kkPW9
 6tWhpXAnwV5n4ofNOO4AW4B60io6sj9k4xClbQfE71lEVyDnNCMDX3ImTu5YOIaJCPushxL59
 VW3qhOPXqiln4jm554yFJz9VBD6P/9PIbqWWH25p7FkO+QFagafWDzmwvQ9JBglw4kt/r2eWO
 7339YU5ebxKB6asJ+d93abh91LHc2Rx/SQPF7NJqE+vt+Y1g1uxpdjk9YXQiquVeGfip28zEA
 FQER0SXsV+/pSvbajVKhJDFPmGM=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The event data of the WMI event 0xD0, which is assumed to be the
fn_lock, is used to indicate several special keys on newer Yoga 7/9
laptops.

The notify_id 0xD0 is non-unique in the DSDT of the Yoga 9 14IAP7, this
causes wmi_get_event_data() to report wrong values.
Port the ideapad-laptop WMI code to the wmi bus infrastructure which
does not suffer from the shortcomings of wmi_get_event_data().

Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
I did not add the "data->integer.value =3D=3D 0x02" condition to the wmi_n=
otify
handler. The event data 0x02 and 0x03 are both emitted when changing toggl=
ing
the fn-lock, depending on the new setting. Since I don't know whether the
event data checks out on the affected laptops I'd prefer to omit the check=
.

Regards,
Philipp Jungkamp

 drivers/platform/x86/ideapad-laptop.c | 255 ++++++++++++++++++++------
 1 file changed, 200 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/=
ideapad-laptop.c
index a279f41d984b..ac5ad0e36e5e 100644
=2D-- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -30,6 +30,7 @@
 #include <linux/seq_file.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/wmi.h>

 #include <acpi/video.h>

@@ -38,10 +39,13 @@
 #define IDEAPAD_RFKILL_DEV_NUM	3

 #if IS_ENABLED(CONFIG_ACPI_WMI)
-static const char *const ideapad_wmi_fnesc_events[] =3D {
-	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
-	"56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
-	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", /* Legion 5 */
+enum ideapad_wmi_event_type {
+	IDEAPAD_WMI_EVENT_ESC,
+	IDEAPAD_WMI_EVENT_FN_KEYS,
+};
+
+struct ideapad_wmi_private {
+	enum ideapad_wmi_event_type event;
 };
 #endif

@@ -141,7 +145,6 @@ struct ideapad_private {
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
 	unsigned long cfg;
-	const char *fnesc_guid;
 	struct {
 		bool conservation_mode    : 1;
 		bool dytc                 : 1;
@@ -182,6 +185,42 @@ MODULE_PARM_DESC(set_fn_lock_led,
 	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
 	"If you need this please report this to: platform-driver-x86@vger.kernel=
.org");

+/*
+ * shared data
+ */
+
+static struct ideapad_private *ideapad_shared;
+static DEFINE_MUTEX(ideapad_shared_mutex);
+
+static int ideapad_shared_init(struct ideapad_private *priv)
+{
+	int ret;
+
+	mutex_lock(&ideapad_shared_mutex);
+
+	if (!ideapad_shared) {
+		ideapad_shared =3D priv;
+		ret =3D 0;
+	} else {
+		dev_warn(&priv->adev->dev, "found multiple platform devices\n");
+		ret =3D -EINVAL;
+	}
+
+	mutex_unlock(&ideapad_shared_mutex);
+
+	return ret;
+}
+
+static void ideapad_shared_exit(struct ideapad_private *priv)
+{
+	mutex_lock(&ideapad_shared_mutex);
+
+	if (ideapad_shared =3D=3D priv)
+		ideapad_shared =3D NULL;
+
+	mutex_unlock(&ideapad_shared_mutex);
+}
+
 /*
  * ACPI Helpers
  */
@@ -1110,6 +1149,7 @@ static void ideapad_sysfs_exit(struct ideapad_privat=
e *priv)
 /*
  * input device
  */
+#define IDEAPAD_WMI_KEY 0x100
 static const struct key_entry ideapad_keymap[] =3D {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1123,6 +1163,28 @@ static const struct key_entry ideapad_keymap[] =3D =
{
 	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
 	{ KE_KEY, 128, { KEY_ESC } },
+
+	/*
+	 * WMI keys
+	 */
+
+	/* FnLock (handled by the firmware) */
+	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
+	/* Esc (handled by the firmware) */
+	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
+	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
+	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
+	/* Dark mode toggle */
+	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
+	/* Sound profile switch */
+	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
+	/* Lenovo Virtual Background application */
+	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
+	/* Lenovo Support */
+	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
+	/* Refresh Rate Toggle */
+	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_DISPLAYTOGGLE } },
+
 	{ KE_END },
 };

@@ -1526,33 +1588,6 @@ static void ideapad_acpi_notify(acpi_handle handle,=
 u32 event, void *data)
 	}
 }

-#if IS_ENABLED(CONFIG_ACPI_WMI)
-static void ideapad_wmi_notify(u32 value, void *context)
-{
-	struct ideapad_private *priv =3D context;
-	unsigned long result;
-
-	switch (value) {
-	case 128:
-		ideapad_input_report(priv, value);
-		break;
-	case 208:
-		if (!priv->features.set_fn_lock_led)
-			break;
-
-		if (!eval_hals(priv->adev->handle, &result)) {
-			bool state =3D test_bit(HALS_FNLOCK_STATE_BIT, &result);
-
-			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF=
);
-		}
-		break;
-	default:
-		dev_info(&priv->platform_device->dev,
-			 "Unknown WMI event: %u\n", value);
-	}
-}
-#endif
-
 /* On some models we need to call exec_sals(SALS_FNLOCK_ON/OFF to set the=
 LED */
 static const struct dmi_system_id set_fn_lock_led_list[] =3D {
 	{
@@ -1643,6 +1678,110 @@ static void ideapad_check_features(struct ideapad_=
private *priv)
 	}
 }

+#if IS_ENABLED(CONFIG_ACPI_WMI)
+/*
+ * WMI driver
+ */
+static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context=
)
+{
+	struct ideapad_wmi_private *wpriv;
+
+	wpriv =3D devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
+	if (!wpriv)
+		return -ENOMEM;
+
+	*wpriv =3D *(struct ideapad_wmi_private *)context;
+
+	dev_set_drvdata(&wdev->dev, wpriv);
+	return 0;
+}
+
+static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *data)
+{
+	struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(&wdev->dev);
+	struct ideapad_private *priv;
+	unsigned long result;
+
+	mutex_lock(&ideapad_shared_mutex);
+
+	priv =3D ideapad_shared;
+	if (!priv)
+		goto unlock;
+
+	switch (wpriv->event) {
+	case IDEAPAD_WMI_EVENT_ESC:
+		ideapad_input_report(priv, 128);
+		break;
+	case IDEAPAD_WMI_EVENT_FN_KEYS:
+		if (priv->features.set_fn_lock_led &&
+		    !eval_hals(priv->adev->handle, &result)) {
+			bool state =3D test_bit(HALS_FNLOCK_STATE_BIT, &result);
+
+			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF=
);
+		}
+
+		if (data->type !=3D ACPI_TYPE_INTEGER) {
+			dev_warn(&wdev->dev,
+				 "WMI event data is not an integer\n");
+			break;
+		}
+
+		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
+			data->integer.value);
+
+		ideapad_input_report(priv,
+				     data->integer.value | IDEAPAD_WMI_KEY);
+
+		break;
+	}
+unlock:
+	mutex_unlock(&ideapad_shared_mutex);
+}
+
+struct ideapad_wmi_private ideapad_wmi_context_esc =3D {
+	.event =3D IDEAPAD_WMI_EVENT_ESC
+};
+
+struct ideapad_wmi_private ideapad_wmi_context_fn_keys =3D {
+	.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
+};
+
+static const struct wmi_device_id ideapad_wmi_ids[] =3D {
+	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /*=
 Yoga 3 */
+	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /*=
 Yoga 700 */
+	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }=
, /* Legion 5 */
+	{},
+};
+MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
+
+static struct wmi_driver ideapad_wmi_driver =3D {
+	.driver =3D {
+		.name =3D "ideapad_wmi",
+	},
+	.id_table =3D ideapad_wmi_ids,
+	.probe =3D ideapad_wmi_probe,
+	.notify =3D ideapad_wmi_notify,
+};
+
+static int ideapad_wmi_driver_register(void)
+{
+	return wmi_driver_register(&ideapad_wmi_driver);
+}
+
+static void ideapad_wmi_driver_unregister(void)
+{
+	return wmi_driver_unregister(&ideapad_wmi_driver);
+}
+
+#else
+
+static inline int ideapad_wmi_driver_register(void) { return 0; }
+static inline void ideapad_wmi_driver_unregister(void) { }
+#endif
+
+/*
+ * ACPI driver
+ */
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
@@ -1724,30 +1863,16 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
 		goto notification_failed;
 	}

-#if IS_ENABLED(CONFIG_ACPI_WMI)
-	for (i =3D 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
-		status =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
-						    ideapad_wmi_notify, priv);
-		if (ACPI_SUCCESS(status)) {
-			priv->fnesc_guid =3D ideapad_wmi_fnesc_events[i];
-			break;
-		}
-	}
-
-	if (ACPI_FAILURE(status) && status !=3D AE_NOT_EXIST) {
-		err =3D -EIO;
-		goto notification_failed_wmi;
-	}
-#endif
+	err =3D ideapad_shared_init(priv);
+	if (err)
+		goto shared_init_failed;

 	return 0;

-#if IS_ENABLED(CONFIG_ACPI_WMI)
-notification_failed_wmi:
+shared_init_failed:
 	acpi_remove_notify_handler(priv->adev->handle,
 				   ACPI_DEVICE_NOTIFY,
 				   ideapad_acpi_notify);
-#endif

 notification_failed:
 	ideapad_backlight_exit(priv);
@@ -1773,10 +1898,7 @@ static int ideapad_acpi_remove(struct platform_devi=
ce *pdev)
 	struct ideapad_private *priv =3D dev_get_drvdata(&pdev->dev);
 	int i;

-#if IS_ENABLED(CONFIG_ACPI_WMI)
-	if (priv->fnesc_guid)
-		wmi_remove_notify_handler(priv->fnesc_guid);
-#endif
+	ideapad_shared_exit(priv);

 	acpi_remove_notify_handler(priv->adev->handle,
 				   ACPI_DEVICE_NOTIFY,
@@ -1828,7 +1950,30 @@ static struct platform_driver ideapad_acpi_driver =
=3D {
 	},
 };

-module_platform_driver(ideapad_acpi_driver);
+static int __init ideapad_laptop_init(void)
+{
+	int err;
+
+	err =3D ideapad_wmi_driver_register();
+	if (err)
+		return err;
+
+	err =3D platform_driver_register(&ideapad_acpi_driver);
+	if (err) {
+		ideapad_wmi_driver_unregister();
+		return err;
+	}
+
+	return 0;
+}
+module_init(ideapad_laptop_init)
+
+static void __exit ideapad_laptop_exit(void)
+{
+	ideapad_wmi_driver_unregister();
+	platform_driver_unregister(&ideapad_acpi_driver);
+}
+module_exit(ideapad_laptop_exit)

 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("IdeaPad ACPI Extras");
=2D-
2.38.1

