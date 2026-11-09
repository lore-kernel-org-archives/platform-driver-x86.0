Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794240474;
	b=Kz+D7GZnWmnm4a0CgJL9VPydiUN66+6PNAjn76gxgIJYAZeMEewjJjRhJIwt51V6Elj1
	 V+UPnxtOwW1mkOPNixV3U1XxDFa3WBcVVG858wb5UYKAHj0QjvuQAB7519HeBdUMhapn2
	 daiEPewT8u++sbFvF/3YQ44gawyFIja925LAnZIolyKznggd9nrHIb0qwANKKddVz/+rU
	 Q9hg7XmdgWsVfBoXtM+YP2gfxn3w9xlTY7f9Q5ROqkJPMZskHDjhrRTu4U8srHCxyhnpI
	 AvhAWPud6CSfZ4O/6KIfK2OSwsw/knEk4REjHRhEX1ZeEd7njt4AjvuOZexEoQ4Tt9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240474;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=ISKGLUpt1UYNERR6aHgvOeEKzjBVTU3SFzokM3arU+A=;
	b=oJtEKumJRarJCpWLO0gboJqLYvj0/oYvYiIbsc5kM7pfxorjqUE1n8XQ+i8vxAfpJELH
	 45cRrWnbquNPg4tI4qnq+FYGD5fnRxEl7BIi8GHegxf52oyO5AxpMGCTWxhZLEjTS4OJ7
	 BlN8w8f3KhBVgPuRqMHfd/33fSooWmqBhblDzUDWfxT4I7a1+xWITmfjX0Qxdfc8BiJAh
	 qd2yIROSWcLmGouPwvpNJVu556apYrpeWSg2ArTZlK2kylGwhUc3NIk3mDo/tSl6Itlag
	 fld8fOT9JaPNECsHGPOnaYVk/El2XfDmzF3dheG2MS82pe4uhnmlLMyh+GlX2+POn8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=h4lwjvwm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE848606A334;
	Mon,  9 Nov 2026 16:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE848606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=h4lwjvwm
ARC-Seal: i=1; a=rsa-sha256; t=1794240453; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FQ0Ou5TertaLNyixvqyYcdZGcyrMnpO2d6bsnzYtVML7BGebRRs5q4SK2y2cif7T+sTe8Gip0uAWkiD8xeIta2vbZcA3jD5tmAEPqZCBHzC/WfN2/AwmtoaM6oSW4zw/dWAUxCxymqHYl7IXLASPSDnL52wNsaxJYdq3Ami1yAk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794240453; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ISKGLUpt1UYNERR6aHgvOeEKzjBVTU3SFzokM3arU+A=; 
	b=CdwpQl4U+6gQ+8IX/Mv7nT0b9BtWKGJNUZobqSxn1qIG+5BR5u68e9vqZNddIOGeAZOg1+BOddwu4TLdExr2TXx00jdyWpHvOrpjR4seH4gqa1KApCVNDhijLaP8Zr17dRzIS/AeAgCIOZxRFh3ZjGS/w18U/0NyqeqOreJfGm0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=h4lwjvwmOASGTjovwixB1KTUzCTtwPXl+BDlY4Sd+VUkW/oovwsEi+HhWQsXm2mv/TdmrQUW9fAwT/iJnWHyYYRlihGIyVAyLdthcoJSHbN95Z6S4sndPvMu1lm2wMsAcOogz7BerUJXB203rW8EkYV7o2J93G11V9odGzTkHG/1SMhOOpQ5FMKGCYcpHFl2iWIU+3KkCgwfGEixJv76Eg4GeavuzW+c/g2ZYQu98LDyKQn4P1MojkwbXj/eMVUU0Ua2L1NH3sWSLsJKdr667qgbpER8AZ/DolTo+kx2vQA1YETnu7SC+x860CHx7eU36+eO5nfiWGXB5hp8Makgig==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=ISKGLUpt1UYNERR6aHgvOeEKzjBVTU3SFzokM3arU+A=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794240451784126.75966880679846;
	Mon, 9 Nov 2026 08:07:31 -0800 (PST)
