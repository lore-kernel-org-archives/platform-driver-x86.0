Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783E13F927A
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 12:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791290026; cv=none; b=ULkflOFLVZznYsM0n1KIFk65+5esH/66t34OHoe/ocUFsU66IEV6Srnvy6PRR3DtXIHpTK8UersBDBFlemAMztvg37LsS5Bm5GXGkXKysRhRN+JzUCbK0YZ9vh+2dEPTKT50X5piEdN1KE/2pm73XmtriuroBUa246uXnduTXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791290026; c=relaxed/simple;
	bh=HtuoH4nLhViLCTxk/zYA5H48p9f+Dz0K+ScnypVPmDk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=i4alNflB5zbVU1vFF/A4+VzaOucPYkQ2TDtT6kosooHEEOZFEd71IudL8YZrC8s+GgNtedIVRYsa46ZqSWfeMEDDnxlag504Nyny3uV5OfwmhYJ+bG8mspvtGBWCosn5AZ/4+CW+BLKAYjcSCAYHGcTUIZsjw2BglH7XP9i8S90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=TFrdvrGF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QmnwCI54; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="TFrdvrGF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="QmnwCI54"
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.phl.internal (Postfix) with ESMTP id 91863EC0923
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 08:33:37 -0400 (EDT)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Tue, 06 Oct 2026 08:33:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791290016;
	 x=1791376416; bh=mqtSCuR4+N3cGYr+9gY00mnCttCgXqN2cooZ0FKTPJc=; b=
	TFrdvrGFcpWIDtzGADSxAdB2NNiNYLR9xHf5PRKOar2x5hem7JlGBz4DBMN90v0Z
	N0mCZftL6zsc/4dCQ6qcQkCNXhYDAbME52weVU5d6Usk+4vosVoMaTY02DZcnwoA
	FUnUTJi6GII1oL0T9rwFyTcoLE1/qNw2wAULN4qdBb2324hd0zE1L5G9NGsV2uRI
	CM06CVQ9YQmPciKL+dLarCV9VuGG16ZYkIas+9GiQnOXqnRVARWocbwaFGCoBB5I
	eaRLNcSvUAjR/v9w2FXq+TgPLvFKEtgC5P/FZvOWApJepyzKyAMLnnAEfAjFZQfu
	xKfVf+pGjgLQKVSgyolOTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791290016; x=
	1791376416; bh=mqtSCuR4+N3cGYr+9gY00mnCttCgXqN2cooZ0FKTPJc=; b=Q
	mnwCI54csOjnh+QzN8TLMg3wxyYTQ6J96mVLNkaVitJ9QzYuzz2uZPQQsBFXV4Wz
	/AzL9STyfuuanhv/ZM/9pmBmXNL2gL9VYplJSsKeqfr7hndgY4eYcKPnKpnx9ZyY
	CLjq0ePTP+nrb6kRmbBCQ6FYGGJEe8tzlrtUbLgGNsHnFNDCG4vrXRRgdyFziune
	BF7LjVV3nX+0WnNaJOTZyUfSEWRcULnGM5U9FwnyrTvYRErAZS677lHcz6Sel+g8
	fEHDKF5+oBrwGrcjsT5DunlxBOkG7d1RQa/CoE3VbWlYpFZl3JEkeD86tzaR4zOs
	otJDSdxPDxZgBAkk8zLEA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791290016; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:Hf2B9Ec4H8ap0b6pak14OoOd1C/JM9LBwbFaDsngDH9Ew3W
	VhDHZrrG6XFI6esVo/3cYKQWUrAF4eyKO5fEilNbXr8pNCs4icwBzep+PyNGihlg
	mLaf8+9jhQ62LwlwiP7NQXi8y5r1tunbOoXXO4WBaO810ourPfPqjL/8ck1YNn2+
	b74sUz9/A1ey5jP7NURPFgHmIZGrkg64zxLg4HbqMyyhuN1qJrikukcZJU+9sIHk
	BbSI+Q/+D9TtggkwlCLk4yn2/rnNHnIeJtlvitpZd5gYdJrjM8lLbTx+/5Tu7Mf3
	zKIhs5PlDpQ+mbpBV6aT04c/wjWTGhnynCbP1CA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nUKjUpXHvFCG9h3aDv3cLpLItSa0jhWZvx1CNNBd5w0=:HtuoH4nLhViLCTxk/zYA5H48p9f+Dz0K+ScnypVPmDk=;
