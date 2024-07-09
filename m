Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6582C38FB0
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jul 2024 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720519777; cv=none; b=ZvebwuVLFQs3aT2iAmZg/0Nyt55kKWufKUsXX07pptvuvq9lLd82ugotryP1Bkl//S4mtSovt0bszmBgyGP+LiTt46ZBoqJO4sR5k5dYWhvY3L5u0g8MBVajG+VQY9Zd7pkmMqsezcluU5LvwN0QdWPof52cpdFaYONfJZnU93Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720519777; c=relaxed/simple;
	bh=IHIm+3wXPoXR1uvzwdP7Ojk1ADvyg3yUXBGLaFfUPN0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IkTnqkNpvbihv/NJa5+HZQOmaoGvllmM2YJSkQYCgVwaQy/M3evKz7+SijMPdNpv4ibYgZqqimIU5o4gLDiewDR8fm5ke3Fkb8dRn0hhn8meaaeFVnH1lMvpdCPirNn70+PpL5Awhz6zNQQcYHNM8ZNh7W6FrJuP6FuV3BW5bEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rz/eUTIv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rz/eUTIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720519775; x=1752055775;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=IHIm+3wXPoXR1uvzwdP7Ojk1ADvyg3yUXBGLaFfUPN0=;
  b=Rz/eUTIv/gb5jkqYpY7NwLQpf1UYb6sITSAASPN76VrXx0J3V2fKHVnB
   Dd0P1xO8vyJZxzEcHDf0gJE9MtKYaK9h1dURmHdtDp8M4qvYulSfIicTD
   lt3EYzVquaBYG/ZCXby1JnonkVam6Y23Y5qMMA694LOpZnubpx+eaa0v7
   JtPqIbEGVgO/TuQaWkRjZDbwSmytOVmxJCUT2J+wOUrr4coFmBF0RjbkP
   V0fMT6y91xQehLNFCqnN/MLenvDqp/84s+cQpGMIQwntAYzzsAOmcZQVL
   tulVq444i7zEYo8Hq1wqGiYXbYRdQH1Qg5Dy0C2jsIINCISMX4BRmg61L
   g==;
X-CSE-ConnectionGUID: b2PgJQx/QkGe5zvfha2Iow==
X-CSE-MsgGUID: QQJP+wJBRD6lAMW1JvFVHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="12449180"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="12449180"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:09:34 -0700
X-CSE-ConnectionGUID: 8awQV09CRnm9SLk/G6/1eQ==
X-CSE-MsgGUID: IUNp2ERAQae/LKaECQ80dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="48530801"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.123])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 03:09:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 9 Jul 2024 13:09:26 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [PATCH 05/10] platform/x86/amd/hsmp: Move ACPI code to acpi.c
In-Reply-To: <20240627053958.2533860-6-suma.hegde@amd.com>
Message-ID: <40c43c62-6666-573f-e0cc-a86bfbff12db@linux.intel.com>
References: <20240627053958.2533860-1-suma.hegde@amd.com> <20240627053958.2533860-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 27 Jun 2024, Suma Hegde wrote:

> Move ACPI related code to acpi.c from hsmp.c.
> We still have one driver, the driver probe will be split in the next patch.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/Makefile |   2 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   | 261 +++++++++++++++++++++++++
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 247 -----------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   2 +
>  4 files changed, 264 insertions(+), 248 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/hsmp/acpi.c
> 
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index fb8ba04b2f0d..0cc92865c0a2 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -5,4 +5,4 @@
>  #
>  
>  obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o
> +amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> new file mode 100644
> index 000000000000..90bfa1ddadbf
> --- /dev/null
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2024, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides a device implementation for HSMP interface
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include "hsmp.h"
> +
> +#include <linux/acpi.h>
> +
> +/* These are the strings specified in ACPI table */
> +#define MSG_IDOFF_STR		"MsgIdOffset"
> +#define MSG_ARGOFF_STR		"MsgArgOffset"
> +#define MSG_RESPOFF_STR		"MsgRspOffset"
> +
> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			u32 *value, bool write)
> +{
> +	if (write)
> +		iowrite32(*value, sock->virt_base_addr + offset);
> +	else
> +		*value = ioread32(sock->virt_base_addr + offset);
> +}
> +
> +/* This is the UUID used for HSMP */
> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
> +						0xa6, 0x9f, 0x4e, 0xa2,
> +						0x87, 0x1f, 0xc2, 0xf6);
> +
> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> +{
> +	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
> +		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);

