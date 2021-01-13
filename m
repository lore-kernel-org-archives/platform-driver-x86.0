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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE5DC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BF632343E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbhAMSXQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:23:16 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:24771 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbhAMSXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:16 -0500
Date:   Wed, 13 Jan 2021 18:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562153;
        bh=irL3OTLg4sUHgNV7EnPTtaM9+SXU6zi+Ps/fCuATgm8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=BDXHpPR9ZYj41Rj1D3SCS8X17/J4b/4jzb9TU9wn50V2zxqCRSQA0B13qzyw0FP46
         npe4lIOtW9TlI4n+aJ2plRnwRVu6W3t6SJNodk1Vx62EpaXYE3rBfYoRd4hEZIvNgP
         9DbmXZwoJRRxOkmK5ZV3WaFumPrj2UfL903trQAk=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 18/24] Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be RO"
Message-ID: <20210113182016.166049-19-pobrn@protonmail.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index cd4dc4048d71..83ad82b21b59 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -444,10 +444,9 @@ static ssize_t touchpad_show(struct device *dev,
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
@@ -463,7 +462,7 @@ static ssize_t __maybe_unused touchpad_store(struct dev=
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
2.30.0

