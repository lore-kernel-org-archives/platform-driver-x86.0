Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794773437;
	b=S05vFRXoAB9LztzXEBCp+NJToRVvTBAgWd87e/BhzxZs/VFccrv6iNlNOslompsZQHRv
	 EPFfvgf8Q2MbBdSuvJ3aFjff48fgQwsfMAW1M2XTnO7J3P2kXBWED3h9XKMQ/CK93H8So
	 OU71nn19BaHKhrzFoYwuRXlz2xff167n3wDSvVmjvM1yEQ6VWNAb+B5RluC4jKvEOWUkK
	 phzoUbrDmZHkjGqyu4yeZHgJmgwlMyDbTbd1CQnhj0tgYFQ6IBOMvYPUuNrcLCySlSBOR
	 4tatKIl5j73hsdbK/ci8Z2E1vdblc3B9Ci5k8lRQXGQBrOealfZWpxQaX+XqBhlwBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794773437;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=fY6ts3UpdKSZekbZMfUpiIB2uSyNAubM1Fu0CpHtkJQ=;
	b=1ahcugU3fef5Td4xhGDVra78juE9f2+cqskjTfE4BIVSeubu/3dMoEx3/At8dLQvwM8n
	 FFOZH69XHyVuRQftDZnN3q6IatXMUwkTFy0L1eZBcqhKcetqpjucnlx7uRP570Qbo4JnU
	 nf/rGRi2/khdME+A0Qw7bSO43AcrkbJ16PIMo+v94F7b9WDvFokLxNU0fXWxG4g5Vp8p4
	 /WLZX5jvYJvXJC7vN9lBM5ugZVNG5jVIcEmzQ9v6j+HlKQjpvSZrwjR/0C+UbkSxC60FU
	 VzYbt4L+pABbsmkc38s841D82YEmor5UtzpCEE/kq05nUKH35VCJ1LNf4bROH8bXT/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bI1fnjK5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9860D606A31F;
	Sun, 15 Nov 2026 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bI1fnjK5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BF8F1F000C4;
	Sun, 15 Nov 2026 20:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794773437;
	bh=fY6ts3UpdKSZekbZMfUpiIB2uSyNAubM1Fu0CpHtkJQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=bI1fnjK5sCe4qRQGt1y5+5mzEpKJ6o0HtTvflIZaEQ79P6FQFECI4DoLnPR69fLTE
	 R7go47rbypxBaprDTSP+waqbT2cTPg2UD9QJYZZiFFn5Ih2MgCIlrrdq5LkmH7qwyn
	 sXR6L2uXiy/dXfatKvGVV6oFc/AHgSuMDwNytsR+OnIF9el5rE96iIO8jiSX67X/jh
	 2uucix7sfS1XzThMsWG9oqnGQDFy8E8OFAHcRlVwSWpAyxmzZK/5qC3vwqDrpFL6DO
	 cpTZiNdUqHEbdYCIDz5VOm3EdYi+s3eVnAlYgLT+W7oLgtEUvU9H0Cful6WkEz6M4b
	 0l7gCifupZbDQ==
Message-ID: <8aa1533d-8f9c-4c69-aa34-266ea3beb54e@kernel.org>
Date: Sun, 15 Nov 2026 21:10:33 +0100
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
Content-Language: en-US, nl
In-Reply-To: <e8cef61a-2864-4749-a734-3c42c2f32f28@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15-Nov-26 16:33, Hans de Goede wrote:

<snip>

>>   b. Should the Fn key event handling stay a separate small driver, or
>>      be factored out of ideapad-laptop so x86 and arm64 share one path?
>>      ideapad-laptop handles the event only when its VPC platform driver
>>      is bound, and the arm64 machines expose none of the VPC interface
>>      it is built on (no _CFG, VPCR/VPCW, DYTC or HALS/SALS), so making
>>      it the single driver means gating most of its probe. Two smaller
>>      options: lift ideapad-laptop's own Fn key wmi_driver and keymap
>>      into this file and let ideapad-laptop register for the events it
>>      still wants (Fn lock LED, DYTC cycle), or the hid-asus/asus-wmi
>>      shape where a companion WMI module exports the event to a
>>      subsystem driver. The keymap in patch 2 duplicates entries of
>>      ideapad-laptop's table on purpose until that is decided.
> 
> IIRC the ideapad-laptop driver is a bit of a mess atm, so factoring
> a common handling for the the Fn key events out of this and sharing
> that sounds like a nice cleanup.
> 
> I see that patch 2/3 uses the new wmi-driver/-bus infra which is
> nice and clean.
> 
> So maybe just keep your existing stand-alone driver for both x86_64 +
> arm64 and drop the WMI event handling from ideapad-laptop.
> 
> I guess this may hit some problems where WMI event handlig is used
> in ideapad-laptops integrating with some VPC functionality.
> 
> For that purpose I think that the new
> drivers/platform/lenovo/wmi-hotkeys.c could maybe expose some
> notifier and call that for events it does not handle itself
> and then ideapad-laptop can depend on some function to register
> a listener on that notifier (1) and register a notifier handler
> staying out of WMI handling itself.
> 
> No idea if this is feasible / how clean the end result will be,
> just brainstorming and saying yes to doing some refactoring of
> the somewhat messy ideapad-laptop code.
> 
> Note that https://github.com/systemd/systemd/blob/main/hwdb.d/60-keyboard.hwdb
> has some mappings for "Ideapad extra buttons" input devices
> (+ DMI match), so if any of the buttons remapped there end up
> under the new WMI driver then that should probably give its
> input device the same name, to make sure those mappings still
> apply.

Also see this just posted ideapad-laptop series which does
something similar for handling YMC events:

https://lore.kernel.org/platform-driver-x86/20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe/

Regards,
 
Hans




> 1) +Kconfig dep, which will also avoid regressions by wrong
> Kconfig
