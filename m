Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E026F2A0;
	Mon, 16 Feb 2026 19:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771271186; cv=none; b=mr/PuHJzeGohZVyyYdNRqzy0HL7xlXjmCGvZKKp3wmd4jfPm8EfOHHk9xtMbunfbJPXj/Nn36Hqlb2gFJdtT4Fsa/RPl0RCe8yFMjNy9TtgmVDwFHeNAqNB9UelMgRfy8YYy404zURybwSuSamYKvCI5Nr8f0khIzt0wuxgsmDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771271186; c=relaxed/simple;
	bh=2UhT7Py6zpjm+QvTfM8YIoD9XJL1ogb3XcqjL4JAIUI=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZH9Cs4TWuqddVQOUV6pmTeZdYAmA6G2d9tMCYg+7Hq1hfcfQlDkWtw35XpST7dtmoF3fkJpa/iJcuRScJfN6IyVQ8+uJ2ECVAtHWBVhiFxc4/xsCgv7xnP6oz7DdTj2tfg5wHlMy3MA51j6ft3eX42UJ5ApqnOPPIrzw0NMIv48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=KJpg5F/j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GGW+pgNj; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="KJpg5F/j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GGW+pgNj"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id B37D51D00094;
	Mon, 16 Feb 2026 14:46:22 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 16 Feb 2026 14:46:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1771271182;
	 x=1771357582; bh=trb9EY8ABdgfiWbB3ihDhqrGiOdS7b/Umy7QA+G0ZTs=; b=
	KJpg5F/jwJXA3JSMcCvDkmn6NdIAFcODN81mj0CtvVFgdriuN1Dtd7RZzWSaY+wi
	Lfq5TskQZHFMfOlzdYb9oDE5mILLjNelkuhyjqjExjYqhoPPxvPlx/z8xNWQ3GFC
	l8t77/A2Pqack3jWLmRLsb3zD4wvRRm+6LEAKKJl4mZdvvoSbe0Xh7IEqr2cqhaM
	dl2CQydW97o2odZNTz0fW9JgR6JHYz2LiKRYU7/QqObJ2ySvK9yBjkhYZUApiT6X
	VgJtqCGRSH5J3DYAiVbq/PRW7/Tr5QwcUAclQbxgZOWCuq8xe07laakh9+jar2uj
	kvLPcsUWPt7eCNj7bYMekA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1771271182; x=1771357582; bh=t
	rb9EY8ABdgfiWbB3ihDhqrGiOdS7b/Umy7QA+G0ZTs=; b=GGW+pgNj9nxA7oXqI
	035Ysn934lK3ptV9V6GHd7ZMcrEGRZ1ZFoa/Kc4438G5pW0xq7DkknlB6cqJPEzo
	lPacQhupnai+/j/biHlG/xqMmW/ZjJh7jPoF9B1QQCNolWzVYmh1VzaC5/jHAFGb
	4NMIInsSp7PGi0vEQynBMjkEtSiZykVFWKfZ3IqjPVp1J1CYVFkWVbGvr+m06DdS
	AMphnwZHqkLZYvhSJ3hyKDl629RiNCa8muTew2lkiC1/Atyim52UTAawRt+QZWay
	8YWg/7fZNx7WpAPahdRPEpjLM/ECAZrNgo9sPRQOT1rB+Sfwxl3t4SJqArrRozPk
	fyApw==
X-ME-Sender: <xms:DXSTafbFN_2p18YhLrmmylkkf_YiL-7COFOt0tOt6ReYATE9RV24Yw>
    <xme:DXSTaZMh8ZploTC3KqN8ctvWNeyv61LgpWWEX9gXBvDUFBt_KFTRwWJqnrvGZzKUf
    3hiYOHaXgMCLxQIE_HUXC1w_YbIViwW-a1Pb0mpPI3axuXku5phFxM3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudejjeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhepgeeuueektdetvdetfedvvddtveegieejffejfeekvdet
    ffejkeeuuddvfeeiuedtnecuffhomhgrihhnpehlphgtpgdrvggtpdhkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
    phgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhope
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgr
    rhhksehgmhgrihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpd
    hrtghpthhtohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphho
    rdhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisg
    hmqdgrtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdp
    rhgtphhtthhopehjohhnrghthhgrnhdrthgvhhesohhuthhlohhokhdrtghomhdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:DXSTaarf7URNqIPc4myH07smnNqbwJQWvhlSCmwS7Ps3qi5X4cS25g>
    <xmx:DXSTaZGtlL51ZKRzfGkGxR4h8u7kS6cJnEvToRAtm3Y0FqpbO02kXA>
    <xmx:DXSTaf4o8UG3QbjMg-BeKppaZ1cTdNZXLFnAyECcEnToL6xSd_bQzQ>
    <xmx:DXSTaRePdkRvLb2-MhQyNWc6jNf1QwDX6kjTJOTASggqVeSPh78m3g>
    <xmx:DnSTaTLL2uujnKZB7oENrg51CSTvKbwUqhAtTaygoVVHiMx80Y-uthGa>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8DB822CE0072; Mon, 16 Feb 2026 14:46:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aod1Im5igXDV
Date: Mon, 16 Feb 2026 14:45:57 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Jonathan Teh" <jonathan.teh@outlook.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <18579151-8c48-4b65-8081-05b9d8488b0c@app.fastmail.com>
In-Reply-To: 
 <MI0P293MB01967B206E1CA6F337EBFB12926CA@MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM>
References: 
 <MI0P293MB01967B206E1CA6F337EBFB12926CA@MI0P293MB0196.ITAP293.PROD.OUTLOOK.COM>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix errors reading battery thresholds
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Feb 15, 2026, at 8:01 PM, Jonathan Teh wrote:
> Check whether the battery supports the relevant charge threshold before
> reading the value to silence these errors:
>
> thinkpad_acpi: acpi_evalf(BCTG, dd, ...) failed: AE_NOT_FOUND
> ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCTG: evaluate failed
> thinkpad_acpi: acpi_evalf(BCSG, dd, ...) failed: AE_NOT_FOUND
> ACPI: \_SB_.PCI0.LPC_.EC__.HKEY: BCSG: evaluate failed
>
> when reading the charge thresholds via sysfs on platforms that do not
> support them such as the ThinkPad T400.
>
> Fixes: 2801b9683f74 ("thinkpad_acpi: Add support for battery thresholds")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=202619
> Signed-off-by: Jonathan Teh <jonathan.teh@outlook.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 6b0e4b4c485e..86e7194ac006 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -9526,14 +9526,16 @@ static int tpacpi_battery_get(int what, int 
> battery, int *ret)
>  {
>  	switch (what) {
>  	case THRESHOLD_START:
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, ret, battery))
> +		if (!battery_info.batteries[battery].start_support ||
> +		    ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_START, ret, battery)))
>  			return -ENODEV;
> 
>  		/* The value is in the low 8 bits of the response */
>  		*ret = *ret & 0xFF;
>  		return 0;
>  	case THRESHOLD_STOP:
> -		if ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, ret, battery))
> +		if (!battery_info.batteries[battery].stop_support ||
> +		    ACPI_FAILURE(tpacpi_battery_acpi_eval(GET_STOP, ret, battery)))
>  			return -ENODEV;
>  		/* Value is in lower 8 bits */
>  		*ret = *ret & 0xFF;
> -- 
> 2.53.0

Looks good to me - thanks!
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
