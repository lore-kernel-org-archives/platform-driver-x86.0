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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86FCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B51360F51
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbhIDR5n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:43 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:53134 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5n (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:43 -0400
Date:   Sat, 04 Sep 2021 17:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778198;
        bh=RYOXG0qlglXvaCyoOCoFByGdbmkQSzXOGgZbrvxTvsE=;
        h=Date:To:From:Reply-To:Subject:From;
        b=M/9nFIyjSsKbrvwHMA93yAVNYteAcdp7rzX3kk0EAUyaitVM7C67oHxqQCG1e6lex
         ES/Z+rTBRkwYfjue/oqMbnUWssbGAHG+aJg6JCbP+RiBViIzJWkWW5Tl2xIlR2NLQJ
         0/uySG0/0Wah66heDBkXeVGvweuL3YLpopQWjC0I=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 25/30] platform/x86: wmi: simplify error handling logic
Message-ID: <20210904175450.156801-26-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The current code carries out the following ACPI status
mapping:

  AE_NOT_FOUND -> AE_OK
  AE_OK        -> AE_OK
  AE_$X        -> AE_$X

That is, everything is mapped to itself, except AE_NOT_FOUND.
The current code does not do it in the most straighforward way.
Simplify the logic.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 5929d9d26801..ea7154160946 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -189,11 +189,10 @@ static acpi_status wmi_method_enable(struct wmi_block=
 *wblock, bool enable)

 =09snprintf(method, sizeof(method), "WE%02X", block->notify_id);
 =09status =3D acpi_execute_simple_method(handle, method, enable);
-
-=09if (status !=3D AE_OK && status !=3D AE_NOT_FOUND)
-=09=09return status;
-=09else
+=09if (status =3D=3D AE_NOT_FOUND)
 =09=09return AE_OK;
+
+=09return status;
 }

 /*
--
2.33.0


