Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB20487BE;
	Wed, 18 Feb 2026 00:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771374435; cv=none; b=kgfyDa2k/CkYWaT8UpSqJjI8tqEB4uqeYrgSSjjqGZdeo92nHIIIIUZHRrZa/YSNwomx/2SvSo2eCfdzrPDAkh+DP9iykeOKVwGJdvqMYNPHxMkPmdgQlAUnws48jU1j94S5W6YvCaXEuaJDOkjBiT1c8ARKexmiRzdpHAdXW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771374435; c=relaxed/simple;
	bh=TkDFHJPpEz2tchtFI9/HxFQeOm+Z59HFiNL8ev24LcM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UkdbiiBLp3tqLhHFYLs2R7tnvSLxskFH1eA/iDoPUXjycRvlL8+HWQfxLucnsRTNjcQCshXxhHas+waT+dqdik0+HHHXVhSvH+7f/Ye5T16JsHbfOVEfictHRH6bDoFOoK0eG8JOwkxznqZEZ8EyqboAj3gfGxDWa+5VQxPljQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=oWNX4C2l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=wpJcMzfp; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="oWNX4C2l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="wpJcMzfp"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AD5F57A007C;
	Tue, 17 Feb 2026 19:27:12 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 17 Feb 2026 19:27:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1771374432;
	 x=1771460832; bh=luuMj7AruSDdHPt+p8wk2WOL4dgaL0k7gqiVYtWP0lk=; b=
	oWNX4C2lhBowsAugv2sscghZ+LdDcFv0RmyL69MxFAc6k0oaBYQrPV3OawwTixtS
	JQ1l+NhRisgQcTIsK9x2fBvcF5X2D5fPR6Ukw4Lrzbf1qnqd5t6OeBS70IDCGx5N
	2dpPBbOFPLRKuUn82mMVt3p8Z5DNuDUGddQ3CQLMFwIx7hb/DxWo68AabcP0d5IS
	DAE2r9GCwdfSuyMWVk1x0nN+yqoDrOpxToa/EOb6DaAxlh+DPiO/dZdGiI0PpSxy
	WLwX8kw+4XIEIexusrJU+ckQRq8GzUq3iIfWaq2/KsFYr+nK961cL5YLPBee8UnS
	YFk0xmDSBXkMR6ajdRKOuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771374432; x=
	1771460832; bh=luuMj7AruSDdHPt+p8wk2WOL4dgaL0k7gqiVYtWP0lk=; b=w
	pJcMzfpJ5xbWf969xUxj0bYasR8XwTup9Denl72CjK8TfVVZ9li8JutTU4dCGrVp
	o+V65bYTCi3u6wgAa7l7x5I+BzEAtlpqgtmPcTx1FPDjYHxTnI9meiIjSKXD1Dd0
	HChdKkrqkt4mgggh21nYRnf6jWf6EfeaPlGIAqP5frZIs6qYdnj4x5Q0wQ4ZD01t
	EIlk4u5AJBujf4BcMr56MZOImmFQoEQlXhfz5pA2dA94ioeut1WKTXfK5u29DNAW
	Iy+3WfIqi1M7ScCsAgWhM7/Wjk/6WeN5JEhHGuLnwsOgLxElM1qcQmd7dPuZCFFu
	+jidvGQgw4I5Xu3WcMYDw==
