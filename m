Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C232F691B
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766515016; cv=none; b=tH3eU/FztTQk0a1b+dzoiSAKCFnkp3Pyp8auVVfXBXLxaS+LQLwl6C2yAIVZW70dtdWIvsprQ/6qa9JV1WSI85c2pVrDr+Fi12ZKySPG5pCZF0yVUozmGnoy1G8h1w6zEao3FvAA1Zc5ACthal/7i5QfAOrqSSHK8z2BHe2P7Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766515016; c=relaxed/simple;
	bh=ndkrS+071EigXO52DNXd+EGtF7Nl/WT1XXc3S6NrF9I=;
	h=Content-Type:Message-Id:From:To:Subject:Date:In-Reply-To:
	 References:MIME-Version; b=QutTNj2byOoUU6hQToRb2nsvMBYuW4xDQWoXlSWyAX2PIUZmyXRI2WPld9xTrgNOboCQdKlnlFywYhuJjxJ70v0zDlKB5dLteU2hq7pS71JRtUJdGglFSvgCeQGlW2L7hgBOfccogrSeEHXBsCYx1wAD4cImIEhw2IvLYfZR7YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaD2bzMj; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaD2bzMj"
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-4308d87782dso528859f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 10:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766515013; x=1767119813; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:subject:to:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quO7IL13QeUTjR60YwRMH0iBRXBLgL2ricG/5BWgEYw=;
        b=VaD2bzMj3jihWURusqeEjIF8wDdO5utpHUoCfk0v9WT660Num3xhzFI04rYAt5owSF
         IeZM28iULdb3dQUZrWsh3QE+har98XQO7DhENLqIsISwOQt55X74Mn1NGb5cUehWIR6O
         hmJvQ47jc7dfJZNvrPHsynOb1ZMXrnQs6t7Fkf7GQ7LLLjtrlOSk1cP2fF4OQ8NVJeS4
         5AF032sscKgWNRVZqotPo8qF4OqqRrspt6C74cjnbMaRO8JB5Vm1avoWWmkKBSCuIabx
         T59bq59tCHVIGGWvTjIqf6bNl+FDKYW6ry47Q/HdsLSUxIeBSBcycKlUt0b1mk/KvFU6
         4OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766515013; x=1767119813;
        h=mime-version:content-transfer-encoding:user-agent:references
         :in-reply-to:date:subject:to:from:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quO7IL13QeUTjR60YwRMH0iBRXBLgL2ricG/5BWgEYw=;
        b=RyTV/rjJk0eLWiTpHo93xZ9GCwg19MuJP9mbgGOwXNqeNCuGJa7UlbBATIxi3+YW3h
         IJpmDgV6luLNncZgGZUiIsJS6ox091x7K/+wKgA5VL/5sTzIgHgEoWtYReSjgZcFzMWQ
         On+8R7gIgFdbkJiLb4i3vKmt/UPOgFziUj5tar0Dl2vlR9cz9LgADya+em+gCSoLQ1Mn
         tUln4DAotNiAb2lFBw2avKgVkaI3TQBqOnGH2wY8b3BISbTQn9z9DGg402Y/7+HnlSqu
         qDtPsIWaMzCsKvigBIdNwFiE2VHci11go9088nzaAzjyC9IBpwo6Tfkh2XqlfNma6vJm
         bIeA==
X-Gm-Message-State: AOJu0YzEcKDN9z+LjmGFPOnU6qMxkkqu1qqFkkeInPP9ePcGBHQ9EnYb
	78/x/qssCuSMKrMMBl21ixDBsnGDsX2kNgrkYKOreHK3dwXKwx5Hp1vO2KMSllbQ1AU=
