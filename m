Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7841F219FC
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Mar 2026 22:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772923556; cv=none; b=Ku6aR6FfsNjl01S62ExcGvXumzBC3wGAOCWlJC7ZnSA6DFDUjU/Al/ILYYpnIHHx7N/szKm4a9VBqINCyEGG4f7KEcLV3xzNGebNKKdT5hcvPVhHolGzXv2ktpchPdybNPuq/yyf16IlLFoN3lswTTnXMg5GX2cleCAyjriCkA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772923556; c=relaxed/simple;
	bh=LUyFNjnFTngxhIzwsomfc835fSbmCqACRIFcoIAKJQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JXJam8txQ+xHzTRuG7z0tvrzA+DcsvxXnoXx3ksJ+2t7cGrZ2eFmI/wCIhujmG0gYvn0e4bKA7Q+wKo/jMHEq8/KL5S7PdlE/WkyxFq7G80YTWkdjvKXN2UWypbTpyLFvoDRc63n1pDeXTgGPZ5W49SIcTq+V0KF+5CfOkOznA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RPdNjUgq; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RPdNjUgq"
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id DC2DE3ED83
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:45:53 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 1FE6D3EC9B
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:45:53 +0200 (EET)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 20410200D04
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 00:45:52 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772923552;
	bh=lBQLWpNlwgMS42N32xhjaYY5T0RfItuETW3zJfECZVA=;
	h=Received:From:Subject:To;
	b=RPdNjUgq9ldYwKvMzP+o76LlXVY/cljUh4iKRiRKxu4XL2YRM5dI3fIoGWFs28gLl
	 /2oSX6hCgAALOrrv7y1qXJw5l53DWi9esBSscqQz3EX+pvzQmh/LLAhVgItVMBT1FO
	 keKfewUUuqwvRJ/sTgdnsSK11TO2o4UWqjwvs9XBmzL4eRB3NDj+riOtX1/NE6nk+l
	 smoD5CNSLmNwPWQz9DhQKZVjLCuz+FSZTY1n2xQjTCAGGGcCbeyxcps06eiwrdgQuB
	 chGn8+4H54kSIBMsBECkVyEKKyoB5v4d2v5hY/JdVPFPibfdXL67wfO19tuGBtVd2K
	 nIW7Kf4JU7/JQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-354bc7c2c46so6141228a91.0
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 07 Mar 2026 14:45:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVa9Fcv81xVcit1JeJCi2DBKuEIJbmTTiqVFATjGxT/VHMKqQf1tGDNBmUJKvSKJ5N9yWtBw1j09FGlv5px2FLACk2b@vger.kernel.org
X-Gm-Message-State: AOJu0Yygy7ofQjbw45DqJamvV3YXSPzyd28vmWKL5OBo/WmuPPOhuP08
	fsZRP8MEYII62/Xi5cJGlnWrRSTWSL7whdxlsFwb6QqUds4vSQy0iSEJeUpSx6pLeDSUSpePSJH
	HxT8EVHA20MLIV1HX30BVHe8RXk3+Umc=
X-Received: by 2002:a05:6a20:938b:b0:398:4c68:bf62 with SMTP id
 adf61e73a8af0-39858fb24b2mr6195760637.1.1772923550751; Sat, 07 Mar 2026
 14:45:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307115516.26892-1-lkml@antheas.dev>
 <20260307115516.26892-4-lkml@antheas.dev>
 <f416507304bb4c7c179109ff10bc97a2daeb7e87.camel@rong.moe>
In-Reply-To: <f416507304bb4c7c179109ff10bc97a2daeb7e87.camel@rong.moe>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 7 Mar 2026 23:45:38 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwH9+rcdqgTufBXBX+ocB9uYU==X5OciQijuFAVmX19YMw@mail.gmail.com>
X-Gm-Features: AaiRm51ZDdfam13cf8C_PJBhrGVcwh5mLWelKi5zjCHmGEbBvS6VRdIgPcC8P3E
Message-ID: 
 <CAGwozwH9+rcdqgTufBXBX+ocB9uYU==X5OciQijuFAVmX19YMw@mail.gmail.com>
