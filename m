Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E94DBD8A
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784647334; cv=none; b=PtMP/XyHzASUWRM7zHqetktqpn7D+7n/iH0Q6PrLz6vc5p741L49Yjzg/DHa8iFjXMSFJ414i/ySSeaLuurXMfZubwgaMr3ravaUjniLGfhTI65Hb9yrD7uxkNiPPukutEkUUt0/Mv2iaa4veIXnH+rRcZ+eaS6cogLFcDO+vac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784647334; c=relaxed/simple;
	bh=1Ymu+TwGrAu+oJ+mlC+P9bOJc8zvRiqYCXNiBSnRZR8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZgtjRfr1UJ72FBubLFs2FBZh2oNwy7NlxL4Ct+zP9pxn2WzdNAYWdUzLo55/5JOhQyQ8c6zOAx3E/smdSVSv57Z1gUGOpFoEC9ew/UALL9BKtYqO5WOglB7ZvVl+bh5XmkPkQD1reKKoW0PmbNfk39siI3tJHwLxUUQVAfLTIJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ax7qrhv6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ax7qrhv6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A509B1F00A3F;
	Tue, 21 Jul 2026 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784647333;
	bh=/D4C3AIr6E1zAsKTC3TElMQH6na7sXVfRXuSia5diEo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ax7qrhv6WPaFIMHoGTbAhs4L1sKYvprDZnC8USPuDH5Ijpfrv5JmSueMHLhtK9rA4
	 Gy+jX38NcoLh2Ekm4pNoN4Uau20GcVClnj0KxLv/ywdnTqi4GDOg3m22VMLCWDrzxL
	 Zz4oqFU9fBPMuzzcF1Acx7XbiYi4GCgqTa/Af+GMVTdEPUYllb9RiURafCawzKV5QT
	 Lbwnu05ztesQoTSTMG7bF/ve1aHBDAtU2Ga8r+5drJUj/eayH3wZZWBTtTuBrEyvVU
	 uK5U7t6Pw0eUDch1FPZnVei0RuF9aCBgDqh8PsVs4AvwUqhT3p5JziYYvElTfnRCHk
	 T/otMWBt+siyA==
Message-ID: <eccfbc74-a01e-4fb2-b3e8-d6ede5fe6383@kernel.org>
Date: Tue, 21 Jul 2026 17:22:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ideapad-laptop: duplicate KEY_MICMUTE events (ACPI VPC bit 8 +
 WMI 0x3e) on ThinkBook 16 G7 ARP
To: =?UTF-8?B?0JDQvdC00YDQtdC5INCi0LjRiNC40L0=?= <nightfilebox@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: kepanhc@gmail.com, ilpo.jarvinen@linux.intel.com
References: <CAPr_SFPsWx2Fv-jewUO+NoYqPfJwSrmniTkR5J=9DCNWnUwkEw@mail.gmail.com>
 <CAPr_SFODyj5O_5suq2m+vvWswe+-QqBSWYHGVSjFE4HJYo+V1Q@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAPr_SFODyj5O_5suq2m+vvWswe+-QqBSWYHGVSjFE4HJYo+V1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 20-Jul-26 22:44, Андрей Тишин wrote:
> Hi,
> 
> On a Lenovo ThinkBook 16 G7 ARP (Ryzen AI, CachyOS/Arch, kernel
> 7.1.3-2-cachyos), pressing the physical mic-mute key (Fn+F4) toggles
> the microphone mute twice, effectively cancelling itself (two
> notifications appear in the desktop: "microphone muted" immediately
> followed by "microphone unmuted").
> 
> Looking at drivers/platform/x86/lenovo/ideapad-laptop.c, I believe
> this is because the same physical keypress is reported through two
> independent, non-deduplicated paths that both map to KEY_MICMUTE:
> 
> 1. Legacy ACPI VPC notify, bit 8:
> case 8: ... ideapad_input_report(priv, bit);
> -> keymap: { KE_KEY, 8, { KEY_MICMUTE } }
> 
> 2. WMI event 0x3e:
> { KE_KEY, 0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> (comment: "Specific to some newer models")
> 
> `ideapad_acpi_notify()` and `ideapad_wmi_notify()` are called
> independently with no shared debounce/dedup state, so on this model
> the firmware appears to fire both notifications for a single physical
> press.
> 
> evtest output on "Ideapad extra buttons" confirms two distinct
> scancodes arriving ~1-2ms apart for one physical press:
> Event: ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 08
> Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 1
> Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 0
> Event: ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 13e <- 0x100(WMI) | 0x3e
> Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 1
> Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 0
> 
> Separately, the AT Translated Set 2 keyboard on this laptop also
> appears to have a related firmware issue: KEY_VOLUMEUP/KEY_VOLUMEDOWN
> release events are sometimes delayed by several seconds, causing
> volume to run away to 0%/100% via autorepeat before release finally
> arrives (this part I've worked around locally via the existing atkbd
> force_release sysfs mechanism with scancodes 174,176 - not a
> kernel-side issue, just documenting for context in case it's related
> to the same buggy EC).

I think you should be able to make the force-release stuff
happen automatically by adding a volume-key mapping matching
the DMI strings of your laptop with the "key identifier" string
prefixed with ! in:

/lib/udev/hwdb.d/60-keyboard.hwdb

Look for "ThinkBook16G6IRL" for a set of existing lenovo
models needing this and just add a match line with your DMI
strings there.

Once you've this working please submit a pull-request to systemd
upstream to get this workaround added to the official hwdb.

> System info:
> dmidecode -s system-version: ThinkBook 16 G7 ARP
> dmidecode -s baseboard-product-name: LNVNB161216
> BIOS version: P6CN34WW
> kernel: 7.1.3-2-cachyos
> 
> Would something like a jiffies-based debounce between the two report
> paths (similar to the approach used in hid-plantronics.c for a
> comparable "duplicate volume key press" issue) be an acceptable fix,
> or is there a preferred way to detect/disable one of the two reporting
> channels for affected models?
> Happy to test patches or provide more logs (full evtest dump, acpi
> dump, etc.) if useful.

Unless in the next couple of days someone comes up with a better
fix, then yes I think some jiffies based filtering of the duplicate
events would be useful. This way we fix this issue once and for all
(in case it pops up on other models too) where as a model specific quirk
disabling one of the two paths only fixes it for your model.

Regards,

Hans


