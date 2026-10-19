Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE5D38422E;
	Mon, 19 Oct 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411244; cv=pass; b=rVCWCQtI1iQS6tAaGzoawUHJEUEFxy/X9xyqMv4wXLkVTS+7nDaux0WmzY85yAGyQrD6RfiT1Ift6Np4B74h+NXfh0Ogvbql65uuIATu0GMl61WpfSU8v3I5iofTSrD+UzuquM1brgvWJesv6b3xOwbPQcM7GU8LdbZbwwd6+wY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411244; c=relaxed/simple;
	bh=xU02j8m+D6JSG+GsTV1kqiERwb91tGkQ8GNkssoRa4o=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HFrjcw3nYlWhkOJshaWr7oT+cqK76cCuo1x01TWg+3A6OKBpBfJntOVplXXdSXRjam2u8eK92JTeXkmb4FqUwEdDr4lbankhwtHvtCO4O5igleS3CmiU3cpdz9GA1c5s1Ay7gMozYnxyiTBCqe8hdW0S8FBuU64IG7ffoWUdZrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=ZqhXtVFf; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="ZqhXtVFf"
ARC-Seal: i=1; a=rsa-sha256; t=1792411233; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PMEPr3NIZj3K1fkQWP9rilN6ZynJ7EZDuuC7vEH7XF4SZjTvq0zibvPQaE+JgNYXgQdlrgcbZOVlnTqgQVmkt0erPZvaS+D69x+DMcsLoN0uxLKP1GCaJC/FtKEaiEQnfQvmiE97kKt1GsOaf9Ub4DL0qcydDtUyjAU8TlIbwqQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792411233; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4yXoG5YUxfbI3LGES2Do+1gRPxz0L6AD1tK7zf8ZUJY=; 
	b=FRiu6MmXSJjSNztE8w7ah7JHkxwUvBxw4bjzVX731GWd3DZmPkK5pjxx8x/LLcCbGq5MB5pyiZqYq+JFjnzsLvUHkXMZnnO6mWJzThMiuTqcB4OtrjzfcBvHxbsTsdNo2jtwB+miNqbJ+Dqu87dq4HUQFntyXc3tZPVrO7zgdt8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792411233;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=4yXoG5YUxfbI3LGES2Do+1gRPxz0L6AD1tK7zf8ZUJY=;
	b=ZqhXtVFf6nj7wfoSQE2v6m/K+Qq4xPY0oPkff/vAm0KfQAWHVmAzl2TRCv5RTsOZ
	2GqTJV0+85q/+b8KlppG0Q8qVSHA/c6QbYdeK5FOa423EXzj57Z/44eF2ml6XZV97+B
	ZpKEFkecFkCAGJ1OulgLi2yi9kHBB4vhJ0FiyrtOVGnEbfhcdcS7+O3+LvTgCVDRlj2
	aOy/B93e9ErNie/OUg1KWt7EwuBGm6Fx7QltK+VQrKKq6IBa6ssP03aTYElMvXNlquI
	PjD+pe/cFYo0uY85x7pYuzQUFSyC51gBevdHlb6amxu59xw7qbaZfDsTqgI47SjKmP2
	PL3xENd/EQ==
Received: by smtp.zohomail.com with SMTPS id 1792411228562577.1517549414438;
	Mon, 19 Oct 2026 05:00:28 -0700 (PDT)
Message-ID: <006245a9857566cdd7e6bd24882bfec66d2db56c.camel@rong.moe>
Subject: Re: [PATCH v4 07/12] platform/x86: lenovo-wmi-capdata: Adopt new
 WMI API
From: Rong Zhang <i@rong.moe>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark"
	 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Armin Wolf
	 <W_Armin@gmx.de>, Charles <hanker007@gmail.com>, Navon John Lukose
	 <navonjohnlukose@gmail.com>, platform-driver-x86@vger.kernel.org, LKML
	 <linux-kernel@vger.kernel.org>
In-Reply-To: <e67534db-c29c-4f89-9b7d-cf9ff5704674@linux.intel.com>
References: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
	 <20261018-lwmi-wmi-new-api-v4-7-aafef7956c4a@rong.moe>
	 <e67534db-c29c-4f89-9b7d-cf9ff5704674@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 19:54:31 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-10+b1 
X-ZohoMailClient: External

Hi Ilpo,

Thanks for your review.

