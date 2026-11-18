Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040393;
	b=S2H5hVUtyrD6KfrffWlrpABqpvvUlE6tbaMmp7w998CXJr6fxlyTf7F8ZxgtUYXdr6wm
	 ZRGC10ggnEVMGfCfj7wsUbvpPGbalAkwC8juL3E89+Exf56R0cXrOlsmbRMrZcTUCYuCj
	 eaStjoIH3VW0DFCxfwFCXWQw7nGzkkpiSDsQApmQr2iew9W1FvDHAuXMBof/NZSdCTy6Y
	 J77cOhungTTXuMX3ixjRqq4IIa1Az9F3KzZmViDn7/q8wOa7/DyHykFgSyTdbyppZPmpE
	 PvxOj0x96lusJ6r94v6fBulApMxs9ZcBwr+8vHllBq26tmk5dPZLjtOl75wgD+/kjSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040393;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=N5Nd6NRwnlmfXiSw9MhoLKkEZSiLiKpd+AJ+PzSDigs=;
	b=nEtRTYI9bvRgKr3fzVmbSZ5ykwZLTD4VOm/GBHsBhuXw66CsitZiruVlmASrospUclSn
	 hBhTmjcGykzuvqyqIlcNVMP0O/ynff1DZIL+dyelLEvzZvWyzgNYKgqh9vL+cdkGEiyW0
	 ruz/+lQVR1fq09B3c73p9Sb7C+3lM3CLZPA061yZjkjuTsiILVW0/gXmSTAH8r0eimTah
	 pgFUQdjQFbmkBEXtb/T1DtEMKVxHiUr3+dNM82o2lp3IJMdgDFE66wKHax1wk4vnA0mWP
	 cCi02bDs6HQdt1dAfDPTDIr9N6JzzpFS6hJEggnKv5hWmCizOb7a7m5S/di/UblpsoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=USfqscl3;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Rnx1V6AT;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B11606A335
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B11606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=USfqscl3;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Rnx1V6AT
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7548D140018E
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 17:19:52 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 17:19:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1795040391;
	 x=1795126791; bh=N5Nd6NRwnlmfXiSw9MhoLKkEZSiLiKpd+AJ+PzSDigs=; b=
	USfqscl3ryzMJbcOuTR03Ev38wG7G3x7Wt5zMGBAweH+JyJcU4aZ+XH+pXKOxDE/
	vKXamQIS/Sa72yu0PvsMCssQps0RtGcqfLYX5TT0fsGVeuK732uGP/zDsnAHi6CV
	6hX1huVlq17lkau6HYG2qgTzDLsN8izSDEBQxT2D2a5kiTSxVOwvx2P9oa2u/avW
	3hfLmvzRgTD4j7AU/UThUrhS5n7IqpYzB9GV/7zOn0xvI7cy+0yeMJYiUIioSXSA
	8GvDcmfr596h8GJafo5rb4Cgj7U0PXeL/UPnICxTbKDPsKwvWZ56WsJmhtYc1TA9
	d4ivkbakKo5E+Dc8VyUYWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795040391; x=
	1795126791; bh=N5Nd6NRwnlmfXiSw9MhoLKkEZSiLiKpd+AJ+PzSDigs=; b=R
	nx1V6ATSVHpngXQ6vKwbk6v2BmE6RlcwKn/Y3HPkuTUUh8JiTpQy+cvr10K5yOmK
	6WUSDCUyRKbildX8/J98pTYgpa1xSino2Sy96VaFqudXnkPFonSH2vexnFnGIUbL
	36M+OGGGCWz0SktN0577q2Thsj3UbEbsREPNYqobQVbRlRfiph4zYHFZ15kCyQXS
	6gHHwKl3Lym/JFusgHPxMIo7htwbhl5DTuaR0SlolVlRc8sqlH+3hS+VZTNrab7R
	sYToogOpvF766r+rSIApcdeiaTYIpVO1fhYDP0BK++iVe6BvL+iYwZH8zcsH/Squ
	vN3yy925ursWIUIpWTSOw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795040391; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:csFKMs4OTbew8BsgoWP5tKxduxCaUEyLW2LLrhTnVsVDkki
	SfJyAtvdE4ej6bT8fNFHigVYtdvQetYCONkM7pNJbzSOeQHixC9IoppCtbV5N0U/
	inxidle4M2zncKObJRU4lCTemMVR9t2UDHbPTYMDtCgxSgsXbjULKzDxHQ330UXp
	49LqpXDOIEo5VAocoHKKH43PQDF3ZjmpUcQ11YIsWv+axsZSR+D5AZZPwIEptxEA
	z/wAPpEiqyV+MzRy8dWO3RgZA4ciBbwAt03LUYnG5TLfYAIEl8p++ZAJvKSxkzmx
	Qd1hw0il2i3GmqUo5sGRKAtKw3DpdQJCAF13PsA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+ENiAJTKQIhYSg1yltMC/8er7LYRXDEkfDCObsgnr/Q=:Z7AsfKQ+GFsvSW2c9hErHOfafE5JD7w0KWc47M/JB6U=;
