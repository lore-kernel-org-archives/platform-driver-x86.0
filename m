Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BB5352F87;
	Tue,  7 Apr 2026 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588899; cv=none; b=cJD3T0bALx6QiNcohhdszBjpJ+GxdG/RUpQW5ZLifNj2IkveRyGp2NOCIqORBvBlIFLQdWPfQ00PNKD/rt2P8XYEScbrzoPP1kyoFNgg98qh6fTV02GQ1o+GqImqIByklX25KWO/LwH7mbQtlFsLmRufgpHYoweeyyN+oeNoPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588899; c=relaxed/simple;
	bh=A4PZ0JmlqaFd2R3Va81+cRMONQIe0iAqtJfdAxb62y0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uXBTxmk4Pc9arw6Zps7AxA01V1ltjos6nTG0LUWXigYzZhdmGiwLJgcUZXfjxnWhTN7B169rl5mKPoi4WaNV1LjjrP5BwDvqZxdIiWnYqTYGYtOpVSk+z0bLGLM2JZ4jjXqzDwkhzAc2LPIWG60PlmZqoZva9+Ytf948sgrmu60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=NUa+OB0q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IqmL9FOI; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="NUa+OB0q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IqmL9FOI"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9A144140015A;
	Tue,  7 Apr 2026 15:08:16 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 07 Apr 2026 15:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1775588896;
	 x=1775675296; bh=Kr99EKMH4zpToW5GWiGfHs4tPAs1zIv0v0MIChQtnUU=; b=
	NUa+OB0qTbJLEy0/rIRjlrH/d0+XxTMEWlKRq/oqyfNI/htt/hk5pfSOnSNWh0R6
	DwUKfVQyF1sYUgierj58SaVq/FgC+ZqqS/RH7kDwbJdZ7KoXazpEZJePjWUuENw0
	gY/Cr1RsqolNt3UFe/dOHzgzMiZ9M30wzCA+LnieFSFUH2Y8U/+s6nUlNH1AldOB
	6COauLlMy0tPGJyEEgrpmpI7Vn2eGLsXOWgDl5JSY8nfe3sEtAoGm+NkgIaq9TIA
	D8cFRkD+2HCmcj5OFkr/wTIzm3lcd3A+B7GlxYHoIbQ1TYtYguBNpvx2LFc6rp9y
	gm7HRrehKqkftEGwEW/K8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775588896; x=
	1775675296; bh=Kr99EKMH4zpToW5GWiGfHs4tPAs1zIv0v0MIChQtnUU=; b=I
	qmL9FOIY8kTZrYSijJZEAU3gxMUwMGXWzQke5vc1V8LrzEz5qz0Ugcz8PUien7BI
	0xllrb3pkPmgy8q/pxeq4uBszuMoFxbgUI9p/1J/FkjJfbZKwjXykMVV83Z8qc12
	LKZ9M7RLOuplkgXmbicJWF4hv3sb7FWWYp9GW8Extrd3LF3gLQXO7Q1r5Mjv8sWp
	ZjOJGQxqQRiM3ldX03N37t+W2jPFDVUqDsx983BiZmEV2RWAZUoOLgPvshBBKS40
	kBtDrym9UBLg/61CXHXTkJUBxaHH7eGYsmqBug2SWsHYDSZEcxNbW9/47d3SzBGm
	AnAC9Sn/TWCMfww/IgYsQ==
X-ME-Sender: <xms:IFbVaez-6XiP7hS7Y4cqhPPJ6V11_j7TXDXrgYCOqfsbdVSBdBaznw>
    <xme:IFbVaVFmyDuEkH7VBZoJFl9oT8865VsFXK0ekjMf5M2GtLuiisAc0tKb5EJeDS-zp
    ZZNaDa3ANurHbgEWJ2jLgt51Yvfxywrhl40QSzunzp9rMQQSvmgF-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvudegiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghulhhgrg
    hruggrnhhiihhludeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgvkhhjohhh
    nhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhmhhhsehhmhhhrdgvnh
    hgrdgsrhdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpth
    htohepihgsmhdqrggtphhiqdguvghvvghlsehlihhsthhsrdhsohhurhgtvghfohhrghgv
    rdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:IFbVaW9Q32BiPQ6fb9jDAqyX_m_cGVPnFrrOZ36pFDT4z9OHkroyHg>
    <xmx:IFbVaYT1sxI9GPXx14ylPTSB4zoszXyh9FmdqSmyo2ImOw7_2HprVA>
    <xmx:IFbVaSUIsOq3es9E-pbUn7Q_CxmtVUHUPqC2kxirCzdqGP3InGmRYQ>
    <xmx:IFbVaaTuBiBANw5Lnik9Eoos1hMlP-5YLUR1_5inOZn7eIapr5byrg>
    <xmx:IFbVaQUF3YsfhZuCgRycJ6c-ziU2FdboRFmL5TJYeRiVbx1RVumpdlAh>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E10792CE3F93; Tue,  7 Apr 2026 15:08:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A2i-hMeG1wI-
Date: Tue, 07 Apr 2026 15:07:55 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: 
 =?UTF-8?Q?=D0=94=D0=B0=D0=BD=D0=B8=D0=B8=D0=BB_=D0=91=D1=83=D0=BB=D0=B3?=
 =?UTF-8?Q?=D0=B0=D1=80=D1=8C?= <bulgardaniil18@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <f5d45fcf-f5a0-4603-9731-1010aaed6746@app.fastmail.com>
In-Reply-To: <20260407190546.109900-1-bulgardaniil18@gmail.com>
References: <e4723a5a-0bdd-4062-af38-ca5f4a4f6d1d@app.fastmail.com>
 <20260407190546.109900-1-bulgardaniil18@gmail.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: remove obsolete TODO comment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Apr 7, 2026, at 3:05 PM, Daniil Bulgar wrote:
> This patch removes the obsolete TODO comment regarding fan speed
> presets in fan_write_cmd_speed. After discussion with the
> maintainers, it was decided that fixed presets (low/medium/high)
> are not suitable due to platform-specific variations.
>
> Signed-off-by: Daniil Bulgar <bulgardaniil18@gmail.com>
> ---
> v2:
>  - Removed the preset implementation as requested by Mark Pearson
>    and only removed the TODO comment.
> v1: 
>  - Initial attempt to implement low/medium/high presets.
> 
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 8982d92df..75e141304 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9249,9 +9249,6 @@ static int fan_write_cmd_speed(const char *cmd, 
> int *rc)
>  {
>  	int speed;
> 
> -	/* TODO:
> -	 * Support speed <low> <medium> <high> ? */
> -
>  	if (sscanf(cmd, "speed %d", &speed) != 1)
>  		return 0;
> 
> -- 
> 2.53.0

Looks good - thanks :)
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
