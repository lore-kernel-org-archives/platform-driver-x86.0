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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45EFC2BB48
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E3B6230FC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:42:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725287AbgLPBlm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:41:42 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:62151 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgLPBlm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:42 -0500
Date:   Wed, 16 Dec 2020 01:40:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082859;
        bh=a6ezRSEkPZZDlI1kU1jtxHxCet1zV+SE0ulPf/JjXx0=;
        h=Date:To:From:Reply-To:Subject:From;
        b=pVWXvx6LCvlCbIfqXbVXmSYT79U2vNwiEs+CQk5DPe7hS1FZWycsq/3XtgJbZL0bV
         11WNzs6J1QuI2PIWHxpIBm4U5UvmlDvwcFu+CszAe/TLaV8Az93zSfubKZq774zPQI
         r4UHCIkihL/+AptNrzC2Abw3yE0aMWdn+FLkbPp4=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 23/24] Documentation/ABI: sysfs-platform-ideapad-laptop: update device attribute paths
Message-ID: <20201216013857.360987-24-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The documentation referred to non-existent device attributes under a non-ex=
istent
platform device. Update it with the current location of the attributes.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index fd2ac02bc5bd..e024678947c8 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -1,11 +1,11 @@
-What:=09=09/sys/devices/platform/ideapad/camera_power
+What:=09=09/sys/bus/platform/devices/VPC2004:*/camera_power
 Date:=09=09Dec 2010
 KernelVersion:=092.6.37
 Contact:=09"Ike Panhc <ike.pan@canonical.com>"
 Description:
 =09=09Control the power of camera module. 1 means on, 0 means off.
=20
-What:=09=09/sys/devices/platform/ideapad/fan_mode
+What:=09=09/sys/bus/platform/devices/VPC2004:*/fan_mode
 Date:=09=09June 2012
 KernelVersion:=093.6
 Contact:=09"Maxim Mikityanskiy <maxtram95@gmail.com>"
@@ -18,7 +18,7 @@ Description:
 =09=09=09* 2 -> Dust Cleaning
 =09=09=09* 4 -> Efficient Thermal Dissipation Mode
=20
-What:=09=09/sys/devices/platform/ideapad/touchpad
+What:=09=09/sys/bus/platform/devices/VPC2004:*/touchpad
 Date:=09=09May 2017
 KernelVersion:=094.13
 Contact:=09"Ritesh Raj Sarraf <rrs@debian.org>"
@@ -27,7 +27,7 @@ Description:
 =09=09=09* 1 -> Switched On
 =09=09=09* 0 -> Switched Off
=20
-What:=09=09/sys/bus/pci/devices/<bdf>/<device>/VPC2004:00/fn_lock
+What:=09=09/sys/bus/platform/devices/VPC2004:*/fn_lock
 Date:=09=09May 2018
 KernelVersion:=094.18
 Contact:=09"Oleg Keri <ezhi99@gmail.com>"
--=20
2.29.2


