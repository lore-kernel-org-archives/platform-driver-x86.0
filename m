Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792855983;
	b=TZRhrWrn+w3x12/76LT80++hyTvjQmbNWdbIQdVXHoQ/44epvKgzZ/deHkix+um1zciQ
	 3Rfd8rkw1BguguILiZ6IRhrLeiI/H7d0NB4YYg+ra4wDjYOp+sX/Lbgc+gl+H7WCWLmgN
	 AHnbNGE9BAdfXCI9LX+harhLdNQbLXb/Bjn+1M2vCJ1VTxdK/3ZLJA5BllUYveQiVWRGg
	 73YdxctyDZeT8Uh/DYQ9gevv9yZQUlJhtLJ394ZIGQ5PLRJUTFrYv3IZOVF4sJftld1eb
	 JGci3pNZ5sB83pDf1heQov+X/SjpTU+b6aVriiEpLCLm7j6+HD5XIpk9vevJwp9IzPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792855983;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=fDjbXdlTu4a88yMI0jTQlxuAUw20WpxuM9mcw2vGQgU=;
	b=eAl+ouolmWIwhSyCLyphiKdD6bdPn2B4Q/GnPQCvPGwCV2JdTYJnnLu8V2VejRoPB0lf
	 4OAe+8QJA/nOyjzQNKkZGQSLo6yE93OEdKzp/F81XBTLS6IAorjlawGrEWvmQr6aNovrS
	 t8M/6usvnzkhWAqtZ7vHPr3gxAfGLrVlqYUuy8ynGvk8aRK2ceWTc7wW81MTEBRe1P9mP
	 VmM96kANxBAs2fGFUpdHb/brSVc9btls+vMKw7uvzXJtqrNmo0MCyYhH8OEOqMLTD4twn
	 JKfbRyG1cNbt5fGF6JxdD9/k9RqvjHrsmfrLVJxYMBtm34tLeHn+g2w59MJzkdWa3WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=EV7CZgFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505A0606A31A;
	Sat, 24 Oct 2026 15:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 505A0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=EV7CZgFS
ARC-Seal: i=1; a=rsa-sha256; t=1792855972; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YjGOzWeXrL5xSLlyw5NPMJ0jZvYslGtqHtViI6sLicXaIs7pnSpT4Xxsxu+mFcwGn2VzOiJICwQqwWA8/rA1Yk/mo4YbsJWd0vdRJ/9e/8jpVr3O8HpbC/u/DbZfris5bTvVR9Mtty6tncyD1VB9Q2DZYBy9BusxMFd6ZEVDXxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792855972; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fDjbXdlTu4a88yMI0jTQlxuAUw20WpxuM9mcw2vGQgU=; 
	b=cDPwombjdSEEu5ANyLe/GenDN1x4R6hx0RPGZsLyLRTwBgfOi7JIy0zZRB8s1Jbb1fqnBKZdb+FGML0pLtaWjrO6fuAWCKPvG+NAcD7i+Lon+wsUCLn8OpsCjMsE7fwWza6f7JwkVdH3O+3E7RrVhKliolp9et9/k3yGtVo7Q8I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792855972;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=fDjbXdlTu4a88yMI0jTQlxuAUw20WpxuM9mcw2vGQgU=;
	b=EV7CZgFSiFTInEEscBzbYXetXqAbgm1ysNTTcJVlqloJvrhbfBARc1bVhxLL/9PX
	Jgw9XhwLoJz9FNUaAtHXndfc2tB5dMhFP1HgEN6uWarQ8Ffw18+GtmoZcCBANQbR6Lb
	aIfrT8XL9WNbQBrP5pHf0Cc6eKkkicZh+P/myEoH3pfyrlOrlFMp2M3qYjcsYln3ehq
	Ym+Ryy2ASEutAd5YIp6jq1yeigX/qKLI5FjjsfefFLMcbYKowab3nBSl0gOfM2TTPD6
	aAebnL7783HvImBo/sdyLB/6MPhKmxOPB/1mSuiw6EYevZrBuR0PlqzLOecGwQp7XH9
	yStHhQwhhQ==
Received: by smtp.zohomail.com with SMTPS id 1792855970020729.9714410152917;
	Sat, 24 Oct 2026 08:32:50 -0700 (PDT)
