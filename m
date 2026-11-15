Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773566;
	b=S5Gp9ySNEC6AFSQwyG3AZGGSZKwGgaeNwxAS2Dx1KH/WAvw/VyuSx/fZVfOcQtBfXHqR
	 77uWr2/SKMsH3pPPab/c4P6TOURBAIWlbTzQ81LNij0xusksmGet1h2/G9OHKK4T/8Xs+
	 nr6qFO1gKT5OEuZ5QIFTnNGtrE4b1A7d2s68WEKwKtSxH2TTMR6Gr532SUOnW1LkzVF72
	 VHxLm6d984J0YJxU3GFSaUGrtg2za3g+1+izfDR4oV8WnTyNgRXrx+aR12W/J2B+UjUGK
	 Ldma2xx5Ww65/J5FijvImPs27WdTAe8xDmQwzgU25TlQtuhqzIhbZYX52bGcIRYRWiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773566;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=W7R9r3+PwO3HaNMfswYZf8EFH77zBYz1+XEhTJUYx+M=;
	b=usztSzfK5g5oZarjGhGJYLHupkXtN1cQuZYCv3sMglbE9uI0vMIJKptbgtZVbvmmRhUl
	 MeOMZkG/g6LnoIwxyU39a4YmEvwkg/eUIyQ2KRgGuqWpRfKYZmsSY3amDQsICoLPnimaA
	 P6KAZTiQ8zlgUxQinwR8VvOKOtGAU/LkZaFHHVBQohGH0YJC3alWKUpgLwq3MQ9+VW3qf
	 +yS5USkNqAGEXaoVZM99e9KU4qCk7KJ2lihmoHJcezpeVoDi/32qNFuKxM9weugj5mE9D
	 zqF2anvXIVjhoYxKsTCizpc+B5K+n3V9R1x6ZHlBENIZlUZ36BplHOopGNaVYpCWnig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDhK48jw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F04606A31F;
	Sun, 15 Nov 2026 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WDhK48jw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D3F81F000C5;
	Sun, 15 Nov 2026 20:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773566;
	bh=W7R9r3+PwO3HaNMfswYZf8EFH77zBYz1+XEhTJUYx+M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=WDhK48jwW1Vx6WX07O0i6SJ9G78dh75BDhksEf6cqhffnI+lX6ecIhFYNAJIa4nTK
	 VCKyMv/+VPnEKUXymzdGgh26+v/JaBZxv5U/pGc3LWE1+C4Z+hrFMFFgRF/WWGmgeH
	 Z0/OO3QxkERQpZZhZqMYE8Igjm9upGMEotY1gpeR9YagVZhrOA+euBMkGTdkZCkXD6
	 XLEazZ4ll7Y5tp4/hqmrnM33rOmvg7RzVml13mfOdCjrZQlQEnDMJ9vUd3MouL8wZJ
	 822OuaB1IQTHT6I4peHzCpXampCtfXuTvGm9ijwAN+GieVlA5x2MRw1xHkdVGoQNNm
	 gpciHRwiqx+ww==
Message-ID: <206de2d5-ef5a-4490-b6b7-c0e98893ec5b@kernel.org>
Date: Sun, 15 Nov 2026 21:12:43 +0100
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
Subject: Re: [RFC PATCH 0/3] platform: lenovo: architecture independent home
 for the Lenovo WMI drivers
From: Hans de Goede <hansg@kernel.org>
To: David Cemin <dcemin@nvidia.com>, ilpo.jarvinen@linux.intel.com,
 W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
 <8aa1533d-8f9c-4c69-aa34-266ea3beb54e@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <8aa1533d-8f9c-4c69-aa34-266ea3beb54e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

p.s.

On 15-Nov-26 21:10, Hans de Goede wrote:
> On 15-Nov-26 16:33, Hans de Goede wrote:
> 
> <snip>
> 
>>>   b. Should the Fn key event handling stay a separate small driver, or
>>>      be factored out of ideapad-laptop so x86 and arm64 share one path?
>>>      ideapad-laptop handles the event only when its VPC platform driver
>>>      is bound, and the arm64 machines expose none of the VPC interface
>>>      it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>>>      it the single driver means gating most of its probe. Two smaller
>>>      options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>>>      into this file and let ideapad-laptop register for the events it
>>>      still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>>>      shape where a companion WMI module exports the event to a
>>>      subsystem driver. The keymap in patch 2 duplicates entries of
>>>      ideapad-laptop's table on purpose until that is decided.
>>
>> IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
>> a common handling for the the Fn key events out of this and sharing
>> that sounds like a nice cleanup.
>>
>> I see that patch 2/3 uses the new wmi-driver/-bus infra which is
>> nice and clean.
>>
>> So maybe just keep your existing stand-alone driver for both x86_64 +
>> arm64 and drop the WMI event handling from ideapad-laptop.
>>
>> I guess this may hit some problems where WMI event handlig is used
>> in ideapad-laptops integrating with some VPC functionality.
>>
>> For that purpose I think that the new
>> drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
>> notifier and call that for events it does not handle itself
>> and then ideapad-laptop can depend on some function to register
>> a listener on that notifier (1) and register a notifier handler
>> staying out of WMI handling itself.
>>
>> No idea if this is feasible / how clean the end result will be,
>> just brainstorming and saying yes to doing some refactoring of
>> the somewhat messy ideapad-laptop code.
>>
>> Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
>> has some mappings for "Ideapad extra buttons" input devices
>> (+ DMI match), so if any of the buttons remapped there end up
>> under the new WMI driver then that should probably give its
>> input device the same name, to make sure those mappings still
>> apply.
> 
> Also see this just posted ideapad-laptop series which does
> something similar for handling YMC events:
> 
> https://lore.kernel.org/platform-driver-x86/20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe/

I see that this routes everything through a new lenovo wmi-events
helper which uses a single notifier to which interested parties
like ideapad-laptop can subscribe. I think this models could
be extended to also handle the hotkeys, assuming all the base
bits are moved into the new drivers/platform/lenovo/ dir.

Regards,
 
Hans

