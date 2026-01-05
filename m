Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C409199D8;
	Mon,  5 Jan 2026 02:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767579279; cv=none; b=I08bM/rX6dG1YQTcCldDGRK6XjVvIoODywDLS4/ltLJwfyIWSTQRUxm/mv5hUubxwv+bBOUi5LU3XTD6v3Veh8IbzO8XyK8xaD1YGnVmKIpvD62XZQ9NmnuV075q5YfjAIdEaEpGOwFmsbwocoU/RJtZkzgjjOXN16SQctlaGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767579279; c=relaxed/simple;
	bh=eSPiTuiLmDygq4SjJt5sNymSqRGSFTyZuO69GG6FdmQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=r1+/XvUA1+Yn9Ul+FQAS4amEvazSHoykxN5ZDfSGlXQ6YdHHEYIEB98PyjbyPGhrp3sh857JwTjVx02O71VbfRY5wEw/aGmskXkrBe/465KN2fa4z0zPwHoL6pxXnO9ZPez+lc6BFbu2JLzjt3B1TGOZjHVF5XvlvHaVwvtfTvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=aef3DFDD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Lti4N79j; arc=none smtp.client-ip=103.168.172.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="aef3DFDD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Lti4N79j"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 91579EC0022;
	Sun,  4 Jan 2026 21:14:36 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Sun, 04 Jan 2026 21:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767579276;
	 x=1767665676; bh=/dc7lVw3NxD1yDOQNjjhsNmz9oefdEWxWwUBsvucQeU=; b=
	aef3DFDDvYUJFAjz4LCHwZ9+URwnHM7TJ7NDsIPxzNMsDJG4OWRCUuUzNP+Osz66
	xy0XG+g5KlX5rvQMiLv/sayqQrlnLNdYntvYpbgaep4tY2P2KO7JC/wtWtDXEVjZ
	zxTTjAIZbdKPxGDhbv+K8Nv4QDokub4iRVzcNlruxL+whKtM2LVvDrTRUZuDlbaJ
	+AInBH1ncqjLbM+gVVCH6SK4W3OUIlTJq+z5+vL7lOhTLvwk5KzmKcYhei+uFGUU
	whbcPzrFXbLAveOoKyGEGalqoiGvbbBv7MZXB5zouI6XmlJKgJ6w+jwomkpsZOjW
	fqvqf34y29mLchaXTirzrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767579276; x=
	1767665676; bh=/dc7lVw3NxD1yDOQNjjhsNmz9oefdEWxWwUBsvucQeU=; b=L
	ti4N79jM+kgTTfMcCjOYglv//C6dO5p+qK6+Blw6pzz2gZSuLe+MqsCbqkd2WU/A
	0BmVkTiiucfnkNkAs5PWQankdc0/LYLeQCiaEGm4b3yeugMNXaxLQzNo9Bb6wX7F
	0PQ5OF1heuW8OJdjZCEK9VD9GxXt0/guxTm/nFUnRS3nmJ42aEigIQOKb/sksv8k
	LJ5yxX6IB4SBDdvcrLLcCcQb3lsVcM9pS42AOhNwD+IZkHMl8jjO5KlbOgwlAAmq
	e5HaDaPO9XlgDrF8r36vLpJWrpTpZXAZYY7/sF3ft2L1WFrPnzv3rC4ujcCjhC7X
	+b3ORFKv+KUl/XufE363Q==
