Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC3BC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Oct 2022 15:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiJEPDH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiJEPCf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 11:02:35 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACD07E809
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 08:01:05 -0700 (PDT)
Date:   Wed, 05 Oct 2022 15:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664982060; x=1665241260;
        bh=QFm7x27ASU9xbMs2L98Rq//HgRjY93gOtvZTaJHCNT4=;
        h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=N201fCGkRnOpBiihKToMKKKt5YLMd6ylHEAb8aARiUXLnbvyjo0RI/PBCXu2wvvt+
         UV+3Oy4WZkDvzQdO/kTms8YFdN34+DwEocjYHeFqdkFzTNL8xVcqq+Gd4+wttEk8G7
         B8iHQeMsyar8sKuDp/zwB/al8tHrqOUGX2KaT6HYV82xEH/dLY3NvOD/Hjkkp7UC+K
         plcRFDmlewgUC5yLLC6dqNO64aOtaU3UEsHCBrSPu9WMcMXMmqVi20I5IT/jTk5fA5
         K+jwdFEfd58vTnfvtUeN//grrRifLCynmwGZrZdFfIA+G8TczDidHZ7ISV/WyEb1mq
         BpkCRPV2u/mnQ==
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v1 3/3] platform/x86: huawei-wmi: remove unnecessary member
Message-ID: <20221005150032.173198-3-pobrn@protonmail.com>
In-Reply-To: <20221005150032.173198-1-pobrn@protonmail.com>
References: <20221005150032.173198-1-pobrn@protonmail.com>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The `huawei_wmi::idev` array is not actually used by the driver,
so remove it. The piece of code that - I believe - was supposed
to fill the array is flawed, it did not actually set any of the
values inside the array. This was most likely masked by the fact
that the input devices are devm managed and that the only function
that needs a reference to the input devices is
`huawei_wmi_input_notify()`, however, that does not access the
appropriate input device via the `huawei_wmi` object.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/huawei-wmi.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/huawe=
i-wmi.c
index bbab73c430d1..1c8fa4f0d7be 100644
--- a/drivers/platform/x86/huawei-wmi.c
+++ b/drivers/platform/x86/huawei-wmi.c
@@ -63,7 +63,6 @@ struct huawei_wmi {
 =09bool fn_lock_available;

 =09struct huawei_wmi_debug debug;
-=09struct input_dev *idev[2];
 =09struct led_classdev cdev;
 =09struct device *dev;

@@ -756,31 +755,30 @@ static void huawei_wmi_input_notify(u32 value, void *=
context)
 =09kfree(response.pointer);
 }

-static int huawei_wmi_input_setup(struct device *dev,
-=09=09const char *guid,
-=09=09struct input_dev **idev)
+static int huawei_wmi_input_setup(struct device *dev, const char *guid)
 {
+=09struct input_dev *idev;
 =09acpi_status status;
 =09int err;

-=09*idev =3D devm_input_allocate_device(dev);
-=09if (!*idev)
+=09idev =3D devm_input_allocate_device(dev);
+=09if (!idev)
 =09=09return -ENOMEM;

-=09(*idev)->name =3D "Huawei WMI hotkeys";
-=09(*idev)->phys =3D "wmi/input0";
-=09(*idev)->id.bustype =3D BUS_HOST;
-=09(*idev)->dev.parent =3D dev;
+=09idev->name =3D "Huawei WMI hotkeys";
+=09idev->phys =3D "wmi/input0";
+=09idev->id.bustype =3D BUS_HOST;
+=09idev->dev.parent =3D dev;

-=09err =3D sparse_keymap_setup(*idev, huawei_wmi_keymap, NULL);
+=09err =3D sparse_keymap_setup(idev, huawei_wmi_keymap, NULL);
 =09if (err)
 =09=09return err;

-=09err =3D input_register_device(*idev);
+=09err =3D input_register_device(idev);
 =09if (err)
 =09=09return err;

-=09status =3D wmi_install_notify_handler(guid, huawei_wmi_input_notify, *i=
dev);
+=09status =3D wmi_install_notify_handler(guid, huawei_wmi_input_notify, id=
ev);
 =09if (ACPI_FAILURE(status))
 =09=09return -EIO;

@@ -809,17 +807,14 @@ static int huawei_wmi_probe(struct platform_device *p=
dev)
 =09huawei_wmi->dev =3D &pdev->dev;

 =09while (*guid->guid_string) {
-=09=09struct input_dev *idev =3D *huawei_wmi->idev;
-
 =09=09if (wmi_has_guid(guid->guid_string)) {
-=09=09=09err =3D huawei_wmi_input_setup(&pdev->dev, guid->guid_string, &id=
ev);
+=09=09=09err =3D huawei_wmi_input_setup(&pdev->dev, guid->guid_string);
 =09=09=09if (err) {
 =09=09=09=09dev_err(&pdev->dev, "Failed to setup input on %s\n", guid->gui=
d_string);
 =09=09=09=09return err;
 =09=09=09}
 =09=09}

-=09=09idev++;
 =09=09guid++;
 =09}

--
2.38.0


