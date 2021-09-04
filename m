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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF6FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A22B60F51
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237326AbhIDR5m (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:57:42 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:61780 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237178AbhIDR5k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:40 -0400
Date:   Sat, 04 Sep 2021 17:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778197;
        bh=QfzVJOVBkRRwwshU93w33mZkxU1oSQz+eJPHse1AB04=;
        h=Date:To:From:Reply-To:Subject:From;
        b=GSDDOJJEmhSS1w7y5L3Pne8Iaf1/Md/bcmugCKOo8fLN05CFzIN4kmMRRUQquE3yS
         EZF7AAPh62V7WAlpK8AoYW2fyOQ9bzjMlggxiCj5g2LLVEVHCL/VUHwDSVVK4YI/bV
         9nGkNyR0xwHRZDKAAgsL5i5x7U1gVBJK/IgHBELM=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 26/30] platform/x86: wmi: introduce helper to convert driver to WMI driver
Message-ID: <20210904175450.156801-27-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce a helper function which wraps the appropriate `container_of()`
macro invocation to convert a `struct device_driver` to `struct wmi_driver`=
.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index ea7154160946..ff33ad2053f0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -673,6 +673,11 @@ static struct wmi_device *dev_to_wdev(struct device *d=
ev)
 =09return container_of(dev, struct wmi_device, dev);
 }

+static inline struct wmi_driver *drv_to_wdrv(struct device_driver *drv)
+{
+=09return container_of(drv, struct wmi_driver, driver);
+}
+
 /*
  * sysfs interface
  */
@@ -791,8 +796,7 @@ static void wmi_dev_release(struct device *dev)

 static int wmi_dev_match(struct device *dev, struct device_driver *driver)
 {
-=09struct wmi_driver *wmi_driver =3D
-=09=09container_of(driver, struct wmi_driver, driver);
+=09struct wmi_driver *wmi_driver =3D drv_to_wdrv(driver);
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);
 =09const struct wmi_device_id *id =3D wmi_driver->id_table;

@@ -889,8 +893,7 @@ static long wmi_ioctl(struct file *filp, unsigned int c=
md, unsigned long arg)
 =09}

 =09/* let the driver do any filtering and do the call */
-=09wdriver =3D container_of(wblock->dev.dev.driver,
-=09=09=09       struct wmi_driver, driver);
+=09wdriver =3D drv_to_wdrv(wblock->dev.dev.driver);
 =09if (!try_module_get(wdriver->driver.owner)) {
 =09=09ret =3D -EBUSY;
 =09=09goto out_ioctl;
@@ -923,8 +926,7 @@ static const struct file_operations wmi_fops =3D {
 static int wmi_dev_probe(struct device *dev)
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);
-=09struct wmi_driver *wdriver =3D
-=09=09container_of(dev->driver, struct wmi_driver, driver);
+=09struct wmi_driver *wdriver =3D drv_to_wdrv(dev->driver);
 =09int ret =3D 0;
 =09char *buf;

@@ -987,8 +989,7 @@ static int wmi_dev_probe(struct device *dev)
 static void wmi_dev_remove(struct device *dev)
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);
-=09struct wmi_driver *wdriver =3D
-=09=09container_of(dev->driver, struct wmi_driver, driver);
+=09struct wmi_driver *wdriver =3D drv_to_wdrv(dev->driver);

 =09if (wdriver->filter_callback) {
 =09=09misc_deregister(&wblock->char_dev);
@@ -1290,15 +1291,12 @@ static void acpi_wmi_notify_handler(acpi_handle han=
dle, u32 event,

 =09/* If a driver is bound, then notify the driver. */
 =09if (wblock->dev.dev.driver) {
-=09=09struct wmi_driver *driver;
+=09=09struct wmi_driver *driver =3D drv_to_wdrv(wblock->dev.dev.driver);
 =09=09struct acpi_object_list input;
 =09=09union acpi_object params[1];
 =09=09struct acpi_buffer evdata =3D { ACPI_ALLOCATE_BUFFER, NULL };
 =09=09acpi_status status;

-=09=09driver =3D container_of(wblock->dev.dev.driver,
-=09=09=09=09      struct wmi_driver, driver);
-
 =09=09input.count =3D 1;
 =09=09input.pointer =3D params;
 =09=09params[0].type =3D ACPI_TYPE_INTEGER;
--
2.33.0


