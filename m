Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509B13090C6
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 15:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782229977; cv=none; b=GELEC5Ct0jGF9Exxj5IjaV6jFfVJ0WraA07Nv/QflmWM0LT/IQR6ZMog1tMUhjzTZweTGNqCLA+eBeQTtr+QVpY7RbRvqpKBMfvtKKbU8s8gp3RbRtJK50K0xK5ccyERsDVw+4BHHkaQEQ/O5dkEbpnAXBc0qw+hu+CSly6Bz5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782229977; c=relaxed/simple;
	bh=WQDow0WLVA3ZnjHUzwfTbEElyS6EUFHR4+V0+8XTdPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOH93/CXZvA/ZkRs25HcalCsgrtgE7WzcsCC4Jg4tthq8cWGvPmIRlHeSmRALGOSicgAavmLkfM/Wt5cXwbRbYKxE/uS6/+huQKIhEOglI+BVUK4RACCRslu6ogZIPasSRbVqz852XeKwWESeCqEX3NQB78yJ9VKzbq8KPvhSqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJ8/kUya; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJ8/kUya"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842848fd613so71735b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jun 2026 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782229975; x=1782834775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RJl8ykoXp1RKpkOh2VAdRwHq3C+PGwNauXslsgelo7o=;
        b=cJ8/kUyaJwBHTFimk7F4JhnWRJ/R9q1RHq8eGXRTJDrjCpZBY6EwJ07P4kS0j1gZZ2
         lpgPpJh4V3ZIw/EZVYUXhAjVznTt86PaJF1xvfivBMD1Dmb1jjCLwrP8G8+qGs13uV5I
         AHVMRXBPpAyMnTL0jkyuI4YuNZQ+6STJRemz2mZbBa702Mqk1/uSSrF9N74fDcS7Rn2x
         BVzlO9iu+nISdXIus9jOX0MIxvOKtbPB17u8tB6lqp8EAlwpiV4klSD8dS+Uv7P3OblX
         /u4/EgwTkW7BuuMZy2ry42YPvvlgoYMhECilj9ggAFwwXsHvEI6WE02I2UUut0cC7Lma
         9NQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782229975; x=1782834775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJl8ykoXp1RKpkOh2VAdRwHq3C+PGwNauXslsgelo7o=;
        b=aEYSlwmdEFtwC/GGUwBkw1JgneQXY1SiKqu1XXomlyL3bPxVZ4iB6/044nNAJ/GGHU
         AXtno/AF1a+yO7bk1GfccChSP49zqjLVH/tMllFnPQ685zvvgx9BaUxa05TyA/yAQJkA
         awz5ag+cgYod/Lc/2f6t09FC8dueW5SRI/kchFrXQXGGVYYZPFHe7jaava8kQiQc5TBy
         1lNqoPey7XcRwN3asPUe+N1BaDTAg4P09vshb+WncJiITosmfbLiFNJlCX6ld63fWGFN
         Nh81s4vcBJ3mnIb/5Y6Jt2Ra33oxbkoy18swJeseJhi2ulE5M2q7HIltJi/EOGySQCLf
         ogcg==
X-Forwarded-Encrypted: i=1; AFNElJ+Zeh+ouG81l9QVW1ukOkFcp9ON+55FIHjDQKfrPbeIL2G7qX+Mf8Ha9RErtGwhRtKM9SQTbxdgohTsbc8WXv3fdYea@vger.kernel.org
X-Gm-Message-State: AOJu0YyCxd0cPUhEqa2bS9Z4+EVee2EAuc/S7ENiW1/AgBC5r56N3T+n
	1CCpGhXgxyoGyUo8G9NSDueIwqtoLm48lCGF0I43tHnHFHfs0NGVWhbE