X-ME-Sender: <xms:XweVaR_amm90TiYLOcWOniXnDTT1Hs6FzcQi0okM9Rt447A3D_NDzQ>
    <xme:XweVaQiNCXdXnkkcof9hODfG0Ueol36uISd5FWCVZcSUSQsWHqoUhgoQZ4ciymowd
    ZZJwR8PwOHfLZMpjI_bp7pP10UiY5GdVi-gYlXHCnyDfU2KL3CTaLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdduudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhuedvheetgeehtdehtdevheduvdejjefggfeijedv
    geekhfefleehkeehvdffheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvg
    hkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhuuhhrthgs
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepfigprghrmhhinhesghhmgidruggvpdhrtg
    hpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhj
    rghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopegtohhrsg
    gvtheslhifnhdrnhgvthdprhgtphhtthhopehisehrohhnghdrmhhovgdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:XweVab9V9RdXyJ5l2ehQaxxDGcKsLjLi0ruGdkGV0eYfwHKS_zUDhg>
    <xmx:XweVaUQDX8T5dOmSO-WZBcbMGNpesmaf8ZXY7p17rMrSG2M7DJZzsQ>
    <xmx:XweVade0uWcoDOfy8n0QIU05xy0TEPUiMnlTWsYLI9YzD60Hi3bEfg>
    <xmx:XweVaeQqNFs1mcSWEatkglHOJhtEUk_zHa8x6xRrrtH22-oUacjU0g>
    <xmx:YAeVadAt0ngz8lODgO5-CdvucdTTlYyPBXMVehhKNIhIrYpZh0dpnz9P>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5D512CE0072; Tue, 17 Feb 2026 19:27:11 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: APCKaercSQrV
Date: Tue, 17 Feb 2026 19:26:50 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b97310a0-0e3d-4ab4-a488-18d6211b8a1b@app.fastmail.com>
In-Reply-To: <71066F1E-9310-490E-BE72-48D0547C9539@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
 <20260215061339.2842486-3-derekjohn.clark@gmail.com>
 <d6ff122a-1ccc-422f-9c24-b95106469d9e@app.fastmail.com>
 <71066F1E-9310-490E-BE72-48D0547C9539@gmail.com>
Subject: Re: [PATCH v2 2/6] platform/x86: lenovo-wmi-other: Limit adding attributes to
 supported devices
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Tue, Feb 17, 2026, at 7:20 PM, Derek J. Clark wrote:
> On February 17, 2026 3:54:09 PM PST, Mark Pearson 
> <mpearson-lenovo@squebb.ca> wrote:
>>On Sun, Feb 15, 2026, at 1:12 AM, Derek J. Clark wrote:
>>> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
>>> if the attribute is supported by the hardware. Due to some poorly
>>> implemented BIOS, this is a multi-step sequence of events. This is
>>> because:
>>> - Some BIOS support getting the capability data from custom mode (0xff),
>>>   while others only support it in no-mode (0x00).
>>> - Similarly, some BIOS support get/set for the current value from custom
>>>   mode (0xff), while others only support it in no-mode (0x00).
>>> - Some BIOS report capability data for a method that is not fully
>>>   implemented.
>>> - Some BIOS have methods fully implemented, but no complimentary
>>>   capability data.
>>>
>>> To ensure we only expose fully implemented methods with corresponding
>>> capability data, we check each outcome before reporting that an
>>> attribute can be supported.
>>>
>>
>>The Legion's aren't in the Linux program (with an asterisk for the Legion Go/Go2) - but if there's anywhere it's tracked or highlighted which platforms differ/have issues let me know. Not sure how widespread the issues is?
>>
>>I can try and let the Legion team know that there are platforms which (likely) aren't following the internal specs. It might be possible to improve things for future platforms?
>>
>>Mark
>
> It's a mixture of different generations and models with different 
> issues, I'm not really tracking it anywhere. Part of the issue is the 
> spec has added/updated methods over time and the deprecated ones are 
> still being used by hardware out in the world. I think this pattern is 
> fairly good for most things. TBS I've recently found (from testers) 
> that some things just need dedicated methods instead of the generic 
> macros (CPU/GPU OC status for example) so I'll drop any of those in the 
> series for now and add them back later. All in all IDK if there is much 
> value in tracking these issues outside bug reports, as fixing them 
> would likely require BIOS updates for hardware that is 2-4 generations 
> old at this point and I highly doubt Lenovo intends to do something 
> like that.
>
> It's a fairly complicated and evolving spec, so my goal is to be at 
> least 95% compatible. I don't think we'll be at 100% ever due to the 
> wide array of different hardware that's available. I.e. the latest spec 
> has ARM specific capdata as well so we may need to eventually move the 
> driver to somewhere else, maybe platform/wmi? That's a discussion for 
> later though as I have no experience with DT/ARM or a device that has 
> it.
>
Got it - thanks!
(and yeah - chances of getting changes done to older platforms is.....small)
Mark
