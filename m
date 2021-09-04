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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE05EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D2960F51
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237330AbhIDR5q (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:46 -0400
Received: from mail-4317.protonmail.ch ([185.70.43.17]:41524 "EHLO
        mail-4317.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237334AbhIDR5q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:46 -0400
Date:   Sat, 04 Sep 2021 17:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778203;
        bh=+DvUJAYWDwRMILzIJ0/SkLFVT28LPTstM4xb1uh5Xdo=;
        h=Date:To:From:Reply-To:Subject:From;
        b=nvKqcd4nyFQ6cjrb40mz5gZMB0DZXIPfED0yFOnwMGrA4nv3ARWn2jI8hqzkOWo+M
         JH/8Oq6GO/9jdmJFug3q4LiTeuLV6gm/OoTDV1ZY1grwGIqWcRFpv0wZ/qn4TppZAe
         uQehcMH9qa7jNJXApeas8UQ05RPF8ervy0+UG2VI=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 28/30] platform/x86: wmi: introduce helper to determine type
Message-ID: <20210904175450.156801-29-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce helper function to determine the appropriate
ACPI type for the input parameter.

This also fixes the following checkpatch warning:
"braces {} are not necessary for any arm of this statement".

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 4f484677759b..830f09c2afe9 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -211,6 +211,14 @@ static inline void get_acpi_method_name(const struct w=
mi_block *wblock,
 =09buffer[4] =3D '\0';
 }

+static inline acpi_object_type get_param_acpi_type(const struct wmi_block =
*wblock)
+{
+=09if (wblock->gblock.flags & ACPI_WMI_STRING)
+=09=09return ACPI_TYPE_STRING;
+=09else
+=09=09return ACPI_TYPE_BUFFER;
+}
+
 /*
  * Exported WMI functions
  */
@@ -295,11 +303,7 @@ acpi_status wmidev_evaluate_method(struct wmi_device *=
wdev, u8 instance, u32 met
 =09if (in) {
 =09=09input.count =3D 3;

-=09=09if (block->flags & ACPI_WMI_STRING) {
-=09=09=09params[2].type =3D ACPI_TYPE_STRING;
-=09=09} else {
-=09=09=09params[2].type =3D ACPI_TYPE_BUFFER;
-=09=09}
+=09=09params[2].type =3D get_param_acpi_type(wblock);
 =09=09params[2].buffer.length =3D in->length;
 =09=09params[2].buffer.pointer =3D in->pointer;
 =09}
@@ -451,12 +455,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 =
instance,
 =09input.pointer =3D params;
 =09params[0].type =3D ACPI_TYPE_INTEGER;
 =09params[0].integer.value =3D instance;
-
-=09if (block->flags & ACPI_WMI_STRING) {
-=09=09params[1].type =3D ACPI_TYPE_STRING;
-=09} else {
-=09=09params[1].type =3D ACPI_TYPE_BUFFER;
-=09}
+=09params[1].type =3D get_param_acpi_type(wblock);
 =09params[1].buffer.length =3D in->length;
 =09params[1].buffer.pointer =3D in->pointer;

--
2.33.0


