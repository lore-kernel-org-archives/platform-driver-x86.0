Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795748745;
	b=ZpS2NUOZgv3k3VA6UmtYUe2NY5uPj+CRofTQA0fIts70VhQA5WXVEkYBAkKEVVFTChjn
	 GuZh5lSDGsGITQMWTfMxKw6sllJ4Amj0CyN2u3wgZ8L8DSedzP/Q0tw8C/OTfcVzUxTYP
	 MnOY7mfp4/WvNp6ANlYIsiqy1FEviTt2DThvc9rS8tLzijPuoWxpfvWlCcvoahMOL7ue/
	 PsxG39h70fQsSA7U3RlkQIqA0LRslV0/6PavRsAJcoZmclfaoY61hEBg8bQkxdo9l6NIo
	 Zny/bPO3J98oQ6SWsunQTdH5W6k2GIGZuxujlAV5/5jUagGTA3SM50kOhvo72g1WwCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748745;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=0iyRO/RdJsLPm+V8gWlwRu8Z0TdmRrgl6OxGF0qoYQc=;
	b=CSmgOI4SiHzxXXSwvCtmmleF0KEzqFthvmkTQMvG8uk3QIwXWToRQZ8gigPmPMMOX56J
	 PiDu/EncFhwcy78zKx2FWwgq2dHiK4lsWHq2bqU1p0T0nHBv0vjQvsApUP3THJxRlf+2E
	 ru91YKG0rUZEEbONBo0+HYk4fy7pCO9t39gzDXumXrGaMd4j/CG4ipZVDIng2qGU52BKj
	 P3w3claYTb9tr9SKUdyiSOhUCyLV2q9oJslkGvttVizXToSGyOrirSohwp604LBRSpNLl
	 YhXX6FY2bl0j8Hu9oUyeFQAlK3J5J0EIEEFd599fDiYos9tZcmClYiP7Oy2TtmxVenQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=d9GZBZUw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pcd+zkR9;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B81606A31E
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 03:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59B81606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=d9GZBZUw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pcd+zkR9
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id B1EF41D00558
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 22:05:44 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Thu, 26 Nov 2026 22:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795748744;
	 x=1795835144; bh=0iyRO/RdJsLPm+V8gWlwRu8Z0TdmRrgl6OxGF0qoYQc=; b=
	d9GZBZUwvMnfzrS2O7rU/LQoDbWXR9iaxZc7xghL/elbGWBhlOaFTEehVPnbEQFf
	Skfo/bvbquFMkbZCa3COzE/g22tjgOXFgys49DgEZOtY8qLvR3kJT8d2pih0F9FL
	LCwz1srvsvyHO532VOCiGplVqHqq0IxRWXbmIjQHOJrDW7tkhP4oYSEcZroNzprI
	4ZobE47jSdb0/GmOATzA7JYT1LjfuBpuRAZ1oMGUswLrLz3kppUP1oD7yiM7dneE
	J2PoeDvxF8uh5JzUN11plA0DYmO9rh/xZlLH0hmlH4A3yNtDXf4IuCJ86kwHf5l8
	tbvDgL1szv3UZS2zL/D7oA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795748744; x=
	1795835144; bh=0iyRO/RdJsLPm+V8gWlwRu8Z0TdmRrgl6OxGF0qoYQc=; b=p
	cd+zkR9B5oyzg8pV4cGL3OSnxcf+mSiTIjTNDdlrm4EkFP5GUaB+ru/L1VivrB+r
	F1sy8jUZyK4KBynhustdr3mKrQ5v+3XCHYKE+QMpDB5KCVUVjUl/p++G+rDSRMnN
	gdVsEZYuc0gayRvkPDmCbJzQTIddw9oqKA6PLo4op8YBAZg+mhp/d/GUYh9+mFxq
	/esAKzerg7klqd40+zgVl3TB4bRJ+VOV9z0bMO5YvmtkySRb7d/Re6DFt3AE1WmU
	gvj5J6g7+paYzUHOpCDAhOtrWQ8WXEeUB/9qt7kAUKhl49zaHoIcbPVniZcY0nai
	7bij8tIWcbTXbHrKylkpA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795748744; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:KbrIypLxynh8n0/p6d9GvONEi/V2NeDkLcgIF4fSt8WjhNz
	aQkiRazuCT3KvX+R2zFsUSshshyBYlO7Jk9wy1o6xqVp+wqjKwVbbQK1SsgmjA1G
	e2jKl7akJGT3jMB2Sqf9E86n3kCcjbVGmcIernkB9ngKW73rR/G6OVL7nPtcoGxY
	9wbFg7+MzNOG32DnznIspkr9p3unfVHzTKPU8C+NrtQ3VltGcqejqO+Wo0WSEDsa
	1Ddw7TSw8vYDzhhHqNnQ6Y9UZQT34B4XPThO9bNGhFgpMtPdK5dZZTRFmmInbb7v
	EsNfT0k/G9qsk3lLLCJlHN1jTd9Js5QX59qXC8A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:gICJ4STrfMPmOlS2OcTl7LgtYk+KZMEpdr23OjGQv+w=:oeQeiQPaV+aNKLmSAN6E1Q8PFUVom0vicpXat5mya3c=;
