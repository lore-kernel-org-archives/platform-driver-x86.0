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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08ECAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E454A60F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237311AbhIDR4Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:24 -0400
Received: from mail-4317.protonmail.ch ([185.70.43.17]:40664 "EHLO
        mail-4317.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237297AbhIDR4X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:23 -0400
Date:   Sat, 04 Sep 2021 17:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778120;
        bh=LcLUFpeh/z/6S0WSjAWm7gFoW4KL6QLTFYAOkicZa08=;
        h=Date:To:From:Reply-To:Subject:From;
        b=Z/SK979sahfZBMFdHYknF8U4nfk6ECBhGp+jaxJhr67MvqlKjJbYH9cjktd/S6BN4
         weO/frldIryIxTMbfIiQB93CRn672hrcrQEShxZigu0pgLsvecwiPubClQ/kYL0Y3Y
         0t/8P/uL5S/F/4mOAeDlUUDzrIz2+i0H0aZhmrRQ=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 07/30] platform/x86: wmi: remove unnecessary argument
Message-ID: <20210904175450.156801-8-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The GUID block is available for `wmi_create_device()`
through `wblock->gblock`. Use that consistently in
the function instead of using a mix of `gblock` and
`wblock->gblock`.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index dc31f81d83a7..6252e8d88680 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1028,7 +1028,6 @@ static const struct device_type wmi_type_data =3D {
 };

 static int wmi_create_device(struct device *wmi_bus_dev,
-=09=09=09     const struct guid_block *gblock,
 =09=09=09     struct wmi_block *wblock,
 =09=09=09     struct acpi_device *device)
 {
@@ -1036,12 +1035,12 @@ static int wmi_create_device(struct device *wmi_bus=
_dev,
 =09char method[5];
 =09int result;

-=09if (gblock->flags & ACPI_WMI_EVENT) {
+=09if (wblock->gblock.flags & ACPI_WMI_EVENT) {
 =09=09wblock->dev.dev.type =3D &wmi_type_event;
 =09=09goto out_init;
 =09}

-=09if (gblock->flags & ACPI_WMI_METHOD) {
+=09if (wblock->gblock.flags & ACPI_WMI_METHOD) {
 =09=09wblock->dev.dev.type =3D &wmi_type_method;
 =09=09mutex_init(&wblock->char_mutex);
 =09=09goto out_init;
@@ -1091,7 +1090,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,
 =09wblock->dev.dev.bus =3D &wmi_bus_type;
 =09wblock->dev.dev.parent =3D wmi_bus_dev;

-=09dev_set_name(&wblock->dev.dev, "%pUL", gblock->guid);
+=09dev_set_name(&wblock->dev.dev, "%pUL", wblock->gblock.guid);

 =09device_initialize(&wblock->dev.dev);

@@ -1183,7 +1182,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09=09wblock->acpi_device =3D device;
 =09=09wblock->gblock =3D gblock[i];

-=09=09retval =3D wmi_create_device(wmi_bus_dev, &gblock[i], wblock, device=
);
+=09=09retval =3D wmi_create_device(wmi_bus_dev, wblock, device);
 =09=09if (retval) {
 =09=09=09kfree(wblock);
 =09=09=09continue;
--
2.33.0


