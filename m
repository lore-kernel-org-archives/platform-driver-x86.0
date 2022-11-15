Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC82C433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 00:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbiKOAKX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Nov 2022 19:10:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236735AbiKOAKW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Nov 2022 19:10:22 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C98FCD
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 16:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668471011; bh=8J16gx5fomQmCoaW7dtcYgS4atdLG/gsc31tKxGNMZE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=B/mhfIfGkHZABFsbCrAliTe9D5xEMuoxF47321ZQnJcOpdpayTA+HRqQQiX0oEfVP
         Bg61v8j1Ecj6lo3NLTPfAmff5wvZ7NvjQ7DQDOfhZ8+74L6etMl2m8Q9vPi3aexRiC
         pn62F5x6q7qjAIM3UjoWaK5NZW5s5EEdzpUsUtt6bTVPO549o6u/lnFfTt/BJp19qZ
         MAzxQWhjYJmeRRQmZv5GJmvRfkDYgo5zlrwU0x5eccH7bUHqYNgDjYojnWkF4cVYWO
         8esd687eU2UB6trLYSAfO1DFj4xZG6rfP2+6TsafYSsRjUXHqnt3TLpQ2ovfZYjMzl
         ZdsrTxGFo9DAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.223.44.239]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M72sP-1otL9o1mQR-008e18; Tue, 15 Nov 2022 01:10:11 +0100
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH v4] platform/x86: ideapad-laptop: support for more special keys in WMI
Date:   Tue, 15 Nov 2022 01:09:54 +0100
Message-Id: <20221115000954.51596-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <7e263715-e759-9293-ec53-27033a79a2bc@redhat.com>
References: <7e263715-e759-9293-ec53-27033a79a2bc@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YKlmB+BC4NaOwiB69UQ/hgXo/mcXwqhhvf8sM/UGg1qKg9rOE86
 2Hm1W5/wPSlSLUfLxFzGYVWeMn9ezCQOhDnuLXj2JcundLAfd62cuSIEU+D9b5pKSovdU9D
 HyDhi/a5x5lBrJmsBz3pM24qO07aZ5wfv0ERDp0MZ16okjR9J7Kn1GYdkMQ+54QJ+YLTlbd
 tnNW3fe7WnCZHe8Q8/FOQ==
UI-OutboundReport: notjunk:1;M01:P0:GJCU/9wkNzw=;uxPw2LIaaK+jTfHY1ew8Fy2g6xD
 6PiJ4MiiB89JTfjlVg1UbluM3/6B8wb8XkeU1DUgalpuH18iyitlRRTk4zYvYXBxaJ2RJ2FcK
 W/1UGAGehrxFaTb5E9M2sLVheC4NDF1uf9R4ngcYsQAhJJnLWN3QbFo8irgYpm7xwgP3UkQu1
 MFmI/aKaxXocuYtUAvGasV7Re/H3nvMJzwkhg4iTsA5FU/5r4CFl/dTEgfEiCf0J73cH+5ztQ
 mcXdQuDqd9stlbEi1VAT0fNVLE5q5wVHKdJg9eF7EtSwVAEgSeqVGhC+rcBvZq7sDf4ntYU5j
 nqCtYlIArG16dcIOqwyarvYcwu+tNUmhQ7znkVv0xr8iagdRNZZST/TWMgWqIMBdyXIqA1hnv
 5aSGtRs6LF6NV2bJ2cp/0kJJh/Rhno2O8+SptZDgVhlU76QryKcfKX03RP4NKSHcckyU6pitx
 3liggSN5wbbznUQZc6Ljs3bheCy9xZ0dB5OJgAwihDKUHYKufSt/F6A7QmjdyqPf6+3Ie9j0w
 H1ZpfpfkpxBWOBjzB5nwjlAaQToETIVtdPRu6qHCRwZ//E5RMoJ/uJsssznNzJsPXyPTCFRbO
 TbliSfd9c1AHz1yc5nWcrUnLVXrqZoBf+fgzwLoxsm0Z+iPJw2kbERwSuY3G34tXr4Q5OyXEc
 byjw+AwxjL8CwniYzC4LKjlTjacUlT+dKU5hruufeKbTOsvjFqD0oq/EFgLicPhJ7KGBtHcD5
 bLOx07j4L4UYgNBR4ddSx1PyXkY1/DBeA50OBDt6DQpDZcWtK/SMuHg6hJK17nEJsXXL4ojjv
 CthLFsWqpmGI0mmcwbknE7dQ6MTU1PFypT/0N3+Unrzd3Ffj8hVtOA6xBp8oi8yBFsDJjuiW5
 JZIBpIYlu9NksAVXLfCXs1Fhm4VldHEXGMw6VdbjkXXXRu8vTqBirMG/w2kAlq/2fgmfozohm
 4WEaosXPKG6Lq+tQcw7OxPN1Yr4=
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
This now uses the WMI bus infrastructure with both the platform driver and=
 the
