Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795112917;
	b=O8PzlSPYqJ8P+eDkL57veiiHiExtDtJKKLw1QuBxWvPfwWWG1xqvq7VpDoj7bKzWIvYV
	 /1RyX0cUzINrO2TQmNpY+dW7m+10s5tlEcE+5iMsPfWt9TuvrdrxlZnnQBaaLOTJdwUPs
	 qsdz6cnSAKiMeNMit4NRIYq4go/BgA7mGin6tudbZ6GJxeoCqMfSVuly3u86NYAZwOthv
	 PXjDoheT/G7gxrydNMuMa6sMrMS1irK4jMzm2EHp7hCYwRELTSzUtapj9gn+dtrKEIqV9
	 ZxnqjU4bHFSUMDWk6UbgGuZq3pIaYD79O0xaZ94K3EiedmTJQhrOt29qOyQXG4G7Isw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112917;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=HcJ94gLYxrZRcn8wmqvx/bbkk7euLk0Wkz2Nwgu2TaE=;
	b=Q1/ZJztotVqV3vcZu9xMJ4YUYxsDPaSTcJ4bGiEUwxEu2EuyEaT9GvgTx0M83Gg1bE3p
	 Oofoi2BcLMIU+PKyg7NN+5SBrRVWq6UyUa6fWfp4GzMZhb0icDDKqkP7WRyvoztnhqYAi
	 rMYzLeWXGPF/F29DGAH7JUwHwU5NvOgJtqfl2pto7auJmAE97dycYCjLdyOAR9gH9Lx8t
	 H1a2CAsWGlpg8nK1P2737ff6PPxvJJgjzItb0aj5BV2gXay/cy7dhMeLFQHP+iKuqEVzb
	 /WUX3llnUXZHLUfJJ9GW1CG1815sKIKoeop1woxOMdPigIiRBWOYNzGldQzSBUCQ3tQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pTYUIyu6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7731606A320;
	Thu, 19 Nov 2026 18:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7731606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pTYUIyu6
ARC-Seal: i=1; a=rsa-sha256; t=1795112908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gD9zSMy+lCvWX9jfY39Oe8uKiRIvUnOBk7//2AyBA+7/B271AXBwxUVI11NRyuE8ngkJAFsbGhvJdq67HLIUCzCp+Prl2dwQ8YS9WCIeG+z3Pbboe/EUPYDrsQE7iRVUD1GUaunqUhPaGXxIjfUH+qTmE+dqJ4kHlxRrJbpjJu8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795112908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HcJ94gLYxrZRcn8wmqvx/bbkk7euLk0Wkz2Nwgu2TaE=; 
	b=GUvp1zDbeYji1JVi87upgaLTgzrnUggy2oE+MvDAoVRzBVGsPGJzboN0iYE2HT2B76WqcLAsvPC3WWIG00cg6T9YkbnzcN75GLzFEmANRQLtkjS/Amw+TiPfYjNC48YH8lUQTokJ59PQbmGpWUBzPe+YVMGS0xeTVrYN1U8qUC4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=pTYUIyu61g/1TDJJrxeySFqJzb9C4g/QIErayA7O5jTlEQmSnBfK57mWL0064GVIkBWo7QT99Wgt77iaoED5N98THmDAnHO0/CDoStvJxp6tR84A8SeILk7wPuHEOXeuvbVD/yawtNuQOf/jYuK0YzKMR8JUetYFoH0afsJA68Mt6yvGs5sngpkMgn7pZUKhBn8s7Zg2vfiLoKt0OhuM7UKzMbN/4x4igqJAyslHP5yPqS6noXGBrWIHQ+K0GGc/cMb+bNn+b+m/Wx1qYGpgfRyAzKyQLKXGMgMQwwqtG0VzOOijsP4U0F4pxXiqCbtMgAXQ0J3MYZq3/EUokwb3RQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=HcJ94gLYxrZRcn8wmqvx/bbkk7euLk0Wkz2Nwgu2TaE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795112904719592.183114420632;
	Thu, 19 Nov 2026 10:28:24 -0800 (PST)
Message-ID: <5b82091b356a4134ba59e032bd927049b3a6451a.camel@rong.moe>
Subject: Re: [PATCH 4/5] platform/x86: lenovo-wmi-other: Properly implement
 no_singleton driver
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Alok Tiwari
 <alok.a.tiwari@oracle.com>, Armin Wolf <W_Armin@gmx.de>
Cc: "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <b5c81884-73b0-4d43-98e5-cd2fedcf583f@app.fastmail.com>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
	 <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe>
	 <b5c81884-73b0-4d43-98e5-cd2fedcf583f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:23:18 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Mark,

Thanks for reviewing this.

