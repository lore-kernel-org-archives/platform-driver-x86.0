Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040615;
	b=0anf1muio3x1ZqQ4E/0w5WHhybPltfolNwztXJDBe7/zWGnYew7kk2YQNQsQLzKU1onP
	 mzgF8VuV6F4fthkt49b0pmCAY9VoL0v1z8sunCzrX31ZAUY9qj+sw8kGjT0krHSZGv7j9
	 jUiRRyg9S2dgV/BGXHyH1p9H16Hs63IYJy1zxTq/WufVEeJAvhsdrA+xPQvOu1LpHwZ2G
	 syPT7y1w7EqbXhBYB3HB+yCvybtwNqAmMHxlrwxSxm8Y0zLBCYZn7eF2EAQDfu5VxkRS7
	 I+SsEoa90IAszCCnkj+CaxLHU9vgjOu77/cOR57wEX+oW+/UM0xEdzvrbZRULRSEijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040615;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=GeOWSIs+WFAlcLOlvyJg3ui9WYpfBC2HNmmLSnk4aYw=;
	b=bG61U3XANhAg3TFwGq3Y5Jmyvkdqmn00oxXqcER7B1FXP84fe6fSlSv19V5aGP1vOIxN
	 qkyt9td2fxBR8sJd7tBReAxrqRmtDU8YlTe/VBIbCIymoF8ladVez4jfOqizyWKqXi3/p
	 o3CHRV3eo0p9ocBTU7AxiO8QNA/GdXjCngByd/xN3Kam6ZpI3cTdGprFJDvmjKKyfPJdw
	 83/wJUsAF/llR4jV7xaOigHrgw/cHUBPNFG4u2e9KAOJGfsf5sQAm5voqtDCr5qRzi6xx
	 /SwE7WDROEa09yGsKygauvPpFIFfa/etcNG8hyqw3jr1UNiQ8QU+N7YHYfKm8c5PIzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=NzNMmabJ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AhMW1DUd;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA9606A320
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BABA9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=NzNMmabJ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=AhMW1DUd
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F268E1400126
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 17:23:33 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040612;
	 x=1795127012; bh=GeOWSIs+WFAlcLOlvyJg3ui9WYpfBC2HNmmLSnk4aYw=; b=
	NzNMmabJk/ngtInIeTXWV8Jg+14YQjXAtEmKU8mrIQPQRS/L8nWjzDpE4fcbOnNv
	aLfIpwVNMThxaVj8Yo2Ky8YegVGGmCunevYS8JLJs25DoDoXFXtw9a+KzvJdvpG4
	jssHMKR/PiL1HYeX4HIc9nFOzO991rgLP3nvJNWZIP/XXaHx1zg/CnPzcJBGEiJO
	/66s0LsVJIj6Ok2Sn6ENwgNjK4qPNu5mYYvZX4ovWUug/nFgbkONJBYZCAJd5XU5
	a1NXRsVbx5gS02rctjj8SGZ42LKqXagvveP0UlJojpiCw/YbGOID2QjrTp0vhFrD
	GwD6W+z4Mm/NgFe012EwNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040612; x=
	1795127012; bh=GeOWSIs+WFAlcLOlvyJg3ui9WYpfBC2HNmmLSnk4aYw=; b=A
	hMW1DUdAgKPzMr3IKxvg6UNwzQKJK1SJb5ZdCzw2Us9EINDg9RItzkPsIy0cAqGh
	icbSv9EJyjTzuW2q7goJECycS3gZQpquPKhN39VEdGbMegXdLboJivqp9vfnPNYj
	q5HglaxIKFBNiY8tuxjo2cORbQnOuy0kZLv6/WB1AG30fsvsXG1fDf3NJxKAn0Wm
	XCnFiW8N8NgixGDrvSJvnfNi2quzdQXnx+Q8DABXzAjcJrMmOphoXvhjrAKLuzB2
	84Qg+PAVusHhnmsmG/NGUxXUVQ/Sa84zo0VEZGJ+Jc8iXQBzSidqjc2gTKqFlaUF
	K8iF2SUn7ONVVrQLPBDTA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040612; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:NJLeTIOBQtabqpe3igt2CObIPUbv+0xZ48G3IEKPKnrMPAV
	U4nr2jQfD0NSulsCxpqOelkMCH2giRnCAg7Me86McChcI3GnfnmzXBqsKlFaCOFM
	rfD7c7U0rDez3soryoXlOyonrqRYNe/VkF9mgdw9MoOFgdDutyCI/Xr0DJxQWt3H
	o7s8FJVC2+Bf+rseP29sCZMvIMYfYJJoAGNBMd3nmPF4/gnxPgp+K4we/zywdqCA
	VyeXU1AzlcxbywKCX7bELP/D0ioXvX4c+LMPgUXNJUDtAnoITjLmkh3v1P0g9WA7
	j/itmOe0uz5X9+JO4QSBjKVcKLVskzl3pc2jM7A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:uU1iodwr6PmmULaF+oq5irniuJYvXoQIAFVapHITAJE=:Z7mrX53OrQAu+XKuXoorHJKvWJJ8bKrvMHehMh87jtI=;
