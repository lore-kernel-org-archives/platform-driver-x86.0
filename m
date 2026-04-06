Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56B2DCF61
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 18:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775501159; cv=pass; b=bXJnWz4sQ86MEAhpKop/PnkoAXlXej7DSJEhQa/kl3Nd1DE5HJtV6JUooiySSai48A3/0x2sVX6tpPVMqwxdDr3sQhDRGx02TYV3oKj7fyXFbDhZaLT/szDgO1yntuLCvHqmKfK1ABGQuq2t1MW3zebfRF+M0Osl11LNvQ4abt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775501159; c=relaxed/simple;
	bh=rA2M4+6GWim4ypb7ncIfg4TGn8x9o8200e1yMnOzAaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nc0jm41+1D98uuY1f0+0tLwSNkBZGzUp34rxUxPhGPIV55Qnx6bwgYfhaPYXOGXfhyrB0M4H/Xl47YnlZNfU8KBOQOKo0wM8MRZKTb4GrletRo57/RvMvRtz7e2Q3WCHjmtxjtDgaIvZnsnB+MIVtTr5aWtQ5oP3iSbTyNm/qe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv2nZGn5; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv2nZGn5"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50b392f1846so61353801cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 11:45:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775501156; cv=none;
        d=google.com; s=arc-20240605;
        b=GZXvvGgv4N25sC7QhdSewjgMAN4TOK/4RXOipv0/rY8iFGwZu9JcIwVEf26uraNYkE
         0sE31Cn23PpshGNf9BGA9QMf4VoqA0m/Qa87amoqONYLSgrZMiKpSuFV+3U9HZt0V6wy
         ONA+wS/K4p+H5qWwT4HoHvBvH2Ea5W2kZ8FlYCQKOudjaSAzH4uDfbdWfDolwJTL231Q
         ejIMpwOsdhWGNU+Nh6J2qa4UKMxnq+aLzy44dpAws7cVVI28fcAvs2BFUgixi+sZl+N6
         gT/Lzi8QkDdI31mSdsYlwq82GlBHw/nn6lMEsWrfaCHwbS5LbkopV5mKLxSGYkleQGZk
         Mmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a5k5d8pMuzLV2RTyRDO+PWbDRY7AFUDL364b8/8JiTE=;
        fh=StxgkzamMHAOQHQn+UPkVVwz3FOKoBZ3a3F17DxthIs=;
        b=agvW06EEssgwt05fCiBZXFTQKedcfOK8GRGknXE6pfTh2c75rp54eGp4PFnZ4Cyab1
         j9cnqI80K038DiiFRoqo/PPG9DS/VSr2rtcerJinrMx/YhL73uX2pODtgao0w1R8Qk6V
         NgDrzfUWOktYBPFg63Rpy8PoJRPy4V1B4+fVtTdspOc8qrmpnIRkZ3qAFEckAyppB7Ch
         RbJYLP7F/hL+3JJ72EPfABceNovDuLb6HecupuMRKhqh1qywPuIcVWvd0WFs+m/0Sq7L
         /bkJBj3kXPm2JGLqg9O34LAdpP2mBmWCAR1m7TrTtZSjM8cZaf3jxzCl9Ugsdj/yAU6j
         amKw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775501156; x=1776105956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5k5d8pMuzLV2RTyRDO+PWbDRY7AFUDL364b8/8JiTE=;
        b=Vv2nZGn5oDyobW77tyKMgUsZpht1nh/ZSTUKnU9rRUhLAPHcdd+afXkbvt93UuTPco
         fs2FfDk4f1jcQhbNLDkptmQJMEfCBRtEeUrHhHoDFos/mrEZnCVgMPJOFQoYLNfbZX2c
         3vtCjjwxg2JZAR1LmSzN9Y5BeiEj+FXnkBennpUlPDIJgFkJYHcZEyIYzB7CYQ5dtPZ5
         Q10adyQijZdvjMMG7k6xZA4+AWs0UDZ3f0s/wy67y8qBXT8NSBRYZUE71Qt8sOnQtX3D
         1PnVcwd3BZYPRynVaSuUjRtrohYtAuXMRq1XJeW3jnFKT2JDZnFXcTw3JURKEe+KjSb+
         GtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775501156; x=1776105956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a5k5d8pMuzLV2RTyRDO+PWbDRY7AFUDL364b8/8JiTE=;
        b=pko5bbWGQ+Q/awraMt0rYtb46jPvazBs2eZaAt9f2KD8CYLcZzUiWYlPsXAwOALJg1
         Grl0735gxx17lxoVrAR/LLoQ2kmHeGwLZJN9Oe1pmlDWS7ktCZSVBUD1359CZudwQecT
         jqOGYj6Lx4ei8Apna0AB4wQtjDGN2Cu+gQSE74M+n1cJNnOTCyh0eyL9C8UhgOElGNtP
         7zxsy7k18doqSN9DMuhe/uo2PeSUze6CwYHD/8gBD5iJxrfQShLkENCWT9fi6EfRphQ1
         dpX+OyT1HFdWjolcoynOrE5xjLS+xQuQD7CnCkE4CGmOM9bP31FU4BIzRySUv2frlehu
         rpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4dEYSCFVZJrQOePlar4l7NKfkSAzdWtaQM3RQYy2Fegqo4uLySn67vvjIV2szL0WXI88ulTgrWBnt5c8Yytx2JRtK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwlhq2FYGl8OOAz6bCj+l5O31GNLhwUeY5TbEGI5rl+aQV1Clp
	O/IpEfXlXJxmKxf5U7h+G38ZGSvmdBoXp+SFZtQ4dUQCrmCrHUyzXdMniojcDUc857UJ8vu5ESJ
	MalZ/CaazmtQqZ+o6TFAebJMpWkbeA4Q=
