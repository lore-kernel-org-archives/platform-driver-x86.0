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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D01D3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89DCC64E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231318AbhBCVzM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:12 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:36457 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhBCVzM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:12 -0500
Date:   Wed, 03 Feb 2021 21:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389268;
        bh=f+s3FKUUVIlhtTL6sCAW7iQ8CbpTkQoqYumsK5ubpmo=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=tRpCTRyPQQO87NpJ3iitPt1UxXd556Wsnq09rbYVDstNmYUl/4za33kAGZRznXphD
         OIWQT+QL1Y/u//pNXXdMCuDfQapdESO8i8v5YuA0TDolkdsLR8J6z3aYG1w6Zt5B55
         DSIN7LLZUp3YpXuBAs8tvyHWpGZlBAOJHLbHQRag=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 02/29] platform/x86: ideapad-laptop: remove unnecessary NULL checks
Message-ID: <20210203215403.290792-3-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The checks that are removed test pointers which should not
be NULL. If they are NULL, that indicates a bug in
a different part of the kernel. Instead of silently
bailing out, let it fail loudly.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 18c71e28ebc8..415d362a642a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -264,9 +264,6 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
 =09struct ideapad_private *priv =3D s->private;
 =09unsigned long value;
=20
-=09if (!priv)
-=09=09return -EINVAL;
-
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
 =09=09seq_printf(s, "Backlight max:\t%lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
@@ -311,39 +308,36 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 {
 =09struct ideapad_private *priv =3D s->private;
=20
-=09if (!priv) {
-=09=09seq_printf(s, "cfg: N/A\n");
-=09} else {
-=09=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
-=09=09=09   priv->cfg);
-=09=09if (test_bit(CFG_BT_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Bluetooth ");
-=09=09if (test_bit(CFG_3G_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "3G ");
-=09=09if (test_bit(CFG_WIFI_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Wireless ");
-=09=09if (test_bit(CFG_CAMERA_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Camera ");
-=09=09seq_printf(s, "\nGraphic: ");
-=09=09switch ((priv->cfg)&0x700) {
-=09=09case 0x100:
-=09=09=09seq_printf(s, "Intel");
-=09=09=09break;
-=09=09case 0x200:
-=09=09=09seq_printf(s, "ATI");
-=09=09=09break;
-=09=09case 0x300:
-=09=09=09seq_printf(s, "Nvidia");
-=09=09=09break;
-=09=09case 0x400:
-=09=09=09seq_printf(s, "Intel and ATI");
-=09=09=09break;
-=09=09case 0x500:
-=09=09=09seq_printf(s, "Intel and Nvidia");
-=09=09=09break;
-=09=09}
-=09=09seq_printf(s, "\n");
+=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
+=09=09   priv->cfg);
+=09if (test_bit(CFG_BT_BIT, &priv->cfg))
+=09=09seq_printf(s, "Bluetooth ");
+=09if (test_bit(CFG_3G_BIT, &priv->cfg))
+=09=09seq_printf(s, "3G ");
+=09if (test_bit(CFG_WIFI_BIT, &priv->cfg))
+=09=09seq_printf(s, "Wireless ");
+=09if (test_bit(CFG_CAMERA_BIT, &priv->cfg))
+=09=09seq_printf(s, "Camera ");
+=09seq_printf(s, "\nGraphic: ");
+=09switch ((priv->cfg)&0x700) {
+=09case 0x100:
+=09=09seq_printf(s, "Intel");
+=09=09break;
+=09case 0x200:
+=09=09seq_printf(s, "ATI");
+=09=09break;
+=09case 0x300:
+=09=09seq_printf(s, "Nvidia");
+=09=09break;
+=09case 0x400:
+=09=09seq_printf(s, "Intel and ATI");
+=09=09break;
+=09case 0x500:
+=09=09seq_printf(s, "Intel and Nvidia");
+=09=09break;
 =09}
+=09seq_printf(s, "\n");
+
 =09return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
@@ -1050,9 +1044,6 @@ static int ideapad_backlight_get_brightness(struct ba=
cklight_device *blightdev)
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
 =09unsigned long now;
=20
-=09if (!priv)
-=09=09return -EINVAL;
-
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now))
 =09=09return -EIO;
 =09return now;
@@ -1062,9 +1053,6 @@ static int ideapad_backlight_update_status(struct bac=
klight_device *blightdev)
 {
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
=20
-=09if (!priv)
-=09=09return -EINVAL;
-
 =09if (write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
 =09=09=09 blightdev->props.brightness))
 =09=09return -EIO;
@@ -1374,13 +1362,9 @@ static int ideapad_acpi_remove(struct platform_devic=
e *pdev)
 }
=20
 #ifdef CONFIG_PM_SLEEP
-static int ideapad_acpi_resume(struct device *device)
+static int ideapad_acpi_resume(struct device *dev)
 {
-=09struct ideapad_private *priv;
-
-=09if (!device)
-=09=09return -EINVAL;
-=09priv =3D dev_get_drvdata(device);
+=09struct ideapad_private *priv =3D dev_get_drvdata(dev);
=20
 =09ideapad_sync_rfk_state(priv);
 =09ideapad_sync_touchpad_state(priv);
--=20
2.30.0


