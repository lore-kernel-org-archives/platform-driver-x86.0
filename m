Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B35D2233A;
	Tue, 31 Mar 2026 01:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774919995; cv=none; b=gH+60K4jB3YOcTH0D7Biy4ooOwkRE0q/CBe4Cd0PdtQp3PDjltQOGBc6D6qshkyBllnIdlsWDlH0sr5nCRhmp3AgYJC859Y/CpxqQ9XMkihffqxhJskK7faRhzg2N+RZUqcuXAVk9QWYhaezCo+0qNNbfoWcuJY0Zk60LCIgxVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774919995; c=relaxed/simple;
	bh=w5PERjQiBJOeMzyJXIB1d34tCiszQioU3GskhCrfnFc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V8qwHiq6azKG5pvDUvmXBFEWSz1/feyEr18myRibdDGP765OAclVG/sGT4N4OWvA80TaeaewAOJjhXWZYkt3OXVtrLJYWz1TXYxPvlzrQe1KqVPgQHxttvTQGlGlSFqLxNgvZi7cTUIvQPptOrhKWsPUSpvYeaG2AxD4yyYOX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=ffv/f2zw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pyOnJD0j; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="ffv/f2zw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pyOnJD0j"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id C00BBEC006A;
	Mon, 30 Mar 2026 21:19:52 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 30 Mar 2026 21:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1774919992;
	 x=1775006392; bh=FEv6ZYM7mIdhBLTq8ZsWJmYZz8ACZTZdIJbgPvLEZcs=; b=
	ffv/f2zw119EKrrrBBh9BXDnh6Im6rgxJoTCqy7UYYEjyoAbAiyyD7jQPpJXIN7X
	EvaOH0O2MEW4vPUrcj+F0XtRzAtjc3FT+474UOp4Z6Rkh8pB2YqF/EMGv8j+m3Gy
	KLBMlWVryid4YzEsVQ/8wapKKL2SFHCmEbIvmebKE2D0/Z64L9NQFK93TKDs4aI+
	gGlifdu2PUzhLBQaMXyO0FXnVIJeqYEyt1hneJyujQdwXcQJN7b8o5/5BlbRClXx
	0ykDPhzwsLtNuCaMYhv5GJvzlnCujUHoFKDOJGYtw8UBpr36dhxlivakNTS1jg0Y
	ERtBLlROwSaNimLcB+VRgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774919992; x=
	1775006392; bh=FEv6ZYM7mIdhBLTq8ZsWJmYZz8ACZTZdIJbgPvLEZcs=; b=p
	yOnJD0j8mJDrvk0T6f+5Ze9yDr7hl9Vu/C1DD3vfIKwefkI+asuxHzTscXPmg8p7
	IgEgBJDrNTrsm3oac2XnRzo0P9vJGQooLI89ygsxDNbZWh1dMN0/uBNrapGT4Ezu
	MiNmibX/houGhcMjzcHialZsmplz+D8UB9C1UXwNEvLke2WncAwt6Pu5kPZDY0GY
	ZINlyWESThTM5x7im1Me3hYW7R62FZkCljKwrTj5dq6XvKJtaV1wGaay2USvlhG0
	l6zyWq0XIYLSDoKzx27/MX9v28d/QmZGMaMbeMuHHnXYXatTlm3wl9KSmkuKTQ01
	j3nm8d3LVz5t4/VC7l9MQ==
