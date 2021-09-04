Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57F7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8884660F3A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237264AbhIDR4S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:18 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:59955 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237247AbhIDR4Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:16 -0400
Date:   Sat, 04 Sep 2021 17:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778113;
        bh=5YEAvyJ5CSho0v8E/Wba99Wq3UAHIt2MYUXfTEZSbXU=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=OhLZmDxhtfl0IZz6RkmERdsmFaI3Nxpw1JDybDJ3JQLornWE8m7c26l0Zo4uFjLSc
         BCep3s+5tDjIEuZhJf8ZXA7+TrVc/nG43GaqABOMN90N9ti2psuQTUR9kMXKlL0sVL
         pyxY7THgGSe/IeBcXgFAGHCmL/yl4laJZfdm/TfA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 04/30] platform/x86: wmi: remove unnecessary initialization
Message-ID: <20210904175450.156801-5-pobrn@protonmail.com>
In-Reply-To: <20210904175450.156801-1-pobrn@protonmail.com>
References: <20210904175450.156801-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The empty initializer `{ }` is enough to properly initialize
the terminating acpi_device_id entry in the device table,
so use that.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 67c09d81a676..6ad5962da59b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -91,7 +91,7 @@ static int acpi_wmi_probe(struct platform_device *device)=
;
 static const struct acpi_device_id wmi_device_ids[] =3D {
 =09{"PNP0C14", 0},
 =09{"pnp0c14", 0},
-=09{"", 0},
+=09{ }
 };
 MODULE_DEVICE_TABLE(acpi, wmi_device_ids);

--
2.33.0


