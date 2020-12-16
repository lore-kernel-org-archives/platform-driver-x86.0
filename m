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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998F7C4361B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49C2A2311E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 01:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725768AbgLPBkH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Dec 2020 20:40:07 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:64475 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgLPBkG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:06 -0500
Date:   Wed, 16 Dec 2020 01:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082764;
        bh=I8WTNphY0a8gxRLYhZc/TnQgqwVa75aoC8NKbRi3VqM=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ZWt63mlMBiKpqM9FNt+YoOdfZBBAvVlbQIlKV59dK12OKJTeAtUosrGTWjQuTzBpI
         beYMh1FFHt+resp0r1F7uH24IMZgfBARct03VIIcpupwwf4qSEiYBr6BvBaLdOyYsK
         5SMYCIVyrKvuEyauAykX3+0y1ZnNQauff7nyScgA=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 03/24] platform/x86: ideapad-laptop: sort includes lexicographically
Message-ID: <20201216013857.360987-4-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Managing includes is easier when they are sorted, so
sort them lexicographically.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 8b86e5547b59..aefe83996be6 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -8,23 +8,23 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
+#include <acpi/video.h>
 #include <linux/acpi.h>
-#include <linux/rfkill.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/input/sparse-keymap.h>
 #include <linux/backlight.h>
-#include <linux/fb.h>
 #include <linux/debugfs.h>
-#include <linux/seq_file.h>
-#include <linux/i8042.h>
-#include <linux/dmi.h>
 #include <linux/device.h>
-#include <acpi/video.h>
+#include <linux/dmi.h>
+#include <linux/fb.h>
+#include <linux/i8042.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rfkill.h>
+#include <linux/seq_file.h>
+#include <linux/types.h>
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
=20
--=20
2.29.2