On Wed, 2026-11-18 at 17:27 -0500, Mark Pearson wrote:
>=20
> On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> > The driver declares `.no_singleton =3D true' but stores device-specific
> > data to statically allocated tunable_attr_01 variables. This makes the
> > driver depend on the frigile fact that no device in wild has more than
>=20
> Minor typo - frigile/fragile

Whoops, I constantly type this word in the wrong way. Sigh...

>=20
> > one LENOVO_OTHER_MODE WMI devices.
> >=20
>=20
> As an aside - is this really fragile? I mean realistically it's never goi=
ng to happen is it?

I wrote the commit message like this because depending on global states
violates the requirements of a no_singleton driver anyway. I will
rephrase it to make it focus on constifying tunable_attr_01 instead.

>=20
> > Add unique indexes to all statically allocated tunable_attr_01 variable=
s
> > with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
> > newly-introduced tunable_attr_01_ctx array. In this manner, move all
> > device-specific data to the tunable_attr_01_ctx array, and constify all
> > statically allocated tunable_attr_01 variables to make the driver a
> > truly no_singleton driver.

If the __COUNTER__ tricks are a bit hard for you to keep up with, let me
explain below:

> >=20
> > Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding=20
> > attributes to supported devices")
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> >  drivers/platform/x86/lenovo/wmi-other.c | 54=20
> > ++++++++++++++++++++++++---------
> >  1 file changed, 39 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> > b/drivers/platform/x86/lenovo/wmi-other.c
> > index 252ef775f300..f37dca7db034 100644
> > --- a/drivers/platform/x86/lenovo/wmi-other.c
> > +++ b/drivers/platform/x86/lenovo/wmi-other.c
> > @@ -134,15 +134,23 @@ struct tunable_attr_01 {
> >  =09u8 feature_id;
> >  =09u8 device_id;
> >  =09u8 type_id;
> > +=09u8 ctx_id; /* Index to tunable_attr_01_ctx[] */
> > +};
> > +
> > +struct tunable_attr_01_ctx {
> >  =09u8 cd_mode_id; /* mode arg for searching capdata */
> >  =09u8 cv_mode_id; /* mode arg for set/get current_value */
> >  };
> >=20
> > +enum { TUNABLE_ATTR_01_COUNTER_BASE =3D __COUNTER__ + 1 };

__COUNTER__ is like counter++ in C, but for C preprocessor.

This uses an enumeration to retrieve its value (say, 403). Once
retrieved, __COUNTER__ is self-incremented, so the retrieved value plus
one equals the "current" value.

   TUNABLE_ATTR_01_COUNTER_BASE =3D (counter++) + 1 =3D 403 + 1 =3D 404

> > +#define TUNABLE_ATTR_01_COUNTER (__COUNTER__ - TUNABLE_ATTR_01_COUNTER=
_BASE)

Defining a macro does not consume the __COUNTER__. The "current" value
remains unchanged. That's why enumeration is used above and below.

> > +
> >  #define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)=09\
> > -=09static struct tunable_attr_01 _name =3D {=09=09=09\
> > +=09static const struct tunable_attr_01 _name =3D {=09=09\
> >  =09=09.device_id =3D LWMI_DEVICE_ID_##_device,=09=09\
> >  =09=09.feature_id =3D LWMI_FEATURE_ID_##_feature,=09\
> >  =09=09.type_id =3D LWMI_TYPE_ID_##_type,=09=09\
> > +=09=09.ctx_id =3D TUNABLE_ATTR_01_COUNTER,=09=09\

This does not consume the __COUNTER__, too.

> >  =09}
> >=20
> >  DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);

Here it's consumed!

   ppt_pl1_spl.ctx_id      =3D (counter++) - 404 =3D 404 - 404 =3D 0
   ppt_pl1_spl_cl.ctx_id   =3D (counter++) - 404 =3D 405 - 404 =3D 1

...and so on.

> > @@ -168,6 +176,10 @@ DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU,=20
> > DGPU_DIDVID, NONE);
> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
> >  DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);

   gpu_nv_cpu_boost.ctx_id =3D (counter++) - 404 =3D 425 - 404 =3D 21

> >=20
> > +enum { TUNABLE_ATTR_01_NR =3D TUNABLE_ATTR_01_COUNTER };

   TUNABLE_ATTR_01_NR      =3D (counter++) - 404 =3D 426 - 404 =3D 22

That's it! In this manner, the C preprocessor stores self-increment ids
to all tunable_attr_01 variables, so that the latter can be constified
during compilation.

For your minor note in PATCH 3, I will fix the order when I resubmit the
series. I will wait for Derek's review before the resubmission.

Thanks,
Rong

> > +
> > +static_assert(TUNABLE_ATTR_01_NR > 0 && TUNABLE_ATTR_01_NR < U8_MAX);
> > +
> >  struct lwmi_om_priv {
> >  =09struct component_master_ops *ops;
> >=20
> > @@ -183,6 +195,8 @@ struct lwmi_om_priv {
> >=20
> >  =09struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> >=20
> > +=09struct tunable_attr_01_ctx tunable_attr_ctx[TUNABLE_ATTR_01_NR];
> > +
> >  =09struct {
> >  =09=09bool capdata00_collected : 1;
> >  =09=09bool capdata_fan_collected : 1;
> > @@ -1018,7 +1032,7 @@ static u32 tunable_attr_01_id(const struct=20
> > tunable_attr_01 *attr, u8 mode)
> >=20
> >  struct capdata01_attr {
> >  =09struct kobj_attribute kobj_attr;
> > -=09struct tunable_attr_01 *tunable_attr;
> > +=09const struct tunable_attr_01 *tunable_attr;
> >  =09union {
> >  =09=09enum attribute_property prop;
> >  =09=09const char *display_name;
> > @@ -1027,7 +1041,7 @@ struct capdata01_attr {
> >=20
> >  struct capdata01_attr_group {
> >  =09const struct attribute_group *attr_group;
> > -=09struct tunable_attr_01 *tunable_attr;
> > +=09const struct tunable_attr_01 *tunable_attr;
> >  };
> >=20
> >  static inline struct lwmi_om_priv *kobj_to_om_priv(const struct=20
> > kobject *kobj)
> > @@ -1041,6 +1055,12 @@ kobj_attr_to_cd01_attr(const struct=20
> > kobj_attribute *kattr)
> >  =09return container_of_const(kattr, struct capdata01_attr, kobj_attr);
> >  }
> >=20
> > +static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct=20
> > lwmi_om_priv *priv,
> > +=09=09=09=09=09=09=09 const struct tunable_attr_01 *tunable_attr)
> > +{
> > +=09return &priv->tunable_attr_ctx[tunable_attr->ctx_id];
> > +}
> > +
> >  /* Attribute Methods */
> >=20
> >  /**
> > @@ -1098,12 +1118,13 @@ static ssize_t attr_capdata01_show(struct kobje=
ct *kobj,
> >  =09struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
> >  =09const struct capdata01_attr *cd01_attr =3D kobj_attr_to_cd01_attr(k=
attr);
> >  =09const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
> > +=09struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
> >  =09enum attribute_property prop =3D cd01_attr->prop;
> >  =09struct capdata01 capdata;
> >  =09u32 attribute_id;
> >  =09int value, ret;
> >=20
> > -=09attribute_id =3D tunable_attr_01_id(tunable_attr, tunable_attr->cd_=
mode_id);
> > +=09attribute_id =3D tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
> >=20
> >  =09ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata)=
;
> >  =09if (ret)
> > @@ -1152,6 +1173,7 @@ static ssize_t attr_current_value_store(struct=
=20
> > kobject *kobj,
> >  =09struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
> >  =09const struct capdata01_attr *cd01_attr =3D=20
> > kobj_attr_to_cd01_attr(kattr);
> >  =09const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
> > +=09struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
> >  =09struct wmi_method_args_32 args =3D {};
> >  =09struct capdata01 capdata;
> >  =09enum thermal_mode mode;
> > @@ -1165,7 +1187,7 @@ static ssize_t attr_current_value_store(struct=
=20
> > kobject *kobj,
> >  =09if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
> >  =09=09return -EBUSY;
> >=20
> > -=09args.arg0 =3D tunable_attr_01_id(tunable_attr, tunable_attr->cd_mod=
e_id);
> > +=09args.arg0 =3D tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
> >=20
> >  =09ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
> >  =09if (ret)
> > @@ -1178,7 +1200,7 @@ static ssize_t attr_current_value_store(struct=
=20
> > kobject *kobj,
> >  =09if (value < capdata.min_value || value > capdata.max_value)
> >  =09=09return -EINVAL;
> >=20
> > -=09args.arg0 =3D tunable_attr_01_id(tunable_attr, tunable_attr->cv_mod=
e_id);
> > +=09args.arg0 =3D tunable_attr_01_id(tunable_attr, ctx->cv_mode_id);
> >  =09args.arg1 =3D value;
> >=20
> >  =09ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_S=
ET,
> > @@ -1208,6 +1230,7 @@ static ssize_t attr_current_value_show(struct=20
> > kobject *kobj,
> >  =09struct lwmi_om_priv *priv =3D kobj_to_om_priv(kobj);
> >  =09const struct capdata01_attr *cd01_attr =3D=20
> > kobj_attr_to_cd01_attr(kattr);
> >  =09const struct tunable_attr_01 *tunable_attr =3D cd01_attr->tunable_a=
ttr;
> > +=09struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
> >  =09struct wmi_method_args_32 args =3D {};
> >  =09enum thermal_mode mode;
> >  =09int retval;
> > @@ -1218,8 +1241,8 @@ static ssize_t attr_current_value_show(struct=20
> > kobject *kobj,
> >  =09=09return ret;
> >=20
> >  =09/* If "no-mode" is the supported mode, ensure we never send current=
 mode */
> > -=09if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> > -=09=09mode =3D tunable_attr->cv_mode_id;
> > +=09if (ctx->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> > +=09=09mode =3D ctx->cv_mode_id;
> >=20
> >  =09args.arg0 =3D tunable_attr_01_id(tunable_attr, mode);
> >=20
> > @@ -1243,21 +1266,22 @@ static ssize_t attr_current_value_show(struct=
=20
> > kobject *kobj,
> >   * First check if the attribute has a corresponding data table under=
=20
> > custom mode
> >   * (0xff), then under no mode (0x00). If either of those passes, check=
=20
> > if the
> >   * supported field of the capdata struct is > 0. If it is supported,=
=20
> > store the
> > - * successful mode in the cd_mode_id field of tunable_attr.
> > + * successful mode in the cd_mode_id field of tunable_attr_01_ctx.
> >   *
> >   * If the attribute capdata shows it is supported, attempt to=20
> > determine the mode
> >   * for the current value property get/set methods using a similar=20
> > pattern to the
> >   * capdata table check. If the value returned by either mode is 0 or=
=20
> > an error,
> >   * assume that mode is not supported. Otherwise, store the successful=
=20
> > mode in the
> > - * cv_mode_id field of tunable_attr.
> > + * cv_mode_id field of tunable_attr_01_ctx.
> >   *
> >   * If any of the above checks fail then the attribute is not fully=20
> > supported.
> >   *
> >   * Return: true if capdata and set/get modes are found, otherwise=20
> > false.
> >   */
> >  static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
> > -=09=09=09=09      struct tunable_attr_01 *tunable_attr)
> > +=09=09=09=09      const struct tunable_attr_01 *tunable_attr)
> >  {
> > +=09struct tunable_attr_01_ctx *ctx =3D tunable_to_ctx(priv, tunable_at=
tr);
> >  =09u8 modes[2] =3D { LWMI_GZ_THERMAL_MODE_CUSTOM,=20
> > LWMI_GZ_THERMAL_MODE_NONE };
> >  =09struct wmi_method_args_32 args =3D {};
> >  =09bool cd_mode_found =3D false;
> > @@ -1265,7 +1289,7 @@ static bool lwmi_attr_01_is_supported(struct=20
> > lwmi_om_priv *priv,
> >  =09struct capdata01 capdata;
> >  =09int retval, ret, i;
> >=20
> > -=09/* Determine tunable_attr->cd_mode_id */
> > +=09/* Determine cd_mode_id  */
> >  =09for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> >  =09=09args.arg0 =3D tunable_attr_01_id(tunable_attr, modes[i]);
> >=20
> > @@ -1273,7 +1297,7 @@ static bool lwmi_attr_01_is_supported(struct=20
> > lwmi_om_priv *priv,
> >  =09=09if (ret || !capdata.supported)
> >  =09=09=09continue;
> >=20
> > -=09=09tunable_attr->cd_mode_id =3D modes[i];
> > +=09=09ctx->cd_mode_id =3D modes[i];
> >  =09=09cd_mode_found =3D true;
> >  =09=09break;
> >  =09}
> > @@ -1283,7 +1307,7 @@ static bool lwmi_attr_01_is_supported(struct=20
> > lwmi_om_priv *priv,
> >=20
> >  =09dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args.arg0);
> >=20
> > -=09/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
> > +=09/* Determine cv_mode_id, returns 1 if supported  */
> >  =09for (i =3D 0; i < ARRAY_SIZE(modes); i++) {
> >  =09=09args.arg0 =3D tunable_attr_01_id(tunable_attr, modes[i]);
> >=20
> > @@ -1293,7 +1317,7 @@ static bool lwmi_attr_01_is_supported(struct=20
> > lwmi_om_priv *priv,
> >  =09=09if (ret || !retval)
> >  =09=09=09continue;
> >=20
> > -=09=09tunable_attr->cv_mode_id =3D modes[i];
> > +=09=09ctx->cv_mode_id =3D modes[i];
> >  =09=09cv_mode_found =3D true;
> >  =09=09break;
> >  =09}
> >=20
> > --=20
> > 2.55.0
>=20
> This one defeated me I'm afraid (the counter bits in particular) - I need=
 to look at it with fresh eyes as my brain has packed up for the day.
>=20
> Mark
