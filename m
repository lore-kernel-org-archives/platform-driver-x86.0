Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541E34DAF8B;
	Wed,  7 Oct 2026 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396699; cv=pass; b=Rao0A2CQtlzOueA8Flt3N3HCP3A9EpW9nxDmajCXMG63FypqfnFyMcWE7vrZyhNp+GbYbnxMHhzE0WswK/Y0BoIIfI4Ym2hpapHV/kYmytdOa292Zm3CivuCACno0wGfb0OwtsdhrnGE0dmPmxqEEpGuqzyTiqOuaOoFnFpm7rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396699; c=relaxed/simple;
	bh=8ama43F2m9XQ9c9w9CXwIDBP8GTnt3eNipwqM9UDoqE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QSnuL9nl2UvBmMY27VqZUVMSGhgBY4D6ZxdwQ5epsSNYbY6Nn0qCIBxFQXjCW5gq8SBM/Os0zZSaUIslPxLpzfksjQkutnwwviDNOxNWtrshBPwAMU39e1bJTCHvWo1Rhn1mTMdqqO/lTtpbpV5hlCm+RdvoNytBjORNV5Tz+KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=OMADvrwT; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="OMADvrwT"
ARC-Seal: i=1; a=rsa-sha256; t=1791396688; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ExwuP+VgQHgfjTYePgW7XjFQcxutlvBfNMviN6x1XKMVHZfnSHjdpJzCBHjCCaDNr4IqwbuUvZ014ak5xzok4IHxHhWiMuHUi7eemdjWX+vrG558VsxnkgkOfR/66VqFbrLq3gsH/KIEE7364yPtlGbMjbShdd0g+tq5gvkromY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791396688; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZINVWcK2PACkQR71DtzcaFfpiXIIhWjLCAs8VRgO0OU=; 
	b=Lc3XJbgEYab+cJUKVU674HnKAbw9PbW/5bgDb4oFzbgRwM3Ir+80x5pY7jmXV0vycfdHTGtFsdGcjX1lTw6BhPD4fLKh7kaL2JXU6UCXajFa6HoSHfRCYr1xVm8r7QU+yfVFLKP7VKsia0g4Z0SzS15B9PW7JjeTnxglrYVulXU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791396688;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=ZINVWcK2PACkQR71DtzcaFfpiXIIhWjLCAs8VRgO0OU=;
	b=OMADvrwTyyAe6CA1mAdnd6pP17oDs/R8Kg+fIv/NlHSdJ65h2IYm/m6KUuqB7nEV
	oAvOWhJ3iYZ5fTOaNoTKVrMlakfjfSfxQIhuhTXGHdePnaFQuQ0mhXv81JzVTUoSaIe
	sB0SwsGBtbM4h0K5xPc361qzW4R0uxBE/UTtFzfWbn+Zw25qt/2DJ3FYzfCl8CmyS52
	5Yqv8DqFzp+/K4piC3y7R+t26h9zx5BJXWxei8KYv6ElUN9paHhNSV7VO41O4nTrh3m
	fr2hze/cbUap/Rz+VQxpLdm7f4wWvOuFURftCM7Sj+VgW1jlSeckwbfz5vsKsiAXg8U
	xQTndCdZOQ==
Received: by smtp.zohomail.com with SMTPS id 1791396685949844.7214764798108;
	Wed, 7 Oct 2026 11:11:25 -0700 (PDT)
Date: Thu, 08 Oct 2026 02:11:19 +0800
From: Rong Zhang <i@rong.moe>
To: =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
 Charles <hanker007@gmail.com>, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_3/9=5D_platform/x86=3A_lenovo-w?=
 =?US-ASCII?Q?mi-capdata=3A_Defer_mutex_initialization?=
User-Agent: Thunderbird for Android
In-Reply-To: <af408357-f912-53a4-9259-8244a82d335d@linux.intel.com>
References: <20260914-lwmi-wmi-new-api-v1-0-7a400f2f69f8@rong.moe> <20260914-lwmi-wmi-new-api-v1-3-7a400f2f69f8@rong.moe> <af408357-f912-53a4-9259-8244a82d335d@linux.intel.com>
Message-ID: <E714CB23-287D-4F91-8315-D5CE5D38841C@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Ilpo,

