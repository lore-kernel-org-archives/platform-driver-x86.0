Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938ABC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Oct 2022 15:03:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiJEPDE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbiJEPCd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 11:02:33 -0400
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7300C7E308
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 08:01:01 -0700 (PDT)
Date:   Wed, 05 Oct 2022 15:00:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664982056; x=1665241256;
        bh=JL3CI8kcEZT9fAOo23SiVPEWL+vsQw4O37kMbsrp2Jc=;
        h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=KohWRHzkr6/LTske/gZFpovxuVpEP0Q9NazlbXLcOQH4hfC/n12JC8eWJLxNGeizw
         id5TbKSpxf72EAJNMIwqacrFSOzV3IC1fgs5z9T7A3enymv0TmFZCpja7xhN0nbAWv
         klB84EFR/UQC1G+8jUJEwwjldSaGK4LNiPnyo/1FLdEjolbTws9mshH6OTP/GejU/+
         MVRvJN8dwUDKO9CGFS69/XrBwoRu+t1siRTMaAdCPKqPsAOpAgtoOhG8RDb2O6Kvx2
         mIlsNDCJszsB+e1z1ZFrfEi2oPIoWTWaRGR/B445is2omwJGYjT5t1Aw+RkaRJtZUC
         Fxr1UxWVJZGUA==
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1 2/3] platform/x86: huawei-wmi: fix return value calculation
Message-ID: <20221005150032.173198-2-pobrn@protonmail.com>
In-Reply-To: <20221005150032.173198-1-pobrn@protonmail.com>
References: <20221005150032.173198-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, `huawei_wmi_input_setup()` returned the result of
logical or-ing the return values of two functions that return negative
errno-style error codes and one that returns `acpi_status`. If this
returned value was non-zero, then it was propagated from the platform
driver's probe function. That function should return a negative
errno-style error code, so the result of the logical or that
`huawei_wmi_input_setup()` returned was not appropriate.

Fix that by checking each function separately and returning the
error code unmodified.

Fixes: 1ac9abeb2e5bf9 ("platform/x86: huawei-wmi: Move to platform driver")

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawe=
i-wmi.c
index 66b53b90188f..bbab73c430d1 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -760,6 +760,9 @@ static int huawei_wmi_input_setup(struct device *dev,
 =09=09const char *guid,
 =09=09struct input_dev **idev)
 {
+=09acpi_status status;
+=09int err;
+
 =09*idev =3D devm_input_allocate_device(dev);
 =09if (!*idev)
 =09=09return -ENOMEM;
@@ -769,10 +772,19 @@ static int huawei_wmi_input_setup(struct device *dev,
 =09(*idev)->id.bustype =3D BUS_HOST;
 =09(*idev)->dev.parent =3D dev;

-=09return sparse_keymap_setup(*idev, huawei_wmi_keymap, NULL) ||
-=09=09input_register_device(*idev) ||
-=09=09wmi_install_notify_handler(guid, huawei_wmi_input_notify,
-=09=09=09=09*idev);
+=09err =3D sparse_keymap_setup(*idev, huawei_wmi_keymap, NULL);
+=09if (err)
+=09=09return err;
+
+=09err =3D input_register_device(*idev);
+=09if (err)
+=09=09return err;
+
+=09status =3D wmi_install_notify_handler(guid, huawei_wmi_input_notify, *i=
dev);
+=09if (ACPI_FAILURE(status))
+=09=09return -EIO;
+
+=09return 0;
 }

 static void huawei_wmi_input_exit(struct device *dev, const char *guid)
--
2.38.0


