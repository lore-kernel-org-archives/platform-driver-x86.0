Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF1F2FDC3D
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 18:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771870532; cv=none; b=lbDMqsG17pBsF2uLU8le3Udsv7Sa03TrzcAd5Mb6WUxSldHrTqP0WXMzYusMTl6uckMUksbYz98J+WtVRmlZxMH438LzOONNbevjpccBQ3+NWFGohIFzJuLL2AkjUZkip7ubNl/Q91io0Kw1YJNBc4WwJ8/vR/xgIlZJPngusgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771870532; c=relaxed/simple;
	bh=I4PyE9iuevwFBIyJ7eWDhT3HPIXX4hHvFOkotFK6RgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwzEopgoq9HfUGxw9UW3QJQEt034TyPWvyXuys6RqIGL9bBOvQiQDXZBBm6i7RAy/dPy8zBMErLyox/3YCT2EwV9YEmnNllc2r5DqbDgBrhLVbVb0QF5kShUJ+2j9i70hH+w4tDY1NDiExg3AgWp3th/dleDZRhzbuFzvT6viv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FpchDwUP; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FpchDwUP"
Message-ID: <d42c4be9-5c2b-498a-b2dd-ac672c926c9b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771870527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GlsdnBXHCqaciTaTd+vybF5z+Z5QUG477ZpVZ7EF9o0=;
	b=FpchDwUPh5uu82JUFayg0/RooSvNVRIw6IWq2pKW6P4zK3G3eGYpId4Uvg5S1+LS3kSIG7
	vsQ0Wg56eaOuqRkFV2mpZMjRpD5kJPXJdYljLCoyiTpJLDxa+Cf3VzZducpPe9dBk88Rvq
	keLoHBJSkm+KjByy/r2QV3DZObTSO7o=
Date: Mon, 23 Feb 2026 19:15:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: adjust screenpad
 power/brightness handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>, Denis Benato <benato.denis96@gmail.com>
References: <20260212220252.1526337-1-denis.benato@linux.dev>
 <20260212220252.1526337-2-denis.benato@linux.dev>
 <71a3278d-d814-87cf-40cc-95bca45146e9@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <71a3278d-d814-87cf-40cc-95bca45146e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2/23/26 15:38, Ilpo Järvinen wrote:
> On Thu, 12 Feb 2026, Denis Benato wrote:
>
>> Fix illogical screen off control by hardcoding 0 and 1 depending on the
>> requested brightness and also do not rely on the last screenpad
>> power state to issue screen brightness commands.
> Should this have a Fixes tag?
>
Same for the other patch: I am not sure.

What I know for certain is that Luke had an asus DUO to test this patch with
and most certainly it was because someone contacted him about these bugs.

I split up commits found int the previous version of this patch:
https://lore.kernel.org/all/20250525204214.104030-1-luke@ljones.dev/

I changed nothing else beside removing a redundant variable assignment.
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> Signed-off-by: Luke Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 34 +++++++++++++--------------------
>>  1 file changed, 13 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 0775fadedd10..4130dae37e15 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -4254,32 +4254,24 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>>  
>>  static int update_screenpad_bl_status(struct backlight_device *bd)
>>  {
>> -	struct asus_wmi *asus = bl_get_data(bd);
>> -	int power, err = 0;
>> -	u32 ctrl_param;
>> +	int err = 0;
>> +	u32 ctrl_param = bd->props.brightness;
> Please retain reverse xmas-tree order.
>
>>  
>> -	power = read_screenpad_backlight_power(asus);
>> -	if (power < 0)
>> -		return power;
>> +	if (ctrl_param >= 0 && bd->props.power) {
>> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>> +		if (err < 0)
>> +			return err;
>>  
>> -	if (bd->props.power != power) {
>> -		if (power != BACKLIGHT_POWER_ON) {
>> -			/* Only brightness > 0 can power it back on */
>> -			ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
>> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
>> -						    ctrl_param, NULL);
>> -		} else {
>> -			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>> -		}
>> -	} else if (power == BACKLIGHT_POWER_ON) {
>> -		/* Only set brightness if powered on or we get invalid/unsync state */
>> -		ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>> +		if (err < 0)
>> +			return err;
>>  	}
>>  
>> -	/* Ensure brightness is stored to turn back on with */
>> -	if (err == 0)
>> -		asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>> +	if (!bd->props.power) {
>> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>> +		if (err < 0)
>> +			return err;
>> +	}
>>  
>>  	return err;
>>  }
>>
