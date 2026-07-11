Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1C63C988F
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2026 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783788418; cv=none; b=h1Ii2Vu4+vd2KhV/20vK4quwhZ04LPaguCEUcUSvTaZfxA4JgxqzSjthnR2/KDlueDNq4aI3nlK8r23u5TakrKhL/ddukM++CtLWw8UNHk/kF1SQRz08qMMfPeyy9A+GgEfrJD9sWpuq434bcaSSw5Ogvjgvhp+BWVCxlc0Yq94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783788418; c=relaxed/simple;
	bh=vOIyXFFZ7MUpU45xMYEk4ckdQRPhmCb+opV2ITDgs8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXD2tTQ3+yGTZtdJ2TzA58Rm3kqHzVUY/cupWDFms98hA+T1/3oq0hL1BDoC24rgbopj9+vRnC+NZF+520kQ8UhF6MGvIizBnMVTZUkBbkzYmaoBOEw7SnQO/vGV/d+Ku1z+mo2jASI1zFaf3fDyMgrvJwvp6HcrdXUWxSOBHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FOTnwdLw; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FOTnwdLw"
Message-ID: <a7b0db75-439f-4ae8-8721-da1d5fe86123@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783788400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/pvJPtukmUQ63EL9+PIQ+yeMrrp61W/YU2BycuLANQ=;
	b=FOTnwdLwTPd7pzjtwfopqHKTpcDJvx37GCOQfJZI9VusltF+qYTRqsIRiLpLVfTbSuiIYI
	cQNn3eKvCayRy86mYgijmMZ7MNO/e90a0a3iKDC8QI9voAfzBZW0iOACqWHF7IoC2zGyzn
	k5yxYjQm6wslooU3ZyFDh2tlYs30aX0=
Date: Sat, 11 Jul 2026 18:46:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Bug#1141604: linux-image-6.12.94+deb13-amd64: does not detect
 ScreenPad on ASUS VivoBook
To: Salvatore Bonaccorso <carnil@debian.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ponali <ponali2k@gmail.com>, Luke Jones <luke@ljones.dev>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 1141604@bugs.debian.org, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev,
 stable@vger.kernel.org
References: <178340264407.17924.10135409461303815312.reportbug@ananaspc>
 <178362762638.911488.8564892548331679884@eldamar.lan>
 <98dc115b-1dec-4fbb-bab7-2588e8b74bf8@linux.dev>
 <0ff0385e-50b0-bfae-cedc-05cfe9c6cbc7@linux.intel.com>
 <alE92R40JwcluApW@eldamar.lan>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <alE92R40JwcluApW@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/10/26 20:45, Salvatore Bonaccorso wrote:
> Hi all,
>
> On Fri, Jul 10, 2026 at 03:31:08PM +0300, Ilpo Järvinen wrote:
>> On Fri, 10 Jul 2026, Denis Benato wrote:
>>> On 7/9/26 22:08, Salvatore Bonaccorso wrote:
>>>> Control: forwarded -1 https://lore.kernel.org/regressions/178362762638.911488.8564892548331679884@eldamar.lan
>>>> Control: tags -1 + upstream
>>>>
>>>> Hi,
>>>>
>>>> Ponali reported in Debian (https://bugs.debian.org/1141604) the
>>>> following issue after updating from 6.12.90 to 6.12.94. First quoting
>>>> the report:
>>>>
>>>> On Tue, Jul 07, 2026 at 07:37:24AM +0200, Ponali wrote:
>>>>> Package: src:linux
>>>>> Version: 6.12.94-1
>>>>> Severity: normal
>>>>> Tags: upstream, regression
>>>>> X-Debbugs-Cc: ponali2k@gmail.com
>>>>>
>>>>> Last known working kernel: 6.12.90-1
>>>>> First known broken kernel: 6.12.94-1
>>>>>
>>>>>
>>>>> Dear Maintainer,
>>>>>
>>>>> I upgraded all my packages through apt, which also upgraded the linux image
>>>>> from 6.12.90 to 6.12.94.
>>>>>
>>>>> I expected the ScreenPad display to continue to be detected and exposed as a
>>>>> DRM output, like on 6.12.90. The ScreenPad being the trackpad with a screen,
>>>>> which came with my computer (ASUS VivoBook X532FA_S532FA).
>>>>>
>>>>> After upgrading and rebooting, the new kernel caused a regression where the
>>>>> display of the ScreenPad fails to get recognized by the kernel. The touchpad
>>>>> functionality still works. Usually, the ScreenPad would appear as "HDMI-A-1".
>>>>> The DRM connector for it still exists (/sys/class/drm/card0-HDMI-A-1), but
>>>>> "status" reports "disabled"
>>>>>
>>>>> I could not get the ScreenPad display to be recognized again on the new kernel,
>>>>> so I configured GRUB to automatically boot to the 6.12.90 kernel through the
>>>>> "Advanced Options". The ScreenPad is recognized on older kernel versions, so I
>>>>> am still able to use it (until a new LPE comes around).
>>>>>
>>>>> To replicate:
>>>>> 1. Boot with 6.12.90. The ScreenPad display is detected as HDMI-A-1.
>>>>> 2. Boot with 6.12.94 with the exact same hardware.
>>>>> 3. The ScreenPad display is no longer usable.
>>>>>
>>>>>
>>>>> My main display is eDP-1 (1920x1080), though it isn't essential. My GPU is an
>>>>> integrated Intel iGPU, and the driver used for both screens is i915. I have
>>>>> booted to the new kernel for reportbug to get all the information
>>>>> automatically, but i will continue to use the old one until the appropriate
>>>>> time.
>>>> Now, Ponali did bisect the changes between 6.12.90 and 6.12.94 and
>>>> found that the backport of the commit 8d95d1f4aa5c ("platform/x86:
>>>> asus-wmi: fix screenpad brightness range") changed the behaviour.
>>>> Bisect log is at: https://bugs.debian.org/1141604#22
>>>>
>>>> As this change was backported to other stable series as well I asked
>>>> Ponali to please test 7.0.y and 7.1.y and confirmed that both 7.0.13
>>>> and as well 7.1.3 show the hehaviour.
>>>>
>>>> #regzbot introduced: 8d95d1f4aa5c76202b0833a70998769384612488
>>>> #regzbot link: https://bugs.debian.org/1141604
>>>>
>>>> Is there anything Ponali can report back to further debug the issue?
>>> Hi Salvatore,
>>>
>>> The commit incriminated is this one: https://lore.kernel.org/all/20260302174431.349816-3-denis.benato@linux.dev/
>>>
>>> As you can see that commit changes min/max of the brightness range, but 
>>> does not touch the detection at all, 
>> To be more precise, it DOES change read_screenpad_backlight_power() -> 
>> asus_wmi_get_devstate_simple() but AFAICT that cannot make things worse 
>> because asus_wmi_get_devstate_simple() used in both cases, so I was 
>> left to wonder the same thing as you.
>>
>> That being said, it's hard to see how bisect could point this to a wrong 
>> commit either because good/bad should be pretty obvious.
>>
>> Did reverting the suspect commit on top of 6.12.94 result in a working 
>> system?
> Ponali did test, and reported back in the Debian bug at
> https://bugs.debian.org/1141604#60, quoting:
>
>> I have found the sysfs attribute for brightness control to be in
>> /sys/class/backlight/asus_screenpad, and it appears on both 6.12.90 and
>> 6.12.94.
>>
>> On 6.12.90, max_brightness reports 235.
>>
>> On 6.12.94, max_brightness reports 255.
>>
>>
>> I have checked out to v6.12.94, reverted the suspect commit, and found
>> the ScreenPad to be working as intended.
>>
The only reason I see is the the minimum might be greater than the maximum
or negative and the kernel is rejecting it.

Can you also report back on the minimum?

Also if you could print a few values that would be helpful since I am not really seeing much here.
>> Regards,
>>
>> Ponali
> Regards,
> Salvatore