wmi driver registered on module load. Is the synchronization used here
sufficient?

Thanks for all the help!

Regards,
Philipp Jungkamp

 drivers/platform/x86/ideapad-laptop.c | 240 ++++++++++++++++++++------
 1 file changed, 188 insertions(+), 52 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/=
ideapad-laptop.c
index 33b3dfdd1b08..803bf5cf50f9 100644
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

@@ -130,7 +134,6 @@ struct ideapad_private {
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
 	unsigned long cfg;
-	const char *fnesc_guid;
 	struct {
 		bool conservation_mode    : 1;
 		bool dytc                 : 1;
@@ -156,6 +159,42 @@ static bool allow_v4_dytc;
 module_param(allow_v4_dytc, bool, 0444);
 MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile s=
upport.");

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
@@ -1074,6 +1113,7 @@ static void ideapad_sysfs_exit(struct ideapad_privat=
e *priv)
 /*
  * input device
  */
+#define IDEAPAD_WMI_KEY 0x100
 static const struct key_entry ideapad_keymap[] =3D {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1087,6 +1127,28 @@ static const struct key_entry ideapad_keymap[] =3D =
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

@@ -1490,30 +1552,6 @@ static void ideapad_acpi_notify(acpi_handle handle,=
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
 /*
  * Some ideapads have a hardware rfkill switch, but most do not have one.
  * Reading VPCCMD_R_RF always results in 0 on models without a hardware r=
fkill,
@@ -1589,6 +1627,95 @@ static void ideapad_check_features(struct ideapad_p=
rivate *priv)
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
+		if (!eval_hals(priv->adev->handle, &result)) {
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
+#endif
+
+/*
+ * ACPI driver
+ */
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
@@ -1670,30 +1797,16 @@ static int ideapad_acpi_add(struct platform_device=
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
@@ -1719,10 +1832,7 @@ static int ideapad_acpi_remove(struct platform_devi=
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
@@ -1774,7 +1884,33 @@ static struct platform_driver ideapad_acpi_driver =
=3D {
 	},
 };

-module_platform_driver(ideapad_acpi_driver);
+static int __init ideapad_laptop_init(void)
+{
+	int err;
+
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+	err =3D wmi_driver_register(&ideapad_wmi_driver);
+	if (err)
+		return err;
+#endif
+
+	err =3D platform_driver_register(&ideapad_acpi_driver);
+	if (err)
+		return err;
+
+	return 0;
+}
+module_init(ideapad_laptop_init)
+
+static void __exit ideapad_laptop_exit(void)
+{
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+	wmi_driver_unregister(&ideapad_wmi_driver);
+#endif
+
+	platform_driver_unregister(&ideapad_acpi_driver);
+}
+module_exit(ideapad_laptop_exit)

 MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
 MODULE_DESCRIPTION("IdeaPad ACPI Extras");
=2D-
2.38.1

