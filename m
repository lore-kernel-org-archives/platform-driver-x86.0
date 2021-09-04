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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0F9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B86E6056B
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237325AbhIDR5Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:24 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:39312 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbhIDR5Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:24 -0400
Date:   Sat, 04 Sep 2021 17:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778179;
        bh=84Tx36ctXhaE1KIvvu+LHN26idbWzqLeVLzIml7LtUw=;
        h=Date:To:From:Reply-To:Subject:From;
        b=EqQr+IVOWAbIt1s3LYf46WYbAXu1X0y1yO297Pmx/RwPqNvp1nDJUsxdPv8jHIq8z
         3QLdNHP++3EwvDB+e11lRfONMhWYkmBUp03OSUREgIkHuJ92aLYsGwcrmKlBEvlBMw
         K/h7YcZpWIy0bJTIt0GbkdfndNHKuCLnL1e/0cMA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 21/30] platform/x86: wmi: move variables
Message-ID: <20210904175450.156801-22-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move some variables in order to keep them
in the narrowest possible scope.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 261a6b68240e..23aab588fdb2 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -136,13 +136,14 @@ static const void *find_guid_context(struct wmi_block=
 *wblock,
 =09=09=09=09      struct wmi_driver *wdriver)
 {
 =09const struct wmi_device_id *id;
-=09guid_t guid_input;

 =09id =3D wdriver->id_table;
 =09if (!id)
 =09=09return NULL;

 =09while (*id->guid_string) {
+=09=09guid_t guid_input;
+
 =09=09if (guid_parse(id->guid_string, &guid_input))
 =09=09=09continue;
 =09=09if (guid_equal(&wblock->gblock.guid, &guid_input))
@@ -604,7 +605,6 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_b=
uffer *out)
 {
 =09struct acpi_object_list input;
 =09union acpi_object params[1];
-=09struct guid_block *gblock;
 =09struct wmi_block *wblock;

 =09input.count =3D 1;
@@ -613,7 +613,7 @@ acpi_status wmi_get_event_data(u32 event, struct acpi_b=
uffer *out)
 =09params[0].integer.value =3D event;

 =09list_for_each_entry(wblock, &wmi_block_list, list) {
-=09=09gblock =3D &wblock->gblock;
+=09=09struct guid_block *gblock =3D &wblock->gblock;

 =09=09if ((gblock->flags & ACPI_WMI_EVENT) &&
 =09=09=09(gblock->notify_id =3D=3D event))
@@ -1264,12 +1264,11 @@ acpi_wmi_ec_space_handler(u32 function, acpi_physic=
al_address address,
 static void acpi_wmi_notify_handler(acpi_handle handle, u32 event,
 =09=09=09=09    void *context)
 {
-=09struct guid_block *block;
 =09struct wmi_block *wblock;
 =09bool found_it =3D false;

 =09list_for_each_entry(wblock, &wmi_block_list, list) {
-=09=09block =3D &wblock->gblock;
+=09=09struct guid_block *block =3D &wblock->gblock;

 =09=09if (wblock->acpi_device->handle =3D=3D handle &&
 =09=09    (block->flags & ACPI_WMI_EVENT) &&
--
2.33.0


