Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D554C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 014DF23436
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbhAMSWE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:22:04 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:16718 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbhAMSWD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:03 -0500
Date:   Wed, 13 Jan 2021 18:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562080;
        bh=vBkONu6Jei4xIWcqx5RgdZRGm18rGH/qDkfVBKqoJjQ=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=VsySn14zOsVFYMn9/IHGpL3yuolkJgHz4sWbeFLceG9MfIs8d510ueUey0Gn4EU9n
         DPYGPHTFuoHaiKlWdUySkFSFTOM5+fqS7mpV+4734gKGtfQzTLtk1S0kdJOLsRKoqv
         DkcCly3Ku59Qrn0oaThQZOu9jkPfXfNm3OWX+Unc=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 07/24] platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate variant to display log messages
Message-ID: <20210113182016.166049-8-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Having the device name in the log message makes it easier to determine in
the context of which device the message was printed, so utilize the
appropriate variants of dev_{err,warn,...} when printing log messages.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 174edbfc52dc..b0d8e332b48a 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -203,7 +203,7 @@ static int read_ec_data(acpi_handle handle, int cmd, un=
signed long *data)
 =09=09=09return 0;
 =09=09}
 =09}
-=09pr_err("timeout in %s\n", __func__);
+=09acpi_handle_err(handle, "timeout in %s\n", __func__);
 =09return -1;
 }
=20
@@ -225,7 +225,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
 =09=09if (val =3D=3D 0)
 =09=09=09return 0;
 =09}
-=09pr_err("timeout in %s\n", __func__);
+=09acpi_handle_err(handle, "timeout in %s\n", __func__);
 =09return -1;
 }
=20
@@ -696,13 +696,15 @@ static int ideapad_input_init(struct ideapad_private =
*priv)
=20
 =09error =3D sparse_keymap_setup(inputdev, ideapad_keymap, NULL);
 =09if (error) {
-=09=09pr_err("Unable to setup input device keymap\n");
+=09=09dev_err(&priv->platform_device->dev,
+=09=09=09"Unable to setup input device keymap\n");
 =09=09goto err_free_dev;
 =09}
=20
 =09error =3D input_register_device(inputdev);
 =09if (error) {
-=09=09pr_err("Unable to register input device\n");
+=09=09dev_err(&priv->platform_device->dev,
+=09=09=09"Unable to register input device\n");
 =09=09goto err_free_dev;
 =09}
=20
@@ -756,7 +758,8 @@ static void ideapad_check_special_buttons(struct ideapa=
d_private *priv)
 =09=09=09ideapad_input_report(priv, 64);
 =09=09=09break;
 =09=09default:
-=09=09=09pr_info("Unknown special button: %lu\n", bit);
+=09=09=09dev_warn(&priv->platform_device->dev,
+=09=09=09=09 "Unknown special button: %lu\n", bit);
 =09=09=09break;
 =09=09}
 =09}
@@ -822,7 +825,8 @@ static int ideapad_backlight_init(struct ideapad_privat=
e *priv)
 =09=09=09=09=09      &ideapad_backlight_ops,
 =09=09=09=09=09      &props);
 =09if (IS_ERR(blightdev)) {
-=09=09pr_err("Could not register backlight device\n");
+=09=09dev_warn(&priv->platform_device->dev,
+=09=09=09 "Could not register backlight device\n");
 =09=09return PTR_ERR(blightdev);
 =09}
=20
@@ -934,7 +938,8 @@ static void ideapad_acpi_notify(acpi_handle handle, u32=
 event, void *data)
 =09=09=09 */
 =09=09=09break;
 =09=09default:
-=09=09=09pr_info("Unknown event: %lu\n", bit);
+=09=09=09dev_warn(&priv->platform_device->dev,
+=09=09=09=09 "Unknown event: %lu\n", bit);
 =09=09}
 =09}
 }
@@ -942,12 +947,15 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
32 event, void *data)
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 static void ideapad_wmi_notify(u32 value, void *context)
 {
+=09struct ideapad_private *priv =3D context;
+
 =09switch (value) {
 =09case 128:
-=09=09ideapad_input_report(context, value);
+=09=09ideapad_input_report(priv, value);
 =09=09break;
 =09default:
-=09=09pr_info("Unknown WMI event %u\n", value);
+=09=09dev_warn(&priv->platform_device->dev,
+=09=09=09 "Unknown WMI event: %u\n", value);
 =09}
 }
 #endif
--=20
2.30.0

