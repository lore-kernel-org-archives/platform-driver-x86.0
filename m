Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE7033A9C2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771965749; cv=none; b=XG2k1JnTQGfDEv4MJuGYmYvczzFiBxzUilXDHT9fmdQoHZH7hlFwYgGQSVRNzmudcg+qsjHtpjwR0dt6yOnFSPS8SQUNBjjtTF0BDkKdRku+JHiUF69BqThCEnaqHGH3zAtrPLJ9fLgRxQPpAXjDuZKblUS8E8K3wyAyN+yeK3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771965749; c=relaxed/simple;
	bh=0tWKDLXH5pjJjdm4JUmWcf2poAKaDppQaV5hVxPlS9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aDooykfiHz0liPVXFcAYEdm7owoaUy3Dmic8C+1eh8mswxOo1AHSJKC36PvTxM8merolEJt8p4rUCvYencSkjgkp3b94pGu1TpPC1wj/Kk4CE+Gih4KTfBPqsNJtwvIxoTy/G8+lhBMevTdCgtZF2bO+9+/i8WRqeNABRSVsqqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=M6fEORoN; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="M6fEORoN"
Message-ID: <970c8b24-5653-44b1-9e3b-147b88402b5e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1771965745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FTEfofeNEQ5tW/+zbDFfgCF9+qBwObxXv1T9PObcjIM=;
	b=M6fEORoNny7ZD/F//JJSpJTV3OORUkByUBVyqWES1a1wmrDb6G0NVermiXmEzPRe6F4MOx
	/kXH7eDKsRVXoAsgoeIXLnPVbyPX8keFdNfzjl4z0efe96ePeVs4Sm7AHzIxNhhIr894rO
	a8E4QljiG2g3HyWxmNlMqmv6wJ36MVs=
Date: Tue, 24 Feb 2026 21:42:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] platform/x86: asus-wmi: adjust screenpad
 power/brightness handling
To: luke@ljones.dev
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, Mateusz Schyboll <dragonn@op.pl>,
 Denis Benato <benato.denis96@gmail.com>
References: <20260212220252.1526337-1-denis.benato@linux.dev>
 <20260212220252.1526337-2-denis.benato@linux.dev>
 <71a3278d-d814-87cf-40cc-95bca45146e9@linux.intel.com>
 <d42c4be9-5c2b-498a-b2dd-ac672c926c9b@linux.dev>
 <A9EAA5AA-4B79-4B66-9B24-A0178D365F64@ljones.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <A9EAA5AA-4B79-4B66-9B24-A0178D365F64@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 2/24/26 05:15, luke@ljones.dev wrote:
>> On 24 Feb 2026, at 07:15, Denis Benato <denis.benato@linux.dev> wrote:
>>
>>
>> On 2/23/26 15:38, Ilpo Järvinen wrote:
>>> On Thu, 12 Feb 2026, Denis Benato wrote:
>>>
>>>> Fix illogical screen off control by hardcoding 0 and 1 depending on the
>>>> requested brightness and also do not rely on the last screenpad
>>>> power state to issue screen brightness commands.
>>> Should this have a Fixes tag?
>>>
>> Same for the other patch: I am not sure.
> It probably should be a fixes tag. Though there is no reference bug report or
> other relating to it - only my discovery that the previously written code was in 
> fact not right.
>
> I had written the initial version that is in the kernel based on some limited testing
> feedback from a user who was not able to clearly articulate what the issues
> were and was happy with the final result.
>
> I was able to get my hands on a Zenbook Duo and fully test this, which is how
> I discovered the issues.
Actually... my bad. I confused "Closes" with "Fixes". Ilpo meant to reference the original commit.

Sorry for the noise. I will dig those two tags.
>> What I know for certain is that Luke had an asus DUO to test this patch with
>> and most certainly it was because someone contacted him about these bugs.
>>
>> I split up commits found int the previous version of this patch:
>> https://lore.kernel.org/all/20250525204214.104030-1-luke@ljones.dev/
> Thanks for doing this. I just have not had any time to do it myself, very low on
> the priority list but I would wager getting this all fixed correctly will enable both
> Older and newer models to function how they should.
>
>> I changed nothing else beside removing a redundant variable assignment.
>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>> Signed-off-by: Luke Jones <luke@ljones.dev>
>>>> ---
>>>> drivers/platform/x86/asus-wmi.c | 34 +++++++++++++--------------------
>>>> 1 file changed, 13 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>> index 0775fadedd10..4130dae37e15 100644
>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>> @@ -4254,32 +4254,24 @@ static int read_screenpad_brightness(struct backlight_device *bd)
>>>>
>>>> static int update_screenpad_bl_status(struct backlight_device *bd)
>>>> {
>>>> - struct asus_wmi *asus = bl_get_data(bd);
>>>> - int power, err = 0;
>>>> - u32 ctrl_param;
>>>> + int err = 0;
>>>> + u32 ctrl_param = bd->props.brightness;
>>> Please retain reverse xmas-tree order.
>>>
>>>> - power = read_screenpad_backlight_power(asus);
>>>> - if (power < 0)
>>>> - return power;
>>>> + if (ctrl_param >= 0 && bd->props.power) {
>>>> + err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
>>>> + if (err < 0)
>>>> + return err;
>>>>
>>>> - if (bd->props.power != power) {
>>>> - if (power != BACKLIGHT_POWER_ON) {
>>>> - /* Only brightness > 0 can power it back on */
>>>> - ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
>>>> - err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
>>>> -    ctrl_param, NULL);
>>>> - } else {
>>>> - err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>>>> - }
>>>> - } else if (power == BACKLIGHT_POWER_ON) {
>>>> - /* Only set brightness if powered on or we get invalid/unsync state */
>>>> - ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>>>> err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
>>>> + if (err < 0)
>>>> + return err;
>>>> }
>>>>
>>>> - /* Ensure brightness is stored to turn back on with */
>>>> - if (err == 0)
>>>> - asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
>>>> + if (!bd->props.power) {
>>>> + err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
>>>> + if (err < 0)
>>>> + return err;
>>>> + }
>>>>
>>>> return err;
>>>> }
>>>>
