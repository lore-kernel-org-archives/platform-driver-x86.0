Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A477F13
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jan 2024 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706099663; cv=none; b=eOuLTUJ7h/pqaUnoGU9tWGwA72WwWErm/RGyh50JNXrtQiho4jo9XmnBUzy9QBrdTemMsTrM5dguOfaJ1ddcF76ULMCVa+IhBNGIgCvmGIxi8q2DlfP910/b6DOZNJefPRcU6C7OmiJNvcNpYZyfM8ME4TVUjU+l/Gfudg2PeoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706099663; c=relaxed/simple;
	bh=g/+8CYrkYQJWRGxqtY1nH56me6B36mhp0gPAPkuTVf4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fBK00/WmGzxSSIyNA+5m7EbaeUnqsrUJcWosw2fZX6siR9W9YttU5N1690AaWcjQnoO5h/tQCWQ5/8vdOv5YG1R0rXtx2VLWwyeMtdP1/qpq+SN7rKMNRvPoaIX2uZB2KbEiDa3wG5CkYd0W74kNJANRc9rY+7SJuVpvJGxvAv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXHKixbW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXHKixbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706099661; x=1737635661;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=g/+8CYrkYQJWRGxqtY1nH56me6B36mhp0gPAPkuTVf4=;
  b=jXHKixbWQfaEJwnNLS1IMCS6VJlYvxy7UFUnlZyv+OG/bxqL/EXVRvv2
   Mh1JOW4iCICK8R+8vGxYXhcMOnGWRCMVcskQQCvaMKfcvv9WLqAocpn12
   M13voCHVGj7gk9jcyQZYR28YRGPVARINrLf3PJU962fnzQMSh4SOlH0ro
   U0/VGx54qR6KxydK0V4TUKLjQ1kh8jhv+oVf2Z8n/9k3BRa7Pn/zKdrmZ
   0avwXhZoYrp4KSPQfXJ7kwU8dVeEK7JCzXoAFyjeVVISgUm5BrKNDINbf
   RKtmByoYbzIMcAJJ0bnzq6rAhnSo9HKQs43kFI4EIhE1xRVDf+wH4QRCH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8940192"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8940192"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:34:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="876682252"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="876682252"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.246.48.46])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 04:34:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 24 Jan 2024 14:34:15 +0200 (EET)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v5 06/11] platform/x86/amd/hsmp: Restructure sysfs group
 creation
In-Reply-To: <20240106022532.1746932-6-suma.hegde@amd.com>
Message-ID: <c826d19f-5f84-012a-cd58-a620783f75f7@linux.intel.com>
References: <20240106022532.1746932-1-suma.hegde@amd.com> <20240106022532.1746932-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1770400933-1706099595=:1372"
Content-ID: <935170b9-230f-19a7-1043-7468e994e129@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1770400933-1706099595=:1372
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0ad8ffae-7eb0-6101-a03b-f39630293ec3@linux.intel.com>

On Sat, 6 Jan 2024, Suma Hegde wrote:

> Split the creation of array of attribute groups and array of attributes
> into different functions. This will ease the ACPI support.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v4:
> New patch, generated after splitting 6th patch in v4 series
>=20
>  drivers/platform/x86/amd/hsmp.c | 44 ++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp.c
> index 0bf94e2bd022..cf8e8d155155 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -442,49 +442,53 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin=
_attribute **hattrs, u16 sock
>  /* One bin sysfs for metrics table*/
>  #define NUM_HSMP_ATTRS=09=091
> =20
> -static int hsmp_create_sysfs_interface(void)
> +static int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +=09=09=09=09 struct device *dev, u16 sock_ind)
>  {
> -=09const struct attribute_group **hsmp_attr_grps;
>  =09struct bin_attribute **hsmp_bin_attrs;
> +
> +=09/* Null terminated list of attributes */
> +=09hsmp_bin_attrs =3D devm_kzalloc(dev, sizeof(struct bin_attribute *) *
> +=09=09=09=09      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> +=09if (!hsmp_bin_attrs)
> +=09=09return -ENOMEM;
> +
> +=09attr_grp->bin_attrs =3D hsmp_bin_attrs;
> +
> +=09return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
> +}
> +
> +static int hsmp_create_sysfs_interface(struct device *dev)
> +{
> +=09const struct attribute_group **hsmp_attr_grps;
>  =09struct attribute_group *attr_grp;
> -=09int ret;
>  =09u16 i;
> =20
>  =09/* String formatting is currently limited to u8 sockets */
>  =09if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>  =09=09return -ERANGE;
> =20
> -=09hsmp_attr_grps =3D devm_kzalloc(plat_dev.sock[0].dev, sizeof(struct a=
ttribute_group *) *
> +=09hsmp_attr_grps =3D devm_kzalloc(dev, sizeof(struct attribute_group *)=
 *
>  =09=09=09=09      (plat_dev.num_sockets + 1), GFP_KERNEL);
>  =09if (!hsmp_attr_grps)
>  =09=09return -ENOMEM;
> =20
>  =09/* Create a sysfs directory for each socket */
>  =09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> -=09=09attr_grp =3D devm_kzalloc(plat_dev.sock[i].dev, sizeof(struct attr=
ibute_group),
> +=09=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group),
>  =09=09=09=09=09GFP_KERNEL);
>  =09=09if (!attr_grp)
>  =09=09=09return -ENOMEM;
> =20
>  =09=09snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u=
", (u8)i);
> -=09=09attr_grp->name =3D plat_dev.sock[i].name;
> -
> -=09=09/* Null terminated list of attributes */
> -=09=09hsmp_bin_attrs =3D devm_kzalloc(plat_dev.sock[i].dev, sizeof(struc=
t bin_attribute *) *
> -=09=09=09=09=09      (NUM_HSMP_ATTRS + 1), GFP_KERNEL);
> -=09=09if (!hsmp_bin_attrs)
> -=09=09=09return -ENOMEM;
> -
> -=09=09attr_grp->bin_attrs=09=09=3D hsmp_bin_attrs;
> +=09=09attr_grp->name=09=09=09=3D plat_dev.sock[i].name;
>  =09=09attr_grp->is_bin_visible=09=3D hsmp_is_sock_attr_visible;
>  =09=09hsmp_attr_grps[i]=09=09=3D attr_grp;
> =20
> -=09=09/* Now create the leaf nodes */
> -=09=09ret =3D hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, i);
> -=09=09if (ret)
> -=09=09=09return ret;
> +=09=09hsmp_create_attr_list(attr_grp, dev, i);
>  =09}
> -=09return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
> +
> +=09return devm_device_add_groups(dev, hsmp_attr_grps);
>  }
> =20
>  static int hsmp_cache_proto_ver(void)
> @@ -561,7 +565,7 @@ static int hsmp_pltdrv_probe(struct platform_device *=
pdev)
>  =09=09return ret;
>  =09}
> =20
> -=09ret =3D hsmp_create_sysfs_interface();
> +=09ret =3D hsmp_create_sysfs_interface(&pdev->dev);
>  =09if (ret)
>  =09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> =20
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.
--8323328-1770400933-1706099595=:1372--
