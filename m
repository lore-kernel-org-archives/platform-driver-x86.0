Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794008927;
	b=UaOqKv5P+5ZWuFBzaVbYwxkMkWGU2m+jJ1GvuV7CXr51suDm33gkRm1hfwFg3QBoX8mS
	 3OIoX5mGYQU2bsy96uRVXbCPxwUzvjv61ok7Je1MhXT1LXAzKgZXiyJJPi/UXv6ZE9MXN
	 qFrPCICxm6xWSzqSbJN5eEW7JKHR8RASiXOhfEpB+BQusYmzESN9z7nC0cL4qXjeXZss0
	 Z7ix07/fyL5yGt1GaetBh1ax5oQfdYx8yTAvFfTOjLPg1seA86EI21IWCLeF3vzcLuLd+
	 +ItySArjPswnTAaEy/to4eD6E/tQrWlmMdzEIOGHUxX1eg9KIaabv4aQEf4llDad9fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794008927;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=57GdjE1sWmdS5XUKdqpRCXUBRlNc+x3hmSqLtCG4DW0=;
	b=qQTUWh67nTo/0wljdSqMsaWAz156NhYEZQZwHJREuxXUDdIn++BoUMmq1qHiRbQSPv6u
	 rYmlls4QVlB4KLpQKsH//LNXPa52dMzbETqckmvnBr1N6MtW/mnvwtsXsdDPyNPu7VHMR
	 uyyejQnE0gcWESi2Sa55WbUdb65BkW1EPeDWWRthruOI3MWsGJfh+iz97C7UtqcMK4/BR
	 aq5jpSKW5Dr93F+RIbUdksw3YqwEQdPOspzZQKA/16uvp2IfU+LOX2urVJCxf09P5OwtW
	 HN7PSxvI1WlKBBwTaT9Hq9yPTvUF1YXE/s0KPLD270tXRkXfz0XaLa6LuxeBuafz8VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=joshtriplett.org;
	spf=pass smtp.mailfrom=joshtriplett.org;
	dkim=temperror header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=DRGWPPyK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WtjJU9i+;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688F4606A32C
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 23:48:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688F4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=DRGWPPyK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WtjJU9i+
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 62CED1400106
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 18:48:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 06 Nov 2026 18:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794008917;
	 x=1794095317; bh=57GdjE1sWmdS5XUKdqpRCXUBRlNc+x3hmSqLtCG4DW0=; b=
	DRGWPPyKkD96L99+q+dRGrWA3VsFkZAzkv6ajoQ82aec2l9/gcK6LIiP8xPrSOyz
	5lLO+xi9/V79TjVtOjPV3Ynkg06gOOlaFNSSgYUq77eyGsuwocITvdOu65DWmYhx
	dphGNNySem8G/SiQoTIb1BLBtyvNfu8gPOd9puB2SXXrU0LbFcZGuN9RPAsDdVHX
	0QBbVRxuzI41FGKiz/MpkGTqmsZnJ9kjUOMCLv+6GIY1I5ed03TRA3iqhTZRZG9K
	kjlpLd6GKzwRjOlbYgEQ5opnDXeFPE1ccM2pxtbw8tLEstBnGUMOTuPj37RX0Q+o
	34feKh2OkOMGhATNzoDZgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794008917; x=1794095317; bh=57GdjE1sWmdS5XUKdqpRCXUBRlNc+x3hmSq
	LtCG4DW0=; b=WtjJU9i+pQNpmPVaYaRF9pgK1ImJEgaQDosULo874qULfDAzVhO
	DiE4qWWe7ozs8m0KqQiBSQkr07A/qkXPFOYBbyDCHsOA3LSTFgPjjP7LSIfnGlZp
	eHPO0IF79rGsnHqJ2m4em/enAbmVWad0Jb7YJFBafW0g4eob6d2gusHCX+zeixgg
	SMXJ+vv6wSHmez74rEeUelRnxoMQKLkDbftLkTrpR1LCJjrzaEg/H70QP9hMxmix
	wzpODc/Dkg8oKZ7MIuezyhjHKLaW2PToQvD+1ot6Y5D8ibD33HEaNB7zYIh9ZDEv
	mCuRp5gMDLMclWAkzKyt92xPFnBeZLr/fMw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=joshtriplett.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794008917; d=joshtriplett.org;
	mf=PGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:jxQiFvQLUXFze6PmzFrHp9ZMPIKkKVT3NkfOPEPsme6Qs8m
	oL9gmcu5vCm0/gKg3SSlnJ5j9vWZMiMLwUpZT5aYhcSfAhm/Tbs3a5v/HunwGhpg
	rKp4P7OvWAZyI5nxu5ttkw+n1F2TKuCH9PM5IpkvP0YPNqO+nqF8lgCWFawaSDDR
	XPvxJFRui4P/l0+XSdXC2n+Eo6sIjifAKZmvYocHL+9Iu1p1fIbS2W2MlGB401PA
	cBT3GyixhVJRaLkJkkOobo4d9/BWA/htpf2cafLldAtvHsMFotTZt7La8hiKPU/G
	OO/g9mQ1JUSlagfx6irhvbrSG6Eqdgz67s2JRLA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uJXNEZFDnbwAQ6uAEh4SMw9q/pKumnEtFL4vzKSs/CM=:cm6FVvmGjfcxZ2IIkMhxrEnR4xzeYJbQsFRWqLQXkt8=;
