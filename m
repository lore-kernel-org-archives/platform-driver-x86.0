Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3602F693B;
	Fri,  3 Jul 2026 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783101911; cv=none; b=p2g8PcnNBk9wJ+SE758cgqenmUDZaGxLY5q6D7gtxjOYyHPUPjnE86iwZEAcQn0lHzbfDEHbqVChk3TgDqn/mBBMKKP+p2hJbYL9vXY4tFJGYKwuChFYyjDM3zasJESfKPqcKaYt6eJJpa/1JqE+8Ny79WfyuAiGI3bPIvMT0KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783101911; c=relaxed/simple;
	bh=881Fp+PKxINFqKB0XdKTNIkFSshd1mM/iJgHKdc+JNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CoGW0VMDTV4j2H4WdezEDODERmLo66QwyMjdNg9BuLCq8ZtfoQyt0wfIrvJZAMePqMGpvrKKOxhvzWr6REpgmZK19adryAOHUTrgY/SlxhlswMB3aEdq3hO1HgLyYHlv6fbUPI9A+e6L22RaZpqMT3/bDQHahXJw7cljA87W3rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pBubMqjA; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pBubMqjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783101900; x=1783706700; i=w_armin@gmx.de;
	bh=aDZouihMkUtvoLLyI2zuE9+WFKWc1TGURfLM+PccBGI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pBubMqjA/ZZNxmZLDXtlspSSblkTyGxO2LLxTh0xAO2+kbNoka91MoL6rQ6jXy4o
	 sJZV2Sycmo5hwYIPI3Ar/uKqT20wXI4ZpfA1+n/Pzgfw4a5fcxX3WwyvR1ofBEd22
	 5KjebHCEjD7W6VSZfbq9sz6WXrhRGXIQQjAFmwQxO2FivZbVFkMcgX2OKLrq/aovY
	 ODdiHPSPlzCxGU4nl2DcMOFuac4ccWAr0nXN5uEEWXiNUH/zmZVAv8ztkrvn0WIgh
	 21Hp0t1vH4UQFgAx5biL9sdBs4zepANGCOuBXmxS7jKcau8UPxBDv1pDXEs89KNku
	 6PbZvghFg1i2JGRCxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDywo-1wnNlo378m-002E0o; Fri, 03
 Jul 2026 20:05:00 +0200
Message-ID: <168cf7a0-7668-4f58-994a-d7d61bd3d414@gmx.de>
Date: Fri, 3 Jul 2026 20:05:00 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] platform/x86: lg-laptop: Fix keyboard backlight
 support on LG Gram 16T90SP
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: matan@svgalib.org, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20260622193914.116999-1-W_Armin@gmx.de>
 <20260622193914.116999-6-W_Armin@gmx.de>
 <6d134940-9dba-cc0d-dfb0-a375c4071310@linux.intel.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <6d134940-9dba-cc0d-dfb0-a375c4071310@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qjzO9wzUeBHk5dfY4N4srU4dsW/i+aQ/cvhnQHX6KWGkHsxzeRN
 LB8Oz68H/9gQ4N2oNxtKVTUBaB+mL/RfUlo950Di8pC8/PvzeDsboGk16MTv919j5x35pja
 6e03NSZohS+kyPLUNHbvhMmHwnJwf14IFb2sI7Kur9bGrwQZYLtwuwqIZt3z1U5EqM9g6w7
 qUI5mV5Kj8OjytdgPR7vQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tkw6TDVi728=;REGNgQM8MkUaOYU+0+hPF85eJzi
 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
 /Osn0c9qGbtEuh2wpk=

Am 03.07.26 um 15:22 schrieb Ilpo J=C3=A4rvinen:

