Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257EF258CE7;
	Tue,  9 Jun 2026 01:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968566; cv=none; b=ojQ9QuOabLnADblzxY9pbZTk5StU4FDYNKb9DoibFc6ipUeUe/+utUGyuI9nu9msvU1r36PpPxpoIDOKhHh4P87PtNgGaEq/IkKHlhzw4nUFdYJ0z8PIW2okDZ/hdvMTC7V84kYKkwWPs8fg4if4Wp+JLBTKrFN+HE8hVALAzh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968566; c=relaxed/simple;
	bh=6PJgnRScXtOe1h+qkXDxc73ATuniWSkY5mzWbu9Cexo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=t4Xu3pLghzRArh1GNVN/7OH9AY2NjKEd4tldH21MqmhMnaogmQGrfn63rxksEV5uQJ5gM+sOJk1+74raADe60dCKyiiVFImxVtfufXTzrNRWG+d11fQc1yD6vciJ8+gmL3KTO7x1qMNynB3Dg4PGXG7/WTw4NB/rUtCxbgoysh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=uvr9C1nt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CNE7h3rJ; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="uvr9C1nt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CNE7h3rJ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 49A2814000AF;
	Mon,  8 Jun 2026 21:29:24 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Mon, 08 Jun 2026 21:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1780968564;
	 x=1781054964; bh=oV/MVDJ+HSAEa7N3DZxWLzIlbdKxtChGGwIa1fUiCIY=; b=
	uvr9C1ntnP+4zOwPfhGyt1Gkz+ykhEahA9ra4hh+j2OftgDRNbTqDvUjkNPyUSiu
	uC4TgPVZzoT4PAkQrVuW5KudMVH8nbPMb2/BIso9uUGNm/AGOZtefoYKT6Qv2PGW
	5u5+3WFEz480oYExu02ANdktL12IqIh7EZbLoYg9ALfkB/boMaU9/jEfXHSgzNtL
	12lblZF/gPYU40oUWTgdhVUVFjwwFXFRmaM8tgSGHeeZDK9CYkUkLH75bUsVVxdy
	rehn8Vc+iw7KkjJd+c/eD8bsllMCeGn3nUTfE6VgjdwnvvE2F+HhHJhOqFDUlzk1
	DZIj7umdbM3rDrtzyoy6ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780968564; x=
	1781054964; bh=oV/MVDJ+HSAEa7N3DZxWLzIlbdKxtChGGwIa1fUiCIY=; b=C
	NE7h3rJ0hX3m4LQ9WP8zNmqgkQG34HVbwPV9qW6BU3Ka0aEMPD+Y6M4E+DvTQZKh
	k2Z3auilZkHLOOZe9FX7LaRDy2B85AjWwk8J1vuJ8EC+k7wPIWH7stVvdBPIKsVW
	UOW9byn9ZWWUOxKIFExvcaZ44ZMVlwsF/9odMt6ytYUamVmviYDkadcRJww3I5sb
	oo9Y2r7JzO1zstN/7gKYgt6ZMp47nQK2MXEhYi3y2zTNal2GakT3I9OlUsjNiRG5
	D6fSD9Cjtir5d5ZBVccRjwkeLsV00STCEtJ+Eu3QMrosLMzeaQf49M8ikS7w3lYC
	QMj6aQcBesuAROdOsZCeQ==
X-ME-Sender: <xms:dGwnamav9Bx54OSYOejiB_Tf4j_0hg2ITSVEm-EnMj-j1vCiWg8iFg>
    <xme:dGwnakMmWyvS32fZqodZAbqAv2LMPkB7GdKbFinb1qQY3_e8p8QfRwPdyI1Ys-ekF
    uqRhVgk0Yd8ZKVrgd_WzMs_KXk9EQ7OHY7Qty1SmU-Th-MIGBEp1M8>
X-ME-Proxy-Cause: dmFkZTE+mW69szZbeabE0AV35vCLhE/Rp5OivCTy9FU70aSy0Wu9jJ+p8JaW3yGqkUUeXu
    T90xpbz8Jtfixg7u7tH8K6qCBic0hj3X3MLAhwfmtnHnYC6q+P0st23+bQb3uWC5yCIpdj
    gCaqGjSM/NPANcuWpiN+771YBVmhF7QHKepMmJnQNO5yCsw+oJ0c34Tm+PIQM/LA2h4hPx
    Jk0zZJMBdUjdW0pegUi0oStwjTLxiD8gjXftjANqaXEA5yQhzikUXgORGsfc7N6euXl+Z3
    UjcQxyJV2K7R7iDobUlTWh+xb3pTyxNMo0F2yvyqcrqbzqQrtFV5AqR/OwwtEqlJH5k0Pw
    l/p04yKkhiT8ztoLhz6kumVjAL9OxCuCCZCjXBoF9Mi8LOPXKjsQJui+nKffDBRNYMOGIW
    mQfCKEEMyBNAG32v+HWzQCO7csPNI2rzpq1Fzew7xIweYC8FIvsKRByaGnYxzsMUn0TGnF
    sWEKh01N3p5uR3giXmschR7lsBeqjMu1QS5x0pEfqZ/j9rrhQEXSeKXpLE/rXLEyIe3Iaj
    7lFgk7TxHvKKsWww+N6saiEpskLzhtUqmZ4TOf+8wXfc5HD+oKuyC+k8/wifeXCM/CWlV/
    PskLFHTSYr0qwDV+ZdfNA6rycRwEB2x1BxAIlG2gx0uVkzMpzlOvlPCt3HhA