X-Gm-Gg: AeBDietmTM1RtpdgZ+XRwCN79hxH01fJCaKDAxQ6mCFLoY5re/1mR7jBMHam73sApKV
	RKMiarq8G+L/xv43fthrbQBcMPRA2iLcJvWdfHLN8aLF1lDCpgpI54QvFS8sdKEWeKsN3NawaRR
	ABPm+QH9VfV25n7Z/KnNmxslLB1KLzGta+rLQk1PQJNREkMbRViU5Hx358gMDrNdojiJhtMIcac
	WFnIw4DavgtJHnTiDvRD8BhMhMlWqb5qYqnIR5puVYZ/Z+hwDXKpbh4Ns2wLzVkDr4CCcAIvhYV
	5Ug/Ox4qF4pvO4119S0=
X-Received: by 2002:ac8:7d56:0:b0:509:68c:634d with SMTP id
 d75a77b69052e-50d62614d02mr203659951cf.10.1775501156437; Mon, 06 Apr 2026
 11:45:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
 <20260402032424.678528-11-derekjohn.clark@gmail.com> <b9b222fc-58d1-48b9-a918-867dd65d797f@app.fastmail.com>
In-Reply-To: <b9b222fc-58d1-48b9-a918-867dd65d797f@app.fastmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Mon, 6 Apr 2026 11:45:45 -0700
X-Gm-Features: AQROBzAo5KXFxg2yFqluQjgC4m3IhGAI3AT8et4QF410v8GMmwx4SnnsExJV7DY
Message-ID: <CAFqHKTkYQu6_jpi8uLpUy8HG=q00nrqHiJJ2UbHXDjOTPf+DfA@mail.gmail.com>
Subject: Re: [PATCH v7 10/16] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
	Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 5:16=E2=80=AFPM Mark Pearson <mpearson-lenovo@squebb=
.ca> wrote:
>
> Hi Derek,
>
> On Wed, Apr 1, 2026, at 11:24 PM, Derek J. Clark wrote:
> > Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(=
),
> > but as a generic, to de-duplicate attribute_id assignment biolerplate.
> >
> > Reviewed-by: Rong Zhang <i@rong.moe>
> > Tested-by: Rong Zhang <i@rong.moe>
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v7:
> >   - Incorporate additional replacements in lwmi_attr_01_is_supported
> >     after moving the patch that adds it to earlier in the series.
> > v6:
> >   - Move lwmi_attr_id to wmi-capdata.h as static inline.
> > v5:
> >   - Move references to cv/cd_mode_id to patch 4/8.
> >   - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
> > v4:
> >   - Switch from macro to static inline to preserve types.
> > ---
> >  drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++--
> >  drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++
> >  drivers/platform/x86/lenovo/wmi-other.c   | 56 ++++++++---------------
> >  3 files changed, 43 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c
> > b/drivers/platform/x86/lenovo/wmi-capdata.c
> > index ee1fb02d8e31..169665be4dcf 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -27,7 +27,6 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >
> >  #include <linux/acpi.h>
> > -#include <linux/bitfield.h>
> >  #include <linux/bug.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/component.h>
> > @@ -48,6 +47,7 @@
> >  #include <linux/wmi.h>
> >
> >  #include "wmi-capdata.h"
> > +#include "wmi-helpers.h"
> >
> >  #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5=
BB300E"
> >  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE=
018154"
> > @@ -58,9 +58,9 @@
> >
> >  #define LWMI_FEATURE_ID_FAN_TEST 0x05
> >
> > -#define LWMI_ATTR_ID_FAN_TEST                                         =
               \
