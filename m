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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 026A2C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2D0523436
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jan 2021 18:21:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727808AbhAMSVP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jan 2021 13:21:15 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:31119 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbhAMSVP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:21:15 -0500
Date:   Wed, 13 Jan 2021 18:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562032;
        bh=kOOM095IMtzoJ1/WBEBj/i6B1lSB1htCOopO0HDGtVY=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=bfHqgcaylkEb4Wvyl7At6SRDjreG00FS3UE5iUtxyeT5/SpXAPurRDvEQ2WHDC7+E
         uyxc1RMKuPMHPxJs1WCVDl/5cRCBiXeQlsdMwJOAGrU4k8/LSsD29MIqseTrdA+LSb
         Ht/MKlfgzF8KllWPVOzQOReE8X5QJU5HNHqZIClI=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 01/24] platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata() call
Message-ID: <20210113182016.166049-2-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver core already sets the driver specific data on bind failure
or removal. Thus the call is unnecessary.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 5b81bafa5c16..c96fd60ec7d2 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1084,7 +1084,6 @@ static int ideapad_acpi_remove(struct platform_device=
 *pdev)
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
-=09dev_set_drvdata(&pdev->dev, NULL);
=20
 =09return 0;
 }
--=20
2.30.0

