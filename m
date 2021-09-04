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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A356C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B7C560F51
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237320AbhIDR5i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:38 -0400
Received: from mail-4322.protonmail.ch ([185.70.43.22]:36185 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:38 -0400
Date:   Sat, 04 Sep 2021 17:56:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778195;
        bh=bYrWE5J1d/UXgeba5aFcYrMsGmVzAnYYqLg6oDZgVic=;
        h=Date:To:From:Reply-To:Subject:From;
        b=Z34r2xLvR7ALt1Wpcgrqud3Eglg93Fl6AKWt6ci6Dihzm3tk4pKW468I6t2NYn9hE
         sjxlDT5+eGdg/vVd6E8nDKfAXtTa6ppKEgHD5QooPVvbjQjwVh8aW9k9rOjJy9oGRU
         gEAbKKE8pVoWkOJDCpide4XWG3ZTb5sJfz3fNaY8=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 24/30] platform/x86: wmi: do not fail if disabling fails
Message-ID: <20210904175450.156801-25-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, `__query_block()` would fail if the
second WCxx method call failed. However, the
WQxx method might have succeded, and potentially
allocated memory for the result. Instead of
throwing away the result and potentially
leaking memory, ignore the result of
the second WCxx call.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ec5ba2970840..5929d9d26801 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -352,7 +352,14 @@ static acpi_status __query_block(struct wmi_block *wbl=
ock, u8 instance,
 =09 * the WQxx method failed - we should disable collection anyway.
 =09 */
 =09if ((block->flags & ACPI_WMI_EXPENSIVE) && ACPI_SUCCESS(wc_status)) {
-=09=09status =3D acpi_execute_simple_method(handle, wc_method, 0);
+=09=09/*
+=09=09 * Ignore whether this WCxx call succeeds or not since
+=09=09 * the previously executed WQxx method call might have
+=09=09 * succeeded, and returning the failing status code
+=09=09 * of this call would throw away the result of the WQxx
+=09=09 * call, potentially leaking memory.
+=09=09 */
+=09=09acpi_execute_simple_method(handle, wc_method, 0);
 =09}

 =09return status;
--
2.33.0


