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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490F0C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2197E2311F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgLPBkw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:52 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:61118 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBkw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:52 -0500
Date:   Wed, 16 Dec 2020 01:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082827;
        bh=HJi5AUfMxqtNgTQevF6whXbRqXQamXwhB/LoZiKyVRw=;
        h=Date:To:From:Reply-To:Subject:From;
        b=Wx+fAM9XiFI5WIafXaSmIYQDtXNzhWhh7FzJY29IInIGguPNZZgpI7c8jUwmm5T/K
         rf1h7UGUWogc6mxiH3/aYNGd6vfrCJ+Z4t0DTm+M+HixmZmP82Qt4nBg/WK0+fykDh
         /2TmzNewSP76bfmcmVMPezhYZmv/deprmvLyq4Hw=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 18/24] Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be RO"
Message-ID: <20201216013857.360987-19-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The touchpad can be enabled/disabled via this attribute on a
Lenovo Yoga 520-14IKB. Allow writing as it provides legitimate
functionality.

This reverts commit 7f363145992cebf4ea760447f1cfdf6f81459683.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index f5a1d7041aab..fda49c236190 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -442,10 +442,9 @@ static ssize_t touchpad_show(struct device *dev,
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
-/* Switch to RO for now: It might be revisited in the future */
-static ssize_t __maybe_unused touchpad_store(struct device *dev,
-=09=09=09=09=09     struct device_attribute *attr,
-=09=09=09=09=09     const char *buf, size_t count)
+static ssize_t touchpad_store(struct device *dev,
+=09=09=09      struct device_attribute *attr,
+=09=09=09      const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool state;
@@ -461,7 +460,7 @@ static ssize_t __maybe_unused touchpad_store(struct dev=
ice *dev,
 =09return count;
 }
=20
-static DEVICE_ATTR_RO(touchpad);
+static DEVICE_ATTR_RW(touchpad);
=20
 static ssize_t conservation_mode_show(struct device *dev,
 =09=09=09=09struct device_attribute *attr,
--=20
2.29.2