X-ME-Sender: <xms:ix5baf85YitvKFSk_iMQCbaDgvnuz5BwOagf8myucRDLCYXKJFxXJw>
    <xme:ix5baWifkC1YOiSw6X_7V_0ZknN77tUO1_dg3IRt0ndaw6KPgALjBtn3wESJ1NCmF
    J6KSe4obE3IW71ACDqIeqpgic2jnaV-fJ3-myOkgdk7WTLqAlbOAI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeliedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdforghrkhcu
    rfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrg
    eqnecuggftrfgrthhtvghrnhephfeuvdehteeghedthedtveehuddvjeejgffgieejvdeg
    kefhfeelheekhedvffehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgs
    pghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsggvnhhjrg
    hmihhnrdhphhhilhhiphegleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvrhgv
    khhjohhhnhdrtghlrghrkhesghhmrghilhdrtghomhdprhgtphhtthhopehhrghnshhgse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhn
    uhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:ix5badgtgzxppkR0vQVnGoS4T9e_MurRE__S6uccVm9ccBe3xgamyg>
    <xmx:ix5baUSZ-DDTysULbgGGtBJQU9jZjS37iAtQRs4D6jw-is2UbFYjXw>
    <xmx:ix5bafU1gGH20DdEVgOvZzDCBVwS80WOhsewFoH1qQArZ8D2UygelQ>
    <xmx:ix5baYSFnHbV4EqxrxlyJcPw6cmrQbjx9B-KcwbPaRk1GNLh1SZhcw>
    <xmx:jB5bacvLcnKlzxQbuT3M8G0iaVymZ-f91dth2eNmgE53_vIEVwBJloOp>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C91082CE0078; Sun,  4 Jan 2026 21:14:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: ATdvTkCHFK3g
Date: Sun, 04 Jan 2026 21:14:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Benjamin Philip" <benjamin.philip495@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Message-Id: <ae5bbfdb-5a93-4f7b-b553-86014e6a2029@app.fastmail.com>
In-Reply-To: <20260101141657.54258-1-benjamin.philip495@gmail.com>
References: <20260101141657.54258-1-benjamin.philip495@gmail.com>
Subject: Re: [PATCH v2] platform/x86: yogabook: Clean up code style
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Thu, Jan 1, 2026, at 9:16 AM, Benjamin Philip wrote:
> This commit cleans up the following checks flagged by checkpatch in
> yogabook.c:
>
> - CHECK: Prefer kernel type 'u8' over 'uint8_t'
> - CHECK: Comparison to NULL could be written "!data"
> - CHECK: line length of ... exceeds 100 columns
>
> Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
> ---
> Changes in v2:
>   - Drop cleanup for "CHECK: Unnecessary parentheses around '...'" 
>
>  drivers/platform/x86/lenovo/yogabook.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/yogabook.c 
> b/drivers/platform/x86/lenovo/yogabook.c
> index 31b298dc5046..69887de36c9b 100644
> --- a/drivers/platform/x86/lenovo/yogabook.c
> +++ b/drivers/platform/x86/lenovo/yogabook.c
> @@ -57,7 +57,7 @@ struct yogabook_data {
>  	struct work_struct work;
>  	struct led_classdev kbd_bl_led;
>  	unsigned long flags;
> -	uint8_t brightness;
> +	u8 brightness;
>  };
> 
>  static void yogabook_work(struct work_struct *work)
> @@ -338,16 +338,18 @@ static int yogabook_wmi_probe(struct wmi_device 
> *wdev, const void *context)
>  	int r;
> 
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (data == NULL)
> +	if (!data)
>  		return -ENOMEM;
> 
>  	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
>  	if (!data->kbd_adev)
> -		return dev_err_probe(dev, -ENODEV, "Cannot find the touchpad device 
> in ACPI tables\n");
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Cannot find the touchpad device in ACPI tables\n");
> 
>  	data->dig_adev = acpi_dev_get_first_match_dev("WCOM0019", NULL, -1);
>  	if (!data->dig_adev) {
> -		r = dev_err_probe(dev, -ENODEV, "Cannot find the digitizer device in 
> ACPI tables\n");
> +		r = dev_err_probe(dev, -ENODEV,
> +				  "Cannot find the digitizer device in ACPI tables\n");
>  		goto error_put_devs;
>  	}
> 
> @@ -453,7 +455,7 @@ static int yogabook_pdev_probe(struct platform_device *pdev)
>  	int r;
> 
>  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> -	if (data == NULL)
> +	if (!data)
>  		return -ENOMEM;
> 
>  	data->kbd_dev = bus_find_device_by_name(&i2c_bus_type, NULL, "i2c-goodix_ts");
> -- 
> 2.52.0

Looks good to me. Thanks!
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
