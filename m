Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523964;
	b=pMKd/L1JswFCnRytj3/r971Xmdb/F2tubB+YQeQif4Vi8tFKr/cPs5Dm9F0obRMzvua1
	 FUpDG58l3Uooq6yjziKfCLBiq3mCjFkSgQ+gWXGpRIRzhXAjp91mrYbrsMitupFLJn0yS
	 SIDiygsCkzMgwVuxxgKY4Pwb+lEkJzp5ho9ixCabO3hFDGyf9xNa8F45wA53d37EywB/T
	 7pQsD99yjyhFcbgNLAorxGe0WHg65vi6Viw/a/8VQr94c9MuxEvM66u4+JPZX0/y9rMLd
	 AM/+Bzg4Zx0mjJtp1huxSbESgJV9XAi0Yctih9yZjZ5n1nEzcnlSaT3nmQZsQRnvBQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SrDQkpX4Y7Echbsbj+ZLTBFAqPJ7hguaoR6Hzs3plis=;
	b=n4vYBJELFOiKSdYkrvBaq+h+GpgLkhlitMxEekMR8TQn1NDAaurjaKKoTFwWdqSzg5kN
	 P2DUr+WZat/m6p/QGJESPfl5ZIWORjYTU1zSbrBoyY06//cYh1Molr0qsfCXCYUP48YBM
	 ZR9b5Eesh9t+O/SWJ09OdWJnjgInZnYPT88xashsFqmJjDXXR2ydHWZsu52ydzjYdBMId
	 9Z7ovpyrfsZIs5d5+ImyVtVxPlZaLyYfatlr4fKElGqOMHEfbKioK/MECfdCzmvpUevWG
	 khhDR8esLocksTr0Z0AyRrYnkCGFajF+gDQb9qpsxxxiGjEhT6X035tckdjdlInDmfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQFM72k3;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C75606A31B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 19:19:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74C75606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rQFM72k3
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e011d370dso2911140f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 12:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523962; x=1793128762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SrDQkpX4Y7Echbsbj+ZLTBFAqPJ7hguaoR6Hzs3plis=;
        b=rQFM72k3O0exks63jRK1m2BQIH0RSlEU1dM/5XhgK3L39X7SOUlyCKt8hhEBCCAh3q
         zzMfHgAsgmq/twfgxERfysGqgoLcGFdPHuAs62Zc05i+X2nMfuall7cXWOWMinOKtY9n
         jkjzyyJAc2b/ET7Iwd/6nlK2+gnrnDDofP0gPKzrHQBl1IkghGEbHmM/osh422HFp1TD
         +D8wvzdsTaTFQdWm5dwDN2eG0efptFh2TlFmgAWqIx1XbJJly+9kp95ZbpOdiBKcxi6/
         nn48+nE0dHpaN7bOooXd0GioEry23oodj7IYv9X7XUoTjyS+8RMpOFqwkVuuV6nBgEGZ
         VKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523962; x=1793128762;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrDQkpX4Y7Echbsbj+ZLTBFAqPJ7hguaoR6Hzs3plis=;
        b=KLNYKnud3iCgBAXLD6lUte2njYYIMdhEmvB83+H5O+N4yj+3rW4mxFltFjaf/DpPfq
         nyNwdhC6XGS41bNNopK/zRQ+bzaeizYfw1gfQD2uZtYevyp0P7dBXatcVJaTjRVTar8G
         j6dPUjE00sr9aPiB52esnyC2lUML80F5weV01xq0UJ0DsWzw7P13vRXmWDGPljyXGCAO
         b0B6o0G4G0vH5MnpKOHva+4dmiB8XUbLpsh9CXU6zGJbpvpmNvewOGKci+FrWQuT+HNU
         Va1mmFeetUYpie/AEteIYr2D+WAFomIzzAKHPycxqAt3N1EOyMH7YU/aZmYQltd2f5Cc
         85tg==
X-Forwarded-Encrypted: i=1; AKwUvBxQN1G/CmKAdxOFETJeuZ8yPPvVScUDe0tBoGjUpjBtRdh8M/sQmSITNOQVlAeoZ95wdr8q44AHx1awr+HdW2ETNjdU@vger.kernel.org
X-Gm-Message-State: AFq9FYIC8klk91OOrtlaMMsMOYPkwHpq5pdhrbE9RTP6WPbnWJrQN2VA
	2CmnmK7IeEAvnDPXr1M6Eq7/7cuvNu6axp4JUtNRqYq40HZF4Cx05bk0
