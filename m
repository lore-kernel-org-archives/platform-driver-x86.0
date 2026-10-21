Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792554132;
	b=R04GMIceTyXn+ZON+Oz5ZwveSPvhPHZMfLFfN0dJhPptTIqe53g5wyTNoz2oX1PT36bO
	 /l1rlub3VWv+BNeA5jW/Ng9JfcTtmXy+J3joPXe0/3p7OSOF8mvGXpB7oJnMba/4NxXB1
	 dwg38z+8ydU2DYkwhJ96QjkSiaHYOUrY/wfpFxx8pgrfm3OeZGfGdDxKLulbI5OSMSjrr
	 XPbElaHcXNsaWT/l3iDhEsZGrv0wIUEO+dojDxn1HDeNWeHrpEnQ/S1NFIXm3Jis+NEcq
	 3EWek3GyrlYLxipLmtSHIA5n8uxeN6B/Vn6BBa6jr07E657pKFJWTbV5C4UOr+mhLJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792554132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
	b=ZMN9Q91fr4AaBwrmR29nP738HAPE2ZtaST4FpRIW1/4yhi6+n1EaLCwLm6gRiuY6Bucz
	 iEcvgP2UTE/OeSxbdv+QV8k7ACrwKBjIv3A8ZeMUxnJzBto/qKxXt4Vjz4Q5xHnS4x0o6
	 MsYrWhhxwcZMljZfc4EL1YiqM49egIh4tMOTo50mYAIbzcqRtT7dRbWM2L8eF1Zpirpgt
	 AupZ5i8bO4+pLhhn5vZx6ShqIAtOQQrTrMT52EtIso1PbuYPKGVfRQ6up0AHaJCd8lTqt
	 Gzs6C+xeHyLltMK2T1d6tyudnve9dVg/kTOCl5+/LmrORV0lFKK8oyTqWt+sgf/H9XQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fdr8XTCc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D22606A31B
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 03:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31D22606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fdr8XTCc
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c434376dbebso52789066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 20:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792554129; cv=none;
        d=google.com; s=arc-20260327;
        b=NI8XMAvgatx9SKCrZVO20iXWebnMaDhv8O/1xkkLM3+BnqjeKzbxFt8dZPXjXiC2Rx
         4ptWUiXNCcq26Hm8P/0bS8eRIguFA0F/zg5//V8abdr34ubxRgCEZ3fLQ5TY95UApJ+S
         1IV43t+bm3Qe0+4QABGYuNaiBxX7TSDDtCG5xJKhXyEAygyAWb60hOYnwfy9w3sbFBVU
         /TdrN8FA/EI7PMJDn8fKoWQJkdDAnTUmGujYqGCKfq7dACtX3s6YLhDiC+0Cp7o0Zyjt
         gARglP/NKF0/7zPMVkI7WQNO2HUsz961b/CkowOoBAbS1O4bp+38xONr8O48NfUMei/+
         qfMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        fh=fTxsDQ4Z059h63fEHrQwIsbADdmpHBMdy47WGbn+NPM=;
        b=oFnJ2Q3tLIsdsd7BRMM9P+SUEsAyN5FxH86gM2WyeYbopXmR04okmBeHWX5RmYPIIX
         KQP6PaZtAbdsFcmtQCFTt9XaWZ/eekG7pBVeMsKHpoGITZrhAl6jMX5CYV+ZeiKMetg0
         FEg4E+Yu/3EWdg8LMLkCIsN87pFZhj+0/nm0FUFIJcry3fvH8cQx3AcjEVYlpkwE+9re
         J8in/XPW3GvjLulanvN1TnPMxHSpBsYScno+6QICDjvKeKDLkH9mPKNHGPfZwH8wSPhj
         PqmUjw7iS5Z1l1dAsDebiVdBu49xfwIwAZ5YZ2AN50Au2WdCWCedBuyboO9ZhymI1Xhx
         7r2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792554129; x=1793158929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        b=fdr8XTCclouSuGw09TYrAEEcJg7A9xLzXplGn13seFUteBNT8XQ2Jk7tXT33UG0p7F
         KbYa0QRdgodG1q9KC/l0eEVYt4PTAnmeMVpAh5sjtUezx5yNBAdGu5X9D+iOQjhx/cea
         WjLE+AaCkdceQw+O2VEtr4HDo//UuLNyZ7YD/awC3DDR9bDxOw8Tgt31uhiVcOan2LV0
         slHIWfuC9e09mby/ct081rD9UsBugdBk7RQVhXI9cKXDvdwnhRT2pbQqlKTA9McJIlCk
         1+7tPkezzJ/rorluB2FbqOxU3YB5t/SkE0Sh+2uEq44j04pnvieK5fryQD5/QkPeUZi6
         QrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792554129; x=1793158929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IeaSzkQDMTFDSwIXhXuKa6PQEsom42E15utOhKCt/2A=;
        b=H4zCfbDx/U7EJz7M/iMJzJl4D5WjWsl6mo7YZBGeyKI0Q1EbCK8mjZSKhj1eDxvjjT
         Ju8s6Xhjt6I6ta3DZAWoAtCxKlC8AhQwgyVw8nUhSV5oWFpkLeXItQl070t84m0DNd3l
         2gwksqmUR1GGVkiL4NFDoJ6RDSwgWpBshztRDND2AullAlDcw07nx75OH4DXUBcCQpb2
         gG3TB0jzoTa6eQVa7bTRDlkUt2Z81v6i/3H0uhaT93JzfmFN+MWO0VOx4w6438wz+bhN
         Q1XOtjliavhHXTbJtFy2ZsmCSeN1G7HXFwedSVE3TxHb2I/zUUXDqTONUtphIB7aIRBJ
         7fDA==