#include for GUID_INIT() and guid_equal().

> +	return false;
> +}
> +
> +static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> +{
> +	char *uid;
> +
> +	/*
> +	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> +	 * read it and strip the "ID" part of it and convert the remaining
> +	 * bytes to integer.
> +	 */
> +	uid = acpi_device_uid(ACPI_COMPANION(dev));
> +
> +	return kstrtou16(uid + 2, 10, sock_ind);

#include for kstrtou16().

I think I mentioned already earlier that each file should include what 
they use, but it seems that not even the original hsmp.c contained these 
so they came from somewhere deeper in the include chain.

> +}
> +
> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> +{
> +	struct hsmp_socket *sock = data;
> +	struct resource r;

#include for struct resource

> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		if (!acpi_dev_resource_memory(res, &r))
> +			return AE_ERROR;
> +		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
> +			return AE_ERROR;
> +		sock->mbinfo.base_addr = r.start;
> +		sock->mbinfo.size = resource_size(&r);

#include for resource_size()

> +		break;
> +	case ACPI_RESOURCE_TYPE_END_TAG:
> +		break;
> +	default:
> +		return AE_ERROR;
> +	}
> +
> +	return AE_OK;
> +}
> +
> +static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> +{
> +	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *guid, *mailbox_package;
> +	union acpi_object *dsd;
> +	acpi_status status;
> +	int ret = 0;
> +	int j;
> +
> +	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
> +					    &buf, ACPI_TYPE_PACKAGE);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
> +			acpi_format_exception(status));

#include for dev_err()

> +		return -ENODEV;

#include for -Exx codes.

> +	}
> +
> +	dsd = buf.pointer;
> +
> +	/* HSMP _DSD property should contain 2 objects.
> +	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> +	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> +	 *    This mailbox object contains 3 more acpi objects of type
> +	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> +	 *    these packages inturn contain 2 acpi objects of type
> +	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> +	 */
> +	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
> +		ret = -EINVAL;
> +		goto free_buf;
> +	}
> +
> +	guid = &dsd->package.elements[0];
> +	mailbox_package = &dsd->package.elements[1];
> +	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
> +		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> +		ret = -EINVAL;
> +		goto free_buf;
> +	}
> +
> +	for (j = 0; j < mailbox_package->package.count; j++) {
> +		union acpi_object *msgobj, *msgstr, *msgint;
> +
> +		msgobj	= &mailbox_package->package.elements[j];
> +		msgstr	= &msgobj->package.elements[0];
> +		msgint	= &msgobj->package.elements[1];
> +
> +		/* package should have 1 string and 1 integer object */
> +		if (msgobj->type != ACPI_TYPE_PACKAGE ||
> +		    msgstr->type != ACPI_TYPE_STRING ||
> +		    msgint->type != ACPI_TYPE_INTEGER) {
> +			ret = -EINVAL;
> +			goto free_buf;
> +		}
> +
> +		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> +			     msgstr->string.length)) {
> +			sock->mbinfo.msg_id_off = msgint->integer.value;
> +		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> +				    msgstr->string.length)) {
> +			sock->mbinfo.msg_resp_off =  msgint->integer.value;
> +		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> +				    msgstr->string.length)) {
> +			sock->mbinfo.msg_arg_off = msgint->integer.value;
> +		} else {
> +			ret = -ENOENT;
> +			goto free_buf;
> +		}
> +	}
> +
> +	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> +	    !sock->mbinfo.msg_arg_off)
> +		ret = -EINVAL;
> +
> +free_buf:
> +	ACPI_FREE(buf.pointer);
> +	return ret;
> +}
> +
> +static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> +{
> +	acpi_status status;
> +
> +	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
> +				     hsmp_resource, sock);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
> +			acpi_format_exception(status));
> +		return -EINVAL;
> +	}
> +	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> +		return -EINVAL;
> +
> +	/* The mapped region should be un cached */

