Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794054866;
	b=C0wjFHlqzdzSsvhKPE+xFXgczHKnGsJxRadoC0zjf8/SMZVfDUcHwdRFziF8A9SQ8iEB
	 +zTME1cv8D47M7nf/yzEgsEt6ZwbRWjARvRrr1oCM3UYUVu0L1GCWA4Le7YgRXbFMkQH+
	 xtLLtChbXytiXfXfdpB5UkBr6Yku4BT1Ulr6iTDZZ02m7+t3+pEDhTCgYX4/XRiE8bt0U
	 8fMvud8W9W9tWIrReW6J6q5NfqpTWgKdXVC7+KBVL1aGUaHnKXGypOltYSoDo4fwWtN/M
	 rplJNfVa/pdYJ+H2i2wXcSOg4vDNw6mSC/QJwb4XBHn44kV8/hNBN/1dc+sZzrMHtCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054866;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=9W0gqXHySUVAdfm5cgv/j9VwTU1fsDH68oG9t0v3Rrw=;
	b=GWhVk8kvwq/+57i/Qs9sc+GwHNorNUcb+9/xEGkvKPcNChg3mwfqyw0v/gZZptbc2v/F
	 fM2EQSKEPqhnO0zAs8eferohCYW0mMjMINmHTSh28FTifZI+NugewRbgINuola2MuSO8+
	 3JLfqum4MHT5KekRJY/EcOsdffR+t9ySn1/5tsk4W8djaf6gXVtkkPbCXq7IhuXwLYj+1
	 bLPpIpfRJJskxVosU2xF+ggu3OjWiCV/efHsH5j2i0BbZwQzkJy1vYfTqS8TYwjzwW10t
	 C7/0RN3ROcu6hxuYL365U23PnpqVPU2PID+a5EVVIoDRzaPL2wMwiiwoeCGn83XHkMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hmh.eng.br;
	spf=pass smtp.mailfrom=hmh.eng.br;
	dkim=pass header.d=hmh.eng.br header.i=@hmh.eng.br header.a=rsa-sha256 header.s=fm1 header.b=KcEnS467;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LniY3leB;
	arc=none smtp.remote-ip=103.168.172.148
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A109606A32C
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 12:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A109606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hmh.eng.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hmh.eng.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hmh.eng.br header.i=@hmh.eng.br header.a=rsa-sha256 header.s=fm1 header.b=KcEnS467;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LniY3leB
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 765DAEC01CF
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 07:34:24 -0500 (EST)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-03.internal (MEProxy); Sat, 07 Nov 2026 07:34:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794054864;
	 x=1794141264; bh=9W0gqXHySUVAdfm5cgv/j9VwTU1fsDH68oG9t0v3Rrw=; b=
	KcEnS467ndIClp5C6PbG/a6K6E/5pLkya/ZZ0bpm6nb6xUHJbJzV/fqW+abxrnSB
	YRq5tQJb3Lop+7BEw7aiGyNYes3vmPIBxY9QNw8aWzNx+a6kk8Ao6Ly/9U+smyIV
	dc51GKjYz2Nd21XJNEw71peaGVaLNuSW77iYSA3BzcGw6toZ2CzCv9vkZ+vA30FA
	u9eAANWPD4sB56BD/UByqS5thHy7+cHj5xZrKxZOfu4BHpW033MmbBe3MnKkdDjs
	Aw4Z94I8znq0GT1y/TAIDSvjOVWzHXAT8ms0wG95tsRPWvqH0xRltEOQRhTn3+3v
	c4ekqrIjRCuBpK4qX7sXoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794054864; x=
	1794141264; bh=9W0gqXHySUVAdfm5cgv/j9VwTU1fsDH68oG9t0v3Rrw=; b=L
	niY3leBDGVSIScktI7pKt4gjtTMRMddDx2am7Hj3qDvfNt1iPc/Lgs2Yfzu/O7Nx
	/c09yo5AJWxQoMqN6YDEJfBeXMDGmyTjJILlTAEWDh1xcujlnfqlDInPkQrI2p+y
	n/Yzu27zky44xqX3IlVDzNlrmKitIiiOKWJSpqj+uqsS+S8g1bhgDb0F/oABdu/8
	QYipJCm0QsH/KCtAKIDMPkLe9u0NZgVpgQZ8XBFqxMiwTzofSZ75NVo7zFDSpnnG
	VI1f+jqB5F0m9fDJ92gSi1p+92PD/2GQlzAwCPdJBGjAXOYPMcNBiRb7WH9FQr+h
	rQasJlwxXyC4EYnkf5fLA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=hmh.eng.br a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794054864; d=hmh.eng.br;
	mf=PGhtaEBobWguZW5nLmJyPg==;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:mxc2pX/mgqcZmtmn03sE5Iz4zUJxo+SIgSiMWoYTATLVy8x
	QAO0B1CHCtPUVDQpsYaKzTsc4U/nX2TQhI7U3PiqeZ9lovgglMnTfX9bQ0ySZf5D
	9CYzNSd1In2N+nhzde6nTq9BwpmP3VmqryMqlGvSqJXp5r2d/stygNgqXlNLbRwB
	U0QFSYLkr3YBYSCemH/bd4MVENpa6nVeBV8DGpelZULHuJ902O6+NWP17zBXnbSJ
	n2QjwkFoSRdYZIIrxQ58jxnp+jdajgRkaBvMHgAI3a7nJuHQUh1WaQnYKEgeQ/nO
	RRoYc+cSfAnM9bNQuqx7yhc9geRJisOhj2hOyaw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:op/+dAocpZMiuBJeSEBQkYVcxAYa42blk0YlxQy9vM4=:6zjITNMaD/z2lGUZax68niVBqihsiRxpOtcZqfJiCuY=;
