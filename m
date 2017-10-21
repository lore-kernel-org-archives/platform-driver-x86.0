From: Osama Khan <osama.khan@ericsson.com>
Subject: [PATCH] hp_accel: Add accelerometer quirk for HP ProBook 440 G4
Date: Sat, 21 Oct 2017 10:42:21 +0000
Message-ID: <DB6PR07MB31265A5AD192563695B8B929FA4E0@DB6PR07MB3126.eurprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sessmg22.ericsson.net ([193.180.251.58]:61220 "EHLO
        sessmg22.ericsson.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753278AbdJUKmZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Oct 2017 06:42:25 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "eric.piel@tremplin-utc.net" <eric.piel@tremplin-utc.net>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Added support for HP ProBook 440 G4 laptops by including the accelerometer
orientation quirk for that device. Testing was performed based on the=20
axis orientation guidelines here:
https://www.kernel.org/doc/Documentation/misc-devices/lis3lv02d
which states "If the left side is elevated, X increases (becomes positive)"

When tested, on lifting the left edge, x values became increasingly negativ=
e
thus indicating an inverted x-axis on the installed lis3lv02d chip.
This was compensated by adding an entry for this device in hp_accel.c
specifying the quirk as x_inverted. The patch was tested on a=20
ProBook 440 G4 device and x-axis as well as y and z-axis values are now=20
generated as per spec.

Signed-off-by: Osama Khan <osama.khan@ericsson.com>
---
diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_acce=
l.c
index 493d8910a74e..7b12abe86b94 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -240,6 +240,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] =
=3D {
        AXIS_DMI_MATCH("HDX18", "HP HDX 18", x_inverted),
        AXIS_DMI_MATCH("HPB432x", "HP ProBook 432", xy_rotated_left),
        AXIS_DMI_MATCH("HPB440G3", "HP ProBook 440 G3", x_inverted_usd),
+       AXIS_DMI_MATCH("HPB440G4", "HP ProBook 440 G4", x_inverted),
        AXIS_DMI_MATCH("HPB442x", "HP ProBook 442", xy_rotated_left),
        AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
        AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),=
