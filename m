Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C933F888F;
	Fri, 15 May 2026 17:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778867058; cv=none; b=UzAGS9FoKRAQE+m/XRTXnH3ziPATJUF0vTjkcmxthnSVLdOqqvb3hG7W2muTTEgPFFhmYNkALTw1VUUyGqxc1RyMl9l6v9DqmWGaGwRGykGKlvI2J3G7HD3Z+piLwIf/46ra2FiWH3lhTN6Ewq31S1DOidyM0UimtzlDoPDIb0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778867058; c=relaxed/simple;
	bh=totnspqcbcafw4Keh1fe1Rs7XUDPey3jYWpjBtuNNKY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oHoKMdpFwNGs1aqBN8m63u4M2My0yOlbSjuhuRBPWzOMDbBZwAa7WAQr6AZGzUP9IvbA7i+5vhH3+vVRUKDa65V/s7swkgVAZNchG8JSU8FCr8XuPa4T3V3/xbDFSlFp89W9EaTX/EtoP23pCGpKwZoyrNBmeAkR5rlTxbEDW/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=dOq2ECyV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ka/LfFUD; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="dOq2ECyV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ka/LfFUD"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5369B7A006D;
	Fri, 15 May 2026 13:44:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Fri, 15 May 2026 13:44:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1778867056;
	 x=1778953456; bh=totnspqcbcafw4Keh1fe1Rs7XUDPey3jYWpjBtuNNKY=; b=
	dOq2ECyVh2bGsu6czqpG1JVqVprcjOPNqT0W4BxZalaSOaMiA3yGLYnC5jFKCse7
	J4IV8nOKh2yxEt/OGcOmZFjSOILxYoY8R7+1h2x97+jRMWhcxZ2UMJrUa8DxSXpv
	uUeOPp3in5/jthTyHMvuFd1Z8foB9Icxh6b626hnjdEQtltcE2BDSnwpf6L7zvPK
	D2ozFO5BQtfBl1HR5TQ8+EMa3HxjdxSwYbGaOjljVj+qf50tA+V1MREo8Y/jl/dK
	Nq1F4AkS6pMYaNdySeQTjwdeslJPL0QwonVbfcP7RtbrdbddrqcXwR08WQwa/7+y
	Zj5Utz+5fYhGZkiZ+xHI/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778867056; x=
	1778953456; bh=totnspqcbcafw4Keh1fe1Rs7XUDPey3jYWpjBtuNNKY=; b=K
	a/LfFUDm/5dtsfTjIsXCmrKgSU+50qLhZ6k7Gc5wqWljnFORTwaPIJbxvwKBdHeD
	JD1IgR1gtUJun6fiWIvth1L/sHONKeyesW2nJx0e7eB5ZNaUxlMvif94fvSp4kJw
	DKYkDSIig4WTCP5ZGEIW/YiSy0HTXWL1EuI8KNYVF5r7On9ea1USxWkRQZJnjKCU
	JQFYtNVxEYQpY9P9eXJzIhufKPFxboPmS+/YgASpmaqXai5JhZw5zzmNmwNpgmCc
	aruecTAQentb+pUF1GAQ1IbAFuIxoblEX6RfD5ARNfywU62LmJpJhnywdkSE5yaS
	kjaaY8vPBGOvV8FhaESFA==
