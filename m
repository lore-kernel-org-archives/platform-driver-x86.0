Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63C43112DA;
	Thu, 21 May 2026 14:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374676; cv=none; b=G+e6rlTU4pbIm6OvX7l5xmlBRhNiTSWz8Uac2UP4FKiv2d9rZP0rGmpApijBhb7OLuHjugdSkD3K8KsxniaVST3HZ3a09zX2G5rrI/t0KaCNfPqIb8hgI85sCVS5a1rty2E7ojYcCM9Yhnym8jm+itdEXbP07f4VIvfYLlCQeSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374676; c=relaxed/simple;
	bh=VdZFZ2saP63ffE7iLDn2fHczfT5IHW7yeEZe37yguHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jWG1I0N6d4XJGe2DZnZD1Hf7h/Xdu+YvTgeg7FL2zWvwkpFp1MtORUQjGb9eJU7tEZVwscp4sFWz28D2ODNY/Btadw67sOD/Wb69fwVpM0/mLj38qXG9HM0peShvvn8fpY1hSPtf38DQzQP/xvT3lpq6C7b4fV/RMEsEiKtKySU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljCVkvFf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljCVkvFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BB81F00A3B;
	Thu, 21 May 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779374674;
	bh=2KixbRFczJZxLMTs+gatpLcttPrsrbmr2RRuD5AGU30=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ljCVkvFfuxCcz/ZW2jPdXhjmUjiPvA9IU3Qs9GC3/gcXaECP+L7WWIoMzESAnRvUU
	 CxK+eJjjNct/JRSlGLTIoiVsvcqasw8WbwX7YjJjttIw3eueQ5YFL4enOI5LWZTyOW
	 I+HKHJ0soKfbDslAuIfPZWi8620sJFtmh9nc/t/qoZvz+Yc/+XajwONIRh2TOwZLUo
	 08u0O0JtBbJbjxeYRfoDOTTXSNGQwAJunCpFDwPD6B9sracjRFiCMo8rr1f/NE6Sch
	 xPjQubXrkrLNMTXGWLSF64J/PHzhGKYUgAV52cHY3QgM7g6rxHw3lx5T8F4wMP/0q3
	 JZrFuv/3ZZImg==
Message-ID: <76150f44-1f08-49c4-b4e8-b37ee143911a@kernel.org>
Date: Thu, 21 May 2026 09:44:33 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] amd_pmc: Delay s2idle suspend for some devices
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512202645.1549111-1-daniel@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260512202645.1549111-1-daniel@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/26 15:26, Daniel Gibson wrote:
> On some AMD Zen3 and Zen3+-based Lenovo IdeaPad laptops the keyboard and
> the lid switch stop working after the first suspend, until rebooted.
> 
> More specifically, they stop sending events when pressing a key or
> closing the lid - it's still possible to toggle the capslock- and
> numlock-LEDs with an external keyboard or read the lid state at
> /proc/acpi/button/lid/LID/state.
> 
> See also https://bugzilla.kernel.org/show_bug.cgi?id=221383
> 
> It appears that suspending and/or resuming gets the EC into a broken
> state. This problem doesn't happen on Windows and Mario Limonciello
> mentioned that the Windows kernel gives hardware and software some time
> before actually suspending (before activating HW DRIPS), while Linux
> (or the amd_pmc module) does that immediately, so it may be worth trying
> if calling msleep() in amd_pmc_s2idle_check() helps.
> 
> It turned out that sleeping for 2.5 seconds at that point indeed makes
> the problems mostly disappear. Sleeping for 1.5 seconds wasn't enough.
> 
> "Mostly" because it turned out that they still occur (on some but not
> all devices needing this patch) when using a wakeup timer (wakealarm).
> 
> I could build on an existing quirk[1] that also sleeps for 2.5 seconds
> under other circumstances; my first commit refactors that a bit so I
> can integrate my further changes in a cleaner way.
> 
> I found several reports of these or similar issues on the web, for
> different devices, so in a second commit I added a parameter to the
> kernel module that allows enabling or disabling this, which will make
> it easy for people whose devices aren't matched yet to test this quirk.
> 
> Thanks to Mario Limonciello for his support and to Sindre Henriksen
> for testing my patch and to Ilpo Järvinen for reviewing!
> 
> [1] https://lore.kernel.org/platform-driver-x86/20250414162446.3853194-1-superm1@kernel.org/
> 
> Changes in v3:
> - Rewrote commit messages of patch 1, 4 and 5 as requested in the review
> - Adjusted formatting of the other commit messages
> - Added another confirmed device (83MM) to the quirks list and mention
>    it in the commit message
> 
> Changes in v2 (https://lore.kernel.org/platform-driver-x86/20260509013105.816339-1-daniel@gibson.sh/t/#u):
> - Documented this in Documentation/arch/x86/amd-debugging.rst
> - Added example for reset register kernel message in same file
> - In amd_pmc_quirk_need_suspend_delay(), avoid dereferencing a NULL
>    pointer of devices not detected for any quirk - oops!
> - Mention that timed resumes may still cause those keyboard/lid issues
> - Various code changes requested or suggested in reviews of v1:
>    - Some formatting changes (commas behind non-terminating entries)
>    - Moved check for existing quirk (that OVP thing) into its own function
>      amd_pmc_intermediate_wakeup_need_delay() in pmc.c, so the checks of
>      the different quirks are separated more clearly.
>    - Added function amd_pmc_want_suspend_delay() in pmc.c handling
>      amd_pmc_quirk_need_suspend_delay() together with disable_workarounds
>      and delay_suspend and also logging about the reason for the delay,
>      also for cleaner separation.
>    - If delay_suspend=1 is used to force-enable the fix on hardware that
>      is not automatically detected as needing this fix, log message
>      encouraging the user to report their device, including the most
>      relevant DMI values that could be used for matching
> 
> v1: https://lore.kernel.org/platform-driver-x86/20260501032655.283789-1-daniel@gibson.sh/t/#u
> 
> Daniel Gibson (5):
>    platform/x86/amd/pmc: Check for intermediate wakeup in function
>    platform/x86/amd/pmc: Delay suspend for some Lenovo Laptops
>    platform/x86/amd/pmc: Add delay_suspend module parameter
>    Documentation/arch/x86/amd-debugging: Add example for reset register
>    Documentation/arch/x86/amd-debugging: Add section about delay_suspend
> 
>   Documentation/arch/x86/amd-debugging.rst  | 30 ++++++++++++
>   drivers/platform/x86/amd/pmc/pmc-quirks.c | 39 +++++++++++++++
>   drivers/platform/x86/amd/pmc/pmc.c        | 60 +++++++++++++++++++++--
>   drivers/platform/x86/amd/pmc/pmc.h        |  1 +
>   4 files changed, 127 insertions(+), 3 deletions(-)
> 

Can you see if this series helps your issue instead of quirks?

https://lore.kernel.org/linux-acpi/5996185.DvuYhMxLoT@rafael.j.wysocki/
