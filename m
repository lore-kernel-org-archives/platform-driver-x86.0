Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB1429D277
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Jan 2026 19:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197737; cv=none; b=cHu+Edd9tvKcbWs7UTRjXPvizsVHDOPc/Ul56W/LIxjmPP4YFq7ejXn6EUqIErpJAFur+53a0JsO7xeBQD4mgAQ8+UxcYI6nxi92TrMj1+etXysJzNhsO37Xu9m63uF/bU5uyFEBSuFNlc8yXiSpF1miK2ZDWDwuE7CAuqPhMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197737; c=relaxed/simple;
	bh=LNJIwNah0F6kaUbvxmJagGksqE+bmMpstX4hXTPFiVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GF+hQGYzsg3rEhHRpP6YxHzL8Gw8/TRQil8ApjOlggQiHkv1o/1UnjR1+iTNGPTfbCbQk/pQ9pvUD/YZEBAa+iNSc1LxPIE7Ma26wMqsj7TASd4v3Q0Xwh9eYuUD9NoghMttqWoE0ZECEd/0GS1P9DCVocGYNLtXM052+bg227s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=pass smtp.mailfrom=vdwaa.nl; dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b=hz+Lw6mb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bekvxOFb; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vdwaa.nl header.i=@vdwaa.nl header.b="hz+Lw6mb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bekvxOFb"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 2F5CB7A0095;
	Fri, 23 Jan 2026 14:48:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 23 Jan 2026 14:48:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vdwaa.nl; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1769197732;
	 x=1769284132; bh=LEx+Xcs92zs495bzSFGAzIC4KYJr0WfdDd8M3dkgyw0=; b=
	hz+Lw6mbU1yTgZoAFtB50OmgY7owwqcwZuUageeG17fEcJbzDjZeAFMDeewt7rPB
	LBAvGs/AgijZeL2qghh/N/6MNEXjGlWxEHFMnSMT9lRbrk+yhGH/2Qy4LJro+34w
	iFHh+Gk4MusThnA2y6YkbplATnrLUZKEF3ySgh/CzQSKubqWmoQQbRY+74aKgGDr
	Z09kVXoEy5L2oqDf45i7SUkGJ2GBYeat7dy4hHbdBp6AO8bnwyUl3tv0yFmlvnPR
	0bgFUJsXN6KqmgGG9TDbAXaFpI59p7N+EpAvJ8b3nNcRiK7q/l75WZpGzh18lWe6
	8tfi3lm85n5F8On/PyRjpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769197732; x=
	1769284132; bh=LEx+Xcs92zs495bzSFGAzIC4KYJr0WfdDd8M3dkgyw0=; b=b
	ekvxOFb27AYN/oZ+LY6pOQ0POSs6sYePJ3Dn+KZcIzHaTlo8gStUunXh+FLxT0fa
	64sdU2AneBP9eBEfIL1ClD/kbn4qSNgxOHyzJUAL/8npX3XkEtXdUjiF51sskQ8R
	J3aHkV4eg4R7Fnpl4N3IqQONcZ4F7GWhaP5gh0ygLCVCbWul26JK2zNPSRHl35lX
	B6nzcjWdaHQmUYBZ5lyRgKL3vH/MhS1a7EEAUKcDCm7wvA+mpOa7K28VXBmKTbBQ
	YLXWsQ8pNDH1MKuuYH5mWBjR2eDELhSwa4JdgYWmZjYPasPFWbUaNBmKkXcrri0F
	HJl5fJuI1kTsoFtwm1Cbw==
X-ME-Sender: <xms:o9BzaYfgR12ldhVQ287enveJC3_buFbU4Gic3uVb6_JJcOKqau7Fnw>
    <xme:o9BzabsNad9AHFgkdaVnlRFn1G0GKEyZ2hgIOPNUIIYUikUrcKV2MhgCQWD3y11WG
    OlM6TOfiFR9Dmu8ITYvDP4zVrcj9XTFOpMT3YM0ruyFrUn3O9HsWL7d>