> > -     (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |         =
       \
> > -      FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
> > +#define LWMI_ATTR_ID_FAN_TEST                                      \
> > +     lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
> > +                  LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
> >
> >  enum lwmi_cd_type {
> >       LENOVO_CAPABILITY_DATA_00,
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h
> > b/drivers/platform/x86/lenovo/wmi-capdata.h
> > index 8c1df3efcc55..1388eaf4ab4a 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> > @@ -6,6 +6,7 @@
> >  #define _LENOVO_WMI_CAPDATA_H_
> >
> >  #include <linux/bits.h>
> > +#include <linux/bitfield.h>
> >  #include <linux/types.h>
> >
> >  #define LWMI_SUPP_VALID              BIT(0)
> > @@ -19,6 +20,8 @@
> >
> >  #define LWMI_DEVICE_ID_FAN   0x04
> >
> > +#define LWMI_TYPE_ID_NONE 0x00
> > +
> >  struct component_match;
> >  struct device;
> >  struct cd_list;
> > @@ -57,6 +60,23 @@ struct lwmi_cd_binder {
> >       cd_list_cb_t cd_fan_list_cb;
> >  };
> >
> > +/**
> > + * lwmi_attr_id() - Formats a capability data attribute ID
> > + * @dev_id: The u8 corresponding to the device ID.
> > + * @feat_id: The u8 corresponding to the feature ID on the device.
> > + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get=
.
> > + * @type_id: The u8 corresponding to the sub-device.
> > + *
> > + * Return: u32.
> > + */
> > +static inline u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8
> > type_id)
> > +{
> > +     return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> > +             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> > +             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> > +             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> > +}
> > +
> >  void lwmi_cd_match_add_all(struct device *master, struct
> > component_match **matchptr);
> >  int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct
> > capdata00 *output);
> >  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct
> > capdata01 *output);
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c
> > b/drivers/platform/x86/lenovo/wmi-other.c
> > index 25ddfd54f692..19a072bea2d4 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -27,7 +27,6 @@
> >   */
> >
> >  #include <linux/acpi.h>
> > -#include <linux/bitfield.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/component.h>
> >  #include <linux/container_of.h>
> > @@ -59,8 +58,6 @@
> >
> >  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> >
> > -#define LWMI_TYPE_ID_NONE 0x00
> > -
> >  #define LWMI_FEATURE_VALUE_GET 17
> >  #define LWMI_FEATURE_VALUE_SET 18
> >
> > @@ -70,10 +67,9 @@
> >
> >  #define LWMI_FAN_DIV 100
> >
> > -#define LWMI_ATTR_ID_FAN_RPM(x)                                       =
       \
