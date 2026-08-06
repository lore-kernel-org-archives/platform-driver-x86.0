Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30E730E0D6
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Aug 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786029492; cv=none; b=TOaZhQ5oqOap+RZCQ7s169okt2RLBBdCMXIa7nRruVXvWAbX/yJ95t7BJyIDwNsTcCJuAB1JwWzmlNF2AndYTTB6LoaOd+mgx2vOGp6gNzmmaHdVZIrdPw+UQ6uDNoa3MQhwUcEmmd5oI553Kpqxh1QAPKr3S5YMyOc9alPd3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786029492; c=relaxed/simple;
	bh=EzZjdzPV4rfnODVzyIeZdmbUbbWn3BYVvUIFE8xQUz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZXCPpkI+zExYVgtP72ZSj5XfH5sbQGh8zX7eF1jK/7qb5zMyZcQSLVnLsSkTwMyEXYWbILMR+IWUbvASniElH9r8WkedXbkWgc0MN2Fy1jLXD0XMBCH/ilov/tDNTt63leaQ/RsqB3FP5LbSv+SOnfpeR1ElfQl67kOYocOjbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=pass smtp.mailfrom=vdwaa.nl; dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b=SGCs5C45; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VHaTRMLR; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b="SGCs5C45";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VHaTRMLR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ED2037A00A5;
	Thu,  6 Aug 2026 11:18:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 06 Aug 2026 11:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786029487;
	 x=1786115887; bh=vi7y7zwWh0gscQC1+qdmIxnpDY6LFr+f83z43FePCEU=; b=
	SGCs5C457xcdFUgJiJcLq75MQxRGKJxm3a79ptQVhkmYHhjk9DsgGSctfeZF/onn
	T8NX4m3iXIUjNM1NGl7so8xyJOVOlXvRpD1ZIUPlOA2taZTESWl3EPd+gP5Yr26t
	+7Em9teanalDP4QGZjuDWcxYQLKZnVnGXDR5fqnWXHxu6PQTeUZAa+2UDRWlK8zc
	UDk76jPcdvq9JHOX2U3VDIrneiu7CeI/UvSbmuYALan0pJ7huGgZP5Gx2asJNjQh
	Vgh0ek071pKl7DfI9bs9Gl9qx/ENcbjXWbTt2ws3UrlLLsRYb4w4Dy4UIPS95iMk
	UJUk3I5hdb4hBdkb6gPD1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786029487; x=
	1786115887; bh=vi7y7zwWh0gscQC1+qdmIxnpDY6LFr+f83z43FePCEU=; b=V
	HaTRMLRDOeuSn6ZSJGFGFiOmPzfwuVMv95B8ajCDUskoNw6OQFXrqLkqQu+ZcPWj
	p8por+XcbYu7UBUtnOCWyQ8d9u+s9SPo+nwXhYZ+IhYDbZeb8Brn4Uo+PT0PrsZS
	gFUMQPe+U1XiIWmsJ1SHpZCnsYg8zw7fULo2vbJJt6XZJhI4J8st9DwJdQJgE5MB
	L1XNMR/qBVx8YM5/3VimV78G3csdVvM3VQaIXH3XqDIZLV/SSuSDYNCXKGJAY8zD
	YbPqMChbFdz46NuYe2M2clQd6G2gTfSWZT8x1mTtsF7iWN7C2SN/Ixj6+HewPS6J
	wXanOJSCCwfkYy8qfzpFA==
X-ME-Sender: <xms:r6V0asAwVX1RcjWM09Uy2RNWBPVmQJetMQvMmZqgjpwvflgDMduaWA>
    <xme:r6V0asVPMjFhSPx6IlxfbUi9kTUbdlaRFPQFHIUUywk9HbUAz-qBYiNaQkdK6_Dhu
    vQVUh_Sb4SlK83blJ77R94EAOEwrLdN9qczYkfjQOMeDvsibJmDaiw>
X-ME-Received: <xmr:r6V0aqAq9DLCv0UAuvUfoB8n1a7-uKj_fD7ZBYBm_OPfae5ksAzmpFMC3iZX-J0BnVK9zWbfmRKQQMyOhBkwpqLNlkGOcQ>
X-ME-Proxy-Cause: dmFkZTFe6Ah8LkAylheIMJRhjf8SZKjZ0cKIRF69a1Bp4QaldlSO9otVXndqdsT/TuP6BU
    kJhl91t3i6FTY9z6iMc5G7ZozzRgNznbiZnSoZpljbAnBbO1Ls2B9jTq6Qa2NN6FRqysKD
    gA0NWV4lAFlMwO8kRRdYEbU13hWquvdSmJjPBSTQQHdFG73EEcxMJTO4doBhAgm8BE0d+T
    TEVQf57KAQA0XcCvVKh2tswVnVRtlj7Pb/GZUMXkz96wUu0g0cm8kPt7LGTIbup2n+vMsu
    KE3VTpLban5bCuAuQOedRRgJDKa6w4gzvrvP9JXL50CA2oTXQdY8gFG6Jr6IAJ1g8qQ5sg
    kOaz2ct6VKAo3sDDB0CFqM7XkNWX2HXw7y8U+5fmasV9ycUmGOyX60bSyQgw3MsHyIfrqJ
    9X8kyQTtJwqt47fhbalnjX35BjYVueA/FKayww8ALUjQ9iS4iqX9W1QKWuF6HKQVH5Skz5
    Kz1kZzvh8W7NI/BohEEB3F25rDrZ661awOWJ2FSN2g+lDrhFvCXLP3qvOsskHb/izlN9K6
    jXriyYstMsxitJPBF120gcnf3ulrcZj82BvgUiUPE2iXaWdkkGXFOUmIPGHoL2K/lpCBAT
    Bil1W/Ou3Kfw6JXT5oX7b6PAPzidKsqhXoxfbd8kBc+otru4PyOao6xKZetg