X-ME-Sender: <xms:hiT-atpmMlfhkiZsjKcV2mgDmEEC0pIZNWQGa9sJ0iPqcL9RvaSgNQ>
    <xme:hiT-aqd6ZCFsQSAlpb5DoctTSohhqta7WJD232zoyZS9CzLDEArMmyQYYtUGzR2KB
    7wjx4We_-ZbfLLOk1bmJuHOa9KsQMP85AqGVXa8jvzJYznr5AxFSjmf>
X-ME-Proxy-Cause: dmFkZTFoPArDBxOCK1AYHTSca6Zv38zXYox5GT75kd+QgHP6/JstF3WLFF+u40HMYZ8rMh
    uwPrqKEuIvhNZYD0yunSLyre1Zb98Sl2/F0ymrph4C4hHmvy8wd370HsDCjYWX+c897BtG
    5trxNhqkqPlv+AFXI9vx7FFulE6ROAY2cR1rEuYNc3y0mkqCDkTWIaeScTaRRZe+mgwSpJ
    I4d7++wxofqxgMEJZk1dfqnALNGDXO4CA88W8NjZiqmo3w19MyGq3PWwltF0iH4ud/wJxH
    GgxQq6QavYBE8vuXYdOLBDmLuJ086A8MXsU92eCuJk9O7nsYyS0bQOyxLmIcdF0t1xL8Kp
    A0u1ZcSGqZsklFVGoX4IIJnM7ubPSaVpQKC1lp/XAtA2QlPusj7wBtBlyp8MECj2SgaT+y
    3v+Ez5X2fp0zGx5an7eUWtZMvj46+oGgKlzAY0h137yKqT6PXzZeTLMF7uTCFmK0ILP3O/
    2UJxfnxRRp/kDosnppbneR8TYuiSVtyaxEmykKIe4uik1zbfu6j3mRXu6mdpSNhYrSAqsk
    bPZJEAQJua9VEVzdZn19IAS5vBRsoZMDxU1FtMzBJY7pVNoC3OGtb07BH/M0BzhUy0REbE
    6268aaLr9HBOxwqeSXuBJTho46pRwiBrGebg43xTziQCUMyPkv5T/TDTcPSA
X-ME-Proxy: <xmx:hyT-akZQuIAT_oLjb9ANEyUp1jR3I80tBIcpbCEAK4fJEbpcIikLMw>
    <xmx:hyT-ah_y1E3id58XZLXbzuPUwhYU_Kkaur7eaWqD5jjznsITXJleyg>
    <xmx:hyT-ainG5BJaRDuIFYE4HXWzjtvfvCSXpGQtcwV1XIKxH2MrTQwYhw>
    <xmx:hyT-auzqyd4WQpWBL2ivoLYwOPo2iekIkZd17CV-jhcwCz7BycKqVg>
    <xmx:hyT-asTjFhE6b6n7ozFHhI4ESRAw9rUEwU8cBI2C-8Vw3uYpvbbsDvH4>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E3C2E2C0008E; Wed, 18 Nov 2026 17:19:50 -0500 (EST)
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
X-ThreadId: AzKAGT4dNZUw
Date: Wed, 18 Nov 2026 17:17:37 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Rong Zhang" <i@rong.moe>, "Derek J . Clark" <derekjohn.clark@gmail.com>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Alok Tiwari" <alok.a.tiwari@oracle.com>, "Armin Wolf" <W_Armin@gmx.de>
Cc: 
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <6eaa6dc3-3997-423d-997d-e673872c3e86@app.fastmail.com>
In-Reply-To: <20261119-lwmi-no-singleton-v1-2-6b06fcfb5126@rong.moe>
References: <20261119-lwmi-no-singleton-v1-0-6b06fcfb5126@rong.moe>
 <20261119-lwmi-no-singleton-v1-2-6b06fcfb5126@rong.moe>
