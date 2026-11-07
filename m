Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794065488;
	b=EBiQ8dUgoqrfrEkAhA/lP97VfDR/nAH0P0Un2LBtg3+74RUyFGq8w51uN6bB+ErLZN1j
	 RuxvMG/L46GXYBcMmwNIIzgSYKBuQIhFyk4juK5TDlpHpatHt684MzJQtSIb2iooPIIvk
	 lRkDPKFuCJc0K0sBVGd9dA7uWWOqFgQL6ne8nSbW/Gnrdw4wv44eGyANRyEj9fE6HZQ6Y
	 vs2UmBCzoOm6xzfMwIx3P3oZRlaQqs33bVnat7PH0PZGNteO+PwyBNvdVC3oLd8vCnPye
	 sahjMKRxNWFluJNV4zrCW45gWn3ewGk4KEtkc82JLJy5KMb5gFpF8GJiBuJDPCFhIlA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794065488;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=URSuVylGhIn2VsP8WNwVdUOryQQh4AXTTTPkM3ottzY=;
	b=c7HkZ4g3umHCbkagGhewSzATCgni4mWV+Bb55atvHjFwRpfSHGvw4wcgPBgVnNwP2IdP
	 uen34yfQCTYtfZO7bQPwo9kLVjmc+lY0Xcs8SZ/tRzvFYOsirRmW6JfuSMAH7/J6KK6RY
	 SvQY70Ipvuf+4WKyPV0yvcVH0qN3GzVObbUDfJYEBdO6I6rgA+n0iJMjYyM5eWGkmYKc7
	 RM+5r3CATzrF9JLchNJ8jjNFGkVeDSDwDXxDPReQOun8ihf5Otmu1AGOgPepZBxKI6Ywy
	 0csCpHQeZbAJHBnud4Kyw/riEG3cyvCc53JWWFy4lPazh8XtvxeoziG/kezi0P6HSmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cdSoJgUG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E89C606A338;
	Sat,  7 Nov 2026 15:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E89C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=cdSoJgUG
ARC-Seal: i=1; a=rsa-sha256; t=1794065466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J5mRuQnR82G+MeNeNsi6rmm81jr7vIwB7G4tB2jmeJLvtBPgp7ogcY3tOlMWIIWv7ZGa+v3VoVYKQkNXP41WOWQqmBubVyt+/OsKYg0XedP3lOOOM9d5ymI3QsEfs8e74p9P5ZrqC2coc4JCYtjX3MeOUDA0R48UlsK1W+vhAUE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794065466; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=URSuVylGhIn2VsP8WNwVdUOryQQh4AXTTTPkM3ottzY=; 
	b=LWAkWRiAPCEYz2KFYisMm3XRMuXV7qxRRWFwQJ00gHq5VJI9cepN8ewfTGyxXWP6u95LuOL6vCCQ3PlILM4DjVHbQBwfaiOSsZh3cZB/fUrQOUNEQd2hfZR95mMCGv0HV+CTOqsIxXfUE20QvFsLxwGy5I+XlMwye18MCo5U5Vc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=cdSoJgUG3ZNp1U2c2NYqKHt3SLMdOxkcyWfkYf0NUY+3ddNkocmgCz+GF1HMCoM8r7cPfNlt20FEQEXfaugGDhukPsOUPADpggINDm08ItoMexFJWAJ90p/t8/fVlTPfSSOcCIT9aV1dwEOsJwDpNpiEQie8jqfYWT0Vk2TMzv5SgB4aAUdcOvOyjsGgFM7hu0ARoHHr+XUE081xLIbzeF+eHhRqLjABYnGBh+ltRXooP1lPxMoHtwYqhcgtMnzVToGJGGDW1VIxFHCue3P2rkXNZfOn8DOtvSTfwqBSYFkHrvcLoVAiqTxJGy/USGO9azYHR7UI7j1nfYpRJoVwgw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=URSuVylGhIn2VsP8WNwVdUOryQQh4AXTTTPkM3ottzY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794065464646404.8361455515151;
	Sat, 7 Nov 2026 07:31:04 -0800 (PST)
Message-ID: <11a8a3448ea82f594bdd46f380612ba9d703ccc9.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
From: Rong Zhang <i@rong.moe>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Josh Triplett
	 <josh@joshtriplett.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>,  Thinkpad-acpi devel ML
 <ibm-acpi-devel@lists.sourceforge.net>, lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <c70af6c5-3d95-44c5-8f3f-b014178234c9@app.fastmail.com>
References: 
	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
	 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
	 <au5nUp4extfupCpS@localhost>
	 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
	 <c70af6c5-3d95-44c5-8f3f-b014178234c9@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:25:44 +0800
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

Hi Henrique,

Thanks a lot for the context and opinions.

On Sat, 2026-11-07 at 09:34 -0300, Henrique de Moraes Holschuh wrote:
> Eh, I better voice something about this...
>=20
> 1. The EC does use the battery led for alarms, and it also has specific h=
igh urgency events when it thinks the thing will catch fire or going to for=
cefully cut power very soon, although this was a relatively later enhanceme=
nt.
>=20
> Thinkpad ACPI is supposed to log a critical warning and it should attempt=
 to initiate a system shutdown (power off) if it ever receives battery emer=
gency alerts.  I was explicitly advised to do it this way by Lenovo bios en=
gineering, in private, a long time ago.
>=20
> 2. Module parameters are the way I dealt with this kind of thing in the p=
ast, especially if they are not mutable at runtime.  It is vastly better th=
an debugfs for this kind of thing IMHO and the fan control was implemented =
that way.
>=20
> But the default must be the safer behavior.
>=20
> > OTOH, CONFIG_THINKPAD_ACPI_UNSAFE_LEDS should taint the kernel on the
> > very beginning.
>=20
> I don't think tainting makes sense as long as it is something you either =
have to compile for and a distro would never do so as a default, or somethi=
ng you need to load the module with an explicit parameter set.  It will not=
 cause system instability, unlike, say, poking around the EC registers dire=
ctly.
>=20
> A module parameter is a decent compromise IMO:=20
> Debugfs is too reachable for userspace to mess with without actually doin=
g an informed opt-in.  People respect module parameters a lot more.

Using a module parameter also makes sense. I will resubmit my patch [1]
to adopt the approach, probably the next week.

Speaking of tainting the kernel, I would still like to hear Mark's
option. Note that a module parameter may also taint the kernel as long as
module_param_unsafe() is used, and multiple pdx86 drivers have taken the
advantage of it.

[1]: 20261107-tpacpi-debugfs-unlock-unsafe-led-v1-1-69b1f1e10c2f@rong.moe

Thanks,
Rong
