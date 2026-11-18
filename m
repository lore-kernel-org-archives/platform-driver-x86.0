Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040874;
	b=XvAAM8nHnoEsKOr7EjJq9QYR5QBbMLJsXS6pAW5/vLEW9/I0boM/wH2bOsqsymzuRQ0t
	 zI6003wjqnqqbDMOytQfK6g/YWaz0Jqka6RumY6J6v+R89x6BmQSKZi3O0BKdsw8YynX9
	 FDxlOs+8YmwqECyLQsp9pEXxw9HFzAQ4hX8haIvorUwMo4oKYQVFvwhxziPpsNRGOydlD
	 FSum+bmSGKAFykOjJgmL8ljBn4PyT8R8CRX6pqnvoxPN4MdWjwslX5lx3LhJeWwP8ltWb
	 xJWLjLLJv6cHDBgivd174gq60GqMdjn3cMapoMnCovU6j85fCMNJbLKNiBe1YAIWjQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040874;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=vvUWFa2J5qwS6mcHcRJdQ/F9mm7gUHOHWpHh3iiQ2xw=;
	b=3l8aSd7X3dtY89Q4qSz79b0qW8QKjd6pkJ4hxFQQad4B9JeRY7ms0JClqueMctPtG+WG
	 8g5O8k+JPu2bQ72kn2Pkv1Uz0zxZmAp2MqmAlZNPC9mnVjjjV65UkWQlYpk0k1RXQZ/ZP
	 29/IoOgpzUYHxsuqPVgDUsCbpmeuE8LYJlUiF5MqAC6BvMVfQ1ijPjnyOThL3w/RJ3izp
	 l+HDLJJWeIGnkvhi2WAKjZanZsNdkrYIzyADTa5O2jmre1tYySND2hAMb74OS0b7tXOE+
	 dkvXobS9lRKFV/NJ4ftzglmCqoDURWhlDM7hFdlvYRTJ1+0hvNE3dZk47kiMnElmIfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=RE1cA7xC;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=a2g1hfrO;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A4606A330
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075A4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=RE1cA7xC;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=a2g1hfrO
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 451411400167
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 17:27:53 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:27:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040871;
	 x=1795127271; bh=vvUWFa2J5qwS6mcHcRJdQ/F9mm7gUHOHWpHh3iiQ2xw=; b=
	RE1cA7xCgYutzGbEp6Bb1IUVKloxan0DJoFfiN89WZ/pGidhNEVXd1kxbvLcBciu
	6Zb/AysRBEeQz2oT14CQRKcody3kQQCLd4G1XwhauGvsRGMHuKqoShVnQHA+nIDG
	5we4Y4zxK/p3WKt8i1S9RPg2jGIzJFTMQwrHcYR8bQN5p8JrmzolU8Y7tLaSQh7Y
	kLZk+kGS2wgrds+R8BQmIjv53YLxyvlgtUxlw9Q7W7rPE0SFOuykDjqcPUbr2wWZ
	bMJUqXhwyVP6U6gInm2vFY41l4DGt4qUU4C6cXniye0XZvOp3/PvYvEboEVXPLE5
	LkFnTvVgfMkQ8UaGer59Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040871; x=
	1795127271; bh=vvUWFa2J5qwS6mcHcRJdQ/F9mm7gUHOHWpHh3iiQ2xw=; b=a
	2g1hfrOMhJDJLPJaQVEdLRxnsO15fPmc9BcQZoutHLuAOca1wx4fqePljoh5Ji1z
	5v48kwolF0uNYGz8zjjeDWBYh1jTx/67a1CV7LQ0uxX50a0wRNKz46dLaHNzmZSl
	tIzQQKHYZnZrOTnpfR6k2IUEuzdKE9DtcNLL/VHUy+1WCqswd6Xiz4xT788tpmT6
	EbGaFFladVsrCtrKTx3VR0CJ1WUvBcuTZmuvWa102fwLFPhrDmbSb9Sho4gC4lGk
	7adqWl8TPjz9viOpzjhzO3mLIT+spiEt78IuRWwnOTXTAYoogOpVmauOdjCJnBfy
	GwXdA+eMTOMU0CEmHYMuA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040871; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:Y7SQme4qyAiekj1ZDoGAy2S8wTOiEGc9h8qTe/nNVXCiZVI
	dkGUY4DFEP7j9yTixNvq6WpLU+gnrpeCLvvu5dKo/BBZujG/LlmSGyU3KPSJYSBR
	WujQIhVLipXLtfxXYxKZof1NZZSCpgDfv1NCjUlyIthsZFBHRq/gclvRncijJH3V
	e1sfWhYL2O+co5QQrlZRPYXNi9gJyHGyPPKylfbTbH3GUkTcGqMJKUz0PIIspGfa
	9LiBago2ubOKzQdd0pykeUYmh7omHmuD4AMZcIqlijBYP/E3OEiioT3+4VDHq0AJ
	AtXh36ovkzZ5eC6VOoxQbJHd/ozIUk4MxEwPllg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MUsAw1YOO/Jc34zhcpWUedVkkBFVFNY5nkM583bm844=:bx8zVtb0Od4YS0PY6USmneqZC91uKX/sxFlODAf8Q18=;