X-Gm-Gg: AYBFou2PxVBC1815OekfNB/EN+2SOkA8xuLqlddXFneNOOJ17r+2qYjjccr4wW808HK
	uQyhqJtk8wv9MngGFYagfCd69xHq9u1dNTcPv3XVplpnN+l2vTiJEyBSEYefGLocLBStPEIJYpO
	iWXi9U3ZvIBF9BXyMG+DazfC0qzxIyepRBSePRyvKM9T9P0RUjD5QVPRXq0T5fSM5zMUH44dlO8
	wLF0HW5SdpbYNR6aNQn8oapmhPPwOaYsl4JKH0Q9YZzUsLUhIGtE4X9OWQeW2iWHEY1JuIUJHa5
	yBDsSmeehEoQj2oacDNfIaoN7SfS6HPAu6K2NkXK2fAXN5v7DywuNJALg9Cx9L97WfNEWmYmKLk
	G1d8ZggL1njSyrN2U2kL71PF5S/YDVQpTl0BUeQCvVfWKfc9RuquBIEF/vg2jIcVhLxaFLRSafW
	Ar1OhzuwHjCeP7NK+dfBWWSn2fT2XW+OneLtsuJ/ORzFpOfPjOfCay9ETeD1i6la69ETJJ/+AUN
	fOK
X-Received: by 2002:a05:6000:4697:b0:487:1ac0:32af with SMTP id ffacd0b85a97d-48e07fb67ecmr16507539f8f.51.1792523961518;
        Tue, 20 Oct 2026 12:19:21 -0700 (PDT)
