Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318B61DA10F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725456420; cv=none; b=QkhY+pvWQDCOhl0tY0mjDoNGHqObmLgT23RZsAk8FLf1GthKssDRF2zgmHZ5SRuMSCK4doPea1pU+kqs7o5++PyjHf7NUIgXBdz3/hRL6POC0WjScxdxmwZ5XN2AnNc2GYclel4MdvTqXFUDtLWvqW/rjwtGD86RaGqM6fxQSuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725456420; c=relaxed/simple;
	bh=M5BtV4n8f3lJ+HxuTdKImRaMEYo4kOthu+11vNHWHR4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nWrJnZ44WPIQp7X1wmb+IVWXr8fkxaCw59DuXDPZRSvy+qrfBw3OZtHkbK3oFlElwKeAaCQgQRPJtJ/MgRwyCxvWBhvnExYETlVHnEJohEX72eV99hogCRhA4EQAVC6JOw84x2LF4Ux1Rn6M9LuDKpn0zsp/CJx3kLLUPfS62B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B8hbpKxm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B8hbpKxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725456418; x=1756992418;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M5BtV4n8f3lJ+HxuTdKImRaMEYo4kOthu+11vNHWHR4=;
  b=B8hbpKxmHGDGbyo0BSRSNVXCZCwj15E7UloekW8wfVFNk0fevD5ziWgu
   YPpiPqlC/BWgHoY9xDAAVzV0sxmlRdOlY5ibFoLLVoLMhq00whbcm3fp/
   X8X4/yfJ8k8wvN7ggE7VDf7H8slIW8mVWbcwuviBJ6VHoQyOAscQifLn5
   NruuGTQf3gsX7zWCgDchp6I+34zvlakycA6AIep3fFsJg4s5s1ju0fC/r
   UxYnWH+c2fuFIxiAkekv5Oq3XSyWCDevo2jwWeY4Iw1C/QjvUQDFZnWB3
   TGTZeTd7VXZGs0CZThdaBGHdVOmiyfQzkAoyDLTh1VBiMWaRb8NUTZtFy
   Q==;
X-CSE-ConnectionGUID: 9eJ44bSCSUuq9k2p0ebR2A==
X-CSE-MsgGUID: i25uom6aRPyNKIuqQb935w==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="34717839"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="34717839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:26:57 -0700
X-CSE-ConnectionGUID: FeWCns9USzWFaUbZIuGLyQ==
X-CSE-MsgGUID: 7zFnFnPLQsq1lPMPzrpVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="96007570"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.156])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 06:26:55 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 4 Sep 2024 16:26:50 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v7 10/10] platform/x86/amd/hsmp: Use dev_groups in the driver
 structure
In-Reply-To: <20240903123830.2717196-10-suma.hegde@amd.com>
Message-ID: <90c0d25e-7a7c-2ef0-6344-112c70bc66fb@linux.intel.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com> <20240903123830.2717196-10-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1978217064-1725456410=:1078"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1978217064-1725456410=:1078
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 3 Sep 2024, Suma Hegde wrote:

> Move out of device_add_group() variants, instead assign static array of
> attribute groups to .dev_groups in platform_driver structure.
> Then use is_visible to enable only the necessary files on the platform.
>=20
> .read() and .is_bin_visibile() have slightly different
> implemetations on ACPI and non-ACPI system, so move them
> to respective files.
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Thanks, looks okay now.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> ---
> Changes since v6:
> 1. Move common code of hsmp_metric_tbl_read() of plat.c and acpi.c to
>    hsmp.c with the same function name.
> 2. Rename hsmp_metric_tbl_read() to hsmp_metric_tbl_plat_read() and
>    hsmp_metric_tbl_acpi_read() in plat.c acpi.c respectively.
> 3. Add tabe space in macros definition in plat.c
> 4. Keep only one cast for sock_ind.
>=20
> Changes since v5:
> Assign integer directly to .private.
>=20
> Changes since v4:
> Change ->private from string pointer to u16 pointer.
>=20
> Changes since v3:
> This patch and next patch(9th and 10th patch in v3 series) are merged
> and commit description is updated.
>=20
> Changes since v2:
> None
>=20
> Changes since v1:
> 1. Change is_visible to is_bin_visible in commit message
> 1. Add parenthesis around read and is_bin_visible in commit message
> 2. Change plat_dev to hsmp_pdev, hsmp_device to mdev
> 3. Remove unnecessary if, else conditions in hsmp_is_sock_attr_visible
> 4. Change un cached to un-cached
>=20
>  drivers/platform/x86/amd/hsmp/acpi.c |  65 ++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.c |  64 ++-------------
>  drivers/platform/x86/amd/hsmp/hsmp.h |   9 +--
>  drivers/platform/x86/amd/hsmp/plat.c | 113 +++++++++++++++++++++------
>  4 files changed, 140 insertions(+), 111 deletions(-)
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> index 766617e6adc7..d226f7deb49b 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -9,6 +9,7 @@
> =20
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
> =20
>  #include <linux/acpi.h>
> @@ -211,6 +212,8 @@ static int hsmp_parse_acpi_table(struct device *dev, =
u16 sock_ind)
> =20
>  =09sema_init(&sock->hsmp_sem, 1);
> =20
> +=09dev_set_drvdata(dev, sock);
> +
>  =09/* Read MP1 base address from CRS method */
>  =09ret =3D hsmp_read_acpi_crs(sock);
>  =09if (ret)
> @@ -220,27 +223,23 @@ static int hsmp_parse_acpi_table(struct device *dev=
, u16 sock_ind)
>  =09return hsmp_read_acpi_dsd(sock);
>  }
> =20
> -static int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobje=
ct *kobj,
> +=09=09=09=09=09 struct bin_attribute *bin_attr, char *buf,
> +=09=09=09=09=09 loff_t off, size_t count)
>  {
> -=09struct attribute_group *attr_grp;
> -=09u16 sock_ind;
> -=09int ret;
> +=09struct device *dev =3D container_of(kobj, struct device, kobj);
> +=09struct hsmp_socket *sock =3D dev_get_drvdata(dev);
> =20
> -=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KE=
RNEL);
> -=09if (!attr_grp)
> -=09=09return -ENOMEM;
> -
> -=09attr_grp->is_bin_visible =3D hsmp_is_sock_attr_visible;
> -
> -=09ret =3D hsmp_get_uid(dev, &sock_ind);
> -=09if (ret)
> -=09=09return ret;
> +=09return hsmp_metric_tbl_read(sock, buf, count);
> +}
> =20
> -=09ret =3D hsmp_create_attr_list(attr_grp, dev, sock_ind);
> -=09if (ret)
> -=09=09return ret;
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +=09=09=09=09=09 struct bin_attribute *battr, int id)
> +{
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
> +=09=09return battr->attr.mode;
> =20
> -=09return devm_device_add_group(dev, attr_grp);
> +=09return 0;
>  }
> =20
>  static int init_acpi(struct device *dev)
> @@ -275,9 +274,36 @@ static int init_acpi(struct device *dev)
>  =09=09return ret;
>  =09}
> =20
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6) {
> +=09=09ret =3D hsmp_get_tbl_dram_base(sock_ind);
> +=09=09if (ret)
> +=09=09=09dev_err(dev, "Failed to init metric table\n");
> +=09}
> +
>  =09return ret;
>  }
> =20
> +static struct bin_attribute  hsmp_metric_tbl_attr =3D {
> +=09.attr =3D { .name =3D HSMP_METRICS_TABLE_NAME, .mode =3D 0444},
> +=09.read =3D hsmp_metric_tbl_acpi_read,
> +=09.size =3D sizeof(struct hsmp_metric_table),
> +};
> +
> +static struct bin_attribute *hsmp_attr_list[] =3D {
> +=09&hsmp_metric_tbl_attr,
> +=09NULL
> +};
> +
> +static struct attribute_group hsmp_attr_grp =3D {
> +=09.bin_attrs =3D hsmp_attr_list,
> +=09.is_bin_visible =3D hsmp_is_sock_attr_visible,
> +};
> +
> +static const struct attribute_group *hsmp_groups[] =3D {
> +=09&hsmp_attr_grp,
> +=09NULL
> +};
> +
>  static const struct acpi_device_id amd_hsmp_acpi_ids[] =3D {
>  =09{ACPI_HSMP_DEVICE_HID, 0},
>  =09{}
> @@ -306,10 +332,6 @@ static int hsmp_acpi_probe(struct platform_device *p=
dev)
>  =09=09return ret;
>  =09}
> =20
> -=09ret =3D hsmp_create_acpi_sysfs_if(&pdev->dev);
> -=09if (ret)
> -=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  =09if (!hsmp_pdev.is_probed) {
>  =09=09ret =3D hsmp_misc_register(&pdev->dev);
>  =09=09if (ret)
> @@ -338,6 +360,7 @@ static struct platform_driver amd_hsmp_driver =3D {
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D DRIVER_NAME,
>  =09=09.acpi_match_table =3D amd_hsmp_acpi_ids,
> +=09=09.dev_groups =3D hsmp_groups,
>  =09},
>  };
> =20
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 8c8e361b1feb..e7df514c699c 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -278,19 +278,16 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, =
unsigned long arg)
>  =09return 0;
>  }
> =20
> -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -=09=09=09     struct bin_attribute *bin_attr, char *buf,
> -=09=09=09     loff_t off, size_t count)
> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t=
 size)