X-ME-Sender: <xms:Zyb-aoYBeT4G62sAxtE7RghTbU9yaU-1zGwW3iSOWU9YcHnH_KtK3g>
    <xme:Zyb-auPd-sfT6Wlt6GkXocgOHFIvyL4CM7hNtWTMA5ukH01fCHWSvUkMI96nDYZS0
    b5Th5WvyLsWxFImYGCv6l5dfabs8ze15_rofZ2gK-56E-ih0CG-FTl3>
X-ME-Proxy-Cause: dmFkZTF8OUZ9i8qFX0RiyrICzzEuZfYiQXUZAUEXTHtf/KJZtLd9Y9f4a8ySJucb9HLGcE
    fLO4zFy+38fXQ11QasQ2zZkTMp3bvEbDajy2rkbQikIGHPY2QAo+3+mrWJkbv9Qj7C0Thc
    kFSpmwew5oR9E0xBSBzcHxXfO07DgP7wcQqj8Y98RxwiqCoC/7yTrzZzH3E7ox6V+qoYdx
    Sxe73JYYYhKGOYJKTl+IVdrKAkPfPmHnwNa/3yXUS/Yjgoek5jr2ghZQQPIfxmxSaUI0Ku
    e4iWTJSvzh2W8VI67jhovf12/v8DoBlcDB8vaoI6Mm3mM90vj7G9+WKiAJ7Amz1WAXzace
    UIZCQRxj8aa2wtvFEPHe0npF3weZTHf8entOkPdKIxck71rOGAsEZW3ZAM9v37VnlJWhOV
    vDHfpRs4KrUkEtmc64J74AzuQS/3IaZyIpAp+nCn5hgvpVR5sa1baAOQMJ6zlvyINYzI7J
    EtjZzaai00bByd63SqEJTGtxDAfW4SfKWnziPyXG+oJ9s5CxdLeqBU7z0Xz9gTMawdjuVH
    +fY6HYZeqwGEORiKD6qhkZIowsfbASYDdz4bkxeIcD1Ltdt58IfeDaStwhmgshtmTYJWcu
    a+8HxHSVSTiuORrTTaUhUMTdZYvCo/+A4X79BwUs6mpqc/xR5WeedACv2tCg