X-Gm-Gg: AfdE7cnWa+jL6bs6l77BnxqV4QvQyBAiGwt5JzerbHR/Trr7fzbsXiP3cd2zWUFrJZP
	dE55bq1fXrPi/lI61iWIBS7Cx9o38LftPIcoi2qOUd1gRHBiDpQPtCfN/SP/IROsO7N5ngILsua
	tYnNOGAurmasusC2obrq1rhkM5WICwfdW323eGcvMY696oiyvNXKUfUTuO3CAqZOsgieGTuUTD2
	pFNpcmrf4TYtkRFwVJtqT98LUGtbLT8Frg5a+vjjKSwWpHctdM8FbIJGeetRd89cCRxN2WQQpe0
	fPXenvaR0U6LEr+xrNBtsUno9myuLZxr02RC67WMtQ8HNGPuwNmYjAEblRhjFmGUGcCyDuF9aFJ
	MJx+LxmIsvVrorIgZSe/VpT/khoifCWwxn92Y8jHHTsk8OYy8/hLGmK/TKqjOjHHt2Aa3NYEKrN
	ZPelfnc17k3IgGgZsEaPp9VQB5YUiu8OB2P008SVQx71QoFAicH9KiSACihMlI5s9PnODt4kbgP
	HVAORGsoQ==
X-Received: by 2002:a05:6a00:b95:b0:842:4f20:5402 with SMTP id d2e1a72fcca58-8456253555amr17070230b3a.21.1782229975367;
        Tue, 23 Jun 2026 08:52:55 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea72d7sm10960015b3a.46.2026.06.23.08.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 08:52:54 -0700 (PDT)
Date: Tue, 23 Jun 2026 21:22:49 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Marco Scardovi <scardracs@disroot.org>
Cc: moravec@ukf.sk, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	eliadevito@gmail.com, emreleno@gmail.com, rafael@kernel.org, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, regressions@leemhuis.info, 
	regressions@lists.linux.dev
Subject: Re: [PATCH 1/1] platform/x86: hp-wmi: fix platform profile issues on
 generic HP laptops
Message-ID: <ajqgkq_elUlMC0Ep@archlinux>
References: <20260619220911.7542-1-scardracs@disroot.org>
 <20260619220911.7542-2-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20260619220911.7542-2-scardracs@disroot.org>

On Sat, Jun 20, 2026 at 12:09:11AM +0200, Marco Scardovi wrote:
>On generic (non-Omen/non-Victus) HP laptops supported by the
>hp-wmi driver, the platform_profile sysfs operations could fail,
>leading to 'platform_profile: Failed to get profile for handler hp-wmi'
>errors and preventing userspace power profile management from working
>correctly.
>
>The driver was blindly registering all 4 profiles (quiet, cool,
>balanced, performance) without checking which ones were actually
>supported by the BIOS. Furthermore, when userspace switched profiles,
>hp_wmi_platform_profile_get() was called, which queried the BIOS
>using thermal_profile_get(). If the BIOS query returned an error or
>returned a value not in the recognized cases, the get call failed,
>throwing an error.
>
>Fix this by:
>1. Dynamically probing which thermal profiles are supported by the BIOS
>   during driver registration by temporarily setting each profile and
>   checking the return code, then restoring the original profile.
>2. Initializing and updating active_platform_profile to cache the
>   last set/boot profile.
>3. Falling back to the cached active_platform_profile in
>   hp_wmi_platform_profile_get() if the BIOS query fails or returns
>   an invalid/unmapped value, rather than returning an error.
>
>Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220008

Is the patch tested by them?

>Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221569
>Closes: https://lore.kernel.org/platform-driver-x86/a3b137df-1b21-4460-b003-58c5ca2d59d4@ukf.sk/
>Fixes: 4296f679ca50 ("platform/x86: hp-wmi: add platform profile support")
>Assisted-by: Antigravity:gemini-3.5-flash
>Signed-off-by: Marco Scardovi <scardracs@disroot.org>
>---
> drivers/platform/x86/hp/hp-wmi.c | 53 +++++++++++++++++++++++++++++---
> 1 file changed, 48 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>index 8ba286ed8721..93df269445eb 100644
>--- a/drivers/platform/x86/hp/hp-wmi.c
>+++ b/drivers/platform/x86/hp/hp-wmi.c
>@@ -1662,8 +1662,11 @@ static int hp_wmi_platform_profile_get(struct device *dev,
> 	int tp;
>
> 	tp = thermal_profile_get();
>-	if (tp < 0)
>-		return tp;
>+	if (tp < 0) {
>+		guard(mutex)(&active_platform_profile_lock);
>+		*profile = active_platform_profile;
>+		return 0;
>+	}

This does silence the error but I don't think that's a wise decision
since it effectively makes userspace blind to any WMI failure. Ideally,
if thermal_profile_get() fails then the board isn't supposed to be using
HPWMI_THERMAL_PROFILE_QUERY.

>
> 	switch (tp) {
> 	case HP_THERMAL_PROFILE_PERFORMANCE:
>@@ -1679,7 +1682,9 @@ static int hp_wmi_platform_profile_get(struct device *dev,
> 		*profile = PLATFORM_PROFILE_QUIET;
> 		break;
> 	default:
>-		return -EINVAL;
>+		guard(mutex)(&active_platform_profile_lock);
>+		*profile = active_platform_profile;
>+		break;
> 	}
>
> 	return 0;
>@@ -1707,10 +1712,14 @@ static int hp_wmi_platform_profile_set(struct device *dev,
> 		return -EOPNOTSUPP;
> 	}
>
>+	guard(mutex)(&active_platform_profile_lock);
>+
> 	err = thermal_profile_set(tp);
> 	if (err)
> 		return err;
>
>+	active_platform_profile = profile;
>+
> 	return 0;
> }
>
>@@ -2017,8 +2026,23 @@ static int hp_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
> 		/* Adding an equivalent to HP Omen software ECO mode: */
> 		set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> 	} else {
>-		set_bit(PLATFORM_PROFILE_QUIET, choices);
>-		set_bit(PLATFORM_PROFILE_COOL, choices);
>+		int current_tp = thermal_profile_get();
>+
>+		if (current_tp < 0)
>+			return current_tp;
>+
>+		if (thermal_profile_set(HP_THERMAL_PROFILE_QUIET) == 0)
>+			set_bit(PLATFORM_PROFILE_QUIET, choices);
>+		if (thermal_profile_set(HP_THERMAL_PROFILE_COOL) == 0)
>+			set_bit(PLATFORM_PROFILE_COOL, choices);
>+		if (thermal_profile_set(HP_THERMAL_PROFILE_DEFAULT) == 0)
>+			set_bit(PLATFORM_PROFILE_BALANCED, choices);
>+		if (thermal_profile_set(HP_THERMAL_PROFILE_PERFORMANCE) == 0)
>+			set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);

Probing for HP_THERMAL_PROFILE_DEFAULT and HP_THERMAL_PROFILE_PERFORMANCE
seem redundant since those bits are unconditionally set in this function
after the if-else blocks.

>+
>+		/* Restore the original thermal profile */
>+		thermal_profile_set(current_tp);
>+		return 0;
> 	}
>
> 	set_bit(PLATFORM_PROFILE_BALANCED, choices);
>@@ -2263,6 +2287,25 @@ static int thermal_profile_setup(struct platform_device *device)
> 		if (err)
> 			return err;
>
>+		/* Initialize active_platform_profile */
>+		switch (tp) {
>+		case HP_THERMAL_PROFILE_PERFORMANCE:
>+			active_platform_profile = PLATFORM_PROFILE_PERFORMANCE;
>+			break;
>+		case HP_THERMAL_PROFILE_DEFAULT:
>+			active_platform_profile = PLATFORM_PROFILE_BALANCED;
>+			break;
>+		case HP_THERMAL_PROFILE_COOL:
>+			active_platform_profile = PLATFORM_PROFILE_COOL;
>+			break;
>+		case HP_THERMAL_PROFILE_QUIET:
>+			active_platform_profile = PLATFORM_PROFILE_QUIET;
>+			break;
>+		default:
>+			active_platform_profile = PLATFORM_PROFILE_BALANCED;
>+			break;
>+		}
>+
> 		ops = &hp_wmi_platform_profile_ops;
> 	}
>
>-- 
>2.54.0
>
