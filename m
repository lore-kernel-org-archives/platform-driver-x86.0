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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E277C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:41:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 433BD2310F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:41:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgLPBlH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:41:07 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:40660 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgLPBlH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:07 -0500
Date:   Wed, 16 Dec 2020 01:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082825;
        bh=xN7zga3uuEFl39t+SdKQIEy6+Xkao5T9x0qM5fS77/o=;
        h=Date:To:From:Reply-To:Subject:From;
        b=h4rViDXSBK6bbcHGbqKiDGydkZWyqnyxiyKZHhOa7J3vCuxrZit/JGV9c2tMVtZkU
         Q9oXgmBPz0e1AbKkzmRZqimVsJ8OiTiBPc+vsebjmxUnySi26SEzxXNN2AifqihwPk
         1KAYZJSQ+8Y9pVEh8CWHuRhyOOEV1usJ062Agr+E=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 17/24] platform/x86: ideapad-laptop: change 'cfg' debugfs file format
Message-ID: <20201216013857.360987-18-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Return -ENODATA when the driver-specific data is not available.
Minor formatting changes. Use seq_puts() where possible.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index b1b77eb31779..f5a1d7041aab 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -298,41 +298,44 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 {
 =09struct ideapad_private *priv =3D s->private;
=20
-=09if (!priv) {
-=09=09seq_printf(s, "cfg: N/A\n");
-=09} else {
-=09=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
-=09=09=09   priv->cfg);
-=09=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Bluetooth ");
-=09=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "3G ");
-=09=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Wireless ");
-=09=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Camera ");
-=09=09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Touchpad ");
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
+=09if (!priv)
+=09=09return -ENODATA;
+
+=09seq_printf(s, "_CFG: %#010lx\n\n", priv->cfg);
+
+=09seq_puts(s, "Capabilities:");
+=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
+=09=09seq_puts(s, " bluetooth");
+=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
+=09=09seq_puts(s, " 3G");
+=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
+=09=09seq_puts(s, " wifi");
+=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
+=09=09seq_puts(s, " camera");
+=09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
+=09=09seq_puts(s, " touchpad");
+=09seq_puts(s, "\n");
+
+=09seq_puts(s, "Graphics:");
+=09switch (priv->cfg & 0x700) {
+=09case 0x100:
+=09=09seq_puts(s, "Intel");
+=09=09break;
+=09case 0x200:
+=09=09seq_puts(s, "ATI");
+=09=09break;
+=09case 0x300:
+=09=09seq_puts(s, "Nvidia");
+=09=09break;
+=09case 0x400:
+=09=09seq_puts(s, "Intel and ATI");
+=09=09break;
+=09case 0x500:
+=09=09seq_puts(s, "Intel and Nvidia");
+=09=09break;
 =09}
+=09seq_puts(s, "\n");
+
 =09return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
--=20
2.29.2


