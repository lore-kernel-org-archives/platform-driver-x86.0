Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECB031D366;
	Sat, 25 Apr 2026 12:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777121374; cv=none; b=sE7glR+P/pY4lmPcOQTGy0vNN2WLa2vOrXvtz2zAGfsRtt0nLZOfde94/4LRcM72OBkyvr3A9gDrocTzQ8+jXPth0z4wvuJyvfzNxnz5z//aVtiFLlNHUdWO6ItRcSxdVjLeP50dHThJ7D/z2IpQlN9TTXqoKn8MEb7NsftwV3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777121374; c=relaxed/simple;
	bh=94HC/f6U316xi06G3glSjwpWPfz9/KWlmu7fgC+7HoQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=MhHuUDt30ye5y0WJui5OuERt+t/6GTN8ngmTflOARMCAd+ka9lLV96Ys7jZ0WrHbkV2JsiwXq2rY/CAq8iAd1DaqdQBIO7ZXFXU+W6/E5rV5SCQcCfeF8fI4/9EJaM9S6rwFg2dcDymlQscjZXN/D+XgcvymfKIcilHXGc8dymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=DvWUeme/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mllZdHsb; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="DvWUeme/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mllZdHsb"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 3850D1D00230;
	Sat, 25 Apr 2026 08:49:30 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sat, 25 Apr 2026 08:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1777121369;
	 x=1777207769; bh=M4RnOaLU50xBlX6J5hw4kk3RMDaNjq/AHLUOvjplnhU=; b=
	DvWUeme/ZkEkvxbX+ueHWZc0HMfGYZsdlNpMW4NPNSiQsW+vUKpsKolOLn7JhdKV
	9lCOhd3w6F+4UsoYsCBju32zYTgioss/T2g9WWHmsNUkyUb/uREtnfAmt52eSTQD
	P5cVj44LwhdCy3xmvfrlgWktXMyPxIffci7QHZaA1kXxLjpkYRms3t4afG8wdLyw
	Wcbyq/zt0g76VNmEg8FZVwfDsFqxFhyUMcCR6A+1qoxPOtAYd2xqqcuZaGs10XC2
	lxexG12ccjKJkDiwv6W3kM9nllBFaZOGR4jfEaWD0wsPKcc2dbhsep7srhmFZtvi
	1k9bWblEtqwM3uEQS3Jd+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1777121369; x=
	1777207769; bh=M4RnOaLU50xBlX6J5hw4kk3RMDaNjq/AHLUOvjplnhU=; b=m
	llZdHsbES8ql585Ya1aMIcNKiJLdgwbTjr7zNraWysIZinzx7gLYpsMnLoewThL1
	4i0axO69FNkVtbZgqL1qziBMtAW438CtsnqnprEZXEAXUyzgtLkodAbPJUjKWVva
	scFGsshdp8ONU8OE28lcrBUrP0TsZTfwC0dKVVEAM9+n8ZvZt6jbVSqd4I8K6pC5
	9ylt42nFL78QOP9AiNdc75ufKaRzN/CYg1V1QIjnBjX3nabGowe5TNGE8gvG5rK1
	QB/X5PzksAJnPlXxTF7WwlKxK749hjPokhGwbm61zXu2iuhfketT/TI1fclXn74w
	T+qQYItKk93rXxV+ERqXA==
X-ME-Sender: <xms:WLjsafx3c2q7yRV4OBUFq0qlnVnSaCsl1XosDy1p734CLJW7W_509A>
    <xme:WLjsaSFS1RDLWgckGz0CC_dfj7f0nYC-BZN7QUszR1j0s2i57_Wg1yuPt09lu8kV-
    K4Z37YbwDMXdNyC2efwq3X8kKH8GM5cfUIZQYvMwLAHz8H5piTC2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdejvdelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnheptdffvefgtefhveetuddvfeelveektdduvdelgfehgfei
    keffjeetjeevffektdfhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmphgvrghrshhonhdq
    lhgvnhhovhhosehsqhhuvggssgdrtggrpdhnsggprhgtphhtthhopeekpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopegvughurghrughosegvughurghrughovhgrshgtohhn
    tggvlhhoshdrtghomhdprhgtphhtthhopeguvghrvghkjhhohhhnrdgtlhgrrhhksehgmh
    grihhlrdgtohhmpdhrtghpthhtohephhhmhheshhhmhhdrvghnghdrsghrpdhrtghpthht
    ohephhgrnhhsgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvh
    hinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghp
    ihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:WLjsaVAzynmz7OxwVPbDRN-wM3yW9BUikOoDRwJCtds-6ljKbu7xYQ>
    <xmx:WLjsaT9vk0TbfV6_la2NUqDuFnHz5YKI49x9AHbAPWyUHMMm4Cu0Tw>
    <xmx:WLjsaRT006FvJkrJbo-MLUqTCb3eHMn8rvzF_mT3p07EwAuP6K6p7g>
    <xmx:WLjsaXXLxCbGadQRATY5mTZiOtrcJw699X2f69oi8qqRgWTqj3Mthg>
    <xmx:WbjsaYl-NZvC3A2TuBo6OQpOdSFYKet9g_lDfVe4yF01_zW0hs1NfS8W>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0B7A2CE3F93; Sat, 25 Apr 2026 08:49:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AVmXazV2ic5J
Date: Sat, 25 Apr 2026 08:49:07 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Eduardo Vasconcelos" <eduardo@eduardovasconcelos.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <16d45e47-8234-4983-84d4-91b66c5a67db@app.fastmail.com>
In-Reply-To: <20260425063936.9360-1-eduardo@eduardovasconcelos.com>
References: <20260425063936.9360-1-eduardo@eduardovasconcelos.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Remove unneeded goto
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Apr 25, 2026, at 2:39 AM, Eduardo Vasconcelos wrote:
> Remove an unneeded goto statement in hotkey_kthread(). Since
> the function has a single exit location with no cleanup code,
> the jump provides no benefit. Per the kernel coding style,
> returning directly is preferred over goto in such case [1].
>
> [1] https://www.kernel.org/doc/html/latest/process/coding-style.html
>
> Signed-off-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com>
> Tested-by: Eduardo Vasconcelos <eduardo@eduardovasconcelos.com> (T420si)
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index e1cee42a1683..d4ed6f1216f2 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2469,7 +2469,7 @@ static int hotkey_kthread(void *data)
>  	bool was_frozen;
> 
>  	if (tpacpi_lifecycle == TPACPI_LIFE_EXITING)
> -		goto exit;
> +		return 0;
> 
>  	set_freezable();
> 
> @@ -2526,7 +2526,6 @@ static int hotkey_kthread(void *data)
>  		si ^= 1;
>  	}
> 
> -exit:
>  	return 0;
>  }
> 
> -- 
> 2.54.0
Looks good to me. Thanks!
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
