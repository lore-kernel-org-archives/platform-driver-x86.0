Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8789980638
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 18:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725475959; cv=none; b=nWLzlsvk258h3qFJ4aUKU7wyKbV60ic5tg5/fUyl869S+f5bkIEWFtIpB6j1+V/FEhcJhcKqidrQcMXz+e87i2dFJo2CIUzIDs6mA1HRFS7KMbNUQcLyqG9WTIqLwNYYmwVssW6g+N5XNEJhWCLT+441gDa5h+Mc9hxnhFpZX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725475959; c=relaxed/simple;
	bh=Q8N95m//407a09L5HAq0q9LeyTpJuXTk88cCwX57Fb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEkEYA1WNvlo/mHQ/QJxEt4bhzP2ZyYWkKcpT7cMh3ze6UTTXZWrqY2UUcLN15N1xGiq+H9hNlI9nt58SOMU1sEjTWAmEmjiwHZajkSkicpG0JH0/MSpUQUtKo3iOltQ1sQv/Tq5qwq8YJigHSc8+1TDJe3WMjWEzaLtZmMOv7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=diCDpWEv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="diCDpWEv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725475956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bvj3juIpEufE72sNHmGx0YFEn7GzdgZkOGAxxl5W9CE=;
	b=diCDpWEvcsO1jFqO8GeGVC8VcVmb7al7km3BNNOdsvkPFH87IlButqs47PfL7jtCEOfolb
	rD4EGEt2dxnvFiNyViUJjsuRJPVOkFq7kUOmveQY9mFmR6y5rkH6dIeWxtCK76Va7jte1c
	UYm22Sdn5aBCY9Fd5dZ/SYHUXtvLW5A=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-32SDSfB7PIGzMwQ5DYFyHQ-1; Wed, 04 Sep 2024 14:52:35 -0400
X-MC-Unique: 32SDSfB7PIGzMwQ5DYFyHQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-5356a05fc7cso1024342e87.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 11:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725475953; x=1726080753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bvj3juIpEufE72sNHmGx0YFEn7GzdgZkOGAxxl5W9CE=;
        b=skQcnoDCVbNwYzaWM1516Y/S/lCiWphd4zKJq2jThCt2WUcFotIrfPYj8JInMvrmQr
         IifKNuGNDUhxC+f9ExVoFZUEKok2VrgB1isTWdj+xW41kztjceJ5F9aK3Ztxo5bk8Zoc
         2SCKgoZsEBkKtd5VR4ck/JvHiePneF5HTAvxQwKMzlht9rW3zVx7oVMjiSfWwSbW3hTH
         B8y3X4/obMqmG+YxOSg9wsH3S2iHyjUr01L27nXPbLjLQohQkfBwBv3bXbnqcwdSX0cv
         1lY5X0hxOeaLNhBFm1vcEoUqlqTR/dfZxcAHAuCBZ0z7wea4IZGn7BNZOlyxeYf8HaOD
         /voA==
X-Forwarded-Encrypted: i=1; AJvYcCXxCo8rl97j9uEwOhZ+ibwsaT5uNk2v3K+uB+669thLev/Myx86cm0HkhrxRFHCyAW9Oh3rivVTflJWtv11brMQDCgT@vger.kernel.org
X-Gm-Message-State: AOJu0YwNbj3hjYQ4JmguXxP45qvWkZazDZKlzM/ss4OjCkIAcnanGr/A
	1SgMgoBGPg0YRLfjyh03xQlwcU/D7yIPDDqsr7Os/P6sk+vD6RVu5v5eb9Yz7Eydf1ZANE5c3wa
	h3xUOVJTaC8xEazxZV5KnEYn6ihWX4JGoGc9FA+NgPnceA1iaGJGlGdbs+PtNHO5zem3UyLo=
X-Received: by 2002:a05:651c:b20:b0:2ec:4093:ec7 with SMTP id 38308e7fff4ca-2f6108937e3mr195876091fa.30.1725475953222;
        Wed, 04 Sep 2024 11:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGst8nioB7iNb7yqulxEc/mTU11PSbtD8qX/9axRfzQjHsi1MKEdKHxp1yL35G45FZhikoTTw==
