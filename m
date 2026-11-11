Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402542;
	b=5cjRxPhKtubbWlSeG8HRnjLz2cKWnAhnPDvHFYhkg93eHl0soQsntrOkM2nn9AUsiNl2
	 dVlGvcuMRp3BAD6RLy0eecu75vJSbWPVv+tCff3Cw/7PC/DQgDVXJY75fYXnaTBKG1Wk+
	 N3+59VKw7wIvkKaa92LTQzmt0YqmhY6XEm7FzZY29buu5CzOwUwNDNcBRDX08IKRNEaWJ
	 KUOgxLDk+30eEWjn8f7Dpukwl9MHc6m3zIKfR1AWJ0BEZNkzloRWRaBaT03zhab8bZLWU
	 u1VrPqCAMF0Gtrt9KPvz6U/K0yk0DCP4rDhShb5u0Jqhth6Wh8Vm8E0whkMPeV1bWDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402542;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=5+jBvJl/Ix9vAglpQXYTZoWyiW+U4BJ8ZU+Ewy5ieI4=;
	b=48BT3Po7SBV6j5WKigpOhqadu3Akw8SaORXJvjyXPpyBRzQIEyZBxbTEHbW1V/4dUnOJ
	 Niu8w8otje8MZGjRMh+VibVP5FjFmPbHqUP3ASVOr998DlbUgqL1ADAnDMkNCPNUc1VVv
	 mD8RNHCYqN6xzWr4URt3cEDk8vw+2Shww7sZDtYjDrJYVxla623ZuOnlZCYm93Uf+3gRl
	 Umfc+Sf6dXbeqvyjb+ne7nRCtWtG/HLiVeYz1M6rzXwB9T3euqfyRea9U5h8JNsIt8Yx+
	 /+ITOserYXR2pByq3KjDb0u8QrdsSTquCs06pQOeHSByQ9ZTN6CDmEbBeGIlWGUk58A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBaToKoi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C019C606A326;
	Wed, 11 Nov 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBaToKoi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C851F00A07;
	Wed, 11 Nov 2026 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402542;
	bh=5+jBvJl/Ix9vAglpQXYTZoWyiW+U4BJ8ZU+Ewy5ieI4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FBaToKoiU1IGr1H0R8eaC0QuhhXh/uuJ4Z3/sed2qFNbQzjkPyDyTDAN+3LtE4ocG
	 B5rJR0cnU53R2YosX7msMS/6nxDjHpL5pDOCod6sU1Bpb/y64T2MJxP6Eu+6h+ltQD
	 JSyNbTQpAMLcYjtkhgw0voObZ3aBqRpgqzQA7k2DJmCTtSxwx/KWh+KbhzvGvrCPIw
	 CJvMfjB4yzlauCf94p+Vux2iWCyMFtWIGsi7N0bx6tDfsA1OrEGYvLbif/+9oWO84T
	 kgrrGIJmv4tpq2Ick2QQm+w/xzZeIkwaMF0bj9mtoyELgY65oJ5cI5nj0rT6XgZeXf
	 D93H3Ua9POOFg==
Message-ID: <c4e4c30d-ebb6-42fa-b957-dcbfa10d3e5e@kernel.org>
Date: Wed, 11 Nov 2026 14:08:57 +0100
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
Subject: Re: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
 <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
 <44e4ede9-3eb8-418a-b1f1-7e9dc75e2e75@kernel.org>
 <o55caq7vadrcc6ioc7n7aplbyh55n63mqgno6j2mgcksrjzb35@ptnencuakeo6>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <o55caq7vadrcc6ioc7n7aplbyh55n63mqgno6j2mgcksrjzb35@ptnencuakeo6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Nov-26 22:59, Abel Vesa wrote:
