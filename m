Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F51F37D8;
	Fri, 27 Dec 2024 17:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319234; cv=none; b=VX/IcniZ9d79225eVNLlq01xb0qLhgbbDiAnROryWgiTwtIQeMs2rLxh3YagkwLNADp7y6aPPSZ5XZl/XwgwYpT33LdjeRUI4xtDt++5TR/lBjnt4JtcjXBBQDdQ6H1lNYvgJlDwVO8RdoNe2Y0otEkMhQN6+kj7i1Ogfc8E07I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319234; c=relaxed/simple;
	bh=SpcDs3yGZPAuy1uuE24Y+/igrf7oIEqbShHLM0dghDI=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LPj88G9DCAdT9m2+ToiNvkTSORVNC6S/y/soLhNd2e3nSxx2IzsOSL5D0q0PjTKnZQFJ7kmJumD6FGaskEibTbzBvzJcDI40PkhfSCSCVhYdqI2aQCRxVS7wNbvBY1SMuDdF+uxUzBP+2QrO+jf9gDGNVfogIk5Srhw4gW7JhTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=tzejgDQw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ADbtK6Gx; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="tzejgDQw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ADbtK6Gx"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6C71A11400AF;
	Fri, 27 Dec 2024 12:07:10 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 27 Dec 2024 12:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1735319230;
	 x=1735405630; bh=SpcDs3yGZPAuy1uuE24Y+/igrf7oIEqbShHLM0dghDI=; b=
	tzejgDQwiuj8tfDTlsPiymonHlOuyGMqmbU4Nw1XMAfTKqWNnV4JdnDcbd+2oiDG
	MdUO7J5VrGU6XQyqkOBBcDiKCXqpbDtn+IwYLGbh90yraGkZZHg4WgmOQycJdq9n
	60d1MU5hdmm/p2sI43LquuQw3QR0Bq/V34oSQHpiiil0D3/WZWsJ4guQDZThd0Wx
	z0pK3bry54yKq6auogMsspw3k70wnOoOhYVN+CP3TyIlJgYkWZ2gZuDYVKAQI0J8
	edRYonAtfSF3e2yDsOWdEYeLcny7KNO5JsYXV5+j8RLOvFwhWMj73lTbADjdl6Bi
	7D0c1AHuRBDqJP/BTez+VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735319230; x=
	1735405630; bh=SpcDs3yGZPAuy1uuE24Y+/igrf7oIEqbShHLM0dghDI=; b=A
	DbtK6Gxhu6dOoSZQTRRtoL/mTelwyfDIx/M0/oUrPsT4qJY8d5HpsF8JMmrPJLm1
	g0iVVGGYBnAA8WK+8SR0RfExyJctR0tJ58nqaK0KOLHamy66K6bznd0pxQiJQvKA
	0gJCm2r0YjsQBu9lzfUfwWavXWb0hpedoOribjCCl3zd4Pyi6IzOrQYwrNYRQTzK
	GJpnv9X2ee8ECGyWWXpymmgbxqZyE360ddP3LG+4xW6n/RfYEnhHSPDdNvzirtlK
	sw66ExWHnOPaXIjQ4ZG86JIsDOA12+5OOZ5/sostqwSDwx4F2gsic3z/AeIknY84
	dpcYoENv27chpuDvPaEzg==
X-ME-Sender: <xms:vd5uZ6q5TmBnVEqZwvkwNFLewA0eBtFfTKkueiDSfLsDt8P6q1Q_Vw>
    <xme:vd5uZ4rlAZlaGl8AMJ84jW_ZvK2A_8zysYjnAbNs81BGhm5AUSZnKferLHiqdCAc4
    T9CPE7j_UXw6UJh7d8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddvtddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedfofgrrhhkucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnh
    hovhhosehsqhhuvggssgdrtggrqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefh
    leeljeehuedugfetffdvteekffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhho
    sehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopedugedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepuggvrhgvkhhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdp
    rhgtphhtthhopehjohhhnhhfrghnvhdvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepfi
    gprghrmhhinhesghhmgidruggvpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepnhhijhhsudeslhgvnhhovhhordgtohhmpdhrtghpthhtoh
    epshhhrghohhiiudeslhgvnhhovhhordgtohhmpdhrtghpthhtohepihhlphhordhjrghr
    vhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkvgeslh
    hjohhnvghsrdguvghvpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvght
X-ME-Proxy: <xmx:vd5uZ_MPoRhY00RGJ8iO7lyf5LwXPxpKiAbOsuL8TIPYKhc5JogEaQ>
    <xmx:vd5uZ56Iz-PgTQjEUwbqVX8iKS4gKf-veSBnZBjBN8tbOVPrZI4Xag>
    <xmx:vd5uZ57jBqbWUWBMZylmWB6HaCj5QTzhUUdKO5MFGEXIXrVUkrlPyg>
    <xmx:vd5uZ5h6_TuxLYKCnJUrP_t3iH-DdUPqnwnZUpkVBPIN4_XoumpQSg>
    <xmx:vt5uZ4IPurPDhayimpVfzPtbk_ST7FyKO2gSsf4Kwhe02UoK00s_HiFI>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 77D9E3C0068; Fri, 27 Dec 2024 12:07:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 12:06:49 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Armin Wolf" <W_Armin@gmx.de>, "John Martens" <johnfanv2@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Luke D . Jones" <luke@ljones.dev>, nijs1@lenovo.com,
 pgriffais@valvesoftware.com,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 shaohz1@lenovo.com, "Mario Limonciello" <superm1@kernel.org>
Message-Id: <f941534d-4ebb-46b5-88af-0fdfbffa1057@app.fastmail.com>
In-Reply-To: <eb165321-6a52-4464-bb58-11d8f9ff2008@gmx.de>
References: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de>
 <20241226001828.423658-1-johnfanv2@gmail.com>
 <eb165321-6a52-4464-bb58-11d8f9ff2008@gmx.de>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024, at 6:19 PM, Armin Wolf wrote:
> Am 26.12.24 um 01:18 schrieb John Martens:
>
<snip>
>
>> - When trying to find out what access method to choose one cannot rely
>> on the ACPI/WMI interface. From disassembling the ACPI, one can see
>> that sometimes/often even if the function is not implemented it
>> will return without error. Moreover, there are some WMI methods
>> with name "*IsSupported" (or similar) but they often do not tell
>> the truth.
>
> Oh no.
>
> I hope that we just misinterpret the result of those methods. Otherwis=
e=20
> this would indeed be
> very frustrating. Maybe some help from Lenovo can solve this issue.
>

Can someone (John?) send me the details off email list and I'll see if t=
he Legion team can help.
(this comes with a caveat that the Legion platforms are not part of the =
official Linux program yet, so no promises or guarantees)

>
>> - Using just one WMI interface is simple =E2=80=94 my grandmother cou=
ld do it.

You have an awesome grandmother :D=20

Mark