X-Received: by 2002:a05:651c:b20:b0:2ec:4093:ec7 with SMTP id 38308e7fff4ca-2f6108937e3mr195875631fa.30.1725475952436;
        Wed, 04 Sep 2024 11:52:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62038d64sm24322466b.65.2024.09.04.11.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:52:31 -0700 (PDT)
Message-ID: <42307228-7871-4ced-89da-a6612db1c7e4@redhat.com>
Date: Wed, 4 Sep 2024 20:52:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
 <20240903123830.2717196-8-suma.hegde@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240903123830.2717196-8-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/24 2:38 PM, Suma Hegde wrote:
> Separate the probes for HSMP ACPI and platform device drivers.
> 
> Provide a Kconfig option to choose between
> ACPI or the platform device based driver.
> The common code which is the core part of the HSMP driver
> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
> these two driver configs.

<snip>

> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..b10ff91e9f5a 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,45 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate
> +
> +menu "AMD HSMP Driver"
> +	depends on AMD_NB || COMPILE_TEST
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI device driver"
> +	depends on ACPI
> +	select AMD_HSMP
>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports ACPI based probing.
> +	  You may enable this, if your platform BIOS provides an ACPI object
> +	  as described in amd_hsmp.rst document.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
>  
> +config AMD_HSMP_PLAT
> +	tristate "AMD HSMP platform device driver"
> +	depends on AMD_HSMP_ACPI=n

I was about to merge this series, but this is going to cause
a regression for users running distro kernels which rely on
the old legacy probing.

So before this we had 1 driver which would auto-load on systems
which have the new ACPI description of the HSMP and which could
be manually modprobed on systems which require the legacy enumeration.

But now if linux distributions enable AMD_HSMP_ACPI then there
will be no way for users with systems which lack the ACPI description
of the HSMP to still get HSMP support.

I guess what you want here is to avoid the legacy driver loading
on systems which do have the ACPI description. But the way to do
that would be to do a runtime check for the ACPI description,
not disallow building the legacy driver altogether.

E.g. you could do the following in hsmp_plt_init() :

	if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
		pr_err("The legacy HSMP driver cannot load on this system, please use hsmp_acpi instead\n");
		return -ENODEV;
	}

I see that you also build both drivers into a single module,
yes then you cannot have both because you cannot have 2 init
functions.

Please split things into 3 modules, one shared hsmp_common.ko +
a hsmp_acpi.ko + hsmp_legacy.ko

Regards,

Hans





