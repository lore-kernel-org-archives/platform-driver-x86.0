Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794986127;
	b=0Ht4l1lkm0+yHImtbnrvWeVzBp6DSAC4jcj+MYIXA8OkJmWOc6G2d00y4910khasP94t
	 hcN6oykaanBPI9KEUzCYbFNDfW21zzAYbw9wiTCxj4k7mfNbXOUfpH9g5P35xvmOyYDwQ
	 j1p8M+4RWMBa80R+Kxemtt7uHBeJez/mKSmaSwLhlxdCe/I4jkNwm4uEN6waBR0Sds7vR
	 sqhRpfTcrWliOKJZBW0bNM5pJaE2CPv7eA5o/6XUnqljayDtCCR8P51Iu4ADWBGFcDJ+Y
	 kDyl4SvjY4jnIx9/6hCttZrftHfbdQmalobe649axneqFJQKBC89aMDajA6LMil1ECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794986127;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=lxc5C/rcdQue0n3+xWexsGKdaIIXMJcugF2brKPXT7s=;
	b=d1S31eJsF69XT6x/Tf6H2luOpXivZm1l4hCW3oYHSgzHZx8IdaNvIrvinrh21sIjAuz2
	 r2ytLAOS8w0NttgUEHrrfx2vbuVUgG/18KQC2LlAu119bc3jWoLvSdjpTpDI68lcgpx41
	 R3wFCUsf6XSwjVZaDQftjpQoq0ZGBNeAoUGsiHlkeY4DzonnkCpy+6+rcQk/rdn2LFdPS
	 7hG/HUD9LKNXQHNfBBMDy7LXvbZUbYOHZJuj/zcQlO45pmYcE2JoNRVIHdl4I3cOMrqlF
	 Rr8BME/RVE5XNI0Hp8EwCrzjU8PKpxFizRAYv3x3eyA2/GymawPUwWZtqXBZbgnmPgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrRaaoIF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42AD606A31C;
	Wed, 18 Nov 2026 07:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrRaaoIF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455C81F000C4;
	Wed, 18 Nov 2026 07:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794986126;
	bh=lxc5C/rcdQue0n3+xWexsGKdaIIXMJcugF2brKPXT7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JrRaaoIFaSOD5t6kboBSP7BZs3R2KKNc3fuC2BNowlQKocnCK/Mkaf6aCfesU0QiX
	 b4hI+GmYB/KgwQHeO+uPUqHKCvJki7TFAzY4NHwFPwAIJuiaajRupojIAdTuc2UZM8
	 eXWnWpSpTxFsFEzPkwD8CCBw2BrPffPCA2IVhjTMxHfuDpUn9192nGdJONbl3NH/7U
	 vfske3UD9n6vKG45vNX9MbZ5RPH+GWYlUO15VbLdDpVEtcr8vQmfDmlv/zfxuNXFVl
	 UZrBNTQeY4nedFFH4BM9pi2/ZCk80AtTZHwaH6eyTp/loL+TzzRz6ftgdbZs9ip8cZ
	 v+coIylV8WqHg==
Date: Wed, 18 Nov 2026 07:15:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Xi Pardee <xi.pardee@linux.intel.com>
Cc: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: Re: [PATCH v3] platform/x86/intel/pmc: Disable ACPI PM timer during
 suspend on Panther Lake
Message-ID: <av1Qi2MGB4asm0ks@google.com>
References: <20261112032040.930597-1-tzungbi@kernel.org>
 <766daa32-2247-40c2-980f-2a2317733b96@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <766daa32-2247-40c2-980f-2a2317733b96@linux.intel.com>

On Mon, Nov 16, 2026 at 09:17:13PM -0800, Xi Pardee wrote:
> Hi Tzung-Bi,
> 
> Thanks for the v3. Avoiding  pmcdev->lock  and the tick_freeze()  atomic
> context resolves the problem behind the revert in 5fa607880168, and the save
> and restore logic looks correct.
> 
> Two requests:
> 
> 1. Ordering vs. the  acpi_pm  clocksource.
> • The reverted code toggled the timer from the clocksource's own callbacks.
> These run inside  timekeeping_suspend()  after the last read and inside 
> timekeeping_resume()  before the first read, so the counter is never read
> while stopped.
> • Here the timer is stopped in  suspend_late  and restarted in resume_early
> . That is before  timekeeping_forward_now()  on suspend and after 
> tk_clock_read()  on resume.
> • If  acpi_pm  is the active clocksource, for example when TSC is unstable,
> timekeeping can read a stopped counter, and ktime_get()  stops advancing
> from  suspend_late  on.
> • Have you tested with  clocksource=acpi_pm ? If TSC is always used on PTL,
> please say so in the commit message.

Good catch.  I haven't tested with clocksource=acpi_pm since our test
kernel has CONFIG_X86_PM_TIMER=n and uses TSC.

To preserve proper ordering when CONFIG_X86_PM_TIMER=y, in v4 I will
move the lockless toggle helper into pmc_core and register it via
acpi_pmtmr_register_suspend_resume_callback() when CONFIG_X86_PM_TIMER=y
(falling back to pmc_core_suspend()/pmc_core_resume() when disabled).

I will send out v4 after re-running the s2idle test with the updated
patches.

> 2. Evidence for S0i2.2.
> • Please share S0i2.1 and S0i2.2 residency with and without the patch.
> • Include the platform, firmware and kernel version, and say whether
> firmware enabled the timer and  wdat_wdt  was active.

Here are the current results from v3 on a Panther Lake Android desktop
device (coreboot with CONFIG_USE_PM_ACPI_TIMER=y, kernel 6.18 with
CONFIG_X86_PM_TIMER=n, wdat_wdt not active):

- Without patch:
    S0i2.1: 100.00% (345,477 ms), S0i2.2: 0.00% (0 ms)
- With patch:
    S0i2.1: 0.00% (11 ms), S0i2.2: 100.00% (338,628 ms)

I will include the residency results in the v4 commit message as well.

> 
> Also, does WCL, which reuses the PTL ops, need the same fix?

I'm not sure whether WCL has the same behavior, and I don't have WCL
hardware to verify it.  In v4, I'll move the support into pmc_core via
opt-in fields in struct pmc_reg_map and enable it for Panther Lake, so
WCL (or other platforms) can easily opt in if needed.
