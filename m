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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE0DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7141960F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237322AbhIDR4s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:48 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:12440 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237253AbhIDR4p (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:45 -0400
Date:   Sat, 04 Sep 2021 17:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778142;
        bh=gbQJtDmvup2UmZbYwE4J43KC/phaPk3Ls8JxHWgP9DU=;
        h=Date:To:From:Reply-To:Subject:From;
        b=VHywgkXVNhhHJE9O676zsrYNIFCRD9VDBuU9Yd8Sr56gSW+zEJ4OQz4EXH0SK0udM
         v6SgHrfdHU8jM6GOU6EqTlze3EX+fqYv7z/FDiska1dETOkHnUH/cpzZhXhqtj3EIa
         EHYWcNR8cJL1i2DXuGR2G2O2kiu3JTT04czi6UYs=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 12/30] platform/x86: wmi: use bool instead of int
Message-ID: <20210904175450.156801-13-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The `bool` type is more expressive for a yes/no
kind of value, so use that as the type of the
`enable` parameter of `wmi_method_enable()`.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 029278775ebc..90ba75247d7f 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -174,7 +174,7 @@ static int get_subobj_info(acpi_handle handle, const ch=
ar *pathname,
 =09return 0;
 }

-static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
+static acpi_status wmi_method_enable(struct wmi_block *wblock, bool enable=
)
 {
 =09struct guid_block *block;
 =09char method[5];
@@ -534,7 +534,7 @@ wmi_notify_handler handler, void *data)
 =09=09=09block->handler =3D handler;
 =09=09=09block->handler_data =3D data;

-=09=09=09wmi_status =3D wmi_method_enable(block, 1);
+=09=09=09wmi_status =3D wmi_method_enable(block, true);
 =09=09=09if ((wmi_status !=3D AE_OK) ||
 =09=09=09    ((wmi_status =3D=3D AE_OK) && (status =3D=3D AE_NOT_EXIST)))
 =09=09=09=09status =3D wmi_status;
@@ -575,7 +575,7 @@ acpi_status wmi_remove_notify_handler(const char *guid)
 =09=09=09=09block->handler =3D wmi_notify_debug;
 =09=09=09=09status =3D AE_OK;
 =09=09=09} else {
-=09=09=09=09wmi_status =3D wmi_method_enable(block, 0);
+=09=09=09=09wmi_status =3D wmi_method_enable(block, false);
 =09=09=09=09block->handler =3D NULL;
 =09=09=09=09block->handler_data =3D NULL;
 =09=09=09=09if ((wmi_status !=3D AE_OK) ||
@@ -919,7 +919,7 @@ static int wmi_dev_probe(struct device *dev)
 =09int ret =3D 0;
 =09char *buf;

-=09if (ACPI_FAILURE(wmi_method_enable(wblock, 1)))
+=09if (ACPI_FAILURE(wmi_method_enable(wblock, true)))
 =09=09dev_warn(dev, "failed to enable device -- probing anyway\n");

 =09if (wdriver->probe) {
@@ -970,7 +970,7 @@ static int wmi_dev_probe(struct device *dev)
 probe_string_failure:
 =09kfree(wblock->handler_data);
 probe_failure:
-=09if (ACPI_FAILURE(wmi_method_enable(wblock, 0)))
+=09if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
 =09=09dev_warn(dev, "failed to disable device\n");
 =09return ret;
 }
@@ -990,7 +990,7 @@ static void wmi_dev_remove(struct device *dev)
 =09if (wdriver->remove)
 =09=09wdriver->remove(dev_to_wdev(dev));

-=09if (ACPI_FAILURE(wmi_method_enable(wblock, 0)))
+=09if (ACPI_FAILURE(wmi_method_enable(wblock, false)))
 =09=09dev_warn(dev, "failed to disable device\n");
 }

@@ -1190,7 +1190,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)

 =09=09if (debug_event) {
 =09=09=09wblock->handler =3D wmi_notify_debug;
-=09=09=09wmi_method_enable(wblock, 1);
+=09=09=09wmi_method_enable(wblock, true);
 =09=09}
 =09}

@@ -1207,7 +1207,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09=09=09dev_err(wmi_bus_dev, "failed to register %pUL\n",
 =09=09=09=09wblock->gblock.guid);
 =09=09=09if (debug_event)
-=09=09=09=09wmi_method_enable(wblock, 0);
+=09=09=09=09wmi_method_enable(wblock, false);
 =09=09=09list_del(&wblock->list);
 =09=09=09put_device(&wblock->dev.dev);
 =09=09}
--
2.33.0


