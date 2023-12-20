Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050BB2232F
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Dec 2023 17:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxH9k+4C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703093654; x=1734629654;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=id5o2mtl3LHDyypAdSSjeFuJcaZvmRhqSlgcMV+Hr8Q=;
  b=WxH9k+4CDIlHp+kEhnKasICzxsZ19SqQ01KyDy52yocyNXaj4rQKrK+8
   BuCk9+W/hsQp2Vd4aiEIglGdY1KtkC2R1rjadq+tBGOoXJ+biBSLdgia7
   iyJHDpKLwY/mnKzFQ+uLlELybAyURovr1wYWoYlJSqBT0gagM4zaYHVvu
   /rsanSmGi+iKkC/bldSHneHM+v6nvRaO+vA+zE5XjXSvl8FQ/+s9uX5zQ
   5Mu61OGl5vTrBBxUR7kJ2pQ7JkUIkXNT/F+XM2xERXLrKRVkDYCOpWhwX
   kgkRqnWpsEWgpMQlSQFHdhGS834tmJtmMGnKZoDbPiaNsWzgddgYh/nZV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="375336175"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="375336175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:34:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="769651460"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="769651460"
Received: from alobakin-mobl.ger.corp.intel.com ([10.252.50.56])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 09:34:11 -0800
Date: Wed, 20 Dec 2023 19:34:08 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v2 6/7] platform/x86: Convert to ACPI based probing
In-Reply-To: <20231220165528.1351200-7-suma.hegde@amd.com>
Message-ID: <5cda9436-f2e7-7b7a-46d4-82e5b0e07cb@linux.intel.com>
References: <20231220165528.1351200-1-suma.hegde@amd.com> <20231220165528.1351200-7-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Suma Hegde wrote:

> ACPI table provides mailbox base address and register offset
> information. The base address is provided as part of CRS method
> and mailbox offsets are provided through DSD table.
> Sockets are differentiated by UIDs.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> Changes since v1:
> 1. Define amd_hsmp_acpi_rdwr() for doing mailbox memory mapped io
> 2. Add a check to see if mailbox register offsets are set in
>    hsmp_read_acpi_dsd()
> 3. Add a check to see if sock->mbinfo.base_addr sockck->mbinfo.size are
>    set in hsmp_read_acpi_crs()
> 4. Change order of the statements in switch case ACPI_RESOURCE_TYPE_FIXED_MEMORY32
>    in hsmp_resource()
> 5. Add hsmp_test() after hsmp_parse_acpi_table() call
> 6. Add r.end < r.start check in hsmp_resource()
> 7. Add !dsd error check in hsmp_read_acpi_dsd
> 
> ---
>  drivers/platform/x86/amd/hsmp.c | 323 +++++++++++++++++++++++++++++---
>  1 file changed, 296 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 3508399c6aa9..726ba73e23dd 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -18,9 +18,11 @@
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/semaphore.h>
> +#include <linux/acpi.h>
>  
>  #define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.0"
> +#define DRIVER_VERSION		"2.2"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
>  
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
> @@ -54,6 +56,11 @@
>  
>  #define HSMP_ATTR_GRP_NAME_SIZE	10
>  
> +/* These are the strings specified in ACPI table */
> +#define MSG_IDOFF_STR		"MsgIdOffset"
> +#define MSG_ARGOFF_STR		"MsgArgOffset"
> +#define MSG_RESPOFF_STR		"MsgRspOffset"
> +
>  struct hsmp_mbaddr_info {
>  	u32 base_addr;
>  	u32 msg_id_off;
> @@ -66,6 +73,7 @@ struct hsmp_socket {
>  	struct bin_attribute hsmp_attr;
>  	struct hsmp_mbaddr_info mbinfo;
>  	void __iomem *metric_tbl_addr;
> +	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
>  	struct pci_dev *root;
> @@ -78,12 +86,14 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> +	bool is_acpi_device;
> +	bool is_probed;
>  };
>  
>  static struct hsmp_plat_device plat_dev;
>  
> -static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
> -			 u32 *value, bool write)
> +static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
> +			     u32 *value, bool write)
>  {
>  	int ret;
>  
> @@ -101,8 +111,29 @@ static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
>  	return ret;
>  }
>  
> +static void amd_hsmp_acpi_rdwr(struct hsmp_socket *sock, u32 offset,
> +			       u32 *value, bool write)
> +{
> +	if (write)
> +		iowrite32(*value, sock->virt_base_addr + offset);
> +	else
> +		*value = ioread32(sock->virt_base_addr + offset);
> +}
> +
> +static int amd_hsmp_rdwr(struct hsmp_socket *sock, u32 offset,
> +			 u32 *value, bool write)
> +{
> +	if (plat_dev.is_acpi_device)
> +		amd_hsmp_acpi_rdwr(sock, offset, value, write);
> +	else
> +		return amd_hsmp_pci_rdwr(sock, offset, value, write);
> +
> +	return 0;
> +}
> +
>  /*
> - * Send a message to the HSMP port via PCI-e config space registers.
> + * Send a message to the HSMP port via PCI-e config space registers
> + * or by writing to MMIO space.
>   *
>   * The caller is expected to zero out any unused arguments.
>   * If a response is expected, the number of response words should be greater than 0.
> @@ -450,6 +481,9 @@ static int hsmp_create_sysfs_interface(void)
>  	int ret;
>  	u16 i;
>  
> +	if (plat_dev.is_acpi_device)
> +		return 0;
> +
>  	/* String formatting is currently limited to u8 sockets */
>  	if (WARN_ON(plat_dev.num_sockets > U8_MAX))
>  		return -ERANGE;
> @@ -487,13 +521,188 @@ static int hsmp_create_sysfs_interface(void)
>  	return devm_device_add_groups(plat_dev.sock[0].dev, hsmp_attr_grps);
>  }
>  
> -static int hsmp_cache_proto_ver(void)
> +/* This is the UUID used for HSMP */
> +static const guid_t acpi_hsmp_uuid = GUID_INIT(0xb74d619d, 0x5707, 0x48bd,
> +						0xa6, 0x9f, 0x4e, 0xa2,
> +						0x87, 0x1f, 0xc2, 0xf6);
> +
> +static inline bool is_acpi_hsmp_uuid(union acpi_object *obj)
> +{
> +	if (obj->type == ACPI_TYPE_BUFFER && obj->buffer.length == 16)
> +		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> +
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
> +	return kstrtou16((uid + 2), 10, sock_ind);
> +}
> +
> +static acpi_status hsmp_resource(struct acpi_resource *res, void *data)
> +{
> +	struct hsmp_socket *sock = data;
> +	struct resource r;
> +
> +	switch (res->type) {
> +	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
> +		if (!acpi_dev_resource_memory(res, &r))
> +			return AE_ERROR;
> +		if (!r.start || r.end < r.start || !(r.flags & IORESOURCE_MEM_WRITEABLE))
> +			return AE_ERROR;
> +		sock->mbinfo.base_addr = r.start;
> +		sock->mbinfo.size = r.end - r.start + 1;

resource_size(r)

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
> +		return -EINVAL;
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
> +			ret = -EINVAL;
> +			goto free_buf;
> +		}
> +	}
> +
> +	if (!sock->mbinfo.msg_id_off || !sock->mbinfo.msg_resp_off ||
> +	    !sock->mbinfo.msg_arg_off)
> +		ret = -EINVAL;

