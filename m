Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655D2433A0
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 20:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731874314; cv=none; b=e+4v+RV2t0A7H6Lzom+Jw4JlJPdrb+04I/SeK7C/5y+ML8bGGwTDPjhvEMHwpG6+iRj9R+1gilBI/oJuLgPtxK6wVnZlNpluRHbZ0UbaIlUhcm679+gA80N4Q+lP2VR+xMRdEJB6UayS4Su1jTeApbGT57aQ4nItRggKNIEAfLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731874314; c=relaxed/simple;
	bh=ljkP5RdGaB1bHVUP/qwxqIk/oo1F3x9PdFlY6Gbiz3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE7YIkYDrPfVRhepLdkVSksndcquCSW7dILv3GPepcmY05X8dRidYaBbwTdHv/JEpa4L/em9rtC5g2ZWo6jc/3/C4jJ2JnMsHFnXsxmXoPBimNTu+Is9lMgywJtJs2impMZdumM0wALnPlEpCHy0sjunwkZtc2uIQGJuo6XfwCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0+Auegd; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0+Auegd"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed49ec0f1so612568166b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2024 12:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731874311; x=1732479111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljkP5RdGaB1bHVUP/qwxqIk/oo1F3x9PdFlY6Gbiz3w=;
        b=m0+Auegdz2lqLbIHcUiGO/wYIbSIf/uuXeYFXguylKPv5WGuOhAn8emCL3qpNXIy6d
         U0wgvH1Jh+jdEm9nuYCEA15PrtcfKeFfgDcJEOm1iUsIH8MOBV/anfyUSVYFdekSJ+Ou
         OrAyl3ot20UqIAZDOrDmReTeOvIXV0oVY2Ppk3f9k++eSCkZILEmR9e7W6H0RGYr7FgB
         RV+XsO85X7uVxEjf5zprn+Hd5lSxHP9hvtpox//6ePwiqywxMgIdA4dSHNVkHFHkSb7v
         gXN4eyR6UnzfNV+h/zHEaZJanz4H8BFKztswuAxCK6hkrTYHxlAWEGVMiM6Nnp7JE1Xm
         xL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731874311; x=1732479111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljkP5RdGaB1bHVUP/qwxqIk/oo1F3x9PdFlY6Gbiz3w=;
        b=HRkL2pM/FOk19gtYt+jsnQTnpXfQ791ECXCEY5WOV+O/taLHeClTgR0KWB7Xo1jUsY
         bvrjQ20XPjwTNBspa/xnfm+53jwo9rfisU3JvANj/2hJN9oGJ62pq8GwcOBxyFNBFk2z
         75VCwAytp/g13DDmVh2lHsW4lOpKdouB2nn4MvpVlUkRmpprvjFdOTt/ZWBbbVEUl3Ic
         /XBcoYwZCRiUVf7gsdc8/fJamsTcvQpUxiGMkgqTchEyr8otsFh3J1QgUbzWgEo9JpmH
         i/oDSDBfXzKFyTdoyy43siyy9euq4cGQ9P5TWbSvm7qr8DeDTTrnDwVZlxaHPcOa9q+6
         OFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA+fS/0EIqVc+htytYvJvYrlJkWuAH6d8wTHKiaQwpYeCiPkn1VkC8a2DuK/m6df1+GbzZZPa0lyguSqKDVQk7G0mj@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/3Tk+UsJtRAMcR+8QH74oCYIRkjMNH2GTCDMCGGRYJiZUO/o
	9eMdbuRSBHnSjL0BACLrHHqQyYHo8rXLuedYt4eEm97xi6fwbmLPIhlxaLDMekRRPSV8qbpDwEL
	ab6J+XzhyfHn4AWkqQvE9uUqasLNst/CB
X-Google-Smtp-Source: AGHT+IFIsO/pMMHR7QaRUpkEZ7QRUm/3c4uPzhtOdmv2UAtL+S3SfY/hKuZBdulN2WpdChkvnusXg/eOvB3O25g9Mx0=
X-Received: by 2002:a17:907:96ac:b0:a9a:76d:e86c with SMTP id
 a640c23a62f3a-aa48354d82amr900027866b.49.1731874310512; Sun, 17 Nov 2024
 12:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116121659.57487-1-hdegoede@redhat.com> <38506d35-b07f-47b0-9154-9b0d4b9fee7e@redhat.com>
In-Reply-To: <38506d35-b07f-47b0-9154-9b0d4b9fee7e@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 17 Nov 2024 22:11:14 +0200
Message-ID: <CAHp75VeTPxreMZQZkchFn5hc3HeED_xsF8FnDKGCW-Vfh_jciw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] platform/x86/intel: bytcrc_pwrsrc: Optionally
 register a power_supply dev
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 16, 2024 at 5:17=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 16-Nov-24 1:16 PM, Hans de Goede wrote:
> > On some Android tablets with Crystal Cove PMIC the DSDT lacks an ACPI A=
C
> > device to indicate whether a charger is plugged in or not.
> >
> > Add support for registering a "crystal_cove_pwrsrc" power_supply class
> > device to indicate charger online status. This is made conditional on
> > a "linux,register-pwrsrc-power_supply" boolean device-property to avoid
> > registering a duplicate power_supply class device on devices where this
> > is already handled by an ACPI AC device.
> >
> > Note the "linux,register-pwrsrc-power_supply" property is only used on
> > x86/ACPI (non devicetree) devs and the devicetree-bindings maintainers
> > have requested properties like these to not be added to the devicetree
> > bindings, so the new property is deliberately not added to any bindings=
.

...

> > Changes in v2:
> > - Adress a few small review remarks
>
> I forgot to add Andy's Reviewed-by, since the changes were very
> minimal and all address remarks from Andy I presume that the review
> still stands:
>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

Correct.

--=20
With Best Regards,
Andy Shevchenko
