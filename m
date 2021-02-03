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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C93C43381
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C56964FA1
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhBCVzm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:42 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:17297 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhBCVzl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:41 -0500
Date:   Wed, 03 Feb 2021 21:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389299;
        bh=ykhvblhKmUjGKt2G35opDACkKEzDfyLq4Bd9STMQwHc=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ABWBut1u8Qjpok+2OWGyMT2mpMtaCUouGDzG2ID+xQ+EKHqGnqgTNOz05s03elB79
         X/jWi4BW3QYoViu1XD5pXpCXTD/A/FyuOW1xY40sRcwXWUz4r7u7PhBFoYA8ThPGBg
         C5BDWQCIpEUKHj8riOH1U1T7OdvxyDcNG0LsTm9c=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 06/29] platform/x86: ideapad-laptop: use sysfs_emit()
Message-ID: <20210203215403.290792-7-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

sysfs_emit() has been introduced to make it less ambiguous
which function is preferred when writing to the output
buffer in a device attribute's show() callback. Convert the
ideapad-laptop module to utilize this new helper function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 7ee5ac662f80..1a91588399f5 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -24,6 +24,7 @@
 #include <linux/platform_profile.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
=20
 #include <acpi/video.h>
@@ -371,8 +372,8 @@ static ssize_t show_ideapad_cam(struct device *dev,
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 static ssize_t store_ideapad_cam(struct device *dev,
@@ -402,8 +403,8 @@ static ssize_t show_ideapad_fan(struct device *dev,
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 static ssize_t store_ideapad_fan(struct device *dev,
@@ -435,8 +436,8 @@ static ssize_t touchpad_show(struct device *dev,
 =09unsigned long result;
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 /* Switch to RO for now: It might be revisited in the future */
@@ -468,8 +469,8 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09unsigned long result;
=20
 =09if (method_gbmd(priv->adev->handle, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -504,10 +505,10 @@ static ssize_t fn_lock_show(struct device *dev,
 =09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
=20
 =09if (fail)
-=09=09return sprintf(buf, "-1\n");
+=09=09return sysfs_emit(buf, "-1\n");
=20
 =09result =3D hals;
-=09return sprintf(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
--=20
2.30.0


