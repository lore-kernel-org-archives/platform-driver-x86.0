Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7167B18A6CF;
	Tue, 17 Feb 2026 23:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771372474; cv=none; b=d50g53EqPSQ297mEUG7Z6SoRA/9g+RlZHsYbqbYI/wvx3gojmTlN3dM0JUQruPOHIiZwgQwIdugPCIwI9maWJ14/7zW4roVjJDm91gFsTGF+StEODQPUtngobSCvFtPcmBg1OnHDvyulWTD5ab6lgT43LGmGTkgwu9mjdGtP6dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771372474; c=relaxed/simple;
	bh=zgL0Xbh8fc1DxvnDCRMe+FbpCEchJIplB6RsPY/l2gA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=msPROdhzvdkqBHTOB9+eBdL+5IxJUeoelurbPATqPLvApkcZu27JrK0v8FGa/T5XQzo8orqkm1gBmwUn3bQVQXCW9IZzqkabK8HJ9b8bcpcoHr4+xrAZPwPwmBeVYP4RhfP/3GiudxygUWJUuxEsQdCtCi5HETjKlsADjIJo9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=FwmicgWN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OYLm/KP4; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="FwmicgWN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OYLm/KP4"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 66AC91D0010B;
	Tue, 17 Feb 2026 18:54:31 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 17 Feb 2026 18:54:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1771372471;
	 x=1771458871; bh=1fpRyiuEp0pbWihj/fEdnLrfzwis75ZEhBYv5grRlfs=; b=
	FwmicgWNpwtRgViD3NvBZ3kIV2/WrjlndCDd8MPiEPru5eNpZOyEXu2Uoj16AelA
	bTNqumaBtoYerpFKxSt/yAVazEnSqR+1XGFmAOZsft0DmFyu9OoZSW4ecLbyRgcP
	PuTYC4M4RxUuxKvIMzOv6WTyiFiXPRmcAhLZTirgLr7F7j3pj1ptvWqip4FyVoib
	Ww8wsi48Kh6oP7fuIkzb+g28BohyHrmq8UGAPGML43Ol1HQVI71Fr67TazVUxyX/
	v81L/mqHL/CTETN2yWaGfL6HMAP6MN5wdIWCgD/vxG3ILWUnxZ7NhX6dyHUIU7hA
	6cahTXRqhFv3e/6nMqJ5kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1771372471; x=
	1771458871; bh=1fpRyiuEp0pbWihj/fEdnLrfzwis75ZEhBYv5grRlfs=; b=O
	YLm/KP4vyJdzgJOUlAtq2cPzc39Rxpn2YPN7x63hkPM0raX/K3epzfsZMC1VBdlm
	l79USDVbSnW6c5ICsrvPZdga4EZ3u18NN/bJ2o+EkWgJeDZxQ7lrktlfG+h6hRlc
	isfjf/fD4K0EljOB5c68JLxZBJ+0pkAr9LygAiAJLqdhqrt2DcrUokq7pEcgGkMw
	CnfIOxRdpMc5aG7vz/9MQ83c6zTco0OljYeu4WfsDj46iuFxPkSNMw40NjnbwcHY
	hkM3QCol/Ul7cCmWyGGDcTHZyuplg1HxlOBPIzW3lYU5BLMGWB4o64DwJtrf68AX
	4aJjY4g6sIKhIQTSwdIiA==
X-ME-Sender: <xms:tv-UaQhwZMbV0zVE5A2A5x-cYgzSJjW_L4dH4YG1MbBg7UmavEs2yw>
    <xme:tv-UaT23WcjRvoTfktx2_qV3Zx9DnN-VMH7CkTYr-hEWU5efW_w7xn9Adm6cwYUvj
    sIuI6n3L6IoWhaGidJXUI1VywSpwinP98O39UVy5mAoCrYbhR5SDDza>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdduudefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:tv-UaUD-n7XJ-CcdCbxL3zfNy3Om1zJde6HEo_-E4wtbs2YLeBZ-ig>
    <xmx:t_-UaTGoWG6lA6R8hbfYDgxkLT0jSu0o6RqZIYi60yqfHW3Bd07bxw>
    <xmx:t_-UacDbraHwXc3YDtHeqPFboOiKGk6QLUk10APwsHplyOPgfrnEoQ>
    <xmx:t_-UaRkS6k9vNTiOzAZlND3mFpaHHO0MOv0H391xxpjhI4jV7F-Njw>
    <xmx:t_-UaXEXLuB08whsj20fs_NVcLYxOCFnmICIrUVhFNmke5DtKkrmpWkU>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E1B6F2CE0078; Tue, 17 Feb 2026 18:54:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: APCKaercSQrV
Date: Tue, 17 Feb 2026 18:54:09 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Hans de Goede" <hansg@kernel.org>
Cc: "Armin Wolf" <W_Armin@gmx.de>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rong Zhang" <i@rong.moe>, "Kurt Borja" <kuurtb@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <d6ff122a-1ccc-422f-9c24-b95106469d9e@app.fastmail.com>
In-Reply-To: <20260215061339.2842486-3-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
 <20260215061339.2842486-3-derekjohn.clark@gmail.com>
Subject: Re: [PATCH v2 2/6] platform/x86: lenovo-wmi-other: Limit adding attributes to
 supported devices
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Feb 15, 2026, at 1:12 AM, Derek J. Clark wrote:
> Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
> if the attribute is supported by the hardware. Due to some poorly
> implemented BIOS, this is a multi-step sequence of events. This is
> because:
> - Some BIOS support getting the capability data from custom mode (0xff),
>   while others only support it in no-mode (0x00).
> - Similarly, some BIOS support get/set for the current value from custom
>   mode (0xff), while others only support it in no-mode (0x00).
> - Some BIOS report capability data for a method that is not fully
>   implemented.
> - Some BIOS have methods fully implemented, but no complimentary
>   capability data.
>
> To ensure we only expose fully implemented methods with corresponding
> capability data, we check each outcome before reporting that an
> attribute can be supported.
>

The Legion's aren't in the Linux program (with an asterisk for the Legion Go/Go2) - but if there's anywhere it's tracked or highlighted which platforms differ/have issues let me know. Not sure how widespread the issues is?

I can try and let the Legion team know that there are platforms which (likely) aren't following the internal specs. It might be possible to improve things for future platforms?

Mark
