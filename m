Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD303E3DB5;
	Mon,  4 May 2026 16:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913916; cv=none; b=YILif6TItlTr+zMYmZRZax1k8HCjKv88uKHePOCFgeZe300LoEgVuK1NCuCafxRw73ki7zmdDyzogHVJ6AiXTukmRRSzX9u6LZfRre/dj3HznJo53PafzQN7DhFO+SxjKFbYac/m/XK4TBfJfAC7AYBsDLLWo+Z2vCxP/O6RyRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913916; c=relaxed/simple;
	bh=kd80XGcTsGOTeH4ZW65LZWN5IuJE7lA+8m9SrHNcJEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jfS6uKhhs1Qe6MABpuyc8PxXDc9A/4qY198CVqR/PljNEYbjJtxcOwY3h2SnZQEqtzrxRzrDUuX/ibdy63MaCXnmTMGk4HhxuAm/33Yxjwl2XE6tjsrubBEbHX7ya657EnIs3ZS69sdFaW4uI/uqLspjjzLagWHMv9r5ptOjHYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCcVaw0l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCcVaw0l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC6FC2BCB8;
	Mon,  4 May 2026 16:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777913916;
	bh=kd80XGcTsGOTeH4ZW65LZWN5IuJE7lA+8m9SrHNcJEk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bCcVaw0lcloaMCl6WUURMt6ULxJYqjSXbTsHUDIMD980/kemdnInOgyfHSX8fLznA
	 JGMmqc4pVqBwySOsGhiSUSfLvunY4lw+GMjEMc+zxoggAPOieVpuqCyX98iHAf6sqx
	 6yKvv/aLG2suMQmsGDkbi+6jIsL+jFnrPkZwhXZ6ijAfs7b3vuRSrfLTYJ+EhAZ1v8
	 /GjmAiGSeih10uDbkGBV+84BJkm0y2s7MyuLeLbdW0wWKkGPya7JW0gDVwoEX05v/3
	 uzVDHIz3CW9RmFfF/NgAXxb0mFkTSBzfH0/dVik/Vpy8YCpKr34kGFkvnDCzdAbwwC
	 Ng5hu9/Pq2ZiQ==
Message-ID: <f86d9af4-6415-427a-9f4e-639b2ae6203e@kernel.org>
Date: Mon, 4 May 2026 11:58:34 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module
 argument
Content-Language: en-US
To: Daniel Gibson <daniel@gibson.sh>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-3-daniel@gibson.sh>
 <47b51431-fc8d-425f-a9e0-44ed75399151@kernel.org>
 <d4f718ed-0d9e-4832-b9af-1adb539e0830@gibson.sh>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <d4f718ed-0d9e-4832-b9af-1adb539e0830@gibson.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/26 10:38, Daniel Gibson wrote:
> On 04.05.26 16:37, Mario Limonciello wrote:
>> On 4/30/26 22:26, Daniel Gibson wrote:
> (...)
>>> +static int delay_suspend = -1;
>>> +module_param(delay_suspend, int, 0644);
>>> +MODULE_PARM_DESC(delay_suspend,
>>> +                "Delays s2idle by 2.5 seconds to work around buggy
>>> ECs, often causing keyboard issues after suspend. 0: don't delay, 1:
>>> do delay, -1 (default): let amd_pmc decide. If you need this please
>>> report this to: platform-driver-x86@vger.kernel.org");
>>> +
>>>    static struct amd_pmc_dev pmc;
>>
>> Generally speaking; I don't like new module parameters.
>>
>> Since this is purely for debugging purposes and is going to hopefully
>> lead to a new patch; how about if it's done in debugfs?
>>
>> I have a couple reasons I say this.
>>
>> 1. If you make it "too easy" to make the kernel command line permanent
>> people won't report bugs and they never get fixed.
> 
> Sorry, I don't think this makes a difference.

OK.  I'd say up to the driver maintainers to decide which way to go.

> Even people using a bleeding-edge distro like Arch Linux will have to
> wait at least a month or so after reporting their device until a stable
> kernel with that quirk is released and that kernel lands in their
> distro. Much longer for users of more traditional distros.
> 
> No one wants to have a broken laptop for months if it can be avoided, so
> they'd make that workaround permanent either way, it's just more
> annoying to do when it's in debugfs.
> 
> If someone reports the bug it's because they think it's the right thing
> to do (and maybe because the module parameter or dmesg message asked
> them to), not because the workaround requires a systemd unit instead of
> a kernel parameter.
> 
>>
>> 2. It needs to become ABI essentially forever, even if we found out some
>> day this was actually something we can fix with other kernel changes
>> instead.
> 
> Does it? prefer_microsoft_dsm_guid was removed, did that break anything?

Very good point.

> 
>>
>> But then the problem arguing in the direction of a module parameter is
>> discoverability of this debugging knob.  And for that; I would suggest
>> to add a bullet here: https://docs.kernel.org/arch/x86/amd-debugging.html
>>
>> Then when people report this problem we can point them to that document
>> indicating they can use it.
> 
> So far I've missed that document - it certainly looks like a good place
> to document the issue and workaround.

Yeah; whatever direction is agreed upon (module parameter or debugfs), 
please update the document for a section about it.

> 
> Side-Note: "18.10. Random reboot issues" sounds interesting, I guess it
> would be helpful to document how that value can be read or identified in
> dmesg ;)

"This information is read by the kernel at bootup and printed into the 
syslog".

Do you mean actually outputting the prefix of the message in this document?

This is a sample message from my local machine.

x86/amd: Previous system reset reason [0x00080800]: software wrote 0x6 
to reset control register 0xCF9

I have no qualms with this - feel free to send a patch if you're 
touching it already anyways.

> 
>>
>>>
>>>    static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int
>>> reg_offset)
>>> @@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
>>>           struct amd_pmc_dev *pdev = &pmc;
>>>           struct smu_metrics table;
>>>           int rc;
>>> -       bool ec_needs_sleep = !disable_workarounds &&
>>> amd_pmc_quirk_need_suspend_delay(pdev);
>>> +       bool ec_needs_sleep;
>>> +
>>> +       if (delay_suspend < 0)
>>> +               ec_needs_sleep = !disable_workarounds &&
>>> amd_pmc_quirk_need_suspend_delay(pdev);
>>> +       else
>>> +               ec_needs_sleep = delay_suspend != 0;
>>>
>>>           /* Avoid triggering OVP */
>>>           if (ec_needs_sleep || (!get_metrics_table(pdev, &table) &&
>>> table.s0i3_last_entry_status)) {
>>> -               dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid
>>> platform bug\n");
>>> +               if (delay_suspend > 0)
>>> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s
>>> because delay_suspend=1\n");
>>
>> Rather than telling them to report to platform-driver-x86@ in the module
>> parameter description I would suggest you should be putting it in this
>> message.  I think that's what some other drivers do when they want
>> people to report bugs.
> 
> Great idea!
> 
>>
>>> +               else
>>> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s
>>> to avoid platform bug\n");
>>>                   msleep(2500);
>>>           }
>>>
>>> -- 
>>> 2.48.1
>>>
>>
> 

