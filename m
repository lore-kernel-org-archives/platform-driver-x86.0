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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29DF5C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1138960F38
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 17:55:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237264AbhIDR45 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 13:56:57 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:19414 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR44 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:56 -0400
Date:   Sat, 04 Sep 2021 17:55:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778153;
        bh=+M6jZyUvDs8D1HDsUDXsmgnavyLE7UIgqhM31Lni2z8=;
        h=Date:To:From:Reply-To:Subject:From;
        b=b5dJvNRpydFAIFaokwZrYZLUX/RykbPO6cGrsDq8u4fwoUUusmvTgmSAi5PEGTt0Y
         xqN96wgjV001bIdZ+4HRrrfjT4t+og8OVLUAaHT3NfIVopZ1i0aJCLol4EdyKg4rmF
         y91U0Ta4gWdSf/noHVmHntg3YLhEgJIy9Swsn33Y=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 16/30] platform/x86: wmi: use sysfs_emit()
Message-ID: <20210904175450.156801-17-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Instead of `sprintf()` use the new `sysfs_emit()` function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 7db85a15f5f6..f05c89fd1f79 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -27,6 +27,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
 #include <linux/uuid.h>
@@ -676,7 +677,7 @@ static ssize_t modalias_show(struct device *dev, struct=
 device_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "wmi:%pUL\n", &wblock->gblock.guid);
+=09return sysfs_emit(buf, "wmi:%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(modalias);

@@ -685,7 +686,7 @@ static ssize_t guid_show(struct device *dev, struct dev=
ice_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%pUL\n", &wblock->gblock.guid);
+=09return sysfs_emit(buf, "%pUL\n", &wblock->gblock.guid);
 }
 static DEVICE_ATTR_RO(guid);

@@ -694,7 +695,7 @@ static ssize_t instance_count_show(struct device *dev,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%d\n", (int)wblock->gblock.instance_count);
+=09return sysfs_emit(buf, "%d\n", (int)wblock->gblock.instance_count);
 }
 static DEVICE_ATTR_RO(instance_count);

@@ -703,8 +704,8 @@ static ssize_t expensive_show(struct device *dev,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%d\n",
-=09=09       (wblock->gblock.flags & ACPI_WMI_EXPENSIVE) !=3D 0);
+=09return sysfs_emit(buf, "%d\n",
+=09=09=09  (wblock->gblock.flags & ACPI_WMI_EXPENSIVE) !=3D 0);
 }
 static DEVICE_ATTR_RO(expensive);

@@ -722,7 +723,7 @@ static ssize_t notify_id_show(struct device *dev, struc=
t device_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%02X\n", (unsigned int)wblock->gblock.notify_id);
+=09return sysfs_emit(buf, "%02X\n", (unsigned int)wblock->gblock.notify_id=
);
 }
 static DEVICE_ATTR_RO(notify_id);

@@ -737,8 +738,8 @@ static ssize_t object_id_show(struct device *dev, struc=
t device_attribute *attr,
 {
 =09struct wmi_block *wblock =3D dev_to_wblock(dev);

-=09return sprintf(buf, "%c%c\n", wblock->gblock.object_id[0],
-=09=09       wblock->gblock.object_id[1]);
+=09return sysfs_emit(buf, "%c%c\n", wblock->gblock.object_id[0],
+=09=09=09  wblock->gblock.object_id[1]);
 }
 static DEVICE_ATTR_RO(object_id);

@@ -747,7 +748,7 @@ static ssize_t setable_show(struct device *dev, struct =
device_attribute *attr,
 {
 =09struct wmi_device *wdev =3D dev_to_wdev(dev);

-=09return sprintf(buf, "%d\n", (int)wdev->setable);
+=09return sysfs_emit(buf, "%d\n", (int)wdev->setable);
 }
 static DEVICE_ATTR_RO(setable);

--
2.33.0


