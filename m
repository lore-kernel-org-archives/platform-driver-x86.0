Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9503E403150
	for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 17:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866729; cv=pass; b=Us/F2ICxySZ1sP2DvLfJFDv/meQplPmUB46ceFxgRgJlFDi1hT9a9CYtwnZpSB4N325L9rLqbgvSTkiGDFXgOsyGw3bCzawmYFosWmR4DXDkYLHilo9mxVe/Se5k/KR5ks0T+q+wRs9E0pWBjVLZlIyBatyetsVuIow39MFc5rA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866729; c=relaxed/simple;
	bh=qIODy0xZQrxKlNCjOm3+Y9BzccpJea0CfBT6k3BN8rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVgRjcUgbSRldgXjq2/y8A77rb+IVMepXNJI/0xLjEr7snFIXBZ6N4hLcYVYBqQ6tvfXHVZBJS0hA2DO3Bg/u7UtYe1BagSXpjRh5y8sYxxnVPFy/+0il2aO5TwpbxffJKoYEjK4u+Qn/6I0wDBfgGbWiM3rJSVCDcY2PFVV7EM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnfC9ka+; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnfC9ka+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so17971a91.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 May 2026 10:38:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778866727; cv=none;
        d=google.com; s=arc-20240605;
        b=DFa16Q9yhsSxrx1JkKkFCERRC2XNFTjvBJNDlv+i2Y9b7O5KRMHxlI03g/NERDYHlW
         dcFmy8p3BV/M6QZ35JZ+QjGYvPvtXpfLcIqeVeZZ4WPGrsNpeZnS7QWnJNkTP4tZ5+fj
         SRhpvyAdHsn6tMuZstOK8+xvvZszf9CRjisazlCpqmz8X9L7LFouXA86A7jDH6OHxeBe
         606KTP0XFQ0WwMuta56PcLlCz7VdaAtxPUsW/NR8IofHsRJkUPdbd2RDEspklE7/kHYx
         Qgh5P/BKRbmjxe+en3ysWXxQXvuAQjUVixkl1E8+RkKz81sYaN0S6etdjcA1KI1k+1t7
         55nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qIODy0xZQrxKlNCjOm3+Y9BzccpJea0CfBT6k3BN8rM=;
        fh=fuVEzNYr/RhervohcBNQqV1Yf9ygrn2EIGgBOmUaaTE=;
        b=MtjZG5FmKwuWPEttcKMsD6fHfQILiwormK3bL/nfQc8UR8lOH33coyWddSx7tb7WCy
         b+rw/vkqY4zLPeAd8mMXuXNG+I0/MhQgRfSKmGiTBx1OwlJDx5KkOWZy1cGks1KWepjE
         oClkXM29HY5s5Y5N61WxKwGnZ2I84bZa43lHwVt5OzYSF9mdnw4YQP0BnXpkbpEBKW1r
         nyF9Li4CZcbLQXudvby3qezTI3QfLM/Q3/8LJC+abOx25Ol9AtezX0C9XOPOtUM1iNsb
         1R7KAVSv60UpcJsvke9bwZB/bVjZK8jcubg45t47fOdsWiZQ7upTLd6bnwJGbq6cTD+b
         /Grw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778866727; x=1779471527; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIODy0xZQrxKlNCjOm3+Y9BzccpJea0CfBT6k3BN8rM=;
        b=EnfC9ka+93rvCmVhwHSNwc7lx5eqpBqiv28u+GH6GEL06IBeyiM4YzF8rF83//RmjG
         mb2nCX9UbmfTNe5oNAdMCbQ+FeE8SX5AkRGB5tlFRxMYC1tXRKOc/+CPH5XzLwW4l5Z/
         POatst4xWB0EiOGvtwHQMzXLYJUQipoO+0l+cwhrhjCfLHNtThwzJCxXkBX9a4gTmDif
         5r5pV4+hYP3ULLxJaU0XJsqWa7UhHdkWlSozcfpW1Og1XAQhG7ZIKbI3Zto/hsmzS2eQ
         cSP5bUQ9NtkUY7UqZD5IgvDKthU+yVz0043Pa6iICVwJ+Ls36Ezip+7ItriPGdyP7cnN
         vLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778866727; x=1779471527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qIODy0xZQrxKlNCjOm3+Y9BzccpJea0CfBT6k3BN8rM=;
        b=CWIHVRaqT3WBS6mV1FvhXCfuEB+F7bqx+uoOE40RUDR5r4/mzCR7FNqC8a4ImFRCKP
         0cvTnjwMsUpmO6YcMY0NXS9J9tRE9nkim1qmaLqpQAiqcWYDC5F/WpxENry8L1rmEN5q
         UTrT6kKxP8f2vER+3HvCM1nzzIG59s9GJwvlewsYWMv+3Gv+HyH5MwRl4LAyZCTnW/3t
         /7X7OWJF8T7ofmHilGduw6sp1i7yt5DyvfYol+V3hgKbcC/HrWA/ci0X2gv5Jb3hccHq
         7ifBLFlLEgcjMqxC7uBfpm85cjpxuLJTCHMv07ykNkQcGmHDlRx0IV28lesUW3mZaTtc
         FB6w==
