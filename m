Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271346;
	b=KdCuO7Cn9KonDW0BsBJaol5w7oLD0uoytdbnr/7VXxjWOeGqEI2XJOWTX/lCsPgKccBw
	 gy+oo4s1IAVNsT7+r9IpO4a2xwlvwKHqp0KZe6GrSqlXj34wwRYnaMrvvIAC796NfPYlf
	 g64VEGxckPZK79cGCs2vphyIeSxhu/mCr39knp4wIJR3LvrpsmXHLxa+aZAYcHHdCXOok
	 EwkTAFLGkbzwH2L20wZjvztxgqtmLcG3nUmJp5DH5oap8OnLKn/N0i4sWMlbozigEWQmd
	 C7VZxyUYvrYguNuJ5Hod2OpCjR7/8SiY6nq80ZF1zV3kMx0YnxcU04iT9ogOFWskFeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271346;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Z/eXsf9vSjR93eXN+i1Hpo7/DYsAaGqPIfyTBDNBpPw=;
	b=Ynal5FS2IzXRTPrxu6t7rUSXgLB4ZIcafrDoN6BO92zTUHs8kDzpi9Msc/JqLHzfvLuB
	 jUBFYItfUKrIqGpfFKjwmVPq8grTR7SsZ7GoZncsR0JTRhr5tvWMs3TzC+EenxHde6yKH
	 6nY+Nlj5yGXR2XQcQcZFj5ZCPaKo46LWPPLZ5dyF0zIK0qnp/FWX2NHIXMrRxx1FeKKmT
	 v4tvMVhj/sYcHc5N5NysLEGBzbQa9nWWC7bsBuOdT4EFZme+QGusK36pTS7WAq6X5zvsP
	 cEAXUoFQSJyekfhJ4mflfRWpVsYLetOZwwl8wswYqCKGh3XFVTKLnl9NdYXWiasjgBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XwPoyfaK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3atXviQY;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A49B606A33B
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 00:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A49B606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=XwPoyfaK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=3atXviQY
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 69B4F1D000E3
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 19:42:24 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Mon, 09 Nov 2026 19:42:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794271344;
	 x=1794357744; bh=Z/eXsf9vSjR93eXN+i1Hpo7/DYsAaGqPIfyTBDNBpPw=; b=
	XwPoyfaKLnhtg4pIKvX5r/BZfNlDVyKJgu4i3fMrFkIV9cEqd6YKH5qPMktUQV2K
	Jt/4bhhFWTpz7RNtD5ZjZ7H3t81B0rfA6vRtghPeoZdoDL1r4Cm58yAqaL/lZy9W
	ZZLKlzP8PDeMqVhoXlQE/iY6Ks+HKb829gE0iP82vdbpL4VrEfJcCuBwTBw/I9FJ
	kUabuEUZWemBRfhCXgg+ZpkWhAb0p/KqC8lC5BLwcQjLslgvpmWNRC67lBbr9j24
	P+cBUKDgU1EO8mD01jl3476K551CDq3xZufVVpAPLL4KhX09V0VUo4+SyLDSvooe
	n+LLjcp+WqH5aZmi+TMsGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794271344; x=
	1794357744; bh=Z/eXsf9vSjR93eXN+i1Hpo7/DYsAaGqPIfyTBDNBpPw=; b=3
	atXviQYZMXLJPzLvGYWOeROnZzhXGlKagdScX8BsyduElVT46t3lwHyul6OlA/n+
	35kgVBlxPpdeYy0MmtoZ7fq4AUscd4Lc99cubktsJ2IUCTXW8s8KpIG1N5TJx4a7
	+REzLIZxVDbq2nUGwgZNYlQR+MQStb+puNGNYL2LpEfggvZSalNq+sm2BCxYgzJf
	hJEwUp4K8rXoaXlsEd/KsnMtAnFyz6eNENTIquQiGHGeJeCOwz80ikIHd3wlgAxN
	uTUSH/a/ojlQsQP3fE3gNuDrJJsYYKn7ODiWQK1P2nRlRnAYTzwr2UsFzF0km7Iz
	yeHvnKnZ5De5IVQ9+XbHA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794271344; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:UiCq/lEeWszNMVu64d6xg27QMyF5F3yD/5IvfPAPb/4G5nJ
	l7N1VTOJWC4/cLCdaPxGTUHhharSrIqkXzrkMvCp5J/Jw3giNtGeLvomAh4+m1on
	Rf7Nkfz3My27rMqecv13JM0CB9AzdfuCQEaXd/2POK3b1qxMD/cblIxc0GZc7Eni
	4qDAzIMGpB/sHhPKtH1IIl4m9u7J1ubPMTZ3pFN0NH4ke/8tiKMBf2QLqI9Uhqlz
	BaNWre0sdaXcUE73Y/IiIk/dB/JMaykKKgpzt6TNIiylgCl9luo06fj/a5zluIKL
	2xfIcnVD2OKeWzoBi6RU5QrFCanmT8jiD82O+bw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:a/FsXDRv4V0mUKO0tWe/ow7KXadpbcOoKS+tw/INjUs=:OX2t9AOPDiEHsqZSTUTisUlVzsKpGQHpV1UOGVQMmmw=;
