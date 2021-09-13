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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC28C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 11:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1F7D60F46
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 11:08:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239364AbhIMLJg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 07:09:36 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:51757 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239238AbhIMLJg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 07:09:36 -0400
Date:   Mon, 13 Sep 2021 11:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631531299;
        bh=vfsDKZJ61+WaETfvNpPU9u/+zjdX2MvDbjEJg1eYGz8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=pJZ6lMTkn0PaAszPjpXOYfSUrO266SsvGctbNc65kYbsx24C3E/grvvNRnfkdXAY9
         5iihatQJpLw7pysn/ebRzHsAqTwzCPYroLKTg5dDqY5/uM6Q/vBwarzRxV90KMYggA
         QxBRLbIzooh59XZxpOLsNlINuTiQvxxG1if7I/xU=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1] platform/x86: wmi: initialize method name directly
Message-ID: <20210913110805.12387-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of calling `snprintf()`, generate the method
name in the initializer. This way the array size
is determined automatically, specifying it explicitly
is no longer needed.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e6997be206f1..1cde9dd417c4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -184,15 +184,17 @@ static int get_subobj_info(acpi_handle handle, const =
char *pathname,

 static acpi_status wmi_method_enable(struct wmi_block *wblock, bool enable=
)
 {
-=09struct guid_block *block;
-=09char method[5];
+=09acpi_handle handle =3D wblock->acpi_device->handle;
+=09struct guid_block *block =3D &wblock->gblock;
 =09acpi_status status;
-=09acpi_handle handle;
-
-=09block =3D &wblock->gblock;
-=09handle =3D wblock->acpi_device->handle;
+=09char method[] =3D {
+=09=09'W',
+=09=09'E',
+=09=09hex_asc_upper_hi(block->notify_id),
+=09=09hex_asc_upper_lo(block->notify_id),
+=09=09'\0'
+=09};

-=09snprintf(method, 5, "WE%02X", block->notify_id);
 =09status =3D acpi_execute_simple_method(handle, method, enable);
 =09if (status =3D=3D AE_NOT_FOUND)
 =09=09return AE_OK;
--
2.33.0


