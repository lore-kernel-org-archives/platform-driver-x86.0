Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8089FCCA482
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 21:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377865AbiFGVSm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 17:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380056AbiFGVPK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 17:15:10 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5AA1567D2
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 11:54:42 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso21655631pjl.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 11:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=+8BXCkxozc1D3KB/o9Tn0GIX5RMjNudehH6ltAOXBj8=;
        b=A8vhgdrFUETF0jOGdUx8xO/gqG4GyRPn3eAF7QO5LW6Xzbr7IBa9l/Deizr6gwH9Sz
         8Sd4FyzWyP53tUie9QVWeC8YRq19foSHZsv9EeYvzkCBGp0PCTqy2rbObiebmIzD0sM0
         ADaCHOtJjb9yTup5wRrLe+5oynIKUjKwUYOT6CGTTdfmhQNJunJlVWSASsUV1oph1r/K
         M2MU4kWwFcawVHasIWfo8Bmy+Jx0lqGmNCvlamF7aAsoHJfRQQ34nl/IdIbe4yu9IwtP
         htdScrBmSuXSB7BV0Ap57FI0+MpphEBWmXFN+caeaER15UQS4OfoU755LxIeoHhEVzfr
         oqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=+8BXCkxozc1D3KB/o9Tn0GIX5RMjNudehH6ltAOXBj8=;
        b=osXM2wznlW6uundiLXRd3F7DRbnn5bGf0zYsBnct2o+yfaoNQaKFzOqhVPghUFI5yS
         tgnFbNO1+VNyb0mnz5es6b2wIi+wFLBXKRJs2PYaj4QGKdqIXIvZQIQP0PGS1yrc2d27
         duKVSeD7IKZTEshVXMyDi+ycxa/QwOiCl3NCAu0i+u7OULgfpUcLLVO+PGnYElikZ3no
         2KyjtI2af2m9eW2gZGkZivy0/97GLYziNeMnhLiF6nfZ1zfNE3127vktkVHARsW9sXYq
         GHqrTDmj5eb0tFa6vbbwYLGPDhDmxWimFAp9EbCU9xt2pqcCse4Hst8h40UR2G9ozTYs
         rduA==
X-Gm-Message-State: AOAM531dj8l1DI//ucgK8HT/llu/8gZ/V63Z0hSHAbhVuBS9TjMztB5f
        upiNuG9XPaYnHOSOl7BFVY8=
X-Google-Smtp-Source: ABdhPJwVKQrX8DtLCs54K8PsV/qH0rBw1SZpS60z5Dd9hvgi0QkI/K6aDE0OXv54mxu+Bv1ULWyP2g==
X-Received: by 2002:a17:903:120a:b0:15f:99f:95bc with SMTP id l10-20020a170903120a00b0015f099f95bcmr30185255plh.48.1654628081831;
        Tue, 07 Jun 2022 11:54:41 -0700 (PDT)
Received: from ?IPv6:2405:201:a007:e183:aa6d:fbda:3c70:a6e9? ([2405:201:a007:e183:aa6d:fbda:3c70:a6e9])
        by smtp.gmail.com with ESMTPSA id n2-20020a170902968200b0015e8d4eb1easm12883166plp.52.2022.06.07.11.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:54:41 -0700 (PDT)
Message-ID: <582c8713faa85f97298fd0f7da9c9883b64dec04.camel@gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work
 with certain devices
From:   Bedant Patnaik <bedant.patnaik@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Wed, 08 Jun 2022 00:24:35 +0530
In-Reply-To: <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
         <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
         <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
         <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From 59c10c3007e52694318324fc5e9cfbce83533491 Mon Sep 17 00:00:00 2001
From: Bedant Patnaik <bedant.patnaik@gmail.com>
Date: Tue, 7 Jun 2022 23:30:57 +0530
Subject: [PATCH] Use zero insize parameter only when supported

be9d73e64957bbd31ee9a0d11adc0f720974c558 ("platform/x86: hp-wmi: Fix 0x05 e=
rror code reported by several WMI calls")
and 12b19f14a21a2ee6348825d95b642ef2cd16794f ("platform/x86: hp-wmi: Fix hp=
_wmi_read_int() reporting error (0x05)")
cause ACPI BIOS Error (bug): Attempt to CreateField of length zero (2021121=
7/dsopcode-133) because of the ACPI
method HWMC, which unconditionally creates a Field of size (insize*8) bits:
	CreateField (Arg1, 0x80, (Local5 * 0x08), DAIN)
In cases where args->insize =3D 0, the Field size is 0, resulting in an err=
or.
Fix: use zero insize only if 0x5 error code is returned

Tested on Omen 15 AMD (2020) board ID: 8786.

Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 7a54191f0..809294e36 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -38,6 +38,7 @@ MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
+#define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // use when z=
ero insize is required
=20
 /* DMI board names of devices that should use the omen specific path for
  * thermal profiles.
@@ -220,6 +221,7 @@ static struct input_dev *hp_wmi_input_dev;
 static struct platform_device *hp_wmi_platform_dev;
 static struct platform_profile_handler platform_profile_handler;
 static bool platform_profile_support;
+static bool zero_insize_support;
=20
 static struct rfkill *wifi_rfkill;
 static struct rfkill *bluetooth_rfkill;
@@ -374,7 +376,7 @@ static int hp_wmi_read_int(int query)
 	int val =3D 0, ret;
=20
 	ret =3D hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   0, sizeof(val));
+				   zero_if_sup(val), sizeof(val));
=20
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -410,7 +412,8 @@ static int hp_wmi_get_tablet_mode(void)
 		return -ENODEV;
=20
 	ret =3D hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
-				   system_device_mode, 0, sizeof(system_device_mode));
+				   system_device_mode, zero_if_sup(system_device_mode),
+				   sizeof(system_device_mode));
 	if (ret < 0)
 		return ret;
=20
@@ -497,7 +500,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val =3D 0, ret;
=20
 	ret =3D hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, 0, sizeof(val));
+				   &val, zero_if_sup(val), sizeof(val));
=20
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -509,7 +512,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state =3D 0;
 	int ret =3D hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
=20
@@ -520,7 +523,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret =3D hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state=
,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
=20
@@ -598,7 +601,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
=20
 	err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err;
=20
@@ -1007,7 +1010,7 @@ static int __init hp_wmi_rfkill2_setup(struct platfor=
m_device *device)
 	int err, i;
=20
 	err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
=20
@@ -1483,11 +1486,15 @@ static int __init hp_wmi_init(void)
 {
 	int event_capable =3D wmi_has_guid(HPWMI_EVENT_GUID);
 	int bios_capable =3D wmi_has_guid(HPWMI_BIOS_GUID);
-	int err;
+	int err, tmp =3D 0;
=20
 	if (!bios_capable && !event_capable)
 		return -ENODEV;
=20
+	if (hp_wmi_perform_query(HPWMI_HARDWARE_QUERY, HPWMI_READ, &tmp,
+				 sizeof(tmp), sizeof(tmp)) =3D=3D HPWMI_RET_INVALID_PARAMETERS)
+		zero_insize_support =3D true;
+
 	if (event_capable) {
 		err =3D hp_wmi_input_setup();
 		if (err)
--=20
2.36.1


