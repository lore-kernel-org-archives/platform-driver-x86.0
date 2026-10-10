Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6421B7910;
	Sat, 10 Oct 2026 01:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791597107; cv=pass; b=T5F4Wor/6RaqN8KpACQD6l2ukQcfgHfqAJEvhAxq2fsCcvWdGhRxtRutKOIXyuts7KcbqKZM8qL7uu/Tnwot9NHa7H9uLCk7a9/uPp0QJAfM+YpgiuFTzjnmoT4G+A4ndtdrh2NHyq8Bk9lIwqd1ymgbyWyoPaEKjFYPZBJToH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791597107; c=relaxed/simple;
	bh=GEdxb/sSvUWF2AgWLTNtKr7m8ZrnE+DUOEOFIf9Qbi0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pANFrg1Vu+VRBq8aQSEgUGNFAj43869PL3Aj08ufJlmtk+EoL+t6QLDAh0X/vcTP+mQN0IKRamUM1fcmpMP2T6fYPWU1C2qaiFa7ReXcJNXq3tahz3x8SN5iuCKTKIEKNw8ZGHJBDNy9F42rRif98u6AeOslDByDdAU5uQe0Nik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=P2lxQmPX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="P2lxQmPX"
ARC-Seal: i=1; a=rsa-sha256; t=1791597096; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E5SkuUoh7qzVFE4DApT7VUigkZfjbe1Hizr6ymfiaPIN+W+AWPZFOHILZc38TXfKPb7ZwdRujKfTV2uY14HHauTmpIpQQj6ATCG5S1jKT1NJihz/2DxxToEa/ggoVaCq85ar/VWkVOjDHIVhBU01+oaZHskoTnGWicQaZqT5E0g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791597096; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=04u2onhHUKz1Mi44y2QDBEmpslMzv/nwskOmuyjlCY8=; 
	b=QqESu+O2VaVUgCvuyaX47fYt7yFyjDluABoCYhpQNV5xxBLs2YSLRAyRLggcTJbHY7fo2rURW6dEr8iQYXtFYo6WNEnvQVaD2Yof0vqkm2mhMOk+1f93X6FJPUWNd183TWk9HE7sB/Y8lN5Wdqw6nSJRoIYi6HC78U6zRXisgTY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791597096;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=04u2onhHUKz1Mi44y2QDBEmpslMzv/nwskOmuyjlCY8=;
	b=P2lxQmPXMLxYHIUKt59fRuy2XzvJV1esJ5sTugnIk0iho3aRilO8t9MtO+8NNzfW
	eNrs6ujT1UTrX/a9nHXfsEwJLWgoG14OrHToVfdeMOU4ITDx6Ccu+thTySx8a/Wq4eT
	bZFxSz956h1OEOXMlrFNt6f89NJzvj4qxN2geiikbEC3ExBAonrMaEorK8AiHtB9FDV
	xbZ2T9QcNesuXJIKEt1dPgV1Yz8oJTCoAktJ6R+08ebUul8oi5Yc6mh6LuCXu2Mp5Wq
	EergVzHmjFuSwQodcJZWuKUhEfAdCyidtzNZ0Pm2BYwkwx7PhL+2GvrHc/GVSvCngNP
	xvvXUAJxDg==
Received: by smtp.zohomail.com with SMTPS id 1791597094494264.00596172119594;
	Fri, 9 Oct 2026 18:51:34 -0700 (PDT)
Date: Sat, 10 Oct 2026 09:51:22 +0800
From: Rong Zhang <i@rong.moe>
To: Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Charles <hanker007@gmail.com>, Navon John Lukose <navonjohnlukose@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_07/12=5D_platform/x86=3A_l?=
 =?US-ASCII?Q?enovo-wmi-capdata=3A_Adopt_new_WMI_API?=
User-Agent: Thunderbird for Android
In-Reply-To: <bcc471f4-bae6-4de6-a60d-7f37f5df64a9@gmx.de>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe> <20261009-lwmi-wmi-new-api-v2-7-402828382679@rong.moe> <bcc471f4-bae6-4de6-a60d-7f37f5df64a9@gmx.de>
Message-ID: <05CD62A5-DF3A-4C52-BE91-A283BE0E2106@rong.moe>
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

Hi Armin,

Thanks for your review=2E


=E4=BA=8E 2026=E5=B9=B410=E6=9C=8810=E6=97=A5 GMT+08:00 09:16:48=EF=BC=8CA=
rmin Wolf <W_Armin@gmx=2Ede> =E5=86=99=E9=81=93=EF=BC=9A
> Am 09=2E10=2E26 um 14:53 schrieb Rong Zhang:
>=20
> > The new WMI API supports multiple ACPI types by converting them into a
> > unified buffer that satisfies alignment and size requirements=2E
> >=20
> > Adopt it to make our life easier=2E
> >=20
> > Note that the new WMI API only accepts a few ACPI types to conform to
> > the behavior of the Windows WMI-ACPI driver=2E By adopting the new API=
, we
> > intentionally rejects improper ACPI types instead of silently ignoring
> > them=2E
> >=20
> > Meanwhile, considering that `struct_size(block, data, count * 3)' may
> > overflow when calculating `count * 3', ignore Fan Test Data with count=
 >
