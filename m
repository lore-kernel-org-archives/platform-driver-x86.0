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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5729BC2BBD4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3AA2D230FB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgLPBmJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:42:09 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:34828 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgLPBmJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:42:09 -0500
Date:   Wed, 16 Dec 2020 01:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082846;
        bh=L0/O/uIOQ4Uwarm1brEpqnYZs0EoScnRdlNs9Ryo3Z4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=s3Yo5lC3QB9m3a/p+hPPH9wzWN452LMQqbUPV9EtPzXddVl/cOtBE4KN4xHTppJHH
         K+2WjkXthh153bJsRfSWcQEf87KWdPJ4ghE942PDkbFafVtEEJDn1Vro4smpzL4Ptj
         c0lNwn8TJrlxLpgCyLaGPTpVcbnPxbzxFPZeNhyQ=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 20/24] platform/x86: ideapad-laptop: send notification about touchpad state change to sysfs
Message-ID: <20201216013857.360987-21-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Consumers can determine if the value of an attribute changed much more
easily if changes are broadcast using sysfs_notify(), so utilize it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 491cadbf15ec..075056075b2d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -953,6 +953,7 @@ static void ideapad_sync_touchpad_state(struct ideapad_=
private *priv)
 =09=09i8042_command(&param,
 =09=09=09      value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
+=09=09sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
 =09}
 }
=20
--=20
2.29.2


