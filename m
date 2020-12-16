Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1495C2BBCF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76FF52311F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgLPBku (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:50 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:56264 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgLPBku (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:50 -0500
Date:   Wed, 16 Dec 2020 01:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082765;
        bh=XxkYsJ/YJaPiKvHbz0baBZQkmkFSZ3WEqVClkqWLKqQ=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=h2DkDVNlSMN++km3jzieZHY76F+clRxouj+7rSIAfUQJaZ3ypJ9/q0FigYd0ey8yl
         SbcM6V+yA2uh3j8ytX7za6T6hM1KswBdecWalqx844f+yTOE4Yy2Ig8429r/HZY2EW
         d79FDSa4Xcyuh5inGVBKaWNhVbN8VsEzVqhMuU9I=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 05/24] platform/x86: ideapad-laptop: use for_each_set_bit() helper to simplify event processing
Message-ID: <20201216013857.360987-6-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current code used the combination of a for loop + test_bit, which can
be simplified using for_each_set_bit(), so utilize that.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 11df791d702c..22e1b3fd3df5 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -11,6 +11,7 @@
 #include <acpi/video.h>
 #include <linux/acpi.h>
 #include <linux/backlight.h>
+#include <linux/bitops.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
@@ -738,22 +739,20 @@ static void ideapad_check_special_buttons(struct idea=
pad_private *priv)
=20
 =09read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value);
=20
-=09for (bit =3D 0; bit < 16; bit++) {
-=09=09if (test_bit(bit, &value)) {
-=09=09=09switch (bit) {
-=09=09=09case 0:=09/* Z580 */
-=09=09=09case 6:=09/* Z570 */
-=09=09=09=09/* Thermal Management button */
-=09=09=09=09ideapad_input_report(priv, 65);
-=09=09=09=09break;
-=09=09=09case 1:
-=09=09=09=09/* OneKey Theater button */
-=09=09=09=09ideapad_input_report(priv, 64);
-=09=09=09=09break;
-=09=09=09default:
-=09=09=09=09pr_info("Unknown special button: %lu\n", bit);
-=09=09=09=09break;
-=09=09=09}
+=09for_each_set_bit(bit, &value, 16) {
+=09=09switch (bit) {
+=09=09case 0:=09/* Z580 */
+=09=09case 6:=09/* Z570 */
+=09=09=09/* Thermal Management button */
+=09=09=09ideapad_input_report(priv, 65);
+=09=09=09break;
+=09=09case 1:
+=09=09=09/* OneKey Theater button */
+=09=09=09ideapad_input_report(priv, 64);
+=09=09=09break;
+=09=09default:
+=09=09=09pr_info("Unknown special button: %lu\n", bit);
+=09=09=09break;
 =09=09}
 =09}
 }
@@ -884,7 +883,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_=
private *priv)
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 =09struct ideapad_private *priv =3D data;
-=09unsigned long vpc1, vpc2, vpc_bit;
+=09unsigned long vpc1, vpc2, bit;
=20
 =09if (read_ec_data(handle, VPCCMD_R_VPC1, &vpc1))
 =09=09return;
@@ -892,44 +891,42 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
 =09=09return;
=20
 =09vpc1 =3D (vpc2 << 8) | vpc1;
-=09for (vpc_bit =3D 0; vpc_bit < 16; vpc_bit++) {
-=09=09if (test_bit(vpc_bit, &vpc1)) {
-=09=09=09switch (vpc_bit) {
-=09=09=09case 9:
-=09=09=09=09ideapad_sync_rfk_state(priv);
-=09=09=09=09break;
-=09=09=09case 13:
-=09=09=09case 11:
-=09=09=09case 8:
-=09=09=09case 7:
-=09=09=09case 6:
-=09=09=09=09ideapad_input_report(priv, vpc_bit);
-=09=09=09=09break;
-=09=09=09case 5:
-=09=09=09=09ideapad_sync_touchpad_state(priv);
-=09=09=09=09break;
-=09=09=09case 4:
-=09=09=09=09ideapad_backlight_notify_brightness(priv);
-=09=09=09=09break;
-=09=09=09case 3:
-=09=09=09=09ideapad_input_novokey(priv);
-=09=09=09=09break;
-=09=09=09case 2:
-=09=09=09=09ideapad_backlight_notify_power(priv);
-=09=09=09=09break;
-=09=09=09case 0:
-=09=09=09=09ideapad_check_special_buttons(priv);
-=09=09=09=09break;
-=09=09=09case 1:
-=09=09=09=09/* Some IdeaPads report event 1 every ~20
-=09=09=09=09 * seconds while on battery power; some
-=09=09=09=09 * report this when changing to/from tablet
-=09=09=09=09 * mode. Squelch this event.
-=09=09=09=09 */
-=09=09=09=09break;
-=09=09=09default:
-=09=09=09=09pr_info("Unknown event: %lu\n", vpc_bit);
-=09=09=09}
+=09for_each_set_bit(bit, &vpc1, 16) {
+=09=09switch (bit) {
+=09=09case 9:
+=09=09=09ideapad_sync_rfk_state(priv);
+=09=09=09break;
+=09=09case 13:
+=09=09case 11:
+=09=09case 8:
+=09=09case 7:
+=09=09case 6:
+=09=09=09ideapad_input_report(priv, bit);
+=09=09=09break;
+=09=09case 5:
+=09=09=09ideapad_sync_touchpad_state(priv);
+=09=09=09break;
+=09=09case 4:
+=09=09=09ideapad_backlight_notify_brightness(priv);
+=09=09=09break;
+=09=09case 3:
+=09=09=09ideapad_input_novokey(priv);
+=09=09=09break;
+=09=09case 2:
+=09=09=09ideapad_backlight_notify_power(priv);
+=09=09=09break;
+=09=09case 0:
+=09=09=09ideapad_check_special_buttons(priv);
+=09=09=09break;
+=09=09case 1:
+=09=09=09/* Some IdeaPads report event 1 every ~20
+=09=09=09 * seconds while on battery power; some
+=09=09=09 * report this when changing to/from tablet
+=09=09=09 * mode. Squelch this event.
+=09=09=09 */
+=09=09=09break;
+=09=09default:
+=09=09=09pr_info("Unknown event: %lu\n", bit);
 =09=09}
 =09}
 }
--=20
2.29.2


