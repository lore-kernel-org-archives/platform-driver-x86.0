Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C42BD1D
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 12:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733230727; cv=none; b=fz5UxKL91yVRUdtsUEIbfaoPzLMultZd3bgT5odwkcUW5pLAwmL+u7UAj6XioLxTcc2B0mDzHeBj5rA3ojeUnvO89DkEu2Ox8V3Jm/eVa1D0yIKowVOHHGuTNx5Tuof3FNDPeW4hV+EkR/SvaJTAiQJAI+VKWd7gk61vWIoRSAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733230727; c=relaxed/simple;
	bh=9IxA3UnRP6Yf4tMHgdxlk93p5u265dPRGZGIP6qbRi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCu+JOORm1wMCmUiAwVKGSD5E/hzy2DKrsm6Gqh16POlLX0fKcKbX2IciuruNYZxgD+u7TULCLcBi7yMMXN119U0OfG5DCbZE+Ej0qxzNBVQ551L0Eibm6CKuVggjyONxjKCRdITLWknBTf4Z6WNTx0cWGGDL0OdMXGx0aI616s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eXE3p99+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eXE3p99+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa55da18f89so828161466b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 04:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733230724; x=1733835524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50HFwZLBJMO4t3KPgpFhooh2aBU3r1S5mrJOJLSA2hY=;
        b=eXE3p99+FBGwGNVjsjtzoGOkAn8cPYdX87RELt7PPy+f3xGtgIbfyUYaq7uiRq7Yz6
         DixYgOHx6xQRKTDKtyW6UZ4q6QVrC+0AZei4xrkB2AEazhQqpZJaI4cAH+FI4QMTslJ+
         NSRC9YsE/1b0IO3PCXS+S8XWY+UuESY7HgGm+drshjTlm+B/qIAcY1FCaiNXwWAl2N3j
         +aU8pCOZXjqaDinO1DvDpOe8e+sqrLDnYBmSamtZY3c0U08RViRK3HoK+QGVHF97pyQV
         Qz9XZc2B0jc+4NvqOKdWuymwGSzhY1M44/EOqd4IGEe5VwCckKNhVsEunG1oTiJZIrO+
         FPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733230724; x=1733835524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50HFwZLBJMO4t3KPgpFhooh2aBU3r1S5mrJOJLSA2hY=;
        b=AASjRMRYbyeK7oRgcSjY9LNiAks5I6O3bI8sWWIJCTjGcllifgumsdDBa8j0feTz5W
         JxoIVo+JemmZ9EveqQcgoJndx7Ia7W2RGkIDuRzAgj7ir4NGsu/5srLsbI5xt5xSmV3Y
         LNfqltWli11mWbEQBd87NFO88PJTPdzLdzHWkbe2q4qooJurpiFaDR6OZ01myBSvPxcJ
         69PC5tJRR+HBLIucnvOiDoY/D8RdBSt/W+uzgHK8CSmwaINwgNVrHkhXoyXXrVfnLnfF
         yblV7zhWTDmoifzAwbPrn1vB13J8Suv/+oPa2OVdL40qrv6c0mRn+l4r8CHZhbZcBhuN
         YkHg==
X-Forwarded-Encrypted: i=1; AJvYcCUfNALarN9XdwFkWfOpwjbg9IB9dKrm2T/B7OSsG25RVoGs/VKkvjOJDD2XF5IvGRbjxdadTyZxkTFMPL/Gk0DS/Oqs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/xdQvjFb0RdMVkQ7u01lZQYP7OR5rjoPyIueKqDrxxG+8W2pY
	L1pxlz7rd0VzesUGpqaunT2S72cyX6SuixbnMceF+4mvwCYdO9Bk+EYOWAjMa/qiDzY4el/fL7V
	lZqcyd8RLQUD6KcnQvKlLD8KJDL2PzcP1
X-Gm-Gg: ASbGncsZv08wqlw8fAGB4oLbSJNFKiIkHjfOTUNEvdQifeiJnwa+5/YHW/n+/kk0+iR
	JSGpDz5VT3BGVJksE+pU8m8drbNTo/LY=
X-Google-Smtp-Source: AGHT+IGd6Y78fVAP9A1iN4pg1DdGiZ6ytzlQmFm7/5nJCXlw95hequuMRpxDH0VJqkSdZcJKrYkFcDrdFQaT5UxSZWQ=
X-Received: by 2002:a17:907:a08:b0:a9a:835b:fc8e with SMTP id
 a640c23a62f3a-aa5f7f3c3dfmr229998466b.54.1733230723659; Tue, 03 Dec 2024
 04:58:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241116121659.57487-1-hdegoede@redhat.com> <20241116121659.57487-2-hdegoede@redhat.com>
 <b5b40432-77ed-2466-7d30-ce35a239d0ae@linux.intel.com> <Z04ASf0znID9C1FN@smile.fi.intel.com>
 <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
In-Reply-To: <040238ad-6f88-4c4a-814e-2b94b7a43116@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 3 Dec 2024 14:58:07 +0200
Message-ID: <CAHp75VdJ_MfRXXX18c+rB943Saare6n_GEEwko+Hf31UW39XpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add Vexia EDU
 ATLA 10 EC battery driver
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 11:48=E2=80=AFPM Hans de Goede <hdegoede@redhat.com>=
 wrote:
> On 2-Dec-24 7:45 PM, Andy Shevchenko wrote:
> > On Mon, Dec 02, 2024 at 08:34:01PM +0200, Ilpo J=C3=A4rvinen wrote:
> >> On Sat, 16 Nov 2024, Hans de Goede wrote:

...

> >>> +struct atla10_ec_battery_state {
> >>> +   u8 status;                      /* Using ACPI Battery spec status=
 bits */
> >>> +   u8 capacity;                    /* Percent */

Then an obvious remark based on Hans' reply, why are these internal
kernel types and not external ones, i.e. __u8?

> >>> +   __le16 charge_now_mAh;
> >>> +   __le16 voltage_now_mV;
> >>> +   __le16 current_now_mA;
> >>> +   __le16 charge_full_mAh;
> >>> +   __le16 temp;                    /* centi degrees Celsius */
> >>> +} __packed;
> >>> +
> >>> +struct atla10_ec_battery_info {
> >>> +   __le16 charge_full_design_mAh;
> >>> +   __le16 voltage_now_mV;          /* Should be design voltage, but =
is not ? */
> >>> +   __le16 charge_full_design2_mAh;
> >>> +} __packed;
> >>
> >> Both struct have only naturally aligned members. Why is __packed neede=
d?
> >
> > Wouldn't the second one give sizeof() =3D=3D 8 rather than 6? Sorry, my=
 memory
> > about this in C is always flaky.
>
> That might be one way how things could go wrong, yes.
>
> To answer Ilpo's original question: these structures represent
> the on wire format, hence also the __le16 use and the __packed
> is there to disable any possible compiler shenanigans.
>
> I basically always add __packed to structures representing
> hw memory / wire formats just to be sure.

--=20
With Best Regards,
Andy Shevchenko
