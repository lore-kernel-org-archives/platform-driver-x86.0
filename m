Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE19316199
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775503360; cv=pass; b=J+wMF3stL++3mJGtBWtUew2ACyckKiNj9th4NwW0PkYOBRqnFdM5BQEuCvDD6or/QKbMdNu5DLSz2R54bs2IL6tSEqW8JzakkW8WN4o+QUNyS5eBQSCT2lu6/EXwDN+KgQTNHMy3hIQZls6DVkYUJwcWCgQr1scGYft1bi80oDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775503360; c=relaxed/simple;
	bh=+b0WeJDS90s2CbTjJRcCNd1vwwUf0mDjzEDa95vhxEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XIpuI4vNB5jrm3Y5evYcAqkinaIfBBWxBITQ072zcG/Hf0+dAujzBEW1nzA7ed9dYag1duEDv/lQoeAXQKe3fhcIhJ0UNkh8qjj3f1GP8AJkxjHF4N6sT2KJEVt5pcSy/Sngyuz0K0WLTInJFj9asReu7hgnL+vOXPoEI+BUi9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBjrIbQh; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBjrIbQh"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50b29c4e554so53839511cf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 12:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775503358; cv=none;
        d=google.com; s=arc-20240605;
        b=W+rDeXYksNC/6mGe6FG9yC6AsuOq25dWhcFq18ecCA0XCg9lSxmvWAfBtDYBK8fkSX
         M10uNwl6NjYNqPfToOcWMsChSaELZSzlfwp0HjCe5wzdY1/NcTqZjsqYKX1ZUprYyiX5
         Iakm+QeFqLdOkDbJzJLqgxdU3vHwsReiA7zQNXiLW51lUFC3JyRZXBpu1+pksrbftInW
         PNm0n5RMM3gqr1NNhVyooogOG0R0stS5liH/RaKzwKxCPORo3AeUqU2YE15auIgtq+wB
         75VXXo7NQW7M3LaiS6rBNCrzrVIDIjEXILwRsykrDLyTxOv79FVZV+CedbzrrqK1ieCV
         myvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WU05QSfHdMtbStdAODAlR0dDFiyTP/nFgodTOTpjsrw=;
        fh=mG+5qnQuOTRNMOekmA4UWWoC5WNPJseN5uNH2zX/O3U=;
        b=QflOljJCa4YNkS9M5VqnCNtzZeD7RswYi33pc4GUQ1j+s1Vk8Rd+SMUuoN3qug1NO8
         fO2/S+wstCioxM6axMwfC7j3y6/j0BYf/3ZXQqxL8kI/rNWU0Z6iTzNps1J43z32m3dF
         xWhEZ6txPbVOP1qmDCwtc+YnDuoFHc1EpOQQk5WxKCNzLFuH8ycuQRBOaCYyRW02TWkk
         xbdURxssgs71tvSBQOhrNlBF9nw5DJskGWntIJ4TKsPFYxg9Jzeh3bcBZmJvTA9V7RsU
         f9onxkM0PgB3aVVsfLWKqojA5ZftMxwoxJ37tDiclBZsFbrPElAMR5MUBZcwr5bkjUw9
         M0Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775503358; x=1776108158; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WU05QSfHdMtbStdAODAlR0dDFiyTP/nFgodTOTpjsrw=;
        b=oBjrIbQhSGq+JDEFWT+8g5SwMDcQB7E+3atnbN/s+3Us0btE5u/g7y5LSWRYrY0Zhj
         +DMULsSHgdTT7+FVV9FzC0Ix0wXGvh1gcdb5Bqp3mqrK9uFaojwOtGQlIUiJSUKQmkef
         rWjWlRUXgl3oV0N4WiiQcBtnwqLqWt4sMJaW2DUkY+guJM7Dwh5TnP+kjA8hWIagfVf7
         ER+awJ3KdO1Xw6erEzr/LJx6GmOEY3O9YctZDx6MjD6KabP44LForNF3zApexYNjksh5
         IpCWa59hIt4Q3+BiIPx+h7T/kuxEk3S6ltXbUYbJt7hhrE6hxnXulGi3k1042ZeI4sFY
         fV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775503358; x=1776108158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WU05QSfHdMtbStdAODAlR0dDFiyTP/nFgodTOTpjsrw=;
        b=mJuajUdpbgOdtb/xn7caltzY0zdccsLHtyy0D/5zbd6whtQ0TTT76AKHBntscwLcLJ
         fRfG9U082wFj8VKK8rAMGoSz2GVu5sVLXsvLObFr/EYD17CWH0jCIfCAvbn+um9Yeb6S
         ct2VwvKBKZuJvLt8jRQwlr5yHceXW28O2J2/FRunotl4napeeSHDcY+JRToiK6WTRGHO
         zPNK77g34HaFNPGxCvbphbqnYjuKM60gWBpoocC69VdMYcXEj2o8x+O+wppq0tdr8smv
         G794QlOuP9e7p726mHsbD8fwOSF/4l4u/xxxGtCQvFJnp/l+tkp3zsdxHdB+fzXRpOPq
         dhVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtv3Ap4+mVidWiMMAU2dwxh4edauJsdHD1MGPqY1nsp0KCk1ohqJc/nSLw8/RiE0abmgAkZxWRMWW9zWVCSsEwpaFQ@vger.kernel.org