X-ME-Sender: <xms:VGfuaiPsY2cmKrv5m5j14e4aLbgzxYQKVgTv1Zy_2OyPA99_a0IpZA>
    <xme:VGfuauXUFDIhE9xomBuvLUK_zZrg82rdR2ftKjsdAKTUQ-Hcop-9K-dErhbTozAfG
    W-taP9zxvqonwzXia7yTBuqmOm8kaLJqm80U7NpY8U4DlVD4amgoro2>
X-ME-Received: <xmr:VGfuagnbQryho9FFpX5es3gALBZe6PnC6GKQk7Pwcls9Lquv8UyvYYrdCA>
X-ME-Proxy-Cause: dmFkZTFHlVVsjABEzIlgs1ULK40XhHUuZaSD9S9CwY3WG++hsa40+Q3WlS7abEMa4VYnV3
    gMGGE0d74P/V6pUxs6Q8Vs7K/Nd6zC5CWF8BYHED5ghUIKbCTDOGZNRj7dx91LeB4XBlnE
    tbxrhk1zzYzbXCixe8rg6fZD7Hl2kc/4i7LLBEluWujB9P62weDuistNcrxKR5XH/EeUeh
    hYmQ5uGkQZLg84LINn1ecnMB25cHHqlLuroHbAzn/XJJWbBL9TS92FAOnZ1/xu4VCS83qJ
    o2iFMYDlAE9zHdwBNvEPP9ku4sU1Yyyx6j8xC7oHqmvMOQmdniIrf+a+8nZxfYpPk7Agal
    oFIH7rgE2phplO8R12LUG815U3jebXZ7BZ7adgG1jX/sxccEQmYW2rNHmfwbLQRisAd+xD
    KSFkCadsMsKjdJS9mcdQpoqYU5wnv8VpnAN2Lcs0o+zZwBVuCYE13lBKinCc3VaLMp4pVH
    4jiYDHDUokj0a9eByU3qN6fj7ogEfb3jYfycUcRed13JDeCAcoLgYXiWIyGEJhrgmIPzcI
    jDFkKPD/WrEQuQlmh8jRdOqhLBJuO5508oZz0p/RWhORr2tlvE4bM20Nm4VlZ6UX5HKKck
    LJZ1C/iYY68LJNThILmP6+tf0XpBbvkpTmqd7uyNNxSrfI3atFuv5nCSjnkQ
X-ME-Proxy: <xmx:VGfuatPBTYcrtFaSyWGvBwflGnWu71d_7idbj5_Pf7v0fCikm5zu2A>
    <xmx:VGfuaoIpNePMDafQQPVvq9rC3vxzv4ZCUpR1AGEFfn3APtVLNLhp3g>
    <xmx:VGfuan06QArK06f4C3lJloyxcgcd4Fp3ofNdbXnlH6qA9KxXhPAJlw>
    <xmx:VGfuakW7mcVJhO-0hjrnW4tQlInj2Ab9NZVd1xACGwB4whZqU95iMg>
    <xmx:VWfuatm3t31xsE6DMCzMyIN6c9anbY2acOEa59oV18eogdxW6_45pEog>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Nov 2026 18:48:35 -0500 (EST)
Date: Fri, 6 Nov 2026 15:48:34 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
Message-ID: <au5nUp4extfupCpS@localhost>
References: <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>

On Sat, Nov 07, 2026 at 04:48:44AM +0800, Rong Zhang wrote:
> The term "unsafe LED" exists because LEDs are write-only for software and
> fire-and-forget for the EC. By taking the control of an unsafe LED, e.g.,
> attaching an LED trigger, any warning signal from the EC can no longer be
> displayed by the LED.
> 
> When it comes to battery LEDs, they are definitely unsafe to override.
> After all, batteries are dangerous things when they malfuction. Thus, I
> don't think it's suitable to enable it for all users.

Choosing to not report "charging" vs "full" vs "not charging" via LEDs
(as opposed to on-screen indicators) is not in itself dangerous. If the
EC has something like "battery is damaged/overheating/exploding" to
report, it had better do that by some more effective means than blinking
an LED, or the message is going to be lost.

I can't comment on what *every* ThinkPad EC would do, but at least on
this X1 Carbon Gen 11, based on some (LLM-assisted, but all of this mail
is 100% human-written) disassembly of both the ACPI tables and the EC
firmware (EC version 1.22 specifically), the EC does not appear to
report any battery states via the battery LEDs other than:
- AC not present (LEDs off)
- AC present and battery <90% (LEDs yellow)
- AC present and battery >90% (LEDs white).

Critical battery diagnostics can get reported through ACPI, and if the
firmware reports one of those, it appears to lead to tpacpi reporting
"THERMAL EMERGENCY" and sending a userspace netlink message. (As an
aside, AFAICT a system running upower and GNOME doesn't display that,
unlike low-battery warnings. It really should, in a hard-to-ignore way.)

Some other models (e.g. the X1 Carbon Gen 12) can emit other kinds of
diagnostics via LED blink codes (
https://download.lenovo.com/manual/x1_carbon_g12/user_guide/en/help_troubleshoot_or_diagnose_problems.html#t3
). But those primarily appear to represent pre-boot failure states where you
won't get to an OS, anyway.

> Since not providing them via the LED core does not really prevents users
> to control them, I am also thinking about adding a debugfs attribute that
> unlocks unsafe LEDs and taints the kernel.

I'd really love to not have a tainted kernel just because I'd like to
not have a bright LED in my hotel room when I'm trying to sleep.

- Josh