X-ME-Proxy: <xmx:Zyb-anJ9x-PG4t1BTDt0NcoODZtAKJhx4XsuRa-iJVzYQSDZlhfzvg>
    <xmx:Zyb-atu1cOrUg1uNgwDN-dJ3UTZwuih_VpRfSYQsKAdmhtjO7xrE6g>
    <xmx:Zyb-ajUFYizwW__Sme6fRbWU-MTtStRxm5XKxZxjqKrinv8gGJf2DA>
    <xmx:Zyb-agiL0sbBhSKNtNBWABYoddZt5ThxYzWoUnP2VimFaG_prNSGdg>
    <xmx:Zyb-aoBG9dP4I_djWglODDaaEWm4Isy3BuABeNHcn1uEkEYIoZtoP7n6>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 720A42C00085; Wed, 18 Nov 2026 17:27:51 -0500 (EST)
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
X-ThreadId: AWoTwGnPVW4R
Date: Wed, 18 Nov 2026 17:27:31 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <b5c81884-73b0-4d43-98e5-cd2fedcf583f@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-4-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 4/5] platform/x86: lenovo-wmi-other: Properly implement
 no_singleton driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> The driver declares `.no_singleton = true' but stores device-specific
> data to statically allocated tunable_attr_01 variables. This makes the
> driver depend on the frigile fact that no device in wild has more than

Minor typo - frigile/fragile

> one LENOVO_OTHER_MODE WMI devices.
>

As an aside - is this really fragile? I mean realistically it's never going to happen is it?

> Add unique indexes to all statically allocated tunable_attr_01 variables
> with some __COUNTER__ tricks, and use them to access lwmi_om_priv's
> newly-introduced tunable_attr_01_ctx array. In this manner, move all
> device-specific data to the tunable_attr_01_ctx array, and constify all
> statically allocated tunable_attr_01 variables to make the driver a
> truly no_singleton driver.
>
> Fixes: 03bb5147da08 ("platform/x86: lenovo-wmi-other: Limit adding 
> attributes to supported devices")
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 54 
> ++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index 252ef775f300..f37dca7db034 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -134,15 +134,23 @@ struct tunable_attr_01 {
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> +	u8 ctx_id; /* Index to tunable_attr_01_ctx[] */
> +};
> +
> +struct tunable_attr_01_ctx {
>  	u8 cd_mode_id; /* mode arg for searching capdata */
>  	u8 cv_mode_id; /* mode arg for set/get current_value */
>  };
> 
> +enum { TUNABLE_ATTR_01_COUNTER_BASE = __COUNTER__ + 1 };
> +#define TUNABLE_ATTR_01_COUNTER (__COUNTER__ - TUNABLE_ATTR_01_COUNTER_BASE)
> +
>  #define DEFINE_TUNABLE_ATTR_01(_name, _device, _feature, _type)	\
> -	static struct tunable_attr_01 _name = {			\
> +	static const struct tunable_attr_01 _name = {		\
>  		.device_id = LWMI_DEVICE_ID_##_device,		\
>  		.feature_id = LWMI_FEATURE_ID_##_feature,	\
>  		.type_id = LWMI_TYPE_ID_##_type,		\
> +		.ctx_id = TUNABLE_ATTR_01_COUNTER,		\
>  	}
> 
>  DEFINE_TUNABLE_ATTR_01(ppt_pl1_spl, CPU, CPU_SPL, NONE);
> @@ -168,6 +176,10 @@ DEFINE_TUNABLE_ATTR_01(dgpu_didvid, GPU, 
> DGPU_DIDVID, NONE);
>  DEFINE_TUNABLE_ATTR_01(gpu_nv_bpl, GPU, GPU_NV_BPL, NONE);
>  DEFINE_TUNABLE_ATTR_01(gpu_nv_cpu_boost, GPU, GPU_NV_CPU_BOOST, NONE);
> 
> +enum { TUNABLE_ATTR_01_NR = TUNABLE_ATTR_01_COUNTER };
> +
> +static_assert(TUNABLE_ATTR_01_NR > 0 && TUNABLE_ATTR_01_NR < U8_MAX);
> +
>  struct lwmi_om_priv {
>  	struct component_master_ops *ops;
> 
> @@ -183,6 +195,8 @@ struct lwmi_om_priv {
> 
>  	struct lwmi_fan_info fan_info[LWMI_FAN_NR];
> 
> +	struct tunable_attr_01_ctx tunable_attr_ctx[TUNABLE_ATTR_01_NR];
> +
>  	struct {
>  		bool capdata00_collected : 1;
>  		bool capdata_fan_collected : 1;
> @@ -1018,7 +1032,7 @@ static u32 tunable_attr_01_id(const struct 
> tunable_attr_01 *attr, u8 mode)
> 
>  struct capdata01_attr {
>  	struct kobj_attribute kobj_attr;
> -	struct tunable_attr_01 *tunable_attr;
> +	const struct tunable_attr_01 *tunable_attr;
>  	union {
>  		enum attribute_property prop;
>  		const char *display_name;
> @@ -1027,7 +1041,7 @@ struct capdata01_attr {
> 
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
> -	struct tunable_attr_01 *tunable_attr;
> +	const struct tunable_attr_01 *tunable_attr;
>  };
> 
>  static inline struct lwmi_om_priv *kobj_to_om_priv(const struct 
> kobject *kobj)
> @@ -1041,6 +1055,12 @@ kobj_attr_to_cd01_attr(const struct 
> kobj_attribute *kattr)
>  	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
>  }
> 
> +static inline struct tunable_attr_01_ctx *tunable_to_ctx(struct 
> lwmi_om_priv *priv,
> +							 const struct tunable_attr_01 *tunable_attr)
> +{
> +	return &priv->tunable_attr_ctx[tunable_attr->ctx_id];
> +}
> +
>  /* Attribute Methods */
> 
>  /**
> @@ -1098,12 +1118,13 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	const struct capdata01_attr *cd01_attr = kobj_attr_to_cd01_attr(kattr);
>  	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
> +	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
>  	enum attribute_property prop = cd01_attr->prop;
>  	struct capdata01 capdata;
>  	u32 attribute_id;
>  	int value, ret;
> 
> -	attribute_id = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
> +	attribute_id = tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
> 
>  	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -1152,6 +1173,7 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
>  	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
> +	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
>  	struct wmi_method_args_32 args = {};
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> @@ -1165,7 +1187,7 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
> 
> -	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
> +	args.arg0 = tunable_attr_01_id(tunable_attr, ctx->cd_mode_id);
> 
>  	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
> @@ -1178,7 +1200,7 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> 
> -	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cv_mode_id);
> +	args.arg0 = tunable_attr_01_id(tunable_attr, ctx->cv_mode_id);
>  	args.arg1 = value;
> 
>  	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -1208,6 +1230,7 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
>  	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
>  	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
> +	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
>  	struct wmi_method_args_32 args = {};
>  	enum thermal_mode mode;
>  	int retval;
> @@ -1218,8 +1241,8 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>  		return ret;
> 
>  	/* If "no-mode" is the supported mode, ensure we never send current mode */
> -	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
> -		mode = tunable_attr->cv_mode_id;
> +	if (ctx->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
> +		mode = ctx->cv_mode_id;
> 
>  	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
> 
> @@ -1243,21 +1266,22 @@ static ssize_t attr_current_value_show(struct 
> kobject *kobj,
>   * First check if the attribute has a corresponding data table under 
> custom mode
>   * (0xff), then under no mode (0x00). If either of those passes, check 
> if the
>   * supported field of the capdata struct is > 0. If it is supported, 
> store the
> - * successful mode in the cd_mode_id field of tunable_attr.
> + * successful mode in the cd_mode_id field of tunable_attr_01_ctx.
>   *
>   * If the attribute capdata shows it is supported, attempt to 
> determine the mode
>   * for the current value property get/set methods using a similar 
> pattern to the
>   * capdata table check. If the value returned by either mode is 0 or 
> an error,
>   * assume that mode is not supported. Otherwise, store the successful 
> mode in the
> - * cv_mode_id field of tunable_attr.
> + * cv_mode_id field of tunable_attr_01_ctx.
>   *
>   * If any of the above checks fail then the attribute is not fully 
> supported.
>   *
>   * Return: true if capdata and set/get modes are found, otherwise 
> false.
>   */
>  static bool lwmi_attr_01_is_supported(struct lwmi_om_priv *priv,
> -				      struct tunable_attr_01 *tunable_attr)
> +				      const struct tunable_attr_01 *tunable_attr)
>  {
> +	struct tunable_attr_01_ctx *ctx = tunable_to_ctx(priv, tunable_attr);
>  	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, 
> LWMI_GZ_THERMAL_MODE_NONE };
>  	struct wmi_method_args_32 args = {};
>  	bool cd_mode_found = false;
> @@ -1265,7 +1289,7 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  	struct capdata01 capdata;
>  	int retval, ret, i;
> 
> -	/* Determine tunable_attr->cd_mode_id */
> +	/* Determine cd_mode_id  */
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
>  		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
> 
> @@ -1273,7 +1297,7 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  		if (ret || !capdata.supported)
>  			continue;
> 
> -		tunable_attr->cd_mode_id = modes[i];
> +		ctx->cd_mode_id = modes[i];
>  		cd_mode_found = true;
>  		break;
>  	}
> @@ -1283,7 +1307,7 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
> 
>  	dev_dbg(&priv->wdev->dev, "cd_mode_id: %#010x\n", args.arg0);
> 
> -	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
> +	/* Determine cv_mode_id, returns 1 if supported  */
>  	for (i = 0; i < ARRAY_SIZE(modes); i++) {
>  		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
> 
> @@ -1293,7 +1317,7 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  		if (ret || !retval)
>  			continue;
> 
> -		tunable_attr->cv_mode_id = modes[i];
> +		ctx->cv_mode_id = modes[i];
>  		cv_mode_found = true;
>  		break;
>  	}
>
> -- 
> 2.55.0

This one defeated me I'm afraid (the counter bits in particular) - I need to look at it with fresh eyes as my brain has packed up for the day.

Mark
