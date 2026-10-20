Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478830;
	b=T4Qu6fmtaB6DvyEJMp6oQe2ajF8vmEhTcO69vmJN6epyfhanPx9Ir7RXXLAfidBylQcl
	 arHc1CdowzvTzUyQ+vVsXaFXJ2idNfq90f1OYQs53a6430hRTbpSsCAH1jrEnmCwsSqq8
	 pvZiorygAMUrQUjnQJ0bnK85MY8637LatHPTLmgqveSmqbjtvS34BD2saChxchSgXpKQs
	 9Y690RTD36Vs+0K1vpNf9caGkpryTDccqC6V5ETyH76Pe8qmI9YhzTAhi3grjdsurvLnf
	 tl6n00XPniQCdGC7i+idVoqnE1/3N0A/Jl3pSHUr51/cDovY3zJ76ITXEnYJOiBcUEg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
	b=lnhdKuSFO8wtsb9Dax1Jh3HF8lrxzkgAboy4EyLj+CcJwboVnEGjwjaqXQjKiMQbBYLu
	 nBF5nx4q1w0r3kKZItLtiDdf61GZxdstEchaxtxUnK/s8WTH8BaTH7R9Jvd8s0bGQ+21m
	 QzJWjiwvdGRSsPAkUgMOp3ObiwKFw7gndotr3qtreDbUmsEanpOIvdJrtLAd/NfAckxAT
	 I+ndE/ENPpLmYc+CQs2r7URkHowwSJ6RD9XPiykrk6BYYDJSN0RZPTrs+XiawumIJw8Dh
	 rpG1mH9RJdDEJipjfIcO5dpcU1Bjkpi2h6ztRWopFWjb+0B+3kn3RuUw4BJkTHY14hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="PBe/iCO3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1403D60A2605
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 06:47:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1403D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PBe/iCO3
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f1f76ea84so5297393eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 23:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478829; cv=none;
        d=google.com; s=arc-20260327;
        b=PZ30mBVSn7qkvjzQX6GVe+bE4MDmWInK9B0CqgPlHWpNRTpCszqD8wPtvzPiogiYvH
         muUzORnA/rReqyAR1qaGYC+r1ajLLX2qnH3SxXetIGRqDvCxH/uG7mFrVXQDlnRom5dd
         MqS8Eb3PMlutmsAtHd5R89AXjudfkS36+GiNC4DiWqKq6EH/qJEmi4ZniGnjgbr6r3/s
         x0Wi6t/9bkDra6D+HVB3F8Ngb45aMj+VVZpzriYoKCsPCNEe3CIwNSpY6NIHOAZu1xFt
         JsaLNx5XlJlpZH8VbD/E5chjXjg+VYX5OtldSGXCJApxDljHV5jlRgedZSl9hiuy7uvb
         4mhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        fh=wf+rN+BM7GlSZaBFyHVIjd9h02y+d7CNm/IszjPJ3y0=;
        b=eZbAf2Rs7wJWpTLJSkywXpGTl454G1cVl1J48DYFmElmnzCgfvEWMZoFoZAuBoixXm
         EBKYHG23173lqnMUURl0wfSCEuYyixtNNf3L2eAK4Dwdqn0CI34blHsC6kylAdK3bON/
         iehypJgvKH4BBWq1Fwu68xIhkWicTTcWC3H/MdgLt5EFTbz1B3h+XglX+KYnlLHJ63dV
         Fj8Db7uq7nWvRLa9LlfTMhh6ozQ4iLNNrhk7UATPC/gM+df2u7yCiQ+rhUxiJRqe4Sko
         9elk4lzPBTC/nud0ZfJmlOLQE718M+jQZE2e17tvi4utlG9+Xk9105mZZrdv7Opj1aJ/
         VIaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478829; x=1793083629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        b=PBe/iCO39Tf8txrU9IoIfeb24Y3wiSXWoxke9fnEw7gifXoY5X6JenqXyH4a48tOTK
         PBDdrAtLrAvZB4yujBOxkutMDsfjU/OpMA/wwssdjsR7tS4zIEBoo+NHSeULAkzgrUuJ
         BmxahJAb17eFAgrtkwxURDYmRBlvKejLL78+CPefV/OtK0SXZNoZpwjIulqdP2+rVYeU
         3l7MztMthZv3hvVBEGuKz/Dh7OPjiFPNCt1/nQQHQkrJa1y5jNg3yzxnfz01S9+8MGhz
         IgKBx9dJzAG9bmuHkdXrfJWM39x1WqG7G2Hca7aWcbcOq9UM3w3Z1EG4oRlXD8oUiKbw
         UDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478829; x=1793083629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGzmT80QXI1a2zkaTtW/57msiwUM6XTRu1xe5SaKjfA=;
        b=Sz8iQr3umNeEjyUPz2VZ+pv8+Kkh+PiEq2xx6rO4IRrHScUfDBtPare2NbCG/GyzvI
         mdvK84hx6hzNGQm+b6eYJLCGPxp3YLdZad4z/uZGGasUsemcbXU+Veb0kNj3si4l4YFY
         FLJgj91kzAjJ72XMNPlCXgUYSJGd/0jQOOH/Hfi8AWx7KFGxjzP2SiAkwKRgEiErBufp
         PkRfkY1pGeBKzwIG9MLY2bDfVXTC93THSbjQYj6V6I9Vqx0ZQBEoN7veyV0K8GYtWkuk
         HMev3JHP9bZhgdkqIQmRh+274ZiVUXQT4nXTIoo3ijaIuhysW0kQMuM947rIQT3O/cMk
         n6sw==
