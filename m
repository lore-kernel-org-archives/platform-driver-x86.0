Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7512DA750
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 05:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767074088; cv=none; b=POcUmxLjoQEGh2XX0BUdCODmdAWKBSkYXr97fav5yrUV37/PvIQ2opEFdnPc/Fnd2mM1dSwnjthVDwDv7GI+j1bVfgqfJ1ph2lhBMNLdo+CR4TKbpzS6Cmep5c2uNS6yFaUGUf7idiC3VGR6AyFgXl6MIdjlxH7kR5prFv0jpII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767074088; c=relaxed/simple;
	bh=ApfqwtByx3iSLGxblz2ddlJbLh5Dm1bWT8Aqrvc+IRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqRr5BzMybNyhSNOMCwWxIEI1skHp7O+fajSxxR78CR9Ni6+b+U135V4Vbk+IQOjoqsoxY9x1qMS4oN7/shcaqoQ56K6VxcsCFGA7BPscf5dXndklQL2e36OHv4QhYWMOgDRI+seO5/2DgwqndRd1bzVCs9JHkNAFWLcmcpsioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VqYtdiz9; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VqYtdiz9"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fdb90b670so54864267b3.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Dec 2025 21:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767074085; x=1767678885; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ApfqwtByx3iSLGxblz2ddlJbLh5Dm1bWT8Aqrvc+IRA=;
        b=VqYtdiz9/zUr+3ZE2M0yR2N6gCJbCuxt3FABkxlYAzDVGLsUPutKgZD5k/ohCTBUDj
         AaozAz0BoqGXFkdq+hbCGB4Y4LdKLsySO1NYrZ1geQQnzPRNC+YlkLvI3C87OgK7SNmW
         /l1Y7yCPtJKzwRhGezTkV+5BfgtEbyFwyScOzmNfRGsBGRA8zP1E33ClgV79xdFpzj00
         RtcFwFeGd2csI+NbCJhQsdhoAEYx4fuSehtLGucokK2aBlX1YuruBwULfauiQ4aVZ/B8
         0Wz7cpGbm5SFlMeNxDGG/ada/wogvRlpMmb+ugbEu1NXwm29qPqsC2/q5OtdBkm1pqxt
         bIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767074085; x=1767678885;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ApfqwtByx3iSLGxblz2ddlJbLh5Dm1bWT8Aqrvc+IRA=;
        b=R5b39AooRy45J8uzkgLPqFNwLKewpVYun/MCO7aBN6Kbiethuuk9H+wF9B40gtuHDY
         tVi/VBkQNZdQBRk/tSdZkZQ0SOzlUIzmx7XtUWgviGM/nfchnFmrSaoGuNSW3X5OP4RH
         RJDOgESP51D5hAoYW1gK3PiAWgUvloz9xTsP37h48kiM3w1okX4KYwJPGBq1LPKFOy9f
         8XEHDq8E3uKsBo66TML5NRdz9Kxnf3sJvp9aHclBc1zOO04faw1dmsYTMrrNDejEqsoG
         VcnUOp843nnonvuns7nDPpcca1atm7FEVbjyTeOhoKxmYwvMNvGC4sGHi45yOrJPwUcX
         ud6A==
X-Gm-Message-State: AOJu0YzU5bgbI48Ofa7MxZElTt+UGAGqYM7AZeEn6YQyMNbVJdZiMOsF
	U0dUnjrfT3yfyT3NCv2n0S0rkzx+SwEQxCfvijNw4D1xCtte6xFXx6XDm0wjfI+MNgBKB6REKX+
	c/1uUDT6PmJzLcp0UG2tkQzPlJgF6cSw=
X-Gm-Gg: AY/fxX5iah0OvRtdmbGCkVsy/aREZQtlv0ut6+RpRCTX3dW3ZgVYS93xRV9PFk0eqFN
	7Y+eSdMakFZl+q5yKj9lqDog4bPEhTVNiFgYWBJB6hzMOxj7UM+kftrE/vRPznO4QbwVyjSFQZ3
	bbMA1ADYcLdxcQ7rkMCoeZk2Jy48WONpYf5QBdIGRzCQb0VsErbAeXi3GXKeW/pfEkz2VNPlpw4
	/5FR7MtlnTtSRlZn2Uma09YdgOVqwoz+d1Pg6X2vMsUaD7WKT2St4vTZuPyOclGP4eGKzMCy21L
	sDtQzvYFxphYzd14caGbbtlBBuhC
