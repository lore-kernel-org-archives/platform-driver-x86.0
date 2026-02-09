Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873423803C8;
	Mon,  9 Feb 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651987; cv=none; b=kgDbEsJcykEErre4QIo7KxWYXKpMPGFqTcA7kIs5HofhOq2EKCDfdvK3vFYB00IRy5ZT/7TWEQRv7pMlOuoGxu3VfgoPTXkjKYZy9yBs6I2OOF5kNsd4DE/E/IdJkOhE+qOz4K8aXawwQyErWNLbRMba3xGfUxu+JND2trmo4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651987; c=relaxed/simple;
	bh=JMDIcfFDR87A2uq9pvjZ7ncSMzYVCb/WpGvYQk3gvTY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FGjbEom7XTgV0XLR/HuXOhjV1W8o2nAdEVBAZKEVd6RXIwPCeqdU3FHTloAxFJ1sJ243ms/FCRymlxegpEcn6IVgNsG9mPIxHFL9YOU6LRJUTh+S34s7OPwwg9MEhlLtCTHv4zDYttNijS2+fVxvtXHi1Rxy7+Ng7na+J7Ui4fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=vZ0GNnr7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bJNW5ZCc; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="vZ0GNnr7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bJNW5ZCc"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B82591D0017E;
	Mon,  9 Feb 2026 10:46:24 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 09 Feb 2026 10:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1770651984;
	 x=1770738384; bh=VVTc8AFxFWprNshjFgBiGVbkOhoCEuBZq1vKIvtqqc4=; b=
	vZ0GNnr7OqjFqy4Gc4Kw+WFrJMUwEEfUbnySGUUicV2VJBU6aoBHzDCiCro30UHA
	pA6PCxfULP+DSaMWffVMDe96OVtTEaJiKg2vyoUtyDyHGPeEVlXdGP0Wec0pQg4Z
	8Y7HDf1//63t5BCIRWrtAij3eXED4Ih4OOoeirv+DYPRlIGwoCT128HK1fSG0RpR
	5brgFdkR6y4In7M2uhj8R01F9yJpDBmZfw64aeVzlWvFHTUpkkPV8npnHZJWMC41
	B9sUKHlQOKSHrkd7g7n0Leh29vaRt4IOLKuYIkpVIE+FYkXkuU9oeRj99y2OMQrd
	5yrjDUyvXwBvumd5ryUVXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770651984; x=
	1770738384; bh=VVTc8AFxFWprNshjFgBiGVbkOhoCEuBZq1vKIvtqqc4=; b=b
	JNW5ZCcehcbZZd7h9cnsv7vsor1Yvp0qaEaLccCQqqGgWDlZmfqO0TSME1bVNZZ3
	N9EwQ/fTLFzlyddjeP0ybwNtbZ0qu9kWos/YgiBXs0uflG0L4ekhu3rbiOMAny5n
	5hTycWr2jy05u0tCN+4rlbecPef5H7mEzg//f6BKsXvxAuiLOAOps9dHJ13XgMpq
	49dz1hu7WFWf7J+H3kDLNShifegGd36alelOJay37pUQXmr6L02vNngCsnhIg2RM
	lhSaadDx7YrEBwxFDnAmlzylK0g7yQnX2PWsxDGb8CFTOOvdMdKcJT/4A66d335B
	GeoxB6Rw1M6fr7rvABSlA==