> On 26-11-09 15:52:16, Hans de Goede wrote:
>> Hi Abel,
>>
>> On 6-Nov-26 23:01, Abel Vesa wrote:
>>> The embedded controller of the ThinkPad T14s Gen 7 uses the same
>>> register layout and event codes as the Gen 6 one, but a different set
>>> of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:
>>>
>>>   - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
>>>   - register write: write {0x81, reg, val}
>>>   - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte
>>>> With the Gen 6 commands the EC never reports any event and the LED
>>> and keyboard backlight accesses have no effect.
>>
>> Thank you for working in this. I've been testing this and my own T14s gen7
>> and also I've taken a closer look at the DSDT leading to a bunch of
>> improvements. Instead of making these as suggested I've just gone ahead and
>> implemented these as fixup-s to be squashed into a v2 patch.
>>
>> For easier review by you I've split the improvements into 4 patches (attached):
>>
>> 1: Fix Fn-F12 not emitting a key-press + filter out some EC codes being reported
>> when pressing Fn + Fxx key combos which already send an I2C-HID kbd event.
>>
>> 2: Add Gen 7 suspend/resume handling
>>
>> 3: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
>> really just checks for the original (gen6) support vs gen7 support
>> drop the bools and directly check which variant ec->variant points
>> at instead.
>> 4: Cleanup: has_kbd_bl2_and_standby and mic_mute_led_generic checks are
>> really just checks for the original (gen6) support vs gen7 support
>> drop the bools and directly check which variant ec->variant points
>> at instead.
>>
>>> Describe the bus accessors and event read per variant and add one for
>>> the Gen 7. The Gen 7 firmware does not use the second keyboard backlight
>>> register or the modern standby register, it drives the mic mute LED as a
>>> generic LED (id 0x0e) instead of a bit in the audio register and, when
>>> the keyboard backlight is cycled with Fn+Space, it also reports 3 for
>>> the high level, so handle those differences too. Also handle the Gen 7
>>> only events as known ones.
>>
>> So about these differences:
>>
>> 1: For the spk / mic mute LEDs, on a hunch I tried using std LED controls
>> with a LED idx/id of 15 for the spk mute LED and that also works.
>>
>> I did not find either way (REG_AUD vs REG_LED) for the spk mute LED in
>> the DSDT, instead the DSDT ends up sending an ACPI notify event, relying
>> on some windows driver to handle this.
>>
>> How did you find that REG_AUD still works, did you just try the gen 6
>> method ?
> 
> Yep, just tried the Gen 6 method and it worked. Nothing in the DSDT
> for it either.
> 
> Re-checked just now: the speaker mute led lights up both via REG_AUD bit 6
> and as generic led 15 via REG_LED. Since the mic mute led is already a generic
> led (0x0e) on Gen 7, I'm fine with moving the speaker mute one to 15 too,
> if you prefer. Otherwise I'll keep REG_AUD, since that path is shared with Gen 6.

I don't have a preference either way.

I tried both methods (REG_LED and REG_AUD) for the spkr mute LED and both
work. Which ever one is written last wins and gets to determine the actual
LED state.

This means that the spk-mute bit in REG_AUD may not actually reflect the LED
state, since it stays set when disabling the LED through REG_LED.

>> 2: For the kbd backlight, again the DSDT ends up sending an ACPI notify event
>> and does not access the EC itself at all.
>>
>> How did you find that T14S_EC_REG_KBD_BL1 also works on gen 7?
> 
> Same, tried the Gen 6 register and it worked. Writes change the level
> and reads follow the Fn+Space changes, which is how I noticed the extra
> level.
> 
>>
>> 3: For suspend/resume the DSDT does have modern-standby handling both
>> making the LEDS glow and setting some magic bit (which presumably makes
>> the EC use less power or maybe makes it send less wakeup events if we
>> were to make the EC IRQ a wakeup source) ?  This is implemented in
>> my second fixup patch.
> 
> Squashed it in, thanks. Haven't been able to verify this path on my
> unit though, suspend has some unrelated other issues. Will try tomorrow.
> 
>>
>> Regards,
>>
>> Hans
> 
> All four fixups are squashed into patch 2 for v2, with your
> Co-developed-by and Signed-off-by.

Thank you.

Regards,

Hans