X-ME-Sender: <xms:b2jyarXluFms7wtdBTutFu8fEKbgeYVuYoUw6fkm_FbgprOaYCRO6A>
    <xme:b2jyauY_headSLE8C58OMw4MWCvSseAQZ5uj8seIUMxanyS2c1Yfpfrnmj6xxJNLQ
    jG7p9YkNXI2osd2eSq7nk4y8p1tw_PGwwos59HJcqxxQJxo9SqFmTqs>
X-ME-Proxy-Cause: dmFkZTFaahMzYqQosVLa6sTsGzwZadc9J4KxF768hbw1u8zvYD6hMqQ+xV48vKTTljF1gh
    3KRuEIkCxxRtyuXQls7diQf5Ai8iFPZpOm3U0eziP3rPYM+dBCETgorWTNjVob579xBCyd
    8RN1+m3iJsgQ2q9mp/BfAjc0728oc2+t3YmjmBJHzpqy8EntIBZXIjl9Y4etvmZlk6wNvU
    RwfqcT/Q/rV/+p+VLumKO7FLypUUy+ScjfHsVnqDNSjQ1MdVl/ERU/b52Ik907bid7PkbC
    gtRt3uWVl8ZV0yL+D3gMvuTnodtfpGGg0pNd4ATyznilR5abv1draCh1U40dPxteyPIlgg
    CWZHdV/Mocfn13LOcU6or4DD4sxzqfK2bR1GY4sp6Q7dTuMlhRF5lLPQiLWQYl86yZ45Wz
    Q/y7M+4MJsEwRjmfCX/uFNFNVCSbGZo9EehBPS7SgWhQNK4FWVqay/uPIMpakzBN02TFeB
    OuoeE4kQOpHg9Xo0D5Mlo7yNeGkwYiTQUbW1UFgpVCDk3/7bZQSbOAMfXaufhBZXLYZdh/
    imlC8qVqFCrngypiPLcCPKKAu85iu0pbpc5M4wbQeVJy2zB0IklsQ+Q2/LN1o32tykaRik
    SzcDuIXq+xHxz+JrgZpGkZ5jIOhCzX6AetyWuxmkktWhXTIyi+uhUYlyymZA
X-ME-Proxy: <xmx:b2jyapiFOl2YXRW7tXjY-LTyI8Ay4F0kRSVFQgCSEvLVF5QTyPqu_A>
    <xmx:b2jyakDpExcc7vqupFfv0RGWGH3CdpgOh_QrGphpZlhsiL8TNACQDw>
    <xmx:b2jyaj45ytGzbzjZq14l0QLEIn90LcACGfOiyC1jQtbMBYCGmCZdNQ>
    <xmx:b2jyahEkIk6TXDFIvI5BxKWZmmoQm1IwOYkmMRZpuhgF63NJ5WJcsw>
    <xmx:cGjyakLXLz-pDAKxwHelPPG8ohCT5ekkWWvqYuxytpC1JGwK11NFzssL>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 239012C00085; Mon,  9 Nov 2026 19:42:23 -0500 (EST)
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
X-ThreadId: A24yZ7_bmoKJ
Date: Mon, 09 Nov 2026 19:42:01 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Josh Triplett" <josh@joshtriplett.org>
Cc: "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-Id: <f5fbe07d-4a63-44f9-8217-ee5e05408cb1@app.fastmail.com>
In-Reply-To: <7d44c7e901c44558fc656440078cd869b06cc2a4.camel@rong.moe>
References: 
 <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
 <au5nUp4extfupCpS@localhost>
 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
 <au-O9sHQNnHxla_e@localhost>
 <5219f8fbd637a3b2603ffcca3e6cd624db982aba.camel@rong.moe>
 <b2ca4d95-7b66-4a8a-8e47-84ab0e052bd1@app.fastmail.com>
 <7d44c7e901c44558fc656440078cd869b06cc2a4.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Mon, Nov 9, 2026, at 10:02 AM, Rong Zhang wrote:
> Hi Josh,
>
> On Sat, 2026-11-07 at 13:42 -0800, Josh Triplett wrote:
>> Rong Zhang wrote:
>> > On Sat, 2026-11-07 at 12:49 -0800, Josh Triplett wrote:
>> > > If that is the primary concern, would you accept a DMI-identity-based
>> > > allowlist?
>> > 
>> > I don't think you need this if we take the module parameter approach.
>> > Usually we don't want to introduce a infinitely-growing DMI quirk table
>> > for some niche use cases.
>> 
>> The module parameter approach seems fine, as long as it doesn't taint the
>> kernel to use.
>
> I will go ahead with the taintless module parameter approach as long as
> Mark is not opposed to it.
>
Sorry for the slow reply.

I've had other users who have wanted to turn off that LED (and on a more personal note, it drives my wife nuts in a hotel room too...). So I think it's a nice to have, albeit minor, feature.

If I go and ask the FW team for their formal guidance it will be "don't do that". So module parameter works nicely here IMO. Go for it :)

Mark

