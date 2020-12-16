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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B0A7C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:41:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B42323103
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgLPBlF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:41:05 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:55885 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgLPBlF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:05 -0500
Date:   Wed, 16 Dec 2020 01:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082822;
        bh=9wu1OOhy5SOquqSUo6d/kn3Qtgj2DATMSpwWIt/9FOE=;
        h=Date:To:From:Reply-To:Subject:From;
        b=iOMMgPDDHHwjfsVmfE8RkXM2u6ORMQ0IIJIYw2pv92Kr7H6AC3j31lQM2xlVG0zOx
         wgOsoQ4ccAs88sNVxLH8zGZzF1Kz26CxNdBFc3Nm8EzLsf+uRUUNTeqQD1Qw5wNhjR
         iKOXO+rzRqg7VLEPipYhAF1ayVuDKBXR5NCQVFLA=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 16/24] platform/x86: ideapad-laptop: change 'status' debugfs file format
Message-ID: <20201216013857.360987-17-pobrn@protonmail.com>
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

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 1e11d5d9cd20..b1b77eb31779 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -259,43 +259,36 @@ static int debugfs_status_show(struct seq_file *s, vo=
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
2.29.2


