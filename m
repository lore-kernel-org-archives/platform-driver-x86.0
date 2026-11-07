Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084604;
	b=UwCYhX016L1X0FSSS8Vd35cteDDOMn9+Em21EGhZf0h6vzul6N98hxRxL/ZLfq27wsTj
	 E0OOD0w3KbOWe/6ONiIeC8Nfbc9vXM1WF8hzw2g2LTHkI5GeGRi9vx/6j0DW9yKHg7Kxt
	 qaR3InY4nRLYyUCmuLLWyoLVMNIc0F2lv3IDGsNFKVewerwV3fpjtPjcCME0laM65ic4V
	 qzA8aW7wMGC4tZJ9UtomcbgSdtJkU7eegoteUyeRzSYZGHXW0NOQnzvc04wE4w6X7EhF+
	 deu2d2mfuIFp15zixNzeBm2tIEvnA2TxcPL04sgT1qDstZ/MIG2PcOD0j7HKpp7mydQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084604;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=aOesGKy7Bt1YCMx1QwBRu3MlgUbtfj3W3WMjPklWMRI=;
	b=4sREh4abzVdFeECLzqPkchJngI2C6OwO8oKi/9ZcTKH/H+vKvgQlTxF9QIiNpAKYhbBK
	 VXDpKJFZLv8IjUbmYdS9y6WLPPMsB/Onl7kQ94sOCmEJdswsXs/rxFYe77T79vvxJRfPf
	 x2Rgl4+JJPpVm3zYAD0fo7JQ3jXZYASAxURwZZxn5dWHNYe35GHf18TjUQG/blcAKpl23
	 20iXoazRVVVafZIDxnnLIdEx8a14OERatKMvwUFnBkvGSzTlBhq7LWq8sw59QRw+SMdrr
	 2utvdl9vstjAK3PjhyJWHJwMqMYWDywFZKQeaCmvYEtKkPRABBpgDkqBGI3iOSmPZVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=joshtriplett.org;
	spf=pass smtp.mailfrom=joshtriplett.org;
	dkim=pass header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b="z6u+N/G2";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dthcuLss;
	arc=none smtp.remote-ip=202.12.124.159
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF001606A326
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 20:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF001606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=joshtriplett.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=joshtriplett.org header.i=@joshtriplett.org header.a=rsa-sha256 header.s=fm3 header.b=z6u+N/G2;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dthcuLss
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D57C77A015B
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Nov 2026 15:50:02 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sat, 07 Nov 2026 15:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	joshtriplett.org; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm3; t=1794084601; x=1794171001; bh=aOesGKy7Bt1YCMx1QwBRu
	3MlgUbtfj3W3WMjPklWMRI=; b=z6u+N/G2KU95qqFq0G5Z9YVJiKgWnQa5G3yvr
	rYko1LUo1fh8ZyPT4RdiMBwABrTuZaIxpwDdoj0rSsmrWMLvVrug+N/jEfoTiU8W
	vC5MGEfn8d+GpBZIPw6ZQWjp2T/cUptWMs/FaaqGSZ3nR3g18Zudm19kM2f8JiAn
	fe7ijTtrDukQMkORYJ+a1P1BeBTkNr/+sx1JBZdavRymrM1EG+1foFsaDYu9MxWt
	x/dbi3m7A9EoLJDsSRSX+sUrH5cxt9BM82ZB1f8VIlxPDBDCnoOmvLE5bcZR8Ofp
	pZuep6G/RzDuvxZre+AnDp/Rt+FPI4SDvHtFQIqZ0GtocwujA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794084601; x=
	1794171001; bh=aOesGKy7Bt1YCMx1QwBRu3MlgUbtfj3W3WMjPklWMRI=; b=d
	thcuLssM+anEFXWbCJArOEynkrI5v1Jg7Fg/dpmuI9sOL/RLzDPI0PpVK5FR0bjN
	iqKZVEDpyiOlAACLkOzTkhEZI0/5cm80ofdvI0rQ/7IULCv667AN02oEqdidzLdV
	YweqhfXi9Zzj7kxdW+TNXtoKoHg2mVRQyMNq2P1Uwv2B5FLQm7vuIIcdjWnpsfNM
	0EX75KDEjwLhttcVPuDNupZVP5RSeAOTegDHBJfeJC0FAIQG2d5Wq0j8b3SLoJbo
	PhaFb6NBo0gO4zYs30VnMAQKpNWbdYlnxRBtCxzrBgfLthczNWzISKHRXmVLfaOL
	epp/7e41dTtvZ4h02DJQw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=joshtriplett.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794084601; d=joshtriplett.org;
	mf=PGpvc2hAam9zaHRyaXBsZXR0Lm9yZz4=;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm3:rsa-sha256:BOwl4ATij/pRmDpVhL3YioMUFw6CwZyfSfJz2eEXzzTD2/k
	mIlEP4gfWhnZ1kgG+bZtoE42a7l+bpywAOdxbF1Z4X7sCeGJ+Y5yceLSQ3nhSgUo
	yZhPHHQvWzCkFCdgqlwhIdbIhGeron8eZ3Kdqensr6aM0/UKDVdYmTdQjV3732zq
	1BUtUcsz230a7wDQsT38jM6EGDqHebSvTiolXXbAB2Tqcd/Asjta10GpCELCKjBu
	jE9c0gN1d8ftXJQjDYueirgNnZxgq0TcnLQHIb7duKhU+D4AupTwJkY+/i09dVap
	CCubmTgOOFKtZoVImN4Mw/3yDqDV2QQBPytzT0g==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:A19Renz0cxkEDfbt/2pLjrnJSUaI6TuPqDwDKxer6XA=:wyge+1tOzwAIZGqBD066PALFzHGlxq9/uxHhTr4zyrA=;
