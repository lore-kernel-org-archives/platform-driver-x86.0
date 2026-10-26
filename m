Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.59
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043505;
	b=lrnJ4jPBlD02sAfaOFed0tibGoZGiEWocC6kaRFqzAYIG7kUEG3kYFkRbUjzRS7YfZcd
	 hlN6gLfi6PDG8rN1oLZzgd84gRYu+YyvJp9VlmKrm3IsptFYnFiZWWYQcQWRw7qRsw1Dk
	 X7JBM6lttP1cjPjNrJXNd9aoAvwGJsdfCr1d137khyJoc/UOI35jnqy7rgkleSDSeaC74
	 h5mrqwyGGICgj1O4jzaoWkr2W8+ic8YagsprqcYpueDI9v1va688GkGtRCNVVUp4vBUWC
	 wZDA2ODq4KLQWpil7GqS95mZU+ed8ySWbhWvm7mdmwkWstns84MkwjVWemt/6PE7DmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043505;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=dSxMcvCi50FStr9NIPYVVCpZkXKm+Vd8EruufX/uBTA=;
	b=ns/SNxDDxhsjGDr8N4gxRlR1OLGemHMbezj0PPp6l+3UaQYlqhK9nFNCA9iuP3J4UaPt
	 lvvHUP5PVZU9G4a2mEipewUM90Re65y0w1xVbsgThLbdxwOZONCOORy+8pk/tJj0tgCrs
	 W22JqpVEe7xjddAJBXn1eks/H0Y5EcYPORuYi8eeolab1HVBRAvEgUJFR/mJXY9FCtC+P
	 oCn0f2Y1k4R919vdM7C2espGUeZEHslRxNdxSFQadxQH0hBxpVBO80zQQK+oSiPFEssAd
	 MskNlVvQMqP/tVKuK/8L2LmycGU3y0K+X8+OQe/9y7VbxZMTkim4GleOteR3vf1M6Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vofSMuHZ;
	arc=none smtp.remote-ip=91.218.175.59
Received: from mta0.migadu.com (out-59.mta0.migadu.com [91.218.175.59])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE0606A31E
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 19:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vofSMuHZ
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=526XwKCaV8g60Tmvkvy/WpLSza7NhvA7cZDq6upGYME=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793043502; v=1; x=1793648302;
 b=vofSMuHZLbjx9qTH9SNM1w2Zab5XIucse9pgKZemcKrgdkKtpBKUyJrgG6ieWP3uTxRkqN0b
 NGQpNVcTfIu3emPnDje2GiN8sAuTUVYJWJigmEVgDuxscBQOYipPE2POBcth1JHdvawHAlnY+ly
 WHp93Rd19ELTrYSoPJyl3GsQ=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f858b6db7119bcd9;
	Mon, 26 Oct 2026 19:38:22 +0000
X-Mizu-Trace-ID: f858b6db7119bcd9
X-Migadu-Flow: FLOW_OUT
Message-ID: <ca5e15e8-5ef4-431e-91bb-198a00d6942f@linux.dev>
Date: Mon, 26 Oct 2026 20:38:20 +0100
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
Subject: Re: [PATCH v11 12/18] HID: asus: size feature reports from the HID
 report descriptor
To: =?UTF-8?Q?Rebecca_Mara_M=C3=BCller?= <rebecca.mara@posteo.de>
Cc: Paolo Pisati <p.pisati@gmail.com>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 kernel@lists.opengamingcollective.org,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schwartz <matthew.schwartz@linux.dev>,
 Denis Benato <benato.denis96@gmail.com>, Jonathan LoBue
 <jlobue10@gmail.com>, Khamunetri Clark <khamunetriclark@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>,
 Nathan Chancellor <nathan@kernel.org>, Ivan Levchenko <me@livan.pro>,
 Corentin Chary <corentin.chary@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20261025235232.129945-13-denis.benato@linux.dev>
 <20261026130606.212382-1-rebecca.mara@posteo.de>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261026130606.212382-1-rebecca.mara@posteo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/26/26 14:06, Rebecca Mara Müller wrote:
> Hi Denis,
>
> in the cover letter you asked Paolo and me to try asus_report_len() on
> the Zenbook Duo. It works there, and it covers what Paolo's v4 5/7
> ("Do not send feature reports larger than declared") was written for.

Hi Rebecca,

Yeah I felt like putting an end about that whole class of bugs
while also unifying some core code across devices was the right
move.

I apologize for making things a bit more complicated (and perhaps
adding delay) but I feel like this is the right thing to do for everyone.

> Setup: hid.git for-next (hid-asus.c f6aa1be09ad5, the base of your
> 01/18), your patches 01-12, then Paolo's v4 1-4 and 6-7, leaving out
> 5/7. I stopped at 12 because 16/17 change asus-wmi and asus-armoury,
> which I cannot swap on this kernel. Paolo's 4/7 needed a trivial
> manual fixup (include context and the enum hunk); 6/7 and 7/7 applied
> cleanly. Built out-of-tree against a 7.2.6-based distribution kernel,
> UX8407AA, with my userspace workaround stopped.

Those asus-wmi changes are for the old non-thunderbolt XG mobile:
you don't have that hardware connector anyway and no more laptops
will be made with it so not a problem, I have this hardware and can
confirm it kept working (albeit sashiko-bot spotted an issue that I couldn't
with just my nvidia).

> - Docked (USB, 0b05:1cd7), captured with usbmon while reloading the
>   module and pressing the backlight key: every feature report goes to
>   interface 4 as report 0x5a with wLength 16, zero-padded. That is the
>   handshake SET and its GET read-back, the 0x05 function query and its
>   GET, the initial brightness, and two brightness changes. All
>   transfers completed with status 0. The backlight key and Fn+F
>   (platform profile) work.
> - Bluetooth (0b05:1cd8): the backlight key and Fn+F work, no errors
>   in the log. This is where, as described in 5/7, the 64 byte writes
>   used to fail with -EIO.
> - After docking again: backlight and Fn+F still work, and the input
>   devices keep their hid-generic names.
>
> So from my side 5/7 can be dropped in favour of this patch, and Paolo
> can rebase the remaining Zenbook Duo patches on top of it.
>
> Tested-by: Rebecca Mara Müller <rebecca.mara@posteo.de> # UX8407AA

Splendid! Thank you very much! With this tested, a ROG ally, an
ASUS touchpad and a 2022 TUF tested this should improve the
driver for at least 90% of supported devices!

> Thanks,
> Rebecca
