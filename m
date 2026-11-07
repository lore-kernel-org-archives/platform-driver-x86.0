Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794064601;
	b=WtdhaUcraFkeB8WA+NnMkZ2nCDOoewOy7+0OgMgdz26Zw3r8PA8+/bQmqo/zD5Sd8/+c
	 VoCi8GSob51OfOCpREgfY/EbmlxWq6SN+igpjdnB08HrJPLO2mtqGty06tBebD1I9uqiq
	 oolumeSZJc3MCaO6H4YfCvTjTlUwYYW7cVE2uEM6gWNPwX6A5l7p3+0zVwPHnmvGBjT8R
	 R0MwjJECpi1GCt4zo1QYLFp1E9vzFhOh+1Ndd8s3IMQiAzuIytB4egVOrmtWEuGweeCKT
	 mjRWc6zs3jBZAuid3gnMkPwnaOifBltGdkR+504uinLzrJG39HxGl+eN2/Wx6fDgPAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794064601;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=DCh2w0YcEQvfVoCFpifEijUBqer1lHley78UNTzCGUk=;
	b=sIIqr6x/S7RrW/5RRP4MTR+obT0J2V1BSAygjssPYgwUGs8U5oHODLw2Ym3XeQ4nabGX
	 VV8PhORX2MOrgOZ64b9v+2HQv23AB3G+1/72r220ZBgPROD0CYA+fhGGkQZTIaeISDyeG
	 SX5UYoq82siT8DvTiUK2ebc45IvZMGahlE8h5rWt+r/EKddcdHJ3vX+QR72qKtFeCUy/3
	 MwVuY8KaN2VPgDqVWiQLwyM8MHZ1XBNBo6aJTgAUskLZ6pTciOZXlPOVfEva6+53UNfHm
	 Jpy6X0qna+STV0ePtksqoVOk253yfaS1QA58ZEU9nrkR0KA2VyVBu85TVgtd/3DsOPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=NjXoibVj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550EE606A334;
	Sat,  7 Nov 2026 15:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 550EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=NjXoibVj
ARC-Seal: i=1; a=rsa-sha256; t=1794064579; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZsqBlAj2vV2mxzxvWhhTl4XIQ9H8hcyomFejpoz1U+lsDdumXAP2yKdXcqIm2UspWnY2itXDKP4iGsOeqZsrocmtax6i/CZfWkW13vXy2/Umaz5H30aBg4oU6fiJ9tPV+24u/Si+BQM+ALqF7ApBgTyzKuODnfJbD6Y/eSSXHTY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794064579; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DCh2w0YcEQvfVoCFpifEijUBqer1lHley78UNTzCGUk=; 
	b=M4oIVqbQqYdwY3rSzZ16ZnYnhOwoSxWPS49hGHwWKHNG3tMRjdWFWN+We/m1eAN4vMVy1nIkCJ3UCMj5E3FZ1NQyWV9WgjI8O+LJVYzPzEWZEomdAsl195pWA14BCRIAcgnehkg8qUmws2dw0RYKPM5JqkbjYTXN8AdO3OzCx4s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=NjXoibVjffR6twPqBvR4ZrtzNcIrZg3k/58InUNKzIfMCkqTGc75iwmUyv1FkRRC+4/dKbEv1XwJZVVj5zmTQ+RYw2QkE9mIvLbVayFAi7y0j/qG+7f0FN9c2KzSw7dZn+aN1BWY1+pxNYyvPAX1V2X5Kr1ek8cpdSyerO91XGxgf6SmQXrHtPzwLae6iZ1lo3BRnAGFi7sBtz34O4gXBzjhNpBWv5rcY1pzVHOypkmes5IPnUorGQDWAVZYGU6rUllP8FS1/6+I42YB7S3F1pp7d7qONF1ISzwwnIuVWgtbS6E0Y2dB26HDqLyN3sZsdZPwF8QRlsXlRE/FK+rKZg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=DCh2w0YcEQvfVoCFpifEijUBqer1lHley78UNTzCGUk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794064578431597.2145539776791;
	Sat, 7 Nov 2026 07:16:18 -0800 (PST)
Message-ID: <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
From: Rong Zhang <i@rong.moe>
To: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, 
	mpearson-lenovo@squebb.ca
Cc: Qiling Zhu <kmatzkaczor244@gmail.com>, Derek John Clark
	 <derekjohn.clark@gmail.com>, hansg@kernel.org, hmh@hmh.eng.br, 
	ibm-acpi-devel@lists.sourceforge.net, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	vishnuocv@gmail.com, vsankar@lenovo.com
In-Reply-To: <CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
References: 
	<CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 23:11:08 +0800
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

Hi Andrea,

On Sat, 2026-11-07 at 14:23 +0100, Andrea Rabbaglietti wrote:
> On Mon, Feb 23, 2026, at 6:19 PM, Mark Pearson wrote:
> > Hi Hans - do you have an opinion on the path forwards?
>=20
> Hi all,
>=20
> a data point from a user, since this thread seems to have stalled.

See https://msgid.link/20261101100123.28749-1-kmatzkaczor244@gmail.com

>=20
> On a ThinkPad X9-14 Gen 1 (21QA, BIOS 1.25) running 7.2.15, the
> firmware already enters Auto mode on its own: Fn+Space cycles
>=20
>   0 -> 3 (Auto) -> 1 -> 2 -> 0 -> ...
>=20
> so with the current driver tpacpi::kbd_backlight reports brightness 3
> while max_brightness is 2, and brightness_hw_changed emits 3 as well.
>=20
> This is not only cosmetic. UPower 1.91.x treats 3 as out of range and
> stops watching brightness_hw_changed altogether, so the desktop no
> longer follows the hotkey at all after the first time Auto is reached:
> https://gitlab.freedesktop.org/upower/upower/-/work_items/367

+CC Qiling

Oops, this indeed needs a fix patch for backporting.

Qiling, while you series will fix this, it may be better to add a fix
patch CC'ing stable@vger.kernel.org to the very beginning of the series,
so that the fix can be easily backported.

>=20
> Whatever interface is chosen for exposing Auto mode (separate attribute
> or hw-control trigger),
>=20

We've chosen the hw control trigger approach. The relevant support code
has landed in the LED subsystem.

>  would a minimal fix in the meantime be
> acceptable? Following Hans' suggestion earlier in the thread, the driver
> would report max_brightness (2) in brightness and brightness_hw_changed
> while MLCG says Auto,
>=20

My opinion:

If auto mode disables keyboard backlight most of the time, it should
report 0. For example, when the auto mode if backed by an ALS sensor, it
should disable keyboard backlight most of the time, because most users
seldom use the laptop in dark environments.

Same for proximity- or activity-based control, as it only illuminates
when the user touches the keyboard.

The ideapad-laptop driver and Qiling's series have already taken this
strategy.

Thanks,
Rong

>  and leave the ABI otherwise unchanged. That keeps
> the 0-2 contract userspace relies on and is easy to backport to stable.
>=20
> I am happy to write and test such a patch on this machine, or to test
> a v2 of this series, whichever you prefer.
>=20
> Thanks,
> Andrea Rabbaglietti