X-Forwarded-Encrypted: i=1; AFNElJ/clA6PhCuffV4t3EJb1pX/7XZGE8aJWjL5SrB4BVs4UoNH3MbCAZ3EZmZUhgBUU63bD8aVzqUT7k1SLaVg8G2XPNlx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyugz6j7tM5Jb6y6R21XSaxk95mjd88PaQE7TLdq8P/ElB6WgaI
	2FZ7vm3jCxtEi/zHQbSmpDV/E+U0MEi6fX1Iy7WjNCCX5iPHWxC0wXsiF9WmcdrgEbpUi/8RMdg
	FUi2RABK+r6GLJscfyf5L/Gt0vaLrdF3Os8lPihOfHw==
X-Gm-Gg: Acq92OF2+iJbhoQXOXnn1tZQpmACN6zAyMFO4TxwJg1MAH5zFXUdWnAUPYpHRgX0BYJ
	gw3UQkT+m6mQPgsWaSW7BG9J39EZfiuLoeukMmnLHpBJ015kxHllvoTZvgGq3zUuwUZsklxEQ43
	z9UAC8YvpO5F6zK6shYZ7dwm0aZHY8fYZP28mUkox48pjkFip91F5deAzu1Z7JEn7g9whDvFr9O
	kc/btfhAW9YiaXAMkq12xuk+9xoGbmwkq2u0A6fHRvElbAozWoHc2rxn3i2D9xqyfU5xMa/9YvG
	AidjmalqElTmtxZRvIM=
X-Received: by 2002:a17:90b:5908:b0:368:6ff3:6675 with SMTP id
 98e67ed59e1d1-36951885cddmr5052615a91.3.1778866726541; Fri, 15 May 2026
 10:38:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422104227.19969-1-turkoborys@gmail.com> <c0c35d9d-92cf-48e1-8e69-e737e580ab3c@app.fastmail.com>
 <CAEAo-Lig6UGvx=uAYB2XJ4quSjxEE_QzypmsYR_ojV4OODhsng@mail.gmail.com>
In-Reply-To: <CAEAo-Lig6UGvx=uAYB2XJ4quSjxEE_QzypmsYR_ojV4OODhsng@mail.gmail.com>
From: Borys <turkoborys@gmail.com>
Date: Fri, 15 May 2026 19:38:34 +0200
X-Gm-Features: AVHnY4Ktiy9d5lgrG8v0k_DpCHmbDrIuk2vAcUXQIbejXhsnlIhrRFbzc9t8XeM
Message-ID: <CAEAo-LjdVzQ7zsiz8NrWKYVQ0V11yRwiX98BOsCL6EVQvpZZGw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ideapad-laptop: remap "Star with S" key to KEY_DASHBOARD
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	"Derek J . Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any chance you've had a look at my response below?

Best regards,
Borys

Op do 23 apr 2026 om 09:59 schreef Borys <turkoborys@gmail.com>:
>
> Hi Mark,
>
> Thanks for the detailed feedback and for testing this on your
> ThinkPad. I=E2=80=99ve done some further testing on the IdeaPad Gaming 3
> (Cinnamon) to address your points and cross-referenced several IdeaPad
> manuals.
>
> On this specific hardware, I found that KEY_FAVORITES currently
> results in no action at all. It acts as a dead key in the desktop
> environment, so the risk of a regression for existing users seems
> minimal compared to the benefit of making the key functional.
>
> While the ThinkPad intent might be more flexible, the IdeaPad manuals
> (for the Gaming and 5 series, for example) specifically state the key
> is intended to "Open an app" or "Open Lenovo Vantage/PC Manager." I
> tested KEY_BOOKMARKS as you suggested, but found that browsers like
> Firefox "hijack" this key to open a sidebar, which prevents the user
> from mapping it to a system tool as the manual intends. Additionally,
> in my environment, the system labels this key as "Favorites," which
> might be confusing for a "PC Manager" launcher.
>
> In my testing, KEY_CONFIG seems to avoid these conflicts. The system
> identifies it as "Tools," which is a perfect semantic match for the
> Vantage tools mentioned in the documentation. It isn't intercepted by
> browsers and remains fully mappable by the user. Using a neutral key
> like KEY_PROG4 would also achieve this same goal of giving the user
> full control without default interference.
>
> I=E2=80=99m curious to hear your thoughts on these findings and how we ca=
n
> best align the driver with the "user-defined" intent described in the
> manuals.
>
> Best regards,
>
> Borys
