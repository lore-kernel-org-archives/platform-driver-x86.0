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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660BBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 106E664F9A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhBCVzb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:31 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:41423 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhBCVz2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:28 -0500
Date:   Wed, 03 Feb 2021 21:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389286;
        bh=qhmXq/5bkOhV9BvAXs4K914G776z1Hr2na4WW8M20/U=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=NJcAcmtegKlDjDdQQWUPqbGMl58pza/jhplwx4BU/hOV0mzfRbjFxToup/0BXIS7U
         3HUdSjPteMtNuDaA8y5hkNcVN+PjZf/hMep297hgnR0wyM6VQy0QB7mZvL1hElU0a6
         66NlFE4ORihwwsRPBXkdung8Qmgiom06cAYdkBlw=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 05/29] platform/x86: ideapad-laptop: add missing call to submodule destructor
Message-ID: <20210203215403.290792-6-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ideapad_dytc_profile_exit() is not called in ideapad_acpi_add()
in the error path. Add the missing call.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index e3016c18e88e..7ee5ac662f80 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1337,6 +1337,7 @@ static int ideapad_acpi_add(struct platform_device *p=
dev)
 notification_failed:
 =09ideapad_backlight_exit(priv);
 backlight_failed:
+=09ideapad_dytc_profile_exit(priv);
 =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 =09=09ideapad_unregister_rfkill(priv, i);
 =09ideapad_input_exit(priv);
--=20
2.30.0


