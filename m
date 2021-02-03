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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2064C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7726C64DA3
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhBCV4D (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:56:03 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:30676 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhBCV4D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:03 -0500
Date:   Wed, 03 Feb 2021 21:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389320;
        bh=x3aQRgl913VT8FHvqljlHG/7oeM3UXs7wLFITXQCmd8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=l7K/BRMpeB0t/zizbMdTvDLG4dqi9Nwr4yq/qSpjvxS1xRKX1sAHE6kjgwAVbpvcj
         yICtmAQ5owHgloh5nnWhWqB6KxsaTq5Mrwjvcja6lNZahO/ze8LpIODxtt1fOQEoHn
         xyTr06hwRHbzyQFPjMcq+jjYqnsnSucbh4AaPY9s=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 08/29] platform/x86: ideapad-laptop: use kobj_to_dev()
Message-ID: <20210203215403.290792-9-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use kobj_to_dev() instead of open-coding the container_of() macro.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 2153688012c3..30ea97143567 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -547,7 +547,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09=09=09=09 struct attribute *attr,
 =09=09=09=09 int idx)
 {
-=09struct device *dev =3D container_of(kobj, struct device, kobj);
+=09struct device *dev =3D kobj_to_dev(kobj);
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool supported;
=20
--=20
2.30.0