X-Forwarded-Encrypted: i=1; AKwUvBybmMwnwjmn6bUbUSrPxwHXcxm05+1jT4l+I3JmfAOFaWdXJq0nEJ0X7c3aAjq/rDa3FfmEOiP4b21Bt1nu1eXJXSNw@vger.kernel.org
X-Gm-Message-State: AFq9FYLRRdyHnxrsrtWV8Em8tWbV+KkoQJWOFkwz/uEYmNpc9TcpOLUt
	rf55wwqlbKBKDt4fd46hxvxaApUFvM9GeNIVI7pRNo4JzMFn0YAqyqapGAOZXmDIFPZC78iEi/e
	fojgmZX9HuV5M6DunTqeHptt9qv083x8=
X-Gm-Gg: AYBFou20PdUH5DK5jsw6L74Zu+wbPxzlZbZO1jLFvgiB1tt4nsmR/ndlToV4FzxNxm+
	T1K2ckanMrL4ocen9DUVzNWPzJ6YSt4t3n0k+LahrlOxg8fU+Pp+5Dab3+XTMZ8HN+A3fS8i0Ja
	gYT/IsUTCjG/i4O+s38X+ZexHGbQMlcScEdtcc98BESABacdKfQP+ooqccfsW/qjIK7rHX0PcyP
	jxCiBIeCG3rY0VmYuZ8ofqtcX8Xz8plErIcjrFTVPeDuP+7ibSNUdb/POOanqFdb7p63YCFCHEq
	b1/Rzp+TUtHWFpnFQI5344lvU8ctEWad8rI6I61bDCbYe7VW9NDPFnmoXYC00xxn04wv3JhB0PW
	Kqxs4zmlPAteh2rz189cj2zl5b7zVsmvDUtRo+WDSKJZI+/IiLOPiNPKmmI6NSZzfcNdHmqDVEO
	yPjmxC7PW7NzQgCiZ7vzcFxsEYIFYmmBMa43A8ut06Ro7b9WGJ7TiUldg=
X-Received: by 2002:a05:7023:a4c:b0:164:4e36:f956 with SMTP id
 a92af1059eb24-18512c3817cmr12260179c88.16.1792478828068; Mon, 19 Oct 2026
 23:47:08 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-3-patrakov@gmail.com>
 <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
In-Reply-To: <CAHp75VdnqDsqcLtUEjJfJX0hmwfrV=SjEDrD9JOMXhY0aVbHMA@mail.gmail.com>
From: Alexander Patrakov <patrakov@gmail.com>
Date: Tue, 20 Oct 2026 14:46:04 +0800
X-Gm-Features: AclHuK_JVoq3P46NCTd8ZAC7ZphXWg9MMcJNeqTWC7ZMqOVlnPuXJteVRxeXoLA
Message-ID: <CAN_LGv1q3AZFdmG-T7v+v2YmzzhFsVtnwYfJh82M0W86TAbR4Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: i2c: ov5675: Add the OVTI5678 RGB-IR variant
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:43=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmai=
l.com> wrote:
> >
> > The front camera of the Lenovo Yoga Duet 7 13ITL6 and of the Dell
> > Latitude 7320 Detachable is described in ACPI as OVTI5678. The part
> > reports the chip id of the OV5675 and takes its register settings, but
> > its color filter array is a complex 4x4 RGB-IR one.
> >
> > The silicon is likely the same as the one of the OVTI5675, so it still
> > has some features (binned mode, hardware defective pixel concealment)
> > that assume the classic 2x2 GRBG Bayer array and thus produce meaningle=
ss
> > output with the RGB-IR array. Disable them for OVTI5678.
>
> Should be marked as RFC...
>
> > NOTE: This patch cannot be upstreamed as there is no way to properly
> > describe the color filter array layout of the OVTI5678. The color forma=
t
> > is a placeholder at this point.
>
> ...and this paragraph should go to the comment block, ...
>
> >
> > Signed-off-by: Alexander Patrakov <patrakov@gmail.com>
> > ---
>
> ...somewhere here.

Hello Andy,

Thanks for the review. In fact, all three extra patches are RFC or
even just "FYI", to show what exactly was tested.

To satisfy the formalities, I will resubmit them as RFC with your
remarks addressed when I have time.

>
> >  drivers/media/i2c/ov5675.c | 149 ++++++++++++++++++++++++++++++++-----
> >  1 file changed, 131 insertions(+), 18 deletions(-)
>
> ...
>
> > +#include <linux/mod_devicetable.h>
>
> Not in a new code. Now it's provided by i2c.h. We probably need to add
> an ACPI ID header to it.
>
> ...
>
> >  {
> >         struct ov5675 *ov5675 =3D to_ov5675(sd);
> > +       const struct ov5675_mode *modes;
> > +       unsigned int num_modes;
> > +
> > +       modes =3D ov5675_get_modes(ov5675, &num_modes);
> >
> >         mutex_lock(&ov5675->mutex);
> > -       ov5675_update_pad_format(&supported_modes[0],
> > +       ov5675_update_pad_format(ov5675, &modes[0],
>
> &modes[0] --> modes
> in this case
>
> >                                  v4l2_subdev_state_get_format(fh->state=
, 0));
>
> ...
>
> > +       ov5675->variant =3D device_get_match_data(ov5675->dev);
> > +       if (!ov5675->variant)
> > +               ov5675->variant =3D &ov5675_variant_bayer;
>
> With driver_data it makes no sense to support driver_override.
> Better to return -ENODATA instead of pinning some defaults.
>
> ...
>
> >  static const struct of_device_id ov5675_of_match[] =3D {
> > -       { .compatible =3D "ovti,ov5675", },
> > +       { .compatible =3D "ovti,ov5675", .data =3D &ov5675_variant_baye=
r },
> >         { /* sentinel */ },
>
> At some point the trailing comma should be dropped.
>
> >  };
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Alexander Patrakov
