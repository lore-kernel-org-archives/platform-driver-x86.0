Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7D3B28D
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 14:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991459; cv=none; b=ShhT6S7Iqp61FgeFhbOsnmCrHiePD07U3Cl4zyo0VL7rZAhvZgThx0WH0nyOkiShgRz5zw4nDp80YmwOj77IspXNkgSxLq+LSH2psdquoGZi+4AZwsdnz//E2MOt2Eum84KOkqXfwMdhPvz6aZpRME/Fr/6W+zeD4Z+eJYgHXJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991459; c=relaxed/simple;
	bh=KL+7VKOZcopP5D/peBYFW+8wtbaLAFvpv+KKBB2KvCQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=FkLt2J/6JVXlwJWtBo3JxGfBjp//BmEYd6TyBpwk5Je33meFhUTdfgNPknCNGZVLqbxnWqH/BetfYO1GRh0vUGkVeEOncJHRINp0ajtab2UVTnj7VID6R0cm/wZn7LObD7+3H7yAshCzV5WG31Y4bNUeWp8knRPSp42fEceAV7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7sy2tL/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7sy2tL/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A6BC4AF0B;
	Fri, 13 Feb 2026 14:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770991458;
	bh=KL+7VKOZcopP5D/peBYFW+8wtbaLAFvpv+KKBB2KvCQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=E7sy2tL/SKzG+fr3yIPVyPUz8EFtWelTLw3GcxVKYhq314WrMPyxVqr9pbtUp6oLB
	 Wor7CwqdupO63qhXpfPjmvlnSNpSdjP99GvTQzKs4wO1ytGBpm76HJ44AenmSgwQnH
	 ZkiOSykTt8awcDc4SMOriAI70KMz+EBxivW2u0FW8HQsrpW+uc5m0VCYqVKfQSdPXS
	 q62B5iySkjwMQKZ2grNBz7dnCElOsL2NCyeQmWQsAn03APSC6XV93JrkiymQHfRrdR
	 VjR7Ujx9iw9FbFFPyBrp1vZr5a0utnwNCXdm8zWlmEacTHPP4trTo/tOB1Dk9tedLu
	 75RaxSRT+ineQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 77E4AF4006F;
	Fri, 13 Feb 2026 09:04:17 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 13 Feb 2026 09:04:17 -0500
X-ME-Sender: <xms:YS-PaSNQ1AeQMD-FpNoOVBu9Ji1SL1M6Yu4HYP5duKejZ6m_VWtQuw>
    <xme:YS-PabxkOCuCCMpj38VxqRR43Vq5xGzkgtIP26_d0ubYJlSOgzAHvAIkDTicU8_Rc
    LrJlwuLqiOyItWpfvoFM8e8v4UC_55iRMnogr0iSSYgsJWfIMYMyko>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepudefjeetteelhfegudekhfetffehtefhtdevkeehfefgtdehheeghfektdek
    vdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
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
X-ME-Proxy: <xmx:YS-PaRsREC55I0QhQ4uSwUQ0Bv1KYyLBXcQo9VRN5wrJgzkL9iEI3Q>
    <xmx:YS-PaWeI0RtEIH1eQ1A1LYj4PpNwoerm9BSaMGTO6fo0Iu19UfRZcg>
    <xmx:YS-PaW_ueqyPSA5k8Ov5iw5YiUgEQ8JmoHWn0OWrZeARrX8Luby4UQ>
    <xmx:YS-PaZQflyU8B0wP9PVqY6NFy-OYtRvKbpoYZI1FYzblyzVv_w71ag>
    <xmx:YS-Pafo-RcMPKiVuTLPMdd-gMAPkHjW0K7TcFyr320JB9ttiPXhzvSZy>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 54C2A700069; Fri, 13 Feb 2026 09:04:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AuWteFS6Yydg
Date: Fri, 13 Feb 2026 15:03:56 +0100
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Andy Shevchenko" <andy@kernel.org>, platform-driver-x86@vger.kernel.org,
 "Yauhen Kharuzhy" <jekhor@gmail.com>
Message-Id: <04f903e1-8197-41c9-b5de-f16c6781be57@app.fastmail.com>
In-Reply-To: 
 <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
References: <aYpC_XWNXiRmEdzo@google.com>
 <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
 <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
 <aY2rWc4bfeWqw1Zu@smile.fi.intel.com> <aY318Dg9gMU1KFvx@google.com>
 <aY38A8MbctpAgDqS@smile.fi.intel.com> <aY38ZBTfbf9a7Unw@smile.fi.intel.com>
 <aY4EqvRduJnlg3iC@google.com>
 <CAMRc=MfmYw0oSkc7Td=Pzwb97DzA4ym23gcqZPSKxHuQQhAx_A@mail.gmail.com>
 <aY4K2qbxNmsotwu3@google.com>
 <CAMRc=MeekJ=-OeqjUV-_WZ9g=tsNb-6XrKMi_6gPgbhGCf49KA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert Goodix devices
 to GPIO references
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026, at 14:41, Bartosz Golaszewski wrote:
> On Thu, Feb 12, 2026 at 6:19=E2=80=AFPM Dmitry Torokhov <dmitry.torokh=
ov@gmail.com> wrote:
>>
>> That is inherent weakness in identity matching - the rigid coupling -
>> and that is why I originally implemented name matching which allows f=
or
>> weak references.
>>
>
> How does this name matching work for multiple instances? You still
> need to have the number of software nodes correspond with the number
> of devices and their names need to match the labels.
>
> Anyway, that's purely theoretical for now, let's cross that bridge
> when we get there.

Right, and we already have cases where a PCIe card contains a complex
SoC such as drivers/misc/lan966x_pci.c. In that case they chose to
use a DT overlay, which is more work initially than doing the same
thing with software nodes, but should scale to multiple identical
cards.

The cases I see of software nodes being used in mainline today
all seem to be for a fixed number of devices, either on an SoC
or on a specific board.

      Arnd
