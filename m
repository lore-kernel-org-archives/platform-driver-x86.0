Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748256;
	b=B1miz35g/UjqbApcUYb9fjOlffzqG5HoPQikIQ2dZw0QgYEK/96OznRUWJ/7QTI9z95g
	 vMYQ7UZ5hQFiXqXi3Yfls9Shm/x1W7sDIaSKm+osQcOlgm8O2IsLScSOjso9vyJoE3+JF
	 9239hw0seQAQiAvZxQVyStn6qGpgEekAeTxB8qvaNqY96FvdlEJR/gr+UFZVDPXacRIuD
	 U+SGhkKIcj09MlW0PyCb3T0gxmExxdGydr/qA+jvbTOOCFn8xDcCCvV4wR8dX2jmJDiGg
	 eNtE3IeNcD2PY4H5bHB4htNM15Lucdo3/j3SblJCJN7DTVX7+vlqBmjcuMYrgsVabmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748256;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=uIjLsaOYaWwUEjrFbKpDugDIIvk/TRcaWwfj2pghAh4=;
	b=xBr1t0yehmd0w1yf5CKL+870e6rMiZGG1KscI+mglj89diUd0KW+uan+077pKXzSBbab
	 RNsxsYiEzVa/ANvCpPBmDtdPBRDrIdXtZpoG11A2HW8JDYIy6v113qtXhzTYwrWCrLoFm
	 t8sKXdF4cJl4GFAb1Cznl44yI8W+dNB+k/oStp/hr17yTeBh5miQc5CWpyuURLg5rY+y3
	 pRdltW0weGlDSfydYY9QUdEkfSgxrN4WhuowGjbtb2C5nURcGL9aSNTWVd2uj7ww2IXi6
	 cWUTwCVjAEPGOTLxZJuapvwiPKpkRwxpc5ktu5D4BuG5Ox4aLYf8bQ2yNdgRmRaLEBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=G0QsHsxt;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NOQ6ccEG;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32721606A321
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 02:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32721606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=G0QsHsxt;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=NOQ6ccEG
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 8FF797A0518
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 21:57:35 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 21:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795748255;
	 x=1795834655; bh=uIjLsaOYaWwUEjrFbKpDugDIIvk/TRcaWwfj2pghAh4=; b=
	G0QsHsxtZghP5wNl/aU1Jq9zrohy2cWU+pHR9ER2gLyjBL4cPdrw8Z8Irkkos7Wb
	uXgabNT+Zahe67DJ/I9whYYe+b+aXHKnq7lDbKJLzONE2Jp3fHuNBYseTCEkLjLY
	R9pBbZN00AYaDz1wljYLo5arYUCKJF+h07zPl14jGt8DHhq1xaeNyeSQaA6/HzVN
	nuyql1cWJTIYmvQ1AlTLvgWKZmHcwlYa9qpddempSHVUzB3fUa+8zkFNObpT3U9B
	1nKKvJUbN39N1zgy48wRQkRnvbxx1a9CRnhaAf2DfZXKfjjzbSvK9sh+FVTDh6Nb
	zSGT0EiGkHz5GL8BMG8P1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795748255; x=
	1795834655; bh=uIjLsaOYaWwUEjrFbKpDugDIIvk/TRcaWwfj2pghAh4=; b=N
	OQ6ccEGn+pGF8s5oo0GW5fBJVJZlbGE0GabsT8wV+Rktn157Rv4o8lCT7OKm8z4I
	pdv0iAO3YnmTLVVyuQcUwz+rXY7sPjlLNL7yANQgF10Sht11qwuhh5LU6tS+zzyK
	gE1y+6Wu0HiKzhLA+Ch+mU8bJ/ojgWXiV+xGojUUbyND0TnXBjsOrJ2NZvIwHhH6
	a3FkDkDCQyJw/7TTZWyfU24kTPhgsqXzBh6va92e1XMT6kuTN84cndNLxw1VAAb9
	Euja9Jqs39QLgDL24fUP2HHHOT9cZCcponKUCU85PjMtdTsA+q9cKs3yZkXVeZk0
	JQj00JgsToy9if5YAeRJA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795748255; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:f/N7RcEI3s9X9nisDtzYr4X+XtW1FLfMKU4QgOlq9NGHvUO
	1b5btEStz+rp/U7rmm0M3FWG4xllFGZnJY2sWEyNmhGtFji0YxjxEC9OKeMQ/RoL
	r5qFiub5Ui+YL7vywrNFcq+vAM83rIob8RgrJW5v+EjqNYnPL8gqTWSS32DGZpDX
	cef9I1n3OLmoWPQr8ICzp1+fuXCekZg3AavEcWzwlO4WxuWLoxmTOWkCH15XmloJ
	ekrbLK0mFHnh4RwexIq2VWvGhwSOkAgfN+PuaOjnuL3WjVORJ39r1s4hYRvZiOkp
	qnkvtbXDCz4f1WrBOFO6krOjzGdePVrZ247+QhQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ZXWEkKeJdh1g0a7u+5HlyZjsgTRX6E9GTJggahCRKnM=:pTUMBPAcCIUFfg4AE6JmvRzFaLSISGg0Xsh/RgsU0Uc=;
