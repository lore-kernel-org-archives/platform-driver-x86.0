Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A71448B91
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jul 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330663; cv=none; b=tIVEO2LCwR9zumtXg6+5EYYHsJkTH4oOljB0vxvcX9oMyqUQnmlsSZcJI8Rwx8Mxq4A2l1Fuw9dSxBCQTqUwebZh4UzjoJBXb6CNbC0q18Qe/a0pK2kp3eE/E5Ay2JfVFrfyR6zymzttkqAHv6BAUNAyKNDGdkuJrARJPOgrvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330663; c=relaxed/simple;
	bh=d16Q1LoM8vU+rqcIGVsFILiyDxSBiIIuWZ0nFnz8cN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxX1E44JEpararSXWoE0kuaodF2RveBuFdPYK3TirGmRhvHKKzlxlFX2xOOrRbeMUyzUMU1FyrCSXNEBEjkoVbhNNqVLE/V96XoBBfqlqhS9JJZM6zN/fLUevbufbeYTHy20VUQSMDzgR1lqW3ZYTRKVXyc++0zZaLj4otk7VeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V3UlvVB6; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V3UlvVB6"
Message-ID: <ae9b94f9-7108-4973-9a99-79a008170b5d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785330659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XCDY8NceupbItCOfWJc9jE2a9EWqS9GfWjUvga5unG0=;
	b=V3UlvVB6UfYZm4geFGlgSjeheVCyRvRQd1si3iF1dt66Yi/MqoT57vAWyHb8jFgsD6uP9b
	za/qXmWFPgFRLA4C0BEbeLFY5GlA6K4MNpaxPYWExH5pwk51JunjrTU6nlFdusq+lHGE/y
	YAGqqiDyiAvOi8/HxSyIMIZ4FyqKO2Q=
Date: Wed, 29 Jul 2026 15:10:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
To: Hans de Goede <hansg@kernel.org>, Marco Scardovi <scardracs@disroot.org>,
 platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260728071843.130492-1-scardracs@disroot.org>
 <d88d0945-71e0-4d21-b154-d0d837624858@kernel.org>
 <y0qKqYgBT5Cpfe4BHTFqrA@disroot.org>
 <846ca0a3-bd37-4424-aa95-6ab255f48a48@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <846ca0a3-bd37-4424-aa95-6ab255f48a48@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/29/26 09:32, Hans de Goede wrote:
> Hi Marco,
>
> On 28-Jul-26 15:56, Marco Scardovi wrote:
>> In data martedì 28 luglio 2026 13:39:39 Ora legale dell’Europa centrale, Hans 
>> de Goede ha scritto:
>>> Hi,
>>>
>>> Thank you for your patch.
>>>
>>> On 28-Jul-26 09:18, Marco Scardovi wrote:
>>>> This series introduces support for ASUS WMI Whisper Mode hardware controls
>>>> in the asus-wmi header and asus-armoury driver.
>>>>
>>>> Background & Findings:
>>>> ----------------------
>>>> After talking with Denis and thanks to NeuroMarshal reverse engineering
>>>> and
>>>> firmware trace analysis on modern ASUS laptops, three specific WMI Device
>>>> IDs were identified that manage acoustic profiles and thermal regulation
>>>> under ASUS Whisper Mode:
>>>>
>>>> 1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
>>>>    - Controls the BIOS-level Whisper Mode acoustic profile toggle
>>>>    (read/write boolean).> 
>>>> 2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
>>>>    - Enables or disables Dynamic Whisper acoustic regulation (read/write
>>>>    boolean).> 
>>>> 3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
>>>>    - Reports status and allows runtime control over Dynamic Whisper state
>>>>    (read/write boolean).
>>> I wonder how this interacts with the platform_profile stuff ?
>>>
>>> I would expect enabling whisper mode to lower the max performance,
>>> so does this automatically change the platform_profile away
>>> from performance when it is set to performance ?
>>>
>>> Note the platform_profile API is extensible. To me it seems more
>>> logical to expose this as a whisper mode platform-profile ?
>>>
>>> Regards,
>>>
>>> Hans
>> Hi Hans,
>>
>> Thanks for the feedback!
>> Here you can find my opinions on your questions.
>>
>> 1. Interaction with platform_profile:
>> In ASUS laptops, where presents, Whisper Mode operates as an
>> independent boolean toggle/feature controlling fan acoustic target limits in
>> firmware/EC, rather than acting as a global thermal profile. Setting 
>> WHISPER_MODE or WHISPER_ENABLE via WMI sends a direct call to the EC/BIOS, 
>> which adjusts acoustic thresholds internally without altering the active 
>> platform_profile state (throttle_thermal_policy) in asus-wmi. IIRC on Windows 
>> it even permits to "hear" the ambient to make the fans run in a way to blend 
>> with the ambient noise.
>>
>> 2. platform_profile vs firmware_attributes (asus-armoury):
>> platform_profile is designed for mutually exclusive global power/thermal
>> modes (Quiet, Balanced, Performance). Whisper Mode, on the other hand, 
>> consists of independent BIOS feature toggles (0/1 controls for BIOS Whisper 
>> Mode, Dynamic Whisper Enable, and Status).
>> Since asus-armoury is dedicated to exposing BIOS/Armoury Crate firmware
>> attributes via fw_attributes_class (similar to nv_dynamic_boost,
>> nv_temp_target, panel_od, etc.), exposing these three WMI controls as
>> sysfs firmware attributes fits the overall design of asus-armoury much
>> better than extending platform_profile.
>>
>> I hope I've been of help. Feel free to let me know if you have more 
>> questions: I'll try to answer the best of my capacities.
> Thank you for clarifying things. Since the EC/BIOS interface sees this
> as 2 independent settings, I agree that exposing this as a firmware
> attr is the best way to expose this.
>
> Its a bit weird that one can select Performance profile and enable
> whisper mode at the same time. But if that is how the Asus firmware
> interfaces work, then that is how it is.
Hello Hans and Marco,

I agree that this is weird and we don't have a device with whisper mode,
but there is the possibility of the official windows app allowing whisper mode
only on certain modes: we would need to find someone with windows
to confirm this, but I also don't think binding whisper to quiet/low performance
is a bad idea.

My opinion is that either whisper gets its own profile and is a combination of
quiet + whisper set to 1 or we check what windows does since I don't want
to have hardware running in configurations that ASUS never intended to.

Best regards,
Denis
> Regards,
>
> Hans
>
>