X-ME-Sender: <xms:-I7vagZaEKGabKaUK2n6AmJXbY---mbLcGIPDmeQf0eIOCBVFHQu7Q>
    <xme:-I7vaue51KYR_CdyAU9JVtZziXab25DTRCJ2LSZPPgB-zxAv0VJ3VueVHOhQPChXM
    pJd6Ff8En29aV22QcCLyuu7r5MjkTvP3zVqkFUmNvw2_Wchmt_rwIRo>
X-ME-Received: <xmr:-I7valmJqjbR82WX4MfEtBx4kgTPAccoL9fD3sM63Fr4okXBEFf2nhYQNQ>
X-ME-Proxy-Cause: dmFkZTG1ZfC8HBbsKhJNIVCAtBIJYEcqG93Uh6xOwtCMmcb+hKolNtXgix5VRY7hVx0P8B
    aYZ1u5MQjSiy0VXR2QRQLjMfSZMQs2XO1jXfVvLxh7OHNABgdwZpfX4CAiUwXmim6Ha2X6
    qESHRKysaogslaAs00WB70ATq9CZzYDD2iGoK1R1YqhYAxANrJjL0h3zVAKqPYe/Sh4gBR
    XzSZ41dqu5S/3HUnGosu8gvQmNE+ZRKEA7klcbk2KCUA055Y5/hwj8heGdpSLR7BWc0iDR
    rdakdB0fTjSJhj47sYBvPpEp1KSXZ50H3A54OXwlecHRwFRUQc7WLRfCWkpv9DLN30UJY5
    J5mqDOj/Qun4Zmx2MvapvFHmGV/iS+qpmWmDZMXraV6rsbFVDuF8jfSX+jei1rAUM0rM1E
    AjU0fZVGaolYPMwzs806pNedfrALDiobYYQW69xnQmdfuYhP23Vq0wQfbzgSGpHczO+btB
    x6b79xPE6tN8OkKKerIZ15w1LwiiEkNZG2/7zhTOknvmLMnhxnycxjGwyR8iuhUloF+UOG
    dfaMb72Q9gjTUw6sXo/6dZdDCF3VBY1SZpVpBxCn/evX8h0/iiOG+xe3/c1ovlgz9Vsjo4
    iIjGu/SydrpeS37sanYmyf29Ue7d9CkW5gK9EfjZ172E7+5v1dKYa8K2+mWw
X-ME-Proxy: <xmx:-I7vam3oECNoJpIk_oWKN6zB9KevAY_pFNovB-w_cmYmygslEkMX9Q>
    <xmx:-I7vamdNQX1CBZWACEd1rUZ_T2PukM2QWo7dD2aaC_gWYnvweU1P6w>
    <xmx:-I7vaoaPvm8bINod_zcw9qt492Rse3XStQFf54aMVTkHST8DvdBxvw>
    <xmx:-I7vajFCGNZdr7Oog2JnTNFu9oeJY9YuLYw-BxS3FRlZ2TSjngbr9A>
    <xmx:-Y7vam24Yt0VSrPKEyka2JwxMCyDIfa0_tk6a5MpH3r4BP66IcNhhqzc>
Feedback-ID: i83e94755:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Nov 2026 15:49:59 -0500 (EST)
Date: Sat, 7 Nov 2026 12:49:58 -0800
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
Message-ID: <au-O9sHQNnHxla_e@localhost>
References: <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
 <au5nUp4extfupCpS@localhost>
 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>

On Sat, Nov 07, 2026 at 07:45:12PM +0800, Rong Zhang wrote:
> Hi Josh,
> 
> On Fri, 2026-11-06 at 15:48 -0800, Josh Triplett wrote:
> > On Sat, Nov 07, 2026 at 04:48:44AM +0800, Rong Zhang wrote:
> > > The term "unsafe LED" exists because LEDs are write-only for software and
> > > fire-and-forget for the EC. By taking the control of an unsafe LED, e.g.,
> > > attaching an LED trigger, any warning signal from the EC can no longer be
> > > displayed by the LED.
> > > 
> > > When it comes to battery LEDs, they are definitely unsafe to override.
> > > After all, batteries are dangerous things when they malfuction. Thus, I
> > > don't think it's suitable to enable it for all users.
> > 
> > Choosing to not report "charging" vs "full" vs "not charging" via LEDs
> > (as opposed to on-screen indicators) is not in itself dangerous. If the
> > EC has something like "battery is damaged/overheating/exploding" to
> > report, it had better do that by some more effective means than blinking
> > an LED, or the message is going to be lost.
> 
> This is not in contradiction to the fact that blinking an LED is crucial.

Something can simultaneously be crucial and completely ineffective. As
mentioned elsewhere in the thread, "immediate shutdown" would be an
improvement. Bonus if a message appears on the screen for a few seconds
so the user has some idea what's going on, but whether the OS handles
that or not, the shutdown would be an improvement.

> > I can't comment on what *every* ThinkPad EC would do, but at least on
> > this X1 Carbon Gen 11, 
>
> That's the whole issue. The patch unlocks charging LEDs on all models,
> while your ThinkPad can't speak on behalf of other models.

If that is the primary concern, would you accept a DMI-identity-based
allowlist?

- Josh
