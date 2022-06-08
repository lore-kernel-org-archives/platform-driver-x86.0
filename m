Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD90C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  8 Jun 2022 19:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235518AbiFHT3b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 8 Jun 2022 15:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235538AbiFHT3a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 15:29:30 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4831A1E7177
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 12:29:28 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id i1so18485543plg.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 12:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=vOiykyjhVZ0bFDydIBhEt0zFQ2eqCHOkzSgfnCfhtZE=;
        b=hrNlFPPFIrYPt19G2M/wnNDb+GJsrGrTwZfoBaR5E1AXllPY1T8SLcPlss72d+WlNd
         PRlgs63rQn1FwbnuCq2jQu0Is/3Kspb2EcYxFLTsZWrq9x/ehcXbkuR+8cz1BBuVugNU
         2nT6fRKeKBHT0FQyHk1lrdNvWM/Y5FTVqhbf1oS8F9HBJucLxq3VQYTtCkW489Q0yM0c
         8A6UO0pXcG6voElDuuWjajnmnkGa5wFL1xNS4Ipr1cynxoh+rfijxcQZjg0RZPtSUWBt
         nJAS2Owo1bEXCON6QB2nqnGuCW5gtu4ztk04bSacJn80c5xixH05aa3O8PbsQKjxkDQP
         rKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=vOiykyjhVZ0bFDydIBhEt0zFQ2eqCHOkzSgfnCfhtZE=;
        b=H913Xs3Goco3NuZlvvoDPsgYPjeGB+26g+L8lr1JQJjjUivMhiQA7MpXvGlbUz/14C
         lQSCfiAQoMlqN9V+fgJ8dPEtJhRdH0dvcT+dxaRrY7T1Zm/4HysO9mXK36/5xRc1oHO1
         sM4wZG/7pddvvYa5mei/VLsfP5i6eJnKj5U6SsJErlHm4T5rIVFmzKtP9PbkctyOnLFF
         xNIQuGIYgdtNCNhp4cxWmBwEa+xHlxn1ci+EcFVoMkakaX33muAJx9a8g+t7oyuDwFZL
         MbdsqYWnU0ltzG4wtG//iSeYPst0i65jo9ofxlfA9i4e2wWeTapYeZA0NCDTgw34wPKP
         xqOQ==
X-Gm-Message-State: AOAM532IaOwWoc6zpFAS0WyFXnnM1LPqNjNykkDwBGwubY2Ds2vZ5gMg
        jIBlmdNV/vR2m6I4lFCchD0=
X-Google-Smtp-Source: ABdhPJy6HflBFqDaobYFnbumEu4DGN/JrW9bOP4SocHM7Xn4vsdcVBFCu0165UtxVPkBe+oGmnFn8Q==
X-Received: by 2002:a17:902:bd8e:b0:167:6f86:7862 with SMTP id q14-20020a170902bd8e00b001676f867862mr20501800pls.15.1654716567511;
        Wed, 08 Jun 2022 12:29:27 -0700 (PDT)
Received: from ?IPv6:2405:201:a007:e183:aa6d:fbda:3c70:a6e9? ([2405:201:a007:e183:aa6d:fbda:3c70:a6e9])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902f39500b0015e8d4eb1d7sm14957631ple.33.2022.06.08.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 12:29:27 -0700 (PDT)
Message-ID: <41be46743d21c78741232a47bbb5f1cdbcc3d21e.camel@gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work
 with certain devices
From:   Bedant Patnaik <bedant.patnaik@gmail.com>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Thu, 09 Jun 2022 00:58:43 +0530
In-Reply-To: <CAOOmCE8LO5ns8pf4fhXWrDiBwYUHsvEtmqcSfEiw5nsKYKhSNw@mail.gmail.com>
References: <20220607132428.7221-1-bedant.patnaik@gmail.com>
         <094f73b7-f618-aa12-762b-3b1a1f4556d2@redhat.com>
         <CAOOmCE8QYEwh6TrgA=_sTcm4spkuk3rjMS4g78nbBbWXWUB2aQ@mail.gmail.com>
         <fd1b71fe-d9a7-65bb-314c-f11b7d550fe8@redhat.com>
         <CAOOmCE-NN6cQ-hcG5Tyd8P8AjounN5aVZTD=AouX-isWNqe4dA@mail.gmail.com>
         <ca2bb15600cd7d101153eb4ee4a62ef5d8f0df72.camel@gmail.com>
         <CAOOmCE8LO5ns8pf4fhXWrDiBwYUHsvEtmqcSfEiw5nsKYKhSNw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From 26f84d835819fa38872c673f49f1b77774927568 Mon Sep 17 00:00:00 2001
From: Bedant Patnaik <bedant.patnaik@gmail.com>
Date: Thu, 9 Jun 2022 00:50:53 +0530
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
index 277397de5..0e07581b8 100644
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
@@ -376,7 +378,7 @@ static int hp_wmi_read_int(int query)
 	int val =3D 0, ret;
=20
 	ret =3D hp_wmi_perform_query(query, HPWMI_READ, &val,
-				   0, sizeof(val));
+				   zero_if_sup(val), sizeof(val));
=20
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -412,7 +414,8 @@ static int hp_wmi_get_tablet_mode(void)
 		return -ENODEV;
=20
 	ret =3D hp_wmi_perform_query(HPWMI_SYSTEM_DEVICE_MODE, HPWMI_READ,
-				   system_device_mode, 0, sizeof(system_device_mode));
+				   system_device_mode, zero_if_sup(system_device_mode),
+				   sizeof(system_device_mode));
 	if (ret < 0)
 		return ret;
=20
@@ -499,7 +502,7 @@ static int hp_wmi_fan_speed_max_get(void)
 	int val =3D 0, ret;
=20
 	ret =3D hp_wmi_perform_query(HPWMI_FAN_SPEED_MAX_GET_QUERY, HPWMI_GM,
-				   &val, 0, sizeof(val));
+				   &val, zero_if_sup(val), sizeof(val));
=20
 	if (ret)
 		return ret < 0 ? ret : -EINVAL;
@@ -511,7 +514,7 @@ static int __init hp_wmi_bios_2008_later(void)
 {
 	int state =3D 0;
 	int ret =3D hp_wmi_perform_query(HPWMI_FEATURE_QUERY, HPWMI_READ, &state,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
=20
@@ -522,7 +525,7 @@ static int __init hp_wmi_bios_2009_later(void)
 {
 	u8 state[128];
 	int ret =3D hp_wmi_perform_query(HPWMI_FEATURE2_QUERY, HPWMI_READ, &state=
,
-				       0, sizeof(state));
+				       zero_if_sup(state), sizeof(state));
 	if (!ret)
 		return 1;
=20
@@ -600,7 +603,7 @@ static int hp_wmi_rfkill2_refresh(void)
 	int err, i;
=20
 	err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err;
=20
@@ -1009,7 +1012,7 @@ static int __init hp_wmi_rfkill2_setup(struct platfor=
m_device *device)
 	int err, i;
=20
 	err =3D hp_wmi_perform_query(HPWMI_WIRELESS2_QUERY, HPWMI_READ, &state,
-				   0, sizeof(state));
+				   zero_if_sup(state), sizeof(state));
 	if (err)
 		return err < 0 ? err : -EINVAL;
=20
@@ -1485,11 +1488,15 @@ static int __init hp_wmi_init(void)
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


