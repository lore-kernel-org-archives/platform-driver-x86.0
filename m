Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA80C18FDAA
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Aug 2024 12:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724156000; cv=none; b=r825OcISQ9hIcP24K9i+TbNHXhZLUkaLwyVTaWHAKTPqF7P2JJGQ4aHa/vpWN93cpdsamqGVQVGuH4ncTAdpFd6x5gL8ykR90VrrqPVqmXOmxR/hvQOGxsILrRCsNPJPNiR3aBVC4ogh9hsAJVrAP8ZAs2pDa0vN4aUzb6H/iBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724156000; c=relaxed/simple;
	bh=eH9kSJKQGA8iyAFrZRIO9PBrgU3RInDPlO+n+Pdicq0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SZvLim0FgeTsQ7tGWGcmfXa6jNy3c4/CZD6Get+YutbPCkKQ217AGDtvr67y55RJ2E682MIzWZrFLgOUE2OfbHS51eG9Mg5BljpqZ3VnZKvAsNaKCKEsyf1aaVUyAOYVE4D9sxcMgNX0Aa2QUQb6+YpQI2ArVzHM7YIL9j9rMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZl1BFMp; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZl1BFMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724155998; x=1755691998;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=eH9kSJKQGA8iyAFrZRIO9PBrgU3RInDPlO+n+Pdicq0=;
  b=mZl1BFMpkXoWYwAWDg7f9sW+C1IvPxJclcPvVfNQHM0dMPjLE30FlA4I
   7qrOUa3eLCUZR9QkYiUTHUCtGJoadXzBozEO2uynF6BmJProiwIV0VvE7
   aLMWFNioiD1jZur21T+eZKAlwbQyZGNi1ASGGR6n2+x6McvUQ66Erw55K
   bZ3H/p+IAO7xgnuUR3R/ThD3DEm20X8aP9NQhReLeKr0uPe3QywQ6JrWt
   ClSVqjB9MT1lZ1HPkKHtCLN5mj7WaRM4+1gr6hI8h1cWI2ZMXPBJTnANf
   DCB5uAOSyCoBBMTh+h4h19JA3UD+RfeO5hqKS6IYhON+uMHURzNuI7b3n
   Q==;
X-CSE-ConnectionGUID: kz2LelFQRVm9qHPJMyFj+Q==
X-CSE-MsgGUID: YnEFqLfbQHG5u9wJtml+xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26248585"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="26248585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:13:17 -0700
X-CSE-ConnectionGUID: uPCaagwESLa6+L7RM2qtZA==
X-CSE-MsgGUID: lOAZshFoQ2SbJbazfi7AZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; 
   d="scan'208";a="65673927"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 05:13:15 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Aug 2024 15:13:11 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v4 06/11] platform/x86/amd/hsmp: Move ACPI code to acpi.c
In-Reply-To: <20240820102941.1813163-6-suma.hegde@amd.com>
Message-ID: <e34bd9ee-83bb-d791-6d1b-0bc807cbc3bd@linux.intel.com>
References: <20240820102941.1813163-1-suma.hegde@amd.com> <20240820102941.1813163-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-978993010-1724155950=:1119"
Content-ID: <cf78081a-52f6-9e0d-cd2f-7ae83a42ef05@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-978993010-1724155950=:1119
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <05ad9c39-1fb6-b669-41f4-7cf5994b1a69@linux.intel.com>

On Tue, 20 Aug 2024, Suma Hegde wrote:

> Move ACPI related code to acpi.c from hsmp.c.
> We still have one driver, the driver probe will be split in the next patc=
h.

As with 5/11, please state the overall goal here too.

> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

