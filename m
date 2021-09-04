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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C22A6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4B7E60F3A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237305AbhIDR51 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:27 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:61948 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR51 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:27 -0400
Date:   Sat, 04 Sep 2021 17:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778184;
        bh=usYv9jVm/hIKSq/VPgEeLOSCsUDFEddgbdKUwOwH+cQ=;
        h=Date:To:From:Reply-To:Subject:From;
        b=jMlAcEgbLCW6XYmQn5mtoiRz5rXNAOtD26ZPEoaSw8ZzTtz659uUX7Sqn3J8gSCce
         f4HhjTB9yjc47LkzyQhbORHDI6BtsEeoAizkD5vAbCQeZLmGzeaJl2YJb+c5DqoQTh
         ScWpLW7bHYFJZRitpWb48S6yzIQa+kPOhLVkK9Wc=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 23/30] platform/x86: wmi: improve debug messages
Message-ID: <20210904175450.156801-24-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Print the event identifier number in addition to
the already printed information, and use %u for
printing unsigned values in `wmi_notify_debug()`.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index fcc867d79e91..ec5ba2970840 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -485,10 +485,10 @@ static void wmi_notify_debug(u32 value, void *context=
)
 =09if (!obj)
 =09=09return;

-=09pr_info("DEBUG Event ");
+=09pr_info("DEBUG: event 0x%02X ", value);
 =09switch (obj->type) {
 =09case ACPI_TYPE_BUFFER:
-=09=09pr_cont("BUFFER_TYPE - length %d\n", obj->buffer.length);
+=09=09pr_cont("BUFFER_TYPE - length %u\n", obj->buffer.length);
 =09=09break;
 =09case ACPI_TYPE_STRING:
 =09=09pr_cont("STRING_TYPE - %s\n", obj->string.pointer);
@@ -497,7 +497,7 @@ static void wmi_notify_debug(u32 value, void *context)
 =09=09pr_cont("INTEGER_TYPE - %llu\n", obj->integer.value);
 =09=09break;
 =09case ACPI_TYPE_PACKAGE:
-=09=09pr_cont("PACKAGE_TYPE - %d elements\n", obj->package.count);
+=09=09pr_cont("PACKAGE_TYPE - %u elements\n", obj->package.count);
 =09=09break;
 =09default:
 =09=09pr_cont("object type 0x%X\n", obj->type);
--
2.33.0