X-Google-Smtp-Source: AGHT+IFjndgRb7bBEjsvTEzaIr7cmn2a9nh7zYyq04IBUS9jWajKvEMpaR+gMa9mD1yN+gTXrCbR7YtO4RgqCYw1mic=
X-Received: by 2002:a05:690c:9c13:b0:78c:2728:db6b with SMTP id
 00721157ae682-78fb4131abdmr272743017b3.41.1767074085449; Mon, 29 Dec 2025
 21:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CACy5qBaFv_L5y_nGJU_3pd3CXbFZrUAE18y5Fc-hnAmrd8bSLA@mail.gmail.com>
 <1e4fe52c-d044-4869-a583-fa14f9740de0@gmx.de> <CACy5qBZW1pbYrrTc-1tcNwzGTuty=aovnrK17==CaSppXuBurg@mail.gmail.com>
 <abeb08c2-5aa5-4919-8016-d714c04c508b@gmx.de> <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
In-Reply-To: <CACy5qBY-6v7_jRizJ=dJkeKGF+4fVUwmX9oaP=8XHGROEYOgCA@mail.gmail.com>
From: Pranay Pawar <pranaypawarofficial@gmail.com>
Date: Tue, 30 Dec 2025 11:24:34 +0530
X-Gm-Features: AQt7F2pVmFX382fc0UTCi9ttlbKEaMPQPDH5tn6qbJOzZ2D6gm1x9t_7WRxjnHg
Message-ID: <CACy5qBbgvgLa-y-TXz9ChaC1pvCAgKjQbU+=0Zd3gm-qyHHW_Q@mail.gmail.com>
Subject: Re: platform/x86: acer-wmi: Missing max fan speed (7000+ RPM) on Acer
 Nitro AN515-58
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the confusion earlier =E2=80=94 after rechecking the behavior
without the new patch, I=E2=80=99d like to clarify the results.

** Without the patch:
1. The fans are able to reach maximum RPM only when using the
balanced-performance profile.
2. When selecting the performance profile, the fan speed remains
capped at ~4500 RPM.

** With the patch applied:
1. Manual fan control is unlocked, which makes this patch important
and effective.
2. The fans are able to reach maximum RPM only when using the
balanced-performance profile.

So the issue is specifically that the performance profile still keeps
the fans capped, even though it is expected to be more aggressive than
balanced-performance.

Apologies for the misunderstanding.

Best regards,
Pranay Pawar (Bugaddr)

On Mon, Dec 29, 2025 at 1:47=E2=80=AFPM Pranay <pranaypawarofficial@gmail.c=
om> wrote:
>
> Yes this patch is making the driver work as expected. I had modified
> the acer-wmi driver and loaded it, then changed platform profile to
> balanced-performance & now fans are able to reach max RPM's. But in
> performance mode (Which is supposed to be powerful than
> balanced-performance) the fans are still max locked at 4500 rpm only.
>
> Thanks & Regards,
> Bugaddr (Pranay Pawar)
>
> On Mon, Dec 29, 2025 at 2:10=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wrote=
:
> >
> > Am 25.12.25 um 22:51 schrieb Pranay:
> >
> > > Sure here you go, in attachments
> > >
> > > Thanks,
> > > Bugaddr
> >
> > I attached an experimental patch that should whitelist fan control for =
your model. Can you
> > test that fan control and the nitro button works?
> >
> > Thanks,
> > Armin Wolf
> >
> > >
> > > On Thu, Dec 25, 2025 at 11:14=E2=80=AFPM Armin Wolf <W_Armin@gmx.de> =
wrote:
> > >> Am 24.12.25 um 20:40 schrieb Pranay:
> > >>
> > >>> Dear Maintainers,
> > >>>
> > >>> I am reporting a limitation in the acer-wmi driver regarding fan sp=
eed
> > >>> control on the Acer Nitro AN515-58.
> > >>>
> > >>> The Issue: On Windows, enabling "Performance" mode via NitroSense
> > >>> ramps the fans up to 7000+ RPM. On Linux, selecting the "Performanc=
e"
> > >>> platform profile boosts the CPU power correctly, but the fans remai=
n
> > >>> capped at maximum 3500-4000 RPM.
> > >>>
> > >>> Observation: This laptop model lacks a physical "Turbo" button. tho=
ugh
> > >>> there is a nitrosense button which is useless in linux.
> > >>>
> > >>> I am requesting that support be added to fix the maximum fan speed =
state issue.
> > >> Sure thing, can you share the output of "acpidump" to i can whitelis=
t your model
> > >> for fan control?
> > >>
> > >> Thanks,
> > >> Armin Wolf
> > >>
> > >>> Best regards,
> > >>>
> > >>> bugaddr
> > >>>
