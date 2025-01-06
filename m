Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CB62BD10;
	Mon,  6 Jan 2025 12:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167968; cv=none; b=jvzKp7Aj2cTXiX5PXa2wydN/ITK0xN6LbWcQVgaV4xUssXtOjvY6yHLllse+Qd3r3+y/8vBsWyoTvocWpvvxeGhRjFCaq5cGMy7LPaS3zwdls3u7OcjN8/z1E82yxnbytwkkhS75efKkwB/smAkm4edxD5tQRzNO/0gDxAREkok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167968; c=relaxed/simple;
	bh=Mw4xggiZMbX51/L/5HGde+rmk/Ma5fg9y5H/tgPoiho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNfqjk8bi9npDhxFvzJQa+zfY9pXDAN4EQ57ROsugUmfTFcS087e11N/8szt1UcNm+YkGFAfXKMlYM0oU08deDy3GKN7UQT5q9B3l6Qvqq2vY5m0prQJlZOwCbzgKhDNFQnNVmB8lVGdcUAbl8Pw9ZnQkByOjHONXmi5xbQ6KtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPV6:2409:8a00:7871:c6f0:b2b0:56ba:cc94:ba4] (unknown[2409:8A00:7871:C6F0:B2B0:56BA:CC94:BA4])
	by rmsmtp-lg-appmail-29-12034 (RichMail) with SMTP id 2f02677bd14bce8-86527;
	Mon, 06 Jan 2025 20:49:26 +0800 (CST)
X-RM-TRANSID:2f02677bd14bce8-86527
Message-ID: <da1959f2-a30e-45b4-bf64-2d413254d7bc@139.com>
Date: Mon, 6 Jan 2025 20:49:20 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH v2] ALSA: hda: Support for Ideapad hotkey
 mute LEDs
To: Takashi Iwai <tiwai@suse.de>, Jackie EG1 Dong <dongeg1@lenovo.com>
Cc: "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "bo.liu@senarytech.com" <bo.liu@senarytech.com>,
 "kovalev@altlinux.org" <kovalev@altlinux.org>,
 "me@oldherl.one" <me@oldherl.one>,
 "jaroslaw.janik@gmail.com" <jaroslaw.janik@gmail.com>,
 "songxiebing@kylinos.cn" <songxiebing@kylinos.cn>,
 "kailang@realtek.com" <kailang@realtek.com>,
 "sbinding@opensource.cirrus.com" <sbinding@opensource.cirrus.com>,
 "simont@opensource.cirrus.com" <simont@opensource.cirrus.com>,
 "josh@joshuagrisham.com" <josh@joshuagrisham.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
 "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>
References: <20241224083316.20222-1-xy-jackie@139.com>
 <87ikr2dfnc.wl-tiwai@suse.de>
 <SEYPR03MB8067D30F466738C51808461995092@SEYPR03MB8067.apcprd03.prod.outlook.com>
 <87o70oylir.wl-tiwai@suse.de>
Content-Language: en-US
From: Jackie Dong <xy-jackie@139.com>
In-Reply-To: <87o70oylir.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025/1/3 23:17, Takashi Iwai wrote:
> On Mon, 30 Dec 2024 01:33:01 +0100,
> Jackie EG1 Dong wrote:
>>
>>> On Tue, 24 Dec 2024 09:33:16 +0100,
>>   > Jackie Dong wrote:
>>   >>
>>   >> --- a/sound/pci/hda/patch_realtek.c
>>   >> +++ b/sound/pci/hda/patch_realtek.c
>>   >> @@ -6934,6 +6934,16 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>   >>   	hda_fixup_thinkpad_acpi(codec, fix, action);
>>   >>   }
>>   >>
>>   >> +/* for hda_fixup_ideapad_acpi() */
>>   >> +#include "ideapad_hotkey_led_helper.c"
>>   >> +
>>   >> +static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>   >> +				   const struct hda_fixup *fix, int action)
>>   >> +{
>>   >> +	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>>   >> +	hda_fixup_ideapad_acpi(codec, fix, action);
>>   >> +}
>>   >
>>   > So this unconditionally call alc_fixup_no_shutup(), and this  > introduces another behavior to the existing entry -- i.e. there is a  > chance of breakage.
>>   >
>>   > If we want to be very conservative, this call should be limited to  > Ideapad.
>>   > For alc_fixup_no_shutup(codec, fix, action),
>>   I want to keep same behavior with alc_fixup_thinkpad_apci() and alc_fixup_idea_acpi() for one sound card. So, I add alc_fixup_no_shutup() in alc_fixup_ideapad_acpi().
>> ----------Related source code of patch_reatek.c are FYR as below.
>> static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>                                       const struct hda_fixup *fix, int
>> action)
>> {
>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>>           hda_fixup_thinkpad_acpi(codec, fix, action); }
>>
>> /* for hda_fixup_ideapad_acpi() */
>> #include "ideapad_hotkey_led_helper.c"
>>
>> static void alc_fixup_ideapad_acpi(struct hda_codec *codec,
>>                                      const struct hda_fixup *fix, int action) {
>>           alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>>           hda_fixup_ideapad_acpi(codec, fix, action);
>> }
> 
> Oh yeah, but then it can be bad in other way round; the chain call of
> alc_fixup_thinkpad_acpi() contains alc_fixup_no_shutup() and the
> alc_fixup_ideadpad_acpi() also contains alc_fixup_no_shutup().
> That is, alc_fixup_no_shutup() will be called twice for Thinkpad.
> 
Many thanks to Takashi for your detail comments  and sample code, I 
understand it now.

I'll check the logic of the code and update the patch later.

Best Regards,

Jackie Dong
> Instead, you can change like:
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6925,11 +6925,16 @@ static void alc285_fixup_hp_envy_x360(struct hda_codec *codec,
>   /* for hda_fixup_thinkpad_acpi() */
>   #include "thinkpad_helper.c"
>   
> -static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
> -				    const struct hda_fixup *fix, int action)
> +/* for hda_fixup_ideapad_acpi() */
> +#include "ideapad_hotkey_led_helper.c"
> +
> +/* generic fixup for both Lenovo Thinkpad and Ideapad */
> +static void alc_fixup_xpad_acpi(struct hda_codec *codec,
> +				const struct hda_fixup *fix, int action)
>   {
>   	alc_fixup_no_shutup(codec, fix, action); /* reduce click noise */
>   	hda_fixup_thinkpad_acpi(codec, fix, action);
> +	hda_fixup_ideapad_acpi(codec, fix, action);
>   }
>   
>   /* Fixup for Lenovo Legion 15IMHg05 speaker output on headset removal. */
> @@ -8321,7 +8326,7 @@ static const struct hda_fixup alc269_fixups[] = {
>   	},
>   	[ALC269_FIXUP_THINKPAD_ACPI] = {
>   		.type = HDA_FIXUP_FUNC,
> -		.v.func = alc_fixup_thinkpad_acpi,
> +		.v.func = alc_fixup_xpad_acpi,
>   		.chained = true,
>   		.chain_id = ALC269_FIXUP_SKU_IGNORE,
>   	},
> 
> Since hda_fixup_ideapad_acpi() is NOP except for Ideapad, this
> shouldn't break other models, while it covers the Ideadpad now.
> 
> 
> thanks,
> 
> Takashi


