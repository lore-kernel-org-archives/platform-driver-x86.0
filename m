Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6C318A6BC
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724155883; cv=none; b=MXGIbTquXJplLcoBYY1YfBHX25Tl5C8rvsWZgQaAn5au29wD4g4CboWmbtjbqD4FTb8YnJ1Qkf3Fwi+DvOyghRC/nRAB0yCQwNw+xmgScj5ATxPvfUezj+MlMPyVF2Y7HgBwaSlmPsqRkVtxvb2OLF8YJtIQxpb9kavOvpEdwVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724155883; c=relaxed/simple;
	bh=nbUhSf+8Fvl8ArCA7o4baxp8Kep4trJe4F3IDSY/b5c=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=AgF/wzdeNyFj7Z5zR90F30PKOyhgupy3FBMTwIc1ODQCKbSQlDuaFiEusmzOT9MlUFYIS7aR4vym/3BYUtO3kL7dAgNHcipT/X/XwoiMGC+3m/bT1XrejTpG0xW67HWqfO99uDDhZ7kyPj8JGkE7w7hCLHfDGGB3UP+hOPircS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpMN1ex2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpMN1ex2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724155881; x=1755691881;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nbUhSf+8Fvl8ArCA7o4baxp8Kep4trJe4F3IDSY/b5c=;
  b=FpMN1ex2AaGQ3L0ykG/hKVemFhSaiZMiJSTdvyhZDzAZ5qkXzCcUK+vp
   Zy7PicjsF02RwEK3AAup2IL5LQpwNst0FtDHoucItt0oeKqwh6dIVnO6W
   1pIEq3ffn2C8MzNYEAgsmyDYS2bg3cel/L/xKY/dHX+/ICgKxkcxostff
   LnxHpPlMLLh8sPzMW2InkG/PpIJGYbuZPuglLN7uJGhNNaIbu2+wau2re
   U9LvaKdhASELq6CDOnDKkbC5ZXCFylkVqSRDMPhf0gyT50/9sjthuICmu
   YjGFeQ3V6iMS2+WbkimspYs6F7Yk/+3R/k5ljlir9yrArK4Zp0Nn7O/NX
   w==;
X-CSE-ConnectionGUID: d7yXrm7JQiyuRFggWbickQ==
X-CSE-MsgGUID: 88yNomSKTROGpKY//M3wtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="39906588"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="39906588"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:11:20 -0700
X-CSE-ConnectionGUID: IR8W+vhBTfWEbRXMWxy/gg==
X-CSE-MsgGUID: nD45ceZPR4+IYOvdNJTmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="60546792"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:11:19 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 15:11:15 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 05/11] platform/x86/amd/hsmp: Move platform device specific
 code to plat.c
In-Reply-To: <20240820102941.1813163-5-suma.hegde@amd.com>
Message-ID: <ca0b76fe-b7d7-23ed-79f1-b9a4f347c4ed@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-5-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-400031043-1724155875=:1119"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-400031043-1724155875=:1119
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 20 Aug 2024, Suma Hegde wrote:

> Move platform device part to plat.c.

These move patches should also state why we're doing this. Something along=
=20
the lines of:

An upcoming change splits HSMP driver into ACPI and platform device=20
variants. Prepare for the split by moving ...

Think of somebody using git annotate/blame on this code in this driver and=
=20
landing on a line originating from this change.

> No functinality/logical changes.
> Common code which can be used by ACPI and platform device
> remains in hsmp.c.
> ACPI code in hsmp.c will be moved to acpi.c in next patch.
>
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---

Confirmed this should make no change to the logic
(with:
diff -u <(grep '^[-]' 05.patch | cut -b 2-) <(grep '^[+]' 05.patch | cut -b=
 2-)
).

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.


