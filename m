Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB6D1B87EB
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901559; cv=none; b=urrVJmDObbnq1kkky0ys9m6TQBK586/s566gMXNanv0eaWZNtCZOZ9u9uLiPZr+P+sESu+xAjSAt49T72YJzQozZaJYczVjYo9Qd7JxOoHUX7qBWDyoFarIAdIVqpH6gNum4lMIRUX5aeLGw3hVEUR+1C5pPlJtCGdJoxv/ox3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901559; c=relaxed/simple;
	bh=sRlEJXpqcaC/yZWwfLdNq38Sj3JUPA2xiXgdCt3BaoA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QgWVLiWoEbtkQEbsOuxFomQsN+LTYMchtZD+/CY09+kbl0QJCgFCMYECiE07bdsbj3so1O8bdwXVuMNq6kwbnQ/6qehnoGf9D0Rvm1Okai2D2EjueHLrSHMp5oh+3Qn+zEdekJR6zZPSwOxLrU97BhBcO+7S+R/YoDLBA3nmjK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YgfSgBmu; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YgfSgBmu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1758901547; x=1759160747;
	bh=sRlEJXpqcaC/yZWwfLdNq38Sj3JUPA2xiXgdCt3BaoA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YgfSgBmu8sroVEPA3fDRIw5CLbUGVDgKVSpifB+LisSkFuZKR/52SdWbaN9RWeqRF
	 a4uo/QqgxX5tdyr29CTWT2L0emRQCLqOOrIYcuP/uERxDI7ZvTIA0W8w4oJv1sV1dq
	 3sNbssuOou8fnDd9I2d44EB0qUh5v1UMu4qePNBHwFtlrtFS+9tOkJT3QSazKSh7ov
	 cm77xqu7csbSnqU52beGgn2TCOOg/h0OTG0TyVKzaSpGqcrHxphMKGaBtLytxWz9v5
	 aOJoe5VvgJPBUjTiSAa6irpztZW/zu9rLEv5gLeesKEW5pPnohmurmFrMThCdIdbGL
	 5eTtDlQS8dw2g==
Date: Fri, 26 Sep 2025 15:45:42 +0000
To: Armin Wolf <W_Armin@gmx.de>
From: Bugaddr <Bugaddr@protonmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: [Bug] Acer AN515-58: Fn+F10 affects display brightness unexpectedly
Message-ID: <Rp-IgT7jUeYXNJHRkwjBtmDjRy1mJxY-pA5rrxMkR0J2gaKOyoOvUAi4QP3I94Fe28zToRzbcp9SURVpu8_wi-R3Dhz1VT6fxRhI398mZ48=@protonmail.com>
In-Reply-To: <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
References: <cwCuSGwTSU4nQ_hM-qWPNAzJwU2x4qLe_eo0tkxIFIycTeRWmDKjX7IzxJHcOVUPx_xAwjYC3GOV7MSk_LIqPs4HElFbPoSzYIZV5BHWe8Q=@protonmail.com> <1536ce4a-5844-447f-9e86-197c71c6d364@gmx.de>
Feedback-ID: 43498376:user:proton
X-Pm-Message-ID: 112bcf0c312b6f000ffc08e61d3ce4b7b991cb64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> Am 13.06.25 um 19:12 schrieb Bugaddr:
>
> > Hello,
> > I'm writing to report what appears to be a bug affecting the Acer AN515=
-58 laptop, and I would appreciate any assistance in investigating or resol=
ving it.
> >
> > When I press Fn + F10=E2=80=94which is intended to increase the keyboar=
d backlight brightness=E2=80=94the display brightness unexpectedly decrease=
s along with it. Furthermore, the display brightness continues to lower inc=
rementally, until I manually press Fn + Brightness Up to stop and reverse i=
t.
> >
> > After pressing Fn + Brightness Up, the display brightness behavior retu=
rns to normal, and the issue does not reoccur=E2=80=94however, from that po=
int onward, the Brightness Down key no longer works.
> >
> > This behavior is consistent and reproducible. I'm happy to assist with =
any debugging, log collection, or kernel testing as needed.
> >
> > Best regards,
> > Bugaddr
>
> Hi,
>
> can you share the output of "acpidump"?
>
> Thanks,
> Armin Wolf