X-ME-Sender: <xms:h_MIa1vexfdYLmmgOG2-fnR248QKROnqPeXCwLSQp3Oub3IhQg0mog>
    <xme:h_MIa5RCeAbzCpVGfBRix60ikcTUbcAFleMgP9E2ReI96Ql7eklXu0clyEUB0nq40
    a24WwNAxEP_4-SsxNLFZmIy45WoL-dwVOpdVB_paNi5y8rrQTtiJzEN>
X-ME-Proxy-Cause: dmFkZTGqbt+JqTAICgd4CPFKfXccBfgF1GfBzlJZzfchP6ZgjEcby5/Vz9cZG8yK7Zx14T
    Hx4czaFnOX+/Ks54NJDgL6Z7z7CPeTNKs4pfApD//yg0EBYh6SSdKE506OsJDVtp80mVFy
    dF8yOkrok28XZt6M1itVzEh2n+xjPPIql71BuNA+AjqawpJFuLItYcIV+b/iz41KkybQKl
    VBtccsg98c8Sy2iyN+ysNoJyO5eL6CsKC6l1fnsZbBHXtoqMW1DM1nfBCbjoC43ZgPOOPT
    E3dgLdrvux8GyOm4Cc7Di+YJyxtsWJI4yqh2wof+gm2rLaYVdCMA5lEvajXWR2B26V3GfB
    5IDZGhptEENRSWZ58/IWETBXmAtiKqX210iDgluORNKOouqXW6RTeuQxFg0ZBuDc2K/vQ1
    d7ON8nsZrMb9X2oW52muuEE47GaLS0HH0ypyf73UB6F0iPaFP0wgCp9sQ9vA0cQe1TOblm
    mMTpuPj3jFuMfCoMlW0yBAS3akcDc+PqhqzPniqBgWvXYLwb66moRWyZMeJv9WRNClXSaP
    sCanxH+U5eU+Jlt8iu2F3ByVZozZQfeWM4N8UaaVCK2G5gc8r/RTzr/Qa2PYTwfhErihcL
    Tngd6ygJKOWArvxJly5MNk4Pj4DjC3IGIoBAJwPFb+ImdX1ffC8UCFXj7dxQ
X-ME-Proxy: <xmx:iPMIa64DmISjzfbfc7CikY42bLh1rGWU1Rl7efHZnPDczqCLoIkT0w>
    <xmx:iPMIa55ccikAwAF8HtEuYzz9FHCJZNEIMZCNtChEYDChPQw8ZXpJZQ>
    <xmx:iPMIa0TMT17BlL3IhL-ker23kZ1Sx0HgGEtfvz76Uvkv0B6uKLUJkg>
    <xmx:iPMIa58hoeJO1SvTptS2Lh4FWShVIkzDRLbAyYNX5qCb83m4rG2o0w>
    <xmx:iPMIayykW4OuqJ51veQnXLHrHLvpU1zvgNlglJ6Z302KY6yb9HeXxTlD>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id C05BC2C00085; Thu, 26 Nov 2026 22:05:43 -0500 (EST)
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
X-ThreadId: AkaS3-A5g5Bw
Date: Thu, 26 Nov 2026 22:05:23 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <29491d1e-992d-4a2a-bde4-74f3b7da2695@app.fastmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-8-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
 <20261125-thinkpad-acpi-hotkey-poll-v1-8-6dee57519c2e@gmail.com>
Subject: Re: [PATCH 8/8] platform/x86: thinkpad_acpi: drop redundant input device
 parent assignment
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Nov 25, 2026, at 6:11 PM, Dmitry Torokhov wrote:
> Drop the manual tpacpi_inputdev->dev.parent assignment in
> tpacpi_pdriver_probe(), as devm_input_allocate_device(&pdev->dev)
> already sets the parent device.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 898d919d697a..e809ed417e0c 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -12245,7 +12245,6 @@ static int __init tpacpi_pdriver_probe(struct 
> platform_device *pdev)
>  	tpacpi_inputdev->id.vendor = thinkpad_id.vendor;
>  	tpacpi_inputdev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
>  	tpacpi_inputdev->id.version = TPACPI_HKEY_INPUT_VERSION;
> -	tpacpi_inputdev->dev.parent = &tpacpi_pdev->dev;
> 
>  	/* Init subdriver dependencies */
>  	tpacpi_detect_brightness_capabilities();
>
> -- 
> 2.56.1.839.g22a8290db9-goog

Looks good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