> Changes since v3:
> 1. module init, exit code, probe, remove functions are kept back in hsmp.=
c
>    not added to plat.c in this patch, as per review comment.
>=20
> Changes since v2:
> None
>=20
> Changes since v1:
> 1. Include new header file device.h in plat.c
> 2. Arrange headers in alphabetical order
> 3. Add an empty line between asm/ and linux/ headers
> =20
>  drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 138 ++-----------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |  14 +++
>  drivers/platform/x86/amd/hsmp/plat.c   | 136 ++++++++++++++++++++++++
>  4 files changed, 161 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/plat.c
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x8=
6/amd/hsmp/Makefile
> index fda64906a5e8..fb8ba04b2f0d 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,4 +5,4 @@
>  #
> =20
>  obj-$(CONFIG_AMD_HSMP)=09=09+=3D amd_hsmp.o
> -amd_hsmp-objs=09=09=09:=3D hsmp.o
> +amd_hsmp-objs=09=09=09:=3D hsmp.o plat.o
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 9ed1fc0aeb00..6da7c6189020 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -16,7 +16,6 @@
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/module.h>
> -#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
> @@ -40,45 +39,12 @@
>  #define HSMP_WR=09=09=09true
>  #define HSMP_RD=09=09=09false
> =20
> -/*
> - * To access specific HSMP mailbox register, s/w writes the SMN address =
of HSMP mailbox
> - * register into the SMN_INDEX register, and reads/writes the SMN_DATA r=
eg.
> - * Below are required SMN address for HSMP Mailbox register offsets in S=
MU address space
> - */
> -#define SMN_HSMP_BASE=09=090x3B00000
> -#define SMN_HSMP_MSG_ID=09=090x0010534
> -#define SMN_HSMP_MSG_ID_F1A_M0H=090x0010934
> -#define SMN_HSMP_MSG_RESP=090x0010980
> -#define SMN_HSMP_MSG_DATA=090x00109E0
> -
> -#define HSMP_INDEX_REG=09=090xc4
> -#define HSMP_DATA_REG=09=090xc8
> -
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR=09=09"MsgIdOffset"
>  #define MSG_ARGOFF_STR=09=09"MsgArgOffset"
>  #define MSG_RESPOFF_STR=09=09"MsgRspOffset"
> =20
> -static struct hsmp_plat_device plat_dev;
> -
> -static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> -=09=09=09     u32 *value, bool write)
> -{
> -=09int ret;
> -
> -=09if (!sock->root)
> -=09=09return -ENODEV;
> -
> -=09ret =3D pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> -=09=09=09=09     sock->mbinfo.base_addr + offset);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09ret =3D (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *v=
alue)
> -=09=09     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> -
> -=09return ret;
> -}
> +struct hsmp_plat_device plat_dev;
> =20
>  static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
>  =09=09=09      u32 *value, bool write)
> @@ -248,7 +214,7 @@ int hsmp_send_message(struct hsmp_message *msg)
>  }
>  EXPORT_SYMBOL_GPL(hsmp_send_message);
> =20
> -static int hsmp_test(u16 sock_ind, u32 value)
> +int hsmp_test(u16 sock_ind, u32 value)
>  {
>  =09struct hsmp_message msg =3D { 0 };
>  =09int ret;
> @@ -516,9 +482,9 @@ static int hsmp_parse_acpi_table(struct device *dev, =
u16 sock_ind)
>  =09return hsmp_read_acpi_dsd(sock);
>  }
> =20
> -static ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *k=
obj,
> -=09=09=09=09    struct bin_attribute *bin_attr, char *buf,
> -=09=09=09=09    loff_t off, size_t count)
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +=09=09=09     struct bin_attribute *bin_attr, char *buf,
> +=09=09=09     loff_t off, size_t count)
>  {
>  =09struct hsmp_socket *sock =3D bin_attr->private;
>  =09struct hsmp_message msg =3D { 0 };
> @@ -577,8 +543,8 @@ static int hsmp_get_tbl_dram_base(u16 sock_ind)
>  =09return 0;
>  }
> =20
> -static umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> -=09=09=09=09=09 struct bin_attribute *battr, int id)
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +=09=09=09=09  struct bin_attribute *battr, int id)
>  {
>  =09if (plat_dev.proto_ver =3D=3D HSMP_PROTO_VER6)
>  =09=09return battr->attr.mode;
> @@ -607,8 +573,8 @@ static int hsmp_init_metric_tbl_bin_attr(struct bin_a=
ttribute **hattrs, u16 sock
>  /* One bin sysfs for metrics table */
>  #define NUM_HSMP_ATTRS=09=091
> =20
> -static int hsmp_create_attr_list(struct attribute_group *attr_grp,
> -=09=09=09=09 struct device *dev, u16 sock_ind)
> +int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +=09=09=09  struct device *dev, u16 sock_ind)
>  {
>  =09struct bin_attribute **hsmp_bin_attrs;
> =20
> @@ -624,36 +590,6 @@ static int hsmp_create_attr_list(struct attribute_gr=
oup *attr_grp,
>  =09return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>  }
> =20
> -static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> -{
> -=09const struct attribute_group **hsmp_attr_grps;
> -=09struct attribute_group *attr_grp;
> -=09u16 i;
> -
> -=09hsmp_attr_grps =3D devm_kcalloc(dev, plat_dev.num_sockets + 1,
> -=09=09=09=09      sizeof(*hsmp_attr_grps),
> -=09=09=09=09      GFP_KERNEL);
> -=09if (!hsmp_attr_grps)
> -=09=09return -ENOMEM;
> -
> -=09/* Create a sysfs directory for each socket */
> -=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> -=09=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group),
> -=09=09=09=09=09GFP_KERNEL);
> -=09=09if (!attr_grp)
> -=09=09=09return -ENOMEM;
> -
> -=09=09snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u=
", (u8)i);
> -=09=09attr_grp->name=09=09=09=3D plat_dev.sock[i].name;
> -=09=09attr_grp->is_bin_visible=09=3D hsmp_is_sock_attr_visible;
> -=09=09hsmp_attr_grps[i]=09=09=3D attr_grp;
> -
> -=09=09hsmp_create_attr_list(attr_grp, dev, i);
> -=09}
> -
> -=09return device_add_groups(dev, hsmp_attr_grps);
> -}
> -
>  static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  =09struct attribute_group *attr_grp;
> @@ -677,7 +613,7 @@ static int hsmp_create_acpi_sysfs_if(struct device *d=
ev)
>  =09return devm_device_add_group(dev, attr_grp);
>  }
> =20
> -static int hsmp_cache_proto_ver(u16 sock_ind)
> +int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  =09struct hsmp_message msg =3D { 0 };
>  =09int ret;
> @@ -693,60 +629,6 @@ static int hsmp_cache_proto_ver(u16 sock_ind)
>  =09return ret;
>  }
> =20
> -static inline bool is_f1a_m0h(void)
> -{
> -=09if (boot_cpu_data.x86 =3D=3D 0x1A && boot_cpu_data.x86_model <=3D 0x0=
F)
> -=09=09return true;
> -
> -=09return false;
> -}
> -
> -static int init_platform_device(struct device *dev)
> -{
> -=09struct hsmp_socket *sock;
> -=09int ret, i;
> -
> -=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> -=09=09if (!node_to_amd_nb(i))
> -=09=09=09return -ENODEV;
> -=09=09sock =3D &plat_dev.sock[i];
> -=09=09sock->root=09=09=09=3D node_to_amd_nb(i)->root;
> -=09=09sock->sock_ind=09=09=09=3D i;
> -=09=09sock->dev=09=09=09=3D dev;
> -=09=09sock->mbinfo.base_addr=09=09=3D SMN_HSMP_BASE;
> -=09=09sock->amd_hsmp_rdwr=09=09=3D amd_hsmp_pci_rdwr;
> -
> -=09=09/*
> -=09=09 * This is a transitional change from non-ACPI to ACPI, only
> -=09=09 * family 0x1A, model 0x00 platform is supported for both ACPI and=
 non-ACPI.
> -=09=09 */
> -=09=09if (is_f1a_m0h())
> -=09=09=09sock->mbinfo.msg_id_off=09=3D SMN_HSMP_MSG_ID_F1A_M0H;
> -=09=09else
> -=09=09=09sock->mbinfo.msg_id_off=09=3D SMN_HSMP_MSG_ID;
> -
> -=09=09sock->mbinfo.msg_resp_off=09=3D SMN_HSMP_MSG_RESP;
> -=09=09sock->mbinfo.msg_arg_off=09=3D SMN_HSMP_MSG_DATA;
> -=09=09sema_init(&sock->hsmp_sem, 1);
> -
> -=09=09/* Test the hsmp interface on each socket */
> -=09=09ret =3D hsmp_test(i, 0xDEADBEEF);
> -=09=09if (ret) {
> -=09=09=09dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> -=09=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> -=09=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> -=09=09=09return ret;
> -=09=09}
> -=09=09ret =3D hsmp_cache_proto_ver(i);
> -=09=09if (ret) {
> -=09=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> -=09=09=09return ret;
> -=09=09}
> -=09}
> -
> -=09return 0;
> -}
> -
>  static const struct acpi_device_id amd_hsmp_acpi_ids[] =3D {
>  =09{ACPI_HSMP_DEVICE_HID, 0},
>  =09{}
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index d54b9681d514..d59a9efb4799 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -55,4 +55,18 @@ struct hsmp_plat_device {
>  =09bool is_acpi_device;
>  =09bool is_probed;
>  };
> +
> +extern struct hsmp_plat_device plat_dev;
> +
> +ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
> +=09=09=09     struct bin_attribute *bin_attr, char *buf,
> +=09=09=09     loff_t off, size_t count);
> +int hsmp_create_non_acpi_sysfs_if(struct device *dev);
> +int hsmp_cache_proto_ver(u16 sock_ind);
> +umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
> +=09=09=09=09  struct bin_attribute *battr, int id);
> +int hsmp_create_attr_list(struct attribute_group *attr_grp,
> +=09=09=09  struct device *dev, u16 sock_ind);
> +int hsmp_test(u16 sock_ind, u32 value);
> +int init_platform_device(struct device *dev);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/=
amd/hsmp/plat.c
> new file mode 100644
> index 000000000000..85a104859acd
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -0,0 +1,136 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides platform device implementations.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <asm/amd_nb.h>
> +
> +#include <linux/device.h>
> +#include <linux/pci.h>
> +#include <linux/sysfs.h>
> +
> +#include "hsmp.h"
> +
> +/*
> + * To access specific HSMP mailbox register, s/w writes the SMN address =
of HSMP mailbox
> + * register into the SMN_INDEX register, and reads/writes the SMN_DATA r=
eg.
> + * Below are required SMN address for HSMP Mailbox register offsets in S=
MU address space
> + */
> +#define SMN_HSMP_BASE=09=090x3B00000
> +#define SMN_HSMP_MSG_ID=09=090x0010534
> +#define SMN_HSMP_MSG_ID_F1A_M0H=090x0010934
> +#define SMN_HSMP_MSG_RESP=090x0010980
> +#define SMN_HSMP_MSG_DATA=090x00109E0
> +
> +#define HSMP_INDEX_REG=09=090xc4
> +#define HSMP_DATA_REG=09=090xc8
> +
> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +=09=09=09     u32 *value, bool write)
> +{
> +=09int ret;
> +
> +=09if (!sock->root)
> +=09=09return -ENODEV;
> +
> +=09ret =3D pci_write_config_dword(sock->root, HSMP_INDEX_REG,
> +=09=09=09=09     sock->mbinfo.base_addr + offset);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D (write ? pci_write_config_dword(sock->root, HSMP_DATA_REG, *v=
alue)
> +=09=09     : pci_read_config_dword(sock->root, HSMP_DATA_REG, value));
> +
> +=09return ret;
> +}
> +
> +int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +{
> +=09const struct attribute_group **hsmp_attr_grps;
> +=09struct attribute_group *attr_grp;
> +=09u16 i;
> +
> +=09hsmp_attr_grps =3D devm_kcalloc(dev, plat_dev.num_sockets + 1,
> +=09=09=09=09      sizeof(*hsmp_attr_grps),
> +=09=09=09=09      GFP_KERNEL);
> +=09if (!hsmp_attr_grps)
> +=09=09return -ENOMEM;
> +
> +=09/* Create a sysfs directory for each socket */
> +=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> +=09=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group),
> +=09=09=09=09=09GFP_KERNEL);
> +=09=09if (!attr_grp)
> +=09=09=09return -ENOMEM;
> +
> +=09=09snprintf(plat_dev.sock[i].name, HSMP_ATTR_GRP_NAME_SIZE, "socket%u=
", (u8)i);
> +=09=09attr_grp->name=09=09=09=3D plat_dev.sock[i].name;
> +=09=09attr_grp->is_bin_visible=09=3D hsmp_is_sock_attr_visible;
> +=09=09hsmp_attr_grps[i]=09=09=3D attr_grp;
> +
> +=09=09hsmp_create_attr_list(attr_grp, dev, i);
> +=09}
> +
> +=09return device_add_groups(dev, hsmp_attr_grps);
> +}
> +
> +static inline bool is_f1a_m0h(void)
> +{
> +=09if (boot_cpu_data.x86 =3D=3D 0x1A && boot_cpu_data.x86_model <=3D 0x0=
F)
> +=09=09return true;
> +
> +=09return false;
> +}
> +
> +int init_platform_device(struct device *dev)
> +{
> +=09struct hsmp_socket *sock;
> +=09int ret, i;
> +
> +=09for (i =3D 0; i < plat_dev.num_sockets; i++) {
> +=09=09if (!node_to_amd_nb(i))
> +=09=09=09return -ENODEV;
> +=09=09sock =3D &plat_dev.sock[i];
> +=09=09sock->root=09=09=09=3D node_to_amd_nb(i)->root;
> +=09=09sock->sock_ind=09=09=09=3D i;
> +=09=09sock->dev=09=09=09=3D dev;
> +=09=09sock->mbinfo.base_addr=09=09=3D SMN_HSMP_BASE;
> +=09=09sock->amd_hsmp_rdwr=09=09=3D amd_hsmp_pci_rdwr;
> +
> +=09=09/*
> +=09=09 * This is a transitional change from non-ACPI to ACPI, only
> +=09=09 * family 0x1A, model 0x00 platform is supported for both ACPI and=
 non-ACPI.
> +=09=09 */
> +=09=09if (is_f1a_m0h())
> +=09=09=09sock->mbinfo.msg_id_off=09=3D SMN_HSMP_MSG_ID_F1A_M0H;
> +=09=09else
> +=09=09=09sock->mbinfo.msg_id_off=09=3D SMN_HSMP_MSG_ID;
> +
> +=09=09sock->mbinfo.msg_resp_off=09=3D SMN_HSMP_MSG_RESP;
> +=09=09sock->mbinfo.msg_arg_off=09=3D SMN_HSMP_MSG_DATA;
> +=09=09sema_init(&sock->hsmp_sem, 1);
> +
> +=09=09/* Test the hsmp interface on each socket */
> +=09=09ret =3D hsmp_test(i, 0xDEADBEEF);
> +=09=09if (ret) {
> +=09=09=09dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +=09=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> +=09=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> +=09=09=09return ret;
> +=09=09}
> +
> +=09=09ret =3D hsmp_cache_proto_ver(i);
> +=09=09if (ret) {
> +=09=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> +=09=09=09return ret;
> +=09=09}
> +=09}
> +
> +=09return 0;
> +}
>=20
--8323328-400031043-1724155875=:1119--
