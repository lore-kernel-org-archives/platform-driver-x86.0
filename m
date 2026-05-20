Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1583B52E3
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 09:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270397; cv=none; b=uMungA7FOcAyC8Bx7F6jY7ngh0f71fjDhcpXDb6pgd1i6SxNXdT/y9175mS9G9K0X8xTuWYCPcUIM0GrVZ7dNm3aaM2fN8qxrTpMTRsP2w1jZ5sp8wJfw6qmBw+ZuxYyz6f+MplBQEvJxczCVUxW+mffz89MdfIEtPPeKihXXwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270397; c=relaxed/simple;
	bh=j93tF+Dj/iKPhHXipo+U5zezPPwiIW7tOe2qYkB5Sdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MMMY4TzNvzVFJaCsZsx4uh3iguZ53d+oyKxBuyFBEHfNoiLYodBOoK55NPfydh49IufdXzEYDYhq/P0YI56a3sOQo5pF/wNWsSX+zVO7bSlCZw3uJSCUswlIHSwHcfyYmOSu06iokMN19jP85sjIfxOCtmimUzYVaYkfSLSgT5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9IC/Imy; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9IC/Imy"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-835b78c3797so1932091b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779270396; x=1779875196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x4pS00mBjhASHapYYqo+Gxcx9vGS6CMek/DzHZ+ypjQ=;
        b=N9IC/Imy8gphSQKO8KoTaEDCuPyx5jWudU36Dot5sEyVAn1SlG0mJNnJQOT72xmCK+
         B0cxHNrnuLLM8/3p3VNkllTHsEwPgXh+6hDNM2DqMIdfkMOLWzo8Qien8lri13S3wpDv
         83IetxjHdoTH9t/cwm3WtaNXJow/JFXHFkogw6sNaA/KDsoyNJT4q7evx6R0Wnpgefub
         FU8zNkCX6Y8gVeQh5GxI5LcbeDYyeQ+yJEAneDi8JhtfT7J1U1hgRr9w7xblHIK55N6A
         M7ip543E/zcmbB0wPTMtgJGVNNs+jQ9ryZZMoxeXG2McDel+tdFO4m2nq8FG4OR4C7Nr
         Lmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779270396; x=1779875196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x4pS00mBjhASHapYYqo+Gxcx9vGS6CMek/DzHZ+ypjQ=;
        b=cEDCazsec+EnZN7DWOfgZgosOM6xoybI8wZGLWBf9PlPei+YZX4ncyOG1gPO8kFr6Z
         jYMq+AxcB/5Dn42yvUE1MmOiorBW8b73bmMBHdHRowUHXZlLWW74WLQW+PyScmqgPGkf
         UHNYCWuEXIQsG/0C8eWIqRPZl7sHYewFJP1o6/+xM3dxbQSpElbORTaCcxjY8CcGe0hm
         B9uQ7ofIiCAQNuSxV0Tomd1s3RS5BNLD/qSQZNJizOtPHRt7wbbPfl0sDiVDxp+tyLxr
         VunODY2xzhGYaXIKwHnfTu0/wumZLGW3MQ3gfPAD6U+QkhlqjhDJ3vzYjlEsmTFnzEnU
         n46A==
X-Forwarded-Encrypted: i=1; AFNElJ+Q2KAWYdSshdXb8Vr1A4U4c+jyZz6UERKOI3Qn3d6c1cvgkHgZclGJdApArrjCDxWLHiFOpdy7pa2lI6gLBRLKGzcF@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6YiCB5C06PiJGLw1Siu/9pU78GhlaXPJTLjMTdEGcmbShKV4l
	iWX2Rl0x/rhjuHZq5pirnV9n8vnmb5xIE2JuASnccxxR1IgC7C71y9+s