>  {
> -=09struct hsmp_socket *sock =3D bin_attr->private;
>  =09struct hsmp_message msg =3D { 0 };
>  =09int ret;
> =20
> -=09if (!sock)
> +=09if (!sock || !buf)
>  =09=09return -EINVAL;
> =20
> -=09/* Do not support lseek(), reads entire metric table */
> -=09if (count < bin_attr->size) {
> +=09/* Do not support lseek(), also don't allow more than the size of met=
ric table */
> +=09if (size !=3D sizeof(struct hsmp_metric_table)) {
>  =09=09dev_err(sock->dev, "Wrong buffer size\n");
>  =09=09return -EINVAL;
>  =09}
> @@ -301,12 +298,12 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, str=
uct kobject *kobj,
>  =09ret =3D hsmp_send_message(&msg);
>  =09if (ret)
>  =09=09return ret;
> -=09memcpy_fromio(buf, sock->metric_tbl_addr, bin_attr->size);
> +=09memcpy_fromio(buf, sock->metric_tbl_addr, size);
> =20
> -=09return bin_attr->size;
> +=09return size;
>  }
> =20
> -static int hsmp_get_tbl_dram_base(u16 sock_ind)
> +int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  =09struct hsmp_socket *sock =3D &hsmp_pdev.sock[sock_ind];
>  =09struct hsmp_message msg =3D { 0 };
> @@ -339,53 +336,6 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  =09return 0;
>  }
> =20
> -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -=09=09=09=09  struct bin_attribute *battr, int id)
> -{
> -=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
> -=09=09return battr->attr.mode;
> -=09else
> -=09=09return 0;
> -}
> -
> -static int hsmp_init_metric_tbl_bin_attr(struct bin_attribute **hattrs, =
u16 sock_ind)
> -{
> -=09struct bin_attribute *hattr =3D &hsmp_pdev.sock[sock_ind].hsmp_attr;
> -
> -=09sysfs_bin_attr_init(hattr);
> -=09hattr->attr.name=09=3D HSMP_METRICS_TABLE_NAME;
> -=09hattr->attr.mode=09=3D 0444;
> -=09hattr->read=09=09=3D hsmp_metric_tbl_read;
> -=09hattr->size=09=09=3D sizeof(struct hsmp_metric_table);
> -=09hattr->private=09=09=3D &hsmp_pdev.sock[sock_ind];
> -=09hattrs[0]=09=09=3D hattr;
> -
> -=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
> -=09=09return hsmp_get_tbl_dram_base(sock_ind);
> -=09else
> -=09=09return 0;
> -}
> -
> -/* One bin sysfs for metrics table */
> -#define NUM_HSMP_ATTRS=09=091
> -
> -int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -=09=09=09  struct device *dev, u16 sock_ind)
> -{
> -=09struct bin_attribute **hsmp_bin_attrs;
> -
> -=09/* Null terminated list of attributes */
> -=09hsmp_bin_attrs =3D devm_kcalloc(dev, NUM_HSMP_ATTRS + 1,
> -=09=09=09=09      sizeof(*hsmp_bin_attrs),
> -=09=09=09=09      GFP_KERNEL);
> -=09if (!hsmp_bin_attrs)
> -=09=09return -ENOMEM;
> -
> -=09attr_grp->bin_attrs =3D hsmp_bin_attrs;
> -
> -=09return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
> -}
> -
>  int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  =09struct hsmp_message msg =3D { 0 };
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index 9ab50bc74676..9b4ab6a3598c 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -57,16 +57,11 @@ struct hsmp_plat_device {
> =20
>  extern struct hsmp_plat_device hsmp_pdev;
> =20
> -ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> -=09=09=09     struct bin_attribute *bin_attr, char *buf,
> -=09=09=09     loff_t off, size_t count);
>  int hsmp_cache_proto_ver(u16 sock_ind);
> -umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -=09=09=09=09  struct bin_attribute *battr, int id);
> -int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -=09=09=09  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
>  long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>  void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
> +int hsmp_get_tbl_dram_base(u16 sock_ind);
> +ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t=
 size);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> index e49b53f8c5e3..a1f42163db57 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -9,6 +9,7 @@