X-Gm-Message-State: AOJu0YxQRpFVaYJfpE30l8CmndI3D/OexLfsQFdEFN/UDLNusN0fT3nW
	583bjFetX9yD/NoIfC9EXcHC2a+a0WBpm0sZQ9e6Q2sk581cQty4KaGetWvKhgHuROpfNKJ5WQt
	iS6xz6PFcbFJzoXdfxokP9+i/oZGGnBs=
X-Gm-Gg: AeBDiesJzcrLVs+t9jBvLXubDdCuJKM4DHaagFYyc15eWpoiERAruxTUC99RpCaXp4D
	nhPnvMDZ6ID9B5zcKutmn89xrqzepXlax9i6ulKiCS1ynwBmKjd4rMd9rP3IIzMU0736JAyso3j
	2r9acabX0mcCCI8CFS8Ih2L0haDYfgEdxqK6G3jgiEbhjcHp33wrVjCXp+7UuuEfqDgZAY0sNKh
	nDW7Fk2ER0MDUS8prr0ra2B9v21yKjbQdcw2H4C4YuLwbH5Ga6cIk/ess6P2fvoti9KD4uQSxgF
	WzaXqxBS
X-Received: by 2002:a05:622a:4106:b0:50d:7a6c:7d4a with SMTP id
 d75a77b69052e-50d7a6c8951mr152287031cf.31.1775503357576; Mon, 06 Apr 2026
 12:22:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-13-derekjohn.clark@gmail.com> <dbfb6211-179b-4d92-aa62-374df2d39490@app.fastmail.com>