X-Gm-Gg: Acq92OHgXgtAQmjkXITVWyERMmTFLaU8Ork5drgfDFKcf/JchErjAplcrObCKbxuKwD
	NinzAmYJhxjmV6KNAA2KlaKRlU/Ov9SRjq1t0hIlxWKLtJH5afF4H26zFKkOwJsw6XUnYV2M/+d
	sMxQj6oSEIU3Koe+/inJ0+njKd5d/ayAnRHC7xpqSTlZPHLBe+s6tMwViBQrfQA85uBYVskKfVV
	n/I8fkzxUrT0psi/cQrBBkyp7o61ihv4OCqCBeHW5uIG0t2947HRgcgDUsgFR7+3nOFSJHdLaq7
	baYUMtANyZCa3ydpTrovn7ayQ3WwAXhYSdpKC4WqLSt8OfMJYIUCEZDn8BomKlBAAxYe3koJA4q
	xhIMAs+PkTyhKSPQkob+ofc4siVKNY7N7JtQmRZyFkldjH85KuZ5Y3shYUziCHA1FXRXl/XyzIC
	UJNjkEVodTu46s2oVUKcy6jTu6+kUVcDRthO3xnZVmKEUK12tg1TPzzwT/KoAot1zfU6GE/16Bh
	cyx63I0q+/7yQjYNiDY
X-Received: by 2002:a05:6a00:2998:b0:82c:d6d3:3190 with SMTP id d2e1a72fcca58-83f33d82298mr21413024b3a.38.1779270395736;
        Wed, 20 May 2026 02:46:35 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225f:36f2:f474:be1d:cad7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664712sm20981942b3a.12.2026.05.20.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:46:35 -0700 (PDT)
Date: Wed, 20 May 2026 15:16:30 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: foobisdweik <dweikmferris@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] platform/x86: hp-wmi: Add support for Omen 16-b1xxx
 (8A13)
Message-ID: <ag2BxXHu4XekQkBz@archlinux>
References: <20260513193916.84673-1-dweikmferris@gmail.com>
 <20260513193916.84673-2-dweikmferris@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260513193916.84673-2-dweikmferris@gmail.com>

On Wed, May 13, 2026 at 12:39:15PM -0700, foobisdweik wrote:
>Add board name 8A13 (OMEN by HP Laptop 16-b1xxx, 12th-gen Intel/RTX 30
>series) to the Omen thermal-profile, timed-thermal-profile, and Victus-S
>DMI lists.
>

The DMI lists are exclusively checked at every reference so adding to
Victus-S seems sufficient, as addition to omen thermal-profile and
timed-thermal-profile would not make a difference.

>The 8A13 firmware exposes the standard Omen "PerformanceControl" WMI
>feature, uses the legacy EC thermal-profile offset (0x95), and
>implements the Victus-S-style GM2D/GM2E WMI methods at EC offsets
>0xB0..0xB3 (RPM1..RPM4 tach) and 0x34..0x35 (SRP1/SRP2 setpoints).
>This makes it identical in interface to its same-era sibling 8A44
>(Omen 16-n0xxx), so reuse omen_v1_legacy_thermal_params.
>
>After this change /sys/firmware/acpi/platform_profile reports
>cool/balanced/performance and the hp hwmon device exposes per-fan
>tachs plus the manual-mode pwm control on Omen 16-b1xxx.
>
>Signed-off-by: foobisdweik <dweikmferris@gmail.com>
>---
> drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 24c151289dd3..389506a6d2e3 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -157,7 +157,7 @@ static const char * const omen_thermal_profile_boards[] = {
> 	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
> 	"88F7", "88FD", "88FE", "88FF",
> 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
>-	"8A15", "8A42",
>+	"8A13", "8A15", "8A42",
> 	"8BAD",
> 	"8C58",
> 	"8E41",
>@@ -177,7 +177,7 @@ static const char * const omen_thermal_profile_force_v0_boards[] = {
>  * "balanced" when reaching zero.
>  */
> static const char * const omen_timed_thermal_profile_boards[] = {
>-	"8A15", "8A42",
>+	"8A13", "8A15", "8A42",
> 	"8BAD",
> };
>
>@@ -189,6 +189,10 @@ static const char * const victus_thermal_profile_boards[] = {
>
> /* DMI Board names of Victus 16-r and Victus 16-s laptops */
> static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
>+	{
>+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A13") },
>+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
>+	},
> 	{
> 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
> 		.driver_data = (void *)&omen_v1_legacy_thermal_params,
>-- 
>2.54.0
>
