Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0A217F31
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580319; cv=none; b=Fe1RsfKZXm0P49b0Ob+4vMtPtSK8mlx0R1Of2ZrY358O13/kCJNdxKCxv0aY/OJEXtYDmD2Pah86Ug+Q1hK7F+l9N6Uu0Yu89E+Xcw1+wty8F+94bUnh7otpI1J3wbsjPaf/gaHDffd9mT/NvEuA/c+2aA31SLtn6upd1xQnH2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580319; c=relaxed/simple;
	bh=r/uFTFsEEV2l3Rk3GtRs2Lm81YZde+Ku3wf6ZgnQLIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F3w/nhnwEwqh2+yk7qzKNRsfTNFnBBrKpgr1Y2GQqLLIhKQdIkYMzriZYWa6g6j1KuOj6CrnhpHoDKztE5N1lL0ds9YhmI0gcZ8/81YymXw41rPDu1zD7vHOnQkJoDer5MW7wqViFb51iO/+mmLhjTo/Qb4bdG7vEkUxEDTFHRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CapBQoI4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CapBQoI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172E2C4CEF5;
	Wed, 19 Nov 2025 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763580318;
	bh=r/uFTFsEEV2l3Rk3GtRs2Lm81YZde+Ku3wf6ZgnQLIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CapBQoI412uQ69ti8LRX41U/bP3luIMQuwINFxhA0wl8/lkEbS0lndmZqCu56tZ1q
	 mPwOfV8f4zBoaYvqFsHabopN5WOCkYhbq9x4Bi03k+5imdlbs2PvF+/DT2M49h5YBM
	 jnoOYdTpjfQWwwGn1sjNytclk9CMF6czAikoXdrewZj5SUtQiMz39yo6WRj6kgMcnR
	 O+AM5DYlwvQub6kNYer2zmhclH1LsRLv5928UuYs18a/BQTyj1EeOZDcRXoK07WXp/
	 LAbAgLL4Bvz9HRVwNsd61E3WNtFtbOV0LRYJR/PJPiJdJnKEzT1R311OfCFHZlAeD1
	 /iB7F94HW9+Kg==
Message-ID: <6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org>
Date: Wed, 19 Nov 2025 20:25:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Mario Limonciello <mario.limonciello@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
 <0a4eaad1-d312-4c43-94f3-b1d9986c117a@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <0a4eaad1-d312-4c43-94f3-b1d9986c117a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Mario,

On 19-Nov-25 5:32 PM, Mario Limonciello wrote:
> On 11/19/25 10:20 AM, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 11-Nov-25 8:10 AM, Shyam Sundar S K wrote:
>>> This series introduces a util layer to the AMD Platform Management
>>> Framework (PMF) and a minimal user-space interface via a misc character
>>> device, enabling feature discovery and smoother integration with
>>> user-space tools. It also adds caching of BIOS output policy values to
>>> prepare for user-space telemetry reporting via IOCTLs.
>>>
>>> The motivation is to provide a stable interface for user-space tools to
>>> discover PMF features and consume selected metrics. Enable smoother
>>> integration with AMD SystemDeck
>>
>> This does not really explain why you've chosen for a new character-device
>> with IOCTLs instead of sysfs where as so far (AFAICT) all the AMD PMF code
>> has been using sysfs APIs.
>>
>> Is there any specific reason why to switch to IOCTLs all of a sudden?
>>
>> Note that:
>>
>> 1. sysfs APIs can be (and must be) stable too, sysfs APIs are not allowed
>> to be changed once shipped in a stable kernel.
>> 2. sysfs attributes can be used with poll() to so if you want to do
>> notifications of changes that can be done through sysfs too.
>>
>> Note I'm not saying you must use sysfs, but so far the PMF code has been
>> using sysfs everywhere and this new IOCTL based API is not really consistent
>> with this.
> 
> Isn't there only one sysfs file for turning on/off CNQF?

Ah yes you're right somehow I thought there were more.

Still generally speaking the kernel community is trying to avoid
adding new ioctl based interfaces / adding random new char devices
in preference of using sysfs interface where possible.

So I've taken a better look at the actual ioctl interface
and it seems like a really weird multiplexer interface,
where there is only 2 ioctl commands and then the argument
gets 1 of a ton of possible feature flags resp. info variables.

