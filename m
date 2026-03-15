Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C8F224B1E
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 04:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773547912; cv=pass; b=usST/fJwOVRiYBKZ7HF3v7ppVFP0nTD9YVhc5KPoqCxobLvk9qeIO43XJSpjKhG+ed7p+BfPsWQTpEX/ZIEnL1fFK67jOlwv4kQe1kYhStLxXiurkOIHo1EN4VuUbV/BKY0OUVYiXN1Mx2IoI0lpvMcWH0AtuEMvH+XZtGbrkEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773547912; c=relaxed/simple;
	bh=ecN09Z5Eq8JjXqEic0J9H4Gqxa1IiW8Zcjonec0TxrE=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ZOYkBU6AjjAnUVgln8DgvExBs89pegVjsaHjFKGaQ3uyaBcHnInenuw5XNpLCosAvMKROc6DpZMKBS3QpTDOeS7IS9WOIxuqTYBjIUg1yoL78nnr7cQ6RoLhgdmhpmBJ+PNUg9csQLpDkTDGSWn3eSEP/1a8eSpsKpcA/ogfPq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=e0UNTK2E; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="e0UNTK2E"
ARC-Seal: i=1; a=rsa-sha256; t=1773537243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=e3s4qkaGtWsbWdiWbppe3MyOODWi/RsACR/6bSOMRiGMV6XiBK5GmCZRuo98Gf05TXz7wwY0zXb6F44L6RRP14qGdfvjjFQ6UAJmqvFyLBR0+GcQT3YETbWrcF6UvArWG2tJKs9IvgwK/MtwnBsgSEoIdmjzRMBpGPaOvYnPCak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773537243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cLDQPMuolHTAl2XosGLFx8K8H9Ap1/fkut4cZeOgoTs=; 
	b=J9A/IZgEh+ZV/n9mvENm6imxNre/VWRDVz09AZg9CrWT6M183yjz2JID4egaPcNV92r/ho5Wabn6TtC9JmCHECejsETSTueCVh3MMPwpLLUZ+Eot9fqJCmc9CWaRszQqqwgeRAvL6F4z/OC+I3uEgR9Ua2FnU2jZoKrBOxnq6Wc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773537243;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=cLDQPMuolHTAl2XosGLFx8K8H9Ap1/fkut4cZeOgoTs=;
	b=e0UNTK2E4r5EAyKoF3BQmqLxlsCThbHPzVMhlHuN7JAV6RoumYMp0X/9ttiID+9I
	6T0kDWmX5h+FqD+KDN9TIOMk7utIwPrNFG6TeVsqPX10P6mBAuHFpDKSx4XonSCh7We
	mmgNISB8vGUVj6fwkcXhlo2ZKaMduqSDAdFdmxDbBfwXTrglYLZxcKPmSCbvQ3zA8UH
	RZo4SaHKi7j2g/9DGC94aag47RBDi7h6jLkrt5WpTOgj+iS8wMuwmdQ47blgzsWpG2L
	xY6T9GOhi8ooAUNAi6naZIx1r45Iz/Z8iNk4dvpSEUNkl288GnbaCBrjfr8XOHn4Tcz
	qtj867+mYg==
Received: by mx.zohomail.com with SMTPS id 1773537240244643.3009665447429;
	Sat, 14 Mar 2026 18:14:00 -0700 (PDT)
Message-ID: <e44e31bf1f811c504d1ee199c9fd8b239731995e.camel@rong.moe>
Subject: Re: [PATCH v4 3/8] platform/x86: lenovo-wmi-other: Add
 lwmi_attr_id() function
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260312031032.3467565-4-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
	 <20260312031032.3467565-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Mar 2026 09:08:55 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Thu, 2026-03-12 at 03:10 +0000, Derek J. Clark wrote:
> Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
> but as a generic, to de-duplicate attribute_id assignment biolerplate.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v4:
>   - Switch from macro to static inline to preserve types.
> ---
>  drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
>  drivers/platform/x86/lenovo/wmi-other.c    | 59 +++++++++++++---------
>  2 files changed, 35 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platfor=
m/x86/lenovo/wmi-gamezone.h
> index 6b163a5eeb95..ddb919cf6c36 100644
> --- a/drivers/platform/x86/lenovo/wmi-gamezone.h
> +++ b/drivers/platform/x86/lenovo/wmi-gamezone.h
> @@ -10,6 +10,7 @@ enum gamezone_events_type {
>  };
> =20
>  enum thermal_mode {
> +	LWMI_GZ_THERMAL_MODE_NONE =3D	   0x00,
>  	LWMI_GZ_THERMAL_MODE_QUIET =3D	   0x01,
>  	LWMI_GZ_THERMAL_MODE_BALANCED =3D	   0x02,
>  	LWMI_GZ_THERMAL_MODE_PERFORMANCE =3D 0x03,
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c1728c7c2957..9fff9c1f768c 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -73,10 +73,26 @@
> =20
>  #define LWMI_FAN_DIV 100
> =20
> -#define LWMI_ATTR_ID_FAN_RPM(x)						\
> -	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
> -	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
> -	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
> +/**
> + * lwmi_attr_id() - Formats a capability data attribute ID
> + * @dev_id: The u8 corresponding to the device ID.
> + * @feat_id: The u8 corresponding to the feature ID on the device.
> + * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
> + * @type_id: The u8 corresponding to the sub-device.
> + *
> + * Return: u32.
> + */
> +static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
> +{
> +	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
> +		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
> +		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
> +		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
> +}
> +
> +#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> +	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> +		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
>  #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> @@ -550,6 +566,8 @@ struct tunable_attr_01 {
>  	u8 feature_id;
>  	u8 device_id;
>  	u8 type_id;
> +	u8 cd_mode_id; /* mode arg for searching capdata */
> +	u8 cv_mode_id; /* mode arg for set/get current_value */

Adding them actually depends on [PATCH v4 4/8], otherwise you always
get 0 when accessing them in this patch. There are potential
regressions...


>  };
> =20
>  static struct tunable_attr_01 ppt_pl1_spl =3D {
> @@ -715,12 +733,8 @@ static ssize_t attr_capdata01_show(struct kobject *k=
obj,
>  	u32 attribute_id;
>  	int value, ret;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
> -			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	attribute_id =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->fe=
ature_id,
> +				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
>  	if (ret)
> @@ -775,7 +789,6 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	struct wmi_method_args_32 args;
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	u32 value;
>  	int ret;
> =20
> @@ -786,13 +799,10 @@ static ssize_t attr_current_value_store(struct kobj=
ect *kobj,
>  	if (mode !=3D LWMI_GZ_THERMAL_MODE_CUSTOM)
>  		return -EBUSY;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> =20
> -	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
> +	ret =3D lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
>  	if (ret)
>  		return ret;
> =20
> @@ -803,7 +813,8 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  	if (value < capdata.min_value || value > capdata.max_value)
>  		return -EINVAL;
> =20
> -	args.arg0 =3D attribute_id;
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 tunable_attr->cv_mode_id, tunable_attr->type_id);

...here...

>  	args.arg1 =3D value;
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
> @@ -837,7 +848,6 @@ static ssize_t attr_current_value_show(struct kobject=
 *kobj,
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
>  	struct wmi_method_args_32 args;
>  	enum thermal_mode mode;
> -	u32 attribute_id;
>  	int retval;
>  	int ret;
> =20
> @@ -845,13 +855,12 @@ static ssize_t attr_current_value_show(struct kobje=
ct *kobj,
>  	if (ret)
>  		return ret;
> =20
> -	attribute_id =3D
> -		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
> -		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
> -		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
> -		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
> +	/* If "no-mode" is the supported mode, ensure we never send current mod=
e */
> +	if (tunable_attr->cv_mode_id =3D=3D LWMI_GZ_THERMAL_MODE_NONE)
> +		mode =3D tunable_attr->cv_mode_id;

...and here.

Thanks,
Rong

> =20
> -	args.arg0 =3D attribute_id;
> +	args.arg0 =3D lwmi_attr_id(tunable_attr->device_id, tunable_attr->featu=
re_id,
> +				 mode, tunable_attr->type_id);
> =20
>  	ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
>  				    (unsigned char *)&args, sizeof(args),