X-ME-Proxy: <xmx:dGwnaoTCoCVg9DFP1AMWUZtPePe0Dsn2ZN47jVGKlJoTkz4qjYsRaw>
    <xmx:dGwnamfYlMyW4jqm9yihSMCz93TmGfRPF8a0LcPfvWi1nlJFGp0yVQ>
    <xmx:dGwnakCCde6Yr2DUj-dwBrYjaUbrGidqeBAy2_ofUvYEXzpBHQY8sQ>
    <xmx:dGwnaglVWwCKsigV8QsrOxTPddyLVtf84YSlxMr-N_MLP4L_HwAOgA>
    <xmx:dGwnamK9bHabXPzrEKzJvUoieCdtrjqBEyIkp0UxXEL-C-GUA9_nSWH3>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 10D772CE1D5E; Mon,  8 Jun 2026 21:29:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Av2xLY-ZXd6J
Date: Mon, 08 Jun 2026 21:29:02 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dave Carey" <carvsdriver@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Hans de Goede" <johannes.goede@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 armin.wolf@outlook.de, linux-kernel@vger.kernel.org
Message-Id: <bacf91a6-b5b9-4597-a0de-b1435c1eb235@app.fastmail.com>
In-Reply-To: <20260608215205.678182-2-carvsdriver@gmail.com>
References: <73c27728-2f07-41c1-82c7-fd6f46c89f3c@oss.qualcomm.com>
 <20260608215205.678182-1-carvsdriver@gmail.com>
 <20260608215205.678182-2-carvsdriver@gmail.com>
Subject: Re: [PATCH v6 1/2] platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga
 Book 9 14IAH10
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Dave

On Mon, Jun 8, 2026, at 5:52 PM, Dave Carey wrote:
> The Yoga Book 9 14IAH10 (DMI product name "83KJ") has a dedicated
> yb9-kbdock WMI driver that registers an input device reporting
> SW_TABLET_MODE to track the detachable Bluetooth keyboard.
>
> lenovo-ymc also loads on this machine and creates an input node with the
> SW_TABLET_MODE capability bit set.  For input switches, the presence of
> the capability bit has semantic meaning: userspace (e.g. GNOME) reads
> the switch state at startup from every node advertising the capability
> and does not expect more than one such node.
>
> Add a DMI match for the Yoga Book 9 14IAH10 to probe() so that
> lenovo-ymc returns -ENODEV on this hardware, leaving yb9-kbdock as the
> sole SW_TABLET_MODE source.  The ymc_ec_trigger EC write, the only
> other action taken in response to a YMC event, is guarded by a separate
> DMI table that excludes this machine; no other functionality is affected.
>
> Signed-off-by: Dave Carey <carvsdriver@gmail.com>
> ---
>  drivers/platform/x86/lenovo/ymc.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/ymc.c 
> b/drivers/platform/x86/lenovo/ymc.c
> --- a/drivers/platform/x86/lenovo/ymc.c
> +++ b/drivers/platform/x86/lenovo/ymc.c
> @@ -23,7 +23,23 @@ module_param(force, bool, 0444);
>  static bool force;
>  module_param(force, bool, 0444);
>  MODULE_PARM_DESC(force, "Force loading on boards without a convertible 
> DMI chassis-type");
>
> +static const struct dmi_system_id lenovo_ymc_nosupport_dmi_table[] = {
> +	{
> +		/*
> +		 * Yoga Book 9 14IAH10: SW_TABLET_MODE is reported by the
> +		 * yb9-kbdock driver.  Suppress lenovo-ymc on this machine to
> +		 * avoid userspace seeing two input nodes that both advertise
> +		 * the SW_TABLET_MODE capability.
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83KJ"),
> +		},
> +	},
> +	{ }
> +};
> +
>  static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
>  	{
>  		.matches = {
> @@ -100,7 +116,10 @@ static int lenovo_ymc_probe(struct wmi_device 
> *wdev, const void *ctx)
>  	struct lenovo_ymc_private *priv;
>  	struct input_dev *input_dev;
>  	int err;
>
> +	if (dmi_check_system(lenovo_ymc_nosupport_dmi_table))
> +		return -ENODEV;
> +
>  	if (!dmi_check_system(allowed_chasis_types_dmi_table)) {
>  		if (force)
>  			dev_info(&wdev->dev, "Force loading Lenovo YMC support\n");
> --
> 2.54.0

I'm sure I'm missing the obvious - but where is the yb9-kbdock driver? I can't find it...

I was curious as to whether a separate driver was really needed for this platform, or if it should have been integrated in the ymc driver in the first place?

Mark
