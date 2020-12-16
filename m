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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C006C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B592311F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgLPBke (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:34 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:50678 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBkd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:33 -0500
Date:   Wed, 16 Dec 2020 01:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082770;
        bh=NkB7kbJVe4dp8t1ay4K8XBkHafYB6Uo+1zaC+/My/Wc=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=XZnbnCIBACrHtvBaXDrqMnlBP5BVKS2K1j7/OH7K6AXvjKmlTtsGk4Az13jkTC5rP
         UpB/H7odpwSa2oNM8UU4FGzU2bToOAWeAWPoaG6LI9kacuWSIFs70qUzHfGft/maWa
         xAMcdTXnpkRFD2Ch6wSKit2uTzyIP7KZ7tTVavJg=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 07/24] platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate variant to display log messages
Message-ID: <20201216013857.360987-8-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
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

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 798723c88a68..d9ac96f6b465 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -201,7 +201,7 @@ static int read_ec_data(acpi_handle handle, int cmd, un=
signed long *data)
 =09=09=09return 0;
 =09=09}
 =09}
-=09pr_err("timeout in %s\n", __func__);
+=09acpi_handle_err(handle, "timeout in %s\n", __func__);
 =09return -1;
 }
=20
@@ -223,7 +223,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
 =09=09if (val =3D=3D 0)
 =09=09=09return 0;
 =09}
-=09pr_err("timeout in %s\n", __func__);
+=09acpi_handle_err(handle, "timeout in %s\n", __func__);
 =09return -1;
 }
=20
@@ -692,13 +692,15 @@ static int ideapad_input_init(struct ideapad_private =
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
@@ -752,7 +754,8 @@ static void ideapad_check_special_buttons(struct ideapa=
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
@@ -818,7 +821,8 @@ static int ideapad_backlight_init(struct ideapad_privat=
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
@@ -927,7 +931,8 @@ static void ideapad_acpi_notify(acpi_handle handle, u32=
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
@@ -935,12 +940,15 @@ static void ideapad_acpi_notify(acpi_handle handle, u=
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
2.29.2