=E4=BA=8E 2026=E5=B9=B410=E6=9C=886=E6=97=A5 GMT+08:00 00:25:07=EF=BC=8C"I=
lpo J=C3=A4rvinen" <ilpo=2Ejarvinen@linux=2Eintel=2Ecom> =E5=86=99=E9=81=93=
=EF=BC=9A
> On Mon, 14 Sep 2026, Rong Zhang wrote:
>=20
> > In the following changes, priv->list may be freed if the first call to
> > lwmi_cd_cache() fails due to WMI/ACPI errors, so the list_mutex must b=
e
> > initialized after it in order not to break lockdep, as there is no
> > devm_mutex_destroy()=2E Considering that the first call to lwmi_cd_cac=
he()
> > doesn't need serialization as there is no other reader or writer this
> > early, the initialization of list_mutex can be deferred=2E
> >=20
> > Therefore, initialize list_mutex only after the first call to
> > lwmi_cd_cache() succeeds, otherwise it remains uninitialized and can b=
e
> > devm_kfree()-ed=2E
> >=20
> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
> > ---
> >  drivers/platform/x86/lenovo/wmi-capdata=2Ec | 80 ++++++++++++++++++++=
+++--------
> >  1 file changed, 60 insertions(+), 20 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/pla=
tform/x86/lenovo/wmi-capdata=2Ec
> > index 880ac444c206=2E=2E0123ec8f7b53 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > @@ -91,6 +91,7 @@ struct lwmi_cd_priv {
> >  	struct wmi_device *wdev;
> >  	struct cd_list *list;
> >  	struct dentry *debugfs_dir;
> > +	bool initialized;
> > =20
> >  	/*
> >  	 * A capdata device may be a component master of another capdata dev=
ice=2E
> > @@ -588,14 +589,14 @@ static void lwmi_cd_debugfs_remove(struct lwmi_c=
d_priv *priv)
> >  /* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
> > =20
> >  /**
> > - * lwmi_cd_cache() - Cache all WMI data block information
> > + * __lwmi_cd_cache() - Cache all WMI data block information locklessl=
y
> >   * @priv: lenovo-wmi-capdata driver data=2E
> >   *
> > - * Loop through each WMI data block and cache the data=2E
> > + * Loop through each WMI data block and cache the data locklessly=2E
> >   *
> >   * Return: 0 on success, or an error=2E
> >   */
> > -static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> > +static int __lwmi_cd_cache(struct lwmi_cd_priv *priv)
> >  {
> >  	size_t size;
> >  	int idx;
> > @@ -617,7 +618,6 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv=
)
> >  		return -EINVAL;
> >  	}
> > =20
> > -	guard(mutex)(&priv->list->list_mutex);
> >  	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> >  		union acpi_object *ret_obj __free(kfree) =3D NULL;
> > =20
> > @@ -635,14 +635,37 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
> >  	return 0;
> >  }
> > =20
> > +/**
> > + * lwmi_cd_cache() - Cache all WMI data block information
> > + * @priv: lenovo-wmi-capdata driver data=2E
> > + *
> > + * Loop through each WMI data block and cache the data=2E
> > + *
> > + * Return: 0 on success, or an error=2E
> > + */
> > +static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
> > +{
> > +	if (!priv->initialized)
> > +		return __lwmi_cd_cache(priv);
> > +
> > +	switch (priv->info->type) {
> > +	case LENOVO_CAPABILITY_DATA_01:
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	guard(mutex)(&priv->list->list_mutex);
> > +	return __lwmi_cd_cache(priv);
> > +}
> > +
> >  /**
> >   * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data lis=
t
> >   * @priv: lenovo-wmi-capdata driver data=2E
> > - * @listptr: Pointer to returned cd_list pointer=2E
> >   *
> >   * Return: count of fans found, or an error=2E
> >   */
> > -static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, st=
ruct cd_list **listptr)
> > +static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
> >  {
> >  	struct cd_list *list;
> >  	size_t size;
> > @@ -688,6 +711,9 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwm=
i_cd_priv *priv, struct cd_lis
> >  	if (!list)
> >  		return -ENOMEM;
> > =20
> > +	list->count =3D count;
> > +	priv->list =3D list;
> > +
> >  	for (idx =3D 0; idx < count; idx++) {
> >  		/* Do not calculate array index using count, as it may be truncated=
=2E */
> >  		list->cd_fan[idx] =3D (struct capdata_fan) {
> > @@ -697,8 +723,7 @@ static int lwmi_cd_fan_list_alloc_cache(struct lwm=
i_cd_priv *priv, struct cd_lis
> >  		};
> >  	}
> > =20
> > -	*listptr =3D list;
> > -	return count;
> > +	return 0;
> >  }
> > =20
> >  /**
> > @@ -714,7 +739,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv=
)
> >  {
> >  	struct cd_list *list;
> >  	size_t list_size;
> > -	int count, ret;
> > +	int count;
> > =20
> >  	count =3D wmidev_instance_count(priv->wdev);
> > =20
> > @@ -726,11 +751,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pri=
v)
> >  		list_size =3D struct_size(list, cd01, count);
> >  		break;
> >  	case LENOVO_FAN_TEST_DATA:
> > -		count =3D lwmi_cd_fan_list_alloc_cache(priv, &list);
> > -		if (count < 0)
> > -			return count;
> > -
> > -		goto got_list;
> > +		return lwmi_cd_fan_list_alloc_cache(priv);
> >  	default:
> >  		return -EINVAL;
> >  	}
> > @@ -739,17 +760,32 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *pr=
iv)
> >  	if (!list)
> >  		return -ENOMEM;
> > =20
> > -got_list:
> > -	ret =3D devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
> > -	if (ret)
> > -		return ret;
> > -
> >  	list->count =3D count;
> >  	priv->list =3D list;
> > =20
> >  	return 0;
> >  }
> > =20
> > +/**
> > + * lwmi_cd_finalize() - Finalize the capability data initialization
> > + * @priv: lenovo-wmi-capdata driver data=2E
> > + *
> > + * Return: 0 on success, or an error code=2E
> > + */
> > +static int lwmi_cd_finalize(struct lwmi_cd_priv *priv)
> > +{
> > +	int ret;
> > +
> > +	if (priv->list) {
> > +		ret =3D devm_mutex_init(&priv->wdev->dev, &priv->list->list_mutex);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	priv->initialized =3D 1;
>=20
> Don't you need a barrier to ensure these are really done in the correct=
=20
> order?
>=20

Indeed=2E Will add appropriate release-acquire barriers=2E

ACK to all comments to other patches=2E Thanks a lot for reviewing!

Thanks,
Rong

> > +	return 0;
> > +}
> > +
> >  /**
> >   * lwmi_cd_setup() - Cache all WMI data block information
> >   * @priv: lenovo-wmi-capdata driver data=2E
> > @@ -768,7 +804,11 @@ static int lwmi_cd_setup(struct lwmi_cd_priv *pri=
v)
> >  	if (ret)
> >  		return ret;
> > =20
> > -	return lwmi_cd_cache(priv);
> > +	ret =3D lwmi_cd_cache(priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return lwmi_cd_finalize(priv);
> >  }
> > =20
> >  /**
> >=20
> >=20
>=20
