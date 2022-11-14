Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A12C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Nov 2022 14:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237068AbiKNOm5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Nov 2022 09:42:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237185AbiKNOmI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Nov 2022 09:42:08 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AC771E3E2
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Nov 2022 06:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668436917; bh=Bnb5EggVz/aK5f9Vza1F01e442UFndY6RV0UOFp6EZI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Py1veSFgFzF9/PE6peeOVQ8P2FD1k7VPGSzMmKsOBX1Ik2XzuPYAmSNkvhfLxigon
         8gkeQkdoNvkrJ/f0/bvQvGPzOGZ7LjtRRRw0FY0Bw9HtYdnJBkPRIu7u6887kiEo5h
         6ijmhywZEbjLQTV13dX4NEhPK0j9RJabSpWt1qFMd1jWsLO1OJU/grDqHNFL3ENUq3
         29fyA48N8fyPqDbH8erBpqeVEmjYbaq/Z7XT53rwSZQugqTMvuf58mugPUrzbEQYvr
         ojQ8iGgDHEE9UdihbB9iQK/dg5Lnwz0WeRGcTOPPJUU91lnlPXMWt8XcJuADzdRXe4
         O5Hhndx6GKAbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9.fritz.box ([62.225.236.35]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17UQ-1p59Hr0cLy-012bjg; Mon, 14
 Nov 2022 15:41:57 +0100
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH v3] platform/x86: ideapad-laptop: support for more special keys in WMI
Date:   Mon, 14 Nov 2022 15:41:40 +0100
Message-Id: <20221114144140.5054-1-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <6794a6cc-6049-66bf-cee8-a35105669fcb@gmx.de>
References: <6794a6cc-6049-66bf-cee8-a35105669fcb@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0XfO4Od0zz2Jeg1UE8KGoq6sOh4tqgVaEE74jpzqRuA+7Prl+Wj
 +G3HcBv/CnvuJM5drGrCw+XKbj8nJ6da3sD6vIdi9pQJ/DkO3zxuPf7FBH+v906TGVwi68w
 rbZlxoVs/XsC5MQ0df4RoxaQMv3m0rHadyoEbfh4aUNyd6wrTdNnYv0sDqgWJ3T90MFXBrm
 EBbwzw/j3Hf7UyXTjynLg==
UI-OutboundReport: notjunk:1;M01:P0:gIRwAaTo8xc=;pagYubhGkYrmZOD+kuOvew1Y7x0
 7uSXGS7rVn/wcJcTQOJYUqisiukecpxZ+1uQzYooil5vzfpeojFOskYf/1C8XTkaBd9YKKdGJ
 QJdVgkqanI7NNmqhgj0D0sW7jCSUvAqeSPjrSLz1sOYMbCyxsa5+HcfeuKbg1Y0VT5uLd5h/+
 YeGkD/9TZa7bmpCcLXK8WuvN6lmQODzfm627MuYUIyzVEDYqQQfEGnEDUKD3dpvHV1KUUgbja
 nk1JT2y4afHRHpNmpKQNzRlZllxviFEBy9VMC0MGa5uL3eascpPdg9aFuaclOsHcydDPhBFqd
 KXxeZujpYtfwPzI7F5/FByPkHKF7YDHURU89KqYhDaujOhIzRRsXbqE3bY5Cqewu1EERNeUMb
 ZKMXlaZKAuxw4DhlE8MP/KCHqPb2QStM5nnTOBWuTyLNZRmPsmOQaCG6J6y035/HXI1kY7hA4
 cbBFdLJBE0vCB+3jFpcqM+ddA2/rdXD+glHP/ungV4PLslzDCeUhcz8ZcAqhJGDZeeBxNDiKw
 BjFBK8aHlsu0qFAS53C5Q3omyHWdjlQneeZmWIEB/qLrbXJ6mxQdMkidZ2rVw6NWjrtdhfwLI
 WREy+DMbGidIYMAmPPg+0wrv/AEZFPm/IhjtjzytTlBHYnS2tIbaB/ZLdnpG6C+Ls1nDwI+rA
 OcmRWm1Y8EXStD+IiEGlQeMnFUQ1S066ycqnMyOhYW1rFsnvglRE5ccnPojIjYQROMCU4q9/Z
 xTYoqFwfyleIi3gG4QzCBqfVlx6iOd7ovT00eUWKwv3eqdX/o98gcfH/OqQagIiXKUlov4vCV
 TnKA3SFrRSm21PZCuMD3s+o/fzCDTzLcIkzV7KMf1qQNqnV/awPK9DTmBQ2TrYXwQpdP30mYk
 LQ2pKsF2YCLZwrN04aSENLXB4BnUwczedUmaZs+WG39LQlpQo+GDJlQVHMKYysZjF2B8eXps4
 dnHkjg9hWMLAnKjYPlDuniG+Bdg=
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
Hello,

is this about right? It works for me.

What I don't really like here is the dev_set_drvdata() which takes a non-c=
onst
void * and I pass it a const pointer. I do cast the value of dev_get_drvda=
ta()
back to a const pointer, but this seems rather ugly.
I preferred it over allocating a single int for the device or casting an e=
num
to a void *. This additionally removes the need for a remove funtion.

