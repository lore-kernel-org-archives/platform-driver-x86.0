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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1363C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8ACDD60F3A
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237260AbhIDR4w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:52 -0400
Received: from mail-4317.protonmail.ch ([185.70.43.17]:11456 "EHLO
        mail-4317.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR4w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:52 -0400
Date:   Sat, 04 Sep 2021 17:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778148;
        bh=ApKq5+czdPUQtABPdY+uGtbr6quDEGzNzXjW9XnNbPo=;
        h=Date:To:From:Reply-To:Subject:From;
        b=ELpxtY4eunvgh6+SYe0CmOZs35PDhSeaPXdlgVJ6xLOoS/TRspx5sQOsiyqVd8McH
         hLCd6zrKH3Zn+uQ4SvksYv6s3cK7EOMHDKt1y3ZNssxZGWolU/Rz6dBhHLQapxXSRw
         ha46LXbvNdqqQzJ/vSV1N1r0sAYIMhQRj2YwxTh0=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 14/30] platform/x86: wmi: use guid_t and guid_equal()
Message-ID: <20210904175450.156801-15-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of hard-coding a 16 long byte array,
use the available `guid_t` type and related methods.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 8aad8f080c64..28e5825cba8b 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -40,7 +40,7 @@ MODULE_LICENSE("GPL");
 static LIST_HEAD(wmi_block_list);

 struct guid_block {
-=09char guid[16];
+=09guid_t guid;
 =09union {
 =09=09char object_id[2];
 =09=09struct {
@@ -121,7 +121,7 @@ static bool find_guid(const char *guid_string, struct w=
mi_block **out)
 =09list_for_each_entry(wblock, &wmi_block_list, list) {
 =09=09block =3D &wblock->gblock;

-=09=09if (memcmp(block->guid, &guid_input, 16) =3D=3D 0) {
+=09=09if (guid_equal(&block->guid, &guid_input)) {
 =09=09=09if (out)
 =09=09=09=09*out =3D wblock;
 =09=09=09return true;
@@ -143,7 +143,7 @@ static const void *find_guid_context(struct wmi_block *=
wblock,
 =09while (*id->guid_string) {
 =09=09if (guid_parse(id->guid_string, &guid_input))
 =09=09=09continue;
-=09=09if (!memcmp(wblock->gblock.guid, &guid_input, 16))
+=09=09if (guid_equal(&wblock->gblock.guid, &guid_input))
 =09=09=09return id->context;
 =09=09id++;
 =09}
@@ -445,7 +445,7 @@ EXPORT_SYMBOL_GPL(wmi_set_block);

 static void wmi_dump_wdg(const struct guid_block *g)
 {
-=09pr_info("%pUL:\n", g->guid);
+=09pr_info("%pUL:\n", &g->guid);
 =09if (g->flags & ACPI_WMI_EVENT)
 =09=09pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
 =09else
@@ -526,7 +526,7 @@ wmi_notify_handler handler, void *data)
 =09list_for_each_entry(block, &wmi_block_list, list) {
 =09=09acpi_status wmi_status;

-=09=09if (memcmp(block->gblock.guid, &guid_input, 16) =3D=3D 0) {
+=09=09if (guid_equal(&block->gblock.guid, &guid_input)) {
 =09=09=09if (block->handler &&
 =09=09=09    block->handler !=3D wmi_notify_debug)
 =09=09=09=09return AE_ALREADY_ACQUIRED;
@@ -566,7 +566,7 @@ acpi_status wmi_remove_notify_handler(const char *guid)
 =09list_for_each_entry(block, &wmi_block_list, list) {
 =09=09acpi_status wmi_status;

-=09=09if (memcmp(block->gblock.guid, &guid_input, 16) =3D=3D 0) {
+=09=09if (guid_equal(&block->gblock.guid, &guid_input)) {
 =09=09=09if (!block->handler ||
 =09=09=09    block->handler =3D=3D wmi_notify_debug)
 =09=09=09=09return AE_NULL_ENTRY;
@@ -672,7 +672,7 @@ static ssize_t modalias_show(struct device *dev, struct=
 device_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "wmi:%pUL\n", wblock->gblock.guid);
+=09return sprintf(buf, "wmi:%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(modalias);

@@ -681,7 +681,7 @@ static ssize_t guid_show(struct device *dev, struct dev=
ice_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%pUL\n", wblock->gblock.guid);
+=09return sprintf(buf, "%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(guid);

@@ -764,10 +764,10 @@ static int wmi_dev_uevent(struct device *dev, struct =
kobj_uevent_env *env)
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09if (add_uevent_var(env, "MODALIAS=3Dwmi:%pUL", wblock->gblock.guid))
+=09if (add_uevent_var(env, "MODALIAS=3Dwmi:%pUL", &wblock->gblock.guid))
 =09=09return -ENOMEM;

-=09if (add_uevent_var(env, "WMI_GUID=3D%pUL", wblock->gblock.guid))
+=09if (add_uevent_var(env, "WMI_GUID=3D%pUL", &wblock->gblock.guid))
 =09=09return -ENOMEM;

 =09return 0;
@@ -795,7 +795,7 @@ static int wmi_dev_match(struct device *dev, struct dev=
ice_driver *driver)

 =09=09if (WARN_ON(guid_parse(id->guid_string, &driver_guid)))
 =09=09=09continue;
-=09=09if (!memcmp(&driver_guid, wblock->gblock.guid, 16))
+=09=09if (guid_equal(&driver_guid, &wblock->gblock.guid))
 =09=09=09return 1;

 =09=09id++;
@@ -1088,7 +1088,7 @@ static int wmi_create_device(struct device *wmi_bus_d=
ev,
 =09wblock->dev.dev.bus =3D &wmi_bus_type;
 =09wblock->dev.dev.parent =3D wmi_bus_dev;

-=09dev_set_name(&wblock->dev.dev, "%pUL", wblock->gblock.guid);
+=09dev_set_name(&wblock->dev.dev, "%pUL", &wblock->gblock.guid);

 =09device_initialize(&wblock->dev.dev);

@@ -1108,12 +1108,12 @@ static void wmi_free_devices(struct acpi_device *de=
vice)
 =09}
 }

-static bool guid_already_parsed(struct acpi_device *device, const u8 *guid=
)
+static bool guid_already_parsed(struct acpi_device *device, const guid_t *=
guid)
 {
 =09struct wmi_block *wblock;

 =09list_for_each_entry(wblock, &wmi_block_list, list) {
-=09=09if (memcmp(wblock->gblock.guid, guid, 16) =3D=3D 0) {
+=09=09if (guid_equal(&wblock->gblock.guid, guid)) {
 =09=09=09/*
 =09=09=09 * Because we historically didn't track the relationship
 =09=09=09 * between GUIDs and ACPI nodes, we don't know whether
@@ -1168,7 +1168,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09=09 * case yet, so for now, we'll just ignore the duplicate
 =09=09 * for device creation.
 =09=09 */
-=09=09if (guid_already_parsed(device, gblock[i].guid))
+=09=09if (guid_already_parsed(device, &gblock[i].guid))
 =09=09=09continue;

 =09=09wblock =3D kzalloc(sizeof(struct wmi_block), GFP_KERNEL);
@@ -1205,7 +1205,7 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
 =09=09retval =3D device_add(&wblock->dev.dev);
 =09=09if (retval) {
 =09=09=09dev_err(wmi_bus_dev, "failed to register %pUL\n",
-=09=09=09=09wblock->gblock.guid);
+=09=09=09=09&wblock->gblock.guid);
 =09=09=09if (debug_event)
 =09=09=09=09wmi_method_enable(wblock, false);
 =09=09=09list_del(&wblock->list);
--
2.33.0


