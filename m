Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9890B175A7C;
	Wed,  1 Apr 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775068298; cv=pass; b=r0K8di96GW23zf8EmukHrUttjer30SvsEssRQ3qdYHJ+vgCHZA9BLaqno3gAjAmg2j8kNX5MDNp60SJwkvIqhJ5sULzJGUcja0M7zpkP2LsrtJvJB4HCdPcPla427e+nOClBAAMo1Y/iaKIihLxxqO0RSBaN8ESNXxq1JLYw9PA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775068298; c=relaxed/simple;
	bh=eode8YopEaq8mIoC0Igk5iViWOoTM8c65+XgRYojFVw=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VRYZ9hvCqJudF0LOBWdQRatpiZz4qpXbr6BscQagsCsq7/Sm2FmBzzXr0NyPgFjbnEUqpfABw2e9FTlWURjGCDYCJz/QJywtvhwwtQUcCp2vGc8D9Zd0XFvC8QIowbUKmYz7uplC48+BB3YalO5xc7jERdRo1Tf7+Cw0rTkdI6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=T9nt4W2E; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="T9nt4W2E"
ARC-Seal: i=1; a=rsa-sha256; t=1775068286; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dudarHKJj7IS2pZnRFYEspPa3/zaKo+DEVDex09iZfnO3P47xanblD5oZlzkKazvEirSOiq55WwZTJcYnrP4B6SmZeRMy8Ea0lnfKPbWpNwc7JRDjoQKFDgb02ohATBdM2pHMklY0AuDj1VqfQPtsxWGAcJeT8pBsZHIbSeJ4R0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775068286; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G5LI1Q8FSb6vO+dZM2MSaEVF91pXVw11MKXuaXA8YW4=; 
	b=GsM6tNbKl4bQR78qNl43FwElqVx420llKftVaknoXMtM4mE2fan64sUWh9FQE17tGqQ6e1yrtQWYsA/tl3TRZd1RaGnuMMnKY4zCaGU1IAq07kaUSO7P/JegLmG96V3RrmDEcfmoZ2sbiYRqi5KjPuQFOYxyVjxJovQ6A7sUdiU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775068286;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=G5LI1Q8FSb6vO+dZM2MSaEVF91pXVw11MKXuaXA8YW4=;
	b=T9nt4W2E3zCqXWJYe/n53glF/OwkyuZ1R0Q8hHlLoApkhmPf/+eCXe+1BZFskdKm
	BepfLC+zOzxWZfNPfbfNB/S2075WX8BvTX1vDcT71DZxEnf2gN3hHIfuEqv9c6vF5WM
	v0HwpAeNLOYt169AokHMfu+4OEmYvXni4S149NGriB/oxd6IinjsJHbAuiUX5AkjKST
	Kw4OaGVq1Ib0AgMNw/ML7tjdZJlcjdA77kKoheHbhTsCWwW8sqo8ql4nKJSsV+vfRdO
	gi7a5C5NxlBi4CfPohZWRBRlynD7/ubx+4vJK67kPFtYkY0Z/7sxIRhtOE1ABhIfuz8
	BpY5CCGJ0g==
Received: by mx.zohomail.com with SMTPS id 1775068283972330.3932832483614;
	Wed, 1 Apr 2026 11:31:23 -0700 (PDT)
Message-ID: <884366dcf3f13429447c9e158b0696a833e8b894.camel@rong.moe>
Subject: Re: [PATCH v6 03/13] platform/x86: lenovo-wmi-other: Zero
 initialize WMI arguments
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260331181208.421552-4-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
	 <20260331181208.421552-4-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Apr 2026 02:26:17 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-9 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-03-31 at 18:11 +0000, Derek J. Clark wrote:
> Adds explicit initialization of wmi_method_args_32 declarations with
> zero values to prevent uninitialized data from being sent to the WMI
> device when passed.
>=20
> Suggested-by: Rong Zhang <i@rong.moe>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Add a Fixes: tag if applicable?

If you decide to add it,=C2=A0fix patches should be the very first patches =
in
the series so that they can be backported painlessly. See also my reply
to the cover letter.

> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index c1728c7c2957..c3614bc4f90c 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
>   */
>  static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u=
32 *val, bool set)
>  {
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };

`=3D {}' is enough and more readable. Ditto for following ones and those
in other patches.

Also, sashiko.dev reported that lwmi_gz_profile_set() needs zero-
initialization too. Could you fix it in this patch too?

https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gm=
ail.com

With them fixed:

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

>  	u32 method_id, retval;
>  	int err;
> =20
> @@ -772,7 +772,7 @@ static ssize_t attr_current_value_store(struct kobjec=
t *kobj,
>  					struct tunable_attr_01 *tunable_attr)
>  {
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>  	struct capdata01 capdata;
>  	enum thermal_mode mode;
>  	u32 attribute_id;
> @@ -835,7 +835,7 @@ static ssize_t attr_current_value_show(struct kobject=
 *kobj,
>  				       struct tunable_attr_01 *tunable_attr)
>  {
>  	struct lwmi_om_priv *priv =3D dev_get_drvdata(tunable_attr->dev);
> -	struct wmi_method_args_32 args;
> +	struct wmi_method_args_32 args =3D { 0x0, 0x0 };
>  	enum thermal_mode mode;
>  	u32 attribute_id;
>  	int retval;
