Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D10390980
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 19:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775502894; cv=pass; b=J+IVVmbuO4idnint3ZZGEvp+56q03jUB/1OtiuCqK9EqOpsikwLQVXd3VQeXZD0+v/JPccs7GdKrYIstCtQ1ZKZjI//3D7D/cPTb2UYD6wbzVSSwMgwrNqixsy4osHpkNsEqPjQ6kXaQypMiQ68K9ZXBNrcsdNgE+LFbAIWxPrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775502894; c=relaxed/simple;
	bh=6JMHNQmmo/cr2Xj/pwa8316GBl7otSPEW3OFUgmNqXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXrf49bbqP4aeIAkgqRag/SuoaKmVHPw7icfub25jvJaS88APob33sPigzUf9VfK/ix+E/g+I1Yv6R2HfL9b7YOGayHyRFzcyuGI68qErXUoBhQnIM7L8Emc64Ay0gD8K6V7ttbAQq49+cePu0folKJskk076locxC6/TVIWlaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U69/Plxg; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U69/Plxg"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8a210c813f8so35056716d6.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 12:14:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502892; cv=none;
        d=google.com; s=arc-20240605;
        b=KgwTyabvtkt897DEZht0B/vDgnZQ8+UY9KQpYGFDFRaUGYQDenzaMsFtHC8jkLpDqs
         MstDPbOno7XmE9lc6TsaOAQrSMVAlE8orkNVqqVF7V4l1ReiymUmJJc7OMnQ4+Q7T78a
         h+95QhBE8gUSEpZfAGmFs7YaW+v8EaJmXeA7ryJCkRxlodm7DFleZaPDE8EmuyCMvu4/
         6cpbp8pXibVdoJjLdtSJ20VcD6DISE7hRluwgTw1pVYvIBeu5GlBd5+u6LhLUUGNtGMh
         DDEw8VpFirh9XNpvbwH9rIpus/+PSMQ4jryUiyJQ/bZTFIJ2OvSgjN3Y8niTvC97LW0s
         O+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6Xv4MUUiWoZl4G6WjxvKz9+o/hk/qGSqO11xQi3wDw=;
        fh=sECcnOCoOUpcSx92BUJEdWpA4XRW6y/cS5ECYtvUgXw=;
        b=jK1DyTIxAjKPrBZD8wbTBgg+jtT7pXyWRKDYmW7a2IO8qvdtP6/vhgTMVc46WsxRtr
         kKZzKnxUoKXnvOFLUEmv7ExnqRXIBDfAxD4PUr+RYBZqZonm5aX9C7dXJZsE1cG4nvoA
         Zdo5JbHhl0GREt8BWapl9cg3U0vBl6NpF5DEA0h7Sbc+vuqaU9nfSyc6d+c5prIdFd96
         do5E/IWsP1CnpUBBoQwWULa4QO+f0/kR5+vx3ZmeoYUBZPpp0fm1lIhS86zZXd+VIQ3b
         OlgB/wyjcBWlih3RSnIWc2Q7ilcHcqz8YjMer38brwAgbjADvD5UJEKsHJDC7+EZx0V1
         5wTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502892; x=1776107692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6Xv4MUUiWoZl4G6WjxvKz9+o/hk/qGSqO11xQi3wDw=;
        b=U69/PlxgKKlwhUtxoEcRrvmX78bypc5L4ImPf1p5i1OCeGKme7i87R388yNBO8/2kx
         z4rakEyveEpUM1gOyZ3nolaYOVKJsqDdNdXlriN5fHlSfjwsthvq3z+Ma0/VYXfAhZfq
         LPqt8FneyJvhpoXkMjqifrtjbrX0JyhIi0FsmJ+5VDlmAOyBThyz+r5J43oMwvS4I5S8
         nRG2jklIGcC2CnDZ9YrWYuHYaF3nCkc8PDM+CLHRe97QQV4CajVw6X+KHrC+MoQqPAii
         cwa01HhxvBVDJ5B4xF2fhiG6FBVy7qp7TtlZKWsU9sax+C5oToI6B4AswnMBasXq+7+6
         /dqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502892; x=1776107692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6Xv4MUUiWoZl4G6WjxvKz9+o/hk/qGSqO11xQi3wDw=;
        b=KFUtWXT+XnWg6kC3Q8lsPSZvW2AG7hGU/MuxxwDqzQQhf33W69ebH2Ryg8UHd97mau
         bth3v3m+MUs0iniZ7ksuC9YlLgAsLAjXl1CYwRgBcJg2/lltmo24RMKCx/wpUFkz55Ow
         6P/YmVUWJDg0S7yvJzXHuMLSdN7gcnAySdqOVyJ+xO65PEQv5j0inxYumKoYbeNXfitf
         YiKWX8wwOAa0SLKOCKbJCnhh9rnx3I3I45JrqDQza1WSkx5N+G3BTCBKiZjRvHeyXpba
         Lq950k4+Br4Hzw1PIb02bPplC0uvyIXhLtMh3FF/Ss247xL97FJTBA3N1E+7klgYxTx4
         UijA==