X-ME-Sender: <xms:b1sHakOYPfxfvBOkGeJ2LQcHVzYwHBUlcBrocCuKxKsi1Ayti7PqBw>
    <xme:b1sHalzaWBA1JtNf7E9ReW7IvEcuMIJfCsckCKFEq31AAwogCXrxELwKek9bYpUr7
    WfT2R1A269FuHUqb6vzTHlmV_Lb8Yv0SjGeGJHPDK7LZaqFSucYoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufedutdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvg
    hkjhhohhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhkvghprghn
    hhgtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhurhhkohgsohhrhihssehgmhgrih
    hlrdgtohhmpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:b1sHatwUkQMW8kFbXOw-Cvythkzf2HREfbfaIcewEjjwL90tRGBPhg>
    <xmx:b1sHasWEvG7f8BEYCZQ9KyY8L9sehiJl9iT0S0S7KtDRMyOOrMNJVA>
    <xmx:b1sHathDtlT_je_PXB4uuYeFM0egYK7ZYtD1LrrIicNRRaLBC8o_yQ>
    <xmx:b1sHasAQmCLD8OJrSSBpbpmFMIhk5xorDXjAs5hcunwmZPVQ9dc7mA>
    <xmx:cFsHatDogZQ4RHfFoJ3QwgZQ1C0y5sDVInZN0yKl7rW3I59KTk_7eJfZ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72B372CE0072; Fri, 15 May 2026 13:44:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AyD85fmXsCP3
Date: Fri, 15 May 2026 13:43:55 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Borys Turko" <turkoborys@gmail.com>
Cc: "Ike Panhc" <ikepanhc@gmail.com>, "Hans de Goede" <hansg@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <67269355-486f-496c-837f-9122f93a79ed@app.fastmail.com>
In-Reply-To: 
 <CAEAo-LjdVzQ7zsiz8NrWKYVQ0V11yRwiX98BOsCL6EVQvpZZGw@mail.gmail.com>
References: <20260422104227.19969-1-turkoborys@gmail.com>
 <c0c35d9d-92cf-48e1-8e69-e737e580ab3c@app.fastmail.com>
 <CAEAo-Lig6UGvx=uAYB2XJ4quSjxEE_QzypmsYR_ojV4OODhsng@mail.gmail.com>
 <CAEAo-LjdVzQ7zsiz8NrWKYVQ0V11yRwiX98BOsCL6EVQvpZZGw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: remap "Star with S" key to
 KEY_DASHBOARD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Borys,

On Fri, May 15, 2026, at 1:38 PM, Borys wrote:
> Hi,
>
> Any chance you've had a look at my response below?

Sorry - it got lost in my email swamp :)

I don't feel strongly about it - I'll happily defer to the experienced m=
aintainers perspective. Just wanted to highlight that potentially you mi=
ght break somebodies carefully crafted key mappings
(but realistically, I think the odds on that are towards the low side)

Mark

>
> Best regards,
> Borys
>
> Op do 23 apr 2026 om 09:59 schreef Borys <turkoborys@gmail.com>:
>>
>> Hi Mark,
>>
>> Thanks for the detailed feedback and for testing this on your
>> ThinkPad. I=E2=80=99ve done some further testing on the IdeaPad Gamin=
g 3
>> (Cinnamon) to address your points and cross-referenced several IdeaPad
>> manuals.
>>
>> On this specific hardware, I found that KEY_FAVORITES currently
>> results in no action at all. It acts as a dead key in the desktop
>> environment, so the risk of a regression for existing users seems
>> minimal compared to the benefit of making the key functional.
>>
>> While the ThinkPad intent might be more flexible, the IdeaPad manuals
>> (for the Gaming and 5 series, for example) specifically state the key
>> is intended to "Open an app" or "Open Lenovo Vantage/PC Manager." I
>> tested KEY_BOOKMARKS as you suggested, but found that browsers like
>> Firefox "hijack" this key to open a sidebar, which prevents the user
>> from mapping it to a system tool as the manual intends. Additionally,
>> in my environment, the system labels this key as "Favorites," which
>> might be confusing for a "PC Manager" launcher.
>>
>> In my testing, KEY_CONFIG seems to avoid these conflicts. The system
>> identifies it as "Tools," which is a perfect semantic match for the
>> Vantage tools mentioned in the documentation. It isn't intercepted by
>> browsers and remains fully mappable by the user. Using a neutral key
>> like KEY_PROG4 would also achieve this same goal of giving the user
>> full control without default interference.
>>
>> I=E2=80=99m curious to hear your thoughts on these findings and how w=
e can
>> best align the driver with the "user-defined" intent described in the
>> manuals.
>>
>> Best regards,
>>
>> Borys