X-ME-Sender: <xms:zxrvalE0UMu8WQlPjSJllvDNbGhsSRhnwP76DHFIMvMVO0_z3XHXfw>
    <xme:zxrvalLgYfQQCl-jfMkahEYCX5i3CVXNEny7fgvPZ9chsjgee2huDDWrwfSqlfn8v
    OjX4a0YmTx6-BLjE71zhVs4nWdxODqnzly4ZuLwnMcUAefWlPI>
X-ME-Proxy-Cause: dmFkZTGvO4ynNH4DhsGblKpSxWFZ/omv9JAQSsnOL681JtoOZ0QN/UGJbVyR36yNilLqIz
    GZAG2UXgMqULQPNxKC8OMOy3m2LnLVf6MNpt3DM93/pSn3iU0LMRardGYDKKtN3XYSp6z9
    EwGSMFbstxVN59e+Bqe5CDkWBJ36Hfev4eb/mvIoM2wR5Z+L3g+NI2CsOZxLB5Fth7keYT
    t96vZYFD2tYKJylTwE7+nh2vMAl2RT3QGoayzCAWqTM25Cn0h+2OMO5mOarwqC4AVGBKkR
    nvtxfT09aUGpxounNJvgzGAHusHgaGcG2l6SWkNx0JW9qRAs1C+tQaOXvwIhhwKxi0HMAK
    VDiQvCpToWCiQ1eXxAdLK/kcex6EQq3dDkkxXF/OJqalxDBxPp3dZu+PdKDH7FnCUySul6
    WMPJPKmartknX2m49VobJ7CjGXNkKP2jpbpGocm29ZmVQXK0nPfOTRAWMX3MZbjSpiT+vj
    8mmn6Eb3phsGKUrzdPjbJ0VKY3HBp68mojuzlsabTs7mv3C+CR3r9jgeMMYXat/fRXWpBk
    xLn2iYRyzuef5LjjtUWzeCRYwqz21CFYkqkZjjYS5isnkZHGsmIMP+CvxoZzUNMmSIpU8S
    NiLEspcnL5rm98qdAYuPCq/gqQ7cAlJGsNM6QZNjXMVZ/+/jCEaWhUIhu27g
X-ME-Proxy: <xmx:zxrvagmRCeIHSBow1YWURzHluADVVNg2OkOztyu14E-CWHSFcV-f0g>
    <xmx:zxrvai7YIYmOcEX0ciMdVLwZ06ZYGGP9-HBKjO4B2Xuz_YOSqC_-EQ>
    <xmx:zxrvapQ3KFaPsvtPqSSSlEQ_-ztDSDLYh4HK6XFB5nCgIEpE3TSvxA>
    <xmx:zxrvaowZgT7__y9Go_-1rzfcmAy2DFI-V1O7Uzn90DcTfvvCuUQEuQ>
    <xmx:0BrvajrY6kkPv2sGdD_gbXnAaAL93I4nW7ZYbOIMxilrHPGZrCS8I0c->
Feedback-ID: ib67041be:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44F86182007E; Sat,  7 Nov 2026 07:34:23 -0500 (EST)
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
X-ThreadId: AJ6AS3VwzXO7
Date: Sat, 07 Nov 2026 09:34:03 -0300
From: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
To: "Rong Zhang" <i@rong.moe>, "Josh Triplett" <josh@joshtriplett.org>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "Thinkpad-acpi devel ML" <ibm-acpi-devel@lists.sourceforge.net>,
 lkml <linux-kernel@vger.kernel.org>
Message-Id: <c70af6c5-3d95-44c5-8f3f-b014178234c9@app.fastmail.com>
In-Reply-To: <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
References: 
 <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
 <au5nUp4extfupCpS@localhost>
 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Eh, I better voice something about this...

1. The EC does use the battery led for alarms, and it also has specific high urgency events when it thinks the thing will catch fire or going to forcefully cut power very soon, although this was a relatively later enhancement.

Thinkpad ACPI is supposed to log a critical warning and it should attempt to initiate a system shutdown (power off) if it ever receives battery emergency alerts.  I was explicitly advised to do it this way by Lenovo bios engineering, in private, a long time ago.

2. Module parameters are the way I dealt with this kind of thing in the past, especially if they are not mutable at runtime.  It is vastly better than debugfs for this kind of thing IMHO and the fan control was implemented that way.

But the default must be the safer behavior.

> OTOH, CONFIG_THINKPAD_ACPI_UNSAFE_LEDS should taint the kernel on the
> very beginning.

I don't think tainting makes sense as long as it is something you either have to compile for and a distro would never do so as a default, or something you need to load the module with an explicit parameter set.  It will not cause system instability, unlike, say, poking around the EC registers directly.

A module parameter is a decent compromise IMO: 
Debugfs is too reachable for userspace to mess with without actually doing an informed opt-in.  People respect module parameters a lot more.

-- 
  Henrique Holschuh