X-ME-Sender: <xms:OCHLaU23-qkP_EFmKUMgBySVVUYLSasH8D7-OHkczbK5BCBYmSzy-A>
    <xme:OCHLaZ4N-jwD4Rr78C4XW9ZyRTvrVOJo0zvL8_IAYyb1j25eVPKBD6nrNQ-iWeC2G
    xitx2Mzb9opomlfhezYLQEZisV2mD46kt-XlFn0zo6cpDhFG3jBcXo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefgedthedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpefhveekjeeuueekfefhleeljeehuedugfetffdvteek
    ffejudelffdvjeekfeehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhn
    sggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsuhhlgh
    grrhgurghnihhilhdukeesghhmrghilhdrtghomhdprhgtphhtthhopeguvghrvghkjhho
    hhhnrdgtlhgrrhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvg
    hnghdrsghrpdhrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehisghmqdgrtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhg
    vgdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:OCHLaZE4KEB83BG0tIexz0Pq4GbDknABT0E9JhRi18rfeMojPZ-YmQ>
    <xmx:OCHLaewRQGnxG2Ihqnk0iFsRVri93ub-zK7sB3qgzZZJf_fDRWuBvw>
    <xmx:OCHLab2l-FasYDRQgsnQ_j5LrJB76tsl0BSY5UdUxi1slv35r5V8eA>
    <xmx:OCHLaWpGzpSAYR4m8AmCB5-Y8DicTncIdM6bN7LluefstJ6iWHt6kA>
    <xmx:OCHLafZVVH3h4cKHSMe8cvmgnoI1Yz7MDWcpybqtqekdgCgknlOFuNPQ>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 53D022CE35C0; Mon, 30 Mar 2026 21:19:52 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ApC5oMBbhHqR
Date: Mon, 30 Mar 2026 21:19:32 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: 
 =?UTF-8?Q?=D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB_=D0=91=D1=83=D0=BB=D0=B3?=
 =?UTF-8?Q?=D0=B0=D1=80=D1=8C?= <bulgardaniil18@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <096ee581-2c27-4746-bc7e-1d699a952764@app.fastmail.com>
In-Reply-To: 
 <CAMPU55i_MPW_MHBsBfbnrO7T5Q68q1QmNgLVBPiqoh30kGw4Pw@mail.gmail.com>
References: 
 <CAMPU55i_MPW_MHBsBfbnrO7T5Q68q1QmNgLVBPiqoh30kGw4Pw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/lenovo: thinkpad_acpi: add named speed presets to
 fan_write_cmd_speed
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniil

On Mon, Mar 30, 2026, at 4:35 PM, =D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB =D0=
=91=D1=83=D0=BB=D0=B3=D0=B0=D1=80=D1=8C wrote:
> platform/x86/lenovo: thinkpad_acpi: add named speed presets to
> fan_write_cmd_speed
>
> The fan_write_cmd_speed() function had a TODO comment suggesting
> support for named speed presets (low, medium, high). Implement
> this by mapping the preset names to the existing fan_speed_presets
> enum values, following the same strstarts() pattern used in
> fan_write_cmd_level().
> Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8982d92df..f10cebe11 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -7957,6 +7957,12 @@ enum fan_control_commands {
>                          * and also watchdog cmd */
>  };
>
> +enum fan_speed_preset {
> +    TPACPI_FAN_SPEED_LOW    =3D 65535 / 4,    /* 25% speed */
> +    TPACPI_FAN_SPEED_MEDIUM    =3D 65535 / 2,    /* 50% speed */
> +    TPACPI_FAN_SPEED_HIGH    =3D 65535,    /* 100% speed */
> +};
> +
>  static bool fan_control_allowed;
>
>  static enum fan_status_access_mode fan_status_access_mode;
> @@ -9249,10 +9255,13 @@ static int fan_write_cmd_speed(const char *cmd=
, int *rc)
>  {
>      int speed;
>
> -    /* TODO:
> -    * Support speed <low> <medium> <high> ? */
> -
> -    if (sscanf(cmd, "speed %d", &speed) !=3D 1)
> +    if (strstarts(cmd, "speed low"))
> +        speed =3D TPACPI_FAN_SPEED_LOW;
> +    else if (strstarts(cmd, "speed medium"))
> +        speed =3D TPACPI_FAN_SPEED_MEDIUM;
> +    else if (strstarts(cmd, "speed high"))
> +        speed =3D TPACPI_FAN_SPEED_HIGH;
> +    else if (sscanf(cmd, "speed %d", &speed) !=3D 1)
>          return 0;
>
>      *rc =3D fan_set_speed(speed);
> --=20
> 2.53.0

I'd never noticed that TODO :)

No issues with the code but I'd like to check with the thermal team if t=
hose are better ways of determining the ranges. I've got a feeling that =
they probably aren't.=20
Fans don't go that high (or low) during operation so I wonder if there a=
re better 'ranges' to be used (though it might be platform dependent too)

I'll ask if there is any guidance on it.

Mark

