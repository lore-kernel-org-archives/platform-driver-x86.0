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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A61BC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FB4B64E46
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhBCVzx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:55:53 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:14442 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhBCVzu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:50 -0500
Date:   Wed, 03 Feb 2021 21:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389309;
        bh=uhVsg3wUltw4ZQwVc85owA2LXpbtaeadZAEmUDAT9SE=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ICvsH8Fxao3nm50ePKMHCwwU89cwP4SqQnjIKY6DbOY2V+0z0IDZCtpA9n8r3RTK9
         8BGDBTxTkz5fGyZPxaEFPPIkZ2C/j3x78De827EJYHQOMOkTowLe5H4Hi9LUdla0r3
         Ho+LMfx+0jPHVeZGLW9lvNcKiU/0n3V1gl96Iqb0=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 07/29] platform/x86: ideapad-laptop: use device_{add,remove}_group
Message-ID: <20210203215403.290792-8-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use device_{add,remove}_group instead of sysfs_{add,remove}_group.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 1a91588399f5..2153688012c3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -924,14 +924,14 @@ static void ideapad_unregister_rfkill(struct ideapad_=
private *priv, int dev)
  */
 static int ideapad_sysfs_init(struct ideapad_private *priv)
 {
-=09return sysfs_create_group(&priv->platform_device->dev.kobj,
-=09=09=09=09    &ideapad_attribute_group);
+=09return device_add_group(&priv->platform_device->dev,
+=09=09=09=09&ideapad_attribute_group);
 }
=20
 static void ideapad_sysfs_exit(struct ideapad_private *priv)
 {
-=09sysfs_remove_group(&priv->platform_device->dev.kobj,
-=09=09=09   &ideapad_attribute_group);
+=09device_remove_group(&priv->platform_device->dev,
+=09=09=09    &ideapad_attribute_group);
 }
=20
 /*
--=20
2.30.0


