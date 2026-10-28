Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188223;
	b=lCE7tx3KvGAK6u9jv7kDDG5Gyalc9gFL/nHh55i/X89QlnbnVaNAusjZWGtr4AfCOb0j
	 DC6O9zgtPIJmfCgFcWSh/WVLC/1jdGT+cV7k521Sack/JbtSzqltKtPc0s6Rz0/+p5spt
	 Z3yn9ttqC5JvtLIfP1VLzPXsHN+0wqoeUPLfrLPcs9hk+ogT9P4DWjOyeGMDHkcly1zOB
	 CmtbBm9I04CPptUEctP82u6OGGXGI9oz1hi9KwREa2H6zAsua5XUjb9CnXT9MT4qrp32q
	 narN8dhbj466zBUyOB7ciKQQe1P0vD+8H9ebDGbo1GyxZp0PBTOecRKwg4q7n42FAew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188223;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=83QtEPwdk/2d6ftGdIz0kxKbpjSvfz4LJ7XnrN4HQiQ=;
	b=ue/2q5baghzhDblEbZO831kioNW/c900hbHhfaqYT7FcIFwopPcXd8BSGsRb2GLLyHIf
	 h/1xv5XJw3IgHZFnAuExfFFqXJVp+Wy+jau9gIV6xcacHZOTjdfBrjZmLdoFFvUOl9BmU
	 sQ9jXFwE/1Pr48X3whM7oH7LYzvm8ze73MQWecalN/ThQ+wA44IbysJU/CiVF4jujld3t
	 mrlLStrUnV+WhD2WZCwmSqfYduVMzrIuk1HPsVN24EcH57/CdFWMMS/XGGur5oz4wGiAX
	 sqMTFoA8bmsQ4bkYd4CFzmwoTsd65ngpkNYckqaSBpfLnRHVGZNkvRx2UaDBZkAUjWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEVjSy5o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597E606A31C;
	Wed, 28 Oct 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GEVjSy5o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF4B1F01825;
	Wed, 28 Oct 2026 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793188222;
	bh=83QtEPwdk/2d6ftGdIz0kxKbpjSvfz4LJ7XnrN4HQiQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GEVjSy5oGZSt3yyx92C5KiNrt4AqDb2z3Alu+tqr4dWr+SMcu78XdbNiMo1yPvBef
	 wJSYDyfEpXkUVF7AM7L59lIlt06wIjf/p55mbfGRWEVGH1P50gZg4GwTgZTvab7cKj
	 GGhXcHcaL6Xuw557XM2c4XsZM5sMe2I0ZckqEpyIEDXe09lIr+6EOYF8XJtIPyf66n
	 Ecg1C1zpkuknnWtr2dhWzy7xJ+iW+QY9e6KFVxnybatnME0k73burzWzDdhqYLENgW
	 smMsh/R4ogXzyxex+O8mBUZEGyqRsEHmyEvbLc2+DamGfkbmlLgpz2HfTYJ5LDfymN
	 WyMyCeruKH2xA==
Message-ID: <fc016bc8-bc6e-47ed-a85e-891e522c3f24@kernel.org>
Date: Wed, 28 Oct 2026 12:50:17 +0100
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
 <f2dd98be-0551-4857-93c7-59ffad1d3e88@kernel.org>
 <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAAcRvKNYkXr+eor3JAYwO17vckeVAmYT+Dp+-wMobMmL40ukBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Oct-26 21:20, Chris Taraszka wrote:
> On Mon, 26 Oct 2026, Hans de Goede wrote:
>> Hmm, I wonder if this maybe sends some scan-code on the PS/2 atkbd
>> interface? Windows must get an event somehow ...
> 
> Hi Hans,
> 
> It does, but only the plain Space scancode: Fn+Space gives scan 0x39 /
> KEY_SPACE on the atkbd device, the same as Space alone, and Fn on its
> own sends nothing. So there is nothing that tells it apart from Space.

Hmm, so does Fn+space work under Windows ? If it works there, then there
must be some way to make it work under Linux...
>> Ack, this sounds like a case for calling platform_profile_cycle() if
>> platform-profile support is present.
> 
> I can send a patch for that on top of Mingyou's series and my TM2424
> patches.

Ack.
>> Hmm, if the value-low toggles I wonder if the firmware also mutes
>> the mic itself ?  This may need some special handling.
> 
> It does not. I played a 1 kHz tone through the speakers and recorded it
> with the internal microphone while pressing mic mute, with the PipeWire
> source forced unmuted: the level stayed the same with the key's LED on.
> 
> The LED is driven by the firmware and follows its own toggle state,
> which is what value_low reports. It does not follow the OS mute: muting
> the source from userspace leaves the LED off. So the two can get out of
> sync, but nothing in the audio path needs special handling.

Ok, so the value-low indicates the state of the LED, right ?

Interesting. Is there someway to manually toggle the LED like we do on
other laptops, so that we can actually sync it to the alsa-mixer
mic-mute state ?

If not then I think we need to add 2 new: KEY_MICMUTE_MUTE and
KEY_MICMUTE_UNMUTE key-codes to:

include/uapi/linux/input-event-codes.h

and send one of those depending on the state of the LED. This will
tell userspace to actually turn the mute on/off to match the LED
state, at least it will once someone takes the time to hook these
up in userspace, which is going to be a chunk of work ...

Being able to override the LED state would be much better.

For something analog (also good for the commit message to add
the new key-codes) see:

#define KEY_TOUCHPAD_TOGGLE     0x212   /* Request switch touchpad on or off */
#define KEY_TOUCHPAD_ON         0x213
#define KEY_TOUCHPAD_OFF        0x214

Where the old KEY_MICMUTE effectively is the toggle variant.

Regards,

Hans