X-Forwarded-Encrypted: i=1; AJvYcCUgJIk+E7WiwgItGbYBsqGJcZu2znrsLAIvYSAlFinkD7fyojDLS7yPVBTnKr+9V2KNERAfUCFGVnJzfmL0cbaBY36w@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi3HsLLHnAYMXF+wYJe/71DjKzt5wgTWZLhLjfl4oreoRvJaxO
	dCOo2xhLwKaEIz4eseZJsxYkRUoPs6Biqdwgmt5B0rYch4UOBOO7Z5UAe94JbzFZ0KSjKAGOORx
	rSkOrLOkVhvzpP083oBFMggqfRV24LPU=
X-Gm-Gg: AeBDietS843U24PcdSBXuomRnVIYM9CciAcAWTltumXoUaqDc1oqA8NttFjkkHppPSk
	9iecOanKfm/TR47yqp0W0O1mswK/JWCkFpz5CCiWdnxADyQ2CVb+5o1DzwmIcwRWbvNX5w3XXJW
	+vHWQnHKCuYI9bZ5Kar61RV8lApaMhdHJxKMeImVzMSwrVGWQRHKoBx99SypnTyVSAcMMNu54SB
	UW1WeEvNr69XWUeqQN8rMAa10T/4VJumFQouGyWPPcAtEnMSALzMIGUbHNzmxXmWghrSSckSZl+
	9/XePPHaH0yh/II/U3g=
X-Received: by 2002:a05:6214:8081:b0:8a5:5a37:511 with SMTP id
 6a1803df08f44-8a704fa05aemr210376576d6.42.1775502891451; Mon, 06 Apr 2026
 12:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-12-derekjohn.clark@gmail.com> <22b180a6-c6ee-4785-9cee-577b9f55d48b@app.fastmail.com>
In-Reply-To: <22b180a6-c6ee-4785-9cee-577b9f55d48b@app.fastmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 6 Apr 2026 12:14:40 -0700
X-Gm-Features: AQROBzAfvktFD8QwtjmMbJlY8CNk-7Cxrd_nP0YcdKcXmszTV-ADIzmPUyxhHlI
Message-ID: <CAFqHKTkQdm3Fq_XAbPZ3uk+8NE2Q90sq6SaVJ7xbCBNVvbdc=g@mail.gmail.com>
Subject: Re: [PATCH v7 11/16] platform/x86: lenovo-wmi-other: Add missing CPU
 tunable attributes
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:48=E2=80=AFPM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Derek
>
> On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> > Use an enum for all device ID's and CPU attribute feature ID's,
> > add missing CPU attributes.
> >
> > Reviewed-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v7:
> >   - Fix typo in documentation.
> > v4:
> >   - Align type ID defines.
> >   - Align CPU feature enum values.
> >   - remove cpu_oc_stat from Documentation.
> > v3:
> >   - Remove cpu_oc_stat.
> > ---
> >  .../wmi/devices/lenovo-wmi-other.rst          |  9 ++
> >  drivers/platform/x86/lenovo/wmi-capdata.h     |  5 +-
> >  drivers/platform/x86/lenovo/wmi-other.c       | 99 ++++++++++++++++++-
> >  3 files changed, 107 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > index 01d471156738..189dd4d31926 100644
> > --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> > +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> > @@ -68,9 +68,18 @@ Each attribute has the following properties:
> >   - type
> >
> >  The following firmware-attributes are implemented:
> > + - cpu_temp: CPU Thermal Load Limit
> > + - ppt_cpu_cl: CPU Cross Loading Power Limit
> > + - ppt_pl1_apu_spl: Platform Profile Tracking APU Sustained Power Limi=
t
> >   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
> > + - ppt_pl1_spl_cl: Platform Profile Tracking Cross Loading Sustained
> > Power Limit
> > + - ppt_pl1_tau: Exceed Duration for Platform Profile Tracking
> > Sustained Power Limit
> >   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
> > + - ppt_pl2_sppt_cl: Platform Profile Tracking Cross Loading Slow
> > Package Tracking
> >   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> > + - ppt_pl3_fppt_cl: Platform Profile Tracking Cross Loading Fast
> > Package Power Tracking
> > + - ppt_pl4_ipl: Platform Profile Tracking Instantaneous Power Limit
> > + - ppt_pl4_ipl_cl: Platform Profile Tracking Cross Loading
> > Instantaneous Power Limit
> >
>
> Just wanted to flag that the naming for sppt and fppt seems wrong to me. =
Wanted to make sure it was deliberate.
>
> I have, for Feature ID's:
> 1 =3D CPU Short Term Power Limit (you have Slow package Power Tracking)
> 3 =3D CPU Peak Power Limit (you have as Fast Package Power Tracking)
>

