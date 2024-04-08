Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303E06D1CC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712579475; cv=none; b=hVZBJRfQ06ysUnMaJZr/OjeV5vs9B35dDAXoPBjtA7EUhD8z+sVHH1VEOw1iZ0hfvFRearXQFZ0vdVAcEwE8ApUSbMHJ4eJrDPTXqXLbvbiR+p0fCcupRJ/Hd40HnKjLaydDHK2vRvAwfZakSqEUMn9IjJzJZEh7Yb7rfp1jSf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712579475; c=relaxed/simple;
	bh=1HeJfEw0yDcY4QbVfJFdaUcU8vR8nqaFJyeer3BBf2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ElZKe9AAgw2K4Jej+PXYKa2dYyWzwKJBW6oU1tfImIPPuJFYw0M/mrp+N21o9D6uLcxMfbfPtd+7bfHEqtjNR/5bccKdQtLpu0uCKoKw59NFh/aX6HO9pH2l5L8KwvTiaMoNqEwNGWOP5kXXQwKbw5ya5m2gMXDYLODtY88qE7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=g3FM8CN+; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="g3FM8CN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1712579468; x=1713184268; i=w_armin@gmx.de;
	bh=1HeJfEw0yDcY4QbVfJFdaUcU8vR8nqaFJyeer3BBf2k=;
	h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
	b=g3FM8CN+QGYSPcD+QgewrcmqesouDgcFc3jd5P7QRw0SnPZnTE4i8DZfenlhEo8h
	 beHrFIDPTVKqyubhK3s2mTFTHx9QFWq/j3fq8GdT95HWHo9k0aK08a84CvOd1tg8Q
	 LxGaHOesnNvdkLBsv+aMl7bP1ofFl5w27pMkQYfIMC4o/DBDb+ovFaHE2GJ3zuI2a
	 AofCpnCBfjTt280NWteW9gWnhdljKi9VJMaqvjvhyB+g+PdGpFL5umzrR9tHrdr/s
	 s0aIO/aooZQbp3crH7q5IeUYcODTARWscvGrOYmrNwaPy+uUBy/0eWquo278JkVJZ
	 P7IBStXqGzBDlUxA1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1po0-1rw14e334S-002JV0; Mon, 08
 Apr 2024 14:31:08 +0200
Message-ID: <53bf2aa6-1ff9-4016-b398-b90debad949c@gmx.de>
Date: Mon, 8 Apr 2024 14:31:08 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ishtp_eclite: reading fan tacho value from ElkgartLake PSE
To: Mikael Lund Jepsen <mlj@danelec.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <AS4P189MB2133A68C6CB82C58E0268311BA3C2@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
 <b85d1fbe-af3a-446e-a4d2-fbbd53c0c398@gmx.de>
 <AS4P189MB2133E5E9975E253C795E6742BA002@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <AS4P189MB2133E5E9975E253C795E6742BA002@AS4P189MB2133.EURP189.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SShmSqaD3wCGzoBR4QdXhu9vwqLof9uxupYNigd3GVOXuaXLfFu
 68V4UTMd5QdsAhVBUAfjPB1CP1K2dP5cW2Tl3Sc8KJA3SZAtsH9jfNbxMJ23lzQLzDGmggb
 1zJFJWIHC+8Gga6BlabTztvkgBpIHFf9XxLdgXxtj3s2B5gDDKYLh/8e7RSMKa9scSmS6oX
 8Op++OeyeIR08gPmmbIwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qhRMoGOlbx8=;8mMKsKCL6+MSB+BjiRxvDotVC/Y
 Msm6ganFuM/4Xxpi7bpaQIwmRndiU3NB9ER5S1WgMU8WMNbWau6IiL/xCz8Wh4IWNge+f50gA
 4/HprAUSs7A0l8vne5lidW5xq/aRRDxa9Ptv1EOsKHVX5ydVwiFBMeGBofgSWVjtv/ay+nQ4k
 hDcs8njRvYocgKICnXwxSV6KwKELX8s73s0Fj+AaVPOmbzV3AKXXF2mWHxX5y7YC7LNBYkfUW
 CHNHtMGK9lJqnfoZYnPxjqIm8BmzSVLCycoPXaVtWzFiJMKGYdHp72F/Yhy16NV5US8gp8JuO
 BpICDqFk1w6MFLDN02IGQtPHEkoHunf3sigQUdFGJ7XWU107kQV+7m0M6DwJD1FkbJdJ8Soyu
 ZjWPEgdKpy0g4/5tCLugWxnHY+cFKxDPJDb0FOIEMBdCtfjcL8k1Iet3sOWviqEWo1nQiSdhD
 o4zGT7W4rbRarMcbT/CHupBpor5+2Vu49Fz9HPN3bUvkWCeszTUkTZJlIq4IWjRJMlVTJjwYX
 J9b9X59lIx6yeaACI3lH71PPjMU7w7h58RfVZCKlpz33Lh4R5EjlV0wtk5fwdxZubReEwQqr7
 zQ59LXbcTGdNnllGW/DDrd1l0EYdx34yK85s+3Rnz/prMF5TpQLMXiUdN3/Y5KokDQuSGeDmo
 wiFchHxmWojxaVYVejC1CW2C73w6uLdI7zMBfV8TV0K32iVQDCL5niMxCzo/RURBI6flr//fD
 3b+/vHMMMmQGmAlum+Lrm0u8Omgw1SeJpjZmjMwyjpzsbNyrlhN3x3GAZM0F67xgiVcfBYqmO
 gW8q5z4g4CPbfUQSWocYn/+DexBvOnMtrRZDi1DYbSUrA=