> > U8_MAX instead of caping `count'=2E
> >=20
> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
> > ---
> >   drivers/platform/x86/lenovo/wmi-capdata=2Ec | 71 ++++++++++++++-----=
------------
> >   1 file changed, 32 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata=2Ec b/drivers/pla=
tform/x86/lenovo/wmi-capdata=2Ec
> > index de8044ef68b8=2E=2Ed70fe4504fc5 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata=2Ec
> > @@ -628,17 +628,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *=
priv)
> >   	}
> >     	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> > -		union acpi_object *ret_obj __free(kfree) =3D NULL;
> > +		struct wmi_buffer wbuf;
> > +		int ret;
> >   -		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > -		if (!ret_obj)
> > -			return -ENODEV;
> > -
> > -		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> > -		    ret_obj->buffer=2Elength < size)
> > +		ret =3D wmidev_query_block(priv->wdev, idx, &wbuf, size);
> > +		if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbe=
d=2E */
> >   			continue;
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Capdata 01 is an extension to capdata 00=2E */
> > +		struct capdata00 *capdata __free(kfree) =3D wbuf=2Edata;
> >   -		memcpy(p, ret_obj->buffer=2Epointer, size);
> > +		memcpy(p, capdata, size);
> >   	}
> >     	return 0;
> > @@ -680,43 +682,35 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pr=
iv)
> >    */
> >   static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
> >   {
> > +	struct wmi_buffer wbuf;
> >   	struct cd_list *list;
> > -	size_t size;
> > +	int ret, idx;
> >   	u32 count;
> > -	int idx;
> >   -	/* Emit unaligned access to u8 buffer with __packed=2E */
> >   	struct cd_fan_block {
> >   		u32 nr;
> >   		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> > -	} __packed * block;
> > +	};
>=20
> Hi,
>=20
> i suggest you keep the __packed here=2E With this being addressed:

Hmm, may I ask why?

The data itself is never packed, the only use of __packed was to emit
unaligned access=2E

WMI driver development guide says:

    Since the WMI driver core guarantees that all buffers received from
    a WMI device are aligned on an 8-byte boundary, WMI drivers can
    simply perform a cast=2E

Thus, the buffer has a better alignment than sizeof(u32)=2E

Thanks,
Rong

>=20
> Reviewed-by: Armin Wolf <W_Armin@gmx=2Ede>
>=20
> > +
> > +	ret =3D wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fa=
n_block));
> > +	if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbed=
=2E */
> > +		return 0;
> > +	if (ret)
> > +		return ret;
> >   -	union acpi_object *ret_obj __free(kfree) =3D wmidev_block_query(pr=
iv->wdev, 0);
> > -	if (!ret_obj)
> > -		return -ENODEV;
> > +	struct cd_fan_block *block __free(kfree) =3D wbuf=2Edata;
> >   -	if (ret_obj->type =3D=3D ACPI_TYPE_BUFFER) {
> > -		block =3D (struct cd_fan_block *)ret_obj->buffer=2Epointer;
> > -		size =3D ret_obj->buffer=2Elength;
> > +	count =3D block->nr;
> >   -		count =3D size >=3D sizeof(*block) ? block->nr : 0;
> > -		if (size < struct_size(block, data, count * 3)) {
> > -			dev_warn(&priv->wdev->dev,
> > -				 "incomplete fan test data block: %zu < %zu, ignoring\n",
> > -				 size, struct_size(block, data, count * 3));
> > -			count =3D 0;
> > -		} else if (count > U8_MAX) {
> > -			dev_warn(&priv->wdev->dev,
> > -				 "too many fans reported: %u > %u, truncating\n",
> > -				 count, U8_MAX);
> > -			count =3D U8_MAX;
> > -		}
> > -	} else {
> > -		/*
> > -		 * This is usually caused by a dummy ACPI method=2E Do not return a=
n error
> > -		 * as failing to probe this device will result in sub-master device=
 being
> > -		 * unbound=2E This behavior aligns with lwmi_cd_cache()=2E
> > -		 */
> > +	if (count > U8_MAX) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "too many fans reported: %u > %u, ignoring\n", count,
> > +			 U8_MAX);
> > +		count =3D 0;
> > +	} else if (wbuf=2Elength < struct_size(block, data, count * 3)) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n"=
,
> > +			 wbuf=2Elength, struct_size(block, data, count * 3), count);
> >   		count =3D 0;
> >   	}
> >   @@ -731,11 +725,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct=
 lwmi_cd_priv *priv)
> >   	priv->list =3D list;
> >     	for (idx =3D 0; idx < count; idx++) {
> > -		/* Do not calculate array index using count, as it may be truncated=
=2E */
> >   		list->cd_fan[idx] =3D (struct capdata_fan) {
> >   			=2Eid      =3D block->data[idx],
> > -			=2Emax_rpm =3D block->data[idx + block->nr],
> > -			=2Emin_rpm =3D block->data[idx + (2 * block->nr)],
> > +			=2Emax_rpm =3D block->data[idx + count],
> > +			=2Emin_rpm =3D block->data[idx + (2 * count)],
> >   		};
> >   	}
> >  =20
