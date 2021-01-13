Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDFFC433E6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 620292343F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbhAMSXW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:22 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:24843 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbhAMSXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:21 -0500
Date:   Wed, 13 Jan 2021 18:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562158;
        bh=m2dtrtSEIyVTEepko5QtvVRW293YasTBDW1c07v5S54=;
        h=Date:To:From:Reply-To:Subject:From;
        b=irDfrr1on7zspPJCYgbwoB3PvQAbAU9UFd93aZGszGLoxOb8nRrME+ejSYAUcWN6d
         8CbL+6l0FwIztbelquIT/79+0qdLodRULwQqmyvnqj2HJZ9AXAxEd9jyvyTLlBlKRJ
         sSd5EWSGmNwEynby4WkbjS1YW/F65OznnjLi/85E=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 20/24] platform/x86: ideapad-laptop: send notification about touchpad state change to sysfs
Message-ID: <20210113182016.166049-21-pobrn@protonmail.com>
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

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 0e50969bd194..e1ab5c2e982f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -959,6 +959,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_=
private *priv)
 =09=09i8042_command(&param,
 =09=09=09      value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
+=09=09sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
 =09}
 }
=20
--=20
2.30.0

