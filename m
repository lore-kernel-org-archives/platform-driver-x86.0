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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB942C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE5A060F51
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237340AbhIDR5t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:49 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:59889 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:49 -0400
Date:   Sat, 04 Sep 2021 17:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778205;
        bh=cuST5sTp/SZSZalJB73tl09tIZsJXooY0G+gDmGBhSE=;
        h=Date:To:From:Reply-To:Subject:From;
        b=PcdjEuN1emrHaiNUf/Wu8pNSS0uvDu/Mmjm7RBr2BC7izOtK7Gs/qbd8sTVh9BG9z
         ydRzs5PwrgjtmUCw9UpPgBiRyUPa+2rsNwyC/q8Lc8wOh32ZIvoaBEtPbX7yNrjqX8
         dzcJTjTzxhBOm38zheVMY2aBiO2kbof+fOpBnDuA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 29/30] platform/x86: wmi: introduce helper to retrieve event data
Message-ID: <20210904175450.156801-30-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Previously, `acpi_wmi_notify_handler()` and `wmi_get_event_data()`
shared more or less the exact same code to query the data for
a particular event.

Introduce a function to get rid of the duplication, and use it
from `acpi_wmi_notify_handler()` and `wmi_get_event_data()`.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 42 ++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 830f09c2afe9..cd274de78ab4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -219,6 +219,22 @@ static inline acpi_object_type get_param_acpi_type(con=
st struct wmi_block *wbloc
 =09=09return ACPI_TYPE_BUFFER;
 }

+static acpi_status get_event_data(const struct wmi_block *wblock, struct a=
cpi_buffer *out)
+{
+=09union acpi_object param =3D {
+=09=09.integer =3D {
+=09=09=09.type =3D ACPI_TYPE_INTEGER,
+=09=09=09.value =3D wblock->gblock.notify_id,
+=09=09}
+=09};
+=09struct acpi_object_list input =3D {
+=09=09.count =3D 1,
+=09=09.pointer =3D &param,
+=09};
+
+=09return acpi_evaluate_object(wblock->acpi_device->handle, "_WED", &input=
, out);
+}
+
 /*
  * Exported WMI functions
  */
@@ -623,22 +639,13 @@ EXPORT_SYMBOL_GPL(wmi_remove_notify_handler);
  */
 acpi_status wmi_get_event_data(u32 event, struct acpi_buffer *out)
 {
-=09struct acpi_object_list input;
-=09union acpi_object params[1];
 =09struct wmi_block *wblock;

-=09input.count =3D 1;
-=09input.pointer =3D params;
-=09params[0].type =3D ACPI_TYPE_INTEGER;
-=09params[0].integer.value =3D event;
-
 =09list_for_each_entry(wblock, &wmi_block_list, list) {
 =09=09struct guid_block *gblock =3D &wblock->gblock;

-=09=09if ((gblock->flags & ACPI_WMI_EVENT) &&
-=09=09=09(gblock->notify_id =3D=3D event))
-=09=09=09return acpi_evaluate_object(wblock->acpi_device->handle,
-=09=09=09=09"_WED", &input, out);
+=09=09if ((gblock->flags & ACPI_WMI_EVENT) && gblock->notify_id =3D=3D eve=
nt)
+=09=09=09return get_event_data(wblock, out);
 =09}

 =09return AE_NOT_FOUND;
@@ -1303,21 +1310,12 @@ static void acpi_wmi_notify_handler(acpi_handle han=
dle, u32 event,
 =09/* If a driver is bound, then notify the driver. */
 =09if (wblock->dev.dev.driver) {
 =09=09struct wmi_driver *driver =3D drv_to_wdrv(wblock->dev.dev.driver);
-=09=09struct acpi_object_list input;
-=09=09union acpi_object params[1];
 =09=09struct acpi_buffer evdata =3D { ACPI_ALLOCATE_BUFFER, NULL };
 =09=09acpi_status status;

-=09=09input.count =3D 1;
-=09=09input.pointer =3D params;
-=09=09params[0].type =3D ACPI_TYPE_INTEGER;
-=09=09params[0].integer.value =3D event;
-
-=09=09status =3D acpi_evaluate_object(wblock->acpi_device->handle,
-=09=09=09=09=09      "_WED", &input, &evdata);
+=09=09status =3D get_event_data(wblock, &evdata);
 =09=09if (ACPI_FAILURE(status)) {
-=09=09=09dev_warn(&wblock->dev.dev,
-=09=09=09=09 "failed to get event data\n");
+=09=09=09dev_warn(&wblock->dev.dev, "failed to get event data\n");
 =09=09=09return;
 =09=09}

--
2.33.0


