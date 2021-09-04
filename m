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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5336C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B375C60F56
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237334AbhIDR5r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:47 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:55162 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:47 -0400
Date:   Sat, 04 Sep 2021 17:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778202;
        bh=1JuGZtWbEyLbOtMIRxVOBDmGks9yhQamvsxhZwQ5oJs=;
        h=Date:To:From:Reply-To:Subject:From;
        b=oiJT9uGEzaKTssh5Bx1zfw56+3nlvRNB9HZBTjMJranpYEOdi/PDLmzuoWWLtz/jR
         jZsdj45e2NzbfgWVP7LlpG9oQR4ElH8ww4Ln4Oiad7P7KZbhJB/MffnBW1G8F/Gf11
         BPc+rVl1aenehPJDRnnCVcKEpzh9XO02aqu4DiDU=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 27/30] platform/x86: wmi: introduce helper to generate method names
Message-ID: <20210904175450.156801-28-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of "manually" constructing the ACPI method name and
hard-coding sizes in WMI functions, introduce a helper method
which generates the method name for an arbitrary WMI block.

Furthermore, save the appropriate buffer size into a macro.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 42 ++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ff33ad2053f0..4f484677759b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -195,6 +195,22 @@ static acpi_status wmi_method_enable(struct wmi_block =
*wblock, bool enable)
 =09return status;
 }

+#define WMI_ACPI_METHOD_NAME_SIZE 5
+
+static inline void get_acpi_method_name(const struct wmi_block *wblock,
+=09=09=09=09=09const char method,
+=09=09=09=09=09char buffer[static WMI_ACPI_METHOD_NAME_SIZE])
+{
+=09static_assert(ARRAY_SIZE(wblock->gblock.object_id) =3D=3D 2);
+=09static_assert(WMI_ACPI_METHOD_NAME_SIZE >=3D 5);
+
+=09buffer[0] =3D 'W';
+=09buffer[1] =3D method;
+=09buffer[2] =3D wblock->gblock.object_id[0];
+=09buffer[3] =3D wblock->gblock.object_id[1];
+=09buffer[4] =3D '\0';
+}
+
 /*
  * Exported WMI functions
  */
@@ -257,7 +273,7 @@ acpi_status wmidev_evaluate_method(struct wmi_device *w=
dev, u8 instance, u32 met
 =09acpi_handle handle;
 =09struct acpi_object_list input;
 =09union acpi_object params[3];
-=09char method[5] =3D "WM";
+=09char method[WMI_ACPI_METHOD_NAME_SIZE];

 =09wblock =3D container_of(wdev, struct wmi_block, dev);
 =09block =3D &wblock->gblock;
@@ -288,7 +304,7 @@ acpi_status wmidev_evaluate_method(struct wmi_device *w=
dev, u8 instance, u32 met
 =09=09params[2].buffer.pointer =3D in->pointer;
 =09}

-=09strncat(method, block->object_id, 2);
+=09get_acpi_method_name(wblock, 'M', method);

 =09return acpi_evaluate_object(handle, method, &input, out);
 }
@@ -302,8 +318,8 @@ static acpi_status __query_block(struct wmi_block *wblo=
ck, u8 instance,
 =09acpi_status status, wc_status =3D AE_ERROR;
 =09struct acpi_object_list input;
 =09union acpi_object wq_params[1];
-=09char method[5];
-=09char wc_method[5] =3D "WC";
+=09char wc_method[WMI_ACPI_METHOD_NAME_SIZE];
+=09char method[WMI_ACPI_METHOD_NAME_SIZE];

 =09if (!out)
 =09=09return AE_BAD_PARAMETER;
@@ -331,7 +347,7 @@ static acpi_status __query_block(struct wmi_block *wblo=
ck, u8 instance,
 =09 * enable collection.
 =09 */
 =09if (block->flags & ACPI_WMI_EXPENSIVE) {
-=09=09strncat(wc_method, block->object_id, 2);
+=09=09get_acpi_method_name(wblock, 'C', wc_method);

 =09=09/*
 =09=09 * Some GUIDs break the specification by declaring themselves
@@ -341,9 +357,7 @@ static acpi_status __query_block(struct wmi_block *wblo=
ck, u8 instance,
 =09=09wc_status =3D acpi_execute_simple_method(handle, wc_method, 1);
 =09}

-=09strcpy(method, "WQ");
-=09strncat(method, block->object_id, 2);
-
+=09get_acpi_method_name(wblock, 'Q', method);
 =09status =3D acpi_evaluate_object(handle, method, &input, out);

 =09/*
@@ -415,7 +429,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 i=
nstance,
 =09acpi_handle handle;
 =09struct acpi_object_list input;
 =09union acpi_object params[2];
-=09char method[5] =3D "WS";
+=09char method[WMI_ACPI_METHOD_NAME_SIZE];

 =09if (!guid_string || !in)
 =09=09return AE_BAD_DATA;
@@ -446,7 +460,7 @@ acpi_status wmi_set_block(const char *guid_string, u8 i=
nstance,
 =09params[1].buffer.length =3D in->length;
 =09params[1].buffer.pointer =3D in->pointer;

-=09strncat(method, block->object_id, 2);
+=09get_acpi_method_name(wblock, 'S', method);

 =09return acpi_evaluate_object(handle, method, &input, NULL);
 }
@@ -1040,7 +1054,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,
 =09=09=09     struct acpi_device *device)
 {
 =09struct acpi_device_info *info;
-=09char method[5];
+=09char method[WMI_ACPI_METHOD_NAME_SIZE];
 =09int result;

 =09if (wblock->gblock.flags & ACPI_WMI_EVENT) {
@@ -1059,8 +1073,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,
 =09 * required per the WMI documentation. If it is not present,
 =09 * we ignore this data block.
 =09 */
-=09strcpy(method, "WQ");
-=09strncat(method, wblock->gblock.object_id, 2);
+=09get_acpi_method_name(wblock, 'Q', method);
 =09result =3D get_subobj_info(device->handle, method, &info);

 =09if (result) {
@@ -1087,8 +1100,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,

 =09kfree(info);

-=09strcpy(method, "WS");
-=09strncat(method, wblock->gblock.object_id, 2);
+=09get_acpi_method_name(wblock, 'S', method);
 =09result =3D get_subobj_info(device->handle, method, NULL);

 =09if (result =3D=3D 0)
--
2.33.0


