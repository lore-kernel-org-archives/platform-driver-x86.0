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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F630C433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52D0B64D90
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:57:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232437AbhBCV5g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:36 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:36949 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232506AbhBCV52 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:28 -0500
Date:   Wed, 03 Feb 2021 21:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389405;
        bh=KYuM2LWlGBHP3Fdn8PrtE8hJkOBjwRdF7fC1KJvyfIY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=l5S04E4l7Uw6L5u8KRgfcnMqlbIqCdob1lok+jPZ2WEzUmlv15ERGTlT+6M65Yf4i
         OOKWHeSNUDGH2qK5MlSEKIrMncHimwAp8DqWbP7uG29xCCCwwDwttICemc/pf2inVt
         OOrtN+qaoviaqA0IcyVI0wPkdFooJP5IdS7erRI4=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 22/29] platform/x86: ideapad-laptop: change 'cfg' debugfs file format
Message-ID: <20210203215403.290792-23-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Minor formatting changes. Use seq_puts() where possible.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 34e93ac83d8e..0a5ca91cfe9e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -322,37 +322,40 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 {
 =09struct ideapad_private *priv =3D s->private;
=20
-=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
-=09=09   priv->cfg);
+=09seq_printf(s, "_CFG: %#010lx\n\n", priv->cfg);
+
+=09seq_puts(s, "Capabilities:");
 =09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
-=09=09seq_printf(s, "Bluetooth ");
+=09=09seq_puts(s, " bluetooth");
 =09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
-=09=09seq_printf(s, "3G ");
+=09=09seq_puts(s, " 3G");
 =09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
-=09=09seq_printf(s, "Wireless ");
+=09=09seq_puts(s, " wifi");
 =09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
-=09=09seq_printf(s, "Camera ");
+=09=09seq_puts(s, " camera");
 =09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
-=09=09seq_printf(s, "Touchpad ");
-=09seq_printf(s, "\nGraphic: ");
-=09switch ((priv->cfg)&0x700) {
+=09=09seq_puts(s, " touchpad");
+=09seq_puts(s, "\n");
+
+=09seq_puts(s, "Graphics: ");
+=09switch (priv->cfg & 0x700) {
 =09case 0x100:
-=09=09seq_printf(s, "Intel");
+=09=09seq_puts(s, "Intel");
 =09=09break;
 =09case 0x200:
-=09=09seq_printf(s, "ATI");
+=09=09seq_puts(s, "ATI");
 =09=09break;
 =09case 0x300:
-=09=09seq_printf(s, "Nvidia");
+=09=09seq_puts(s, "Nvidia");
 =09=09break;
 =09case 0x400:
-=09=09seq_printf(s, "Intel and ATI");
+=09=09seq_puts(s, "Intel and ATI");
 =09=09break;
 =09case 0x500:
-=09=09seq_printf(s, "Intel and Nvidia");
+=09=09seq_puts(s, "Intel and Nvidia");
 =09=09break;
 =09}
-=09seq_printf(s, "\n");
+=09seq_puts(s, "\n");
=20
 =09return 0;
 }
--=20
2.30.0