> =20
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
> +#include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
> =20
>  #include <linux/device.h>
> @@ -61,36 +62,93 @@ static const struct file_operations hsmp_fops =3D {
>  =09.compat_ioctl=09=3D hsmp_ioctl,
>  };
> =20
> -static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +static ssize_t hsmp_metric_tbl_plat_read(struct file *filp, struct kobje=
ct *kobj,
> +=09=09=09=09=09 struct bin_attribute *bin_attr, char *buf,
> +=09=09=09=09=09 loff_t off, size_t count)
>  {
> -=09const struct attribute_group **hsmp_attr_grps;
> -=09struct attribute_group *attr_grp;
> -=09u16 i;
> +=09struct hsmp_socket *sock;
> +=09u16 sock_ind;
> =20
> -=09hsmp_attr_grps =3D devm_kcalloc(dev, hsmp_pdev.num_sockets + 1,
> -=09=09=09=09      sizeof(*hsmp_attr_grps),
> -=09=09=09=09      GFP_KERNEL);
> -=09if (!hsmp_attr_grps)
> -=09=09return -ENOMEM;
> +=09sock_ind =3D (uintptr_t)bin_attr->private;
> +=09if (sock_ind >=3D hsmp_pdev.num_sockets)
> +=09=09return -EINVAL;
> =20
> -=09/* Create a sysfs directory for each socket */
> -=09for (i =3D 0; i < hsmp_pdev.num_sockets; i++) {
> -=09=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group),
> -=09=09=09=09=09GFP_KERNEL);
> -=09=09if (!attr_grp)
> -=09=09=09return -ENOMEM;
> +=09sock =3D &hsmp_pdev.sock[sock_ind];
> =20
> -=09=09snprintf(hsmp_pdev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%=
u", (u8)i);
> -=09=09attr_grp->name=09=09=09=3D hsmp_pdev.sock[i].name;
> -=09=09attr_grp->is_bin_visible=09=3D hsmp_is_sock_attr_visible;
> -=09=09hsmp_attr_grps[i]=09=09=3D attr_grp;
> +=09return hsmp_metric_tbl_read(sock, buf, count);
> +}
> =20
> -=09=09hsmp_create_attr_list(attr_grp, dev, i);
> -=09}
> +static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +=09=09=09=09=09 struct bin_attribute *battr, int id)
> +{
> +=09u16 sock_ind;
> +
> +=09sock_ind =3D (uintptr_t)battr->private;
> +
> +=09if (id =3D=3D 0 && sock_ind >=3D hsmp_pdev.num_sockets)
> +=09=09return SYSFS_GROUP_INVISIBLE;
> =20
> -=09return device_add_groups(dev, hsmp_attr_grps);
> +=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6)
> +=09=09return battr->attr.mode;
> +
> +=09return 0;
>  }
> =20
> +/*
> + * AMD supports maximum of 8 sockets in a system.
> + * Static array of 8 + 1(for NULL) elements is created below
> + * to create sysfs groups for sockets.
> + * is_bin_visible function is used to show / hide the necessary groups.
> + */
> +#define HSMP_BIN_ATTR(index, _list)=09=09=09=09=09\
> +static struct bin_attribute attr##index =3D {=09=09=09=09\
> +=09.attr =3D { .name =3D HSMP_METRICS_TABLE_NAME, .mode =3D 0444},=09\
> +=09.private =3D (void *)index,=09=09=09=09=09\
> +=09.read =3D hsmp_metric_tbl_plat_read,=09=09=09=09=09\
> +=09.size =3D sizeof(struct hsmp_metric_table),=09=09=09\
> +};=09=09=09=09=09=09=09=09=09\
> +static struct bin_attribute _list[] =3D {=09=09=09=09=09\
> +=09&attr##index,=09=09=09=09=09=09=09\
> +=09NULL=09=09=09=09=09=09=09=09\
> +}
> +
> +HSMP_BIN_ATTR(0, *sock0_attr_list);
> +HSMP_BIN_ATTR(1, *sock1_attr_list);
> +HSMP_BIN_ATTR(2, *sock2_attr_list);
> +HSMP_BIN_ATTR(3, *sock3_attr_list);
> +HSMP_BIN_ATTR(4, *sock4_attr_list);
> +HSMP_BIN_ATTR(5, *sock5_attr_list);
> +HSMP_BIN_ATTR(6, *sock6_attr_list);
> +HSMP_BIN_ATTR(7, *sock7_attr_list);
> +
> +#define HSMP_BIN_ATTR_GRP(index, _list, _name)=09=09=09\
> +static struct attribute_group sock##index##_attr_grp =3D {=09\
> +=09.bin_attrs =3D _list,=09=09=09=09=09\
> +=09.is_bin_visible =3D hsmp_is_sock_attr_visible,=09=09\
> +=09.name =3D #_name,=09=09=09=09=09=09\
> +}
> +
> +HSMP_BIN_ATTR_GRP(0, sock0_attr_list, socket0);
> +HSMP_BIN_ATTR_GRP(1, sock1_attr_list, socket1);
> +HSMP_BIN_ATTR_GRP(2, sock2_attr_list, socket2);
> +HSMP_BIN_ATTR_GRP(3, sock3_attr_list, socket3);
> +HSMP_BIN_ATTR_GRP(4, sock4_attr_list, socket4);
> +HSMP_BIN_ATTR_GRP(5, sock5_attr_list, socket5);
> +HSMP_BIN_ATTR_GRP(6, sock6_attr_list, socket6);
> +HSMP_BIN_ATTR_GRP(7, sock7_attr_list, socket7);
> +
> +static const struct attribute_group *hsmp_groups[] =3D {
> +=09&sock0_attr_grp,
> +=09&sock1_attr_grp,
> +=09&sock2_attr_grp,
> +=09&sock3_attr_grp,
> +=09&sock4_attr_grp,
> +=09&sock5_attr_grp,
> +=09&sock6_attr_grp,
> +=09&sock7_attr_grp,
> +=09NULL
> +};
> +
>  static inline bool is_f1a_m0h(void)
>  {
>  =09if (boot_cpu_data.x86 =3D=3D 0x1A && boot_cpu_data.x86_model <=3D 0x0=
F)
> @@ -141,6 +199,12 @@ static int init_platform_device(struct device *dev)
>  =09=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
>  =09=09=09return ret;
>  =09=09}
> +
> +=09=09if (hsmp_pdev.proto_ver =3D=3D HSMP_PROTO_VER6) {
> +=09=09=09ret =3D hsmp_get_tbl_dram_base(i);
> +=09=09=09if (ret)
> +=09=09=09=09dev_err(dev, "Failed to init metric table\n");
> +=09=09}
>  =09}
> =20
>  =09return 0;
> @@ -162,10 +226,6 @@ static int hsmp_pltdrv_probe(struct platform_device =
*pdev)
>  =09=09return ret;
>  =09}
> =20
> -=09ret =3D hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -=09if (ret)
> -=09=09dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -
>  =09return hsmp_misc_register(&pdev->dev);
>  }
> =20
> @@ -179,6 +239,7 @@ static struct platform_driver amd_hsmp_driver =3D {
>  =09.remove_new=09=3D hsmp_pltdrv_remove,
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D DRIVER_NAME,
> +=09=09.dev_groups =3D hsmp_groups,
>  =09},
>  };
> =20
>=20
--8323328-1978217064-1725456410=:1078--
