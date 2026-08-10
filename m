Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE07935C68E;
	Mon, 10 Aug 2026 13:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368051; cv=none; b=myuqcFlIokxBxxSZDpGBW/78AINqNfgMfRBJzkzXrxfJKi+kXuu4Qe4k8oKZgjWMgqkgXY/Z6wtACF7nGL1/K+t5ArFRalSGHNDf9yKPJe4KYGPw9PYdNoipqHboAvZQiVetvJtjRDkJcc6odvsSf9APkqJNfXWwDa/EMkqFUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368051; c=relaxed/simple;
	bh=5IZVqHaKQI/V8krRl0V7zDi9EWwZ7/cnIgzjTHsTJz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ddMzfhnLvqceMmNhmQYWoMOFZKcHlXvqbFR7DMK3lMtN/BkknK4jYTqRHuVliTIvIJZjD1EYFC41b/VhdY0tDOaBss5wNVd5zYEtKbC0XXzzmaRfqvxMqAoEvP1ftFS4+MJwcaYUFhPMVLIc+gsvjcdr1eravYGgQugHqUybQz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dLxKRlWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dLxKRlWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D03B1F000E9;
	Mon, 10 Aug 2026 13:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786368049;
	bh=cyG4N0MlP8rMGBBcQ0mx5NOVZRbuBEPpLeZrFQ7gLPA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dLxKRlWC/KZQMAzJSo+eV5vjPcoIDFVy+rllpg4/7mLLZ6BM+dAB5nSdF0WvX6U8e
	 fHQjL+gTI/n/mhoumhYcqWnrC+Ne63xbhiLXUjWx3pjGOsCT4r1zLpGGle8AbtcyRC
	 6ZBlbRX4QNtvJ4aoMDUG1axqtkpS6yIJUHMrHrSozOGDSAz7kCSr0/Vm/I/0AXQLzy
	 ZBawuvSNsLt9Et9RF8zXNNfx3b5TAB2YnDk5r/2DDf5vBBsg/c9+Gix0WrJ3STKVvw
	 28X2RyzIWA5112C2Z1cIzG43+A+cNqZIQKx9dP5eIycgnlQJgPww91J8xkRlLplvlB
	 Xwh2NlKPNOEwg==
Message-ID: <874196d4-3d76-43ca-994e-3e272fe27df9@kernel.org>
Date: Mon, 10 Aug 2026 15:20:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: keep the lid-flip state when
 UNKNOWN is set
To: Denis Benato <denis.benato@linux.dev>,
 Robin Everaars <robineveraars@pm.me>, ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260805101502.235668-1-robineveraars@pm.me>
 <20260805101502.235668-2-robineveraars@pm.me>
 <9d712362-6630-49c1-b47a-e01afd1b23c8@linux.dev>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9d712362-6630-49c1-b47a-e01afd1b23c8@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Denis,

On 5-Aug-26 2:07 PM, Denis Benato wrote:
> 
> On 8/5/26 12:15, Robin Everaars wrote:
>> On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
>> alongside the state bit while the machine is folded. Measured on an ASUS
>> ProArt PX13 (HN7306EAC), ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000
>> open and 0x00010003 folded, that is presence | status | UNKNOWN.
>>
>> asus_wmi_get_devstate_simple() treats that bit as "the state is not known"
>> and fails the call with -ENODEV, so asus_wmi_tablet_mode_get_state()
>> discards a perfectly good state sitting in bit 0 and SW_TABLET_MODE never
>> moves.
>>
>> Add asus_wmi_tablet_sw_get_state(), which gates on the presence bit only
>> and returns the status bit. Use it from the two tablet-switch paths. Every
>> other caller of asus_wmi_get_devstate_simple() is untouched, so the change
>> is confined to the tablet switch.
> Hi Robin,
> 
> Thanks for looking into this!
>> Signed-off-by: Robin Everaars <robineveraars@pm.me>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 32 ++++++++++++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86
>> /asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 8610663b8..f68fd2bcd 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -706,12 +706,40 @@ static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>>  	input_sync(asus->inputdev);
>>  }
>>  
>> +/*
>> + * Read the lid-flip state directly rather than through
>> + * asus_wmi_get_devstate_simple().
>> + *
>> + * On some convertibles the lid-flip devstate sets ASUS_WMI_DSTS_UNKNOWN_BIT
>> + * alongside the state bit while folded. Measured on an ASUS ProArt PX13
>> + * (HN7306EAC), devid ASUS_WMI_DEVID_LID_FLIP_ROG answers 0x00010000 open and
>> + * 0x00010003 folded, i.e. presence | state | UNKNOWN. The generic helper reads
>> + * that bit as "the state is not known" and rejects the whole call with -ENODEV,
>> + * so asus_wmi_tablet_mode_get_state() discards a perfectly good state sitting in
>> + * bit 0 and the switch never moves. Only presence gates the value here, which is
>> + * safe because this path serves 
>> the tablet switch alone.
>> + */
>> +static int asus_wmi_tablet_sw_get_state(struct asus_wmi *asus, u32 dev_id)
>> +{
>> +	u32 retval;
>> +	int err;
>> +
>> +	err = asus_wmi_get_devstate(asus, dev_id, &retval);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	if (!(retval & ASUS_WMI_DSTS_PRESENCE_BIT))
>> +		return -ENODEV;
> There are FIELD_GET and many more macros to do this,
> please use those as it makes the code easier to read.

I appreciate that you are trying to help out with reviewing, but in this case this
is not good advice.

Using FIELD_GET is good advice for new code, but for an existing driver it is
more important to be consistent and so far no code in asus-wmi.c is using
FIELD_GET so adding this just makes the whole driver harder to read since
now it is mixing 2 styles.

Regards,

Hans



>> +
>> +	return !!(retval & ASUS_WMI_DSTS_STATUS_BIT);
> Same here
>> +}
>> +
>>  static void asus_wmi_tablet_sw_init(struct asus_wmi *asus, u32 dev_id, int event_code)
>>  {
>>  	struct device *dev = &asus->platform_device->dev;
>>  	int result;
>>  
>> -	result = asus_wmi_get_devstate_simple(asus, dev_id);
>> +	result = asus_wmi_tablet_sw_get_state(asus, dev_id);
>>  	if (result >= 0) {
>>  		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>>  		asus_wmi_tablet_sw_report(asus, result);
>> @@ -786,7 +814,7 @@ static void asus_wmi_tablet_mode_get_state(struct asus_wmi *asus)
>>  	if (!asus->tablet_switch_dev_id)
>>  		return;
>>  
>> -	result = asus_wmi_get_devstate_simple(asus, asus->tablet_switch_dev_id);
>> +	result = asus_wmi
>> _tablet_sw_get_state(asus, asus->tablet_switch_dev_id);
>>  	if (result >= 0)
>>  		asus_wmi_tablet_sw_report(asus, result);
>>  }

