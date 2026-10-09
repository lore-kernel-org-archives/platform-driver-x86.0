Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A15A37CD4E;
	Fri,  9 Oct 2026 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791561049; cv=pass; b=XedjuDFhUOnbTUVr+CND2cGD1U9FKf4yOt7kQdy7vSannWdeguH9OnlyqBs0U3qOVKp+B0kUEsOq/SIgb6yX/7yVZ5z9GLrrMngjJR0m0cj51sQtq33Pl5Og5wY8zX1XfCIOB5GkN6xPKWQx4q3PhqHGSQ759OB6uPQTarwKwOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791561049; c=relaxed/simple;
	bh=sZeKj4d8HcPRxEe265hz5/C6auTjVAqBVcXRqbjCqSY=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BpOjZa0DFNNrxx575lPJ7LHOKUhAAhlggCUm3TcKiky5dNiZsopEmaaLqV/hjfXQ7jasVu39GscioI/LJ/A6l3ySk99eHD+fIhK45u85C5KxdIwOUAofmyXHgBt/wpAJaBuf6hY6yT2eSOzvSpX955oJKX/d7paghkHOzkEqnQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Ha2BNXin; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Ha2BNXin"
ARC-Seal: i=1; a=rsa-sha256; t=1791561040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=joAwEy6U51JHdyV6Wbho4vAMSheAnPGAOraS7s4AUuV1yWvHYbGzFkdvT6ooUMbdzdJj6Srg6oR0ksxQzllV61fRespKeiiqk+UtkDPPDYlv1HgTaVSlQ0hpcYivSpZ31wxZmgT4Bl2sl2Nbh3wa1hUnVAOuSpzNagt88lFV/UU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791561040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N/JVOY63FWPsFMJ28HkOCCFczqyQwRGvhaw/0dLe7FE=; 
	b=EK5c+LfcSj4mi6a2iUiEP5SMDv346TuBbroUVlMkyQUDV1R5BjxB+1LAh2K/TX7tC6dYfvjYwL0t9qYGkEZLGv229E0WBFLvJJPlS0761/6ZkIyil2wioGVduEHlLEM8o3se7OsRMIyDvFUPwIOnuw/ysWCtdUEZqn6QS0Z2zWI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791561040;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=N/JVOY63FWPsFMJ28HkOCCFczqyQwRGvhaw/0dLe7FE=;
	b=Ha2BNXinR5UdA/YxbvZGmYvq8dlGYm0SjDcIRY9PnlBCOt4XGmi7IDhLIUq0tkzO
	E351ZdeMZaKIJKLKW6Z7JgbX/Ntse73Jt3aPLUs4i9R7YO6Ax/AHYiG+ldF5wmPWeso
	WftGjlprQin2kyiYlxiVsCF9Vpxg2q1qxPBNSNu2fUDDB7eq3DRHH2F6lQ16gClNL8+
	l1WELibciu4t90yN3Mqnn9FAlEmqN4slMjYhXl4Xm3JHWUfZdde34bG1y1oqEFvVdAQ
	erga9sYiqiQ37rOj/Wf9svOxs2fGB8Sytik9WQYjvu/BWUANKh+uERYoZo9hxCwoEu7
	rfpYqon0WQ==
Received: by smtp.zohomail.com with SMTPS id 1791561038401108.5946915658377;
	Fri, 9 Oct 2026 08:50:38 -0700 (PDT)
Message-ID: <faa1eb31890107b8bdd2386e9361f929d4cd881d.camel@rong.moe>
Subject: Re: [PATCH v2 03/12] platform/x86: lenovo-wmi-capdata: Only
 allocate sub-master info when necessary
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Mark Pearson	
 <mpearson-lenovo@squebb.ca>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf
 <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, Navon John Lukose
 <navonjohnlukose@gmail.com>, 	platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <807F11B7-33B6-454F-B550-F516E974703B@gmail.com>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
	 <20261009-lwmi-wmi-new-api-v2-3-402828382679@rong.moe>
	 <807F11B7-33B6-454F-B550-F516E974703B@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 23:45:26 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Derek,

Thanks for your review.

