Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4630C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8499464E4E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:56:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhBCV4e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:56:34 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:10769 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232297AbhBCV41 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:27 -0500
Date:   Wed, 03 Feb 2021 21:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389345;
        bh=xIYUklR6JXPR7jT3gxjvvDuu8/xilC90GGgK9K1ZMxQ=;
        h=Date:To:From:Reply-To:Subject:From;
        b=D4xZdxBw2cMeaV8VwxU1TE5vdcMSuu1+GcYY6BXqH887nB0zjX9+g61+D9bcNaRL6
         y5uGrc1oBgrZ2452KI+9wkK69qD3BijzP9NacEAZ+Dv72w30SGpeL20DeHT3OJehF9
         w4H2/ELXIB355hnjmKgcuVE41m96w275YWIQ4+E4=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 12/29] platform/x86: ideapad-laptop: check return value of debugfs_create_dir() for errors
Message-ID: <20210203215403.290792-13-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

debugfs_create_dir() may return an ERR_PTR(),
add a check to ideapad_debugfs_init() that
handles the case when that occurs.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 1aa3a05c3360..ba0bd344f5ed 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -14,6 +14,7 @@
 #include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/err.h>
 #include <linux/fb.h>
 #include <linux/i8042.h>
 #include <linux/init.h>
@@ -350,9 +351,11 @@ DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
=20
 static void ideapad_debugfs_init(struct ideapad_private *priv)
 {
-=09struct dentry *dir;
+=09struct dentry *dir =3D debugfs_create_dir("ideapad", NULL);
+
+=09if (IS_ERR(dir))
+=09=09return;
=20
-=09dir =3D debugfs_create_dir("ideapad", NULL);
 =09priv->debug =3D dir;
=20
 =09debugfs_create_file("cfg", S_IRUGO, dir, priv, &debugfs_cfg_fops);
--=20
2.30.0


