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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05881C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3A1864D90
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 21:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhBCV6U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 16:58:20 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:63174 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhBCV6Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:58:16 -0500
Date:   Wed, 03 Feb 2021 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389454;
        bh=NRdox9uK80FeSyw0JXeDXp+xsYb7sTbF42CRT+GBb38=;
        h=Date:To:From:Reply-To:Subject:From;
        b=FTVLQZt2qrpE22EeTzYbWUZInGVabuGf6Y9yeaa4V4aV9TWSSpMHEwDZG3w8l3CiX
         e4swTUgCCBMdN8Cvh1Yn3+aTJkZT0tFDO8inZmyObhuq7nwcEPtbZY+MLBQmbRlxCi
         VVYoX8WTeNFiMj+EkU/8HKkBeEpfv88tmwEH+4KM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 29/29] Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode attribute
Message-ID: <20210203215403.290792-30-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Document the conservation_mode attributes provided by the ideapad-laptop mo=
dule.

Fixes: ade50296186a ("platform/x86: ideapad-laptop: Expose conservation mod=
e switch")
Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index 5ec0dee9e707..4989ab266682 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -27,6 +27,15 @@ Description:
 =09=09=09* 1 -> Switched On
 =09=09=09* 0 -> Switched Off
=20
+What:=09=09/sys/bus/platform/devices/VPC2004:*/conservation_mode
+Date:=09=09Aug 2017
+KernelVersion:=094.14
+Contact:=09platform-driver-x86@vger.kernel.org
+Description:
+=09=09Controls whether the conservation mode is enabled or not.
+=09=09This feature limits the maximum battery charge percentage to
+=09=09around 50-60% in order to prolong the lifetime of the battery.
+
 What:=09=09/sys/bus/platform/devices/VPC2004:*/fn_lock
 Date:=09=09May 2018
 KernelVersion:=094.18
--=20
2.30.0