Where it also seems that none of these variables require
a round-trip to the hardware.

Given the amount of different variables I can see some sense
in having this as an ioctl interface, but why do the whole
thing where userspace has to make ioctl per value it wants
to read. That feels very sysfs-ish if you want that maybe
just use sysfs ?

I would define a uAPI struct like this:

struct foo {
	u64 size;		/* in + out, all other fields out only */
	u64 features_supported; /* bitmask with feature info from patch 1/5 */
	u64 feature_version	/* from patch 1/5 */
	u64 power_source;	/* from patch 2/5 */
	...
	u64 bios_input[10];	/* from patch 2/5 */
	...
	etc.
};

And have a copy of this struct embedded in the driver
data struct and keep that updated (replacing the cache
stuff) so that you can just copy_to_user that on the ioctl.

Combined with a single get-info ioctl which just fills 
the struct, using the min of the size passed in by userspace
+ the size supported by the kernel to determine how much
to copy and set the copied size in the struct passed
back to userspace (to indicate for new userspace on
old kernel that the new fields are not set).

This way for future extensions new fields can be added to
the end of the struct and the size handling will automatically
do the right thing.

As for Ilpo's comment about the battery info being duplicate
with /sys/class/power_supply/BAT*, where is this info coming
from ?  Is this a PMF specific view of the battery info,
IOW it might be different then the power_supply calls info?

Note stil not a fan of adding new IOCTLs but given the large
amount of variables I can see how using an IOCTL might be
better then adding a ton of new sysfs attributes.

Regards,

Hans




>>> , a widely used tool for monitoring and
>>> controlling power and thermal behavior, helping designers keep components
>>> within thermal limits to ensure proper operation and improve system
>>> stability and reliability.
>>>
>>> This series also adds a small, dependable userspace utility that leverages
>>> the new IOCTLs to query live power and thermal telemetry. Exposing this
>>> data in a scriptable interface helps users and tooling make informed,
>>> workload-aware decisions and supports validation and debugging.
>>>
>>> v2:
>>> ----
>>>   - address remarks from v1
>>>   - add a new tool that exercises the IOCTLs from PMF interface
>>>
>>> Shyam Sundar S K (5):
>>>    platform/x86/amd/pmf: add util layer and user-space misc device
>>>      interface
>>>    platform/x86/amd/pmf: cache BIOS output values for user-space
>>>      telemetry via util IOCTL
>>>    Documentation/ABI: add testing entry for AMD PMF misc device interface
>>>    platform/x86/amd/pmf: Store commonly used enums in the header file
>>>    platform/x86/amd/pmf: Introduce AMD PMF testing tool for driver
>>>      metrics and features
>>>
>>>   .../ABI/testing/misc-amdpmf_interface         |  49 +++
>>>   MAINTAINERS                                   |   1 +
>>>   drivers/platform/x86/amd/pmf/Kconfig          |  10 +
>>>   drivers/platform/x86/amd/pmf/Makefile         |   2 +
>>>   drivers/platform/x86/amd/pmf/core.c           |  19 +
>>>   drivers/platform/x86/amd/pmf/pmf.h            |  33 +-
>>>   drivers/platform/x86/amd/pmf/spc.c            |   1 +
>>>   drivers/platform/x86/amd/pmf/tee-if.c         |  10 +
>>>   drivers/platform/x86/amd/pmf/util.c           | 236 +++++++++++
>>>   include/uapi/linux/amd-pmf.h                  |  96 +++++
>>>   tools/testing/selftests/Makefile              |   1 +
>>>   .../drivers/platform/x86/amd/pmf/Makefile     |   8 +
>>>   .../drivers/platform/x86/amd/pmf/test_pmf.c   | 388 ++++++++++++++++++
>>>   13 files changed, 832 insertions(+), 22 deletions(-)
>>>   create mode 100644 Documentation/ABI/testing/misc-amdpmf_interface
>>>   create mode 100644 drivers/platform/x86/amd/pmf/util.c
>>>   create mode 100644 include/uapi/linux/amd-pmf.h
>>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/Makefile
>>>   create mode 100644 tools/testing/selftests/drivers/platform/x86/amd/pmf/test_pmf.c
>>>
>>
> 

