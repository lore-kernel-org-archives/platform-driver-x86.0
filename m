Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0E41519BE
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Mar 2025 22:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742595944; cv=none; b=sE9mI+RM8Gv9zPgtGWnBhEacRcgZOClUnrT+92kaIuOvTnLnX5jAYiCq0BrHYnw7+7mFLahW7IBAHhM3+QqybfL1/P10UMIrqWwZd/G53CKULoASdwo5o4oBitZhDxNeuyk9ewVYU7N+sMwVSUZVm9ExbeKyTjPC2rQtBaURET8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742595944; c=relaxed/simple;
	bh=GEoMZMfKuQsPEPk/Xk60uuGNzU5vAi/UzTx7qJZCoRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq9oRP9NJJhdrMICmDrmwVeAFuybUX2q8Uj5tHvStekkSGmI/gzhFKThn2wa7bbFzEDRrArCKl2lGZ9ilFWjo9H7Xv2yjztC7Yw4cHNwa4dRixt+U/HZK8lwhRqjO9yUZqq1r2CWpCSq/Tec1G/ID4kwaIkZpoWhOGCAOKv6CvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/+wvPpK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/+wvPpK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC8EC4CEE3;
	Fri, 21 Mar 2025 22:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742595944;
	bh=GEoMZMfKuQsPEPk/Xk60uuGNzU5vAi/UzTx7qJZCoRY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P/+wvPpKd0O2tApVvlfu/DoUgAADaTxN08mWh8TLPjJnHjsJ05pZ5aTJ1N4tm1fJq
	 qSbrSx8O+UfUgSUa9RoUVCjO7WKU6PJmIjeHAgpIZ0uK9xlA46LWzNbpOUfU8TkfN1
	 WbDP0z56OoUl9Nuxs0dLqCvmuZOB9cLPt2sHIBjSglQW/k2+kDjfDc1qNX2S0DBz35
	 aW8ymAl2dwDa0vDN0EtjvOeB/fWSiiXLXmT8xbzrBjh1sreluzq+xkK3+ZBe9mZbqu
	 n06pEYDakcZYto8RZbZZhC6SR12PXuBr7NBPSESoBcev79tGO9o/wfK7uoUNJtvnmb
	 3Nm9L2sF7AGXA==
Message-ID: <fe47758a-ca42-41b0-92bd-4ac86e1d0a3b@kernel.org>
Date: Fri, 21 Mar 2025 17:25:41 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd: pmf: Use meta + L for screen lock
 command
To: Armin Wolf <W_Armin@gmx.de>, mario.limonciello@amd.com,
 Shyam-sundar.S-k@amd.com, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20250321193052.2973537-1-superm1@kernel.org>
 <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <3b7c719f-8aa6-424f-92a0-e2cf05b12ca0@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 3/21/25 16:16, Armin Wolf wrote:
> Am 21.03.25 um 20:30 schrieb Mario Limonciello:
> 
>> From: Mario Limonciello <mario.limonciello@amd.com>
>>
>> In practice userspace software doesn't react to KEY_SCREENLOCK by
>> default.  So any time that the PMF policies would suggest to lock
>> the screen (for example from an HPD sensor event) userspace isn't
>> configured to do it properly.
>>
>> However userspace is configured for meta + L as this is the default
>> in the ecosystem. Adjust the PMF driver to send meta + L.
> 
> Hi,
> 
> KEY_SCREENLOCK is used by other drivers too, so it would make sense
> to instead add support for KEY_SCREENLOCK to the userspace software
> instead of having this workaround inside the driver.

Right; that's actually that's the first thing I looked at when I came to 
this issue.

I had "expected" GNOME for example to work with KEY_SCREENLOCK, but even 
when you program it to do so it doesn't work.

https://gitlab.gnome.org/GNOME/mutter/-/issues/3990

The ecosystem has moved to META + L.  My last employer (Dell) I remember 
there was a FN + F key that would issue a screen lock.  It had a 
silkscreen of a lock symbol.
How did it work?  Not KEY_SCREENLOCK - it emulated META + L.

This is what works in Windows, GNOME and KDE.  So I am of the opinion 
that KEY_SCREENLOCK is likely a dinosaur that doesn't really exist anymore.

> 
> Also please add a comment explaining what meta + L is supposed to achieve.
> 

Sure if we can align on doing this I will spin a V2 with a comment 
better explaining the situation.

> Thanks,
> Armin Wolf
> 
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   drivers/platform/x86/amd/pmf/tee-if.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/ 
>> x86/amd/pmf/tee-if.c
>> index 8c88769ea1d87..2c00f2baeec7b 100644
>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>> @@ -151,7 +151,13 @@ static void amd_pmf_apply_policies(struct 
>> amd_pmf_dev *dev, struct ta_pmf_enact_
>>                   amd_pmf_update_uevents(dev, KEY_SUSPEND);
>>                   break;
>>               case 2:
>> -                amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 1);
>> +                input_report_key(dev->pmf_idev, KEY_L, 1);
>> +                input_sync(dev->pmf_idev);
>> +                input_report_key(dev->pmf_idev, KEY_L, 0);
>> +                input_sync(dev->pmf_idev);
>> +                input_report_key(dev->pmf_idev, KEY_LEFTMETA, 0);
>> +                input_sync(dev->pmf_idev);
>>                   break;
>>               default:
>>                   dev_err(dev->dev, "Invalid PMF policy system state: 
>> %d\n", val);
>> @@ -422,8 +428,9 @@ static int amd_pmf_register_input_device(struct 
>> amd_pmf_dev *dev)
>>       dev->pmf_idev->phys = "amd-pmf/input0";
>>
>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
>> -    input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
>>       input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_L);
>> +    input_set_capability(dev->pmf_idev, EV_KEY, KEY_LEFTMETA);
>>
>>       err = input_register_device(dev->pmf_idev);
>>       if (err) {

