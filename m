Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9591313523;
	Wed, 12 Aug 2026 00:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786494203; cv=none; b=puZsz5lDWH4ytghSqBnsFdhlWl6DF5uNBEPU9p1zMNrDtqDtazj5zy+HTBGimPeJxhg0awQGSp9NJcqqLmzukpeMZJkRoLEv4p1P20LQ5HX0PSJhqTrswo9LHMt1R09XVeukecqCG3FSg+xdgdWK5nQWpWyJmyD4fI7NRegKKJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786494203; c=relaxed/simple;
	bh=IHW7lKd6xh+2PyojlJrGeQNfhxrXSNdD9OT2Stl+FUU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IdbZmvm+vgs90YOLWE4nKjcLA+inYR0JnfePUWTZDplOm1GzWBOdSW+2xWnTcNR61YCXihtZhK40AijJlkjdgN8VCscI6SS50Sv70vA6xgyB9opdqdJoIfdvPhPRMUo/LYs6eEitEodCsBL5EIvqRZeO1QWHAMKKYU7L8vtUSSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gW5XO5d+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TJh4GGE1; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gW5XO5d+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TJh4GGE1"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1C41FEC01F4;
	Tue, 11 Aug 2026 20:23:12 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-02.internal (MEProxy); Tue, 11 Aug 2026 20:23:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786494192;
	 x=1786580592; bh=QRMSiaBJK79n18oHBzMb59QRhyBrxFZrSmJccgchod8=; b=
	gW5XO5d+6R0Uq+Ro2urrFkpSAurYaUb5nGUw1Q0IjcLueP6FLchvsDXVxfJQKBD9
	QvAbhD6Zgq7toJBaEdd54jCGvLO9ZBajpN95sfNSw9j0EhFxMinBMPbD1RVYmbIA
	02IXbl9B6gIVz1ge4oEJJP6IFKYrXmdGKynHc870HslEXM4VzpVGNtwJtqchyv7o
	rJCxcTRMr5ygQf8zyNKvWhoV4dYAz5CHxI77c7r5FuTs50yVMvwi5383+/a6EZyv
	zMhQHnTu91abdZLPFtisB1mjGVk5N1k/ls74e0IhR0JB5N2BMZ4nUwaOZZ1MPPSw
	g8+pmgfIrrRnL+MmShKgEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786494192; x=
	1786580592; bh=QRMSiaBJK79n18oHBzMb59QRhyBrxFZrSmJccgchod8=; b=T
	Jh4GGE1q6Bs+0ynuIsrp1FFR6CKNqjklAAUqXrkPFw9xP6pSXcsOymIhH0X+Zg7c
	Zvk67Sr0+SWY79JUbQBrmHCpgg+0dgXxWyoZdcPUsKtFAf2Di2ZDvh47xD8och81
	8DhFlOUOBnIM60Xr+qZP+cB24lO9saw4gk+BRKN65bA2JV/Hrl9sGjKCjI1xn2sQ
	GtKZdYFaspYXOBESuijxsJq8/2/FOdVyfiNYSOZRJNFctUElCnctIlP2aflBzhVi
	5khq+EqyEyhmvcncRrGn5MhLGJAZu4xIdmqhStg1ff1d6TwWGYbntnbu0NsOEKRh
	POTo+qWz3j+pJcPmjvnCw==
X-ME-Sender: <xms:77x7atGxVfC6T0Tg_BrvR4xYdYtl5meUiMep_mertw7rwEj5EY3Czw>
    <xme:77x7atJPeVjXAbl2Hoi4AVg5nqdtC5FTvMpdwa-I5rGzayGrFU864Nt8g6_oFRsnW
    3UhmgcidRVWDTfLwKSHevu6op21Ny4-6fAui88O7vdVCqr02rh5vNVX>