> Changes since v3:
> 1. File header content is modified.
>=20
> Changes since v2:
> None
>=20
> Changes since v1:
> 1. Add following headers in acpi.c
> =09#include <linux/device.h>
> =09#include <linux/dev_printk.h>
> =09#include <linux/ioport.h>
> =09#include <linux/kstrtox.h>
> =09#include <linux/uuid.h>
> =09#include <uapi/asm-generic/errno-base.h>
>=20
>  drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 272 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 250 -----------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   2 +
>  4 files changed, 275 insertions(+), 251 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x8=
6/amd/hsmp/Makefile
> index fb8ba04b2f0d..0cc92865c0a2 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,4 +5,4 @@
>  #
> =20
>  obj-$(CONFIG_AMD_HSMP)=09=09+=3D amd_hsmp.o
> -amd_hsmp-objs=09=09=09:=3D hsmp.o plat.o
> +amd_hsmp-objs=09=09=09:=3D hsmp.o plat.o acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/=
amd/hsmp/acpi.c
> new file mode 100644
> index 000000000000..61c072216fb7
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -0,0 +1,272 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides an ACPI based driver implementation for HSMP inter=
face.
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/ioport.h>
> +#include <linux/kstrtox.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +
> +#include <uapi/asm-generic/errno-base.h>
> +
> +#include "hsmp.h"
> +
> +/* These are the strings specified in ACPI table */
> +#define MSG_IDOFF_STR=09=09"MsgIdOffset"
> +#define MSG_ARGOFF_STR=09=09"MsgArgOffset"
> +#define MSG_RESPOFF_STR=09=09"MsgRspOffset"
> +
> +static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +=09=09=09      u32 *value, bool write)
> +{
> +=09if (write)
> +=09=09iowrite32(*value, sock->virt_base_addr + offset);
> +=09else
> +=09=09*value =3D ioread32(sock->virt_base_addr + offset);
> +
> +=09return 0;
> +}
> +
> +/* This is the UUID used for HSMP */
> +static const guid_t acpi_hsmp_uuid =3D GUID_INIT(0xb74d619d, 0x5707, 0x4=
8bd,
> +=09=09=09=09=09=090xa6, 0x9f, 0x4e, 0xa2,
> +=09=09=09=09=09=090x87, 0x1f, 0xc2, 0xf6);
> +
> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> +{
> +=09if (obj->type =3D=3D ACPI_TYPE_BUFFER && obj->buffer.length =3D=3D UU=
ID_SIZE)
> +=09=09return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> +
> +=09return false;
> +}
> +
> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> +{
> +=09char *uid;
> +
> +=09/*
> +=09 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> +=09 * read it and strip the "ID" part of it and convert the remaining
> +=09 * bytes to integer.
> +=09 */
> +=09uid =3D acpi_device_uid(ACPI_COMPANION(dev));
> +
> +=09return kstrtou16(uid + 2, 10, sock_ind);
> +}
> +
> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> +{
> +=09struct hsmp_socket *sock =3D data;
> +=09struct resource r;
> +
> +=09switch (res->type) {
> +=09case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +=09=09if (!acpi_dev_resource_memory(res, &r))
> +=09=09=09return AE_ERROR;
> +=09=09if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRIT=
EABLE))
> +=09=09=09return AE_ERROR;
> +=09=09sock->mbinfo.base_addr =3D r.start;
> +=09=09sock->mbinfo.size =3D resource_size(&r);
> +=09=09break;
> +=09case ACPI_RESOURCE_TYPE_END_TAG:
> +=09=09break;
> +=09default:
> +=09=09return AE_ERROR;
> +=09}
> +
> +=09return AE_OK;
> +}
> +
> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> +{
> +=09struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +=09union acpi_object *guid, *mailbox_package;
> +=09union acpi_object *dsd;
> +=09acpi_status status;
> +=09int ret =3D 0;
> +=09int j;
> +
> +=09status =3D acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD",=
 NULL,
> +=09=09=09=09=09    &buf, ACPI_TYPE_PACKAGE);
> +=09if (ACPI_FAILURE(status)) {
> +=09=09dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD ta=
ble, err: %s\n",
> +=09=09=09acpi_format_exception(status));
> +=09=09return -ENODEV;
> +=09}
> +
> +=09dsd =3D buf.pointer;
> +
> +=09/* HSMP _DSD property should contain 2 objects.
> +=09 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> +=09 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> +=09 *    This mailbox object contains 3 more acpi objects of type
> +=09 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> +=09 *    these packages inturn contain 2 acpi objects of type
> +=09 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> +=09 */
> +=09if (!dsd || dsd->type !=3D ACPI_TYPE_PACKAGE || dsd->package.count !=
=3D 2) {
> +=09=09ret =3D -EINVAL;
> +=09=09goto free_buf;
> +=09}
> +
> +=09guid =3D &dsd->package.elements[0];
> +=09mailbox_package =3D &dsd->package.elements[1];
> +=09if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type !=3D ACPI_TYPE_=
PACKAGE) {
> +=09=09dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> +=09=09ret =3D -EINVAL;
> +=09=09goto free_buf;
> +=09}
> +
> +=09for (j =3D 0; j < mailbox_package->package.count; j++) {
> +=09=09union acpi_object *msgobj, *msgstr, *msgint;
> +
> +=09=09msgobj=09=3D &mailbox_package->package.elements[j];
> +=09=09msgstr=09=3D &msgobj->package.elements[0];
> +=09=09msgint=09=3D &msgobj->package.elements[1];
> +
> +=09=09/* package should have 1 string and 1 integer object */
> +=09=09if (msgobj->type !=3D ACPI_TYPE_PACKAGE ||
> +=09=09    msgstr->type !=3D ACPI_TYPE_STRING ||
> +=09=09    msgint->type !=3D ACPI_TYPE_INTEGER) {
> +=09=09=09ret =3D -EINVAL;
> +=09=09=09goto free_buf;
> +=09=09}
> +
> +=09=09if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> +=09=09=09     msgstr->string.length)) {
> +=09=09=09sock->mbinfo.msg_id_off =3D msgint->integer.value;
> +=09=09} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> +=09=09=09=09    msgstr->string.length)) {
> +=09=09=09sock->mbinfo.msg_resp_off =3D  msgint->integer.value;
> +=09=09} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> +=09=09=09=09    msgstr->string.length)) {
> +=09=09=09sock->mbinfo.msg_arg_off =3D msgint->integer.value;
> +=09=09} else {
> +=09=09=09ret =3D -ENOENT;
> +=09=09=09goto free_buf;
> +=09=09}
> +=09}
> +
> +=09if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> +=09    !sock->mbinfo.msg_arg_off)
> +=09=09ret =3D -EINVAL;
> +
> +free_buf:
> +=09ACPI_FREE(buf.pointer);
> +=09return ret;
> +}
> +
> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> +{
> +=09acpi_status status;
> +
> +=09status =3D acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__C=
RS,
> +=09=09=09=09     hsmp_resource, sock);
> +=09if (ACPI_FAILURE(status)) {
> +=09=09dev_err(sock->dev, "Failed to look up MP1 base address from CRS me=
thod, err: %s\n",
> +=09=09=09acpi_format_exception(status));
> +=09=09return -EINVAL;
> +=09}
> +=09if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> +=09=09return -EINVAL;
> +
> +=09/* The mapped region should be un-cached */
> +=09sock->virt_base_addr =3D devm_ioremap_uc(sock->dev, sock->mbinfo.base=
_addr,
> +=09=09=09=09=09       sock->mbinfo.size);
> +=09if (!sock->virt_base_addr) {
> +=09=09dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> +=09=09return -ENOMEM;
> +=09}
> +
> +=09return 0;
> +}
> +
> +/* Parse the ACPI table to read the data */
> +static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
> +{
> +=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> +=09int ret;
> +
> +=09sock->sock_ind=09=09=3D sock_ind;
> +=09sock->dev=09=09=3D dev;
> +=09sock->amd_hsmp_rdwr=09=3D amd_hsmp_acpi_rdwr;
> +=09plat_dev.is_acpi_device=09=3D true;
> +
> +=09sema_init(&sock->hsmp_sem, 1);
> +
> +=09/* Read MP1 base address from CRS method */
> +=09ret =3D hsmp_read_acpi_crs(sock);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09/* Read mailbox offsets from DSD table */
> +=09return hsmp_read_acpi_dsd(sock);
> +}
> +
> +int hsmp_create_acpi_sysfs_if(struct device *dev)
> +{
> +=09struct attribute_group *attr_grp;
> +=09u16 sock_ind;
> +=09int ret;
> +
> +=09attr_grp =3D devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KE=
RNEL);
> +=09if (!attr_grp)
> +=09=09return -ENOMEM;
> +
> +=09attr_grp->is_bin_visible =3D hsmp_is_sock_attr_visible;
> +
> +=09ret =3D hsmp_get_uid(dev, &sock_ind);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ret =3D hsmp_create_attr_list(attr_grp, dev, sock_ind);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return devm_device_add_group(dev, attr_grp);
> +}
> +
> +int init_acpi(struct device *dev)
> +{
> +=09u16 sock_ind;
> +=09int ret;
> +
> +=09ret =3D hsmp_get_uid(dev, &sock_ind);
> +=09if (ret)
> +=09=09return ret;
> +=09if (sock_ind >=3D plat_dev.num_sockets)
> +=09=09return -EINVAL;
> +
> +=09ret =3D hsmp_parse_acpi_table(dev, sock_ind);
> +=09if (ret) {
> +=09=09dev_err(dev, "Failed to parse ACPI table\n");
> +=09=09return ret;
> +=09}
> +
> +=09/* Test the hsmp interface */
> +=09ret =3D hsmp_test(sock_ind, 0xDEADBEEF);
> +=09if (ret) {
> +=09=09dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> +=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hsmp_cache_proto_ver(sock_ind);
> +=09if (ret) {
> +=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> +=09=09return ret;
> +=09}
> +
> +=09return ret;
> +}
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 6da7c6189020..573867c17fd5 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -39,24 +39,8 @@
>  #define HSMP_WR=09=09=09true
>  #define HSMP_RD=09=09=09false
> =20
> -/* These are the strings specified in ACPI table */
> -#define MSG_IDOFF_STR=09=09"MsgIdOffset"
> -#define MSG_ARGOFF_STR=09=09"MsgArgOffset"
> -#define MSG_RESPOFF_STR=09=09"MsgRspOffset"
> -
>  struct hsmp_plat_device plat_dev;
> =20
> -static int amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -=09=09=09      u32 *value, bool write)
> -{
> -=09if (write)
> -=09=09iowrite32(*value, sock->virt_base_addr + offset);
> -=09else
> -=09=09*value =3D ioread32(sock->virt_base_addr + offset);
> -
> -=09return 0;
> -}
> -
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
>   * or by writing to MMIO space.
> @@ -306,182 +290,6 @@ static const struct file_operations hsmp_fops =3D {
>  =09.compat_ioctl=09=3D hsmp_ioctl,
>  };
> =20
> -/* This is the UUID used for HSMP */
> -static const guid_t acpi_hsmp_uuid =3D GUID_INIT(0xb74d619d, 0x5707, 0x4=
8bd,
> -=09=09=09=09=09=090xa6, 0x9f, 0x4e, 0xa2,
> -=09=09=09=09=09=090x87, 0x1f, 0xc2, 0xf6);
> -
> -static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> -{
> -=09if (obj->type =3D=3D ACPI_TYPE_BUFFER && obj->buffer.length =3D=3D UU=
ID_SIZE)
> -=09=09return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> -
> -=09return false;
> -}
> -
> -static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> -{
> -=09char *uid;
> -
> -=09/*
> -=09 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> -=09 * read it and strip the "ID" part of it and convert the remaining
> -=09 * bytes to integer.
> -=09 */
> -=09uid =3D acpi_device_uid(ACPI_COMPANION(dev));
> -
> -=09return kstrtou16(uid + 2, 10, sock_ind);
> -}
> -
> -static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> -{
> -=09struct hsmp_socket *sock =3D data;
> -=09struct resource r;
> -
> -=09switch (res->type) {
> -=09case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> -=09=09if (!acpi_dev_resource_memory(res, &r))
> -=09=09=09return AE_ERROR;
> -=09=09if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRIT=
EABLE))
> -=09=09=09return AE_ERROR;
> -=09=09sock->mbinfo.base_addr =3D r.start;
> -=09=09sock->mbinfo.size =3D resource_size(&r);
> -=09=09break;
> -=09case ACPI_RESOURCE_TYPE_END_TAG:
> -=09=09break;
> -=09default:
> -=09=09return AE_ERROR;
> -=09}
> -
> -=09return AE_OK;
> -}
> -
> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> -{
> -=09struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> -=09union acpi_object *guid, *mailbox_package;
> -=09union acpi_object *dsd;
> -=09acpi_status status;
> -=09int ret =3D 0;
> -=09int j;
> -
> -=09status =3D acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD",=
 NULL,
> -=09=09=09=09=09    &buf, ACPI_TYPE_PACKAGE);
> -=09if (ACPI_FAILURE(status)) {
> -=09=09dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD ta=
ble, err: %s\n",
> -=09=09=09acpi_format_exception(status));
> -=09=09return -ENODEV;
> -=09}
> -
> -=09dsd =3D buf.pointer;
> -
> -=09/* HSMP _DSD property should contain 2 objects.
> -=09 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> -=09 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> -=09 *    This mailbox object contains 3 more acpi objects of type
> -=09 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> -=09 *    these packages inturn contain 2 acpi objects of type
> -=09 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> -=09 */
> -=09if (!dsd || dsd->type !=3D ACPI_TYPE_PACKAGE || dsd->package.count !=
=3D 2) {
> -=09=09ret =3D -EINVAL;
> -=09=09goto free_buf;
> -=09}
> -
> -=09guid =3D &dsd->package.elements[0];
> -=09mailbox_package =3D &dsd->package.elements[1];
> -=09if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type !=3D ACPI_TYPE_=
PACKAGE) {
> -=09=09dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> -=09=09ret =3D -EINVAL;
> -=09=09goto free_buf;
> -=09}
> -
> -=09for (j =3D 0; j < mailbox_package->package.count; j++) {
> -=09=09union acpi_object *msgobj, *msgstr, *msgint;
> -
> -=09=09msgobj=09=3D &mailbox_package->package.elements[j];
> -=09=09msgstr=09=3D &msgobj->package.elements[0];
> -=09=09msgint=09=3D &msgobj->package.elements[1];
> -
> -=09=09/* package should have 1 string and 1 integer object */
> -=09=09if (msgobj->type !=3D ACPI_TYPE_PACKAGE ||
> -=09=09    msgstr->type !=3D ACPI_TYPE_STRING ||
> -=09=09    msgint->type !=3D ACPI_TYPE_INTEGER) {
> -=09=09=09ret =3D -EINVAL;
> -=09=09=09goto free_buf;
> -=09=09}
> -
> -=09=09if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> -=09=09=09     msgstr->string.length)) {
> -=09=09=09sock->mbinfo.msg_id_off =3D msgint->integer.value;
> -=09=09} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> -=09=09=09=09    msgstr->string.length)) {
> -=09=09=09sock->mbinfo.msg_resp_off =3D  msgint->integer.value;
> -=09=09} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> -=09=09=09=09    msgstr->string.length)) {
> -=09=09=09sock->mbinfo.msg_arg_off =3D msgint->integer.value;
> -=09=09} else {
> -=09=09=09ret =3D -ENOENT;
> -=09=09=09goto free_buf;
> -=09=09}
> -=09}
> -
> -=09if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> -=09    !sock->mbinfo.msg_arg_off)
> -=09=09ret =3D -EINVAL;
> -
> -free_buf:
> -=09ACPI_FREE(buf.pointer);
> -=09return ret;
> -}
> -
> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> -{
> -=09acpi_status status;
> -
> -=09status =3D acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__C=
RS,
> -=09=09=09=09     hsmp_resource, sock);
> -=09if (ACPI_FAILURE(status)) {
> -=09=09dev_err(sock->dev, "Failed to look up MP1 base address from CRS me=
thod, err: %s\n",
> -=09=09=09acpi_format_exception(status));
> -=09=09return -EINVAL;
> -=09}
> -=09if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> -=09=09return -EINVAL;
> -
> -=09/* The mapped region should be un cached */
> -=09sock->virt_base_addr =3D devm_ioremap_uc(sock->dev, sock->mbinfo.base=
_addr,
> -=09=09=09=09=09       sock->mbinfo.size);
> -=09if (!sock->virt_base_addr) {
> -=09=09dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> -=09=09return -ENOMEM;
> -=09}
> -
> -=09return 0;
> -}
> -
> -/* Parse the ACPI table to read the data */
> -static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
> -{
> -=09struct hsmp_socket *sock =3D &plat_dev.sock[sock_ind];
> -=09int ret;
> -
> -=09sock->sock_ind=09=09=3D sock_ind;
> -=09sock->dev=09=09=3D dev;
> -=09sock->amd_hsmp_rdwr=09=3D amd_hsmp_acpi_rdwr;
> -=09plat_dev.is_acpi_device=09=3D true;
> -
> -=09sema_init(&sock->hsmp_sem, 1);
> -
> -=09/* Read MP1 base address from CRS method */
> -=09ret =3D hsmp_read_acpi_crs(sock);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09/* Read mailbox offsets from DSD table */
> -=09return hsmp_read_acpi_dsd(sock);
> -}
> -
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  =09=09=09     struct bin_attribute *bin_attr, char *buf,
>  =09=09=09     loff_t off, size_t count)
> @@ -590,29 +398,6 @@ int hsmp_create_attr_list(struct attribute_group *at=
tr_grp,
>  =09return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>  }
> =20
> -static int hsmp_create_acpi_sysfs_if(struct device *dev)
> -{
> -=09struct attribute_group *attr_grp;
> -=09u16 sock_ind;
> -=09int ret;
> -
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
> -
> -=09ret =3D hsmp_create_attr_list(attr_grp, dev, sock_ind);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09return devm_device_add_group(dev, attr_grp);
> -}
> -
>  int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  =09struct hsmp_message msg =3D { 0 };
> @@ -645,41 +430,6 @@ static bool check_acpi_support(struct device *dev)
>  =09return false;
>  }
> =20
> -static int init_acpi(struct device *dev)
> -{
> -=09u16 sock_ind;
> -=09int ret;
> -
> -=09ret =3D hsmp_get_uid(dev, &sock_ind);
> -=09if (ret)
> -=09=09return ret;
> -=09if (sock_ind >=3D plat_dev.num_sockets)
> -=09=09return -EINVAL;
> -
> -=09ret =3D hsmp_parse_acpi_table(dev, sock_ind);
> -=09if (ret) {
> -=09=09dev_err(dev, "Failed to parse ACPI table\n");
> -=09=09return ret;
> -=09}
> -
> -=09/* Test the hsmp interface */
> -=09ret =3D hsmp_test(sock_ind, 0xDEADBEEF);
> -=09if (ret) {
> -=09=09dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> -=09=09=09boot_cpu_data.x86, boot_cpu_data.x86_model);
> -=09=09dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> -=09=09return ret;
> -=09}
> -
> -=09ret =3D hsmp_cache_proto_ver(sock_ind);
> -=09if (ret) {
> -=09=09dev_err(dev, "Failed to read HSMP protocol version\n");
> -=09=09return ret;
> -=09}
> -
> -=09return ret;
> -}
> -
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
>  =09int ret;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> index d59a9efb4799..f465600cb843 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -62,6 +62,7 @@ ssize_t hsmp_metric_tbl_read(struct file *filp, struct =
kobject *kobj,
>  =09=09=09     struct bin_attribute *bin_attr, char *buf,
>  =09=09=09     loff_t off, size_t count);
>  int hsmp_create_non_acpi_sysfs_if(struct device *dev);
> +int hsmp_create_acpi_sysfs_if(struct device *dev);
>  int hsmp_cache_proto_ver(u16 sock_ind);
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  =09=09=09=09  struct bin_attribute *battr, int id);
> @@ -69,4 +70,5 @@ int hsmp_create_attr_list(struct attribute_group *attr_=
grp,
>  =09=09=09  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
>  int init_platform_device(struct device *dev);
> +int init_acpi(struct device *dev);
>  #endif /* HSMP_H */
>=20

--=20
 i.
--8323328-978993010-1724155950=:1119--