> +	select AMD_HSMP
> +	help
>  	  Host System Management Port (HSMP) interface is a mailbox interface
>  	  between the x86 core and the System Management Unit (SMU) firmware.
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports platform device based probing.
> +	  You may enable this, if your platform BIOS does not provide
> +	  HSMP ACPI object.
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..18d9a0d1e8c5 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,7 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
> +amd_hsmp-objs				:= hsmp.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 6f8e7962266a..766617e6adc7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -9,11 +9,15 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <asm/amd_nb.h>
> +
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
>  
> @@ -21,6 +25,10 @@
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
> @@ -200,7 +208,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	sock->sock_ind		= sock_ind;
>  	sock->dev		= dev;
>  	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
> -	hsmp_pdev.is_acpi_device	= true;
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> @@ -213,7 +220,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -236,7 +243,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -270,3 +277,72 @@ int init_acpi(struct device *dev)
>  
>  	return ret;
>  }
> +
> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> +	{ACPI_HSMP_DEVICE_HID, 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> +
> +static int hsmp_acpi_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.num_sockets = amd_nb_num();
> +		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +			return -ENODEV;
> +
> +		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +					      sizeof(*hsmp_pdev.sock),
> +					      GFP_KERNEL);
> +		if (!hsmp_pdev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	ret = init_acpi(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	if (!hsmp_pdev.is_probed) {
> +		ret = hsmp_misc_register(&pdev->dev);
> +		if (ret)
> +			return ret;
> +		hsmp_pdev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_acpi_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi-socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (hsmp_pdev.is_probed) {
> +		hsmp_misc_deregister();
> +		hsmp_pdev.is_probed = false;
> +	}
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_acpi_probe,
> +	.remove_new	= hsmp_acpi_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver(amd_hsmp_driver);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 78945750d590..5e0c9c36f435 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -15,17 +15,11 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> -
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
>  #define HSMP_STATUS_OK		0x01
> @@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>  	return ret;
>  }
>  
> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -static const struct file_operations hsmp_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= hsmp_ioctl,
> -	.compat_ioctl	= hsmp_ioctl,
> -};
> -
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count)
> @@ -414,193 +402,25 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>  	return ret;
>  }
>  
> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> -	{ACPI_HSMP_DEVICE_HID, 0},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> -
> -static bool check_acpi_support(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -
> -	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> -		return true;
> -
> -	return false;
> -}
> -
> -static int hsmp_pltdrv_probe(struct platform_device *pdev)
> -{
> -	int ret;
> -
> -	/*
> -	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> -	 * each socket, so the per socket probing, but the memory allocated for
> -	 * sockets should be contiguous to access it as an array,
> -	 * Hence allocate memory for all the sockets at once instead of allocating
> -	 * on each probe.
> -	 */
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> -					      sizeof(*hsmp_pdev.sock),
> -					      GFP_KERNEL);
> -		if (!hsmp_pdev.sock)
> -			return -ENOMEM;
> -	}
> -	if (check_acpi_support(&pdev->dev)) {
> -		ret = init_acpi(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	} else {
> -		ret = init_platform_device(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	}
> -
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> -		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> -		hsmp_pdev.mdev.fops	= &hsmp_fops;
> -		hsmp_pdev.mdev.parent	= &pdev->dev;
> -		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> -		hsmp_pdev.mdev.mode	= 0644;
> -
> -		ret = misc_register(&hsmp_pdev.mdev);
> -		if (ret)
> -			return ret;
> -
> -		hsmp_pdev.is_probed = true;
> -	}
> -
> -	return 0;
> -
> -}
> -
> -static void hsmp_pltdrv_remove(struct platform_device *pdev)
> -{
> -	/*
> -	 * We register only one misc_device even on multi socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (hsmp_pdev.is_probed) {
> -		misc_deregister(&hsmp_pdev.mdev);
> -		hsmp_pdev.is_probed = false;
> -	}
> -}
> -
> -static struct platform_driver amd_hsmp_driver = {
> -	.probe		= hsmp_pltdrv_probe,
> -	.remove_new	= hsmp_pltdrv_remove,
> -	.driver		= {
> -		.name	= DRIVER_NAME,
> -		.acpi_match_table = amd_hsmp_acpi_ids,
> -	},
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
>  };
>  
> -static struct platform_device *amd_hsmp_platdev;
> -
> -static int hsmp_plat_dev_register(void)
> +int hsmp_misc_register(struct device *dev)
>  {
> -	int ret;
> -
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> -	if (!amd_hsmp_platdev)
> -		return -ENOMEM;
> -
> -	ret = platform_device_add(amd_hsmp_platdev);
> -	if (ret)
> -		platform_device_put(amd_hsmp_platdev);
> -
> -	return ret;
> +	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	hsmp_pdev.mdev.parent	= dev;
> +	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +	hsmp_pdev.mdev.mode	= 0644;
> +
> +	return misc_register(&hsmp_pdev.mdev);
>  }
>  
> -/*
> - * This check is only needed for backward compatibility of previous platforms.
> - * All new platforms are expected to support ACPI based probing.
> - */
> -static bool legacy_hsmp_support(void)
> +void hsmp_misc_deregister(void)
>  {
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> -		return false;
> -
> -	switch (boot_cpu_data.x86) {
> -	case 0x19:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -		case 0x30 ... 0x3F:
> -		case 0x90 ... 0x9F:
> -		case 0xA0 ... 0xAF:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	case 0x1A:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	default:
> -		return false;
> -	}
> -
> -	return false;
> +	misc_deregister(&hsmp_pdev.mdev);
>  }
> -
> -static int __init hsmp_plt_init(void)
> -{
> -	int ret = -ENODEV;
> -
> -	/*
> -	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> -	 * if we have N SMN/DF interfaces that ideally means N sockets
> -	 */
> -	hsmp_pdev.num_sockets = amd_nb_num();
> -	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> -		return ret;
> -
> -	ret = platform_driver_register(&amd_hsmp_driver);
> -	if (ret)
> -		return ret;
> -
> -	if (!hsmp_pdev.is_acpi_device) {
> -		if (legacy_hsmp_support()) {
> -			/* Not ACPI device, but supports HSMP, register a plat_dev */
> -			ret = hsmp_plat_dev_register();
> -		} else {
> -			/* Not ACPI, Does not support HSMP */
> -			pr_info("HSMP is not supported on Family:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			ret = -ENODEV;
> -		}
> -		if (ret)
> -			platform_driver_unregister(&amd_hsmp_driver);
> -	}
> -
> -	return ret;
> -}
> -
> -static void __exit hsmp_plt_exit(void)
> -{
> -	platform_device_unregister(amd_hsmp_platdev);
> -	platform_driver_unregister(&amd_hsmp_driver);
> -}
> -
> -device_initcall(hsmp_plt_init);
> -module_exit(hsmp_plt_exit);
> -
> -MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> -MODULE_VERSION(DRIVER_VERSION);
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 9c5b9c263fc1..9ab50bc74676 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -52,7 +52,6 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_acpi_device;
>  	bool is_probed;
>  };
>  
> @@ -61,14 +60,13 @@ extern struct hsmp_plat_device hsmp_pdev;
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count);
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev);
> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>  int hsmp_cache_proto_ver(u16 sock_ind);
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  				  struct bin_attribute *battr, int id);
>  int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
> -int init_platform_device(struct device *dev);
> -int init_acpi(struct device *dev);
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
> +void hsmp_misc_deregister(void);
> +int hsmp_misc_register(struct device *dev);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e18cf82478a0..e49b53f8c5e3 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -12,11 +12,16 @@
>  #include <asm/amd_nb.h>
>  
>  #include <linux/device.h>
> +#include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>   * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> @@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  	return ret;
>  }
>  
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  {
>  	const struct attribute_group **hsmp_attr_grps;
>  	struct attribute_group *attr_grp;
> @@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
>  	return false;
>  }
>  
> -int init_platform_device(struct device *dev)
> +static int init_platform_device(struct device *dev)
>  {
>  	struct hsmp_socket *sock;
>  	int ret, i;
> @@ -134,3 +145,132 @@ int init_platform_device(struct device *dev)
>  
>  	return 0;
>  }
> +
> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +				      sizeof(*hsmp_pdev.sock),
> +				      GFP_KERNEL);
> +	if (!hsmp_pdev.sock)
> +		return -ENOMEM;
> +
> +	ret = init_platform_device(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	return hsmp_misc_register(&pdev->dev);
> +}
> +
> +static void hsmp_pltdrv_remove(struct platform_device *pdev)
> +{
> +	hsmp_misc_deregister();
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_pltdrv_probe,
> +	.remove_new	= hsmp_pltdrv_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +	},
> +};
> +
> +static struct platform_device *amd_hsmp_platdev;
> +
> +static int hsmp_plat_dev_register(void)
> +{
> +	int ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> +	if (!amd_hsmp_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret)
> +		platform_device_put(amd_hsmp_platdev);
> +
> +	return ret;
> +}
> +
> +/*
> + * This check is only needed for backward compatibility of previous platforms.
> + * All new platforms are expected to support ACPI based probing.
> + */
> +static bool legacy_hsmp_support(void)
> +{
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return false;
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +		case 0x30 ... 0x3F:
> +		case 0x90 ... 0x9F:
> +		case 0xA0 ... 0xAF:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	default:
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
> +static int __init hsmp_plt_init(void)
> +{
> +	int ret = -ENODEV;
> +
> +	if (!legacy_hsmp_support()) {
> +		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		return ret;
> +	}
> +
> +	/*
> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * if we have N SMN/DF interfaces that ideally means N sockets
> +	 */
> +	hsmp_pdev.num_sockets = amd_nb_num();
> +	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +		return ret;
> +
> +	ret = platform_driver_register(&amd_hsmp_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
> +
> +	return ret;
> +}
> +
> +static void __exit hsmp_plt_exit(void)
> +{
> +	platform_device_unregister(amd_hsmp_platdev);
> +	platform_driver_unregister(&amd_hsmp_driver);
> +}
> +
> +device_initcall(hsmp_plt_init);
> +module_exit(hsmp_plt_exit);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL");