X-ME-Sender: <xms:nvEIa6pYrbvvLk7qiRwlKoM_QXr9HC_W356iDpmQCxxt2V_qVfbxvQ>
    <xme:nvEIazdQvqrrPoX_Bk7gKTmqhw6fFloG4RY7EiccXkS0Ku9SaUwLOZbuc7cSeqdBL
    dFUTB565K0ENfTz18lokbqbnYe1oVtthqbLLZzXF52vvr3d9ICSKDPnbA>
X-ME-Proxy-Cause: dmFkZTF3ci2Xu0iYGEkhl9SOwkHBtpLcknovLCshrXxQvWYStaDwd8yJpYSRQyT1FO1FNA
    RLauedTXfinlfZ/RKGWlaSO+heCi1L82xuTZ0SOGqThfEmJfVDr/5apdlRE4Upsif9bW0t
    3VgjiALH2DpXJccvRl5nirTnbeucHyGwvVkG0rV0Z5YJH/nfU0nQmAnfpVcpMO09Bz9jjf
    Q6t6YqeqT3Rt1v1COBCEZo84nhWiNnKOv/D2JnjfuFJOCmJBZIT2XmJW4EkEoQW8IEpfYc
    USqPbe5tLfpLjkgtKMalHeTdpQMFNImZGwDipO9OXKiiybCo05XbIaa2P+JwrQl5PvVMHE
    rBOGOnilp7c1udnYt6anOEDpaH7+RIuahjy96JZLje4Vp81eRHDqPYgvtEoAO8sAQQDUkP
    EwZZznJjKOts3PA6ZZa2e0F2EdRg+baW1q5meZiyG6hP/DgHghiM1kOGIURxDtd8xUrug7
    SQQctQ+5HTF66T4OLYGhnYK1jrYKpW4bsweOxgNfXmTy4GcBhxeI8pcO7zayl0F5ARLkTd
    yhr8nDizhCwNr1dTbHlY9w6FugQz0Ljk57CutXY2vSl7/lCmpN+HofT52/m0CZzgeWmCyy
    2mLFtRr5na3JvgpzIVQk4BfB6zCoaV6ddiSufBFSz5EM2AGw2ikc6VIYNHFA
X-ME-Proxy: <xmx:nvEIaxWDDIyrvF7Wu5GibA1JYRXys3mE1X-1H5ybC3FxrHklPGVYdA>
    <xmx:nvEIa3kld8Uz_yIyc-2RevKUGZEpepgbLrfJlpr2wLnbXObsBQNr6A>
    <xmx:nvEIa4MTsiygTiZOZPJcmBTMottuFaAlKn432ymBWxxHimooMq2K-Q>
    <xmx:nvEIa3IRkF7T28ydZfJxQdFcTsHXaR_KBR_2H3KwOj94LM3g40Z-nQ>
    <xmx:n_EIawOxavKNFI2LjZ41HjYvnr6FzKqwRKChlOpwv-hO94PqKRhaqfGT>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 95D9E2C00085; Thu, 26 Nov 2026 21:57:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A49xMeGXfQ8V
Date: Thu, 26 Nov 2026 21:57:14 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <96ca0f67-1f62-41a3-a83a-1d70abf2e058@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-4-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-4-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 4/8] platform/x86: thinkpad_acpi: update polling state in
 hotkey_user_mask_set()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> hotkey_user_mask_set() is called from both hotkey_mask_store() (sysfs)
> and hotkey_write() (/proc/acpi/ibm/hotkey), but only hotkey_mask_store()
> called hotkey_poll_setup(true) afterwards. As a result, updating the
> hotkey mask through /proc/acpi/ibm/hotkey did not start or stop the
> NVRAM polling thread to match the new mask.
>
> Move the hotkey_poll_setup(true) call into hotkey_user_mask_set(),
> matching tpacpi_hotkey_driver_mask_set(), and drop the redundant #ifdef
> guard from hotkey_mask_store().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index e5f78107bd1a..7a82a9014a3e 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -2137,6 +2137,8 @@ static int hotkey_user_mask_set(const u32 mask)
>  	/* Enable the available bits in hotkey_user_mask */
>  	hotkey_user_mask = mask & (hotkey_acpi_mask | hotkey_source_mask);
> 
> +	hotkey_poll_setup(true);
> +
>  	return rc;
>  }
> 
> @@ -2647,10 +2649,6 @@ static ssize_t hotkey_mask_store(struct device *dev,
> 
>  	res = hotkey_user_mask_set(t);
> 
> -#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> -	hotkey_poll_setup(true);
> -#endif
> -
>  	tpacpi_disclose_usertask("hotkey_mask", "set to 0x%08lx\n", t);
> 
>  	return (res) ? res : count;
>
> -- 
> 2.56.1.839.g22a8290db9-goog

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