X-ME-Sender: <xms:ZCX-aqicS3TRuFJYAjoxabZ8clbu2VA9XiJoBdEpEjtkDpO1tfas3A>
    <xme:ZCX-al13X2nwV-29V0gAP9KNqtj24Ol7o4VjcYGMBQGGMQfOAVVaAS0e2VDxr1di6
    Ek2O47zuwf94CwdfDHadyZOTQqzu-gyZtw1B8Imcl3VjjJJX2YYUCcs>
X-ME-Proxy-Cause: dmFkZTF9S1+LeZt01p4KO4e+fLkt041wT1zZ2J+9UjqUIyYmpCwWhYcPdGGRV6bKhrdATc
    yJOUBsVt3HQuVWCNRmQ3ONILB5XOYHxX5AZjze8rHJEUNV3Q+TP9k3yVRY9MtdNwv1Uj8S
    CzbT/moL9tTlAjO+b+HvJkGlmZjQ/ny3j4mgdKfZhtR+lENqOdKPaeTg+rC0I7o5IN5TzJ
    XwIOc5kwFuaNHENgT1IJ21FasPi13q0ZTvnjkgU2RbAbOSEuZJCNtrz7hRh0V481pGStlb
    dkdEQm6tDae1Hd1UMgIadLTjz+I17AhBFvXV/Xf2/O4fljKEtlrw4AjIQooZ145kci0jnp
    5seo2GpjVqvvKQ5brhx1bLfWsrJZ0AfBcS53/2KA1JFKEZtTmUlQTEBY/3dVti1wyyn8wK
    EboIwP+S/MpVuczQzmq3NzW9VSwVHZCAOp8GXK7lZJFhVWCpAmcy90VbvgHwN+74VraFn3
    hlcG6XL+m3L2dbj+d/34+077AlLzdy4Cworl1ew5NicmHA6BgwA4h5wpIG4iAxNv7xztEk
    7P9S3zgQ1C4eeF3GTtr11vquKj4jjyVGi6pKJuy2y3j3kSHNYf2cnYRRQSWO7NshRGaL5k
    dm92B8yYt0LyPgd0Y4MJ81evooTcsk4m62th62ZAwbMh41JD/aavuHT/9uHw
X-ME-Proxy: <xmx:ZCX-alRQOHTbm7vZq8oxOo8YmgpGX4r4ZmukTPD6liwEftrDnQo-8A>
    <xmx:ZCX-ahWMSSyjcLh6h-HnWdp_E8CK6w-XTSjBH86roN-ZO9dYSs_u0Q>
    <xmx:ZCX-audXpc8k258D_8JnNnFyNuRQhzM3-1kxigoePFEbcs8DJJWPzQ>
    <xmx:ZCX-atKs4F5tzCafYJR_rCQ8r68WrL4T0KLCahlqOnXNZF5X2CZz5A>
    <xmx:ZCX-atmsdUIZtV7y3EwhWkR9OF0k_YPbqYC3W-dyGRWyAPgdCNX2Wh-k>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 004152C00085; Wed, 18 Nov 2026 17:23:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AieRt5HShkzB
