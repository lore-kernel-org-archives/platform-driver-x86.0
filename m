Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963901;
	b=IrDL1DTQIjVZQ1BEz6J2ZIhYbg0uhMFO/W4C6sqH9ZF1t6rVxwlrZ2F3Bi/9povuNHLa
	 kN4WgVj+2pXbV+vww6icyK8KgjQcvx2npBl1cGsM3zX2FsnaIhk/J8GRNnBBpCEWS0vr+
	 yhjjca3w1pt+2DdTc8PwcgqETkOWrfaoWLdTiVHbfM9vWyoXKc/De7IqTwchuR54UGG5w
	 MIEWcJieTH4GQq4L/IMmnNJ1IGm5JlsznoolRLgYzmhtwyWh1l3gyOlfS77KE71XgrEbK
	 +wYmrC4qPmgqv0xIpze6DOYkhqaZsq27jo3o+iM5VhCejEyenfNzAUodOm+UbNSCAnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
	b=WqfME+Bqgm3YRpdGrp90sRNSKwguLrmr/5R59UtwJ4nIDqPXeXBtRERnOMJl4Y3/K9S9
	 iGf2OQD1kuEYH7VbNF1Hq06o42eq0EFV1LWQ5I/PCCQ37b2NWlyU4N45mGRo6yRvN3KHG
	 fxDjFghIHZTRRsviRCVJh2hQeqEHsk8t3R7stcRj8ad/5xSzNFseoFBb2vfRJanVIaIgE
	 ffy9lxOcITfXWr+7yVU+40pawio7ruNMJfUnR1+c4mDeiWsfG5ItH2v5gUVUdxlZCbTjc
	 8w2k/CnGLZN/TyedNaWVpwqsBwN9Rms0A+BTtmsYyLOxvIqXPu5s44lX5b5y5QtQtpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Y+rgQf+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437CD606A819
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 437CD606A819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Y+rgQf+J
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b28d9537bcso372205b6e.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:18:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963899; cv=none;
        d=google.com; s=arc-20260327;
        b=fTDwQvoVmzaeJ+R0nvCdAFPjv6EmXGL1xyD8RoKB0kuCd4HLjMnumquxTa3cOss+2s
         cVB7sj5mPJiT8Nf9XphmiCY/P2j+qcs7YDLeYYiK80+q3PQ8pJERXmJGQn8uitS6hM4h
         RDJCS0DDB0a1mAzEwzrWzf+gVeykHpS/A5JNXQRQQI6Z8aZC9DW4utoL8MdLjbPZHMxy
         jFnUK1+hggW58UOpSgZmbGSNaYbbY5F8yG5oapvAHnbakpdSoDqwql4Jg+I583XXle6O
         JlB+ja3W3pK6gg6W3GWknp4kPqmIRYiK3wfq/KoY8d3PXe1lKFMo+hbZOHe/iT5/CQrL
         lxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        fh=/2oEKxj0fakn7KdddNdg7H1kQutjycwm8rB29q4TMQI=;
        b=cRULq6y3Cw2PsyTr8/PBR2jncaY5GsLOfXne41eDRWin8AA70Ucr+zeVggVWSw6qeV
         3oXM9ziQK0kQuYx2rPnDUNN3Wm8JthL2mBLksFLSg14KaAez7kLdkz6GdtTUWdZhX0LC
         qU07v9w5wLAS7sHNCv7qcj/NRMDbo2UePNf84/T+wpVw+MhDnsPDMcDyRU+ukJaZbWyR
         uhgLdze3WnZoKCVF3k3avEyIqh6v4sTCayAuZ3nasB6rqt7tcJzR3mFYNOUgjfJsMr7+
         wZxDX1wO2R6GMUAHqQhLqQbplLTGwNKWYKWmrtRUVWBOzp9s9XnH3Lseh0VT80mc8rrX
         qXYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793963899; x=1794568699; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        b=Y+rgQf+JMpNVGmwxsslOl6z0HTmP6aJFjJop+Kpl2m/4+yqmRNUmuxPPb0hxFOTqZ7
         8k6GRGkC1vH/g4wUQN8Ns+iMKoUN3cjPYvOWJVCdguRjlo1bVp1tIG6B8+z/0XbaZxRi
         /wQyZHVrg18UFIwWsFj/5BKfPU/5ONRKfg2jA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963899; x=1794568699;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLt7jt8i345P9wZ+mNo/dBO8fVAH8LrDxPWxr6MmXNo=;
        b=I+XshRXp1pjVLICjaaS1djGR+Tw3nm9D7eGss3tL79CW2gSVCvpOP5noZJ16yUuQ8J
         oTN7v4E19CYGW6s1Hk7pt3bfsMn4OnkPSZcTyLHxcwwOhNuhTFhRRf+1RNKJpZdXr1sK
         v8yetgHcDMt5ov4j2TmfjNqwdA9pjPep5TTRh2G1iySba3mf/JPhB63YsqzIqHr0XubI
         ZgODJPOZz8/O1sqqw2wDUC3sK9loI/2V4sPimklM+NiAmSpd3G7SDIOy3+YfpBTLSXJi
         mEQ6DDqA83hKTAjreFxqc20cAxnQ3Oz3sTaq0E1OLr4hSPlHnebLvEtibi2uWyWmBykG
         V19Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/G5inHV0HoSU7FJXDQ2YwSS7u8FY1ubOIdQLfvQp6pW8l5XX58+y4ChOPDvhMeae3Rn5DJl7CdXlun5HHNaYntekD@vger.kernel.org