X-ME-Sender: <xms:TwGKafUOeAXTPjo5h30KoyHDpN6LpQd06csgr2RFxIOOijZPNPaNXA>
    <xme:TwGKaSZQ-UzFPaecghBjArpQ1cQ5aY1t-6RLNOvWg_MxMAilo_6zXX0ChpEeezqP0
    zJO3WHE0qttPxSzDlwA0kx2L4kmG1GcY2EugG4Z-RlXW-sUWfT46V8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpeelvddvleeuieevhefgudekleetheffvdejiedtkedv
    tdefffehhfdvfffffeffveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtph
    htthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggvrhgvkhhjohhh
    nhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehvihhshhhnuhhotghvse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghp
    thhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhhsrghnkhgrrh
    eslhgvnhhovhhordgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhi
    nhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghpihdquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehisehrohhn
    ghdrmhhovgdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:TwGKaW7yretjjeVZBcjR8kBFLhcNCXN1O0TDnanUfQGHDTsrCFZRpw>
    <xmx:TwGKabzfK3lSFmVhC4tGUjM5DjTq-QlvcDWOcIeKMRijHmc68l97cA>
    <xmx:TwGKaSdGzBtcHRaaGitw1z6RWZKJ3GGXsE0762YKR4n598iJRhwY6w>
    <xmx:TwGKaYBTJpgEN93Ul1xug3778KuBEggK7Vo3FRkqf_a4mCDqdiS-9w>
    <xmx:UAGKaQNZcCH3s6ozmFa-nJl1eKBV3hdC5qPnNgEq_OnhEyzJbppUeE0->
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4EEF72CE0072; Mon,  9 Feb 2026 10:46:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ASaOPSC57OEF
Date: Mon, 09 Feb 2026 10:46:03 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Hans de Goede" <hansg@kernel.org>,
 "Vishnu Sankar" <vishnuocv@gmail.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, "Vishnu Sankar" <vsankar@lenovo.com>
Message-Id: <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
In-Reply-To: <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic max_brightness
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Sun, Feb 8, 2026, at 3:58 PM, Rong Zhang wrote:
> Hi Hans, Vishnu and Mark,
>
> On Sun, 2026-02-08 at 11:54 +0100, Hans de Goede wrote:
>> Hi Vishnu,
>>=20
>> On 4-Feb-26 00:22, Vishnu Sankar wrote:
>> > Dynamically detect keyboard backlight capabilities and set
>> > max_brightness correctly (2 for old models, 3 for new models
>> > with Auto mode).
>>=20
>> Thank you for your patch.
>>=20
>> If I understand this correctly, writing 3 as level does not
>> make the backlight more bright then writing 2, but instead
>> it puts the backlight in some auto mode ?
>>=20
>> If I've that correct then  userspace should keep seeing
>> a range of 0 - 2 and the special auto mode value should
>> be reported / be made settable through a separate als_enabled
>> sysfs attribute under the LED class device. See:
>>=20
>> Documentation/ABI/testing/sysfs-platform-dell-laptop
>>=20
>> You can add extra attributes there by setting the groups
>> member of the struct led_classdev, see kbd_led_groups[]
>> in drivers/platform/x86/dell/dell-laptop.c, except that
>> you should use a .is_visible callback to only show this
>> on hw which supports it and you only need 1 group with
>> 1 attribute.
>
> When I implemented "als_enabled" for ideapad-laptop, Mark Pearson
> suggested it'd better to introduce "something similar to
> LED_BRIGHT_HW_CHANGED"=C2=A0rather than using custom attributes, as "t=
his is
> going to be a common feature across multiple vendors it might need
> doing at a common layer". Also, auto mode can be activated by HW as a
> result of user input, so we need an approach to notify userspace just
> like what LED_BRIGHT_HW_CHANGED does. More importantly, the read value
> of the brightness attribute becomes nonsense when auto mode is on. This
> matches the semantic of hw control trigger.
>
> I agreed with Mark and had a proposal of allowing HW to initiate a
> transition from "none" to hw control trigger and vice versa. See the
> thread in
> https://lore.kernel.org/all/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.f=
astmail.com/
>
> I hadn't push it further due to other things taking the priority,
> though I already had a PoC back to then. I quickly rebased the PoC with
> some cleanups and put it here for preview:
>
> https://github.com/Rongronggg9/linux/tree/leds-trigger-hw-changed
>
> I will find some time to refine it and send an RFC series.
>
Hi Rong,

Thanks for highlighting this (have to be honest - I'd forgotten we'd dis=
cussed it).
I think my suggestion may have been understood and I wonder your approac=
h is more complicated than needed.

I was thinking we add a new flag to the led_classdev. e.g
#define LED_AUTO_BRIGHTNESS         BIT(26)

Then the platform driver can set this flag and in led_classdev_register_=
ext we'd handle it appropriately to create a sysfs (e.g. auto_brightness=
_capable) node so user space knows auto is supported.
Other than that:
 - When the brightness is read and auton is being used - return "auto" i=
nstead of a value. Hopefully that doesn't break anything for user space?
 - When the brightness is set, you can use a value or 'auto" as you desi=
re (Documentation would need updating to allow this)

Really I was just looking for a way to advertise to user space that a au=
to option would be supported :)

Mark