Hmm, that does seem to be what the documentation shows. However, from
what my devices report this appears to be correct in practice. From my
Lenovo Legion Go:

    ATTR{attributes/ppt_pl1_spl/current_value}=3D=3D"20"
    ATTR{attributes/ppt_pl1_spl/max_value}=3D=3D"30"
    ATTR{attributes/ppt_pl2_sppt/current_value}=3D=3D"22"
    ATTR{attributes/ppt_pl2_sppt/max_value}=3D=3D"35"
    ATTR{attributes/ppt_pl3_fppt/current_value}=3D=3D"24"
    ATTR{attributes/ppt_pl3_fppt/max_value}=3D=3D"41"

It seems the max values line up with the intended use cases for each
attribute, and ryzenadj reports the same current values here when
probed. I would personally chock this up to Lenovo documentation being
wrong, but perhaps the situation is different with an Intel device? I
don't have one on hand to verify with.

Thanks,
Derek

> >  LENOVO_FAN_TEST_DATA
> >  -------------------------
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h
> > b/drivers/platform/x86/lenovo/wmi-capdata.h
> > index 1388eaf4ab4a..f2d45cd7a188 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -18,7 +18,10 @@
> >  #define LWMI_ATTR_MODE_ID_MASK       GENMASK(15, 8)
> >  #define LWMI_ATTR_TYPE_ID_MASK       GENMASK(7, 0)
> >
> > -#define LWMI_DEVICE_ID_FAN   0x04
> > +enum lwmi_device_id {
> > +     LWMI_DEVICE_ID_CPU =3D 0x01,
> > +     LWMI_DEVICE_ID_FAN =3D 0x04,
> > +};
> >
> >  #define LWMI_TYPE_ID_NONE 0x00
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c
> > b/drivers/platform/x86/lenovo/wmi-other.c
> > index 19a072bea2d4..56c8b84f306d 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -50,14 +50,21 @@
> >
> >  #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
> >
> > -#define LWMI_DEVICE_ID_CPU 0x01
> > -
> > -#define LWMI_FEATURE_ID_CPU_SPPT 0x01
> > -#define LWMI_FEATURE_ID_CPU_SPL 0x02
> > -#define LWMI_FEATURE_ID_CPU_FPPT 0x03
> > +enum lwmi_feature_id_cpu {
> > +     LWMI_FEATURE_ID_CPU_SPPT =3D      0x01,
> > +     LWMI_FEATURE_ID_CPU_SPL =3D       0x02,
> > +     LWMI_FEATURE_ID_CPU_FPPT =3D      0x03,
> > +     LWMI_FEATURE_ID_CPU_TEMP =3D      0x04,
> > +     LWMI_FEATURE_ID_CPU_APU =3D       0x05,
> > +     LWMI_FEATURE_ID_CPU_CL =3D        0x06,
> > +     LWMI_FEATURE_ID_CPU_TAU =3D       0x07,
> > +     LWMI_FEATURE_ID_CPU_IPL =3D       0x09,
> > +};
> >
> >  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> >
> > +#define LWMI_TYPE_ID_CROSSLOAD       0x01
> > +
> >  #define LWMI_FEATURE_VALUE_GET 17
> >  #define LWMI_FEATURE_VALUE_SET 18
> >
> > @@ -551,18 +558,72 @@ static struct tunable_attr_01 ppt_pl1_spl =3D {
> >       .type_id =3D LWMI_TYPE_ID_NONE,
> >  };
> >
> > +static struct tunable_attr_01 ppt_pl1_spl_cl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_SPL,
> > +     .type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> > +};
> > +
> >  static struct tunable_attr_01 ppt_pl2_sppt =3D {
> >       .device_id =3D LWMI_DEVICE_ID_CPU,
> >       .feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
> >       .type_id =3D LWMI_TYPE_ID_NONE,
> >  };
> >
> > +static struct tunable_attr_01 ppt_pl2_sppt_cl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_SPPT,
> > +     .type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> > +};
> > +
> >  static struct tunable_attr_01 ppt_pl3_fppt =3D {
> >       .device_id =3D LWMI_DEVICE_ID_CPU,
> >       .feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
> >       .type_id =3D LWMI_TYPE_ID_NONE,
> >  };
> >
> > +static struct tunable_attr_01 ppt_pl3_fppt_cl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_FPPT,
> > +     .type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> > +};
> > +
> > +static struct tunable_attr_01 cpu_temp =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_TEMP,
> > +     .type_id =3D LWMI_TYPE_ID_NONE,
> > +};
> > +
> > +static struct tunable_attr_01 ppt_pl1_apu_spl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_APU,
> > +     .type_id =3D LWMI_TYPE_ID_NONE,
> > +};
> > +
> > +static struct tunable_attr_01 ppt_cpu_cl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_CL,
> > +     .type_id =3D LWMI_TYPE_ID_NONE,
> > +};
> > +
> > +static struct tunable_attr_01 ppt_pl1_tau =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_TAU,
> > +     .type_id =3D LWMI_TYPE_ID_NONE,
> > +};
> > +
> > +static struct tunable_attr_01 ppt_pl4_ipl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_IPL,
> > +     .type_id =3D LWMI_TYPE_ID_NONE,
> > +};
> > +
> > +static struct tunable_attr_01 ppt_pl4_ipl_cl =3D {
> > +     .device_id =3D LWMI_DEVICE_ID_CPU,
> > +     .feature_id =3D LWMI_FEATURE_ID_CPU_IPL,
> > +     .type_id =3D LWMI_TYPE_ID_CROSSLOAD,
> > +};
> > +
> >  struct capdata01_attr_group {
> >       const struct attribute_group *attr_group;
> >       struct tunable_attr_01 *tunable_attr;
> > @@ -898,17 +959,45 @@ static bool lwmi_attr_01_is_supported(struct
> > tunable_attr_01 *tunable_attr)
> >               .name =3D _fsname, .attrs =3D _attrname##_attrs          =
     \
> >       }
> >
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
> > +                           "Set the CPU thermal load limit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> > +                           "Set the CPU cross loading power limit");
>
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
> > +                           "Set the APU sustained power limit");
> >  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> >                             "Set the CPU sustained power limit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
> > +                           "Set the CPU cross loading sustained power =
limit");
> >  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> >                             "Set the CPU slow package power tracking li=
mit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
> > +                           "Set the CPU cross loading slow package pow=
er tracking limit");
> >  LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> >                             "Set the CPU fast package power tracking li=
mit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
> > +                           "Set the CPU cross loading fast package pow=
er tracking limit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
> > +                           "Set the CPU sustained power limit exceed d=
uration");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
> > +                           "Set the CPU instantaneous power limit");
> > +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
> > +                           "Set the CPU cross loading instantaneous po=
wer limit");
> > +
>
> Depending on what you think above, these might need updating too
>
> >
> >  static struct capdata01_attr_group cd01_attr_groups[] =3D {
> > +     { &cpu_temp_attr_group, &cpu_temp },
> > +     { &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
> > +     { &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
> >       { &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> > +     { &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
> > +     { &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
> >       { &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> > +     { &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
> >       { &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> > +     { &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
> > +     { &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
> > +     { &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
> >       {},
> >  };
> >
> > --
> > 2.53.0
