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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 237AEC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE71864DA3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231807AbhBCVzX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:23 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:51985 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbhBCVzR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:17 -0500
Date:   Wed, 03 Feb 2021 21:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389275;
        bh=EkuQhPTwsgios21TGbBlmurmq797cuqHZ37F+Hax0n0=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=UJ1CkW79tYxTw45TeTMBel/25AAJkE/yuBhx2+eGQyF6OGfsRe0zuMglG1TlU2kfQ
         aUJ0VN90yRo+xW8C5YcaGSUtqIPeIP17tuACg72TREryg6EZvdN+FJBmFvziR3YOZY
         N8WffISJPOJp0fTgKgw9xXZK+7E5gYNVdep0KpMM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 03/29] platform/x86: ideapad-laptop: use appropriately typed variable to store the return value of ACPI methods
Message-ID: <20210203215403.290792-4-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use a variable with type `acpi_status` to store the return value of
ACPI methods instead of a plain `int`. And use ACPI_{SUCCESS,FAILURE}
macros where possible instead of direct comparison.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 415d362a642a..6c1ed5153a37 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1247,6 +1247,7 @@ static int ideapad_acpi_add(struct platform_device *p=
dev)
 =09int cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
+=09acpi_status status;
=20
 =09ret =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
 =09if (ret)
@@ -1303,22 +1304,27 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09=09if (ret && ret !=3D -ENODEV)
 =09=09=09goto backlight_failed;
 =09}
-=09ret =3D acpi_install_notify_handler(adev->handle,
-=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
-=09if (ret)
+=09status =3D acpi_install_notify_handler(adev->handle,
+=09=09=09=09=09     ACPI_DEVICE_NOTIFY,
+=09=09=09=09=09     ideapad_acpi_notify, priv);
+=09if (ACPI_FAILURE(status)) {
+=09=09ret =3D -EIO;
 =09=09goto notification_failed;
+=09}
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 =09for (i =3D 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
-=09=09ret =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
-=09=09=09=09=09=09 ideapad_wmi_notify, priv);
-=09=09if (ret =3D=3D AE_OK) {
+=09=09status =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
+=09=09=09=09=09=09    ideapad_wmi_notify, priv);
+=09=09if (ACPI_SUCCESS(status)) {
 =09=09=09priv->fnesc_guid =3D ideapad_wmi_fnesc_events[i];
 =09=09=09break;
 =09=09}
 =09}
-=09if (ret !=3D AE_OK && ret !=3D AE_NOT_EXIST)
+=09if (ACPI_FAILURE(status) && status !=3D AE_NOT_EXIST) {
+=09=09ret =3D -EIO;
 =09=09goto notification_failed_wmi;
+=09}
 #endif
=20
 =09return 0;
--=20
2.30.0


