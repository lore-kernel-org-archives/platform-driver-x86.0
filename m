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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076C0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE0456056B
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237315AbhIDR5U (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:20 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:14996 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237305AbhIDR5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:19 -0400
Date:   Sat, 04 Sep 2021 17:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778176;
        bh=KITuurI6kknC8fj+9pkALatR+u7FDSlXJcBw3vxqfV8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=P0ImXe0kuGFmgwT6Ikxyh09EAU8y1u55TnaWdHChv1dlr760yzM79HKlJDRuQUjeI
         zqGlN5B9ponzwiSxL/SjHMVqYFVLSZjEPTVOvsxeqbSHxGWxVIMBG1hY+8HDZg51Ub
         tcwTSa80a0olm16bhA3wgRHj8KopkJg9AdcCPbag=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 22/30] platform/x86: wmi: align arguments of functions
Message-ID: <20210904175450.156801-23-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Align the arguments of
  * wmi_evaluate_method()
  * wmi_install_notify_handler()
  * wmidev_evaluate_method()
  * find_guid_context()
  * acpi_wmi_ec_space_handler()
  * wmi_char_read()

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 23aab588fdb2..fcc867d79e91 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -133,7 +133,7 @@ static bool find_guid(const char *guid_string, struct w=
mi_block **out)
 }

 static const void *find_guid_context(struct wmi_block *wblock,
-=09=09=09=09      struct wmi_driver *wdriver)
+=09=09=09=09     struct wmi_driver *wdriver)
 {
 =09const struct wmi_device_id *id;

@@ -228,8 +228,8 @@ EXPORT_SYMBOL_GPL(set_required_buffer_size);
  *
  * Call an ACPI-WMI method
  */
-acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
-u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
+acpi_status wmi_evaluate_method(const char *guid_string, u8 instance, u32 =
method_id,
+=09=09=09=09const struct acpi_buffer *in, struct acpi_buffer *out)
 {
 =09struct wmi_block *wblock;

@@ -250,8 +250,8 @@ EXPORT_SYMBOL_GPL(wmi_evaluate_method);
  *
  * Call an ACPI-WMI method
  */
-acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
-=09u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
+acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance, u=
32 method_id,
+=09=09=09=09   const struct acpi_buffer *in, struct acpi_buffer *out)
 {
 =09struct guid_block *block;
 =09struct wmi_block *wblock;
@@ -514,7 +514,8 @@ static void wmi_notify_debug(u32 value, void *context)
  * Register a handler for events sent to the ACPI-WMI mapper device.
  */
 acpi_status wmi_install_notify_handler(const char *guid,
-wmi_notify_handler handler, void *data)
+=09=09=09=09       wmi_notify_handler handler,
+=09=09=09=09       void *data)
 {
 =09struct wmi_block *block;
 =09acpi_status status =3D AE_NOT_EXIST;
@@ -827,7 +828,7 @@ static int wmi_char_open(struct inode *inode, struct fi=
le *filp)
 }

 static ssize_t wmi_char_read(struct file *filp, char __user *buffer,
-=09size_t length, loff_t *offset)
+=09=09=09     size_t length, loff_t *offset)
 {
 =09struct wmi_block *wblock =3D filp->private_data;

@@ -1226,8 +1227,8 @@ static int parse_wdg(struct device *wmi_bus_dev, stru=
ct acpi_device *device)
  */
 static acpi_status
 acpi_wmi_ec_space_handler(u32 function, acpi_physical_address address,
-=09=09      u32 bits, u64 *value,
-=09=09      void *handler_context, void *region_context)
+=09=09=09  u32 bits, u64 *value,
+=09=09=09  void *handler_context, void *region_context)
 {
 =09int result =3D 0, i =3D 0;
 =09u8 temp =3D 0;
--
2.33.0


