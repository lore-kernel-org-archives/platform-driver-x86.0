Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879D1E3CD8
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Aug 2024 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723030799; cv=none; b=R/WsxnDBRqbj0NetGXmYiX9vFdLd0rKgtP78H6LMqimTMjoZKkWXCzikcDl0Ni2PszYTtPIcZYM4QvkM4wCvwzNVtmC6eOKWCezJPoM9dDH4VFmtoJpVyKA/vY1vTnfvAA50sXPMJiNWmhqIA5N3VRI0fESw86w802g2L02X6Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723030799; c=relaxed/simple;
	bh=KOzCX+7DzQUmF9otJGw0XGPTXNLg3YXpA3n8WZHOj7A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Sc58y/NlPhYXxAoVdhMTHmd775xAEWJ/CeMmEd28kVFMFLjIGB/rP8S4LSiMx8CkjR0D0MSqpHZpw/SCl+iYrG48lYJTNAc3rMDn7MPzfGGmkBoYhiPYIL1gjoX5cmhK3P/VrJMtmK42Qcwe/3V3qHqPhwT3hHzfukrGpNxD0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNFH4KB6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNFH4KB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723030798; x=1754566798;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KOzCX+7DzQUmF9otJGw0XGPTXNLg3YXpA3n8WZHOj7A=;
  b=bNFH4KB6A9l3y+YD/XE93bLvh4USj8kN7iiLWVXLyJ06FQQhPZ5Su89o
   oOFNWLT0NatUge26xF42DVXOKODTeCqj1r3Zcvn+0BtIyUcUl8Iovt4W9
   FlFuGAIIW0WBxP7yA46WV6VNxpLEdDNrArRzqmqbv6xVYk9cvwzSY6pVT
   un/jonoYRlwItIO/I6M2KCUIIn/INC4M8ZJxv4j34d/OhyVUFo3v5LoAF
   ofKkRIBvjV5zuuejiFECLVZZIO9tn9Y+tLphNAMUvHKddaj4t955vldV0
   2n0XWWN7KQKgAtDfTaE7hL7NsO3RZP0k/NdpAWEGqnvIW/IZMhMKSuK4/
   Q==;
X-CSE-ConnectionGUID: LdvFB+4zT9WjhpgEHACycg==
X-CSE-MsgGUID: Cq/wWvZsSlS3nbPheTwxLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="32495975"
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="32495975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:39:57 -0700
X-CSE-ConnectionGUID: WTxjO1vVRLu45ZfO3VDJBA==
X-CSE-MsgGUID: vYqbjP8ZSr+UbmH23ffSzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,269,1716274800"; 
   d="scan'208";a="56494361"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 04:39:56 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Aug 2024 14:39:51 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v3 03/11] platform/x86/amd/hsmp: Move structure and macros to
 header file
In-Reply-To: <20240720174552.946255-3-suma.hegde@amd.com>
Message-ID: <ff83f4df-8911-3f67-e532-d9dc512a398e@linux.intel.com>
References: <20240720174552.946255-1-suma.hegde@amd.com> <20240720174552.946255-3-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1018642444-1723030791=:1138"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1018642444-1723030791=:1138
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 20 Jul 2024, Suma Hegde wrote:

> This is in preparation to splitting ACPI and platform device drivers.
> No logical change, move common structures and macros to hsmp.h
>=20
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> ---
> Changes since v2:
> None
> Changes since v1:
> 1. Correct typo mistake in commit message
> 2. Add "Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>"
> 3. Arrange header files in alphabetical order for hsmp.h
>=20
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
> index 000000000000..5afc7167fac1
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
> +#include <linux/miscdevice.h>
> +#include <linux/semaphore.h>
> +
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

This requires #include <linux/sysfs.h>

--=20
 i.

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
--8323328-1018642444-1723030791=:1138--
