Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794087780;
	b=m+wrB7+kJBv22e3JoJ/jVdrTTFe2fIk4grP01gAjNoML1SxzmPoCnt20J5+x4KP1E/Ut
	 5MP7oYjt82YqF7VVPRAjFYrBZbbdDGwVPBbnfwAP22/F7DkptvZnappH5Ak6LsJR56xEQ
	 ZtZBj3k9gYcIwfwoGHT6gomf8c3LX3oTSMwE201mSgOELuY6/L/IWXZQiM+1JvBongEbd
	 VAnFe4LG6QMB6EcCn/VwKrxGN4DU2M4RGC9dT6p6iJD4eQiwHhsq43t+rA+0ZrSfUKhXt
	 iGcpctVhbiQJTead5Kl5mpVtYVZyYf1wq/mKZLX9sH00o2ncyIv5YJRJd8sVOXIGy6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794087780;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=HqKs1SSZSd3+2hMpiQXFT+x5XP6mxJr0A3zNLl/PAts=;
	b=tfu4QY2XNW/G2yXqJyZa+SFNBaam+zwjsYry2WiWFw2C394fkmCVOo3n+kez9SDglpjO
	 h4JVwjDF7qzYxPJXvPTiT8uv1hS9YLo022Y3Fq5GCjiuwwKfzzzIfSJpsXPFIZ/76rkvn
	 SHHRRzu1uh1Y+EbWCNA5W8lNefpC3DGb53Mc7kGmu/RGQlzjsVur+mv4fbe0Dx9QjBte4
	 5xICkD0WAhkelRKNp6F8cf33LXadl/xwkJyYosBOYoHo5PXDNggCvs8zkwDgptE6xgRNs
	 ZMMcB6OC834uZNPDdXwc6oHF3r/ELp7I2cYqBjWg/xK0TG9B7lpqPHBidvSsouCXpjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=joshtriplett.org;
	spf=pass smtp.mailfrom=joshtriplett.org;
	dkim=pass header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=jDrjkT4u;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hJKDbvan;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2142F606A32D
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 21:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2142F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=jDrjkT4u;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hJKDbvan
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 6FEA01D00112
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 16:42:59 -0500 (EST)
Received: from phl-imap-03 ([10.202.2.93])
  by phl-compute-07.internal (MEProxy); Sat, 07 Nov 2026 16:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1794087778; x=1794174178; bh=HqKs1SSZSd3+2hMpiQXFT
	+x5XP6mxJr0A3zNLl/PAts=; b=jDrjkT4utQWYKntWt2KgIohwwxlcqR3BjhBs/
	UKjlruSi9PeBRLJPYgcHjDNAe2a45JUCeUyWEexCexEyIjQ2puBAnToxYOFBDuo1
	Dua9NLS3V44iMmak/zBzQX8g4LKREHttoVmxdqkKeXL1y1wH3EG7KRYoTg82peUg
	kSRp6uSLV55mMaQmb7aM45Y4VzpwWncg6yrLpbQLQxzB2nclDQKOroXfD+TqddyK
	VweZ/Qmud3po0FBfo1q1bck+TWxZkgpOx+JaHB0uxLUTi4Ax/ZW95aXWmpWi2EwI
	+36t5ezBMi2kAxNcidCg6GICA5Lv3Rjh47oEtc32QElwV55LQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794087778; x=
	1794174178; bh=HqKs1SSZSd3+2hMpiQXFT+x5XP6mxJr0A3zNLl/PAts=; b=h
	JKDbvanWffKYGtyaQojSwTrV2z2XYA2Bh8VfF003/NN7ZToLPkIm7m+2KyP+dUlF
	k3Jey/WhwjTbwfhnru5atq1tFrYqC9eD5CRJMXs2AcrZXWktrJx11AjqLj473biD
	vZADWk8VIxcml/9D4NrtpKnkeaLb0OqBkkuGYOGa7YF/w7LM5KmuZfOtuBMcixAJ
	qOA7t95UYtMqPq6cNmiKkVn1DXhdeaj0C5SJZsPZ6ZPl5WZvAh+fXDOXRa0qCp8M
	Pc39Ace9+L2MLOm6tCGvSkzH9Z31zgUPw4wfB+nf2RKkb0yFmQ5KHF3DgB01Jp5i
	XDmWABTbEGKorDEOJCq+A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=joshtriplett.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794087778; d=joshtriplett.org;
	mf=PGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:XWwtC7+GgidgHQG/8NIh+14ZYmsheucXXqKnxPBTUPwSEzf
	QFec4ldY6mFFFBNPCbmSaSzBmdsRanjKh8W52ODKUsgoATQOqVtF7BmNC2KpHIZR
	Vn+3wCOvdVH3NKDI6NKv7MJ5R+KsSR3kugonIBAb+0QTYPbbFDR6OlkVbSHBB8K9
	bkxy/SKFV8Z/ib5FQFqWatmCgjrISpOghSF14jB5pgDyt2i1NEfO4Uc9v5oSieyX
	3ISPOdE/TAGtmPOkI59PiOh0axW//yMwmf2P21znSASZyOJ0msGGUaya++OAZdFo
	ctGa+gRQTNU9aWRl6s04XCcJHvCiJycmbsiA5BA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DunYAvvsDGv/A97USTdOeFN41nxpFm2/+naGRwtLkU4=:HqKs1SSZSd3+2hMpiQXFT+x5XP6mxJr0A3zNLl/PAts=;