These smell like return -ENODEV or -ENOENT but I don't have an idea what 
ACPI related funcs typically return.

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
> +static int hsmp_cache_proto_ver(u16 sock_ind)
>  {
>  	struct hsmp_message msg = { 0 };
>  	int ret;
>  
>  	msg.msg_id	= HSMP_GET_PROTO_VER;
> -	msg.sock_ind	= 0;
> +	msg.sock_ind	= sock_ind;
>  	msg.response_sz = hsmp_msg_desc_table[HSMP_GET_PROTO_VER].response_sz;
>  
>  	ret = hsmp_send_message(&msg);
> @@ -532,28 +741,62 @@ static int initialize_platdev(struct device *dev)
>  	return 0;
>  }
>  
> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> +	{ACPI_HSMP_DEVICE_HID, 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> +
>  static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
> +	struct acpi_device *adev;
> +	u16 sock_ind = 0;
>  	int ret;
>  
> -	plat_dev.sock = devm_kzalloc(&pdev->dev,
> -				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> -				     GFP_KERNEL);
> -	if (!plat_dev.sock)
> -		return -ENOMEM;
> -
> -	ret = initialize_platdev(&pdev->dev);
> -	if (ret)
> -		return ret;
> +	/*
> +	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> +	 * each socket, so the per socket probing, but the memory allocated for
> +	 * sockets should be contiguous to access it as an array,
> +	 * Hence allocate memory for all the sockets at once instead of allocating
> +	 * on each probe.
> +	 */
> +	if (!plat_dev.is_probed) {
> +		plat_dev.sock = devm_kzalloc(&pdev->dev,
> +					     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> +					     GFP_KERNEL);
> +		if (!plat_dev.sock)
> +			return -ENOMEM;
> +	}
>  
> -	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> -	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> -	plat_dev.hsmp_device.fops	= &hsmp_fops;
> -	plat_dev.hsmp_device.parent	= &pdev->dev;
> -	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> -	plat_dev.hsmp_device.mode	= 0644;
> +	adev = ACPI_COMPANION(&pdev->dev);
> +	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids)) {
> +		ret = hsmp_get_uid(&pdev->dev, &sock_ind);
> +		if (ret)
> +			return ret;
> +		if (sock_ind >= plat_dev.num_sockets)
> +			return -EINVAL;

Again, caller didn't provide invalid value here either.

> +		ret = hsmp_parse_acpi_table(&pdev->dev, sock_ind);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to parse ACPI table\n");
> +			return ret;
> +		}
> +		/* Test the hsmp interface */
> +		ret = hsmp_test(sock_ind, 0xDEADBEEF);
> +		if (ret) {
> +			dev_err(&pdev->dev, "HSMP test message failed on Fam:%x model:%x\n",
> +				boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			dev_err(&pdev->dev, "Is HSMP disabled in BIOS ?\n");
> +			return ret;
> +		}
> +	} else {
> +		ret = initialize_platdev(&pdev->dev);
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +			return ret;
> +		}
> +	}
>  
> -	ret = hsmp_cache_proto_ver();
> +	ret = hsmp_cache_proto_ver(sock_ind);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to read HSMP protocol version\n");
>  		return ret;
> @@ -563,12 +806,35 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	if (ret)
>  		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>  
> -	return misc_register(&plat_dev.hsmp_device);
> +	if (!plat_dev.is_probed) {
> +		plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> +		plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> +		plat_dev.hsmp_device.fops	= &hsmp_fops;
> +		plat_dev.hsmp_device.parent	= &pdev->dev;
> +		plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> +		plat_dev.hsmp_device.mode	= 0644;
> +
> +		ret = misc_register(&plat_dev.hsmp_device);
> +		if (ret)
> +			return ret;
> +
> +		plat_dev.is_probed = true;
> +	}
> +
> +	return 0;
> +
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> -	misc_deregister(&plat_dev.hsmp_device);
> +	/*
> +	 * We register only one misc_device even on multi socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (plat_dev.is_probed) {
> +		misc_deregister(&plat_dev.hsmp_device);
> +		plat_dev.is_probed = false;
> +	}
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> @@ -576,6 +842,7 @@ static struct platform_driver amd_hsmp_driver = {
>  	.remove_new	= hsmp_pltdrv_remove,
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
>  	},
>  };
>  
> @@ -618,9 +885,11 @@ static int __init hsmp_plt_init(void)
>  	if (ret)
>  		return ret;
>  
> -	ret = hsmp_plat_dev_register();
> -	if (ret)
> -		platform_driver_unregister(&amd_hsmp_driver);
> +	if (!plat_dev.is_acpi_device) {
> +		ret = hsmp_plat_dev_register();
> +		if (ret)
> +			platform_driver_unregister(&amd_hsmp_driver);
> +	}
>  
>  	return ret;
>  }
> 

-- 
 i.