X-ME-Proxy-Cause: dmFkZTEbfkHaIqj+FBNvZveN5GRWLwN/NVW0/ZZjBztW6TYxMVoEx0NrUOQ7YlTHbFHYYo
    qSh4f8cgpMJ+qpXHGPpNsYxaBjGtZ1HenNeoWL1/PEZKAgMGfw+ojcn58IJsaD9gt7C7gV
    9gh+kg3TRGfhsaooO5JEaqE7tF/rDGrLWzVJ7Onok2T/W5mkQHn+9X3ukiwG2FKua0X4FY
    +4rhEJoc77EbHr9k8Os0hyinHLnzoSGb1RG9MmjnVZsdYX9g0SNBYITNJ8aTnH2bjOoZhw
    KTWW6iydbs7SEv6fls59VPSoGxBCSocP9aywZaj+ZCVGPrX79ev7Dzi3E4CiE3WnuAv9Ra
    h5tyY2tAyJMqPIBpdi8scVytk0TmglFTwW/iE6QN1MflcT9/kv5LbdS2ZlZ6/5zvkAZ/o+
    J8yFxo6Wm+Jkn5ebClbPuagsDcemTK0f/kqBDhwplQ/wv696YfNhAhCIGyIQ+oUtzgifsp
    EgdBQv7B5QjuBipIYkf6/ZJM1HMOW7I0wc1QSXIOnYFP2GGmZQqawzVUAA6kwSty93l4h8
    TFZkI2ilsczrGNsw2DJ47eONDskmw2klS3QMeNo8Ro5sgVV4cTOxKbReDHRGiCx4tACiYl
    0zdeB7DQSetygKs2PV0ASCKBRP+8xLqSTYzeg3OQW/qeI7B7cHqf24bZ4KOQ
X-ME-Proxy: <xmx:77x7atU2sETGWBNAysQyDSy7c7tkwy_PLxhp2dv1UQmk_NN_nagMng>
    <xmx:77x7auBsSOShdCwiZ1LG5vlGqQMS6Z0CTt3RwErvjL-Ba3-iViL7IQ>
    <xmx:77x7aqGXLqxaHgaFTVs9QEZQOL9v-cz6AfgJfAYw7rVZMJH18foOSg>
    <xmx:77x7an4cSQqqQ29GlgvkcLz2bo4zJbYGaFp6TDw0PawTiLtX_hcNoQ>
    <xmx:8Lx7aupzSXelvwHBd94NJB9pHvJdqnIKNNtuecVceSE1Wmp4apb1pJX_>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A15F72CE0072; Tue, 11 Aug 2026 20:23:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Ahat6sCCnPMR
Date: Tue, 11 Aug 2026 20:22:50 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Andrew Onyshchuk" <andryk.rv@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <d26adb42-91e4-4c44-b053-c87d06a05125@app.fastmail.com>
In-Reply-To: <20260806154417.618575-1-andryk.rv@gmail.com>
References: <20260806154417.618575-1-andryk.rv@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting on Edge E330
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, Aug 6, 2026, at 11:44 AM, Andrew Onyshchuk wrote:
> The ThinkPad Edge E330 with H3 firmware uses the non-standard EC fan
> register block. Without a matching quirk, thinkpad_acpi reads the legacy
> tachometer registers and reports 0 RPM.
>
> Add the H3 BIOS family to TPACPI_FAN_NS so the driver reads the fan
> period from EC register 0x95 using the existing non-standard reporting
> path.
>
> Tested on a ThinkPad Edge E330 with BIOS H3ET77WW and EC H3EC35WW.
>
> Signed-off-by: Andrew Onyshchuk <andryk.rv@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 445e1403308e..cca76711c547 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -8840,6 +8840,7 @@ static const struct tpacpi_quirk 
> fan_quirk_table[] __initconst = {
>  	TPACPI_Q_LNV3('R', '0', 'T', TPACPI_FAN_NS),	/* 11e Gen5 GL */
>  	TPACPI_Q_LNV3('R', '1', 'D', TPACPI_FAN_NS),	/* 11e Gen5 GL-R */
>  	TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),	/* 11e Gen5 KL-Y */
> +	TPACPI_Q_LNV('H', '3', TPACPI_FAN_NS),		/* Edge E330 */
>  	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd 
> gen) */
>  	TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
>  	TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),		/* ThinkPad x120e */
>
> base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
> -- 
> 2.34.1

Afraid this platform is old enough (~14 years I believe?) that I have no easy way to confirm if it's correct or not - so glad you figured it out!

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
