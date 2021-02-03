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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B3CC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BB4064E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhBCV55 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:57:57 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:61311 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhBCV5t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:49 -0500
Date:   Wed, 03 Feb 2021 21:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389424;
        bh=AG4jrH82e4o9CdvlpSlQYJ2SZkUKJ+Pbuikp1H0i90c=;
        h=Date:To:From:Reply-To:Subject:From;
        b=hPqOE23CPlBIT0mp712gDI7E+kgHYqSpF4WsiG2iakQwm8CI1Tm0MSQU7z+yigxm+
         1gKZt2YqgP18mJFD87csvS2rEKI95MmEvp9EK6bTo6+diCPy0aP2Wnn7XHTMtYnhpd
         lDUmq+H4mAypDMtJiGHffpcOeHVbRzPxuav8shck=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 25/29] platform/x86: ideapad-laptop: send notification about touchpad state change to sysfs
Message-ID: <20210203215403.290792-26-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Consumers can determine if the value of an attribute changed much more
easily if changes are broadcast using sysfs_notify(), so utilize it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 2068831c5fe8..76b723f32c84 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1224,6 +1224,7 @@ static void ideapad_sync_touchpad_state(struct ideapa=
d_private *priv)
 =09=09 */
 =09=09i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_D=
ISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
+=09=09sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
 =09}
 }
=20
--=20
2.30.0