X-Gm-Gg: AY/fxX4HeYb/Xq47k3HCUpBUzzfCM36G5xVUl+GFhdWsis2w1/3TeQAjNLJCJ5m9/iU
	ckhKEM2U5F8Wu8uRdi2D9xwJwQsLEoKmrHxeTg5QcfFjp/Rrm/KGshRkwjm87K1weQBeeENLAU7
	WUPZT9A3sSIByWNIukJxvxcvL/HfVGPSqeZA3JWpj6Mxz8JFtPxpb71kpm46yQM2BWxbJCk2oM7
	UTeAkPqtaKiK6pJlTRSHRWkye/8aB9sgbU8hH5TVPKfOy/KDKZKdA085PxoekdpZoBCghrob9wc
	+p7lJ+R54T0I+abExrnOVzXhTD7hUl2PBw1PqAfP4vJDhjY5abUYVXHWUTWr2VeUC+Buu6c8s9g
	1qHByTxGQcowuuSRaiGlo4CAw6K1G/qSu+SsUtQpsx5UfPE3b3XNcfOcrigwWOvWgDBHTYEQBV+
	1pl57Obs/6FKam
X-Google-Smtp-Source: AGHT+IHFcpkHYcfr19HM5t8mCPBqazDAVZjm71+mDNzDEDbj7qLYwPJkIKS5vlCoGLZvlvmOSwbUxA==
X-Received: by 2002:a05:600c:6908:b0:477:aed0:f402 with SMTP id 5b1f17b1804b1-47d195cc193mr71135315e9.8.1766515012860;
        Tue, 23 Dec 2025 10:36:52 -0800 (PST)
Received: from noip.localdomain ([2a03:a900:1000:22b1::9d4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3ac5409sm117536625e9.15.2025.12.23.10.36.52
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 10:36:52 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Message-Id: <1766514944350.665271996.4201129447@gmail.com>
From: =?UTF-8?Q?Tom=C3=A1=C5=A1_Hnyk?= <tomashnyk@gmail.com>
To: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: lenovo: Reassign KEY_CUT to
 KEY_SELECTIVE_SCREENSHOT for Ideapad laptops
Date: Tue, 23 Dec 2025 18:36:51 +0000
In-Reply-To: <321a7ad0-03e1-4a73-a0b3-e9f9ecf2c7d5@kernel.org>
References: <321a7ad0-03e1-4a73-a0b3-e9f9ecf2c7d5@kernel.org>
X-Mailer: Vivaldi Mail
User-Agent: Vivaldi Mail/7.7.3851.61
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


Hello,

On Thursday 11. September 2025, 16:18:11 (+02:00), Hans de Goede wrote:

> Hi,
>=20
> On 11-Sep-25 4:13 PM, Tom=C3=A1=C5=A1 Hnyk wrote:
> > This key is produced by FN+PRINT_SCREEN and as per Lenovo documentation=
,
> > it should be "Open the Snipping tool". This corresponds to
> > KEY_SELECTIVE_SCRENSHOT, whose keycode is 0x27a. Previously, keycodes
> > under 248 were preferred due to X11 limitations, so KEY_CUT was used.
> > This is now being corrected.
> >=20
> > Signed-off-by: Tom=C3=A1=C5=A1 Hnyk <tomashnyk@gmail.com>
> > ---
> >  Fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D220566
>=20
> Thanks, patch looks good to me:
>=20
> Reviewed-by: Hans de Goede <hansg@kernel.org>
>=20
> Regards,
>=20
> Hans
>=20
This has been a couple of months but from what I can see, this patch has =
not been applied, has it been forgotten?
Tomas


>=20
>=20
>=20
>=20
> >  drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c =
b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > index fcebfbaf0460..556d50fb7996 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> > @@ -1328,7 +1328,7 @@ static const struct key_entry ideapad_keymap[] =
=3D {
> >     /* Performance toggle also Fn+Q, handled inside =
ideapad_wmi_notify() */
> >     { KE_KEY,   0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> >     /* shift + prtsc */
> > -   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> > +   { KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },=

> >     { KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> >     { KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> >=20
>=20
>=20