X-ME-Sender: <xms:n-rEalvd81RrzVp_vor4N6DTyZ9cANASTOPWi1NnuNu8n5XS_2HZQQ>
    <xme:n-rEapTVJxpVjf2AKgmZ7Gk5xkg8LdzM5G_naxoR0ycNU3xA8hmKAw-NqZplJ_Jj4
    QtmQpvJhL1DOJ_JiV07us7gQa35xRosIvn-jT2cs9j0jHnKs0CdNXg>
X-ME-Proxy-Cause: dmFkZTFHuLQoIEluWIDZy0toML7qjE6ifqILcXEDmfcfpM5Rb7zTAcwieZg7xWv3sUh7mN
    yX/MohPTiv9v/NCoF+dyYzZcT06VUkXHqLkQAPE6DFDHE4OSTfo9SEaWhgijgpgtOU33ba
    vtnzqohr3qoCe0ulgFFm2+GINSAoJePlJDJOrERdiiBe9/4DPhKLTp7gYC71uqqeTWi0Of
    QYRpXM+EAP5tQ/afDERPsyoslsXlz33bzz+CuUqn8y4S5+TwxI/TGbk1KhMV1V8iwikFRA
    ZwxYhqhJklL4S/v+vGU7me0+yIUFykuueIb+GwNqSmORRRLKkIfsZ2q6Impxwogkglgqlv
    Obzxp41E7/TCP0U0LxXzq1A+/2mXYgkRfUp3owBnFXJvVyRWTByAC+61QLYBfsrU/S1fT1
    uYEHro+LvFpBqH7Ax5z3PsqiUY4fWt8dIYe0gNbTUYeWSASUOGSnPInSBzJNdb/dajUZT2
    yt5Shl3UgNtvvYqpn1Vi6mUHW9iR5vcFekWOH59aCtbRsnvPy9JHoAJrH/YUFp9EIhjLho
    0fA+izi17Yw8V2zlxBDWKiFL3iiRbivwKHTgui/+tcEH3XBD+ScbCeXs9qkSFgMMu2rH20
    lNmiEFkkrX3duvrNfoA/J7b/quEXnxYKPtqxGaTv5+Tnmsis8p6sQtAQKx8Q
X-ME-Proxy: <xmx:n-rEar8X2fJTtiwXxoNdSdHVPE5TmurRRijcQ_VWHWmYyO06U8moAA>
    <xmx:n-rEaoJsegnIap0MluVjCotyMvZRFpSYug65u6zlZZ63i9MKLJFQAQ>
    <xmx:n-rEapv7e5O82zYOYkCtIWtbaxvzemU1avVZzcgUp2fKu_lQeevnLw>
    <xmx:n-rEavBJhwS4Wc8Z_tX3CIHhYAPfYuPzsje4lMaZpCf8wI_btYc6LA>
    <xmx:oOrEagxLnGWPJ7eAUQrvhclz19vwpqXs4PI3AoB-n5ToQy_JDSdCxCsj>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 5A40F2C00076; Tue,  6 Oct 2026 08:33:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: An8UdCR2lhW-
Date: Tue, 06 Oct 2026 08:33:15 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Thorsten Blum" <blum@kernel.org>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: ibm-acpi-devel@lists.sourceforge.net,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <98bcf262-d1c6-422f-a1de-d41d41a98e97@app.fastmail.com>
In-Reply-To: <20261005163130.20375-2-blum@kernel.org>
References: <20261005163130.20375-2-blum@kernel.org>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Use bool for local is_thinkpad
 variable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 5, 2026, at 12:31 PM, Thorsten Blum wrote:
> Use bool for the local is_thinkpad variable because it only stores a
> boolean value.
>
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 1661f070c571..1082c36ae723 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -11925,7 +11925,7 @@ static int __must_check __init 
> get_thinkpad_model_data(
> 
>  static int __init probe_for_thinkpad(void)
>  {
> -	int is_thinkpad;
> +	bool is_thinkpad;
> 
>  	if (acpi_disabled)
>  		return -ENODEV;

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