Message-ID: <5bdb870be988333df200ac7d4904dd1bda6ef52f.camel@rong.moe>
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: do not poke keyboard
 controller
From: Rong Zhang <i@rong.moe>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Ike Panhc <ikepanhc@gmail.com>, Hans de Goede	
 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Maxim Mikityanskiy <maxtram95@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
References: <4b2f60a7ceac543bd8b889b9c0772b2c@gmail.com>
		 <8cdbdcb893e2353e0ea2fe919e0c8a6a53f8b683.camel@rong.moe>
		 <7b21717e80a7b779ab94d964ca40ee68@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 23:30:06 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Dmitry,

On Fri, 2026-10-23 at 20:20 -0700, Dmitry Torokhov wrote:
> Hi Rong,
>=20
> On Sat, Oct 24, 2026 at 10:15:56AM +0800, Rong Zhang wrote:
> > >  static bool ctrl_ps2_aux_port;
> > >  module_param(ctrl_ps2_aux_port, bool, 0444);
> > >  MODULE_PARM_DESC(ctrl_ps2_aux_port,
> > > -		 "Enable driver based PS/2 aux port en-/dis-abling on touchpad on/=
off toggle. If you need this please report this to: platform-driver-x86@vge=
r.kernel.org");
> > > +		 "Enable driver based suppression of touchpad events on touchpad o=
n/off toggle. If you need this please report this to: platform-driver-x86@v=
ger.kernel.org");
> >=20
> > By re-purposing ctrl_ps2_aux_port, you are breaking its existing users
> > *silently*.
>=20
> I'm not?

Yes, and no.

When only focusing on the input events delivered to the userspace,
nothing is broken if everything works fine.=20

However, the methodology has been changed from hardware-based to
software-based. Because of the fundamental change, it has the potential
to break something if some users depends on the side-effect of toggling
the aux port.

While my device never needs the quirk, I can think of several useful
side-effects:

- pause the interrupt (and hence pause event handling) to save some
energy
- prevent the touchpad from waking up the platform
- reset faulty touchpads

By switching to the software-based methodology, all these capabilities
have gone. Of course, relying on these side-effects is a misuse, but
relying on the parameter itself without reporting it to the mailing list
is also a misuse! More below.

>=20
> >=20
> > Please don't do so, but rename module parameter to reflect the new
> > behavior. In this manner, the existing users should at least see some
> > clues in kmsg.
>=20
> The purpose of ctrl_ps2_aux_port (introduced in commit c69e7d843d2c
> ("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on
> select models")) is to let the driver disable and re-enable the PS/2
> touchpad on models where pressing the touchpad toggle hotkey only
> toggles the LED in the EC without muting the touchpad itself.
>=20
> This patch still targets the exact same i8042 PS/2 touchpad devices and
> achieves the exact same user-visible behavior (muting and unmuting the
> touchpad when the hotkey is pressed), just by filtering events in the
> input layer instead of poking the 8042 controller behind the i8042 and
> psmouse drivers' backs.

Input events are not the only user-visible behavior.

>=20
> Anyone currently passing ideapad_laptop.ctrl_ps2_aux_port=3D1 on their
> kernel command line or in modprobe configuration will continue to have a
> working touchpad toggle. Renaming the module parameter, on the other
> hand, is what would actually break those existing users by causing the
> module to reject the parameter and stop muting their touchpad.

A completely new behavior reusing an old knob is always prone to break
*something* in a obscure way unless users are notified about the change.
Breaking something with a visible warning [1] in kmsg is much better than
potentially breaking something in radio silence.=20

We don't want to support poking i8042 anymore, so the use of
'ctrl_ps2_aux_port' is anyway becoming unsupported. The parameter was
introduced only for debugging and is expected to be removed at any time.
If users don't report their use of the parameter to the mailing list,
they are already relying on a broken setup.

By renaming it and breaking the unsupported setup loudly, we encourage
users to report quirky devices, as well as getting rid of an outdated
parameter name.

[1]: ideapad_laptop: unknown parameter 'ctrl_ps2_aux_port' ignored

Thanks,
Rong

>=20
> Thanks.
