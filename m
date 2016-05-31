From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH] ideadpad: Runtime check for hw touchpad control
Date: Tue, 31 May 2016 19:21:07 -0400
Message-ID: <1464736867-6084-1-git-send-email-jprvita@endlessm.com>
References: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34744 "EHLO
	mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757038AbcEaXVo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 31 May 2016 19:21:44 -0400
Received: by mail-qk0-f195.google.com with SMTP id 8so335816qkj.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 May 2016 16:21:43 -0700 (PDT)
In-Reply-To: <CA+A7VXVJ6eCXmzFmO4Ek4TxMNKFA+BoKyj0Fm7s0ycn+Ev5cTg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Christian Hesse <list@eworm.de>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>, Michael Gisbers <michael@gisbers.de>, Christian Hesse <mail@eworm.de>, hdegoede@redhat.com, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

Check if disabling the i8042 AUX port has any effect on
VPCCMD_R_TOUCHPAD, and use that information to decide whether or not
ideapad_sync_touchpad_state() should do something.

Signed-off-by: Jo=C3=A3o Paulo Rechi Vita <jprvita@endlessm.com>
---
 drivers/platform/x86/ideapad-laptop.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x=
86/ideapad-laptop.c
index 06a837a..08dd487 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -93,6 +93,7 @@ struct ideapad_private {
 	struct dentry *debug;
 	unsigned long cfg;
 	bool has_hw_rfkill_switch;
+	bool has_hw_tp_ctrl;
 };
=20
 static bool no_bt_rfkill;
@@ -773,6 +774,9 @@ static void ideapad_sync_touchpad_state(struct idea=
pad_private *priv)
 {
 	unsigned long value;
=20
+	if (!priv->has_hw_tp_ctrl)
+		return;
+
 	/* Without reading from EC touchpad LED doesn't switch state */
 	if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value)) {
 		/* Some IdeaPads don't really turn off touchpad - they only
@@ -930,6 +934,18 @@ static const struct dmi_system_id no_hw_rfkill_lis=
t[] =3D {
 	{}
 };
=20
+static bool ideapad_has_touchpad_ctrl(struct ideapad_private *priv)
+{
+	unsigned char param;
+	unsigned long value_disabled, value_enabled;
+
+	i8042_command(&param, I8042_CMD_AUX_DISABLE);
+	read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_disabled);
+	i8042_command(&param, I8042_CMD_AUX_ENABLE);
+	read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value_enabled);
+	return (value_disabled !=3D value_enabled);
+}
+
 static int ideapad_acpi_add(struct platform_device *pdev)
 {
 	int ret, i;
@@ -978,6 +994,7 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 			ideapad_register_rfkill(priv, i);
=20
 	ideapad_sync_rfk_state(priv);
+	priv->has_hw_tp_ctrl =3D ideapad_has_touchpad_ctrl(priv);
 	ideapad_sync_touchpad_state(priv);
=20
 	if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
--=20
2.5.0
