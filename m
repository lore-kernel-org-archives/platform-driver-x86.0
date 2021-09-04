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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EBEC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0D1B60F56
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237247AbhIDR54 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:56 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:17734 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:55 -0400
Date:   Sat, 04 Sep 2021 17:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778212;
        bh=Lz30czYvQEjqIFQgwmtlqVRJWRZbQdHgeIDs0fZKPXI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=izpsE9bT+sqGsngYWq0C4r4BpcjfKusTzxVKaSuVkwBdyNHthrOluOlZaKLzRQTZH
         8Y95z/zVrw93zzXhiMmO+r9XMeJ2PjSL1HdXd1xBNjBWNGb4vz4RXs0fwlIXrfzGpJ
         ZIjd+bcu0oKUskPQVYtbGzMDAcpEJHVv+PlcOlqw=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 30/30] platform/x86: wmi: more detailed error reporting in find_guid()
Message-ID: <20210904175450.156801-31-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make `find_guid()` return an acpi_status, and make it handle NULL
pointer GUID strings; and adapt users accordingly.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 43 ++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index cd274de78ab4..6afe67684eef 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -114,22 +114,27 @@ static struct platform_driver acpi_wmi_driver =3D {
  * GUID parsing functions
  */

-static bool find_guid(const char *guid_string, struct wmi_block **out)
+static acpi_status find_guid(const char *guid_string, struct wmi_block **o=
ut)
 {
 =09guid_t guid_input;
 =09struct wmi_block *wblock;

+=09if (!guid_string)
+=09=09return AE_BAD_PARAMETER;
+
 =09if (guid_parse(guid_string, &guid_input))
-=09=09return false;
+=09=09return AE_BAD_PARAMETER;

 =09list_for_each_entry(wblock, &wmi_block_list, list) {
 =09=09if (guid_equal(&wblock->gblock.guid, &guid_input)) {
 =09=09=09if (out)
 =09=09=09=09*out =3D wblock;
-=09=09=09return true;
+
+=09=09=09return AE_OK;
 =09=09}
 =09}
-=09return false;
+
+=09return AE_NOT_FOUND;
 }

 static const void *find_guid_context(struct wmi_block *wblock,
@@ -271,9 +276,12 @@ acpi_status wmi_evaluate_method(const char *guid_strin=
g, u8 instance, u32 method
 =09=09=09=09const struct acpi_buffer *in, struct acpi_buffer *out)
 {
 =09struct wmi_block *wblock;
+=09acpi_status status;
+
+=09status =3D find_guid(guid_string, &wblock);
+=09if (ACPI_FAILURE(status))
+=09=09return status;

-=09if (!find_guid(guid_string, &wblock))
-=09=09return AE_ERROR;
 =09return wmidev_evaluate_method(&wblock->dev, instance, method_id,
 =09=09=09=09      in, out);
 }
@@ -410,12 +418,11 @@ acpi_status wmi_query_block(const char *guid_string, =
u8 instance,
 =09=09=09    struct acpi_buffer *out)
 {
 =09struct wmi_block *wblock;
+=09acpi_status status;

-=09if (!guid_string)
-=09=09return AE_BAD_PARAMETER;
-
-=09if (!find_guid(guid_string, &wblock))
-=09=09return AE_ERROR;
+=09status =3D find_guid(guid_string, &wblock);
+=09if (ACPI_FAILURE(status))
+=09=09return status;

 =09return __query_block(wblock, instance, out);
 }
@@ -450,12 +457,14 @@ acpi_status wmi_set_block(const char *guid_string, u8=
 instance,
 =09struct acpi_object_list input;
 =09union acpi_object params[2];
 =09char method[WMI_ACPI_METHOD_NAME_SIZE];
+=09acpi_status status;

-=09if (!guid_string || !in)
+=09if (!in)
 =09=09return AE_BAD_DATA;

-=09if (!find_guid(guid_string, &wblock))
-=09=09return AE_ERROR;
+=09status =3D find_guid(guid_string, &wblock);
+=09if (ACPI_FAILURE(status))
+=09=09return status;

 =09block =3D &wblock->gblock;
 =09handle =3D wblock->acpi_device->handle;
@@ -660,7 +669,7 @@ EXPORT_SYMBOL_GPL(wmi_get_event_data);
  */
 bool wmi_has_guid(const char *guid_string)
 {
-=09return find_guid(guid_string, NULL);
+=09return ACPI_SUCCESS(find_guid(guid_string, NULL));
 }
 EXPORT_SYMBOL_GPL(wmi_has_guid);

@@ -675,8 +684,10 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
 char *wmi_get_acpi_device_uid(const char *guid_string)
 {
 =09struct wmi_block *wblock;
+=09acpi_status status;

-=09if (!find_guid(guid_string, &wblock))
+=09status =3D find_guid(guid_string, &wblock);
+=09if (ACPI_FAILURE(status))
 =09=09return NULL;

 =09return acpi_device_uid(wblock->acpi_device);
--
2.33.0