X-Forwarded-Encrypted: i=1; AKwUvBx51MC9eaugYZk2t5cBe8oxr0kfyZ/RiwP8yOXz6Op2LbNuB8N0v/lbQIcHovmvF3xIAJhACaMB7hN8J9DPYh2fsV6Q@vger.kernel.org
X-Gm-Message-State: AFq9FYIWia3aM7p2MKj0ZbbX0toaszLdIg6o5skhwCtRZwl2xsSUx/ON
	CRKsec951Esg0qC2Ks564v3mMW2UWNZUAWud1AkQH23/9YoWdTqe0qzPIs7pXq7485QSTuTlKT0
	FYd4LzXjYgDxBsaUEXbSVw1Ucgjt9Me0=
X-Gm-Gg: AYBFou1+4OPS3hVvul4RHefmf+DVl2BCgve89zlX3QiNi1DnaomVLbGlgyOcgx/IVsK
	+eZDctqCzmXZl8RBHhOMceKJqH/z8pcKpXbh56jhvYdP69gU0mCkhRGIwVvo015Pg4mXh2HI/nr
	zzODR8tq+feEh9ZXNlUDYmySeMhNffItFvldglwE5Kt5vQ/mARU0ZBWpuxQgp3TmbVV6YXX3fIf
	DJN5mGCYQ2oiqEr3l2LhqCY/mhT2gWwFx47txpZsIR/JACGGpPlk2C65+QiGMFMQpEFnAfWbEqU
	jRtB5PSrFVh00mtjF2y/vYxChqoHJQSZGqQP6+USw9rdbscbmdcOIZ879AgjZ8vPOxPONpOHtlY
	zftJiTG3pAPui2NZGgDlmqkfy5RS4W5EJbzrkGjp2
X-Received: by 2002:a17:907:9723:b0:c29:4b57:503e with SMTP id
 a640c23a62f3a-c46791a894bmr80209666b.1.1792554129390; Tue, 20 Oct 2026
 20:42:09 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016025352.230535-1-meatuni001@gmail.com> <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
In-Reply-To: <29c3e4a2-9d6a-60cf-d06d-85152a40a703@linux.intel.com>
From: Muhammad Bilal <meatuni001@gmail.com>
Date: Wed, 21 Oct 2026 08:41:57 +0500
X-Gm-Features: AclHuK-ireUCJptFa_FX8V4hNSMKN72Ng1R0P-ZWBFx4NRNhVt-8-KKpzPkwUPg
Message-ID: <CADqcGBkV4iE_0j6usv6TvV3K9XGUa0L9J-ebUkTLsB0NBYzTHA@mail.gmail.com>
Subject: Re: [PATCH v6] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

> Why use n variant?
strnlen() keeps the read within count, which is the size of buf as far
as this helper knows, so it does not depend on the caller NUL
terminating the buffer. Both current callers pass a kstrdup() copy, so
strlen() works too. I can switch to it in v7 if you prefer.

Thanks
Muhammad

On Wed, Oct 21, 2026 at 2:19=E2=80=AFAM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 16 Oct 2026, Muhammad Bilal wrote:
>
> > The input is copied with kstrdup(), which stops at the first NUL, but
> > the full write size is passed to hp_enforce_single_line_input(). With
> > an embedded NUL the helper reads, and can write one byte, past the
> > copy. Return -EINVAL if the input contains a NUL.
> >
> > Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.8): writing "A\0"
> > followed by 4093 bytes of "B" to current_password 100 times returns
> > -EINVAL every time, without reading into the heap.
> >
> > Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
> > Cc: stable@vger.kernel.org
> > Suggested-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
> > ---
> > Changes in v6:
> >  - Return -EINVAL on embedded NUL instead of limiting the scan (Ilpo)
> >
> > v5: https://lore.kernel.org/all/20261007134711.473857-1-meatuni001@gmai=
l.com/
> >
> >  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/pla=
tform/x86/hp/hp-bioscfg/bioscfg.c
> > index 876fc35d035b..e306bd8b1e72 100644
> > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > @@ -162,6 +162,10 @@ int hp_enforce_single_line_input(char *buf, size_t=
 count)
> >  {
> >       char *p;
> >
> > +     /* buf is a string, so a NUL before count is invalid input */
> > +     if (strnlen(buf, count) < count)
>
> Why use n variant?
>
> > +             return -EINVAL;
> > +
> >       p =3D memchr(buf, '\n', count);
> >
> >       if (p =3D=3D buf + count - 1)
> >
> > base-commit: 8667bd30fd033295b3038ce374c551d1059538ba
> >
>
> --
>  i.
