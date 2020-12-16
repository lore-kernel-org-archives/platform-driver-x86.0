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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C46C2BBCA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B8472311F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725765AbgLPBkM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:12 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:57223 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPBkM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:12 -0500
Date:   Wed, 16 Dec 2020 01:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082770;
        bh=MibG3xxkzW+W6nOJRdn9gX9U0CpJ42qdnumGm+qEjCs=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=X6ao4scjMtPYSXpNVNMLAwwW2+Gqv8/Gx0dPgzawfOYsv7YgkYwO8ESZuIpFC+ulZ
         TQn7fT7rHGLtezi+i28eKcjeyRdJ5vn0DOYyMzC5LszKrmkauyUn3N6akskgNNu2xU
         k/02LcP/Zu2/vobt0TuGbkcXw8XADmxWVbiWsSpg=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 06/24] platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of hand-crafted formula
Message-ID: <20201216013857.360987-7-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current code used a hand-crafted formulate to convert milliseconds to
jiffies, replace it with the msecs_to_jiffies() function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 22e1b3fd3df5..798723c88a68 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -20,6 +20,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -188,7 +189,7 @@ static int read_ec_data(acpi_handle handle, int cmd, un=
signed long *data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
+=09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
@@ -214,7 +215,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
+=09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
--=20
2.29.2