X-ME-Proxy: <xmx:r6V0av8zWGruueY8aTfBYuX7BhJpeRO05X4ikVcKYktNMNODc41vow>
    <xmx:r6V0ahFRRB9x8zG_29vD53M0NxKQzzIghJAserse7NaLX04ioylIAQ>
    <xmx:r6V0atOwxEWVYBZ_iQO10-8H9lCOVWs4JCdvTY3P5Bmy4urqMRLIqQ>
    <xmx:r6V0arduMwsqertoZIwcTHdwyM81rU7hMkPovTV7thhuGRLi45ys1g>
    <xmx:r6V0amNm6Z8jp2mhGGRkBREas48Dp2pXY9xTmlLmXhlZEhkiF-O5dx9k>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 11:18:06 -0400 (EDT)
Message-ID: <d72a7db6-4ec1-460d-8d40-c63301c11123@vdwaa.nl>
Date: Thu, 6 Aug 2026 17:18:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] platform/x86: add Acer battery control driver
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260531090505.156394-1-jelle@vdwaa.nl>
 <20260531090505.156394-2-jelle@vdwaa.nl>
 <97d09dc5-1434-4d64-abd7-8ba465c3891b@gmx.de>
Content-Language: en-US
From: Jelle van der Waa <jelle@vdwaa.nl>
Autocrypt: addr=jelle@vdwaa.nl;
 keydata= xsBNBE6QLAIBCAC3O6LmF+GKvOh7IV00TG+EKAQHAwjESnHGJOW58lKK7eAYn62ZM1uy0+6h
 yCMu5PD7+ND6U1gcgTTHYwNK8AaJt7yY4FRssgdcJk59uJBwROZtllotClJ893CuB6Wgr68b
 07gIRbENYrB8rEoGfpUG//8/ep7sY8PS03jnFb4ll6mPlUE2oQVdYOlXgF4f9qkkIi4SQeE2
 MTuERaOrDuUNDlroJ7Yfx3J/rL5Qjn578/TKCAxg0pns6VIA/P9spRGmLhT4zP+OxZXeSZme
 IxcwFdJJXHr4oGaZvqe1yHlMmKR98rrIfPWhkw2Ls/XIZIxf6prT0XyczbzBnC2y1JyNABEB
 AAHNIkplbGxlIHZhbiBkZXIgV2FhIDxqZWxsZUB2ZHdhYS5ubD7CwHsEEwECACUCGwMGCwkI
 BwMCBhUIAgkKCwQWAgMBAh4BAheABQJUX8WhAhkBAAoJEMBghjN8UHc+mFwH/jjN+Qob4O36
 YiieajRwVLGuYdUDt9Z655oQYU8V4qbWf2tjUtqTYXrxLnaY6xQoYouRz9yFbh9dIKZb67ir
 7AeVgCOtWVesGxAlGH6EY5JBZcsN0v0ScsivqQAv/Mv+4HK+XM57YlyRagD8tkprYskioWHg
 OwQfXAO6nlm4BJHWO9bHJUMgiGs7I190IKQG7iLBnJuGjsOFuy5KTLpnv+w7twmz0H+pkUPe
 jVHfJlJWdN4v1PigpgpjOR6ZepSIggMk7dHsa6GNLUOzi61yYVFe60+EGXhwyJIqSt56a4oR
 jMUcXaOugGr+JwC8Eq7Pg2+aFk+8fbe0oUzZJucHGnDOwE0ETpAsAgEIAK4Usb7B00WRxCZG
 HtM973F7V4OhOKv4kZKduxtu71bVUZsTuzn4h+m8guJ51uY/I2icUrN9gJG5aEzRqPuQi2L7
 KmZUjs3pscZWgUgiT8UZFDR6RuQ4k3CcWobsRCjYZdSblSZ8ccrLJE7xSbwKMXjAh2PEiaQT
 lS6wQbn6mHv4y3H9QVHs7+jXbmfHCxnVcwLqRmpuegSmezDaL5TlSc102voiXinhrWEZUvAB
 KDh6VuJ/60Y6zelCXVsEjRaApz90iXY1nifLhkHM8B2wG7Pum3V3X0Y0QTVD+z3EL1iq5mFu
 epKp//IOeeJN5iwHcRSJGy2s1oOzjRDyPv6v1AUAEQEAAcLAXwQYAQIACQUCTpAsAgIbDAAK
 CRDAYIYzfFB3PvDuB/0dI13hSYHW27c2Rq8BaGbIhXYYETtPD5B25/P1JJ5OQZkPmVq+vSHw
 uzUaDZHy3ZcwE+xFXzlkwXGdWos07JUGo74zV3HfeZxVEPv0HB9ACqQVU/JKjLZNj2SfhgzL
 4F+O4Zgdsf0YaZG09F5PbMvbhoCZLfAaKWz/4fLEfhrDJLhrphUyPDXosn0UxPkDv0iiixn4
 V+bEZ5/wd8dRWi58R/iND+gRGsBREm5SpzdhnsarwoX6YdsQ449379enDNUN7jV4C3Gkon2s
 VwI2ZZbS10cY8rFSAV/CJA2E9daRoz40DI0tgXgLBAVhy7y5HWZJsDZexU0HFKJfkDi7RUPj
