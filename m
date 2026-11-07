Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794086070;
	b=IkEDwfFYBJPH9jTEysyBbdnXlsm/fCDr4GlLHZ9Gwo35dn2ez8vwMOwEfNtw5xGAGj2D
	 aGA8uU9Cj31zufVaWwfxd0cPBp6mrH3fhfxKzat/S+xg9lLhPCmaGrR9ig5dOqvy8CaKG
	 KUiRM0ewyKzRRpFtvoC2nlX3M1f8+v4NPfleIiPAzKpyBfkJV/u3iqD1sh/uANNpYsebU
	 DrEMdIxC40X7EOz/4LnjchqJPixmwsczQGLegxH9d3x2y1+OwMNdz2E7Z5uJfTkLaewPH
	 Z05K7cIIQ4+0HsPOgrkRywrTFLD9qlelkKYrjp9B7sGtwDQRnzvXiJEIihpIsdm25CA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794086070;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=1hQTst/tF7B/9HupfVmaW4pI3nH5skis/Kl7oZYfxIs=;
	b=LTHwdDYZ0oDNYyvsZBSp8BIOn5C7rGEafZdgz3njL4/3Anzk7UZL6QKQpU0bXXw7JAOf
	 v6HFiKOZTGfB1V3srZIOgEOed08AmhrcYvMPvhs6TvCn1DDNHHGaEOA73CvgNZ31YPvaG
	 oDqgBYsK7vZ2KTMoAfCAN5Nsn+xORgQa2GUkZcD+xmKKsNDtjTHoKhRTlb7t+wfoOSWUl
	 v+o25Zx7yXvFTiXkQ1Zxm26tWUCArefwKo1qU62YiFEVSuRyp8gj8ytRwqaQpgu1tP96k
	 wl9VOH8pJzHJmrvCvfPKUunbrbWe3m8S8IkyE/LELoZN0j5Oapo6Zec+yyMfb+BioaA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BYW3t1FK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD4606A326;
	Sat,  7 Nov 2026 21:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CD4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=BYW3t1FK
ARC-Seal: i=1; a=rsa-sha256; t=1794086050; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JEEKHD9aaDxbbXF0helRJ5uXURVIzIPuWabxpZcBXvjWwLul8FOkzJjSY7LEjW5BqCzBZi42BamtXyh0HEKc+kXorwfl/FQzUnsqwAPDWrlHtftob79/AWcWJT8F2KNXK1KoL0rf1zIKMridN7W63+WQBAh5fYXFQPFw6bZ1Qko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794086050; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1hQTst/tF7B/9HupfVmaW4pI3nH5skis/Kl7oZYfxIs=; 
	b=AWdy3EY4IrQ0Z1vcJu7ObBhIwNIxHe62TuoosJ42QoEI83P6vWxZif+4ew75grrahDlucwhxHO2FynSL7z7qFtjeie6GCvPi+7UNDSvuSwbvsv+Bwb07eGuzaintqqrpW1JsuT5dP4SiUFOM9/W/O3ao8F/VeEgZi+wdV5DfXjU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=BYW3t1FKs6L69fMT3ufkR9g+vGhwQqg0b7Q+mSPRHXcl9XRUswiCBm/aet515Ccd3bC+74aaj74EXKbDPl/xm97BdXB01/WQFoylXnh0/alG6+DIAphnD7Tw0TIe5bCa7OM65umTYGL01H1WTpgd7OobgS1unZ2QSZJRy3IHgz2/zVsvZcter6Ko4dH6NXDQcnCH/hmCUIi0Xra31K2S2GRVaLliKTqgJg7yyHMipaha3DrN0luoU/gMrb0y4v0HEc+QBKvCW6vRidYnAhVXkoDktif2Lc7ZHiouiqixAMx1iy+BTX2OTi0sigAJVoZ6ToSHqV81ZcPybY86JiV2AQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=1hQTst/tF7B/9HupfVmaW4pI3nH5skis/Kl7oZYfxIs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794086048792571.477853665881;
	Sat, 7 Nov 2026 13:14:08 -0800 (PST)
Message-ID: <5219f8fbd637a3b2603ffcca3e6cd624db982aba.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
From: Rong Zhang <i@rong.moe>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Henrique de Moraes Holschuh	
 <hmh@hmh.eng.br>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de
 Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
In-Reply-To: <au-O9sHQNnHxla_e@localhost>
References:
	 	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
		 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
		 <au5nUp4extfupCpS@localhost>
		 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
		 <au-O9sHQNnHxla_e@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 05:08:06 +0800
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

On Sat, 2026-11-07 at 12:49 -0800, Josh Triplett wrote:
> On Sat, Nov 07, 2026 at 07:45:12PM +0800, Rong Zhang wrote:
> > Hi Josh,
> >=20
> > On Fri, 2026-11-06 at 15:48 -0800, Josh Triplett wrote:
> > > On Sat, Nov 07, 2026 at 04:48:44AM +0800, Rong Zhang wrote:
> > > > The term "unsafe LED" exists because LEDs are write-only for softwa=
re and
> > > > fire-and-forget for the EC. By taking the control of an unsafe LED,=
 e.g.,
> > > > attaching an LED trigger, any warning signal from the EC can no lon=
ger be
> > > > displayed by the LED.
> > > >=20
> > > > When it comes to battery LEDs, they are definitely unsafe to overri=
de.
> > > > After all, batteries are dangerous things when they malfuction. Thu=
s, I
> > > > don't think it's suitable to enable it for all users.
> > >=20
> > > Choosing to not report "charging" vs "full" vs "not charging" via LED=
s
> > > (as opposed to on-screen indicators) is not in itself dangerous. If t=
he
> > > EC has something like "battery is damaged/overheating/exploding" to
> > > report, it had better do that by some more effective means than blink=
ing
> > > an LED, or the message is going to be lost.
> >=20
> > This is not in contradiction to the fact that blinking an LED is crucia=
l.
>=20
> Something can simultaneously be crucial and completely ineffective. As
> mentioned elsewhere in the thread, "immediate shutdown" would be an
> improvement. Bonus if a message appears on the screen for a few seconds
> so the user has some idea what's going on, but whether the OS handles
> that or not, the shutdown would be an improvement.
>=20
> > > I can't comment on what *every* ThinkPad EC would do, but at least on
> > > this X1 Carbon Gen 11,=C2=A0
> >=20
> > That's the whole issue. The patch unlocks charging LEDs on all models,
> > while your ThinkPad can't speak on behalf of other models.
>=20
> If that is the primary concern, would you accept a DMI-identity-based
> allowlist?

I don't think you need this if we take the module parameter approach.
Usually we don't want to introduce a infinitely-growing DMI quirk table
for some niche use cases.

Meanwhile, I can't totally trust your LLM's conclusion. The ACPI part may
be correct as understanding decompiled ASL code is not hard for an LLM,
while reverse-engineering EC firmware is completely on another dimension.

Thanks,
Rong

>=20
> - Josh
