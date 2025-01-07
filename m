Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2182E154C15;
	Tue,  7 Jan 2025 02:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736218455; cv=none; b=BnnAADh8jhkL1iDisL+WFmW3vgIODSWQdp72KaA77Io2CF+SxkN2VXYyympEgfo0aLtj+RAlsNcLGbnsN/l1CLnTaGthu7h97y2a//mL+t4LUxcupqKwnnOrM8LGhIRmyleYKfFScLxGnFSsvgOQ3ZIKjkAGdse0HqqK8YKWJ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736218455; c=relaxed/simple;
	bh=DeoQNWa8vAAJQElHxsgxCFYtGMBHLVigbKRK6fQV/NE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YXb1kVgdI2AY6AxKiDxqJTiypbYdIw+f2x+vUn4mQqIKAT+kaVVaOqRWq99c6br3f16iS8td9G/Ect00Wc6aqVCN3e4aVqOsIhcYRfYtZkzZT0NvybTaz1hX8svipL0mKEkIIAWslI21vkH8D1qbIYPW42p53bj8DUFjDlyZ+ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=PVNWWtYZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CK/b/hAd; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="PVNWWtYZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CK/b/hAd"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 801C81140088;
	Mon,  6 Jan 2025 21:54:09 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Mon, 06 Jan 2025 21:54:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1736218449;
	 x=1736304849; bh=vN1gU1YPVSaufJoJrtFNUM8N7dJIo+w4PXkwm1gIb9s=; b=
	PVNWWtYZZN7EFnv52UdUHEkP+rJN3erWSXoQMjNwsAu09DYJZgs9QHrOD8YNl+jn
	0Zerzntq1Y5RyTffkuQAnG1RvTbh7AdSEDsL0ODINquj0cFI6Rrd7GebfxKN+6yN
	VeG0TAgyu6PIW6OvMbswKE7u5DbT0npEX0Mb6V2srPzh06Ba+J/bnIKvQ6HMw3TE
	YyFB96V1e8QBY73w340orjfhhbVFsyvM/z6c+FrJOtHIcI040K78LSz9fk35lh+Z
	9am29JMNNK055vBb1I/ZNJJVmF5NoVvVl7VZFaQLOksWq32xTAtOG/e+n6xtcls9
	nOLQ5eMQHj4pYmASRfKO5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736218449; x=
	1736304849; bh=vN1gU1YPVSaufJoJrtFNUM8N7dJIo+w4PXkwm1gIb9s=; b=C
	K/b/hAd1SQfYz58Hu/3xZSUIaFQe+l9PXZk1kue+oJw+UWE9OQXRF9foIuYu5gk9
	Ao8jRYbJjB3Z955MVMbqiyM7VYsQrQLxORLIv2WrGV/RvVRS76PUHhouUsv697pJ
	Rs14OZxiWxFYcLZmyCnRpCtiW3TYM9Y2pWQgcnfkvzhpzpl/38wiuk+vMZOt7ziO
	4pbUXB4JYsrvB0q/qXgQMDRBYdMkRFhw1Aiwwl3hEADy5MPzpOkKzP+BfJLYdqJq
	6p4D2lVtdBpHU53KtfPi4auzs3Al0EpltXVldRs1aea7sFwY3RUDYMBL5s5MWTUX
	wuhGD5J5l08dI4ZlvatxQ==
X-ME-Sender: <xms:UJd8Z2BRYT31idbVcnIRpLwraq3p3_QMLLsAV5_xxlnkOe-fl0-zFQ>
    <xme:UJd8ZwgCAh4QmW32dalHTFAemyd_OihKBQdwMOGL-T5bWxQ1Xl6FbyIETYoBJZQQc
    UIdDLCIl1yQj_rI99Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeguddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefh
    leeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepuggvlhhlrdgtlhhivghnthdrkhgvrhhnvghlseguvghllhdrtgho
    mhdprhgtphhtthhopehprhgrshgrnhhthhdrkhhsrhesuggvlhhlrdgtohhmpdhrtghpth
    htohepjhhorhhgvgdrlhhophgviidvsehhphdrtghomhdprhgtphhtthhopehjohhshhes
    jhhoshhhuhgrghhrihhshhgrmhdrtghomhdprhgtphhtthhopehmrghrkhhpvggrrhhsoh
    hnsehlvghnohhvohdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehl
    ihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhh
    grthdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeise
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UJd8Z5llblvcaFJUyXca0PdBWegjAw5FPS7alJpMUD62yfbtn0-5nA>
    <xmx:UJd8Z0wkOLl5XAF17jiPbvAgkO4xi5YzNsGRKerESYd7wJaGo4Rlzw>
    <xmx:UJd8Z7SA1-dgtqHuxvaP1zzCiHvRApORRK-cH4trRK0TkOUsBjwcSg>
    <xmx:UJd8Z_YgOpMTZ2q4lRsNNbQki17euBHvw5kosLGdwKINWPs2KlJeWg>
    <xmx:UZd8Zw_wDoelCFSL-bhLJdrjU-SHYRnfno3C5YOZt8DidGlWEHiMJn1V>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EA1003C0066; Mon,  6 Jan 2025 21:54:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 06 Jan 2025 21:53:47 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Mark Pearson" <markpearson@lenovo.com>, "Jorge Lopez" <jorge.lopez2@hp.com>,
 "Prasanth Ksr" <prasanth.ksr@dell.com>
Cc: "Joshua Grisham" <josh@joshuagrisham.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Message-Id: <3f3ca62d-cd30-4d1a-81c6-e2eb47b0787e@app.fastmail.com>
In-Reply-To: 
 <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
References: 
 <20250104-firmware-attributes-simplify-v1-0-949f9709e405@weissschuh.net>
Subject: Re: [PATCH 0/6] platform/x86: firmware_attributes_class: Simplify API
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Jan 3, 2025, at 6:05 PM, Thomas Wei=C3=9Fschuh wrote:
> Looking at the users of firmware_attributes_class makes my head hurt.
> Simplify the subsystem and its users.
>
> This will break the currently developed samsung-galaxybook driver,
> resolving the breakage should be trivial.
>
> Only compile-tested.
>
> I have some further improvements in the pipeline building on these
> changes, but those will need some more time.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (6):
>       platform/x86: firmware_attributes_class: Move include linux/devi=
ce/class.h
>       platform/x86: firmware_attributes_class: Simplify API
>       platform/x86: think-lmi: Directly use firmware_attributes_class
>       platform/x86: hp-bioscfg: Directly use firmware_attributes_class
>       platform/x86: dell-sysman: Directly use firmware_attributes_class
>       platform/x86: firmware_attributes_class: Drop lifecycle functions
>
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 17 +++------
>  drivers/platform/x86/firmware_attributes_class.c   | 42 +++++--------=
---------
>  drivers/platform/x86/firmware_attributes_class.h   |  5 +--
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 14 ++------
>  drivers/platform/x86/think-lmi.c                   | 13 ++-----
>  5 files changed, 21 insertions(+), 70 deletions(-)
> ---
> base-commit: 0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
> change-id: 20250103-firmware-attributes-simplify-9ae561459260
>
> Best regards,
> --=20
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>

For the series - looks good to me. Tested on X1 Carbon G12 and confirmed=
 think-lmi is working as expected.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