Regards,
Philipp

 drivers/platform/x86/ideapad-laptop.c | 109 +++++++++++++++++++-------
 1 file changed, 80 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/=
ideapad-laptop.c
index 33b3dfdd1b08..6d35a9e961cf 100644
=2D-- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -30,6 +30,7 @@
 #include <linux/seq_file.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
+#include <linux/wmi.h>

 #include <acpi/video.h>

@@ -38,10 +39,19 @@
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
+enum ideapad_wmi_event_type ideapad_wmi_esc =3D IDEAPAD_WMI_EVENT_ESC,
+enum ideapad_wmi_event_type ideapad_wmi_fn_keys =3D IDEAPAD_WMI_EVENT_FN_=
KEYS;
+
+static const struct wmi_device_id ideapad_wmi_id_table[] =3D {
+	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_esc }, /* Yoga 3 =
*/
+	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_esc }, /* Yoga 70=
0 */
+	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_fn_keys }, /* Leg=
ion 5 */
+	{}
 };
 #endif

@@ -130,7 +140,7 @@ struct ideapad_private {
 	struct ideapad_dytc_priv *dytc;
 	struct dentry *debug;
 	unsigned long cfg;
-	const char *fnesc_guid;
+	struct wmi_driver wmi_drv;
 	struct {
 		bool conservation_mode    : 1;
 		bool dytc                 : 1;
@@ -1074,6 +1084,7 @@ static void ideapad_sysfs_exit(struct ideapad_privat=
e *priv)
 /*
  * input device
  */
+#define IDEAPAD_WMI_KEY 0x100
 static const struct key_entry ideapad_keymap[] =3D {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1087,6 +1098,26 @@ static const struct key_entry ideapad_keymap[] =3D =
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

@@ -1491,25 +1522,47 @@ static void ideapad_acpi_notify(acpi_handle handle=
, u32 event, void *data)
 }

 #if IS_ENABLED(CONFIG_ACPI_WMI)
-static void ideapad_wmi_notify(u32 value, void *context)
+static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context=
)
 {
-	struct ideapad_private *priv =3D context;
+	dev_set_drvdata(&wdev->dev, (void *) context);
+	return 0;
+}
+
+static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object=
 *data)
+{
+	struct wmi_driver *wdrv =3D container_of(wdev->dev.driver,
+					       struct wmi_driver,
+					       driver);
+	struct ideapad_private *priv =3D container_of(wdrv,
+						    struct ideapad_private,
+						    wmi_drv);
+	const enum ideapad_wmi_event_type *event =3D dev_get_drvdata(&wdev->dev)=
;
 	unsigned long result;

-	switch (value) {
-	case 128:
-		ideapad_input_report(priv, value);
+	switch (*event) {
+	case IDEAPAD_WMI_EVENT_ESC:
+		ideapad_input_report(priv, 128);
 		break;
-	case 208:
+	case IDEAPAD_WMI_EVENT_FN_KEYS:
 		if (!eval_hals(priv->adev->handle, &result)) {
 			bool state =3D test_bit(HALS_FNLOCK_STATE_BIT, &result);

 			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF=
);
 		}
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
 		break;
-	default:
-		dev_info(&priv->platform_device->dev,
-			 "Unknown WMI event: %u\n", value);
 	}
 }
 #endif
@@ -1671,25 +1724,24 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
 	}

 #if IS_ENABLED(CONFIG_ACPI_WMI)
-	for (i =3D 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
-		status =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
-						    ideapad_wmi_notify, priv);
-		if (ACPI_SUCCESS(status)) {
-			priv->fnesc_guid =3D ideapad_wmi_fnesc_events[i];
-			break;
-		}
-	}
+	priv->wmi_drv =3D (struct wmi_driver) {
+		.driver =3D {
+			.name =3D "ideapad-wmi-fn-keys",
+		},
+		.id_table =3D ideapad_wmi_id_table,
+		.probe =3D ideapad_wmi_probe,
+		.notify =3D ideapad_wmi_notify,
+	};

-	if (ACPI_FAILURE(status) && status !=3D AE_NOT_EXIST) {
-		err =3D -EIO;
-		goto notification_failed_wmi;
-	}
+	err =3D wmi_driver_register(&priv->wmi_drv);
+	if (err)
+		goto register_failed_wmi;
 #endif

 	return 0;

 #if IS_ENABLED(CONFIG_ACPI_WMI)
-notification_failed_wmi:
+register_failed_wmi:
 	acpi_remove_notify_handler(priv->adev->handle,
 				   ACPI_DEVICE_NOTIFY,
 				   ideapad_acpi_notify);
@@ -1720,8 +1772,7 @@ static int ideapad_acpi_remove(struct platform_devic=
e *pdev)
 	int i;

 #if IS_ENABLED(CONFIG_ACPI_WMI)
-	if (priv->fnesc_guid)
-		wmi_remove_notify_handler(priv->fnesc_guid);
+	wmi_driver_unregister(&priv->wmi_drv);
 #endif

 	acpi_remove_notify_handler(priv->adev->handle,
=2D-
2.38.1