Message-ID: <3d762fda1656de26395b6b875465e1dd4a2b23b1.camel@rong.moe>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add Auto mode support
 with dynamic max_brightness
From: Rong Zhang <i@rong.moe>
To: Qiling Zhu <kmatzkaczor244@gmail.com>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>, 
	mpearson-lenovo@squebb.ca, Derek John Clark <derekjohn.clark@gmail.com>, 
	hansg@kernel.org, hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
In-Reply-To: <avEuoeuFSwDUbbgL@ThinkPad>
References: 
	<CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com>
	 <a21d1b534d4b7c8cd27811e1c1f5c8be790cbdeb.camel@rong.moe>
	 <avEuoeuFSwDUbbgL@ThinkPad>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 00:01:20 +0800
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

Hi Qiling,

On Mon, 2026-11-09 at 11:47 +0800, Qiling Zhu wrote:
> Hi Andrea,
>=20
> Thanks for the detailed report! I actually noticed that the keyboard
> backlight OSD started working in KDE after applying my patches,
> whereas it hadn't appeared at all before. I didn't look into it
> at the time, so thanks for pointing out the likely reason behind
> this behavior.
>=20
>=20
>=20
> On Sat, Nov 07, 2026 at 11:11:08PM +0800, Rong Zhang wrote:
> > Hi Andrea,
> >=20
> > ...
> >=20
> > +CC Qiling
> >=20
> > Oops, this indeed needs a fix patch for backporting.
> >=20
> > Qiling, while you series will fix this, it may be better to add a fix
> > patch CC'ing stable@vger.kernel.org to the very beginning of the series=
,
> > so that the fix can be easily backported.
> >=20
>=20
> Thanks, Rong. I'll split out a minimal, self-contained bug fix
> before the refactoring and feature addition, as you suggested.
>=20
> I'm still learning the upstream and stable backporting process,
> so I'm wondering whether it would be better to=C2=A0
>=20

> submit the fix separately or=C2=A0
>=20

This is preferred when:

- you have to postpone the full series for a long time (say, a month or
so)
- the fix is very urgent
- the series is far from being ready, i.e., still needs a lot of review
and revisions

> keep it as the first patch of the next revision.

This is preferred as long as the next revision will soon be available.

> Submitting it separately could get the fix merged and backported
> sooner, though I'm not sure how urgent this particular fix is.

I don't think it's urgent or far from being ready. Thus, as long as you
don't need to postpone the series, you can take the second approach.

Thanks,
Rong

>=20
> I'd appreciate your guidance on which approach would be more
> appropriate, and I'm happy to follow your suggestion.
>=20
> >=20
> > My opinion:
> >=20
> > If auto mode disables keyboard backlight most of the time, it should
> > report 0. For example, when the auto mode if backed by an ALS sensor, i=
t
> > should disable keyboard backlight most of the time, because most users
> > seldom use the laptop in dark environments.
> >=20
> > Same for proximity- or activity-based control, as it only illuminates
> > when the user touches the keyboard.
> >=20
> > The ideapad-laptop driver and Qiling's series have already taken this
> > strategy.
> >=20
> > Thanks,
> > Rong
> >=20
>=20
> I agree that mapping Auto mode to 0 makes more sense. Besides
> the reasons you mentioned, the Fn+Space cycle on my ThinkPad
> is 0 -> 3 -> 1 -> 2 -> 0, as Andrea also observed on the X9.
>=20
> Mapping Auto (3) to 2 would make the reported brightness jump
> from 0 to 2, then back to 1 and up to 2 again, which seems
> rather misleading, especially since Auto mode does not represent
> the maximum fixed brightness level.
>=20
> Regards,
> Qiling Zhu
