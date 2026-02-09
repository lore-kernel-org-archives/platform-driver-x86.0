Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F61D37E304
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650108; cv=none; b=Hmc96vu1PzZRtEJJHQVD67wpzUVQ6SvdRPu1+TYViUvxd4vEcp+NwXQg1Y+sbH/s17Ds030KKfqa8Pss2FkvV0NLS52NW9d4K9xEQbtSYZ/BuHIAaYpalD3ySmdF/qnEQ5WdZ6yQ0W/tsj0N3JzoO3X6+sIM+tr3CKbmkN+kpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650108; c=relaxed/simple;
	bh=vyY7HAiVUEWLqm5b3xl2bxK8NP84E7p/BAV8KJ8ZIIs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tZoV0lHYG61tr6KDU8tupCOPLEX0Plsz1wXBawHRBwk91hYGCAnKTUzGiXbQBh4gxIUDYsfz5DAf3N/a7kIBgIo+DsjDkhcQLidYUha6XX2OabP3FRzxr6WEvONKSGiJo0o8vVn99huhPrr5Xxopqq4OemvvvDC6tMrhrEl1KfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmdnAGKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmdnAGKU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693C7C116C6;
	Mon,  9 Feb 2026 15:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770650107;
	bh=vyY7HAiVUEWLqm5b3xl2bxK8NP84E7p/BAV8KJ8ZIIs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KmdnAGKU05jq+HRvf43orkhIwM5iQ2VMmNuPWoOFzCj3R7g1PlXiQ9ylBWHswpxv7
	 5gjNrjf1tOCOkQQBEk5EoiyzsY0usu7THIHlA+4GxHcmmCPQCCMaY3UZnG9zt8z6Pn
	 mEUAe/W/hQXjmvaYf++dMWtpcuaVn4gcVkrzfQu5wvHf0I1s7a9fJ0CP544C+NYHaC
	 8qOtkPQrjIjhwMIgsOnQp1pYqjnscl/bbLePvZMFv/kqZIuNJ2aTHgIbQ1vnP+KEuH
	 5dtkfGh/SF9MOhi9nCK4vq0iYit9hqvM8gVqGHtCJKebWhvcGpODUrDuBDWRN5YoaU
	 KmIIDRVR8TFPA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 61241F40068;
	Mon,  9 Feb 2026 10:15:06 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 09 Feb 2026 10:15:06 -0500
X-ME-Sender: <xms:-vmJaYVI7EInedda9rF-W42ecZAEGlNEdHQ6E9YDZN2eMSfGUN-j9g>
    <xme:-vmJaXYy7dNb-HSqUAO7Yq5PHDWYj2BbOuucuNQogACetb-MPT8icPXL5lZauvCDM
    XRlDcn-YtSNEbC2sjUukvBHbkMZ4sAg5_X-i4YmR3nfIEZeI-9DLY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleejudegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepughm
    ihhtrhihrdhtohhrohhkhhhovhesghhmrghilhdrtghomhdprhgtphhtthhopehjvghkhh
    horhesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhihidrshhhvghvtghhvghn
    khhosehinhhtvghlrdgtohhmpdhrtghpthhtoheprghnugihsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegsrhhglheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhgrnhhs
    gheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslh
    hinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhv
    vghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-vmJae3fq17MVP2SvxgHTXAI3r4f-KBsthdF4AHs3J1XGyykTOdEnA>
    <xmx:-vmJadFDkY8fLA_NqwthJ7CCMrq8Wclf6HXaYi6yNg9koeYNRo58FA>
    <xmx:-vmJaZH2NulyxGQQ8cXlCHRa_DphMMAjPMLmBILNg4GpYFzaYa8hfQ>
    <xmx:-vmJaQ4iTewilo6cBI6bz9Bqp3kN0V5MOUuaWqi6igRiw8zu2Rexkg>
    <xmx:-vmJaezodfnVFz9uncqzpTRDfJRS_yT-ZBoxSl5xZaN4VEjneIn9ZOkh>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3D0CC700063; Mon,  9 Feb 2026 10:15:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AuWteFS6Yydg
Date: Mon, 09 Feb 2026 16:13:26 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Bartosz Golaszewski" <brgl@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Yauhen Kharuzhy" <jekhor@gmail.com>
Message-Id: <a38ad0ec-e72b-4667-bd5b-f12bf147016e@app.fastmail.com>
In-Reply-To: <aYnqY4KPq2Gqj3Dv@google.com>
References: <20250920200713.20193-1-hansg@kernel.org>
 <20250920200713.20193-2-hansg@kernel.org> <aYkdKfP5fg6iywgr@jekhomev>
 <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org>
 <aYnqY4KPq2Gqj3Dv@google.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert Goodix devices
 to GPIO references
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 9, 2026, at 15:41, Dmitry Torokhov wrote:
> On Mon, Feb 09, 2026 at 03:00:40PM +0100, Hans de Goede wrote:
>> On 9-Feb-26 12:52, Bartosz Golaszewski wrote:
>> > On Mon, 9 Feb 2026 09:08:04 +0100, Andy Shevchenko <andriy.shevchenko@intel.com> said:
>
> I think the hardest breakages are here:
>
> arch/arm/mach-omap1/board-nokia770.c
> arch/arm/mach-pxa/gumstix.c
> arch/arm/mach-pxa/spitz.c
> arch/arm/mach-tegra/board-paz00.c
>
> If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> can see it does not even have a fwnode assigned: it either does not have
> parent or its parent is a platform device instantiated by the driver
> itself and does not have a firmware node associated with it.

I've been meaning to drop support for mach-pxa board files including
gumstix and spitz for a while, I should probably just do it sooner
than later.

I don't know why paz00.c still contains the fwnode entries, I believe
that should have been converted to a device node in
arch/arm/boot/dts/nvidia/tegra20-paz00.dts after d64c732dfc9e
("net: rfkill: gpio: add DT support").

      Arnd
