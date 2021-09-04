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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC1CC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9FC1560F3A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbhIDR4N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:13 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:43911 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237247AbhIDR4N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:13 -0400
Date:   Sat, 04 Sep 2021 17:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778108;
        bh=0UnM6i/0AVHZD2smX1zPrlIi3uvf19Ea4BSEvI4Y+jU=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=NbJTpKIl+ebTv6BZ7k7n4YxbH9fC+tT67MMI2PSODbpqxswR6WxDvScygppz1y+Vg
         UD+ZV4K1G/vO2zosoiEhvw4CQaurgSv12WNNEUFJAeaDkV7AjaNgOx8uiGS+ICjlA5
         AC8hzz2BBTdgWOomaBesO0qVK5MvNS779NmBeFWw=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 02/30] platform/x86: wmi: fix checkpatch warnings
Message-ID: <20210904175450.156801-3-pobrn@protonmail.com>
In-Reply-To: <20210904175450.156801-1-pobrn@protonmail.com>
References: <20210904175450.156801-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the following two checkpatch warnings:

 * "space required before the open parenthesis '('"
 * "that open brace { should be on the previous line"

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 0b931629f0b0..73ed17a53af5 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -488,7 +488,7 @@ static void wmi_notify_debug(u32 value, void *context)
 =09=09return;

 =09pr_info("DEBUG Event ");
-=09switch(obj->type) {
+=09switch (obj->type) {
 =09case ACPI_TYPE_BUFFER:
 =09=09pr_cont("BUFFER_TYPE - length %d\n", obj->buffer.length);
 =09=09break;
@@ -1277,8 +1277,7 @@ static void acpi_wmi_notify_handler(acpi_handle handl=
e, u32 event,

 =09=09if (wblock->acpi_device->handle =3D=3D handle &&
 =09=09    (block->flags & ACPI_WMI_EVENT) &&
-=09=09    (block->notify_id =3D=3D event))
-=09=09{
+=09=09    (block->notify_id =3D=3D event)) {
 =09=09=09found_it =3D true;
 =09=09=09break;
 =09=09}
--
2.33.0


