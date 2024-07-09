Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D6155727
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jul 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720520484; cv=none; b=Ktrkr3fQCOiuQg//ymDlUuCuVRvbmiUBfvAj8G5E4nfhrts32b6M6EMSTHw4xisXIU7E+uFmEc6WExc/TSRVoCKsHccv1+hXRqMtTRASp9qQ1Wr2c6YningF7bkNY4eFCKxMRoepK07Z3BuM53xj5aKT6qyAYMVzFPtD4LZV/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720520484; c=relaxed/simple;
	bh=LVK35ZhBwXGN8/uUnrkifC2FsYhn1D4GvtR0WaQG+iI=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XizY1lAcfKqvIUEajaHyg/41/yQStoMTxRwymF1CQPOX/g780eBOZJzNX4S+Iz0hpZnfioVMPWuKceYKMs9bRlRBZ6+9Wa5enPHbq3ZWyeuJYOHiXkpteY+JjBwHFiYV+iVJ7xriyXHRc9bqbm/N/ipNN0OTRjEtkx8I0FlI/58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IE1mfLY4; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IE1mfLY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720520484; x=1752056484;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=LVK35ZhBwXGN8/uUnrkifC2FsYhn1D4GvtR0WaQG+iI=;
  b=IE1mfLY4RA1obiJxn3Bb+TlOu2m0/x/5Ib64Ep5xVWpqC8NGVAdQWTBe
   whRKmdl6/uFhlEvazgCGjZmh7FDdj0UJnO58+Dt8VDxx79q0di/ZaH6zH
   sz1veneARkLVqPDhOC19fcTUoXNUxe1Yig9pEllCaoFuPsy6YgXtKQION
   9Nwm/HX/gNFmrtS/24KIedfHo+cRv6CXhr1uTSA6BKhyzibaLKk3BNYES
   RlYf80tIRvsDWqhB9KLMhxSlAapdAiHS3cjnG4SSpo4Gc2xsNGKzDpSgR
   yQptM75JwwVFbG1a4Gpa2nb9oIJ6lz4RX/fNBX0zLobySiBVJ4k43mxvf
   A==;
X-CSE-ConnectionGUID: gK4RUkeKSTGtIOmsEpsEow==
X-CSE-MsgGUID: eelCHrnlRtC9cugd+EM0OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40279292"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="40279292"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:21:20 -0700
X-CSE-ConnectionGUID: BTv+SMdwSPGLciwGCu89Ng==
X-CSE-MsgGUID: C12QQU86SL6nmASJywu/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48248189"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.123])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:21:18 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jul 2024 13:21:10 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 03/10] platform/x86/amd/hsmp: Move strcuture and macros
 to header file
In-Reply-To: <20240627053958.2533860-4-suma.hegde@amd.com>
Message-ID: <e1d10efc-10ac-83c2-4042-f6d0bfbe0d9d@linux.intel.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com> <20240627053958.2533860-4-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1721620209-1720520470=:1103"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1721620209-1720520470=:1103
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 27 Jun 2024, Suma Hegde wrote:

> This is in preparation to splitting ACPI and platform device drivers.
> No logical change, move common structures and macros to hsmp.h
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 42 ++--------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h | 54 ++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/hsmp.h
>=20
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/=
amd/hsmp/hsmp.c
> index 10ab9b2437f1..2c9ba51b9614 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -9,15 +9,14 @@
> =20
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> =20
> +#include "hsmp.h"
> +
>  #include <asm/amd_hsmp.h>
>  #include <asm/amd_nb.h>
>  #include <linux/delay.h>
> -#include <linux/io.h>
> -#include <linux/miscdevice.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> -#include <linux/semaphore.h>
>  #include <linux/acpi.h>
> =20
>  #define DRIVER_NAME=09=09"amd_hsmp"
> @@ -51,48 +50,11 @@
>  #define HSMP_INDEX_REG=09=090xc4
>  #define HSMP_DATA_REG=09=090xc8
> =20
> -#define HSMP_CDEV_NAME=09=09"hsmp_cdev"
> -#define HSMP_DEVNODE_NAME=09"hsmp"
> -#define HSMP_METRICS_TABLE_NAME=09"metrics_bin"
> -
> -#define HSMP_ATTR_GRP_NAME_SIZE=0910
> -
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR=09=09"MsgIdOffset"
>  #define MSG_ARGOFF_STR=09=09"MsgArgOffset"
>  #define MSG_RESPOFF_STR=09=09"MsgRspOffset"
> =20
> -#define MAX_AMD_SOCKETS 8
> -
> -struct hsmp_mbaddr_info {
> -=09u32 base_addr;
> -=09u32 msg_id_off;
> -=09u32 msg_resp_off;
> -=09u32 msg_arg_off;
> -=09u32 size;
> -};
> -
> -struct hsmp_socket {
> -=09struct bin_attribute hsmp_attr;
> -=09struct hsmp_mbaddr_info mbinfo;
> -=09void __iomem *metric_tbl_addr;
> -=09void __iomem *virt_base_addr;
> -=09struct semaphore hsmp_sem;
> -=09char name[HSMP_ATTR_GRP_NAME_SIZE];
> -=09struct pci_dev *root;
> -=09struct device *dev;
> -=09u16 sock_ind;
> -};
> -
> -struct hsmp_plat_device {
> -=09struct miscdevice hsmp_device;
> -=09struct hsmp_socket *sock;
> -=09u32 proto_ver;
> -=09u16 num_sockets;
> -=09bool is_acpi_device;
> -=09bool is_probed;
> -};
> -
>  static struct hsmp_plat_device plat_dev;
> =20
>  static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/=
amd/hsmp/hsmp.h
> new file mode 100644
> index 000000000000..cc11e9303a83
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * Header file for HSMP driver
> + */
> +
> +#ifndef HSMP_H
> +#define HSMP_H
> +
> +#include <linux/io.h>
> +#include <linux/semaphore.h>
> +#include <linux/miscdevice.h>

Please put these into alphabetical order.

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

> +#define HSMP_METRICS_TABLE_NAME=09"metrics_bin"
> +
> +#define HSMP_ATTR_GRP_NAME_SIZE=0910
> +
> +#define MAX_AMD_SOCKETS 8
> +
> +#define HSMP_CDEV_NAME=09=09"hsmp_cdev"
> +#define HSMP_DEVNODE_NAME=09"hsmp"
> +
> +struct hsmp_mbaddr_info {
> +=09u32 base_addr;
> +=09u32 msg_id_off;
> +=09u32 msg_resp_off;
> +=09u32 msg_arg_off;
> +=09u32 size;
> +};
> +
> +struct hsmp_socket {
> +=09struct bin_attribute hsmp_attr;
> +=09struct hsmp_mbaddr_info mbinfo;
> +=09void __iomem *metric_tbl_addr;
> +=09void __iomem *virt_base_addr;
> +=09struct semaphore hsmp_sem;
> +=09char name[HSMP_ATTR_GRP_NAME_SIZE];
> +=09struct pci_dev *root;
> +=09struct device *dev;
> +=09u16 sock_ind;
> +};
> +
> +struct hsmp_plat_device {
> +=09struct miscdevice hsmp_device;
> +=09struct hsmp_socket *sock;
> +=09u32 proto_ver;
> +=09u16 num_sockets;
> +=09bool is_acpi_device;
> +=09bool is_probed;
> +};
> +#endif /* HSMP_H */
>=20
--8323328-1721620209-1720520470=:1103--
