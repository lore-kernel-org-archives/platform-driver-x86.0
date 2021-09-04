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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452B7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F91760F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbhIDR4V (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:21 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:21085 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237247AbhIDR4T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:19 -0400
Date:   Sat, 04 Sep 2021 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778116;
        bh=jAKN2mV+JXICM9d6DRsLEwoqDgJspjAMnnEf2OJTwmI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=TnVzSA6zfEWvqvMfd1pnhY0sBXFj8xl6lv5APy36YMLS7x29qrCHqKIrztMbdBgs+
         W5JAUmV8m/gphg9udT+UtDZa/7XVJVyGFGbic7+LYb1UuG8QJdNWFBy8pbaHa1IyQl
         57wr9IwOVYTfVUDtsMl4oKVDD5Yf1ufxoSZoQrtM=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 05/30] platform/x86: wmi: remove unnecessary initializations
Message-ID: <20210904175450.156801-6-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some pointers are initialized when they are defined,
but they are almost immediately reassigned in the
following lines. Remove these superfluous assignments.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 6ad5962da59b..36890e301df5 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -177,7 +177,7 @@ static int get_subobj_info(acpi_handle handle, const ch=
ar *pathname,

 static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
 {
-=09struct guid_block *block =3D NULL;
+=09struct guid_block *block;
 =09char method[5];
 =09acpi_status status;
 =09acpi_handle handle;
@@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(set_required_buffer_size);
 acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
 u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
 {
-=09struct wmi_block *wblock =3D NULL;
+=09struct wmi_block *wblock;

 =09if (!find_guid(guid_string, &wblock))
 =09=09return AE_ERROR;
@@ -251,8 +251,8 @@ EXPORT_SYMBOL_GPL(wmi_evaluate_method);
 acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
 =09u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
 {
-=09struct guid_block *block =3D NULL;
-=09struct wmi_block *wblock =3D NULL;
+=09struct guid_block *block;
+=09struct wmi_block *wblock;
 =09acpi_handle handle;
 =09acpi_status status;
 =09struct acpi_object_list input;
@@ -299,7 +299,7 @@ EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
 static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
 =09=09=09=09 struct acpi_buffer *out)
 {
-=09struct guid_block *block =3D NULL;
+=09struct guid_block *block;
 =09acpi_handle handle;
 =09acpi_status status, wc_status =3D AE_ERROR;
 =09struct acpi_object_list input;
@@ -405,8 +405,8 @@ EXPORT_SYMBOL_GPL(wmidev_block_query);
 acpi_status wmi_set_block(const char *guid_string, u8 instance,
 =09=09=09  const struct acpi_buffer *in)
 {
-=09struct guid_block *block =3D NULL;
-=09struct wmi_block *wblock =3D NULL;
+=09struct guid_block *block;
+=09struct wmi_block *wblock;
 =09acpi_handle handle;
 =09struct acpi_object_list input;
 =09union acpi_object params[2];
@@ -650,7 +650,7 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
  */
 char *wmi_get_acpi_device_uid(const char *guid_string)
 {
-=09struct wmi_block *wblock =3D NULL;
+=09struct wmi_block *wblock;

 =09if (!find_guid(guid_string, &wblock))
 =09=09return NULL;
@@ -811,8 +811,8 @@ static int wmi_dev_match(struct device *dev, struct dev=
ice_driver *driver)
 static int wmi_char_open(struct inode *inode, struct file *filp)
 {
 =09const char *driver_name =3D filp->f_path.dentry->d_iname;
-=09struct wmi_block *wblock =3D NULL;
-=09struct wmi_block *next =3D NULL;
+=09struct wmi_block *wblock;
+=09struct wmi_block *next;

 =09list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
 =09=09if (!wblock->dev.dev.driver)
@@ -844,8 +844,8 @@ static long wmi_ioctl(struct file *filp, unsigned int c=
md, unsigned long arg)
 =09struct wmi_ioctl_buffer __user *input =3D
 =09=09(struct wmi_ioctl_buffer __user *) arg;
 =09struct wmi_block *wblock =3D filp->private_data;
-=09struct wmi_ioctl_buffer *buf =3D NULL;
-=09struct wmi_driver *wdriver =3D NULL;
+=09struct wmi_ioctl_buffer *buf;
+=09struct wmi_driver *wdriver;
 =09int ret;

 =09if (_IOC_TYPE(cmd) !=3D WMI_IOC)
--
2.33.0