Date: Wed, 18 Nov 2026 17:23:11 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b6f3d294-6be4-4d01-99a3-9d41c3c010a0@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-5-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-5-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 5/5] platform/x86: lenovo-wmi-other: Hide unsupported attributes
 using is_visible() callback
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> Currently, all attribute groups are created individually with support
> check beforehand. This is unnecessary as unsupported attributes can be
> hidden by returning SYSFS_GROUP_INVISIBLE in the is_visible() callback of
> the attribute group.
>
> Refactor the lwmi_attr_01_is_supported() function, and wrap it with
> lwmi_attr_01_is_visible(). In this manner, the capdata01_attr_group
> array is now replaced by a standard attribute_group array, which can be
> created and removed at once using sysfs_create_groups() and
> sysfs_remove_groups().
>
> A new field `initialized' is added to tunable_attr_01_ctx to prevent it
> from being initialized twice, as lwmi_attr_01_is_visible() is called
> twice with n == 0, in which once is against the group and the other is
> against the first attribute. The field is cleared on unbind to make sure
> the next rebind caused by userspace writing to the sysfs bind file won't
> get leaked data.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 118 +++++++++++++++++++-------------
>  1 file changed, 72 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index f37dca7db034..6df6669e426e 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -140,6 +140,8 @@ struct tunable_attr_01 {
>  struct tunable_attr_01_ctx {
>  	u8 cd_mode_id; /* mode arg for searching capdata */
>  	u8 cv_mode_id; /* mode arg for set/get current_value */
> +
> +	bool initialized;
>  };
> 
>  enum { TUNABLE_ATTR_01_COUNTER_BASE = __COUNTER__ + 1 };
> @@ -1039,11 +1041,6 @@ struct capdata01_attr {
>  	};
>  };
> 
> -struct capdata01_attr_group {
> -	const struct attribute_group *attr_group;
> -	const struct tunable_attr_01 *tunable_attr;
> -};
> -
>  static inline struct lwmi_om_priv *kobj_to_om_priv(const struct 
> kobject *kobj)
>  {
>  	return dev_get_drvdata(kobj_to_dev(kobj->parent));
> @@ -1055,6 +1052,13 @@ kobj_attr_to_cd01_attr(const struct 
> kobj_attribute *kattr)
>  	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
>  }
> 
> +static inline const struct capdata01_attr *attr_to_cd01_attr(const 
> struct attribute *attr)
> +{
> +	const struct kobj_attribute *kattr = container_of_const(attr, struct 
> kobj_attribute, attr);
> +
> +	return kobj_attr_to_cd01_attr(kattr);
> +}
> +
>  static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct 
> lwmi_om_priv *priv,
>  							 const struct tunable_attr_01 *tunable_attr)
>  {
> @@ -1289,6 +1293,9 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  	struct capdata01 capdata;
>  	int retval, ret, i;
> 
> +	if (ctx->initialized)
> +		return true;
> +
>  	/* Determine cd_mode_id  */
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
>  		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
> @@ -1328,7 +1335,32 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  	dev_dbg(&priv->wdev->dev, "cv_mode_id: %#010x, attribute support 
> level: %#010x\n",
>  		args.arg0, capdata.supported);
> 
> -	return capdata.supported > 0;
> +	ctx->initialized = true;
> +	return true;
> +}
> +
> +/**
> + * lwmi_attr_01_is_visible() - Determine if the given attribute is 
> visible.
> + * @kobj: Pointer to the driver object.
> + * @attr: Pointer to the attribute calling this function.
> + * @n: @attr is the N-th attribute.
> + *
> + * Return: umode_t or SYSFS_GROUP_INVISIBLE.
> + */
> +static umode_t lwmi_attr_01_is_visible(struct kobject *kobj, const 
> struct attribute *attr, int n)
> +{
> +	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
> +
> +	/* Only grab tunable_attr here as not all attributes are cd01_attr. */
> +	if (n == 0) {
> +		const struct capdata01_attr *cd01_attr = attr_to_cd01_attr(attr);
> +		const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
> +
> +		if (!lwmi_attr_01_is_supported(priv, tunable_attr))
> +			return SYSFS_GROUP_INVISIBLE;
> +	}
> +
> +	return attr->mode;
>  }
> 
>  /* Lenovo WMI Other Mode Attribute macros */
> @@ -1377,6 +1409,7 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  	static const struct attribute_group _attrname##_attr_group = {    \
>  		.name = #_attrname,                                       \
>  		.attrs_const = _attrname##_attrs,                         \
> +		.is_visible_const = lwmi_attr_01_is_visible,              \
>  	}
> 
>  /* CPU tunable attributes */
> @@ -1427,30 +1460,30 @@ LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab,
>  LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp,
>  			      "Set the GPU thermal load limit");
> 
> -static struct capdata01_attr_group cd01_attr_groups[] = {
> -	{ &cpu_temp_attr_group, &cpu_temp },
> -	{ &dgpu_boost_clk_attr_group, &dgpu_boost_clk },
> -	{ &dgpu_didvid_attr_group, &dgpu_didvid },
> -	{ &dgpu_enable_attr_group, &dgpu_enable },
> -	{ &gpu_mode_attr_group, &gpu_mode },
> -	{ &gpu_nv_ac_offset_attr_group, &gpu_nv_ac_offset },
> -	{ &gpu_nv_bpl_attr_group, &gpu_nv_bpl },
> -	{ &gpu_nv_cpu_boost_attr_group, &gpu_nv_cpu_boost },
> -	{ &gpu_nv_ctgp_attr_group, &gpu_nv_ctgp },
> -	{ &gpu_nv_ppab_attr_group, &gpu_nv_ppab },
> -	{ &gpu_temp_attr_group, &gpu_temp },
> -	{ &ppt_cpu_cl_attr_group, &ppt_cpu_cl },
> -	{ &ppt_pl1_apu_spl_attr_group, &ppt_pl1_apu_spl },
> -	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
> -	{ &ppt_pl1_spl_cl_attr_group, &ppt_pl1_spl_cl },
> -	{ &ppt_pl1_tau_attr_group, &ppt_pl1_tau },
> -	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
> -	{ &ppt_pl2_sppt_cl_attr_group, &ppt_pl2_sppt_cl },
> -	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
> -	{ &ppt_pl3_fppt_cl_attr_group, &ppt_pl3_fppt_cl },
> -	{ &ppt_pl4_ipl_attr_group, &ppt_pl4_ipl },
> -	{ &ppt_pl4_ipl_cl_attr_group, &ppt_pl4_ipl_cl },
> -	{},
> +static const struct attribute_group *const cd01_attr_groups[] = {
> +	&cpu_temp_attr_group,
> +	&dgpu_boost_clk_attr_group,
> +	&dgpu_didvid_attr_group,
> +	&dgpu_enable_attr_group,
> +	&gpu_mode_attr_group,
> +	&gpu_nv_ac_offset_attr_group,
> +	&gpu_nv_bpl_attr_group,
> +	&gpu_nv_cpu_boost_attr_group,
> +	&gpu_nv_ctgp_attr_group,
> +	&gpu_nv_ppab_attr_group,
> +	&gpu_temp_attr_group,
> +	&ppt_cpu_cl_attr_group,
> +	&ppt_pl1_apu_spl_attr_group,
> +	&ppt_pl1_spl_attr_group,
> +	&ppt_pl1_spl_cl_attr_group,
> +	&ppt_pl1_tau_attr_group,
> +	&ppt_pl2_sppt_attr_group,
> +	&ppt_pl2_sppt_cl_attr_group,
> +	&ppt_pl3_fppt_attr_group,
> +	&ppt_pl3_fppt_cl_attr_group,
> +	&ppt_pl4_ipl_attr_group,
> +	&ppt_pl4_ipl_cl_attr_group,
> +	NULL
>  };
> 
>  /**
> @@ -1459,7 +1492,6 @@ static struct capdata01_attr_group cd01_attr_groups[] = {
>   */
>  static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
>  {
> -	unsigned int i;
>  	int err;
> 
>  	err = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
> @@ -1485,21 +1517,14 @@ static void lwmi_om_fw_attr_add(struct 
> lwmi_om_priv *priv)
> 
>  	dev_set_drvdata(priv->fw_attr_dev, priv);
> 
> -	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
> -		if (!lwmi_attr_01_is_supported(priv, cd01_attr_groups[i].tunable_attr))
> -			continue;
> +	err = sysfs_create_groups(&priv->fw_attr_kset->kobj, cd01_attr_groups);
> +	if (err)
> +		goto err_remove_kset;
> 
> -		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
> -					 cd01_attr_groups[i].attr_group);
> -		if (err)
> -			goto err_remove_groups;
> -	}
>  	return;
> 
> -err_remove_groups:
> -	while (i--)
> -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> -				   cd01_attr_groups[i].attr_group);
> +err_remove_kset:
> +	memset(priv->tunable_attr_ctx, 0, sizeof(priv->tunable_attr_ctx));
> 
>  	kset_unregister(priv->fw_attr_kset);
> 
> @@ -1525,9 +1550,10 @@ static void lwmi_om_fw_attr_remove(struct 
> lwmi_om_priv *priv)
>  	if (priv->ida_id < 0)
>  		return;
> 
> -	for (unsigned int i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
> -		sysfs_remove_group(&priv->fw_attr_kset->kobj,
> -				   cd01_attr_groups[i].attr_group);
> +	sysfs_remove_groups(&priv->fw_attr_kset->kobj, cd01_attr_groups);
> +
> +	/* Don't leak ctx->initialized to the next rebind from userspace. */
> +	memset(priv->tunable_attr_ctx, 0, sizeof(priv->tunable_attr_ctx));
> 
>  	kset_unregister(priv->fw_attr_kset);
>  	device_unregister(priv->fw_attr_dev);
>
Looks good to me
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