X-ME-Received: <xmr:o9BzaZmXiolSeABCtiPyCmnVq4YXDjtEXJ90y9vduOc-xSiaATLYRLrNcFNOcPdz4z_jolrruPXEd5gJWSf2HmvX2skNmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeelledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflvghllhgv
    uchvrghnucguvghrucghrggruceojhgvlhhlvgesvhgufigrrgdrnhhlqeenucggtffrrg
    htthgvrhhnpeefhfeuudefgfeltedtvefgjeelteektdduheduiedvvdfglefhiedvhfdu
    tdekueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhmohguvghlshdrmhgunecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgvlhhlvges
    vhgufigrrgdrnhhlpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopeifpggrrhhmihhnsehgmhigrdguvgdprhgtphhtthhopehhrghnshhgsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuh
    igrdhinhhtvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdq
    giekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehfrhgvuggvrhhikh
    eshhgrrhifrghthhdrnhgrmhgv
X-ME-Proxy: <xmx:o9BzadxbPoeyx8aHaRxPoW-fhNf8VHkGe2i5oib3YN1voIEOQJoMFg>
    <xmx:o9BzabMMHmk1X15UIt2baoFvxFnOxPWTrZ4XPEc0w5X-FA1lKxrkTA>
    <xmx:o9BzaZp7qad4fAuhvJLwaRHgr_GLrFziRN3yiwKIY4gXrAj4LJ6kXw>
    <xmx:o9BzaUFX8W7XvDrveiSZMwyHtUaVGQ51OpNYTDWOnR48ItENB4JZnw>
    <xmx:pNBzad8_pb7vurOrlLf_-HQWydikbC9MyHL4jyN2z4q24Jf0Su03wXFI>
Feedback-ID: i2d0446dd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 14:48:50 -0500 (EST)
Message-ID: <b22aaf97-063f-4f76-869a-43f2c1823d12@vdwaa.nl>
Date: Fri, 23 Jan 2026 20:48:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: add Acer battery control driver
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260105171024.227758-1-jelle@vdwaa.nl>
 <20260105171024.227758-2-jelle@vdwaa.nl>
 <263a3aae-2edc-4219-af93-65e7a53ba399@gmx.de>
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
In-Reply-To: <263a3aae-2edc-4219-af93-65e7a53ba399@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/8/26 14:50, Armin Wolf wrote:
> Am 05.01.26 um 18:10 schrieb Jelle van der Waa:
> 
>> Some Acer laptops can configure battery related features through Acer
>> Care Center on Windows. This driver uses the power supply extension to
>> set a battery charge limit and exposes the battery
>> temperature.
>>
>> This driver is based on the existing acer-wmi-battery project on GitHub
>> and was tested on an Acer Aspire A315-510P.
>>
>> Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
>> ---
>>   drivers/platform/x86/Kconfig            |  12 +
>>   drivers/platform/x86/Makefile           |   1 +
>>   drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
>>   3 files changed, 358 insertions(+)
>>   create mode 100644 drivers/platform/x86/acer-wmi-battery.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 4cb7d97a9fcc..b3de6a2827e8 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -170,6 +170,18 @@ config ACER_WMI
>>         If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y 
>> or M
>>         here.
>> +config ACER_WMI_BATTERY
>> +    tristate "Acer WMI Battery"
>> +    depends on ACPI_WMI
>> +    depends on ACPI_BATTERY
>> +    depends on HWMON
> 
> Hi,
> 
> why do you need this HWMON dependency here? AFAIK you are not using any 
> parts
> of the hwmon API, so please remove this.
> 

Ah, since the battery temperature is exposed under hwmon in sysfs I 
thought the driver would need a dependency on it.

<snip>

>> +static int acer_wmi_battery_get_health_control_status(struct 
>> acer_wmi_battery_data *data,
>> +                                  s8 *health_mode)
> 
> Please run checkpatch --strict over this source file and fix any issues.
>

Thanks for this suggestion, I wasn't aware of the --strict option.

<snip>

>> +static const enum power_supply_property acer_battery_properties[] = {
>> +    POWER_SUPPLY_PROP_CHARGE_TYPES,
> 
> I own a Acer notebook that only supports the temperature sensor, not the 
> health mode feature.
> You can detect this by looking at the embedded WMI binary MOF data, but 
> we currently have no
> in-kernel parser for this.
> 
> I am working on adding support for the binary MOF data, but for now i 
> suggest that you use a
> DMI whitelist before enabling access to the health mode feature.

I'l look into this when sending v2, the GitHub project has a list of 
models which work with the driver so I'll include those in the DMI table.

[1] https://github.com/frederik-h/acer-wmi-battery/blob/main/MODELS.md

Thanks,

Jelle van der Waa