On Mon, 2026-10-19 at 09:46 +0300, Ilpo J=C3=A4rvinen wrote:
> On Sun, 18 Oct 2026, Rong Zhang wrote:
>=20
> > The new WMI API supports multiple ACPI types by converting them into a
> > unified buffer that satisfies alignment and size requirements.
> >=20
> > Adopt it to make our life easier.
> >=20
> > Note that the new WMI API only accepts a few ACPI types to conform to
> > the behavior of the Windows WMI-ACPI driver. By adopting the new API, w=
e
> > intentionally rejects improper ACPI types instead of silently ignoring
> > them.
> >=20
> > Meanwhile, considering that `struct_size(block, data, count * 3)' may
> > overflow when calculating `count * 3', ignore Fan Test Data with count =
>
> > U8_MAX instead of capping `count'.
> >=20
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
> > Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> > Signed-off-by: Rong Zhang <i@rong.moe>
> > ---
> > Changes in v4:
> > - Fix typo (thanks Mark Pearson)
> >=20
> > Changes in v3:
> > - Leave struct cd_fan_block's __packed attribute as is (thanks Armin
> >   Wolf)
> > ---
> >  drivers/platform/x86/lenovo/wmi-capdata.c | 70 ++++++++++++++---------=
--------
> >  1 file changed, 31 insertions(+), 39 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> > index 3c09bb9e3d46..abf5ffda7163 100644
> > --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> > +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> > @@ -626,17 +626,19 @@ static int __lwmi_cd_cache(struct lwmi_cd_priv *p=
riv)
> >  	}
> > =20
> >  	for (idx =3D 0; idx < priv->list->count; idx++, p +=3D size) {
> > -		union acpi_object *ret_obj __free(kfree) =3D NULL;
> > +		struct wmi_buffer wbuf;
> > +		int ret;
> > =20
> > -		ret_obj =3D wmidev_block_query(priv->wdev, idx);
> > -		if (!ret_obj)
> > -			return -ENODEV;
> > -
> > -		if (ret_obj->type !=3D ACPI_TYPE_BUFFER ||
> > -		    ret_obj->buffer.length < size)
> > +		ret =3D wmidev_query_block(priv->wdev, idx, &wbuf, size);
> > +		if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbed=
. */
> >  			continue;
> > +		if (ret)
> > +			return ret;
> > +
> > +		/* Capdata 01 is an extension to capdata 00. */
> > +		struct capdata00 *capdata __free(kfree) =3D wbuf.data;
> > =20
> > -		memcpy(p, ret_obj->buffer.pointer, size);
> > +		memcpy(p, capdata, size);
> >  	}
> > =20
> >  	return 0;
> > @@ -678,43 +680,34 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *pri=
v)
> >   */
> >  static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv)
> >  {
> > +	struct wmi_buffer wbuf;
> >  	struct cd_list *list;
> > -	size_t size;
> > +	int ret, idx;
> >  	u32 count;
> > -	int idx;
> > =20
> > -	/* Emit unaligned access to u8 buffer with __packed. */
> >  	struct cd_fan_block {
> >  		u32 nr;
> >  		u32 data[]; /* id[nr], max_rpm[nr], min_rpm[nr] */
> > -	} __packed * block;
> > +	} __packed;
>=20
> Could this just be moved outside of the function?

Makes sense. Will submit a v5 soon.

Thanks,
Rong

>=20
> > -	union acpi_object *ret_obj __free(kfree) =3D wmidev_block_query(priv-=
>wdev, 0);
> > -	if (!ret_obj)
> > -		return -ENODEV;
> > +	ret =3D wmidev_query_block(priv->wdev, 0, &wbuf, sizeof(struct cd_fan=
_block));
> > +	if (ret =3D=3D -ENODATA) /* The block is too short, probably stubbed.=
 */
> > +		return 0;
> > +	if (ret)
> > +		return ret;
> > =20
> > -	if (ret_obj->type =3D=3D ACPI_TYPE_BUFFER) {
> > -		block =3D (struct cd_fan_block *)ret_obj->buffer.pointer;
> > -		size =3D ret_obj->buffer.length;
> > +	struct cd_fan_block *block __free(kfree) =3D wbuf.data;
> > =20
> > -		count =3D size >=3D sizeof(*block) ? block->nr : 0;
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
> > -		 * This is usually caused by a dummy ACPI method. Do not return an e=
rror
> > -		 * as failing to probe this device will result in sub-master device =
being
> > -		 * unbound. This behavior aligns with lwmi_cd_cache().
> > -		 */
> > +	count =3D block->nr;
> > +
> > +	if (count > U8_MAX) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "too many fans reported: %u > %u, ignoring\n", count, U8_MAX);
> > +		count =3D 0;
> > +	} else if (wbuf.length < struct_size(block, data, count * 3)) {
> > +		dev_warn(&priv->wdev->dev,
> > +			 "incomplete fan test data block: %zu < %zu (%u fans), ignoring\n",
> > +			 wbuf.length, struct_size(block, data, count * 3), count);
> >  		count =3D 0;
> >  	}
> > =20
> > @@ -729,11 +722,10 @@ static int lwmi_cd_fan_list_alloc_cache(struct lw=
mi_cd_priv *priv)
> >  	priv->list =3D list;
> > =20
> >  	for (idx =3D 0; idx < count; idx++) {
> > -		/* Do not calculate array index using count, as it may be truncated.=
 */
> >  		list->cd_fan[idx] =3D (struct capdata_fan) {
> >  			.id      =3D block->data[idx],
> > -			.max_rpm =3D block->data[idx + block->nr],
> > -			.min_rpm =3D block->data[idx + (2 * block->nr)],
> > +			.max_rpm =3D block->data[idx + count],
> > +			.min_rpm =3D block->data[idx + (2 * count)],
> >  		};
> >  	}
> > =20
> >=20
> >=20
