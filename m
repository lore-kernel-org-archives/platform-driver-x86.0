Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28B39CD5BB3
	for <platform-driver-x86@archiver.kernel.org>; Tue, 19 Sep 2023 13:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbjISNAb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 19 Sep 2023 09:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjISNAa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2023 09:00:30 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AE9F3
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Sep 2023 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695128424; x=1726664424;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=6KATz/BkM0sqqWz/yrpF3voR1mDjnUi+o2iOnSfUMJE=;
  b=dG9SI+GAVezMek5x1h/GNvVCxyZoH1dFkzWOwOHsSNITVSH9291Khg9k
   oV2eLhYSNAbJ09YcHooy1FhY5sWKKbgzwx1L23D4n6zQgG+JN054/lNxw
   gcGMnyyxitCEiw5bGOTRD3kxEBXr4en+GRsFhVp27BIw2LKnteKAdpbLZ
   U+1s2mb9YDFo5htYyLJdEfX5Jdr1gw9T7yubqEe/Fr9imPHkLG4I6WcHp
   /h064dMOVfTm/1aXeoMDE3c5SsxGR5RzlsnZQgv/OJBibW9ZHIVKI7QHU
   GuHowR7LeFAdCYRZS0AeIG6vwk+AEI8lrfmkHE8xXRV1jeXS3EpM/aFRt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="444018227"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="444018227"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1076971907"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="1076971907"
Received: from laichele-mobl1.ger.corp.intel.com ([10.252.38.7])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:00:21 -0700
Date:   Tue, 19 Sep 2023 16:00:17 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Suma Hegde <suma.hegde@amd.com>
cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
Subject: Re: [PATCH v3 1/3] platform/x86/amd/hsmp: create plat specific
 struct
In-Reply-To: <20230919092057.2235437-1-suma.hegde@amd.com>
Message-ID: <b995c9d-109c-41be-ec45-ebeaec2027dd@linux.intel.com>
References: <20230919092057.2235437-1-suma.hegde@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-160806845-1695128424=:22803"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-160806845-1695128424=:22803
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 19 Sep 2023, Suma Hegde wrote:

> Having a separate platform device structure helps in future, to
> contain platform specific variables and other data.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> ---
> Changes since v1:
> 1. defined HSMP_CDEV_NAME and HSMP_DEVNODE_NAME macros
> Changes since v2:
> 1. moved num_sockets variable to plat_dev structure
> 
>  drivers/platform/x86/amd/hsmp.c | 61 ++++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index 31382ef52efb..99727cd705cf 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -47,9 +47,22 @@
>  #define HSMP_INDEX_REG		0xc4
>  #define HSMP_DATA_REG		0xc8
>  
> -static struct semaphore *hsmp_sem;
> +#define HSMP_CDEV_NAME		"hsmp_cdev"
> +#define HSMP_DEVNODE_NAME	"hsmp"
>  
> -static struct miscdevice hsmp_device;
> +struct hsmp_socket {
> +	struct semaphore hsmp_sem;
> +	u16 sock_ind;
> +};
> +
> +struct hsmp_plat_device {
> +	struct miscdevice hsmp_device;
> +	struct hsmp_socket *sock;
> +	struct device *dev;
> +	u16 num_sockets;
> +};
> +
> +static struct hsmp_plat_device plat_dev;
>  
>  static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
>  			 u32 *value, bool write)
> @@ -188,6 +201,7 @@ static int validate_message(struct hsmp_message *msg)
>  
>  int hsmp_send_message(struct hsmp_message *msg)
>  {
> +	struct hsmp_socket *sock = &plat_dev.sock[msg->sock_ind];
>  	struct amd_northbridge *nb;
>  	int ret;
>  
> @@ -208,14 +222,13 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	 * In SMP system timeout of 100 millisecs should
>  	 * be enough for the previous thread to finish the operation
>  	 */
> -	ret = down_timeout(&hsmp_sem[msg->sock_ind],
> -			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
> +	ret = down_timeout(&sock->hsmp_sem, msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>  	if (ret < 0)
>  		return ret;
>  
>  	ret = __hsmp_send_message(nb->root, msg);
>  
> -	up(&hsmp_sem[msg->sock_ind]);
> +	up(&sock->hsmp_sem);
>  
>  	return ret;
>  }
> @@ -321,28 +334,31 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  {
>  	int i;
>  
> -	hsmp_sem = devm_kzalloc(&pdev->dev,
> -				(amd_nb_num() * sizeof(struct semaphore)),
> -				GFP_KERNEL);
> -	if (!hsmp_sem)
> +	plat_dev.sock = devm_kzalloc(&pdev->dev,
> +				     (plat_dev.num_sockets * sizeof(struct hsmp_socket)),
> +				     GFP_KERNEL);
> +	if (!plat_dev.sock)
>  		return -ENOMEM;
> +	plat_dev.dev = &pdev->dev;
>  
> -	for (i = 0; i < amd_nb_num(); i++)
> -		sema_init(&hsmp_sem[i], 1);
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
> +		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
> +		plat_dev.sock[i].sock_ind = i;
> +	}
>  
> -	hsmp_device.name	= "hsmp_cdev";
> -	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> -	hsmp_device.fops	= &hsmp_fops;
> -	hsmp_device.parent	= &pdev->dev;
> -	hsmp_device.nodename	= "hsmp";
> -	hsmp_device.mode	= 0644;
> +	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> +	plat_dev.hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> +	plat_dev.hsmp_device.fops	= &hsmp_fops;
> +	plat_dev.hsmp_device.parent	= &pdev->dev;
> +	plat_dev.hsmp_device.nodename	= HSMP_DEVNODE_NAME;
> +	plat_dev.hsmp_device.mode	= 0644;
>  
> -	return misc_register(&hsmp_device);
> +	return misc_register(&plat_dev.hsmp_device);
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> -	misc_deregister(&hsmp_device);
> +	misc_deregister(&plat_dev.hsmp_device);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> @@ -358,7 +374,6 @@ static struct platform_device *amd_hsmp_platdev;
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> -	u16 num_sockets;
>  	int i;
>  
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
> @@ -371,12 +386,12 @@ static int __init hsmp_plt_init(void)
>  	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
>  	 * if we have N SMN/DF interfaces that ideally means N sockets
>  	 */
> -	num_sockets = amd_nb_num();
> -	if (num_sockets == 0)
> +	plat_dev.num_sockets = amd_nb_num();
> +	if (plat_dev.num_sockets == 0)
>  		return ret;
>  
>  	/* Test the hsmp interface on each socket */
> -	for (i = 0; i < num_sockets; i++) {
> +	for (i = 0; i < plat_dev.num_sockets; i++) {
>  		ret = hsmp_test(i, 0xDEADBEEF);
>  		if (ret) {
>  			pr_err("HSMP is not supported on Fam:%x model:%x\n",
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-160806845-1695128424=:22803--
