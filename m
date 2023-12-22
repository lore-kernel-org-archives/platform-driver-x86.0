Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02259D2E7
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Dec 2023 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bn/8ByIy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703235114; x=1734771114;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=KC1Dc3Zu8aE7aAv4b0QKV24oTxyVUph8YM0Kjsv1NXQ=;
  b=Bn/8ByIyvZpCHQIHxpise+xN5iEajhkKN3ydy+bFKzGaCMuHjb+WZf2v
   FVzT/fw35qqoFZBIY0YsTM+mv9QCS55cY2JP8LLdJhm3VzACSM30AELFK
   RkFwsCP2San03ual0RbzF3DUFKRjQIfdwMU+mwX4LiZDIlmpWQsUiM4Ut
   SPw/vE3vRGPGXr67vrdgnA2ZcDJMAaPUCGpvrCpbtNQEFwlAFXvS+sEh+
   bmF2Q7rMmvY5ac1Slb0Pq3E/O5SNi0BlSx7b01walEerIEW48RfGWmV1v
   dQGnx/KeabDOaEjVIKmx4Ru3qcxYXo6sQZ5U87eaflCku2+aNAC2JRsH4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="399915867"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="399915867"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 00:51:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="811261132"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="811261132"
Received: from mschutz-mobl.ger.corp.intel.com ([10.251.210.169])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 00:51:52 -0800
Date: Fri, 22 Dec 2023 10:51:50 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 6/7] platform/x86: Convert to ACPI based probing
In-Reply-To: <20231221172114.1569559-6-suma.hegde@amd.com>
Message-ID: <19cedcb8-eb39-bee4-fcd4-5d7a375e5ca@linux.intel.com>
References: <20231221172114.1569559-1-suma.hegde@amd.com> <20231221172114.1569559-6-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Dec 2023, Suma Hegde wrote:

> ACPI table provides mailbox base address and register offset
> information. The base address is provided as part of CRS method
> and mailbox offsets are provided through DSD table.
> Sockets are differentiated by UIDs.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
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
> Changes since v2:
> 1. Change EINVAL to ENODEV in hsmp_read_acpi_dsd()
> 2. Change EINVAL to ENOENT in hsmp_read_acpi_dsd()
> 3. Use resource_size() in hsmp_resource()
> 
>  drivers/platform/x86/amd/hsmp.c | 324 +++++++++++++++++++++++++++++---
>  1 file changed, 296 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index e77d4cd83a07..46924c572055 100644
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

This comes out of nowhere... Why proto_ver isn't enough to handle this?
If it's needed, would the check perhaps belong to 
hsmp_is_sock_attr_visible() instead?

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

16 -> UUID_SIZE.

> +		return guid_equal((guid_t *)obj->buffer.pointer, &acpi_hsmp_uuid);
> +
> +	return false;
> +}


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
> -	ret = init_socket_objects(&pdev->dev);
> -	if (ret)
> -		return ret;
> -
> -	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> -	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> -	plat_dev.hsmp_device.fops	= &hsmp_fops;
> -	plat_dev.hsmp_device.parent	= &pdev->dev;
> -	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> -	plat_dev.hsmp_device.mode	= 0644;
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

I know you're just moving code around here so no need to do it in this 
patchset but this should use devm_kcalloc() and there are also extra 
parenthesis.


-- 
 i.