X-ME-Sender: <xms:YZvvat8JVdw5qReldeyBV9K41_hPBg1nmjeaS0pK4lQkkWCMJXXjmA>
    <xme:YZvvashhNo46PfP4Q_-7GnrMX5QUkO-MVczcmR9_HJI4AIs5yRxKWsRcbW3Krc1yA
    7Oi_TucQ2_ghv_vxEk2eJNTw1JwuFFvAiVxrkHPLfLBVa3wLAUHJC2w>
X-ME-Proxy-Cause: dmFkZTEUiwQnPAPK9l92X72Lrxlii9us9e09+lP7lKya6ebS5yq52+FIqTG2oANDNcbxuQ
    f5CkI0fvWuUx+zXAgzXq+Gl4V6fSB9i2EuhY23bAkvkotD26qF750NvCCeDXVE/BgzZh9S
    gpeh7e5idxtTWkvWVXn1gyIZU0ScWsy9RrELF6bCKG1Rn8I0ATDr+KQEX5akLJqKa6Gxpz
    KP9Hf4SGnTEn3PyRMDXs8XEYNXt1+SObxvSTY3vDYTCUhqTYNrQhTto+pkkDSBf6gEH2/1
    XFoiVnbFyzMycznWk4pmxa3LDlqstYr+gTDzKwN1xVkpjUECyzE8VMrroOKtqO5R2YR9F1
    jYiSn5wZFGrlbqzzPIvA/rYi7FRVLWkVGbYoEbVBTxWBXVk7EGOoS8jGv912GqrNXy0ior
    WASNXgY1CRrtLfzzwnFf801BW7NXqIGK9EUkQZLCVDVJnEc+d4d5f9jV4QCymLVIWfsorV
    K4UgLdhOIbI2AG6k3YcL7DWl5PIyEYtYilsAgIdROQtYWJpL6eeaRKd9TqbS3Gym9jjGu9
    622Eku/FIdURSjvGMZveWGAcpdvpzERfj/AzOBn5KyXH0D01sOwcviQKZ6dIZHXcJg4D7E
    4L9VpeOTTmFaWnCgqyVnxhmfDxG9E1Vx17aUzG2yso+WedjHUC6NZBh5Cb5A
X-ME-Proxy: <xmx:YZvvatLIswgWx9xeuHMWNGlsOVLjUFJHgQRQcyOCwRoPSr5fpbSu4A>
    <xmx:YZvvavKkk1FmOWwQ4AvnniyW3o2SSBIcnpqfTeZNTcPjCFVJ8-9G4A>
    <xmx:YZvvaggQ5-BEr1YS4WB-zhCGbYbEV_6DiIfYr7EoHU-e2a1BryOmbA>
    <xmx:YZvvahMUm9S7QGHD-IlfNgMWDYltESpIfaR4n5FXAHheKfGM9ymx3A>
    <xmx:Ypvvavzw7BmlIzLKpQ1fEAwgfO-h_oZfs1V3obuLR-_TcgY0MpX4bQAK>
Feedback-ID: i83e94755:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2E07118E006C; Sat,  7 Nov 2026 16:42:57 -0500 (EST)
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
Date: Sat, 07 Nov 2026 13:42:36 -0800
From: "Josh Triplett" <josh@joshtriplett.org>
To: "Rong Zhang" <i@rong.moe>
Cc: "Mark Pearson" <mpearson-lenovo@squebb.ca>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Message-Id: <b2ca4d95-7b66-4a8a-8e47-84ab0e052bd1@app.fastmail.com>
In-Reply-To: <5219f8fbd637a3b2603ffcca3e6cd624db982aba.camel@rong.moe>
References: 
 <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
 <au5nUp4extfupCpS@localhost>
 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
 <au-O9sHQNnHxla_e@localhost>
 <5219f8fbd637a3b2603ffcca3e6cd624db982aba.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Rong Zhang wrote:
> On Sat, 2026-11-07 at 12:49 -0800, Josh Triplett wrote:
>> If that is the primary concern, would you accept a DMI-identity-based
>> allowlist?
>
> I don't think you need this if we take the module parameter approach.
> Usually we don't want to introduce a infinitely-growing DMI quirk table
> for some niche use cases.

The module parameter approach seems fine, as long as it doesn't taint the
kernel to use.

> Meanwhile, I can't totally trust your LLM's conclusion.

Extremely valid.

> The ACPI part may
> be correct as understanding decompiled ASL code is not hard for an LLM,
> while reverse-engineering EC firmware is completely on another dimension.

As it turns out, the EC firmware appeared to be unencrypted ARM Thumb code,
and LLMs are pretty good at disassembling these days, too. But still, full
support for "can't totally trust". The ideal solution would be if someone
from Lenovo could confirm the conclusion.