> On Mon, 22 Jun 2026, Armin Wolf wrote:
>
>> On the LG Gram 16T90SP, the ACPI firmware will only accept the values
>> 0x80, 0xA2 and 0xA4 when setting the keyboard backlight. After a bit
>> of research using ACPI tables from older models it seems that bit 8
>> is supposed to be always written as 1.
>>
>> Fix the keyboard backlight support on this model by always setting
>> bit 8 inside the argument passed to the WMAB ACPI control method.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   drivers/platform/x86/lg-laptop.c | 47 ++++++++++++++++++++++++-------=
-
>>   1 file changed, 36 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg=
-laptop.c
>> index d1b33a6b5206..22f8a6368f7c 100644
>> --- a/drivers/platform/x86/lg-laptop.c
>> +++ b/drivers/platform/x86/lg-laptop.c
>> @@ -86,6 +86,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmw=
are debug messages");
>>   #define WMBB_USB_CHARGE 0x10B
>>   #define WMBB_BATT_LIMIT 0x10C
>>  =20
>> +#define KBD_LED_BRIGHTNESS_MASK GENMASK(4, 0)
>> +#define KBD_LED_BRIGHTNESS_OFF	0x0
>> +#define KBD_LED_BRIGHTNESS_HALF 0x2
>> +#define KBD_LED_BRIGHTNESS_FULL 0x4
>> +#define KBD_LED_MODE_MASK	GENMASK(6, 5)
> bits.h needed.

Already exists.

>> +#define KBD_LED_MODE_OFF	0x0
>> +#define KBD_LED_MODE_ON		0x1
>> +#define KBD_LED_STATUS		BIT(7)
>> +#define KBD_LED_MAGIC_MASK	GENMASK(15, 8)
>> +/* Exact purpose is unknown, maybe some sort of brightness limit? */
>> +#define KBD_LED_MAGIC		0x05
>> +
>>   #define FAN_MODE_LOWER GENMASK(1, 0)
>>   #define FAN_MODE_UPPER GENMASK(5, 4)
>>  =20
>> @@ -601,15 +613,25 @@ static LED_DEVICE(tpad_led, 1, 0);
>>   static void kbd_backlight_set(struct led_classdev *cdev,
>>   			      enum led_brightness brightness)
>>   {
>> -	u32 val;
>> +	/* Must always be written */
>> +	u32 value =3D KBD_LED_STATUS;
>> +	u32 mode, bright;
>> +
>> +	if (brightness <=3D LED_OFF) {
>> +		mode =3D KBD_LED_MODE_OFF;
>> +		bright =3D KBD_LED_BRIGHTNESS_OFF;
>> +	} else {
>> +		mode =3D KBD_LED_MODE_ON;
>> +		if (brightness >=3D LED_FULL)
>> +			bright =3D KBD_LED_BRIGHTNESS_FULL;
>> +		else
>> +			bright =3D KBD_LED_BRIGHTNESS_HALF;
>> +	}
>>  =20
>> -	val =3D 0x22;
>> -	if (brightness <=3D LED_OFF)
>> -		val =3D 0;
>> -	if (brightness >=3D LED_FULL)
>> -		val =3D 0x24;
>> +	value |=3D FIELD_PREP(KBD_LED_BRIGHTNESS_MASK, bright);
>> +	value |=3D FIELD_PREP(KBD_LED_MODE_MASK, mode);
>>  =20
>> -	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, val);
>> +	lg_wmab_set(cdev->dev->parent, WM_KEY_LIGHT, value);
>>   }
>>  =20
>>   static enum led_brightness get_kbd_backlight_level(struct device *dev=
)
>> @@ -621,13 +643,16 @@ static enum led_brightness get_kbd_backlight_leve=
l(struct device *dev)
>>   	if (ret < 0)
>>   		return LED_OFF;
>>  =20
>> -	if ((value & 0xFF00) !=3D 0x0500)
>> +	if (FIELD_GET(KBD_LED_MAGIC_MASK, value) !=3D KBD_LED_MAGIC)
>> +		return LED_OFF;
>> +
>> +	if (FIELD_GET(KBD_LED_MODE_MASK, value) =3D=3D KBD_LED_MODE_OFF)
>>   		return LED_OFF;
>>  =20
>> -	switch (value & 0x27) {
>> -	case 0x24:
>> +	switch (FIELD_GET(KBD_LED_BRIGHTNESS_MASK, value)) {
>> +	case KBD_LED_BRIGHTNESS_FULL:
>>   		return LED_FULL;
>> -	case 0x22:
>> +	case KBD_LED_BRIGHTNESS_HALF:
>>   		return LED_HALF;
>>   	default:
>>   		return LED_OFF;
> Superb, I was already wanting to see this in patch 4 but had enough
> patience to look the subsequent patch first. Thanks for naming them!

Thanks :)

Armin Wolf