Received: from [10.80.0.99] ([151.95.52.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258358c1sm355636f8f.43.2026.10.20.12.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 12:19:21 -0700 (PDT)
Message-ID: <29e4a8be-f61e-489c-8d94-b45d03728493@gmail.com>
Date: Tue, 20 Oct 2026 21:19:20 +0200
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-wmi: add TUF keyboard RGB
 readback support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, Bartu Alev <bartualev@gmail.com>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>
References: <20260925200744.129714-1-bartualev@gmail.com>
 <20260926005625.171560-1-bartualev@gmail.com>
 <20260926005625.171560-3-bartualev@gmail.com>
 <c0301eb2-62b9-4dbd-ba24-3a2c40675b20@linux.dev>
 <570a8f23-0782-8a45-d62f-c95bb28dade9@linux.intel.com>
 <2C6A459C-890A-418C-9331-D8B521B226A5@gmail.com>
 <6086490b-4a59-5095-8bcc-3728922fd9d6@linux.intel.com>
Content-Language: en-US
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <6086490b-4a59-5095-8bcc-3728922fd9d6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/20/26 15:08, Ilpo Järvinen wrote:
> On Thu, 8 Oct 2026, Denis Benato wrote:
>
>> Il 8 ottobre 2026 14:48:31 CEST, "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com> ha scritto:
>>> On Sat, 26 Sep 2026, Denis Benato wrote:
>>>> On 9/26/26 02:56, Bartu Alev wrote:
>>>>> TUF Gaming laptops expose kbd_rgb_mode and kbd_rgb_state as write-only
>>>>> attributes (DEVICE_ATTR_WO), preventing userspace from querying the
>>>>> active hardware configuration.
>>>>>
>>>>> Add readback support by querying ASUS_WMI_DEVID_TUF_RGB_READBACK
>>>>> (0x0010005B) via the WMI DSTS method. On supported platforms this
>>>>> evaluates the DSDT method EC0.KBLS(), which returns a 16-byte buffer
>>>>> containing the active lighting mode, RGB color channels, effect speed
>>>>> and power-state flags.
>>>>>
>>>>> Introduce kbd_rgb_read_status() to evaluate and validate the buffer,
>>>>> and convert both attributes to DEVICE_ATTR_RW. Map the hardware speed
>>>>> codes (0xe1, 0xeb, 0xf5) to their sysfs indices (0, 1, 2).
>>>>>
>>>>> The command field is not part of the status buffer: "immediate vs
>>>>> save-to-flash" is a property of the write verb (0xb3/0xb4), not of
>>>>> readable state, and the EC mirror is updated identically by both.
>>>>> Readback therefore emits a synthetic leading '1' - the canonical
>>>>> input form userspace writes - so that output matches input.
>>>>>
>>>>> Suggested-by: Denis Benato <denis.benato@linux.dev>
>>>>> Signed-off-by: Bartu Alev <bartualev@gmail.com>
>>>>> ---
>>>>>  drivers/platform/x86/asus-wmi.c            | 79 +++++++++++++++++++++-
>>>>>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>>>>>  2 files changed, 80 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>>>> index db6ee1974838..fe1dcc7701ad 100644
>>>>> --- a/drivers/platform/x86/asus-wmi.c
>>>>> +++ b/drivers/platform/x86/asus-wmi.c
>>>>> @@ -1046,7 +1046,58 @@ static ssize_t gpu_mux_mode_store(struct device *dev,
>>>>>  static DEVICE_ATTR_RW(gpu_mux_mode);
>>>>>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>>>>>  
>>>>> +static int kbd_rgb_read_status(u8 data[16])
>>>>> +{
>>>>> +	int err;
>>>>> +
>>>>> +	err = asus_wmi_evaluate_method_buf(ASUS_WMI_METHODID_DSTS,
>>>>> +					   ASUS_WMI_DEVID_TUF_RGB_READBACK,
>>>>> +					   0, data, 16);
>>>>> +
>>>>> +	if (err)
>>>>> +		return err < 0 ? err : -ENODEV;
>>>>> +
>>>>> +	/* DUBF[0] is a constant 1 set by the AML: anything else is not KBLS */
>>>>> +	if (data[0] != 1)
>>>>> +		return -ENODEV;
>>>>> +
>>>> -ENODEV or -ENOTSUPP ? Which one is better suited for these kind of things?
>>> If something is not there, -ENODEV is appropriate.
>>>
>>> Unexpected comms is -EIO (-EINVAL is unfortunately often misused for 
>>> this but it -EINVAL is to say input parameter was wrong).
>>>
>>> -ENOTSUPP is not a standard error code (the correct one would be 
>>> -EOPNOTSUPP).
>>>
>>> TBH, I don't really know where the line between -ENODEV and -EOPNOTSUPP 
>>> is. I'd personally use the latter mostly for the case where software side 
>>> lacks something.
>>>
>>> In anycase, wrong errno's are endemic and hard to fix without running 
>>> afoul with something as they often relate also to userspace ABIs.
>>>
>> -ENODEV it is.... Or -ENODATA when we can write but not read back the status?
>>
>>
>>>> If we go with two separate sysfs attrs you don't register the read one,
>>>> otherwise I am not sure.
>>>>
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>  /* TUF Laptop Keyboard RGB Modes **********************************************/
>>>>> +static ssize_t kbd_rgb_mode_show(struct device *dev,
>>>>> +				 struct device_attribute *attr,
>>>>> +				 char *buf)
>>>>> +{
>>>>> +	u8 data[16] = {};
>>>>> +	u32 speed;
>>>>> +	int err;
>>>>> +
>>>>> +	err = kbd_rgb_read_status(data);
>>>>> +	if (err)
>>>>> +		return err;
>>>>> +
>>>>> +	/* Map hardware speed codes back to sysfs index:
>>>>> +	 * 0xe1 -> 0 (slow), 0xeb -> 1 (normal), 0xf5 -> 2 (fast)
>>>>> +	 */
>>>>> +	switch (data[5]) {
>>>>> +	case 0xe1:
>>>>> +		speed = 0;
>>>>> +		break;
>>>>> +	case 0xeb:
>>>>> +		speed = 1;
>>>>> +		break;
>>>>> +	case 0xf5:
>>> Name literals with defines. When it comes to offsets, consider if a 
>>> struct would be viable instead of byte array + named define index.
>>>
>>>>> +		speed = 2;
>>>>> +		break;
>>>>> +	default:
>>>>> +		speed = 1;
>>>>> +		break;
>>>>> +	}
>>>>> +
>>>>> +	return sysfs_emit(buf, "1 %d %d %d %d %d\n",
>>>>> +			  data[1], data[2], data[3], data[4], speed);
>>>> We had this discussion in discord so I want to update everyone reading:
>>>> the status returned is the current one and both cmd=0 and cmd=1 on write
>>>> update the current status.
>>>>
>>>> Therefore this is an asymmetry that doesn't really need to be,
>>>> what if we introduce another sysfs that is RO? Ilpo?
>>> I'm not entirely sure what's the suggestion.
>>>
>> 1 sysfs attribute for read and don't touch the write one since they are in two different formats.
>>
>> Like one returns 4 values and one accepts 5: they are asymmetric hence my suggestion.
> Hi again,
>
> Does it have to return "1" or even a number? Could we just have return 
> something like "n/a" in that field (which would be ~ "not available")?

I didn't think of this... Well since no software currently exists that attempts to read it back
I guess we can do pretty much everything we want, so if you say n/a is acceptable that
goes for me.

Thanks for the input,
Denis B.
> --
>  i.
