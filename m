Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236931;
	b=yfOCM/CZB4MsPaIGX9JrQfEywj/oywWTqzuXli0tv2mGhoBNY755lPSp39kR5rS7rVZD
	 4GL5p2Lx5hi4ZI2kV5iMqsiae3XwuaSqSnKmVbEYNHp6GA+BjEKwfFqumR43rC4cC9MPp
	 ouOOS+rqfghwjQT/gJGm/p+KyKB7oAFnwvvnd/JTBKa+pFRSSofi0X3qKohpnWuiYAa8q
	 /5DeLWak0qA/+wxAJ5S0BDNiEu6Nj21VjPuUbLfV2YHjBrG2l3WjFo+Ejqz7Uujkp1Bz6
	 s+Qz2i4PScGAVTZSmt1HEK/Mqv8gUnraRpMuvGrDj9vXb62nwt8siCx80Hqe8uMydnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236931;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=0XR4AmvsTRJDk2bL63haNEu1dkC2FBPTHHfjz2SdTGM=;
	b=bXHxoL5NjXqow5ZZmNX+YwGuj4Niwr9uf+HDN5KfnJSteZwxsvyLJfXztZGNKphzqIbB
	 qP1DL662ZOq5uG2Mr4fQaj6YCrrkM0VhLNviJF4c3Qk1UvhAxvn2Lm0EMOwhR3IvdZGjR
	 g6BnZqnduGaNCiBTJmncllliItaRtGra1EfOWeau9L7rrLyxSzD15NPj80CIy5yhMEE5D
	 wPCic7znJ26tktQeB2/531TMTHQthO+AmHyMRyqp2JVvNz2RokeGJ0BXAzxNeXOmUETBO
	 PKAWWACc60PSTGwybl/wno1BCXCr47H+tGtFTG8JR15/wMq1G+AFim/iBzwHghiQ7Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SNnuC0Iu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE419606A323;
	Mon,  9 Nov 2026 15:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE419606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=SNnuC0Iu
ARC-Seal: i=1; a=rsa-sha256; t=1794236909; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SjvsT2i9i0PcMSCVpJe85xMuEM3O1P+91U+lvfYncEXPwAjvw1E3WivFF1L8pl2D2oKObnWA93u9Km20+t5h3iZE/NTYfvWjeAKu4kB0U2w10JpFeU+y6JHLhUcCm8GkYwuvCFYsbqvtrA5zq0RTGpglG2jOiAahyWNSfF8+dxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794236909; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0XR4AmvsTRJDk2bL63haNEu1dkC2FBPTHHfjz2SdTGM=; 
	b=eHvn9XBTX1yqYFrIBQ9a9yzGkMkIvHnk141qNRFqiwYpRl5Mb/rRczjnqws4RflwfcSxL5AcObMM1kNdb0/w6GRw2iSKeCx3EDkQioLa+URAXo/PikrHhSr6vx/qR7IG7bghLiVcsGPXWQHj33hLArCiTnGe/VdzH+y3iQheVz0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=SNnuC0IuJSBPxLfttVXB0x29XpSsGyc6Yhf1nNKY0rGzc2mtxXWH4uVMi+Gvk70SCM8JCwnYyLJ0HaFC31oD2XHOWLvb3wTOa2Xw0YBBE7/RzW3KJQ9gNaTPYmT9KUcwtEX+LwP9886rTzlAcITuu5JKOIVG2pJ1l/4rnLcedimIIX2kT5wn+OgSQMOh/Bdj08i8LhY1Sjt6PkH1MeW8Qe4WPzktVWBspUlcjZF3OXRQ2dUfrAd1rSe8Sr7fG0O6SBr5YJ78bOpXSwzQ5IjII5NauFwEyu16kvMtVNIWXl5dP6Zj4SOxgh4xsb6bU3G0M9wJxNZjLMzDSGA6rDIFPg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=0XR4AmvsTRJDk2bL63haNEu1dkC2FBPTHHfjz2SdTGM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794236908207191.62924220581942;
	Mon, 9 Nov 2026 07:08:28 -0800 (PST)
Message-ID: <7d44c7e901c44558fc656440078cd869b06cc2a4.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
From: Rong Zhang <i@rong.moe>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <b2ca4d95-7b66-4a8a-8e47-84ab0e052bd1@app.fastmail.com>
References: 
	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
	 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
	 <au5nUp4extfupCpS@localhost>
	 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
	 <au-O9sHQNnHxla_e@localhost>
	 <5219f8fbd637a3b2603ffcca3e6cd624db982aba.camel@rong.moe>
	 <b2ca4d95-7b66-4a8a-8e47-84ab0e052bd1@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 23:02:18 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Josh,

On Sat, 2026-11-07 at 13:42 -0800, Josh Triplett wrote:
> Rong Zhang wrote:
> > On Sat, 2026-11-07 at 12:49 -0800, Josh Triplett wrote:
> > > If that is the primary concern, would you accept a DMI-identity-based
> > > allowlist?
> >=20
> > I don't think you need this if we take the module parameter approach.
> > Usually we don't want to introduce a infinitely-growing DMI quirk table
> > for some niche use cases.
>=20
> The module parameter approach seems fine, as long as it doesn't taint the
> kernel to use.

I will go ahead with the taintless module parameter approach as long as
Mark is not opposed to it.

Thanks,
Rong

>=20
> > Meanwhile, I can't totally trust your LLM's conclusion.
>=20
> Extremely valid.
>=20
> > The ACPI part may
> > be correct as understanding decompiled ASL code is not hard for an LLM,
> > while reverse-engineering EC firmware is completely on another dimensio=
n.
>=20
> As it turns out, the EC firmware appeared to be unencrypted ARM Thumb cod=
e,
> and LLMs are pretty good at disassembling these days, too. But still, ful=
l
> support for "can't totally trust". The ideal solution would be if someone
> from Lenovo could confirm the conclusion.