On Fri, 2026-10-09 at 08:15 -0700, Derek J. Clark wrote:
> On October 9, 2026 5:53:45 AM PDT, Rong Zhang <i@rong.moe> wrote:
> > When capdata00 declares no fan test support, there is no need to
> > allocate sub-master info as it's basically unused except for the
> > priv->sub_master->sub_component_list =3D=3D ERR_PTR(-ENODEV) placeholde=
r.
> >=20
> > Therefore, only allocate priv->sub_master when necessary, otherwise its
> > absence implies the absence of sub-component. With that,
> > PTR_ERR(sub_component_list) =3D=3D -ENODEV is repurposed for the follow=
ing
> > changes to represent stubbed sub-component.
> >=20
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > drivers/platform/x86/lenovo/wmi-capdata.c | 36 ++++++++++++++++++------=
-------
> > 1 file changed, 21 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index 58787da959b4..3a823aee608a 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -101,9 +101,11 @@ struct lwmi_cd_priv {
> > 	struct lwmi_cd_sub_master_priv {
> > 		struct device *master_dev;
> > 		cd_list_cb_t master_cb;
> > -		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies no s=
ub-component. */
> > +		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV) implies stub=
bed
> > +						     * sub-component.
> > +						     */
>=20
> Hi Rong,
>=20
> Hitting the column limit here looks ugly and harms readability IMO. Perha=
ps we could rename the variable (sc_list?) or be less explicit about the fu=
ll error signature?

Makes sense. Will rephrase it into:

		struct cd_list *sub_component_list; /* ERR_PTR(-ENODEV): stubbed sub-comp=
onent. */

Thanks,
Rong

> - Derek
>=20
> > 		bool registered;                    /* Has the sub-master been regist=
ered? */
> > -	} *sub_master;
> > +	} *sub_master;                              /* NULL impLnlies no sub-=
component. */
> > };
> >=20
> > struct cd_list {
> > @@ -258,6 +260,12 @@ static int lwmi_cd_component_bind(struct device *c=
d_dev,
> > 	case LENOVO_CAPABILITY_DATA_00:
> > 		binder->cd00_list =3D priv->list;
> >=20
> > +		/* Missing sub-master info implies missing sub-component. */
> > +		if (!priv->sub_master) {
> > +			binder->cd_fan_list_cb(om_dev, NULL);
> > +			break;
> > +		}
> > +
> > 		priv->sub_master->master_dev =3D om_dev;
> > 		priv->sub_master->master_cb =3D binder->cd_fan_list_cb;
> > 		lwmi_cd_call_master_cb(priv);
> > @@ -288,13 +296,9 @@ static void lwmi_cd_component_unbind(struct device=
 *cd_dev,
> > {
> > 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> >=20
> > -	switch (priv->list->type) {
> > -	case LENOVO_CAPABILITY_DATA_00:
> > +	if (priv->sub_master) {
> > 		priv->sub_master->master_dev =3D NULL;
> > 		priv->sub_master->master_cb =3D NULL;
> > -		return;
> > -	default:
> > -		return;
> > 	}
> > }
> >=20
> > @@ -369,17 +373,19 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_=
priv *priv,
> > 	struct component_match *master_match =3D NULL;
> > 	int ret;
> >=20
> > +	/*
> > +	 * If the sub-master has no sub-component, there is no need to alloca=
te
> > +	 * or register the sub-master. The master callback will be called wit=
h
> > +	 * NULL on master <-> sub-master bind to inform the master about the
> > +	 * absence of sub-component.
> > +	 */
> > +	if (sub_component_type =3D=3D CD_TYPE_NONE)
> > +		return 0;
> > +
> > 	priv->sub_master =3D devm_kzalloc(&priv->wdev->dev, sizeof(*priv->sub_=
master), GFP_KERNEL);
> > 	if (!priv->sub_master)
> > 		return -ENOMEM;
> >=20
> > -	if (sub_component_type =3D=3D CD_TYPE_NONE) {
> > -		/* The master callback will be called with NULL on bind. */
> > -		priv->sub_master->sub_component_list =3D ERR_PTR(-ENODEV);
> > -		priv->sub_master->registered =3D false;
> > -		return 0;
> > -	}
> > -
> > 	/*
> > 	 * lwmi_cd_match() needs a pointer to enum lwmi_cd_type, but on-stack
> > 	 * data cannot be used here. Steal one from lwmi_cd_table.
> > @@ -404,7 +410,7 @@ static int lwmi_cd_sub_master_add(struct lwmi_cd_pr=
iv *priv,
> >  */
> > static void lwmi_cd_sub_master_del(struct lwmi_cd_priv *priv)
> > {
> > -	if (!priv->sub_master->registered)
> > +	if (!priv->sub_master || !priv->sub_master->registered)
> > 		return;
> >=20
> > 	component_master_del(&priv->wdev->dev, &lwmi_cd_sub_master_ops);
> >=20