uncached

> +	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
> +					       sock->mbinfo.size);
> +	if (!sock->virt_base_addr) {
> +		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +/* Parse the ACPI table to read the data */
> +static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
> +{
> +	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
> +	int ret;
> +
> +	sock->sock_ind		= sock_ind;
> +	sock->dev		= dev;
> +	plat_dev.is_acpi_device	= true;
> +
> +	sema_init(&sock->hsmp_sem, 1);
> +
> +	/* Read MP1 base address from CRS method */
> +	ret = hsmp_read_acpi_crs(sock);
> +	if (ret)
> +		return ret;
> +
> +	/* Read mailbox offsets from DSD table */
> +	return hsmp_read_acpi_dsd(sock);
> +}
> +
> +int hsmp_create_acpi_sysfs_if(struct device *dev)
> +{
> +	struct attribute_group *attr_grp;
> +	u16 sock_ind;
> +	int ret;
> +
> +	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);

#include for devm_kzalloc()

> +	if (!attr_grp)
> +		return -ENOMEM;
> +
> +	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> +
> +	ret = hsmp_get_uid(dev, &sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
> +	if (ret)
> +		return ret;
> +
> +	return devm_device_add_group(dev, attr_grp);

#include for devm_device_add_group()

-- 
 i.

> +}
> +
> +int init_acpi(struct device *dev)
> +{
> +	u16 sock_ind;
> +	int ret;
> +
> +	ret = hsmp_get_uid(dev, &sock_ind);
> +	if (ret)
> +		return ret;
> +	if (sock_ind >= plat_dev.num_sockets)
> +		return -EINVAL;
> +
> +	ret = hsmp_parse_acpi_table(dev, sock_ind);
> +	if (ret) {
> +		dev_err(dev, "Failed to parse ACPI table\n");
> +		return ret;
> +	}
> +
> +	/* Test the hsmp interface */
> +	ret = hsmp_test(sock_ind, 0xDEADBEEF);
> +	if (ret) {
> +		dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_cache_proto_ver(sock_ind);
> +	if (ret) {
> +		dev_err(dev, "Failed to read HSMP protocol version\n");
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index cd4de107a470..d3f0f08cebf7 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -28,22 +28,8 @@
>  #define HSMP_WR			true
>  #define HSMP_RD			false
>  
> -/* These are the strings specified in ACPI table */
> -#define MSG_IDOFF_STR		"MsgIdOffset"
> -#define MSG_ARGOFF_STR		"MsgArgOffset"
> -#define MSG_RESPOFF_STR		"MsgRspOffset"
> -
>  struct hsmp_plat_device plat_dev;
>  
> -static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> -			       u32 *value, bool write)
> -{
> -	if (write)
> -		iowrite32(*value, sock->virt_base_addr + offset);
> -	else
> -		*value = ioread32(sock->virt_base_addr + offset);
> -}
> -
>  static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>  			 u32 *value, bool write)
>  {
> @@ -298,181 +284,6 @@ long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -/* This is the UUID used for HSMP */
> -static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
> -						0xa6, 0x9f, 0x4e, 0xa2,
> -						0x87, 0x1f, 0xc2, 0xf6);
> -
> -static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> -{
> -	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == UUID_SIZE)
> -		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> -
> -	return false;
> -}
> -
> -static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
> -{
> -	char *uid;
> -
> -	/*
> -	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
> -	 * read it and strip the "ID" part of it and convert the remaining
> -	 * bytes to integer.
> -	 */
> -	uid = acpi_device_uid(ACPI_COMPANION(dev));
> -
> -	return kstrtou16(uid + 2, 10, sock_ind);
> -}
> -
> -static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> -{
> -	struct hsmp_socket *sock = data;
> -	struct resource r;
> -
> -	switch (res->type) {
> -	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> -		if (!acpi_dev_resource_memory(res, &r))
> -			return AE_ERROR;
> -		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
> -			return AE_ERROR;
> -		sock->mbinfo.base_addr = r.start;
> -		sock->mbinfo.size = resource_size(&r);
> -		break;
> -	case ACPI_RESOURCE_TYPE_END_TAG:
> -		break;
> -	default:
> -		return AE_ERROR;
> -	}
> -
> -	return AE_OK;
> -}
> -
> -static int hsmp_read_acpi_dsd(struct hsmp_socket *sock)
> -{
> -	struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *guid, *mailbox_package;
> -	union acpi_object *dsd;
> -	acpi_status status;
> -	int ret = 0;
> -	int j;
> -
> -	status = acpi_evaluate_object_typed(ACPI_HANDLE(sock->dev), "_DSD", NULL,
> -					    &buf, ACPI_TYPE_PACKAGE);
> -	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to read mailbox reg offsets from DSD table, err: %s\n",
> -			acpi_format_exception(status));
> -		return -ENODEV;
> -	}
> -
> -	dsd = buf.pointer;
> -
> -	/* HSMP _DSD property should contain 2 objects.
> -	 * 1. guid which is an acpi object of type ACPI_TYPE_BUFFER
> -	 * 2. mailbox which is an acpi object of type ACPI_TYPE_PACKAGE
> -	 *    This mailbox object contains 3 more acpi objects of type
> -	 *    ACPI_TYPE_PACKAGE for holding msgid, msgresp, msgarg offsets
> -	 *    these packages inturn contain 2 acpi objects of type
> -	 *    ACPI_TYPE_STRING and ACPI_TYPE_INTEGER
> -	 */
> -	if (!dsd || dsd->type != ACPI_TYPE_PACKAGE || dsd->package.count != 2) {
> -		ret = -EINVAL;
> -		goto free_buf;
> -	}
> -
> -	guid = &dsd->package.elements[0];
> -	mailbox_package = &dsd->package.elements[1];
> -	if (!is_acpi_hsmp_uuid(guid) || mailbox_package->type != ACPI_TYPE_PACKAGE) {
> -		dev_err(sock->dev, "Invalid hsmp _DSD table data\n");
> -		ret = -EINVAL;
> -		goto free_buf;
> -	}
> -
> -	for (j = 0; j < mailbox_package->package.count; j++) {
> -		union acpi_object *msgobj, *msgstr, *msgint;
> -
> -		msgobj	= &mailbox_package->package.elements[j];
> -		msgstr	= &msgobj->package.elements[0];
> -		msgint	= &msgobj->package.elements[1];
> -
> -		/* package should have 1 string and 1 integer object */
> -		if (msgobj->type != ACPI_TYPE_PACKAGE ||
> -		    msgstr->type != ACPI_TYPE_STRING ||
> -		    msgint->type != ACPI_TYPE_INTEGER) {
> -			ret = -EINVAL;
> -			goto free_buf;
> -		}
> -
> -		if (!strncmp(msgstr->string.pointer, MSG_IDOFF_STR,
> -			     msgstr->string.length)) {
> -			sock->mbinfo.msg_id_off = msgint->integer.value;
> -		} else if (!strncmp(msgstr->string.pointer, MSG_RESPOFF_STR,
> -				    msgstr->string.length)) {
> -			sock->mbinfo.msg_resp_off =  msgint->integer.value;
> -		} else if (!strncmp(msgstr->string.pointer, MSG_ARGOFF_STR,
> -				    msgstr->string.length)) {
> -			sock->mbinfo.msg_arg_off = msgint->integer.value;
> -		} else {
> -			ret = -ENOENT;
> -			goto free_buf;
> -		}
> -	}
> -
> -	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> -	    !sock->mbinfo.msg_arg_off)
> -		ret = -EINVAL;
> -
> -free_buf:
> -	ACPI_FREE(buf.pointer);
> -	return ret;
> -}
> -
> -static int hsmp_read_acpi_crs(struct hsmp_socket *sock)
> -{
> -	acpi_status status;
> -
> -	status = acpi_walk_resources(ACPI_HANDLE(sock->dev), METHOD_NAME__CRS,
> -				     hsmp_resource, sock);
> -	if (ACPI_FAILURE(status)) {
> -		dev_err(sock->dev, "Failed to look up MP1 base address from CRS method, err: %s\n",
> -			acpi_format_exception(status));
> -		return -EINVAL;
> -	}
> -	if (!sock->mbinfo.base_addr || !sock->mbinfo.size)
> -		return -EINVAL;
> -
> -	/* The mapped region should be un cached */
> -	sock->virt_base_addr = devm_ioremap_uc(sock->dev, sock->mbinfo.base_addr,
> -					       sock->mbinfo.size);
> -	if (!sock->virt_base_addr) {
> -		dev_err(sock->dev, "Failed to ioremap MP1 base address\n");
> -		return -ENOMEM;
> -	}
> -
> -	return 0;
> -}
> -
> -/* Parse the ACPI table to read the data */
> -static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
> -{
> -	struct hsmp_socket *sock = &plat_dev.sock[sock_ind];
> -	int ret;
> -
> -	sock->sock_ind		= sock_ind;
> -	sock->dev		= dev;
> -	plat_dev.is_acpi_device	= true;
> -
> -	sema_init(&sock->hsmp_sem, 1);
> -
> -	/* Read MP1 base address from CRS method */
> -	ret = hsmp_read_acpi_crs(sock);
> -	if (ret)
> -		return ret;
> -
> -	/* Read mailbox offsets from DSD table */
> -	return hsmp_read_acpi_dsd(sock);
> -}
> -
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count)
> @@ -581,29 +392,6 @@ int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  	return hsmp_init_metric_tbl_bin_attr(hsmp_bin_attrs, sock_ind);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> -{
> -	struct attribute_group *attr_grp;
> -	u16 sock_ind;
> -	int ret;
> -
> -	attr_grp = devm_kzalloc(dev, sizeof(struct attribute_group), GFP_KERNEL);
> -	if (!attr_grp)
> -		return -ENOMEM;
> -
> -	attr_grp->is_bin_visible = hsmp_is_sock_attr_visible;
> -
> -	ret = hsmp_get_uid(dev, &sock_ind);
> -	if (ret)
> -		return ret;
> -
> -	ret = hsmp_create_attr_list(attr_grp, dev, sock_ind);
> -	if (ret)
> -		return ret;
> -
> -	return devm_device_add_group(dev, attr_grp);
> -}
> -
>  int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  	struct hsmp_message msg = { 0 };
> @@ -619,38 +407,3 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>  
>  	return ret;
>  }
> -
> -int init_acpi(struct device *dev)
> -{
> -	u16 sock_ind;
> -	int ret;
> -
> -	ret = hsmp_get_uid(dev, &sock_ind);
> -	if (ret)
> -		return ret;
> -	if (sock_ind >= plat_dev.num_sockets)
> -		return -EINVAL;
> -
> -	ret = hsmp_parse_acpi_table(dev, sock_ind);
> -	if (ret) {
> -		dev_err(dev, "Failed to parse ACPI table\n");
> -		return ret;
> -	}
> -
> -	/* Test the hsmp interface */
> -	ret = hsmp_test(sock_ind, 0xDEADBEEF);
> -	if (ret) {
> -		dev_err(dev, "HSMP test message failed on Fam:%x model:%x\n",
> -			boot_cpu_data.x86, boot_cpu_data.x86_model);
> -		dev_err(dev, "Is HSMP disabled in BIOS ?\n");
> -		return ret;
> -	}
> -
> -	ret = hsmp_cache_proto_ver(sock_ind);
> -	if (ret) {
> -		dev_err(dev, "Failed to read HSMP protocol version\n");
> -		return ret;
> -	}
> -
> -	return ret;
> -}
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index d65ff2acdf3d..2baeef57ca54 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -68,4 +68,6 @@ umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
> +void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			u32 *value, bool write);
>  #endif /* HSMP_H */
> 
