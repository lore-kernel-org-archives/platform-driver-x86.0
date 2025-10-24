Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017F31EEA5F
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 16:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323067; cv=none; b=hbbku+SduhiKVrca2ofzr1K6u/2zX71FZRFLXlbz/qsF1pjo5nK2K8BItPP6SOi02ky6ThcVvlDBtyibCa+rZt+keOQgjF3ZL9yONPbngndP/k127OjQ8dXZCWQXBwLG5dMyYxJvIJl+NDVU7Cq5GKlNv3SWAlRR+MLtZNlqVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323067; c=relaxed/simple;
	bh=XRGYbUL7AY9YEYlMneezEtpleJmprypsZPWsgq4Og8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nSx5pGgTGiINeoX+7/zyJOrt11BVWMy6gFKkjCHIdzojlcoqJoOlGeBtCBhyYAcMWcg6dKI7DP8HSi+FmYdJaNWPm4lIQlu+G28G9daVF1Dd58RGw9XGwZ3RBJhmKtLr47e9OprrCdc1Hr0GxMt67x9wE16BkUCwk87aPTfjeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=anw+H5ul; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="anw+H5ul"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 8B69F46200
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:24:24 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id C99CB4637A
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:24:23 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 305FB1FFC11
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 19:24:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761323063;
	bh=oQdGwlfEvbtCsB8/gEbcoDWrOnl5p/sble/6szBPxSw=;
	h=Received:From:Subject:To;
	b=anw+H5ulRvwCsw4jK9a50J2eCNz4zjFiHkR+96fizD0E/6FnpUJb+b4huSOboD7Lc
	 T2U1mg6cT4qoxAGqdhAAX1rA9FylnRqKxAJRSUwTM5241BoudiVDnsX14wTeeUbdP7
	 wNAKGmq2qa8Undh1383qB9xl2W2I+BEPc8GggudFCuXebNoHeBRjcZ/bvKQbeW3JuN
	 5tug3Rar8hxrEQwOlcjIkGIolQ5VryErtHQFY+T9zl5HpOJDolk9we50oOeoqCDkwF
	 t5quqkloTt/Bgsit5aBfA3Aw1oYiTleevgbT79f3nwLJz2HC8RrzBQpUGyfArsNA+A
	 IIqekiKxfaYEw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-378d710caedso26230901fa.3
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 24 Oct 2025 09:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXdJ9PmzbzeLC6GjSP5SIhL89o1sUfWaZayzFMzcTheJ4ImQo0tQqdvPw4TQ9emPZ8mefebvPIo7StH3xxmHEO6MtKU@vger.kernel.org
X-Gm-Message-State: AOJu0YwFfvbdkvZltVjgDSdN7XSIl54vTmws4SU+gmxzdDKRnQ7CO7+C
	juBV7MdfBdJ8OIsfo/iFmNzG2/9HS/uUtJ6CspZ0NCCluj4v/gVHCwvJMl2JlOUOoT5uFAyh/jP
	OxSNvCjOGGSVQXa7aVXUVzofqepAaytg=
X-Google-Smtp-Source: 
 AGHT+IH5FOSurMzNSYAPrkNE9P+crWNlqQYYEhIXZVibnYOAmJfgnkVPquyinjMDDrWg5WSrf+OeT57Af1RwtKlUvyw=
X-Received: by 2002:a2e:a906:0:b0:337:e190:6814 with SMTP id
 38308e7fff4ca-378e43595b5mr9138621fa.20.1761323062708; Fri, 24 Oct 2025
 09:24:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
 <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
In-Reply-To: <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 18:24:11 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
X-Gm-Features: AWmQ_blfIZoPfA-q7agy553x9fEuFss57l-a8Lv0j387NBYXYo5gCy0b2IiG7tc
Message-ID: 
 <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176132306340.2578075.12692105276892883712@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 24 Oct 2025 at 18:20, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:54 AM, Mario Limonciello wrote:
> >
> >
> > On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >> From: Alex Deucher <alexander.deucher@amd.com>
> >>
> >> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
> >> skip powering it down and skip part of post-init.
> >>
> >> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification
> >> on Vangogh")
> >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >>   3 files changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/
> >> drm/amd/amdgpu/amdgpu_device.c
> >> index 3d032c4e2dce..220b12d59795 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device
> >> *dev, bool notify_clients)
> >>       if (amdgpu_sriov_vf(adev))
> >>           amdgpu_virt_release_full_gpu(adev, false);
> >> -    r = amdgpu_dpm_notify_rlc_state(adev, false);
> >> -    if (r)
> >> -        return r;
> >> +    if (!adev->in_s0ix) {
> >> +        r = amdgpu_dpm_notify_rlc_state(adev, false);
> >> +        if (r)
> >> +            return r;
> >> +    }
> >
> > Just FYI this is going to clash with my unwind failed suspend series [1].
> >
> > This is fine, just whichever "lands" first the other will need to rework
> > a little bit and I wanted to mention it.
> >
> > Link: https://lore.kernel.org/amd-gfx/20251023165243.317153-2-
> > mario.limonciello@amd.com/ [1]
> >
> > This does have me wondering though why amdgpu_dpm_notify_rlc_state() is
> > even in amdgpu_device_suspend()?  This is only used on Van Gogh.
> > Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
> >
> > Or should we maybe overhaul this to move the RLC notification into
> > a .set_mp1_state callback instead so it's more similar to all the other
> > ASICs?
> >
>
> My proposal as such is here:
>
> https://lore.kernel.org/amd-gfx/20251024161216.345691-1-mario.limonciello@amd.com/
>
> It would need some testing though to make sure it didn't break Steam
> Deck or Steam Deck OLED.

I will give it a quick go on my OLED.


> >>       return 0;
> >>   }
> >> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/
> >> drm/amd/pm/swsmu/amdgpu_smu.c
> >> index fb8086859857..244b8c364d45 100644
> >> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context
> >> *smu)
> >>           smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
> >>           return 0;
> >> +    /* vangogh s0ix */
> >> +    if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
> >> +         amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5,
> >> 2)) &&
> >> +        adev->in_s0ix)
> >> +        return 0;
> >> +
> >
> > How about for GPU reset, does PMFW handle this too?
> >
> >>       /*
> >>        * For gpu reset, runpm and hibernation through BACO,
> >>        * BACO feature has to be kept enabled.
> >> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/
> >> drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> index 2c9869feba61..0708d0f0938b 100644
> >> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct
> >> smu_context *smu)
> >>       uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
> >>           adev->gfx.config.max_sh_per_se * adev-
> >> >gfx.config.max_shader_engines;
> >> +    if (adev->in_s0ix)
> >> +        return 0;
> >> +
> >>       /* allow message will be sent after enable message on Vangogh*/
> >>       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
> >>               (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
> >
>
>