Subject: Re: [RFC v3 3/4] platform/x86/amd: dptc: Add platform profile support
To: Rong Zhang <i@rong.moe>
Cc: Mario.Limonciello@amd.com, W_Armin@gmx.de, sashal@kernel.org,
	Shyam-Sundar.S-k@amd.com, derekjohn.clark@gmail.com, denis.benato@linux.dev,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177292355256.3550418.9651065189881921205@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 7 Mar 2026 at 22:57, Rong Zhang <i@rong.moe> wrote:
>
> Hi Antheas,
>
> On Sat, 2026-03-07 at 12:55 +0100, Antheas Kapenekakis wrote:
> > Register a platform_profile handler so the driver exposes standard
> > power profiles (low-power, balanced, performance, max-power) alongside
> > the manual tunable interface. max-power is only supplied when the
> > performance profile's preset values are below the tunable limits.
> >
> > When a non-custom profile is active, parameter writes are blocked
> > (-EPERM) and current_value reflects the profile's preset values.
> > Selecting the "custom" profile returns control to the user for manual
> > staging and committing. On resume, the active profile is automatically
> > re-applied.
> >
> > Assisted-by: Claude:claude-opus-4-6
> > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> > ---
> >  drivers/platform/x86/amd/Kconfig |   1 +
> >  drivers/platform/x86/amd/dptc.c  | 116 +++++++++++++++++++++++++++++--
> >  2 files changed, 113 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> > index d610092467fc..41ffbd722524 100644
> > --- a/drivers/platform/x86/amd/Kconfig
> > +++ b/drivers/platform/x86/amd/Kconfig
> > @@ -48,6 +48,7 @@ config AMD_ISP_PLATFORM
> >  config AMD_DPTC
> >       tristate "AMD Dynamic Power and Thermal Configuration Interface (DPTCi)"
> >       depends on X86_64 && ACPI && DMI
> > +     select ACPI_PLATFORM_PROFILE
> >       select FIRMWARE_ATTRIBUTES_CLASS
> >       help
> >         Driver for AMD AGESA ALIB Function 0x0C, the Dynamic Power and
> > diff --git a/drivers/platform/x86/amd/dptc.c b/drivers/platform/x86/amd/dptc.c
> > index acfe9cc01bab..1f07e2e6f278 100644
> > --- a/drivers/platform/x86/amd/dptc.c
> > +++ b/drivers/platform/x86/amd/dptc.c
> > @@ -23,6 +23,7 @@
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/platform_profile.h>
> >  #include <linux/processor.h>
> >  #include <linux/sysfs.h>
> >  #include <linux/unaligned.h>
> > @@ -56,8 +57,13 @@ struct dptc_param_limits {
> >       u32 expanded_max;
> >  };
> >
> > +struct dptc_profile {
> > +     u32 vals[DPTC_NUM_PARAMS];      /* 0 = don't set / unstage this param */
> > +};
> > +
> >  struct dptc_device_limits {
> >       struct dptc_param_limits params[DPTC_NUM_PARAMS];
> > +     struct dptc_profile profiles[PLATFORM_PROFILE_LAST];
> >  };
> >
> >  struct dptc_param_desc {
> > @@ -85,6 +91,10 @@ static const struct dptc_device_limits limits_maxhh = { .params = {
> >       [DPTC_PPT_PL2_SPPT] = {  0,  4, 27,  82, 100 },
> >       [DPTC_PPT_PL3_FPPT] = {  0,  4, 40,  85, 100 },
> >       [DPTC_CPU_TEMP]     = { 60, 70, 95,  95, 100 },
> > +}, .profiles = {
> > +     [PLATFORM_PROFILE_LOW_POWER]   = { .vals = { 15, 15, 25, 0 } },
> > +     [PLATFORM_PROFILE_BALANCED]    = { .vals = { 25, 27, 40, 0 } },
> > +     [PLATFORM_PROFILE_PERFORMANCE] = { .vals = { 60, 63, 85, 0 } },
> >  }};
> >
> >  /* Substring matches against boot_cpu_data.x86_model_id; order matters. */
> > @@ -134,6 +144,9 @@ struct dptc_priv {
> >
> >       bool expanded;
> >
> > +     enum platform_profile_option profile;
> > +     struct device *ppdev;
> > +
> >       enum dptc_save_mode { SAVE_SINGLE, SAVE_BULK } save_mode;
> >
> >       u32 staged[DPTC_NUM_PARAMS];
> > @@ -269,6 +282,14 @@ static ssize_t dptc_current_value_show(struct kobject *kobj,
> >
> >       guard(mutex)(&dptc->lock);
> >
> > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> > +             u32 val = dptc->dev_limits->profiles[dptc->profile].vals[ps->idx];
> > +
> > +             if (!val)
> > +                     return sysfs_emit(buf, "\n");
> > +             return sysfs_emit(buf, "%u\n", val);
> > +     }
> > +
> >       if (!dptc->has_staged[ps->idx])
> >               return sysfs_emit(buf, "\n");
> >       return sysfs_emit(buf, "%u\n", dptc->staged[ps->idx]);
> > @@ -287,6 +308,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
> >       if (count == 1 && buf[0] == '\n') {
> >               guard(mutex)(&dptc->lock);
> >
> > +             if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > +                     return -EPERM;
>
> It has nothing to do with permissions. I'd prefer -EBUSY.

I will defer to other drivers and update if necessary based on their choices.

> To maintain readability, usually a blank line should be added after
> returning early.
>
> >               dptc->has_staged[ps->idx] = false;
> >               return count;
> >       }
> > @@ -297,6 +320,8 @@ static ssize_t dptc_current_value_store(struct kobject *kobj,
> >
> >       guard(mutex)(&dptc->lock);
> >
> > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > +             return -EPERM;
> >       min = dptc_get_min(dptc, ps->idx);
> >       max = dptc_get_max(dptc, ps->idx);
> >       if (val < min || (max && val > max))
> > @@ -426,6 +451,8 @@ static ssize_t dptc_expanded_current_value_store(struct kobject *kobj,
> >
> >       guard(mutex)(&dptc->lock);
> >
> > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM)
> > +             return -EPERM;
>
> IMO kstrtou32() isn't really a blocker of acquiring the mutex earlier
> to prevent duplicating the same check. After all, firmware-attributes
> is not a performance critical interface, and dptc_save_settings_store()
> also calls sysfs_eq() with the mutex held.
>
> >       dptc->expanded = val;
> >       /* Clear staged values: limits changed, old values may be out of range */
> >       memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> > @@ -594,6 +621,78 @@ static void dptc_kset_unregister(void *data)
> >       kset_unregister(data);
> >  }
> >
> > +/* Platform profile */
> > +
> > +static void dptc_apply_profile(struct dptc_priv *dptc,
> > +                            enum platform_profile_option profile)
> > +{
> > +     const struct dptc_profile *pp;
> > +     int i;
> > +
> > +     memset(dptc->has_staged, 0, sizeof(dptc->has_staged));
> > +
> > +     if (profile == PLATFORM_PROFILE_CUSTOM)
> > +             return;
> > +
> > +     pp = &dptc->dev_limits->profiles[profile];
> > +     for (i = 0; i < DPTC_NUM_PARAMS; i++) {
> > +             if (!pp->vals[i])
> > +                     continue;
> > +             dptc->staged[i] = pp->vals[i];
> > +             dptc->has_staged[i] = true;
> > +     }
> > +}
> > +
> > +static int dptc_pp_probe(void *drvdata, unsigned long *choices)
> > +{
> > +     struct dptc_priv *dptc = drvdata;
> > +     int i, j;
> > +
> > +     set_bit(PLATFORM_PROFILE_CUSTOM, choices);
> > +     for (i = 0; i < PLATFORM_PROFILE_LAST; i++) {
> > +             for (j = 0; j < DPTC_NUM_PARAMS; j++) {
> > +                     if (dptc->dev_limits->profiles[i].vals[j]) {
> > +                             set_bit(i, choices);
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int dptc_pp_get(struct device *dev,
> > +                    enum platform_profile_option *profile)
> > +{
> > +     struct dptc_priv *dptc = dev_get_drvdata(dev);
> > +
> > +     guard(mutex)(&dptc->lock);
> > +
> > +     *profile = dptc->profile;
> > +     return 0;
> > +}
> > +
> > +static int dptc_pp_set(struct device *dev,
> > +                    enum platform_profile_option profile)
> > +{
> > +     struct dptc_priv *dptc = dev_get_drvdata(dev);
> > +     int ret = 0;
> > +
> > +     guard(mutex)(&dptc->lock);
> > +
> > +     dptc->profile = profile;
> > +     dptc_apply_profile(dptc, profile);
> > +     if (profile != PLATFORM_PROFILE_CUSTOM)
> > +             ret = dptc_alib_save(dptc);
>
> I'd prefer simply calling dptc_alib_save() in dptc_apply_profile()
> since the latter already checks the profile.

This way you will propagate an error because custom unstages all values.

Antheas

> > +
> > +     return ret;
> > +}
> > +
> > +static const struct platform_profile_ops dptc_pp_ops = {
> > +     .probe       = dptc_pp_probe,
> > +     .profile_get = dptc_pp_get,
> > +     .profile_set = dptc_pp_set,
> > +};
> > +
> >  static int dptc_resume(struct device *dev)
> >  {
> >       struct dptc_priv *dptc = dev_get_drvdata(dev);
> > @@ -601,10 +700,14 @@ static int dptc_resume(struct device *dev)
> >
> >       guard(mutex)(&dptc->lock);
> >
> > -     if (dptc->save_mode == SAVE_SINGLE)
> > +     if (dptc->profile != PLATFORM_PROFILE_CUSTOM) {
> > +             dptc_apply_profile(dptc, dptc->profile);
> >               ret = dptc_alib_save(dptc);
> > -     else
> > +     } else if (dptc->save_mode == SAVE_SINGLE) {
> > +             ret = dptc_alib_save(dptc);
> > +     } else {
> >               ret = 0;
> > +     }
> >
> >       if (ret)
> >               dev_warn(dev, "failed to restore settings on resume: %d\n", ret);
> > @@ -636,8 +739,7 @@ static int dptc_probe(struct platform_device *pdev)
> >                boot_cpu_data.x86_model_id);
> >
> >       dptc->fw_attr_dev = device_create(&firmware_attributes_class,
> > -                                       NULL, MKDEV(0, 0), NULL,
> > -                                       DRIVER_NAME);
> > +                                       NULL, MKDEV(0, 0), NULL, DRIVER_NAME);
>
> Squash the change into the previous patch.
>
> Thanks,
> Rong
>
> >       if (IS_ERR(dptc->fw_attr_dev))
> >               return PTR_ERR(dptc->fw_attr_dev);
> >
> > @@ -680,6 +782,12 @@ static int dptc_probe(struct platform_device *pdev)
> >       if (ret)
> >               return ret;
> >
> > +     dptc->profile = PLATFORM_PROFILE_CUSTOM;
> > +     dptc->ppdev = devm_platform_profile_register(dev, "amd-dptc", dptc,
> > +                                                  &dptc_pp_ops);
> > +     if (IS_ERR(dptc->ppdev))
> > +             return PTR_ERR(dptc->ppdev);
> > +
> >       return 0;
> >  }
> >
>

