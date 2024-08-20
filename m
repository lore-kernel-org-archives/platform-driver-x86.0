Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D518FC93
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156106; cv=none; b=PSGVNXrUH58U3bhP5jFe6u0oDCugrt5shtYx4WGK9PfH0EWFr3j3CaE551jpx0kCwh/sFIYooY5IUa8JurvxfCct++pU8Qrx1ZHSAHJhgoru2ZftXPcphNhBCawffIi6nKA9gDIgNfJZI7T5g0YQoQVfacgAF57RBT6RgN1nWCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156106; c=relaxed/simple;
	bh=8LDCkCeKEOcQ12XfULehIiCspmhK8A7VIWcaA6bK/Dc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OuB10YP88xupJdwDrNAuH9dCBibxwhUN8pNDw6dv3JFB3Wa836IJqWzKjIhzluGvuA3ZqWd9C99wyWwUsp0JjB4OltR7w8Wwn/o/u4EPAqcPBtjf/iW6y2RIU6kGueZ6HNVmQDP3pIBK7b9xVFKOrvN/RMUEW8kTkuN/fNMJLIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyusZ+j0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyusZ+j0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724156104; x=1755692104;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8LDCkCeKEOcQ12XfULehIiCspmhK8A7VIWcaA6bK/Dc=;
  b=UyusZ+j0YX6t3icQ8WzTi5uVsRi7nlQ0hoZkWnAABx8XGS8o8815hT69
   TI+azeG1YcI1pUe2mZLIt52MUxSPvBJ5KJtXrRE844K643rLZkg/dSyx+
   Nt/Pk3TNip+hzOLbTmHRtalHmkxl/0nugvIwks7Kdo+qZNW0bnuq4zqKf
   0zYF084RFStezdmaaQLss9BGb5UewT9k4EzViYbA5B7harXCXjXtnxfXe
   d6PC3/JZ/E8uObe1Ixr9afpOiCp48caTGEfj6b5i8SbsusqiQgqQ4a66M
   Ht5wy+IStYlCiuORK8O/PC0mptik771f/8wbT8myfT02gJhFOJx6wWjQY
   Q==;
X-CSE-ConnectionGUID: 9IehPlC7Q6uflRIXbprcHg==
X-CSE-MsgGUID: OfqlJdthTvikdx969ahJPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="33605441"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="33605441"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:15:04 -0700
X-CSE-ConnectionGUID: atsOmKrfSse4QbF9eGCpoQ==
X-CSE-MsgGUID: 6R+zc2hpRYCnw+oxyBgRhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="61474459"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:15:02 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 15:14:58 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 07/11] platform/x86/amd/hsmp: Change generic plat_dev name
 to hsmp_pdev
In-Reply-To: <20240820102941.1813163-7-suma.hegde@amd.com>
Message-ID: <6e1962b9-33cb-7d55-4f92-6d70b552c152@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1100145201-1724156098=:1119"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1100145201-1724156098=:1119
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Aug 2024, Suma Hegde wrote:

> plat_dev is a commonly used variable name, since its made as extern now,
> change it to more specific name.
> Also change miscdevice hsmp_device to mdev.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
> Changes since v3:
> code indentation is removed in hsmp_parse_acpi_table().
>=20
> Changes since v2:
> None
>=20
> Changes since v1:
> 1. This is a new patch to rename generic name "plat_dev"
>    in hsmp.h, hsmp.c, plat.c and acpi.c to more specific name "hsmp_pdev"
> 2. Rename miscdevice hsmp_device to mdev.
>=20
>  drivers/platform/x86/amd/hsmp/acpi.c |  6 +--
>  drivers/platform/x86/amd/hsmp/hsmp.c | 60 ++++++++++++++--------------
>  drivers/platform/x86/amd/hsmp/hsmp.h |  4 +-
>  drivers/platform/x86/amd/hsmp/plat.c | 12 +++---
>  4 files changed, 41 insertions(+), 41 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 61c072216fb7..6f8e7962266a 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -194,13 +194,13 @@ static int hsmp_read_acpi_crs(struct hsmp_socket *s=
ock)
>  /* Parse the ACPI table to read the data */
>  static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  {
> -=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> +=09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
>  =09int ret;
> =20
>  =09sock->sock_ind=09=09=3D sock_ind;
>  =09sock->dev=09=09=3D dev;
>  =09sock->amd_hsmp_rdwr=09=3D amd_hsmp_acpi_rdwr;
> -=09plat_dev.is_acpi_device=09=3D true;
> +=09hsmp_pdev.is_acpi_device=09=3D true;
> =20
>  =09sema_init(&sock->hsmp_sem, 1);
> =20
> @@ -244,7 +244,7 @@ int init_acpi(struct device *dev)
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
> index 573867c17fd5..78945750d590 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -39,7 +39,7 @@
>  #define HSMP_WR=09=09=09true
>  #define HSMP_RD=09=09=09false
> =20
> -struct hsmp_plat_device plat_dev;
> +struct hsmp_plat_device hsmp_pdev;
> =20
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
> @@ -176,9 +176,9 @@ int hsmp_send_message(struct hsmp_message *msg)
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
> @@ -219,7 +219,7 @@ int hsmp_test(u16 sock_ind, u32 value)
> =20
>  =09/* Check the response value */
>  =09if (msg.args[0] !=3D (value + 1)) {
> -=09=09dev_err(plat_dev.sock[sock_ind].dev,
> +=09=09dev_err(hsmp_pdev.sock[sock_ind].dev,
>  =09=09=09"Socket %d test message failed, Expected 0x%08X, received 0x%08=
X\n",
>  =09=09=09sock_ind, (value + 1), msg.args[0]);
>  =09=09return -EBADE;
> @@ -320,7 +320,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struc=
t kobject *kobj,
> =20
>  static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
> -=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> +=09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
>  =09struct hsmp_message msg =3D { 0 };
>  =09phys_addr_t dram_addr;
>  =09int ret;
> @@ -354,7 +354,7 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  =09=09=09=09  struct bin_attribute *battr, int id)
>  {
> -=09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return battr->attr.mode;
>  =09else
>  =09=09return 0;
> @@ -362,17 +362,17 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *k=
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
> @@ -409,7 +409,7 @@ int hsmp_cache_proto_ver(u16 sock_ind)
> =20
>  =09ret =3D hsmp_send_message(&msg);
>  =09if (!ret)
> -=09=09plat_dev.proto_ver =3D msg.args[0];
> +=09=09hsmp_pdev.proto_ver =3D msg.args[0];
> =20
>  =09return ret;
>  }
> @@ -441,11 +441,11 @@ static int hsmp_pltdrv_probe(struct platform_device=
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
>  =09if (check_acpi_support(&pdev->dev)) {
> @@ -468,19 +468,19 @@ static int hsmp_pltdrv_probe(struct platform_device=
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
> @@ -493,9 +493,9 @@ static void hsmp_pltdrv_remove(struct platform_device=
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
> @@ -567,15 +567,15 @@ static int __init hsmp_plt_init(void)
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
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index f465600cb843..9c5b9c263fc1 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -48,7 +48,7 @@ struct hsmp_socket {
>  };
> =20
>  struct hsmp_plat_device {
> -=09struct miscdevice hsmp_device;
> +=09struct miscdevice mdev;
>  =09struct hsmp_socket *sock;
>  =09u32 proto_ver;
>  =09u16 num_sockets;
> @@ -56,7 +56,7 @@ struct hsmp_plat_device {
>  =09bool is_probed;
>  };
> =20
> -extern struct hsmp_plat_device plat_dev;
> +extern struct hsmp_plat_device hsmp_pdev;
> =20
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  =09=09=09     struct bin_attribute *bin_attr, char *buf,
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index 85a104859acd..e18cf82478a0 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -56,21 +56,21 @@ int hsmp_create_non_acpi_sysfs_if(struct device *dev)
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
> @@ -93,10 +93,10 @@ int init_platform_device(struct device *dev)
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
>=20
--8323328-1100145201-1724156098=:1119--
