Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AF834EF00;
	Mon, 20 Apr 2026 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708498; cv=none; b=CXmntu47OJEebHfkCgqxQq0MlagTgnpHdr3KmtumFOyUQt5/rkFtT0LTe/hSLGybv0WTZnULg9DiaEaR9VdZSPMktF7uotJFN0hzQte9K7yfDTj3dr0U2uUVV9Tb6IVRxYXbhdG/7Wwgyb9VUTwYfkrFo4vysN38HDKUpf+prO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708498; c=relaxed/simple;
	bh=jiKs6ZJoVpcVKKjIgsqvSL9z9lkxeqRL5Yg3zihEUog=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=pqv7I5c1KK5jWy8OL3QhYHoavt4ePy3wzknNfBHsMA3x4KTYy29yRocTwNuoYzcrp6lCcdg8622/K8ysmWavJLU1d2OcEVpUhwrdrIIi5mNMfx6oNjW97jlJemnO7b4W8K0SfekUf96zSim6fJOMrlw1qEOxsns9fk4jSGEizFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=csONNvIS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Gaf1DxYI; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="csONNvIS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Gaf1DxYI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 519587A01E8;
	Mon, 20 Apr 2026 14:08:15 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 20 Apr 2026 14:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1776708495;
	 x=1776794895; bh=daniOWyt82clBCpPF91tefseu6u3nUNzlAoqxcM2Kak=; b=
	csONNvISozAsFO+FTVUIS0cx83a77Qh3l5FhbNrriGo+FRsjHlON0DRaq51y1iFw
	3POgYBALXs9TFxfcQ8FvtsHOXkHp5/4BAZ7WtVT+tDukmjzcHrXyGXz5v/C3/Bgn
	/zIgy1UMASCdINe2lQNdEB3XgY0B8WSz/p7GS22wzR2tRmuwvdK77xGCad7874Uw
	CySacyGOZOsHvq/URaBXSqZjGlDid7dF1YVq6o4UUp4Ovia7zj36t7z/CVpGsS9Z
	nB+yvNOrHw0LKidPHfR+n1nQ0VHBeM6XMiEde7OHTxU8AMhDVb+b6stNMkx2sncs
	KmbcgbNVLHRNR0uJxK/2kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1776708495; x=
	1776794895; bh=daniOWyt82clBCpPF91tefseu6u3nUNzlAoqxcM2Kak=; b=G
	af1DxYIYouBEZJttUvxWxR2BKcaq/w+qkBnBJE5zdAnb0KPcjrTSqenSh/U3RR9p
	PFy/EmJpqQdOWd2vv/YnI/6IQm1MhTkg7kCny2Ko0BWPOMAS+pYRHi8ljtRyLTMk
	qQOL5OMfgowqxuhDwhbEnJJFF8awT1nlV226MoD7q9HDhJndtqDsmmif+PMen9So
	R7dnRk2gPkgSmUM9aWy8m9/gx3MSrbrGVjbjtV0EzY70fQspPfUCXDmeSCmF4zXt
	O8KREBjQJXSUyBmNaRetcRgnhJ2HzSndp6or37Zlthj4Bx0XjVUbFJj11Vc7xFmH
	w7OKvchKiDtBLEudfr75w==
X-ME-Sender: <xms:jmvmaTivBH--eDyI2tN77VWx266gpKVhiUSQu5EzrkpsNp2IktTtPg>
    <xme:jmvmaa2-mT12HbbWpShiupUZsXYTZtBcEr5rUz84HKdkjZyIYCdkTSMwM7Z9VdLp9
    7ORAKr-lMA6opOoX-82yZlN6brBqNdOYqjpY3mc4ije9yOxt-9At6Fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehledvtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnheptdffvefgtefhveetuddvfeelveektdduvdelgfehgfei
    keffjeetjeevffektdfhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedutddpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepmhgvsegsrhhighhhrghmtggrmhhpsggvlhhlrdgt
    ohhmpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomh
    dprhgtphhtthhopehnihhnrggunhgrihhktdejsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepfigprghrmhhinhesghhmgidruggvpdhrtghpthhtohepshhkhhgrnheslhhinhhugi
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhdq
    mhgvnhhtvggvsheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegtohhrsg
    gvtheslhifnhdrnhgvthdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:jmvmacu7cD8DG0ozzuz2V1gX9Nkqrut9mAZYstwndyU90bYv2IQp7g>
    <xmx:jmvmaXvdVNcR6upF1gSq5vUdZx1GzUG_irMCfPOOUnVU2xhmYwa7Uw>
    <xmx:jmvmaRET0bweJMopTau_gVSb0du6Hnhc9Vimfngd9ZKpUfSQ2mBHTA>
    <xmx:jmvmaSM3t4TB2-NkEsvBE37ZcQYTzetm0jPV06yhPLGTcTY0sc7t-g>
    <xmx:j2vmaTrM9nIutg3DwEMtLE8pXO8PeqKdepl5fN43fV7XOApRRNAWdUci>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C5A022CE3F95; Mon, 20 Apr 2026 14:08:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ab0JQVG51Pnw
Date: Mon, 20 Apr 2026 14:07:53 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Jonathan Corbet" <corbet@lwn.net>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Ninad Naik" <ninadnaik07@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>,
 skhan@linuxfoundation.org
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 me@brighamcampbell.com, linux-kernel-mentees@lists.linux.dev
Message-Id: <caeb609a-499f-4eab-91a2-2d85665631ea@app.fastmail.com>
In-Reply-To: <87fr4qw2jy.fsf@trenco.lwn.net>
References: <20260419170835.347910-1-ninadnaik07@gmail.com>
 <b94cef14-d02d-4544-abb5-ead7db6eaa72@app.fastmail.com>
 <BAA4F3A7-E892-4904-95A6-64B177CDA7AD@gmail.com>
 <87fr4qw2jy.fsf@trenco.lwn.net>
Subject: Re: [PATCH] Documentation: fix spelling mistake "Minumum" -> "Minimum"
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Mon, Apr 20, 2026, at 2:47 AM, Jonathan Corbet wrote:
> "Derek J. Clark" <derekjohn.clark@gmail.com> writes:
>
>> The MOF spelling mistakes are well known. We've left them is as to
>> ensure match with what the hardware actually reports.
>>
>> See: https://lore.kernel.org/platform-driver-x86/cfd7977e-d612-4e08-a68a-65fed8e164b6@gmx.de
>>
>> I suppose if we're going to continue getting these types or PR I
>> should add a note to the documentation. I'll add that soon.
>
> Perhaps worth adding, but I'm not sure I would expect it to help.  The
> people generating these patches aren't putting much attention into the
> context surrounding them.
>
I'd forgotten that previous discussion - sorry.

Part of the problem (I know I had this many years ago when I got started) is being told the best way to get involved in kernel development and learn the process is to find small things to fix (spelling mistakes, documentation, comments etc). I suspect that's accelerated with AI identifying them too :)

What if we fix the typo, and add a comment highlighting that the vendor documentation/MOF/whatever is wrong? Then everybody is 'happy'? (or at least we'll get less emails about it)

Mark
