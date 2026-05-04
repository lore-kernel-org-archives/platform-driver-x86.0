Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09166214813
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 May 2026 15:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777909650; cv=none; b=J4kYWSHpDQX55OLFwyH5KtezFqiDZnzre+oTFIh2yUpytAYnFBT/9cNM9txBP/jTuXVErHvoVMVYo3cXKg5pTo+6K3deo5jnU59SNgY1Win6WQFIqFElwlRVsh8McmfcNShsSVCdbjx2g2J9Nj6Rza0O6DzLj0d50UkouJpHS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777909650; c=relaxed/simple;
	bh=XwiZdgxMtVwxZWF00QRO1oI72YTjJQcQUurfM9XWnHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BOSiFsB7ZXrUCzw8nBeKSb8JvuGceK3BfxKX7yIpt6GYgRIelKUBtkuNpX2+3SgyGOL0VAfR0Lwglhy7D0o9pgpIGBkMi8nhHNlfr7TgFlnpizDSggHHE618BRy6WBetF++ipSdiiHU1wsXc/7HgSA1ZeGxItcdVjCbM1ETtT/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=UNP1wtSz; arc=none smtp.client-ip=83.166.143.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="UNP1wtSz"
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4g8QmJ2BRXzDDj;
	Mon,  4 May 2026 17:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1777909136;
	bh=lEF9XsLpEb/F2zvIHQM3sQ4+w9Bz+dRqAQ8QD5gtLUk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=UNP1wtSzUB+NDiKfWEHU8Lmp4EeUQsA1LWQ2v51Vykxlq3iSUBzCU38a0cIC5ixLy
	 MYt+v838QlWbSW2FDHo3nPZR86JkTbgXQa52uxqubx4CS7GujD8CravVxm4UGl06he
	 RsPnlJ1rIIJedjsnxxR2qNK8hQLIRkmOBQ2nlM95UW8V555KvOmPTjkKqG7ni/q5Cp
	 +qt8YRYuUCZugh6xr7ZcmfIkhDGXFDkxx+zuTGFhu3sIibf7XhQSWdXDHfKjXOw/MK
	 L0AMb9cty+y6vsrvgsdIHCUwa5qnbitLuw/P14v72OSbDrrprd2ggiUoi1qBumlQRM
	 U8PFPmVsEPicg==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4g8QmG6LqjzFnG;
	Mon,  4 May 2026 17:38:54 +0200 (CEST)
Message-ID: <d4f718ed-0d9e-4832-b9af-1adb539e0830@gibson.sh>
Date: Mon, 4 May 2026 17:38:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmc: Add delay_suspend module
 argument
To: Mario Limonciello <superm1@kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260501032655.283789-1-daniel@gibson.sh>
 <20260501032655.283789-3-daniel@gibson.sh>
 <47b51431-fc8d-425f-a9e0-44ed75399151@kernel.org>
Content-Language: de-DE, en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <47b51431-fc8d-425f-a9e0-44ed75399151@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

On 04.05.26 16:37, Mario Limonciello wrote:
> On 4/30/26 22:26, Daniel Gibson wrote:
(...)
>> +static int delay_suspend = -1;
>> +module_param(delay_suspend, int, 0644);
>> +MODULE_PARM_DESC(delay_suspend,
>> +                "Delays s2idle by 2.5 seconds to work around buggy
>> ECs, often causing keyboard issues after suspend. 0: don't delay, 1:
>> do delay, -1 (default): let amd_pmc decide. If you need this please
>> report this to: platform-driver-x86@vger.kernel.org");
>> +
>>   static struct amd_pmc_dev pmc;
> 
> Generally speaking; I don't like new module parameters.
> 
> Since this is purely for debugging purposes and is going to hopefully
> lead to a new patch; how about if it's done in debugfs?
> 
> I have a couple reasons I say this.
> 
> 1. If you make it "too easy" to make the kernel command line permanent
> people won't report bugs and they never get fixed.

Sorry, I don't think this makes a difference.
Even people using a bleeding-edge distro like Arch Linux will have to
wait at least a month or so after reporting their device until a stable
kernel with that quirk is released and that kernel lands in their
distro. Much longer for users of more traditional distros.

No one wants to have a broken laptop for months if it can be avoided, so
they'd make that workaround permanent either way, it's just more
annoying to do when it's in debugfs.

If someone reports the bug it's because they think it's the right thing
to do (and maybe because the module parameter or dmesg message asked
them to), not because the workaround requires a systemd unit instead of
a kernel parameter.

> 
> 2. It needs to become ABI essentially forever, even if we found out some
> day this was actually something we can fix with other kernel changes
> instead.

Does it? prefer_microsoft_dsm_guid was removed, did that break anything?

> 
> But then the problem arguing in the direction of a module parameter is
> discoverability of this debugging knob.  And for that; I would suggest
> to add a bullet here: https://docs.kernel.org/arch/x86/amd-debugging.html
> 
> Then when people report this problem we can point them to that document
> indicating they can use it.

So far I've missed that document - it certainly looks like a good place
to document the issue and workaround.

Side-Note: "18.10. Random reboot issues" sounds interesting, I guess it
would be helpful to document how that value can be read or identified in
dmesg ;)

> 
>>
>>   static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int
>> reg_offset)
>> @@ -634,11 +639,19 @@ static void amd_pmc_s2idle_check(void)
>>          struct amd_pmc_dev *pdev = &pmc;
>>          struct smu_metrics table;
>>          int rc;
>> -       bool ec_needs_sleep = !disable_workarounds &&
>> amd_pmc_quirk_need_suspend_delay(pdev);
>> +       bool ec_needs_sleep;
>> +
>> +       if (delay_suspend < 0)
>> +               ec_needs_sleep = !disable_workarounds &&
>> amd_pmc_quirk_need_suspend_delay(pdev);
>> +       else
>> +               ec_needs_sleep = delay_suspend != 0;
>>
>>          /* Avoid triggering OVP */
>>          if (ec_needs_sleep || (!get_metrics_table(pdev, &table) &&
>> table.s0i3_last_entry_status)) {
>> -               dev_info(pdev->dev, "Delaying suspend by 2.5s to avoid
>> platform bug\n");
>> +               if (delay_suspend > 0)
>> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s
>> because delay_suspend=1\n");
> 
> Rather than telling them to report to platform-driver-x86@ in the module
> parameter description I would suggest you should be putting it in this
> message.  I think that's what some other drivers do when they want
> people to report bugs.

Great idea!

> 
>> +               else
>> +                       dev_info(pdev->dev, "Delaying suspend by 2.5s
>> to avoid platform bug\n");
>>                  msleep(2500);
>>          }
>>
>> -- 
>> 2.48.1
>>
> 