Subject: Re: [PATCH 2/5] platform/x86: lenovo-wmi-other: Eliminate attribute-specific
 callbacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Wed, Nov 18, 2026, at 1:58 PM, Rong Zhang wrote:
> Currently, all firmware-attributes are backed by numerous
> attribute-specific wrapper callbacks generated by macros. Besides,
> every firmware attribute has the same type "integer" and shares the same
> show callback int_type_show(), but LWMI_ATTR_GROUP_TUNABLE_CAP01()
> defines attr_*_type over and over again.
>
> As a result, the definition of attributes significantly bloats up the
> module size.
>
> Eliminating these attribute-specific callbacks by moving their data into
> a newly-introduced container struct capdata01_attr, and utilize
> container_of_const() to retrieve the required data in the corresponding
> callbacks, which are adjusted to make them generic and shared among
> different attributes. Also introduce a unified attr_int_type attribute
> to replace all attr_*_type attributes.
>
> With these, all firmware-attributes now use generic callbacks directly
> and are constified.
>
> This shrinks the module size by 23.8K (42.7%).
>
>       text       data        bss      total filename (before)
>      23463      32197          3      55663 lenovo-wmi-other.ko
>
>       text       data        bss      total filename (after)
>       5816      26059          3      31878 lenovo-wmi-other.ko
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 217 ++++++++++++++++----------------
>  1 file changed, 108 insertions(+), 109 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c 
> b/drivers/platform/x86/lenovo/wmi-other.c
> index c31a8bd08a85..4d51b05a5acf 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -981,7 +981,7 @@ struct tunable_attr_01 {
>   *
>   * Return: encoded capability data attribute ID.
>   */
> -static u32 tunable_attr_01_id(struct tunable_attr_01 *attr, u8 mode)
> +static u32 tunable_attr_01_id(const struct tunable_attr_01 *attr, u8 
> mode)
>  {
>  	return lwmi_attr_id(attr->device_id, attr->feature_id, mode, 
> attr->type_id);
>  }
> @@ -1118,6 +1118,15 @@ static struct tunable_attr_01 gpu_nv_cpu_boost = 
> {
>  	.type_id = LWMI_TYPE_ID_NONE,
>  };
> 
> +struct capdata01_attr {
> +	struct kobj_attribute kobj_attr;
> +	struct tunable_attr_01 *tunable_attr;
> +	union {
> +		enum attribute_property prop;
> +		const char *display_name;
> +	};
> +};
> +
>  struct capdata01_attr_group {
>  	const struct attribute_group *attr_group;
>  	struct tunable_attr_01 *tunable_attr;
> @@ -1128,6 +1137,12 @@ static inline struct lwmi_om_priv 
> *kobj_to_om_priv(const struct kobject *kobj)
>  	return dev_get_drvdata(kobj_to_dev(kobj->parent));
>  }
> 
> +static inline const struct capdata01_attr *
> +kobj_attr_to_cd01_attr(const struct kobj_attribute *kattr)
> +{
> +	return container_of_const(kattr, struct capdata01_attr, kobj_attr);
> +}
> +
>  /* Attribute Methods */
> 
>  /**
> @@ -1138,36 +1153,54 @@ static inline struct lwmi_om_priv 
> *kobj_to_om_priv(const struct kobject *kobj)
>   *
>   * Return: Number of characters written to buf.
>   */
> -static ssize_t int_type_show(struct kobject *kobj, struct 
> kobj_attribute *kattr,
> +static ssize_t int_type_show(struct kobject *kobj, const struct 
> kobj_attribute *kattr,
>  			     char *buf)
>  {
>  	return sysfs_emit(buf, "integer\n");
>  }
> 
> +static const struct kobj_attribute attr_int_type = __KOBJ_ATTR(type, 
> 0444, int_type_show, NULL);
> +
> +/**
> + * attr_display_name_show() - Get the display name of the given 
> attribute
> + * @kobj: Pointer to the driver object.
> + * @kattr: Pointer to the attribute calling this function.
> + * @buf: The buffer to write to.
> + *
> + * Retrieves the display name from the capdata01_attr struct for the 
> specified
> + * attribute. This function is intended to be generic so it can be 
> called from
> + * any integer attributes.
> + *
> + * Return: Number of characters written to buf.
> + */
> +static ssize_t attr_display_name_show(struct kobject *kobj,
> +				      const struct kobj_attribute *kattr, char *buf)
> +{
> +	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
> +
> +	return sysfs_emit(buf, "%s\n", cd01_attr->display_name);
> +}
> +
>  /**
>   * attr_capdata01_show() - Get the value of the specified attribute 
> property
>   *
>   * @kobj: Pointer to the driver object.
>   * @kattr: Pointer to the attribute calling this function.
>   * @buf: The buffer to write to.
> - * @tunable_attr: The attribute to be read.
> - * @prop: The property of this attribute to be read.
>   *
>   * Retrieves the given property from the capability data 01 struct for 
> the
>   * specified attribute's "custom" thermal mode. This function is 
> intended
> - * to be generic so it can be called from any integer attributes 
> "_show"
> - * function.
> - *
> - * If the WMI is success the sysfs attribute is notified.
> + * to be generic so it can be called from any integer attributes.
>   *
>   * Return: Either number of characters written to buf, or an error 
> code.
>   */
>  static ssize_t attr_capdata01_show(struct kobject *kobj,
> -				   struct kobj_attribute *kattr, char *buf,
> -				   struct tunable_attr_01 *tunable_attr,
> -				   enum attribute_property prop)
> +				   const struct kobj_attribute *kattr, char *buf)
>  {
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
> +	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
> +	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
> +	enum attribute_property prop = cd01_attr->prop;
>  	struct capdata01 capdata;
>  	u32 attribute_id;
>  	int value, ret;
> @@ -1204,26 +1237,23 @@ static ssize_t attr_capdata01_show(struct 
> kobject *kobj,
>   * @kattr: Pointer to the attribute calling this function.
>   * @buf: The buffer to read from, this is parsed to `int` type.
>   * @count: Required by sysfs attribute macros, pass in from the callee 
> attr.
> - * @tunable_attr: The attribute to be stored.
>   *
>   * Sets the value of the given attribute when operating under the 
> "custom"
>   * smartfan profile. The current smartfan profile is retrieved from the
>   * lenovo-wmi-gamezone driver and error is returned if the result is 
> not
>   * "custom". This function is intended to be generic so it can be 
> called from
> - * any integer attribute's "_store" function. The integer to be sent 
> to the WMI
> - * method is range checked and an error code is returned if out of 
> range.
> - *
> - * If the value is valid and WMI is success, then the sysfs attribute 
> is
> - * notified.
> + * any integer attributes. The integer to be sent to the WMI method is 
> range
> + * checked and an error code is returned if out of range.
>   *
>   * Return: Either count, or an error code.
>   */
>  static ssize_t attr_current_value_store(struct kobject *kobj,
> -					struct kobj_attribute *kattr,
> -					const char *buf, size_t count,
> -					struct tunable_attr_01 *tunable_attr)
> +					const struct kobj_attribute *kattr,
> +					const char *buf, size_t count)
>  {
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
> +	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
> +	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
>  	struct wmi_method_args_32 args = {};
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> @@ -1266,22 +1296,20 @@ static ssize_t attr_current_value_store(struct 
> kobject *kobj,
>   * @kobj: Pointer to the driver object.
>   * @kattr: Pointer to the attribute calling this function.
>   * @buf: The buffer to write to.
> - * @tunable_attr: The attribute to be read.
>   *
>   * Retrieves the value of the given attribute for the current smartfan 
> profile.
>   * The current smartfan profile is retrieved from the 
> lenovo-wmi-gamezone driver.
>   * This function is intended to be generic so it can be called from 
> any integer
> - * attribute's "_show" function.
> - *
> - * If the WMI is success the sysfs attribute is notified.
> + * attributes.
>   *
>   * Return: Either number of characters written to buf, or an error 
> code.
>   */
>  static ssize_t attr_current_value_show(struct kobject *kobj,
> -				       struct kobj_attribute *kattr, char *buf,
> -				       struct tunable_attr_01 *tunable_attr)
> +				       const struct kobj_attribute *kattr, char *buf)
>  {
>  	struct lwmi_om_priv *priv = kobj_to_om_priv(kobj);
> +	const struct capdata01_attr *cd01_attr = 
> kobj_attr_to_cd01_attr(kattr);
> +	const struct tunable_attr_01 *tunable_attr = cd01_attr->tunable_attr;
>  	struct wmi_method_args_32 args = {};
>  	enum thermal_mode mode;
>  	int retval;
> @@ -1382,128 +1410,99 @@ static bool lwmi_attr_01_is_supported(struct 
> lwmi_om_priv *priv,
>  }
> 
>  /* Lenovo WMI Other Mode Attribute macros */
> -#define __LWMI_ATTR_RO(_func, _name)                                  \
> -	{                                                             \
> -		.attr = { .name = __stringify(_name), .mode = 0444 }, \
> -		.show = _func##_##_name##_show,                       \
> -	}
> 
> -#define __LWMI_ATTR_RO_AS(_name, _show)                               \
> -	{                                                             \
> -		.attr = { .name = __stringify(_name), .mode = 0444 }, \
> -		.show = _show,                                        \
> +/* Attribute current value read/write */
> +#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                  
>                       \
> +	static const struct capdata01_attr 
> ext_attr_##_attrname##_current_value = {          \
> +		.kobj_attr = __KOBJ_ATTR(current_value, 0644,                        
>         \
> +					 attr_current_value_show, attr_current_value_store), \
> +		.tunable_attr = &_attrname,                                          
>         \
>  	}
> 
> -#define __LWMI_ATTR_RW(_func, _name) \
> -	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
> -
> -/* Shows a formatted static variable */
> -#define __LWMI_ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)             
>         \
> -	static ssize_t _attrname##_##_prop##_show(                            
>  \
> -		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> -	{                                                                     
>  \
> -		return sysfs_emit(buf, _fmt, _val);                            \
> -	}                                                                     
>  \
> -	static struct kobj_attribute attr_##_attrname##_##_prop =             
>  \
> -		__LWMI_ATTR_RO(_attrname, _prop)
> +/* Attribute property read only */
> +#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)          
>                      \
> +	static const struct capdata01_attr ext_attr_##_attrname##_##_prop = { 
>               \
> +		.kobj_attr = __KOBJ_ATTR(_prop, 0444, attr_capdata01_show, NULL),    
>        \
> +		.tunable_attr = &_attrname,                                          
>        \
> +		.prop = _prop_type,                                                  
>        \
> +	}
> 
> -/* Attribute current value read/write */
> -#define __LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname)                  
>         \
> -	static ssize_t _attrname##_current_value_store(                       
>  \
> -		struct kobject *kobj, struct kobj_attribute *kattr,            \
> -		const char *buf, size_t count)                                 \
> -	{                                                                     
>  \
> -		return attr_current_value_store(kobj, kattr, buf, count,       \
> -						&_attrname);                   \
> -	}                                                                     
>  \
> -	static ssize_t _attrname##_current_value_show(                        
>  \
> -		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> -	{                                                                     
>  \
> -		return attr_current_value_show(kobj, kattr, buf, &_attrname);  \
> -	}                                                                     
>  \
> -	static struct kobj_attribute attr_##_attrname##_current_value =       
>  \
> -		__LWMI_ATTR_RW(_attrname, current_value)
> +/* Attribute display name */
> +#define __LWMI_DISPLAY_NAME(_attrname, _val)                           
>                      \
> +	static const struct capdata01_attr 
> ext_attr_##_attrname##_display_name = {          \
> +		.kobj_attr = __KOBJ_ATTR(display_name, 0444, attr_display_name_show, 
> NULL), \
> +		.tunable_attr = &_attrname,                                          
>        \
> +		.display_name = _val,                                                
>        \
> +	}
> 
> -/* Attribute property read only */
> -#define __LWMI_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)          
>         \
> -	static ssize_t _attrname##_##_prop##_show(                            
>  \
> -		struct kobject *kobj, struct kobj_attribute *kattr, char *buf) \
> -	{                                                                     
>  \
> -		return attr_capdata01_show(kobj, kattr, buf, &_attrname,       \
> -					   _prop_type);                        \
> -	}                                                                     
>  \
> -	static struct kobj_attribute attr_##_attrname##_##_prop =             
>  \
> -		__LWMI_ATTR_RO(_attrname, _prop)
> -
> -#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _fsname, _dispname)   
>    \
> +#define LWMI_ATTR_GROUP_TUNABLE_CAP01(_attrname, _dispname)            
>    \
>  	__LWMI_TUNABLE_CURRENT_VALUE_CAP01(_attrname);                    \
>  	__LWMI_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);   \
> -	__LWMI_ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname); \
> +	__LWMI_DISPLAY_NAME(_attrname, _dispname);                        \
>  	__LWMI_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);           \
>  	__LWMI_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);           \
>  	__LWMI_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);   \
> -	static struct kobj_attribute attr_##_attrname##_type =            \
> -		__LWMI_ATTR_RO_AS(type, int_type_show);                   \
> -	static struct attribute *_attrname##_attrs[] = {                  \
> -		&attr_##_attrname##_current_value.attr,                   \
> -		&attr_##_attrname##_default_value.attr,                   \
> -		&attr_##_attrname##_display_name.attr,                    \
> -		&attr_##_attrname##_max_value.attr,                       \
> -		&attr_##_attrname##_min_value.attr,                       \
> -		&attr_##_attrname##_scalar_increment.attr,                \
> -		&attr_##_attrname##_type.attr,                            \
> +	static const struct attribute *const _attrname##_attrs[] = {      \
> +		&ext_attr_##_attrname##_current_value.kobj_attr.attr,     \
> +		&ext_attr_##_attrname##_default_value.kobj_attr.attr,     \
> +		&ext_attr_##_attrname##_display_name.kobj_attr.attr,      \
> +		&ext_attr_##_attrname##_max_value.kobj_attr.attr,         \
> +		&ext_attr_##_attrname##_min_value.kobj_attr.attr,         \
> +		&ext_attr_##_attrname##_scalar_increment.kobj_attr.attr,  \
> +		&attr_int_type.attr,                                      \
>  		NULL,                                                     \
>  	};                                                                \
>  	static const struct attribute_group _attrname##_attr_group = {    \
> -		.name = _fsname, .attrs = _attrname##_attrs               \
> +		.name = #_attrname,                                       \
> +		.attrs_const = _attrname##_attrs,                         \
>  	}
> 
>  /* CPU tunable attributes */
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp, "cpu_temp",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(cpu_temp,
>  			      "Set the CPU thermal load limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl, "ppt_cpu_cl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_cpu_cl,
>  			      "Set the CPU cross loading power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl, "ppt_pl1_apu_spl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_apu_spl,
>  			      "Set the APU sustained power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl,
>  			      "Set the CPU sustained power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl, "ppt_pl1_spl_cl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_spl_cl,
>  			      "Set the CPU cross loading sustained power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt,
>  			      "Set the CPU slow package power tracking limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl, "ppt_pl2_sppt_cl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl2_sppt_cl,
>  			      "Set the CPU cross loading slow package power tracking limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt,
>  			      "Set the CPU fast package power tracking limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl, "ppt_pl3_fppt_cl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl3_fppt_cl,
>  			      "Set the CPU cross loading fast package power tracking limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau, "ppt_pl1_tau",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl1_tau,
>  			      "Set the CPU sustained power limit exceed duration");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl, "ppt_pl4_ipl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl,
>  			      "Set the CPU instantaneous power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl, "ppt_pl4_ipl_cl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(ppt_pl4_ipl_cl,
>  			      "Set the CPU cross loading instantaneous power limit");
> 
>  /* GPU tunable attributes */
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk, "dgpu_boost_clk",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_boost_clk,
>  			      "Set the dedicated GPU boost clock");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid, "dgpu_didvid",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_didvid,
>  			      "Get the GPU device identifier and vendor identifier");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable, "dgpu_enable",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(dgpu_enable,
>  			      "Set the dedicated Nvidia GPU enabled status");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode, "gpu_mode",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_mode,
>  			      "Set the GPU mode by power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset, "gpu_nv_ac_offset",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ac_offset,
>  			      "Set the Nvidia GPU AC total processing power baseline offset");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl, "gpu_nv_bpl",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_bpl,
>  			      "Set the Nvidia GPU base power limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost, "gpu_nv_cpu_boost",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_cpu_boost,
>  			      "Set the Nvidia GPU to CPU dynamic boost limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp, "gpu_nv_ctgp",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ctgp,
>  			      "Set the GPU configurable total graphics power");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab, "gpu_nv_ppab",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_nv_ppab,
>  			      "Set the Nvidia GPU power performance aware boost limit");
> -LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp, "gpu_temp",
> +LWMI_ATTR_GROUP_TUNABLE_CAP01(gpu_temp,
>  			      "Set the GPU thermal load limit");
> 
>  static struct capdata01_attr_group cd01_attr_groups[] = {
>
This one made my head hurt...but I think it's all good.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
