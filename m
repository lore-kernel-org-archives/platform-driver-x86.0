Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8B91C37B0
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033895; cv=none; b=VCO7AO1x20r62oKIVmqqg5Gkmrg8cxtcB0zbYg1798EkRuRZtYGl8CcnR5EQNw7zVdcJF9YTvx7Wd4yg900JgntEMwBFLebX22Jzg4i8/oeQYxf+cx8tYWBa4lCbNYO6poduNucAcoEAKSoDpXTDR/kY5hmcL1AVqk+b3XNnbIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033895; c=relaxed/simple;
	bh=3MVUvE7AhiOGe4DfTXCpnaq4nKgXOZBMt5PF3LSpdK4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=TtL8SvpsTk2T+iHwszhxtZ0fA64a3DDVcnxgqEgbHnNfrOE+/4+rrRJxwTUNdHxpSP5DafXn0hX0b54E1C3pWu/Gzpbu/afSu24MbakFhKGis8k6WcR4UrMbC6xwGCVJAETLaYTlIe88+GrQtWgU4ZtBuG2agFM3OCAXRkzK8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pa+byNFo; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pa+byNFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723033894; x=1754569894;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=3MVUvE7AhiOGe4DfTXCpnaq4nKgXOZBMt5PF3LSpdK4=;
  b=Pa+byNFog1uFpYPuHa/qKS9o4Ssn0FG/7wmur9FHpSqPie4o2MaisVkr
   TO1ZnDGDl6IvYMDTjGaDeIbC9qg2K/BRKLy2tUBLVxd3nAqz6BuTMfIrC
   o2McEWep9Akql1WTKJU4W86K5pq7V1Wv21tYuGy7PL0xkf3zSJ5cNCeCy
   CHIoiGuyFtgPsYaP8A6CO0jNEM+Sq0IqQYEb4X0IkmzRaJ4tMBTMPK5qH
   M/SR60okENMdG2qNcC7RaumagbasEe4NUGnluc7C3/u4m6p3we9uD3QP3
   KSe97Ux9cIyERIFplliyPotV9IDSKcVhtyMsbNMO27G8dQSJjBvUB2DhI
   Q==;
X-CSE-ConnectionGUID: ZMprDiNLQYalWBgbgrF1KA==
X-CSE-MsgGUID: /ENcj0QYQP+iHf6z4uz1+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43620893"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="43620893"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:31:33 -0700
X-CSE-ConnectionGUID: uNNH5GH2T02GVP1/6L8rvA==
X-CSE-MsgGUID: IziCgYc7RlKInHADSEu+Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="94413001"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 05:31:31 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 15:31:26 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 06/11] platform/x86/amd/hsmp: Change generic plat_dev name
 to hsmp_pdev
In-Reply-To: <20240720174552.946255-6-suma.hegde@amd.com>
Message-ID: <e5d6c816-9346-98e9-964b-575f52141948@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-636347188-1723031830=:1138"
Content-ID: <facb2f2a-6642-44fe-7dfc-5337cf3d5a81@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-636347188-1723031830=:1138
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <29b96bd3-7f47-45ea-e8d5-45b10b977505@linux.intel.com>

On Sat, 20 Jul 2024, Suma Hegde wrote:

> plat_dev is a commonly used variable name, since its made as extern now,
> change it to more specific name.
> Also change miscdevice hsmp_device to mdev.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v2:
> None
> Changes since v1:
> 1. This is a new patch to rename generic name "plat_dev"
>    in hsmp.h, hsmp.c, plat.c and acpi.c to more specific name "hsmp_pdev"
> 2. Rename miscdevice hsmp_device to mdev.
>=20
>  drivers/platform/x86/amd/hsmp/acpi.c | 10 +++---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 22 ++++++------
>  drivers/platform/x86/amd/hsmp/hsmp.h |  4 +--
>  drivers/platform/x86/amd/hsmp/plat.c | 52 ++++++++++++++--------------
>  4 files changed, 44 insertions(+), 44 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index eca324774141..46cb86d5d550 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -191,12 +191,12 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *s=
ock)
>  /* Parse the ACPI table to read the data */
>  static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  {
> -=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> +=09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
>  =09int ret;
> =20
> -=09sock->sock_ind=09=09=3D sock_ind;
> -=09sock->dev=09=09=3D dev;
> -=09plat_dev.is_acpi_device=09=3D true;
> +=09sock->sock_ind=09=09=09=3D sock_ind;
> +=09sock->dev=09=09=09=3D dev;
> +=09hsmp_pdev.is_acpi_device=09=3D true;

This a good example why aligning =3D is usually bad idea because it=20
tends to lead to extra code churn like this when the alignment has to be=20
maintained.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

>  =09sema_init(&sock->hsmp_sem, 1);
> =20
> @@ -240,7 +240,7 @@ int init_acpi(struct device *dev)
>  =09ret =3D hsmp_get_uid(dev, &sock_ind);
>  =09if (ret)
>  =09=09return ret;
> -=09if (sock_ind >=3D plat_dev.num_sockets)
> +=09if (sock_ind >=3D hsmp_pdev.num_sockets)
>  =09=09return -EINVAL;
> =20
>  =09ret =3D hsmp_parse_acpi_table(dev, sock_ind);
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 8473c2d1258b..14edaace4379 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -29,12 +29,12 @@
>  #define HSMP_WR=09=09=09true
>  #define HSMP_RD=09=09=09false
> =20
> -struct hsmp_plat_device plat_dev;
> +struct hsmp_plat_device hsmp_pdev;
> =20
>  static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>  =09=09=09 u32 *value, bool write)
>  {
> -=09if (plat_dev.is_acpi_device)
> +=09if (hsmp_pdev.is_acpi_device)
>  =09=09amd_hsmp_acpi_rdwr(sock, offset, value, write);
>  =09else
>  =09=09return amd_hsmp_pci_rdwr(sock, offset, value, write);
> @@ -177,9 +177,9 @@ int hsmp_send_message(struct hsmp_message *msg)
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09if (!plat_dev.sock || msg->sock_ind >=3D plat_dev.num_sockets)
> +=09if (!hsmp_pdev.sock || msg->sock_ind >=3D hsmp_pdev.num_sockets)
>  =09=09return -ENODEV;
> -=09sock =3D &plat_dev.sock[msg->sock_ind];
> +=09sock =3D &hsmp_pdev.sock[msg->sock_ind];
> =20
>  =09/*
>  =09 * The time taken by smu operation to complete is between
> @@ -220,7 +220,7 @@ int hsmp_test(u16 sock_ind, u32 value)
> =20
>  =09/* Check the response value */
>  =09if (msg.args[0] !=3D (value + 1)) {
> -=09=09dev_err(plat_dev.sock[sock_ind].dev,
> +=09=09dev_err(hsmp_pdev.sock[sock_ind].dev,
>  =09=09=09"Socket %d test message failed, Expected 0x%08X, received 0x%08=
X\n",
>  =09=09=09sock_ind, (value + 1), msg.args[0]);
>  =09=09return -EBADE;
> @@ -315,7 +315,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struc=
t kobject *kobj,
> =20
>  static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
> -=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> +=09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
>  =09struct hsmp_message msg =3D { 0 };
>  =09phys_addr_t dram_addr;
>  =09int ret;
> @@ -349,7 +349,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  =09=09=09=09  struct bin_attribute *battr, int id)
>  {
> -=09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return battr->attr.mode;
>  =09else
>  =09=09return 0;
> @@ -357,17 +357,17 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *k=
obj,
> =20
>  static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, =
u16 sock_ind)
>  {
> -=09struct bin_attribute *hattr =3D &plat_dev.sock[sock_ind].hsmp_attr;
> +=09struct bin_attribute *hattr =3D &hsmp_pdev.sock[sock_ind].hsmp_attr;
> =20
>  =09sysfs_bin_attr_init(hattr);
>  =09hattr->attr.name=09=3D HSMP_METRICS_TABLE_NAME;
>  =09hattr->attr.mode=09=3D 0444;
>  =09hattr->read=09=09=3D hsmp_metric_tbl_read;
>  =09hattr->size=09=09=3D sizeof(struct hsmp_metric_table);
> -=09hattr->private=09=09=3D &plat_dev.sock[sock_ind];
> +=09hattr->private=09=09=3D &hsmp_pdev.sock[sock_ind];
>  =09hattrs[0]=09=09=3D hattr;
> =20
> -=09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return hsmp_get_tbl_dram_base(sock_ind);
>  =09else
>  =09=09return 0;
> @@ -404,7 +404,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
> =20
>  =09ret =3D hsmp_send_message(&msg);
>  =09if (!ret)
> -=09=09plat_dev.proto_ver =3D msg.args[0];
> +=09=09hsmp_pdev.proto_ver =3D msg.args[0];
> =20
>  =09return ret;
>  }
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index 1ff652dc0ef0..a77887d298b6 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -44,7 +44,7 @@ struct hsmp_socket {
>  };
> =20
>  struct hsmp_plat_device {
> -=09struct miscdevice hsmp_device;
> +=09struct miscdevice mdev;
>  =09struct hsmp_socket *sock;
>  =09u32 proto_ver;
>  =09u16 num_sockets;
> @@ -52,7 +52,7 @@ struct hsmp_plat_device {
>  =09bool is_probed;
>  };
> =20
> -extern struct hsmp_plat_device plat_dev;
> +extern struct hsmp_plat_device hsmp_pdev;
> =20
>  int init_acpi(struct device *dev);
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index 2ed5a9452244..c297540bb64c 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -68,21 +68,21 @@ static int hsmp_create_non_acpi_sysfs_if(struct devic=
e *dev)
>  =09struct attribute_group *attr_grp;
>  =09u16 i;
> =20
> -=09hsmp_attr_grps =3D devm_kcalloc(dev, plat_dev.num_sockets + 1,
> +=09hsmp_attr_grps =3D devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
>  =09=09=09=09      sizeof(*hsmp_attr_grps),
>  =09=09=09=09      GFP_KERNEL);
>  =09if (!hsmp_attr_grps)
>  =09=09return -ENOMEM;
> =20
>  =09/* Create a sysfs directory for each socket */
> -=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> +=09for (i =3D 0; i < hsmp_pdev.num_sockets; i++) {
>  =09=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group),
>  =09=09=09=09=09GFP_KERNEL);
>  =09=09if (!attr_grp)
>  =09=09=09return -ENOMEM;
> =20
> -=09=09snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u=
", (u8)i);
> -=09=09attr_grp->name=09=09=09=3D plat_dev.sock[i].name;
> +=09=09snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%=
u", (u8)i);
> +=09=09attr_grp->name=09=09=09=3D hsmp_pdev.sock[i].name;
>  =09=09attr_grp->is_bin_visible=09=3D hsmp_is_sock_attr_visible;
>  =09=09hsmp_attr_grps[i]=09=09=3D attr_grp;
> =20
> @@ -105,10 +105,10 @@ static int init_platform_device(struct device *dev)
>  =09struct hsmp_socket *sock;
>  =09int ret, i;
> =20
> -=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> +=09for (i =3D 0; i < hsmp_pdev.num_sockets; i++) {
>  =09=09if (!node_to_amd_nb(i))
>  =09=09=09return -ENODEV;
> -=09=09sock =3D &plat_dev.sock[i];
> +=09=09sock =3D &hsmp_pdev.sock[i];
>  =09=09sock->root=09=09=09=3D node_to_amd_nb(i)->root;
>  =09=09sock->sock_ind=09=09=09=3D i;
>  =09=09sock->dev=09=09=09=3D dev;
> @@ -173,11 +173,11 @@ static int hsmp_pltdrv_probe(struct platform_device=
 *pdev)
>  =09 * Hence allocate memory for all the sockets at once instead of alloc=
ating
>  =09 * on each probe.
>  =09 */
> -=09if (!plat_dev.is_probed) {
> -=09=09plat_dev.sock =3D devm_kcalloc(&pdev->dev, plat_dev.num_sockets,
> -=09=09=09=09=09     sizeof(*plat_dev.sock),
> -=09=09=09=09=09     GFP_KERNEL);
> -=09=09if (!plat_dev.sock)
> +=09if (!hsmp_pdev.is_probed) {
> +=09=09hsmp_pdev.sock =3D devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +=09=09=09=09=09      sizeof(*hsmp_pdev.sock),
> +=09=09=09=09=09      GFP_KERNEL);
> +=09=09if (!hsmp_pdev.sock)
>  =09=09=09return -ENOMEM;
>  =09}
> =20
> @@ -201,19 +201,19 @@ static int hsmp_pltdrv_probe(struct platform_device=
 *pdev)
>  =09=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>  =09}
> =20
> -=09if (!plat_dev.is_probed) {
> -=09=09plat_dev.hsmp_device.name=09=3D HSMP_CDEV_NAME;
> -=09=09plat_dev.hsmp_device.minor=09=3D MISC_DYNAMIC_MINOR;
> -=09=09plat_dev.hsmp_device.fops=09=3D &hsmp_fops;
> -=09=09plat_dev.hsmp_device.parent=09=3D &pdev->dev;
> -=09=09plat_dev.hsmp_device.nodename=09=3D HSMP_DEVNODE_NAME;
> -=09=09plat_dev.hsmp_device.mode=09=3D 0644;
> +=09if (!hsmp_pdev.is_probed) {
> +=09=09hsmp_pdev.mdev.name=09=3D HSMP_CDEV_NAME;
> +=09=09hsmp_pdev.mdev.minor=09=3D MISC_DYNAMIC_MINOR;
> +=09=09hsmp_pdev.mdev.fops=09=3D &hsmp_fops;
> +=09=09hsmp_pdev.mdev.parent=09=3D &pdev->dev;
> +=09=09hsmp_pdev.mdev.nodename=09=3D HSMP_DEVNODE_NAME;
> +=09=09hsmp_pdev.mdev.mode=09=3D 0644;
> =20
> -=09=09ret =3D misc_register(&plat_dev.hsmp_device);
> +=09=09ret =3D misc_register(&hsmp_pdev.mdev);
>  =09=09if (ret)
>  =09=09=09return ret;
> =20
> -=09=09plat_dev.is_probed =3D true;
> +=09=09hsmp_pdev.is_probed =3D true;
>  =09}
> =20
>  =09return 0;
> @@ -225,9 +225,9 @@ static void hsmp_pltdrv_remove(struct platform_device=
 *pdev)
>  =09 * We register only one misc_device even on multi socket system.
>  =09 * So, deregister should happen only once.
>  =09 */
> -=09if (plat_dev.is_probed) {
> -=09=09misc_deregister(&plat_dev.hsmp_device);
> -=09=09plat_dev.is_probed =3D false;
> +=09if (hsmp_pdev.is_probed) {
> +=09=09misc_deregister(&hsmp_pdev.mdev);
> +=09=09hsmp_pdev.is_probed =3D false;
>  =09}
>  }
> =20
> @@ -299,15 +299,15 @@ static int __init hsmp_plt_init(void)
>  =09 * amd_nb_num() returns number of SMN/DF interfaces present in the sy=
stem
>  =09 * if we have N SMN/DF interfaces that ideally means N sockets
>  =09 */
> -=09plat_dev.num_sockets =3D amd_nb_num();
> -=09if (plat_dev.num_sockets =3D=3D 0 || plat_dev.num_sockets > MAX_AMD_S=
OCKETS)
> +=09hsmp_pdev.num_sockets =3D amd_nb_num();
> +=09if (hsmp_pdev.num_sockets =3D=3D 0 || hsmp_pdev.num_sockets > MAX_AMD=
_SOCKETS)
>  =09=09return ret;
> =20
>  =09ret =3D platform_driver_register(&amd_hsmp_driver);
>  =09if (ret)
>  =09=09return ret;
> =20
> -=09if (!plat_dev.is_acpi_device) {
> +=09if (!hsmp_pdev.is_acpi_device) {
>  =09=09if (legacy_hsmp_support()) {
>  =09=09=09/* Not ACPI device, but supports HSMP, register a plat_dev */
>  =09=09=09ret =3D hsmp_plat_dev_register();
>=20
--8323328-636347188-1723031830=:1138--
