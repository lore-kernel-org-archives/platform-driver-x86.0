Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044940;
	b=VfUoL1DyTbPXg2HRnNSeWjdR7X/tF3oWjkfxcdiSL+3474dVNAK0qw3dl4TwqdABeHew
	 CDcFMVEwB+6FO+Y/C4sV4h7SrswXr0fJsQHld8k1A5Z2b54kKpgH780WyGJ2MyOkFaSnL
	 7tSW2cFXvmzMBnogW4FpsHQN16zE0gGSFtdvfS86D0vM87e90EUlLjfU65zEIF0+sYz5/
	 hk3Gq8SFmEnEv6bYLfwcr1+UnZ7pUKQpaZnF3Fe4Q9gG0UkKf1LW6EAZA+X8ctYl/oR6S
	 SD8wJqKjKRoz7f8WMmM6lOiZ8lHRsH9CF1lgvLkXBaTk3OtCQxQGFciIB+Ptzuu3WOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044940;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=pU5b5ihcYnoiOulq03sY9zpKeBhkxlrYNGiLlmtR8+0=;
	b=JN24DP1D0kGEA1qY/E7cb3UZtGB2X9Yr+J7DzoKAFoGla96+kHoHXe2cmQIUnHuFngPr
	 s1SZ+2EzGnQ66FB24acR90ZA0TUUUCL7xnSBATLIZKh6qnAG5vchnLwEMKw9PG5V8dP62
	 XSfXBn8rH3es23/TRwWiejbZEbM25e4hoe4aSjo/iUyiusbswwnzCUB97H92qk08tOsCK
	 X+d5+qAteIY0aZGFjDVFIT/6SimBLmpxcMJ14GmpJ6BIdnvPUBc/vB/18UkUeL3RmiCWk
	 oQThcPEmQB4fiL2zGoa+473NjDdpMlxJummYYlh5ALD9FBd11ryFbxyinpapGOhZEmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fa30BEEM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CF2606A31A;
	Mon, 26 Oct 2026 20:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fa30BEEM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AABE41F01825;
	Mon, 26 Oct 2026 20:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044939;
	bh=pU5b5ihcYnoiOulq03sY9zpKeBhkxlrYNGiLlmtR8+0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fa30BEEMAWJNd6ifbLnG4k7C33ee498bhauewafyMZ8tZfJMmcFcflsxoC5yxOCce
	 W0qY/OwtxQL+zBTGzNQsVV7X+pPlERL4xCA2FHtWvySY7Ybkyt1OinOjnQLWpUoCym
	 73fI/lUYwhOLl6TvnjQ/aHUVDVVbg1phGDGdAPt13DY8wtlpuPbNo2xUadOYuJCP/U
	 CoXYhrZL0vKfG56uby3pc8IMk++oVCNAxxUmAm4ppxxPlAlhTV57ypqcn+1mLxozez
	 AIP4JIJFJiBHL9XFSV/GJ/4kPa/iefpS83DlBQCDmYIZYqlgf8fu1RLL1BNw92CsRj
	 9QzCCaOsQ4QPA==
Message-ID: <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
Date: Mon, 26 Oct 2026 21:02:12 +0100
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
Subject: Re: [PATCH v14 RESEND 0/6] Merge redmi-wmi into bitland-mifs-wmi
To: Chris Taraszka <chris@miget.com>
Cc: Mingyou Chen <qby140326@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>,
 platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>,
 Serhiy Shliapuhin <shlyapugin@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
 <073e6aaa-12dd-4fc1-b7dd-4d27cb4e27b6@kernel.org>
 <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAAcRvKNvBKwVcPQ6vv-+OGZdL2Gxd-ocNyvZO_q-g083QNfR5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Oct-26 20:56, Chris Taraszka wrote:
> On Mon, 26 Oct 2026, Hans de Goede wrote:
>> 1) This assumes the event indicates a platform-profile-change has happened, if
>> it is a request for a platform-profile-change then platform_profile_cycle();
>> should be used instead.
> 
> Hi,
> 
> Some data for this and for Mingyou's KBD_BRIGHTNESS question, from the
> Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A), traced with a kprobe
> on bitland_mifs_wmi_notify() with v13 on v7.3 (v14 has the same event
> handling):

Thank you for the info.
> - Fn+Space (keyboard backlight) sends no WMI event at all, neither 0x05
>   nor anything else, and does not change the backlight under Linux. So
>   this model cannot tell whether the firmware handles KBD_BRIGHTNESS.

Hmm, I wonder if this maybe sends some scan-code on the PS/2 atkbd
interface? Windows must get an event somehow ...

> - Fn+K sends event 0x28 with value_low 0x01 on every press (01 28 01 00),
>   not 0x16. The firmware does not change the mode by itself: the
>   SystemPerMode value (EC 0x68) stays the same across the presses. If
>   0x28 is the performance mode key on this model, it is a request rather
>   than a notification, so platform_profile_cycle() would fit. 0x28 is
>   currently logged as "Unknown WMI event".

Ack, this sounds like a case for calling platform_profile_cycle() if
platform-profile support is present.

> - On Windows on the same machine, with Xiaomi PC Manager not running
>   (it fails to start on this install), neither Fn+K nor Fn+Space does
>   anything either. So Fn+K looks like a request that Xiaomi's software
>   normally acts on, not a mode change made by the firmware.
> 
> - Mic mute sends 0x21 with value_low 1 and 0 and is reported as
>   KEY_MICMUTE, as expected.

Hmm, if the value-low toggles I wonder if the firmware also mutes
the mic itself ?  This may need some special handling.

Regards,

Hans


