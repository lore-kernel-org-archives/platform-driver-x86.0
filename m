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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35146C2BB48
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:39:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E85B623109
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725275AbgLPBjz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:39:55 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:32023 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPBjz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:39:55 -0500
Date:   Wed, 16 Dec 2020 01:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082753;
        bh=sEEwi4cgN99o5qj+ZeyAM9IlOacYuj+VTMwAtdAanac=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=Su1NWBwCh6pHu5zezjIP7lDKPW5M4JKOJ98Mzws+y6L2hxOz/I2AjGLMoaPNiVymA
         UBbawcPMVkDQEFfzPsMdjJx2YDKggS/DHIQPocKVBVXzQN+OoRL+012tMPK8bbuKVt
         KpXyg5kzP3cPNtS83x/w7T/5sC8xOTc2OASv7d0M=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 02/24] platform/x86: ideapad-laptop: use appropriately typed variable to store the return value of ACPI methods
Message-ID: <20201216013857.360987-3-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use a variable with type `acpi_status` to store the return value of ACPI
methods instead of a plain `int`. And use ACPI_{SUCCESS,FAILURE} macros
where possible instead of direct comparison.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 9ed5bd8d955b..8b86e5547b59 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -971,6 +971,7 @@ static int ideapad_acpi_add(struct platform_device *pde=
v)
 =09int cfg;
 =09struct ideapad_private *priv;
 =09struct acpi_device *adev;
+=09acpi_status acpi_err;
=20
 =09ret =3D acpi_bus_get_device(ACPI_HANDLE(&pdev->dev), &adev);
 =09if (ret)
@@ -1018,22 +1019,26 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
 =09=09if (ret && ret !=3D -ENODEV)
 =09=09=09goto backlight_failed;
 =09}
-=09ret =3D acpi_install_notify_handler(adev->handle,
-=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
-=09if (ret)
+=09acpi_err =3D acpi_install_notify_handler(adev->handle,
+=09=09=09ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
+=09if (ACPI_FAILURE(acpi_err)) {
+=09=09ret =3D -EIO;
 =09=09goto notification_failed;
+=09}
=20
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 =09for (i =3D 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
-=09=09ret =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
-=09=09=09=09=09=09 ideapad_wmi_notify, priv);
-=09=09if (ret =3D=3D AE_OK) {
+=09=09acpi_err =3D wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
+=09=09=09=09=09=09      ideapad_wmi_notify, priv);
+=09=09if (ACPI_SUCCESS(acpi_err)) {
 =09=09=09priv->fnesc_guid =3D ideapad_wmi_fnesc_events[i];
 =09=09=09break;
 =09=09}
 =09}
-=09if (ret !=3D AE_OK && ret !=3D AE_NOT_EXIST)
+=09if (ACPI_FAILURE(acpi_err) && acpi_err !=3D AE_NOT_EXIST) {
+=09=09ret =3D -EIO;
 =09=09goto notification_failed_wmi;
+=09}
 #endif
=20
 =09return 0;
--=20
2.29.2


