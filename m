Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794085262;
	b=e9NwNWJuZgNnAbcdKSVINFJgm6GZ7YdkFV/y7z/HqajH8hmPJju8QS0DYde7SHsD1KqE
	 keqgRiitDhqUnZ9rS3vw+Cs2dCJVfpkXh4GPJIqlsor5JzaR3Th3XG8ggH3SECjaP0LYJ
	 DvzZA+mNdOmgXWNOBkQfhMZSvq2QTK9hgdyhDZgpdmpkHCBtCeEqh3QqEzHqI7jitcIY/
	 p31o5oJQL63U5g50rVRJpJ644ENitM9vANvSZ7UOlRj6vpSxjF5a82hPgyiBFOPW+yO63
	 SFBPGbGPrW9Mm8A6t27AixqAjmKn5NT4IHY6im57zj+/IMOW5Dvc0n9hSfPhdYqGjbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085262;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=bubpN/uxsjHzDvEIVexuxwjbif9uTaF8rKGPq8z7hc0=;
	b=VAq5pqvgnwOnyr8fddm5LMKM/2q+kFGkmo75ppMODKE5d317cU4WKXwTQkhA3GSt54vg
	 c/dcNosIJCNxgx3c0yuT7IX+5PbmpVRuT6fRN8PYbLpmEtzAfsZQSzi45v0wx/J3PY+J8
	 nu2x0EZJ4coO8q/cUGxMPmC+bU83bIOtFeAkpMg+EImdfMI6k+5CwGN/fDZ8+LpiKXjOV
	 2u0rB5sLr9z/Pb1dM/tTnYD7owp/19SlPmo2PD5qkMDPJjfpZ6TzvNeku+30GfZcxxJmN
	 19RH93ZmRd5+HWCvDKXhFUn0c7L1KPHHQwswhEPLkt+CWvDGw2dAdFshvZejjwHk9KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=qk+U3okp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF8606A32C;
	Sat,  7 Nov 2026 21:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FF8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=qk+U3okp
ARC-Seal: i=1; a=rsa-sha256; t=1794085243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W3KVlxQYKam3+YezudVdTCNVvIUU1S8bG/sbBN8aW1UrDG+lrto3flcZFRvrYQkQIF+r8oSEs6Qdj72PvaXlfg7DyqAZyOZ4oGw7YJXQZvTvJMtoHYhpJ9YrHkI6vmES1lzCVfwQv3wZVSk1ick6mpvYsVlZv9Pamm4omzdwlmI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794085243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bubpN/uxsjHzDvEIVexuxwjbif9uTaF8rKGPq8z7hc0=; 
	b=QUw24WDax6ceFmR2tNkOwT/oCwHbE1+CeudG9wdKfSUwTNpzLVCrvdAhwqk2OaNJlM1imkPcD+9Ta5Pp+8IfXuJGEb1nQljaUQfFgqoS4I29VzKk5PIPF4enQm0NC3WZELH6b6jrRrSTWWvfaSfaZ0AAfSJfeEW5abxlVoef0vM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=qk+U3okpjMaTGpGMpMcfIRAHcnZOEuk8rnqZ3wVyxZK0bmIw5mIJijXJ+T4mVUuFC7uQaQBDjISY+IkO/IljZqzhf5sp021qAR8WmVdPmAUUIvK5TxXgUaoCAHbdwJYLSMYHEp4tDIskb/R7eXIl0IXF8DTHQ9tN586lGxfieE0HM7aVhBjZOEsTQKUYShimc5mMvtu+oXoVflDqAhvkOc8OVt5qfrUT0jHRevntikucMH3f/bf9xP++we2J5PI2a9MuMTdTfEen+zAkyd8JgFc6jWw+SxdDAqQ9LsNWTbP6ajs28izpBnpAtnIV5WvsLMieddhhBleJo54jdFBWmQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=bubpN/uxsjHzDvEIVexuxwjbif9uTaF8rKGPq8z7hc0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794085241614579.3390642773406;
	Sat, 7 Nov 2026 13:00:41 -0800 (PST)
Message-ID: <f863a130bbcc14179d28c9a796dbdbc7ae2c813a.camel@rong.moe>
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
In-Reply-To: <11a8a3448ea82f594bdd46f380612ba9d703ccc9.camel@rong.moe>
References: 
	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
		 <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
		 <au5nUp4extfupCpS@localhost>
		 <20d824152b1a889b636ef9877b4d1a8e06dcf460.camel@rong.moe>
		 <c70af6c5-3d95-44c5-8f3f-b014178234c9@app.fastmail.com>
	 <11a8a3448ea82f594bdd46f380612ba9d703ccc9.camel@rong.moe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 04:55:36 +0800
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

On Sat, 2026-11-07 at 23:25 +0800, Rong Zhang wrote:
> Hi Henrique,
>=20
> Thanks a lot for the context and opinions.
>=20
> On Sat, 2026-11-07 at 09:34 -0300, Henrique de Moraes Holschuh wrote:
> > Eh, I better voice something about this...
> >=20
> > 1. The EC does use the battery led for alarms, and it also has specific=
 high urgency events when it thinks the thing will catch fire or going to f=
orcefully cut power very soon, although this was a relatively later enhance=
ment.
> >=20
> > Thinkpad ACPI is supposed to log a critical warning and it should attem=
pt to initiate a system shutdown (power off) if it ever receives battery em=
ergency alerts.  I was explicitly advised to do it this way by Lenovo bios =
engineering, in private, a long time ago.
> >=20
> > 2. Module parameters are the way I dealt with this kind of thing in the=
 past, especially if they are not mutable at runtime.  It is vastly better =
than debugfs for this kind of thing IMHO and the fan control was implemente=
d that way.
> >=20
> > But the default must be the safer behavior.
> >=20
> > > OTOH, CONFIG_THINKPAD_ACPI_UNSAFE_LEDS should taint the kernel on the
> > > very beginning.
> >=20
> > I don't think tainting makes sense as long as it is something you eithe=
r have to compile for and a distro would never do so as a default, or somet=
hing you need to load the module with an explicit parameter set.  It will n=
ot cause system instability, unlike, say, poking around the EC registers di=
rectly.
> >=20
> > A module parameter is a decent compromise IMO:=20
> > Debugfs is too reachable for userspace to mess with without actually do=
ing an informed opt-in.  People respect module parameters a lot more.
>=20
> Using a module parameter also makes sense. I will resubmit my patch [1]
> to adopt the approach, probably the next week.
>=20
> Speaking of tainting the kernel, I would still like to hear Mark's
> option. Note that a module parameter may also taint the kernel as long as

Oops, a typo here.

s/option/opinion/

Thanks,
Rong

> module_param_unsafe() is used, and multiple pdx86 drivers have taken the
> advantage of it.
>=20
> [1]: 20261107-tpacpi-debugfs-unlock-unsafe-led-v1-1-69b1f1e10c2f@rong.moe
>=20
> Thanks,
> Rong