X-Gm-Message-State: APuU4Z/szwJAC1DNky7X5f7H3M83CKZeznB8mmkEM3t5oKTtgAqe1Fy1
	PFyvMV624g7fFqEUqCfbcBo9ugQmPnUrXxs6HiAzu9eX2R3rUalj29PGr0DB+vsQbWgCXnyuHLA
	ttoP+vSy2/46qSu0ObGy7t+Es2gVKl+cND/wMq36fxQ==
X-Gm-Gg: AYBFou3cbSMCP2GOdLOie5pJfE3nF9UOwNfP9BHU+SP8LjTHLXcUTNMkDvQmCWFJ5j9
	GDQkxijBj851rujp6C0cZW2TBOQGthiQ0XOkHeDv6Lo3ndvNTmW1Kk8zP/SD4KpPRtcAzHsOYJO
	Xt1ASv4f5f+dm716awHxZ4RjaxRl75ZVaYYQU3nDb06WtwUGEw6Oh1NycHo+GWt0w8Tw63TSyif
	jylvxTe7ifoyE3Ndocjhd9oiXyQeKs+ba3iSpAPd0fIWwi4Ju8J2+ARugzMf9GXXkLo43OH0gPa
	CqVCLbIKPiogCFzqkyeQsz/yZXV9Ky2pOjP0/m6rYQuqnnyElk020TgN1P1OjX61rPvFNgmTMo+
	eWITQ1DJOQhWORa3QpWjKVT4RB+ocb67fuB3pBSzeD7B4PInWhev0kS+/y/9/ZnAyJrZ7gA==
X-Received: by 2002:a05:6808:2228:b0:55b:fc1e:bcdd with SMTP id
 5614622812f47-567e15a5a4cmr1063799b6e.14.1793963898884; Fri, 06 Nov 2026
 03:18:18 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101161814.1325847-1-chris@miget.com> <20261101161814.1325847-2-chris@miget.com>
 <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
In-Reply-To: <3e44b454-922d-4a1a-8ffd-f77b4cbce654@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Fri, 6 Nov 2026 12:18:04 +0100
X-Gm-Features: AclHuK-WSzaOrVLwR4MSd8v_0fzWBE1pOauYeKH0y-QEzFYWMzpSopPRYHhHWcA
Message-ID: <CAAcRvKPX5i1BmdgkB_Rd=vOr=4+o6-=0SdVt851oRK66WS_q4g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book
 Pro 14 quirk
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2 Nov 2026, Mingyou Chen wrote:
> I'd prefer to have this applied on top of patch 3/4 instead, so the
> infrastructure is in place first.

Sure, v4 will add the quirk after the battery support, with 0x03 as
the battery entry from the start.

Thanks,
Chris


On Mon, Nov 2, 2026 at 12:31=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> =
wrote:
>
> On 11/2/26 00:18, Chris Taraszka wrote:
> > The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
> > its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
> > of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
> > and balanced-performance are no-ops and reading the profile fails with
> > -EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
> > also aborts system suspend.
> >
> > The firmware passes the mode to Intel DTT as an OEM design variable.
> > The DTT tables in its data vault name the modes and set the sustained
> > package power limit (PL1) for each, by power source. For the H484 CPU
> > variant (H404 has the same layout with lower limits):
> >
> >    value  AC                 battery
> >    0x02   Silent  15-25 W    Silent  15-25 W
> >    0x0a   Silent  15-25 W    Silent  15-25 W
> >    0x09   Balance 35-45 W    Balance 32-40 W
> >    0x03   Smart   36-37 W    Turbo   50-58 W
> >    0x04   Crazy   50-58 W    no entry
> >
> > Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
> > selects the same tables as 0x02, and 0x03 gives on battery what 0x04
> > gives on AC, so report them as low-power and performance without
> > offering them for SET. There is no balanced-performance mode.
> >
> > The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
> > so skip the AC type check.
> >
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >      Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484=
)
> >      with this series on top of v15, loaded on v7.3. Firmware mode (EC =
0x68),
> >      DTT OEM variable 1 and PL1 a few seconds after each set:
> >
> >        AC       low-power    0x02  ODV1 2  25 W
> >                 balanced     0x09  ODV1 0  45 W
> >                 performance  0x04  ODV1 4  58 W
> >        battery  low-power    0x02  ODV1 2  25 W
> >                 performance  0x03  ODV1 1  58 W  (with patch 3)
> >
> >      With v2 on battery, balanced set 0x03 and PL1 went to 54 W.
> >
> >   drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index a431d3fef774..63fae12ebd83 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_qu=
irks =3D {
> >       .num_profile_entries =3D ARRAY_SIZE(default_profile_entries),
> >   };
> >
> > +static const struct bitland_profile_entry tm2424_profile_entries[] =3D=
 {
> > +     { PLATFORM_PROFILE_LOW_POWER,   0x02 },
> > +     { PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
> > +     { PLATFORM_PROFILE_BALANCED,    0x09 },
> > +     { PLATFORM_PROFILE_PERFORMANCE, 0x04 },
> > +     { PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
> > +};
> > +
> > +static const struct bitland_mifs_quirks tm2424_quirks =3D {
> > +     .profile_entries =3D tm2424_profile_entries,
> > +     .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
> > +     .skip_ac_type_check =3D true,
> > +};
> > +
> >   static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > +     {
> > +             .matches =3D {
> > +                     DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
> > +                     DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
> > +             },
> > +             .driver_data =3D (void *)&tm2424_quirks,
> > +     },
> >       {}
> >   };
> >
> I'd prefer to have this applied on top of patch 3/4 instead, so the
> infrastructure is in place first.