In-Reply-To: <97d09dc5-1434-4d64-abd7-8ba465c3891b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 07/06/2026 22:46, Armin Wolf wrote:
> Am 31.05.26 um 11:05 schrieb Jelle van der Waa:
> 
>> Some Acer laptops can configure battery related features through Acer
>> Care Center on Windows. This driver uses the power supply extension to
>> set a battery charge limit and exposes the battery
>> temperature.
>>
>> This driver is based on the existing acer-wmi-battery project on GitHub
>> and was tested on an Acer Aspire A315-510P.
> 
> Good work, i tested it on my old Aspire notebook (v1 interface) and i 
> can confirm
> that the temperature reading and DMI whitelist works as intended.
> 
> I found a couple of minor issues, once those are addressed:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Sorry for the long hiatus, I send a v5 yesterday and forgot to include 
this. If it is needed to send a v6 I will include it and send that as 
soon as possible.
> [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), 
> Description("Class used to control smart battery, Version 2.88"), 
> guid("{79772EC5-04B1-4bfd-843C-61E7F77B6CC9}")]
> class BatteryControl {
>    [key, read] string InstanceName;
>    [read] boolean Active;
> 
>    [WmiMethodId(19), Implemented, read, write, Description("Get battery 
> Information Interface.")] void GetBattInfoInterface([in] uint32 
> uBatteryInfoIndex, [in] uint32 uBatteryNo, [out] uint32 uReturn);
>    [WmiMethodId(20), Implemented, read, write, Description("Get Battery 
> Health Control Status.")] void GetBatteryHealthControlStatus([in] uint8 
> uBatteryNo, [in] uint8 uFunctionQuery, [in] uint8 uReserved[2], [out] 
> uint8 uFunctionList, [out] uint8 uReturn[2], [out] uint8 
> uFunctionStatus[5]);
>    [WmiMethodId(21), Implemented, read, write, Description("Set Battery 
> Health Control.")] void SetBatteryHealthControl([in] uint8 uBatteryNo, 
> [in] uint8 uFunctionMask, [in] uint8 uFunctionStatus, [in] uint8 
> uReservedIn[5], [out] uint16 uReturn, [out] uint16 uReservedOut);
>    [WmiMethodId(22), Implemented, read, write, Description("Get Battery 
> Function Data.")] void GetBatteryFunctionData([in] uint8 uFunctionMask, 
> [in] uint8 uReservedIn[3], [out] uint8 uReturnCode[2], [out] uint8 
> uBACStartTime[2], [out] uint8 uBACStopTime[2], [out] uint8 uBACStatus, 
> [out] uint8 uReservedOut[9]);
>    [WmiMethodId(23), Implemented, read, write, Description("Set Battery 
> Function Data.")] void SetBatteryFunctionData([in] uint8 uFunctionMask, 
> [in] uint8 uBACSwitch, [in] uint8 uReservedIn[6], [out] uint16 
> uReturnCode, [out] uint8 uReservedOut[2]);
> };
> 
> I suggest you write a tiny bit of documentation under Documentation/wmi/ 
> devices/ using this MOF description.
> This way future developers can better understand the WMI interface used 
> by this driver.

Thanks for poking me to write this, this was the first time writing a 
WMI driver and writing a bit of documentation definitively made 
everything click in my head.

It also sparked my curiosity. I know you added the temperature reading 
and referenced "Smart Battery Data Specification", did you try any of 
the other fields (such as manufacturer?)  [1]

[1] https://sbs-forum.org/specs/sbdat110.pdf

Thanks for the review,

Jelle van der Waa
