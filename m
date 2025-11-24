Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F151224A043
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Nov 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763978697; cv=none; b=lPp2RMtW2h6d25b/xWtT9kVbevoEQKJukEapf+rRw8tI7/2ohDxnYU8ck2i+/scksXAuCRZzcOpBHD8o561BLOU4XgFQfDk3Z4fw6I3pRTcBzqICzoGxqDCiv5hax/JxFme05XQfePO2/5eW58BSqzlPRXXqc0YoUZuhzzqoVNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763978697; c=relaxed/simple;
	bh=62VcHo4MGInJdI+spHkT9gad561NIj+VTpM/hF42XHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGshDtCE6dnWHlOTB+Q23T/gqpV68F1pmKV7AQd7Cl05JrCRwQ5IhYaAoUs9AwfGXPrZZhE5uJCeB/nwToshUAHDioUafqD0fmeaj3tA8qnP/52vbn8U3n0bhvxXkZ1bx1SpnVx151ysRRvE1v67VP9z2SZ1iUspA43eLynSXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhTNCj8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhTNCj8B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CEF3C4CEF1;
	Mon, 24 Nov 2025 10:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763978696;
	bh=62VcHo4MGInJdI+spHkT9gad561NIj+VTpM/hF42XHs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GhTNCj8B5JHGRcDQ0e3n56zEfCXX1xP3f1Q90Fx2/ejEMxYjKVjh9pV+v2mBeg3QM
	 PT0QXfNB0tqFeZvjjp5F8oGICOR69DyBPHXVUH61z18gBUiSMhsUh9isLiugIcJecp
	 Aw+y+meiLnWN9UcBbKuya0rLRVEgI1qh7IZ9mD+DjWuYtwHVMaRINfReVXOiDH+LBC
	 7QdK+CC2hBHs/0eGiPTo9xJ0jNk40FrC5THD4n4al8jrunXI2rLcX1X7pyW0VajIce
	 W4072hWHB1zJlqyuCZKg1qqskZ/npApi3GamtsFCNan99riJEvtVP9pS426M4e3rHg
	 4Iz+v74UkbHGQ==
Message-ID: <c53cec11-6b3b-4774-b00b-c5c5e4614be0@kernel.org>
Date: Mon, 24 Nov 2025 11:04:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce AMD PMF util layer and user-space
 interface for SystemDeck
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, Yijun.Shen@Dell.com,
 Sanket.Goswami@amd.com
References: <20251111071010.4179492-1-Shyam-sundar.S-k@amd.com>
 <2c40e722-ffd7-4e00-92dd-2c89ff4768a0@kernel.org>
 <0a4eaad1-d312-4c43-94f3-b1d9986c117a@amd.com>
 <6104959e-0214-492d-8ceb-c7376d3b1121@kernel.org>
 <9d4ba01f-31f0-40f6-9d86-bd18134d2218@amd.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9d4ba01f-31f0-40f6-9d86-bd18134d2218@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 20-Nov-25 08:49, Shyam Sundar S K wrote:
