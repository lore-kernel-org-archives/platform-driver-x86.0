Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADC2CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 21:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379312AbiFGVLz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 17:11:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380108AbiFGVLa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 17:11:30 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 579892178A3
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 11:53:14 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id bo5so16291313pfb.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 11:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=8GDJ304MDnpM/Ky3IDV1uo99afYb4ire+JK9NbMGhmE=;
        b=GzltJXg+35iyjEOZ+9g+aSn2M3WLCdjkEcrgF5jnnWptQkGIVrSZN2pBcO2cPfGL/1
         SAf/ZAsBfjbiDeenOS0TVBAejPCatiok8rnb6VMGyEcSFV68e8pY+5llmT1RPMOyQK4s
         FMYguWG059BzrLJWq/GI0yUKb7/2qcQ48RrlFu6lBFYVE26OIVMN29oA7XHc9I0ClLAN
         EvbkPsshVsPh7NPDECIaL1HEJRetSIoZsQeRtpppQTJ6/8hQNK5x9e8CsBbmBmzyHIm/
         ireEAjHU/YV+w0A5dgyxcgeW5lWBiXi0Qe3oTIH3qmpP+10YVY42r+r1j6ecyywm7tBS
         Zk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=8GDJ304MDnpM/Ky3IDV1uo99afYb4ire+JK9NbMGhmE=;
        b=0AfypCPmhw2PfOgw4+D1j3xRpBwBtHPjmLZGvdeUnHJ14Ln+m6R1Cc56XAJy3p0wr5
         TtQwRfkwN9XZUCxu+q8dDWzXIMpwMvlBQe2IDmAYj08PLoEaK8ar638KI3+C/9poOhiq
         8MJP5xRB4K/lQkvCMx1dk439+BBgVyjt+KNpqy63qm7vbxejWwATegYpXVAj1nWJgbhR
         mEn2vONyr0MKZ9zaKsyS0iIUvMEZFL+XhKVH25sf3WSTIDx6qDkQvcPvLZ8DRXCxtFg9
         nImFnkOA97aD/bLnPMQ/THK+jrX/dcpp3IpLw7gXIqIy5tcPtr4Sq26nYjMhTnc8bUxP
         zMbw==
X-Gm-Message-State: AOAM530PcohbrKsHCj+O5/GMzrTd7DlVZsL0dyZ+xnRrwt6aa4O98YzS
        Hrhb4TQhbfobrN8zbzdRTfRGxCpEKR+zZ4x/fs4=
X-Google-Smtp-Source: ABdhPJz0C90P2MnAHNhM2pUoYGd/5SDZoai9KC4TsHe8GskslU05iBm5isn9NHEXUEEg6Bis3jPmjg==
X-Received: by 2002:a63:e903:0:b0:3fd:ac2a:5123 with SMTP id i3-20020a63e903000000b003fdac2a5123mr11385461pgh.297.1654627993542;
        Tue, 07 Jun 2022 11:53:13 -0700 (PDT)
Received: from ?IPv6:2405:201:a007:e183:aa6d:fbda:3c70:a6e9? ([2405:201:a007:e183:aa6d:fbda:3c70:a6e9])
        by smtp.gmail.com with ESMTPSA id u19-20020a170903305300b001622c377c3esm12815171pla.117.2022.06.07.11.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 11:53:13 -0700 (PDT)
Message-ID: <34dc40b7c51ee62825e4e063b77e40c0c842f2d5.camel@gmail.com>
Subject: Re: [RFC] platform/x86: hp-wmi: make hp_wmi_perform_query() work
 with certain devices
From:   Bedant Patnaik <bedant.patnaik@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Date:   Wed, 08 Jun 2022 00:22:42 +0530
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

From: Bedant Patnaik <bedant.patnaik@gmail.com>
Date: Tue, 7 Jun 2022 23:16:05 +0530
Subject: [PATCH] platform/x86: hp-wmi: make hp_wmi_perform_query() work wit=
h
 certain devices

4b4967cbd2685f313411e6facf915fb2ae01d796 ("platform/x86: hp-wmi: Changing b=
ios_args.data to be dynamically allocated")
broke WMI queries on some devices where the ACPI method HWMC unconditionall=
y attempts to create Fields beyond the buffer
if the buffer is too small:
        CreateByteField (Arg1, 0x10, D008)
        CreateByteField (Arg1, 0x11, D009)
        CreateByteField (Arg1, 0x12, D010)
        CreateDWordField (Arg1, 0x10, D032)
        CreateField (Arg1, 0x80, 0x0400, D128)
In cases where args->data had zero length, ACPI BIOS Error (bug): AE_AML_BU=
FFER_LIMIT, Field [D008] at bit
offset/length 128/8 exceeds size of target Buffer (128 bits) (20211217/dsop=
code-198) was obtained.
Fix: allocate at least 128 bytes for args->data

Tested on Omen 15 AMD (2020) board ID: 8786.

Signed-off-by: Bedant Patnaik <bedant.patnaik@gmail.com>
---
 drivers/platform/x86/hp-wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 667f94bba..7a54191f0 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -175,7 +175,7 @@ enum hp_thermal_profile_omen_v1 {
 enum hp_thermal_profile {
 	HP_THERMAL_PROFILE_PERFORMANCE	=3D 0x00,
 	HP_THERMAL_PROFILE_DEFAULT		=3D 0x01,
-	HP_THERMAL_PROFILE_COOL			=3D 0x02
+	HP_THERMAL_PROFILE_COOL			=3D 0x02,
 };
=20
 #define IS_HWBLOCKED(x) ((x & HPWMI_POWER_FW_OR_HW) !=3D HPWMI_POWER_FW_OR=
_HW)
@@ -297,8 +297,8 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_=
command command,
 	if (WARN_ON(mid < 0))
 		return mid;
=20
-	bios_args_size =3D struct_size(args, data, insize);
-	args =3D kmalloc(bios_args_size, GFP_KERNEL);
+	bios_args_size =3D max(struct_size(args, data, insize), struct_size(args,=
 data, 128));
+	args =3D kzalloc(bios_args_size, GFP_KERNEL);
 	if (!args)
 		return -ENOMEM;
=20
--=20
2.36.1


