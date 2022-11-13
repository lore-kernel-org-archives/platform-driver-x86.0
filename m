Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F55C4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 13 Nov 2022 12:13:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbiKMMN0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 13 Nov 2022 07:13:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbiKMMNZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Nov 2022 07:13:25 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B93B11444
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Nov 2022 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668341594; bh=oCt7B4eytHJFPxNdxJ6JvMxFokZ/a5T2Am0/yEgRMxE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FCogQnBVP+5suHU/fA4w2qSV7UWLJRbhUnv0A8UfMllg+iei3yqyJTw48yOWgrpTB
         tJzaBDDmkbXY9al87Br75thq1wPCj9QKrzPvdiPLyV34Jj2xL6pbuq/xJQfhxiFzX9
         n+VNlUz09ShanMhGnMHKyjZY4PeRO/e9BTDo/GLH7YlZfVPkN0TOb5qGlotB5mIS2J
         OT1SRfXgZ+E57sFRxfVwihNqRJKMw9/Ko3yczxs46pXyi/ij8Eg6YBQR3ztrixfkFl
         YAKRQWyGJ+pg3H6jW4G8A8+/MT94hgve8J6tPUgIPbyBdJNySulAvkHOfkFJGXtK3M
         oulOg5C67Q6VA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from yoga9.fritz.box ([88.130.60.234]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPGRz-1obfMq3HHJ-00Pgh5; Sun, 13
 Nov 2022 13:13:13 +0100
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Philipp Jungkamp <p.jungkamp@gmx.net>
Subject: [PATCH v2 2/2] platform/x86: ideapad-laptop: support for more special keys in WMI
Date:   Sun, 13 Nov 2022 13:12:59 +0100
Message-Id: <20221113121259.14895-2-p.jungkamp@gmx.net>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221113121259.14895-1-p.jungkamp@gmx.net>
References: <8d54fbbb-0933-aaea-5f66-bb7807f5506d@redhat.com>
 <20221113121259.14895-1-p.jungkamp@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m5zsMZJ7UK4UdX6K9YuARzOtnsRQERADp/CZmJjTK6FpS58J9BU
 9IxXER6uMo6+PhD7YU/y3yIZAw4fsiMSOFlpENpVdB+Djye7Go4zdDo4fim7Oi3p4XP50uu
 FRr17BnlRnU7Lmla+HYFuwZyzqwL05J2ACMujRdE9YOW1pVaDpecE9VQqM7rmOBbUzv/pEV
 kN/vEJ4oQNRIa2v5rf3nA==
UI-OutboundReport: notjunk:1;M01:P0:Ht/9hcUYOcU=;YaLZq693TD8BE9lkwUipGp2jpPJ
 8sz0l6NYN/UgA0oskZd1YsfAxEfiY844Jha5+Bia8t0L9i2SCfIiF1yrMb5ljqJuPaqW4SW3L
 4mXPorn/2LKbIuImTft2qAmqwdiqfJD384+zWqY/jxO5NSq23IFAg7XTBsZIQ+ynj8/AlOX1Z
 ZesX/c9afwxwABR3CynzAlJZqVgEgWhy3x5khsD1zBE/KlJvRWgW36IOGC5Rpwm5qWSCV9RCt
 QPLYueei7mdRKgbMRuboxv554SUJKDtX8YTAExQUgl2vSzlGx8lwq8ye9wvwsriWe18QWRUc3
 YHAyg+JCfKQBTpMVJuwyNRe2jM4tXwKzOyHuiyWHjFNeL4kS1OJexhTrYxDKLawMeXXWIewdJ
 DNoqlQzC8PxkyUA1qR6JMSpQk7pttLrxARY3gIVcPFaDcrGuQIMyjatTWQY34VsjkIct1tvlC
 U3AQJvGJeJd1PZ6sQCcIcnUMvxpBSBfduVZaEP3GeK/rHnqC1PJX63fCMQWF4XbZgZpVgJbky
 WXyltg5eD9/3Mh/L4SMbPFi1PqM53zSLit4wc69APuZUkIedUaOqdAAMBr4fH1hI/SXxQIYmR
 mF2hEUTesuO88nyXgtmXDP2vVXdLM63oxiKaj6VUWE/PL6kXPctmDze3Ea5c76AGX+V3fzAaQ
 g/gqqeG9gniupFfYZYKKiyuzZ4UdblMeTAANA2N0W+rlgsB1iTJfl1iudjqR/noDF0RrNoRoD
 cQ74Cte+QujsjeFFOxXaZlsd3M1ZnMXLKVFqll0io/7Gv+fD6/cmdjpk5IDHGVoFF1B5GS24L
 utmW64deZFe4qwMGT/iBdGNzpK0MqT7zFOA25x1DLoyFSasmefvSWEuD6U/4tPxgRjR8AKp5E
 Rj3/3AAF9+uSYEfuk8OY6o3MoNYw+ZKzTWSuxoMroiuz88p9mFpyTBEkGN+GLZ0EQ31QUTf8Q
 hDjmRTE84muNb2JH4Teh2IOwPDo=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The event data of the WMI event 0xD0, which is assumed to be the
fn_lock, is used to indicate several special keys on newer Yoga 7/9
laptops.

Add support for these keys using the wmi_get_event_data_with_guid()
function.

Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
=2D--
I can't really judge how this would affect other devices which depend on t=
he
event to toggle their fn-lock light unconditionally.

One could check whether the event data on those devices makes it clear whe=
n
exactly the eval_hals()/exec_sals() path is needed. This should be observa=
ble
through the dev_dbg() put before the ideapad_input_report().

 drivers/platform/x86/ideapad-laptop.c | 46 +++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/=
ideapad-laptop.c
index 33b3dfdd1b08..2ade423c7813 100644
=2D-- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1074,6 +1074,7 @@ static void ideapad_sysfs_exit(struct ideapad_privat=
e *priv)
 /*
  * input device
  */
+#define IDEAPAD_WMI_KEY 0x100
 static const struct key_entry ideapad_keymap[] =3D {
 	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY,   7, { KEY_CAMERA } },
@@ -1087,6 +1088,26 @@ static const struct key_entry ideapad_keymap[] =3D =
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

@@ -1496,6 +1517,10 @@ static void ideapad_wmi_notify(u32 value, void *con=
text)
 	struct ideapad_private *priv =3D context;
 	unsigned long result;

+	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *data;
+	acpi_status status;
+
 	switch (value) {
 	case 128:
 		ideapad_input_report(priv, value);
@@ -1506,6 +1531,27 @@ static void ideapad_wmi_notify(u32 value, void *con=
text)

 			exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF=
);
 		}
+
+		status =3D wmi_get_event_data_with_guid(priv->fnesc_guid, value, &respo=
nse);
+		if (ACPI_FAILURE(status)) {
+			dev_warn(&priv->platform_device->dev,
+				"Bad WMI event data 0x%x\n", status);
+			break;
+		}
+
+		data =3D (union acpi_object *) response.pointer;
+		if (data->type !=3D ACPI_TYPE_INTEGER) {
+			dev_warn(&priv->platform_device->dev,
+				"WMI event data is not an integer\n");
+		} else {
+			dev_dbg(&priv->platform_device->dev,
+				"WMI event: notify_id=3D%d, data=3D%d\n",
+				value,
+				data->integer.value);
+			ideapad_input_report(priv, data->integer.value | IDEAPAD_WMI_KEY);
+		}
+
+		kfree(response.pointer);
 		break;
 	default:
 		dev_info(&priv->platform_device->dev,
=2D-
2.38.1