> Hi hans,
> 
> On 11/20/2025 00:55, Hans de Goede wrote:
>> Hi Mario,
>>
>> On 19-Nov-25 5:32 PM, Mario Limonciello wrote:
>>> On 11/19/25 10:20 AM, Hans de Goede wrote:
>>>> Hi Shyam,
>>>>
>>>> On 11-Nov-25 8:10 AM, Shyam Sundar S K wrote:
>>>>> This series introduces a util layer to the AMD Platform Management
>>>>> Framework (PMF) and a minimal user-space interface via a misc character
>>>>> device, enabling feature discovery and smoother integration with
>>>>> user-space tools. It also adds caching of BIOS output policy values to
>>>>> prepare for user-space telemetry reporting via IOCTLs.
>>>>>
>>>>> The motivation is to provide a stable interface for user-space tools to
>>>>> discover PMF features and consume selected metrics. Enable smoother
>>>>> integration with AMD SystemDeck
>>>>
>>>> This does not really explain why you've chosen for a new character-device
>>>> with IOCTLs instead of sysfs where as so far (AFAICT) all the AMD PMF code
>>>> has been using sysfs APIs.
>>>>
>>>> Is there any specific reason why to switch to IOCTLs all of a sudden?
>>>>
>>>> Note that:
>>>>
>>>> 1. sysfs APIs can be (and must be) stable too, sysfs APIs are not allowed
>>>> to be changed once shipped in a stable kernel.
>>>> 2. sysfs attributes can be used with poll() to so if you want to do
>>>> notifications of changes that can be done through sysfs too.
>>>>
>>>> Note I'm not saying you must use sysfs, but so far the PMF code has been
>>>> using sysfs everywhere and this new IOCTL based API is not really consistent
>>>> with this.
>>>
>>> Isn't there only one sysfs file for turning on/off CNQF?
>>
>> Ah yes you're right somehow I thought there were more.
>>
>> Still generally speaking the kernel community is trying to avoid
>> adding new ioctl based interfaces / adding random new char devices
>> in preference of using sysfs interface where possible.
>>
>> So I've taken a better look at the actual ioctl interface
>> and it seems like a really weird multiplexer interface,
>> where there is only 2 ioctl commands and then the argument
>> gets 1 of a ton of possible feature flags resp. info variables.
>>
>> Where it also seems that none of these variables require
>> a round-trip to the hardware.
>>
>> Given the amount of different variables I can see some sense
>> in having this as an ioctl interface, but why do the whole
>> thing where userspace has to make ioctl per value it wants
>> to read. That feels very sysfs-ish if you want that maybe
>> just use sysfs ?
>>
>> I would define a uAPI struct like this:
>>
>> struct foo {
>> 	u64 size;		/* in + out, all other fields out only */
>> 	u64 features_supported; /* bitmask with feature info from patch 1/5 */
>> 	u64 feature_version	/* from patch 1/5 */
>> 	u64 power_source;	/* from patch 2/5 */
>> 	...
>> 	u64 bios_input[10];	/* from patch 2/5 */
>> 	...
>> 	etc.
>> };
>>
> 
> thank you for your remarks and the UAPI struct suggestion. Let me make
> this change and come back with a newer version.
> 
>> And have a copy of this struct embedded in the driver
>> data struct and keep that updated (replacing the cache
>> stuff) so that you can just copy_to_user that on the ioctl.
>>
>> Combined with a single get-info ioctl which just fills 
>> the struct, using the min of the size passed in by userspace
>> + the size supported by the kernel to determine how much
>> to copy and set the copied size in the struct passed
>> back to userspace (to indicate for new userspace on
>> old kernel that the new fields are not set).
>>
>> This way for future extensions new fields can be added to
>> the end of the struct and the size handling will automatically
>> do the right thing.
>>
>> As for Ilpo's comment about the battery info being duplicate
>> with /sys/class/power_supply/BAT*, where is this info coming
>> from ?  Is this a PMF specific view of the battery info,
>> IOW it might be different then the power_supply calls info?
>>
> 
> with regards to this:
> 
> The function amd_pmf_get_battery_info() fills in the data that will be
> sent to the TA. Inside this function, it calls
> amd_pmf_get_battery_prop() to retrieve each required battery property.
> 
> For example:
> 
> /* to get the battery percentage */
> in->ev_info.bat_percentage =
> amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);

Ok, so this is duplicating the information from /sys/class/power_supply .

Is there a reason why your userspace app cannot just directly get
these values from /sys/class/power_supply ?

I guess it might be convenient to have this all in the same ioctl,
I understand that the PMF code already needs to retrieve it regardless.

Maybe just have an ioctl which just memcpy-s the entire
ta_pmf_condition_info struct to userspace?  I think that is already
part of the kernel <-> PMF-firmware API so making that struct uAPI
should be fine since it is already something which cannot be changed
because it is also firmware API ?

It seems just being able to copy the cached ev_info the driver
already has to userspace is better then defining a new struct with
similar fields and needing to manually copy over everything field
by field ?

And then instead of an ioctl it could even just be a binary sysfs
file, avoiding the need to add a somewhat random new chardev
to /dev  ?

Regards,

Hans