> > -     (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |        \
> > -      FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |  \
> > -      FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> > +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> > +     lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> > +                  LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> >
> >  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> >  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> > @@ -616,12 +612,8 @@ static ssize_t attr_capdata01_show(struct kobject =
*kobj,
> >       u32 attribute_id;
> >       int value, ret;
> >
> > -     attribute_id =3D
> > -             FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id=
) |
> > -             FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_=
id) |
> > -             FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
> > -                        LWMI_GZ_THERMAL_MODE_CUSTOM) |
> > -             FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id)=
;
> > +     attribute_id =3D lwmi_attr_id(tunable_attr->device_id, tunable_at=
tr->feature_id,
> > +                                 LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_=
attr->type_id);
> >
> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdat=
a);
> >       if (ret)
> > @@ -686,10 +678,8 @@ static ssize_t attr_current_value_store(struct
> > kobject *kobj,
> >       if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
> >               return -EBUSY;
> >
> > -     args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->dev=
ice_id) |
> > -                 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feat=
ure_id) |
> > -                 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_m=
ode_id) |
> > -                 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type=
_id);
> > +     args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr-=
>feature_id,
> > +                              tunable_attr->cd_mode_id, tunable_attr->=
type_id);
> >
> >       ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> >       if (ret)
> > @@ -702,10 +692,8 @@ static ssize_t attr_current_value_store(struct
> > kobject *kobj,
> >       if (value < capdata.min_value || value > capdata.max_value)
> >               return -EINVAL;
> >
> > -     args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->dev=
ice_id) |
> > -                 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feat=
ure_id) |
> > -                 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_m=
ode_id) |
> > -                 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type=
_id);
> > +     args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr-=
>feature_id,
> > +                              tunable_attr->cv_mode_id, tunable_attr->=
type_id);
> >       args.arg1 =3D value;
> >
> >       ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE=
_SET,
> > @@ -750,10 +738,8 @@ static ssize_t attr_current_value_show(struct
> > kobject *kobj,
> >       if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> >               mode =3D tunable_attr->cv_mode_id;
> >
> > -     args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->dev=
ice_id) |
> > -                 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feat=
ure_id) |
> > -                 FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> > -                 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type=
_id);
> > +     args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr-=
>feature_id,
> > +                              tunable_attr->cv_mode_id, tunable_attr->=
type_id);
> >
> >       ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE=
_GET,
> >                                   (unsigned char *)&args, sizeof(args),
> > @@ -794,10 +780,8 @@ static bool lwmi_attr_01_is_supported(struct
> > tunable_attr_01 *tunable_attr)
> >
> >       /* Determine tunable_attr->cd_mode_id*/
> >       for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> > -             args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_a=
ttr->device_id) |
> > -                         FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_at=
tr->feature_id) |
> > -                         FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) =
|
> > -                         FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_at=
tr->type_id);
> > +             args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunab=
le_attr->feature_id,
> > +                                      modes[i], tunable_attr->type_id)=
;
> >
> >               ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &c=
apdata);
> >               if (ret || !capdata.supported)
> > @@ -810,15 +794,10 @@ static bool lwmi_attr_01_is_supported(struct
> > tunable_attr_01 *tunable_attr)
> >       if (!cd_mode_found)
> >               return cd_mode_found;
> >
> > -     dev_dbg(tunable_attr->dev,
> > -             "cd_mode_id: %#010x\n", args.arg0);
> > -
> >       /* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
> >       for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> > -             args.arg0 =3D FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_a=
ttr->device_id) |
> > -                         FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_at=
tr->feature_id) |
> > -                         FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) =
|
> > -                         FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_at=
tr->type_id);
> > +             args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunab=
le_attr->feature_id,
> > +                                      modes[i], tunable_attr->type_id)=
;
> >
> >               ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATU=
RE_VALUE_GET,
> >                                           (unsigned char *)&args, sizeo=
f(args),
> > @@ -833,7 +812,10 @@ static bool lwmi_attr_01_is_supported(struct
> > tunable_attr_01 *tunable_attr)
> >       if (!cv_mode_found)
> >               return cv_mode_found;
> >
> > -     dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support
> > level: %#010x\n",
> > +     dev_dbg(tunable_attr->dev,
> > +             "cd_mode_id: %#010x, cv_mode_id: %#010x, attribute suppor=
t level:
> > %#010x\n",
> > +             lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> > +                          tunable_attr->cd_mode_id, tunable_attr->type=
_id),
> >               args.arg0, capdata.supported);
> >
>
> Minor comment, but I did wonder if it would be better to have two args in=
 this function:
> struct wmi_method_args_32 cv_mode_args =3D { 0x0, 0x0 };
> struct wmi_method_args_32 cd_mode_args =3D { 0x0, 0x0 };
>
> Just because later (patch 10) you end up having to do the calculation twi=
ce due to the dev_dbg call?
>
> Mark

I have no strong feelings either way. Seems like a minor enough change
that I can do it for v8, but I'd like to avoid flip flopping on this
if its going to delay the patch.

Derek
