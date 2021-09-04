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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEA7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 689D260F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhIDR43 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:29 -0400
Received: from mail-4317.protonmail.ch ([185.70.43.17]:53186 "EHLO
        mail-4317.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237297AbhIDR42 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:28 -0400
Date:   Sat, 04 Sep 2021 17:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778125;
        bh=TgeM8TY1lGTJdNkviI824VEobz/nwKJ0OOVKCk4GoGA=;
        h=Date:To:From:Reply-To:Subject:From;
        b=REoyX/PRq4GEYr+bwDpRUOJ71Xe3T10wqIK0t4nofkojo97ay21ylXa/V2X8zNzfi
         bDttpFmsUS73mPZ/n6k3Q78McJflK3oAHqRL3/NQ3ENWnlIimmPn7FZ2WoCU6+162d
         ZJURF1INlNLW/PQioL3dYtWXwBwDnx1XoPZlFhX8=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 08/30] platform/x86: wmi: remove unnecessary casts
Message-ID: <20210904175450.156801-9-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Void pointers are implictly cast to arbitrary pointer types,
so remove superfluous casts.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 6252e8d88680..c3ee64843731 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -387,7 +387,7 @@ union acpi_object *wmidev_block_query(struct wmi_device=
 *wdev, u8 instance)
 =09if (ACPI_FAILURE(__query_block(wblock, instance, &out)))
 =09=09return NULL;

-=09return (union acpi_object *)out.pointer;
+=09return out.pointer;
 }
 EXPORT_SYMBOL_GPL(wmidev_block_query);

@@ -479,8 +479,7 @@ static void wmi_notify_debug(u32 value, void *context)
 =09=09return;
 =09}

-=09obj =3D (union acpi_object *)response.pointer;
-
+=09obj =3D response.pointer;
 =09if (!obj)
 =09=09return;

@@ -1148,7 +1147,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09if (ACPI_FAILURE(status))
 =09=09return -ENXIO;

-=09obj =3D (union acpi_object *) out.pointer;
+=09obj =3D out.pointer;
 =09if (!obj)
 =09=09return -ENXIO;

@@ -1307,8 +1306,7 @@ static void acpi_wmi_notify_handler(acpi_handle handl=
e, u32 event,
 =09=09}

 =09=09if (driver->notify)
-=09=09=09driver->notify(&wblock->dev,
-=09=09=09=09       (union acpi_object *)evdata.pointer);
+=09=09=09driver->notify(&wblock->dev, evdata.pointer);

 =09=09kfree(evdata.pointer);
 =09} else if (wblock->handler) {
@@ -1335,7 +1333,7 @@ static int acpi_wmi_remove(struct platform_device *de=
vice)
 =09acpi_remove_address_space_handler(acpi_device->handle,
 =09=09=09=09ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
 =09wmi_free_devices(acpi_device);
-=09device_unregister((struct device *)dev_get_drvdata(&device->dev));
+=09device_unregister(dev_get_drvdata(&device->dev));

 =09return 0;
 }
--
2.33.0


