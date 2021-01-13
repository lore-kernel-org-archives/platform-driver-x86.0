Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AE1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1B742343E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbhAMSXA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:00 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:51336 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbhAMSXA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:00 -0500
Date:   Wed, 13 Jan 2021 18:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562137;
        bh=eXIYyDfjxzvjzxc0grGny/O4Ti+83xM/pWez4F/9rfw=;
        h=Date:To:From:Reply-To:Subject:From;
        b=gjbZ75zMqZ9ai/Fb4sd7hgeLqEAC1enuL4StRTWPSa32d+Pj34dI0hZT/ovniKuAf
         d5XzOSACW+q+DVp382uojC0LZz+PS0sujhC4d/luP7ra7fbZA3Wh/RLXyBK6tTJSSR
         bpM99/ZDDDdOcFbiOGhuW8xClE/PFPQD5jyUOD0g=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 16/24] platform/x86: ideapad-laptop: change 'status' debugfs file format
Message-ID: <20210113182016.166049-17-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove conservation mode reporting since it is already reported via the
appropriate device attribute, and its state can be deduced from the value
of GBMD. Add the return value of the GBMD and HALS ACPI methods to the
output. Change the return value to -ENODATA when the driver-specific data
is not available. Use seq_puts() where possible.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 057426729536..c72e967e9ac2 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -261,43 +261,36 @@ static int debugfs_status_show(struct seq_file *s, vo=
id *data)
 =09unsigned long value;
=20
 =09if (!priv)
-=09=09return -EINVAL;
+=09=09return -ENODATA;
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
 =09=09seq_printf(s, "Backlight max:\t%lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
 =09=09seq_printf(s, "Backlight now:\t%lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
-=09=09seq_printf(s, "BL power value:\t%s\n", value ? "On" : "Off");
-=09seq_printf(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+=09=09seq_printf(s, "BL power value:\t%s (%lu)\n", value ? "on" : "off", v=
alue);
+=09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
-=09=09seq_printf(s, "Radio status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Radio status:\t%s (%lu)\n", value ? "on" : "off", val=
ue);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
-=09=09seq_printf(s, "Wifi status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Wifi status:\t%s (%lu)\n", value ? "on" : "off", valu=
e);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
-=09=09seq_printf(s, "BT status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "BT status:\t%s (%lu)\n", value ? "on" : "off", value)=
;
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
-=09=09seq_printf(s, "3G status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
-=09seq_printf(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+=09=09seq_printf(s, "3G status:\t%s (%lu)\n", value ? "on" : "off", value)=
;
+=09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
-=09=09seq_printf(s, "Touchpad status:%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Touchpad status:\t%s (%lu)\n", value ? "on" : "off", =
value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
-=09=09seq_printf(s, "Camera status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Camera status:\t%s (%lu)\n", value ? "on" : "off", va=
lue);
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
-=09if (!eval_gbmd(priv->adev->handle, &value)) {
-=09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
-=09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
-=09=09=09   value);
-=09}
+=09if (!eval_gbmd(priv->adev->handle, &value))
+=09=09seq_printf(s, "GBMD: %#010lx\n", value);
+=09if (!eval_hals(priv->adev->handle, &value))
+=09=09seq_printf(s, "HALS: %#010lx\n", value);
=20
 =09return 0;
 }
--=20
2.30.0

