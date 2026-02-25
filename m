Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B02D23EA88;
	Wed, 25 Feb 2026 17:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772040674; cv=pass; b=N8M6LrCZzxzXeiitXGiZitqBv6Low9bnrcnvVOp9xcf5KJtz38dVs43JnFrKdeohrA8DqxhGr9yjFWyuWksccS5iTgnK8DmL660TdsmIbfZL+vhggN07XVcorOxpr56emj2pZ28CVI/5Elosp6ETkXASb+CQrOtfIFqssUZRGHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772040674; c=relaxed/simple;
	bh=qCLUgGihRSjlB4qUHGihtX3OhQsles9Pu+hFw/nSmO8=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Oyhzek86u7h353k6Em/FQVIY10zuYMQO94JagR0VtoR535FHKhPmQ6aUP8dYxz1wJTBH0GyKJ90hETOLDbJ3fL0bHfVdSQR+kxpcIJfN+rnngno6naf8FmMcGgTC4xo3EG6hSDt86OksXDWNoZ4jcG0t6Dkg714fwzqRbHr7Ybw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=qWcD44Ix; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="qWcD44Ix"
ARC-Seal: i=1; a=rsa-sha256; t=1772040657; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S3Ha6iKehjn0aekfZV65nmd0qinigChdcI0+/rkWoiqAk7Q018pWBuD229HY+iyDfaXnbFcta69Hk4brW5dLml4xN92dwzasw/S4LjgTV3N21BEs0PE/cjBmvQxdpXRet8pcFFVtL/kYUrheSfibENsXHgPX6RipAj3+bv1RWzc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772040657; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zR9211yNvp19cMDUVa0Zi0qXrB/xTNPxtD7H13BJPlI=; 
	b=goQfi20hAELaePZ3W/xP0KeFGNVaziAQk3e6fEMOyxpuBPN6sD1t/B6bNutwRtftKAZto3AXN3dyh8sWup9BOer/7U1IEgnUijJE8qRJAq/w7us0jMVSKDmzdr5Ujbjo+i/FN+KGIDr3kHBPynGOzBQdd5veDqSHMQ4Mm0yNhF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772040657;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=zR9211yNvp19cMDUVa0Zi0qXrB/xTNPxtD7H13BJPlI=;
	b=qWcD44Ix9pS+wg/2j35jHejeTpzMRsm2krmn3oGLFD2/JiEINWiKSrnqjrlw6Ung
	gDK1kkO/huDe2K8XniWOMjGvycfctPiv7tZx9EK3uMUFwiUre9gqMskfi+bq5bN2fc1
	nMJ2T5N/06DEbgGLB47EfxFMjgSkDCoTpJFJ6bHkzr99rGyNrvN4lGECYNK8GcshNJ6
	PXS7dybX3Iu7T/X2gz1BXbSD3rukW513dtAuu2zaR53Ego0VEcHA9AUedhtAtPKDD7j
	202xOtwmCp/J9TiQUN3gC/Sk9mJiMoKyzLfo0NxVDWnYmPAATdQGunjroJ90j+tDAdv
	VEKStv+UgQ==
Received: by mx.zohomail.com with SMTPS id 177204065468318.40199597227945;
	Wed, 25 Feb 2026 09:30:54 -0800 (PST)
Message-ID: <239e134c7530004cc004233cb292851ea6864590.camel@rong.moe>
Subject: Re: [PATCH v3 5/6] platform-x86: lenovo-wmi-other: Rename
 LWMI_OM_FW_ATTR_BASE_PATH
From: Rong Zhang <i@rong.moe>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede
 <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Jonathan Corbet
	 <corbet@lwn.net>, Kurt Borja <kuurtb@gmail.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260224043200.2680384-6-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
	 <20260224043200.2680384-6-derekjohn.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2026 01:25:45 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Derek,

On Tue, 2026-02-24 at 04:31 +0000, Derek J. Clark wrote:
> In the next patch a power supply extension is added which requires
> a name attribute. Instead of creating another const macro with the
> same information, replace LWMI_OM_FW_ATTR_BASE_PATH with
> LWMI_OM_NAME and use that for firmware attributes and power supply
> extension.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
>  drivers/platform/x86/lenovo/wmi-other.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 67768f6a50e0..7f0d5a17b44f 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -90,13 +90,13 @@ enum lwmi_feature_id_gpu {
>  #define LWMI_FAN_NR 4
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
> =20
> +#define LWMI_FAN_DIV 100
> +
>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
>  	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
>  		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> =20
> -#define LWMI_FAN_DIV 100

I placed it here intentionally as it has nothing to do with
LWMI_ATTR_ID (contrary to other fan-related macros) and is just a
descriptive macro.

> -
> -#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
> +#define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> =20
>  static BLOCKING_NOTIFIER_HEAD(om_chain_head);
> @@ -1233,8 +1233,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv =
*priv)
> =20
>  	priv->fw_attr_dev =3D device_create(&firmware_attributes_class, NULL,
>  					  MKDEV(0, 0), NULL, "%s-%u",
> -					  LWMI_OM_FW_ATTR_BASE_PATH,
> -					  priv->ida_id);
> +					  LWMI_OM_SYSFS_NAME, priv->ida_id);
>  	if (IS_ERR(priv->fw_attr_dev)) {
>  		err =3D PTR_ERR(priv->fw_attr_dev);
>  		goto err_free_ida;

Thanks,
Rong