In-Reply-To: <dbfb6211-179b-4d92-aa62-374df2d39490@app.fastmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 6 Apr 2026 12:22:25 -0700
X-Gm-Features: AQROBzAG2sZut7ICt5tuKN-pyret-JIcoevfsAyheA3O-xXWPcYLmR-_qx3HtT8
Message-ID: <CAFqHKTkA9Vrau6EeAK8mTvpxBZO2zoVtAZjOLTwrw2bYoEjKdw@mail.gmail.com>
Subject: Re: [PATCH v7 12/16] platform/x86: lenovo-wmi-other: Add GPU tunable attributes
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:54=E2=80=AFPM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Derek,
>
> On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> > Use an enum for all GPU attribute feature ID's and add GPU attributes.
> >
> > Reviewed-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v7:
> >   - Fix typo in dgpu_boost_clk attribute string.
> > v4:
> >   - Align CPU feature enum values.
> >   - Remove gpu_oc_stat from Documentation.
> > v3:
> >   - Remove gpu_oc_stat.
> > ---
> >  .../wmi/devices/lenovo-wmi-other.rst          |  10 ++
> >  drivers/platform/x86/lenovo/wmi-capdata.h     |   1 +
> >  drivers/platform/x86/lenovo/wmi-other.c       | 105 ++++++++++++++++++
> >  3 files changed, 116 insertions(+)
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > index 189dd4d31926..988ae04ff724 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -69,6 +69,16 @@ Each attribute has the following properties:
> >
> >  The following firmware-attributes are implemented:
> >   - cpu_temp: CPU Thermal Load Limit
> > + - dgpu_boost_clk: Dedicated GPU Boost Clock
> > + - dgpu_enable: Dedicated GPU Enabled Status
> > + - gpu_didvid: GPU Device Identifier and Vendor Identifier
> > + - gpu_mode: GPU Mode by Power Limit
> > + - gpu_nv_ac_offset: Nvidia GPU AC Total Processing Power Baseline
> > Offset
> > + - gpu_nv_bpl: Nvidia GPU Base Power Limit
> > + - gpu_nv_cpu_boost: Nvidia GPU to CPU Dynamic Boost Limit
> > + - gpu_nv_ctgp: Nvidia GPU Configurable Total Graphics Power
> > + - gpu_nv_ppab: Nvidia GPU Power Performance Aware Boost Limit
> > + - gpu_temp: GPU Thermal Load Limit
> >   - ppt_cpu_cl: CPU Cross Loading Power Limit
> >   - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limi=
t
> >   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h
> > b/drivers/platform/x86/lenovo/wmi-capdata.h
> > index f2d45cd7a188..891b12ca1db6 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -20,6 +20,7 @@
> >
> >  enum lwmi_device_id {
> >       LWMI_DEVICE_ID_CPU =3D 0x01,
> > +     LWMI_DEVICE_ID_GPU =3D 0x02,
> >       LWMI_DEVICE_ID_FAN =3D 0x04,
> >  };
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c
> > b/drivers/platform/x86/lenovo/wmi-other.c
> > index 56c8b84f306d..57b6b6f17f33 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -61,6 +61,19 @@ enum lwmi_feature_id_cpu {
> >       LWMI_FEATURE_ID_CPU_IPL =3D       0x09,
> >  };
> >
> > +enum lwmi_feature_id_gpu {
> > +     LWMI_FEATURE_ID_GPU_NV_PPAB =3D           0x01,
> > +     LWMI_FEATURE_ID_GPU_NV_CTGP =3D           0x02,
> > +     LWMI_FEATURE_ID_GPU_TEMP =3D              0x03,
> > +     LWMI_FEATURE_ID_GPU_AC_OFFSET =3D         0x04,
> > +     LWMI_FEATURE_ID_DGPU_BOOST_CLK =3D        0x06,
> > +     LWMI_FEATURE_ID_DGPU_EN =3D               0x07,
> > +     LWMI_FEATURE_ID_GPU_MODE =3D              0x08,
> > +     LWMI_FEATURE_ID_DGPU_DIDVID =3D           0x09,
> > +     LWMI_FEATURE_ID_GPU_NV_BPL =3D            0x0a,
> > +     LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D      0x0b,
> > +};
> > +
>
> I don't have feature ID's 0x6 to 0xa defined in the spec that I have (whi=
ch I got off the Yoga team last week).
> We should sync up offline and compare notes.
>

Odd, I have it all clearly shown in the documentation I have...
Feature ID (DeviceID =3D 2)
Feature | FeatureID | TypeID
Nvidia GPU PPAB | 0x01 |
Nvidia GPU cTGP | 0x02 |
GPU Thermal Limit | 0x03 |
Nvidia GPU Total Processing Power Target on AC offset from baseline | 0x04 =
|
GPU Overclocking Stauts | 0x05 |
Get GPU  boost clock | 0x06 |
Set whether the dgpu exists in the device manager | 0x07 |
Get_Mode_By_Power_Limit | 0x08 |
Get_GPU DIDVID | 0x09 |
Get_GPU Base Power Limit | 0x0A |
Nvidia GPU To CPU Boost | 0x0B |
Nvidia GPU DBDC Data | 0x0C |

Derek
> Mark