Am 08.04.24 um 13:32 schrieb Mikael Lund Jepsen:

>> On 04/04/2024 Armin Wolf wrote:
>> Am 04.04.24 um 10:37 schrieb Mikael Lund Jepsen:
>>
>>> We are using the Intel ElkhartLake CRB board and need to read the CPU Fan tacho signal from Linux userspace (so we can raise an application-level alert if fan is broken).
>>>
>>> The CPU Fan PWM output and tacho inputs are controlled by firmware running on the PSE controller (Cortex-M), which is embedded in the ElkhartLake SoC.
>>> The PSE Firmware contains an ECLite feature which updates the eclite_opregion.tacho_rpm field. This field is also declared in ACPI (offset 330) by the bootloader (Slimbootloader).
>>>
>>> Fan control works fine via the thermal_zone sysfs interface, but we cannot find any entries for the tacho.
>>> As we understand it, the ishtp_eclite driver merely acts as glue layer to the PSE/ECLite, so some other kernel code needs to call it, we guess based on ACPI definitions.
>>>
>>> Does any drivers exist which expose the tacho value to userspace (preferably via hwmon as is the standard way to do this in previous Intel designs with LPC + SuperIO)?
>>> Or if none exist, we may need to add this, but could really use some pointers to understand how such a driver should communicate with ECLite via the ishtp_eclite driver.
>>>
>>> Note: The official Intel binary release of the PSE FW (MR7) does not enable the low-level TGPIO SEDI driver in the PSE environment, so the tacho input is simply ignored.
>>> If rebuilding the PSE FW (https://github.com/intel/pse-fw) with the SEDI driver enabled, ECLite starts to read tacho as expected, but this does makes us wonder how well implemented (or used) the >tacho feature really is.
>>>
>>> Best regards
>>> Mikael Lund Jepsen
>>> Software Engineer
>>> Danelec
>> Hi,
>>
>> maybe you could provide a ACPI Fan device which implements fan speed reporting through the _FST control method?
>> In such a case the generic ACPI fan driver would export this value to user space through sysfs.
>>
>> If you want to use the standard hwmon sysfs interface instead, i can provide you with a prototype patch for exposing this values as a standard hwmon device.
>>
>> Thanks,
>> Armin Wolf
> Hi Armin,
>
> A standard hwmon device would actually be preferable to me, as we need to support older platforms as well in the same codebase, and they already use that.
> If you could provide a prototype patch, I would be very grateful.
>
> Thanks,
> Mikael

Excellent, i will send an RFC patch soon. I would be very happy if you could test this patch and tell me if it works.

Thanks,
Armin Wolf

