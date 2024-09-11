Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882BB1714C0
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726048851; cv=none; b=AQs1MaCz4dQsIr+Ye71gmIiBLz0gJ4R0yU6KRrFcnlVGZIrWPrnOs5C7jasIhfWpSGGs4VxiPPHqSiFU8LF+sQ26PRh/kKt0ZJlIEi8363tcaOGZ4QKZ8TlwMxSki5jicxn8Oxq+IoO5RYJVnR0FbWiFpfgF69D40h7UnMw0LMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726048851; c=relaxed/simple;
	bh=se/00SVIcvQ1CSaxjjLx58CPgxXr8dUO80NzY2CO+NM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0nsulJXrlgZ0dz2Dh5n33RriwBaHwkO6G8H2+PsJRPvx+6BBLhFfn4SVTOjp/xEVT5IMM6mT/YI6BLVZNEjhp1vyHB1GO5Rcc3B4vMNmCUqmG4sZhKLpXGcw++EixMIR1hvasSXMKa1jqCbhalzRkHIEp2G1MArStUfvkbjNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FhQsjLGG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FhQsjLGG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726048847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EtrO/s1FdhJ9487bduuPgP55oyxhbrJfcUTuF/swM5w=;
	b=FhQsjLGGS3kaiOUY08Uu7qPm/83eF3bpRdHC1EVOjpcCVUvw8bHN8hE5DpTQwXFzBwvzUM
	ZHcp4oC3v4OhopEDLplPxmO1/VTxvGsgwepZ50N/qEuYwbGj1uKfFwawNTD1r7WixWug2N
	PSlyI11mqWt08LeRhlUi/0Pip82X3h0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-m0uARlCtMoOa6AQOfo2FLw-1; Wed, 11 Sep 2024 06:00:46 -0400
X-MC-Unique: m0uARlCtMoOa6AQOfo2FLw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a8a8ee13b44so299538566b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Sep 2024 03:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726048845; x=1726653645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtrO/s1FdhJ9487bduuPgP55oyxhbrJfcUTuF/swM5w=;
        b=uZNMlvyQqWT9n72yw7tqnbUwr+UGpVX3MGB5Dz7mp8N+4r+/5E7wf3m4X4lTfQcwHG
         i9BI1FWiqJaVb+z2E4GgwMo10dlFFs8/MEqLbVtGaRcdyIB0D2/pq6GbsiK3DyRD8dLw
         Qdq0dB5p6eQgj3Z7Qr4ZBF3ZvGoXLdf2F/lAOoHjbI+OT2WK9VxmjOjmeQxBOBXhGiIs
         RcNOQGNQTHb3BHjRnqgLSug4Cn3xpmI4G3Vm2FCITXt2UMl5umEQXsSTmjvdM0piC7R4
         IhfKesQH9Xo48gKgQfTXmRT07dWB+TqccyVP9FQ7iT7xCltpchVBfHNEY0bzC4f0/r83
         RNaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDVGEWZyDMjtaMwBTjKJmuKwoWbUD09TgNHD4CB7hNecvKHnx69DSY0t3csvhr0JHxAkA1sw84D6rZ2agYdXnIcSP+@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/JRRjWtWDb/4cdZCict0gD/QsC3ih9v1BpfhciPkU24apoFM
	ssLXDXnEP7n31njZHFyWAib+1TrUJWBccAg1rqPaTFSkmArhoV5t+4/K7GPhYi9bR6OESy3PqbD
	TE/JZQdCojcEF8qJkCpP/kg/qeHDT0dG33LLFZiuuBUv1aapi/UrWuncO57BQ0s3kiNyomqE=
X-Received: by 2002:a17:907:d94:b0:a7a:8c55:6b2 with SMTP id a640c23a62f3a-a8ffab187f4mr306465466b.14.1726048844499;
        Wed, 11 Sep 2024 03:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtvwOGqnUICbkb3901+hG1ESLbVS2pB1XrnbzgpoxSZfmF5C4wj0svDHa/7sum4IZvXFK30w==
X-Received: by 2002:a17:907:d94:b0:a7a:8c55:6b2 with SMTP id a640c23a62f3a-a8ffab187f4mr306462066b.14.1726048843753;
        Wed, 11 Sep 2024 03:00:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a2c441sm594862466b.90.2024.09.11.03.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 03:00:43 -0700 (PDT)
Message-ID: <637498fa-360f-40d2-b63f-f59982edd23c@redhat.com>
Date: Wed, 11 Sep 2024 12:00:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
To: Suma Hegde <Suma.Hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240903123830.2717196-1-suma.hegde@amd.com>
 <20240903123830.2717196-8-suma.hegde@amd.com>
 <42307228-7871-4ced-89da-a6612db1c7e4@redhat.com>
 <8108fabf-0a74-40d0-bf60-485e26c9065b@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <8108fabf-0a74-40d0-bf60-485e26c9065b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Suma,

On 9/11/24 8:12 AM, Suma Hegde wrote:
> Hi Hans,
> 
> On 9/5/2024 12:22 AM, Hans de Goede wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> Hi,
>>
>> On 9/3/24 2:38 PM, Suma Hegde wrote:
>>> Separate the probes for HSMP ACPI and platform device drivers.
>>>
>>> Provide a Kconfig option to choose between
>>> ACPI or the platform device based driver.
>>> The common code which is the core part of the HSMP driver
>>> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
>>> these two driver configs.
>> <snip>
>>
>>> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
>>> index b55d4ed9bceb..b10ff91e9f5a 100644
>>> --- a/drivers/platform/x86/amd/hsmp/Kconfig
>>> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
>>> @@ -4,14 +4,45 @@
>>>   #
>>>
>>>   config AMD_HSMP
>>> -     tristate "AMD HSMP Driver"
>>> -     depends on AMD_NB && X86_64 && ACPI
>>> +     tristate
>>> +
>>> +menu "AMD HSMP Driver"
>>> +     depends on AMD_NB || COMPILE_TEST
>>> +
>>> +config AMD_HSMP_ACPI
>>> +     tristate "AMD HSMP ACPI device driver"
>>> +     depends on ACPI
>>> +     select AMD_HSMP
>>>        help
>>> +       Host System Management Port (HSMP) interface is a mailbox interface
>>> +       between the x86 core and the System Management Unit (SMU) firmware.
>>>          The driver provides a way for user space tools to monitor and manage
>>> -       system management functionality on EPYC server CPUs from AMD.
>>> +       system management functionality on EPYC and MI300A server CPUs
>>> +       from AMD.
>>> +
>>> +       This option supports ACPI based probing.
>>> +       You may enable this, if your platform BIOS provides an ACPI object
>>> +       as described in amd_hsmp.rst document.
>>> +
>>> +       If you choose to compile this driver as a module the module will be
>>> +       called amd_hsmp.
>>>
>>> +config AMD_HSMP_PLAT
>>> +     tristate "AMD HSMP platform device driver"
>>> +     depends on AMD_HSMP_ACPI=n
>> I was about to merge this series, but this is going to cause
>> a regression for users running distro kernels which rely on
>> the old legacy probing.
>>
>> So before this we had 1 driver which would auto-load on systems
>> which have the new ACPI description of the HSMP and which could
>> be manually modprobed on systems which require the legacy enumeration.
>>
>> But now if linux distributions enable AMD_HSMP_ACPI then there
>> will be no way for users with systems which lack the ACPI description
>> of the HSMP to still get HSMP support.
>>
>> I guess what you want here is to avoid the legacy driver loading
>> on systems which do have the ACPI description. But the way to do
>> that would be to do a runtime check for the ACPI description,
>> not disallow building the legacy driver altogether.
>>
>> E.g. you could do the following in hsmp_plt_init() :
>>
>>          if (acpi_dev_present(ACPI_HSMP_DEVICE_HID, NULL, -1)) {
>>                  pr_err("The legacy HSMP driver cannot load on this system, please use hsmp_acpi instead\n");
>>                  return -ENODEV;
>>          }
>>
>> I see that you also build both drivers into a single module,
>> yes then you cannot have both because you cannot have 2 init
>> functions.
>>
>> Please split things into 3 modules, one shared hsmp_common.ko +
>> a hsmp_acpi.ko + hsmp_legacy.ko
> 
> Ok, I will keep Kconfig as is with 3 config symbols, but will remove "depends on AMD_HSMP_ACPI=n" and modify the Makefile to build 3 modules.
> 
> hsmp_common.ko, + amd_hsmp.ko (instead of hsmp_legacy.ko, keeping name as amd_hsmp.ko to keep legacy name for the legacy module).

Ok, keeping the legacy module name the same sounds good to me.

> + hsmp_acpi.ko.
> 
> Also will add a check acpi_dev_present() as mentioned above in hsmp_plt_init().
> 
> Because of the change in config symbols, Linux distributions have to enable either AMD_HSMP_ACPI or AMD_HSMP_PLAT or both to get HSMP modules compiled.

Ack, distros need to change the config symbols all the time, so that is fine.

Regards,

Hans





>>> +     select AMD_HSMP
>>> +     help
>>>          Host System Management Port (HSMP) interface is a mailbox interface
>>>          between the x86 core and the System Management Unit (SMU) firmware.
>>> +       The driver provides a way for user space tools to monitor and manage
>>> +       system management functionality on EPYC and MI300A server CPUs
>>> +       from AMD.
>>> +
>>> +       This option supports platform device based probing.
>>> +       You may enable this, if your platform BIOS does not provide
>>> +       HSMP ACPI object.
>>>
>>>          If you choose to compile this driver as a module the module will be
>>>          called amd_hsmp.
>>> +
>>> +endmenu
>>> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
>>> index 0cc92865c0a2..18d9a0d1e8c5 100644
>>> --- a/drivers/platform/x86/amd/hsmp/Makefile
>>> +++ b/drivers/platform/x86/amd/hsmp/Makefile
>>> @@ -4,5 +4,7 @@
>>>   # AMD HSMP Driver
>>>   #
>>>
>>> -obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>>> -amd_hsmp-objs                        := hsmp.o plat.o acpi.o
>>> +obj-$(CONFIG_AMD_HSMP)                       += amd_hsmp.o
>>> +amd_hsmp-objs                                := hsmp.o
>>> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)     += plat.o
>>> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)     += acpi.o
>>> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
>>> index 6f8e7962266a..766617e6adc7 100644
>>> --- a/drivers/platform/x86/amd/hsmp/acpi.c
>>> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
>>> @@ -9,11 +9,15 @@
>>>
>>>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>>
>>> +#include <asm/amd_nb.h>
>>> +
>>>   #include <linux/acpi.h>
>>>   #include <linux/device.h>
>>>   #include <linux/dev_printk.h>
>>>   #include <linux/ioport.h>
>>>   #include <linux/kstrtox.h>
>>> +#include <linux/module.h>
>>> +#include <linux/platform_device.h>
>>>   #include <linux/sysfs.h>
>>>   #include <linux/uuid.h>
>>>
>>> @@ -21,6 +25,10 @@
>>>
>>>   #include "hsmp.h"
>>>
>>> +#define DRIVER_NAME          "amd_hsmp"
>>> +#define DRIVER_VERSION               "2.3"
>>> +#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>>> +
>>>   /* These are the strings specified in ACPI table */
>>>   #define MSG_IDOFF_STR                "MsgIdOffset"
>>>   #define MSG_ARGOFF_STR               "MsgArgOffset"
>>> @@ -200,7 +208,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>>        sock->sock_ind          = sock_ind;
>>>        sock->dev               = dev;
>>>        sock->amd_hsmp_rdwr     = amd_hsmp_acpi_rdwr;
>>> -     hsmp_pdev.is_acpi_device        = true;
>>>
>>>        sema_init(&sock->hsmp_sem, 1);
>>>
>>> @@ -213,7 +220,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>>>        return hsmp_read_acpi_dsd(sock);
>>>   }
>>>
>>> -int hsmp_create_acpi_sysfs_if(struct device *dev)
>>> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>>>   {
>>>        struct attribute_group *attr_grp;
>>>        u16 sock_ind;
>>> @@ -236,7 +243,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>>>        return devm_device_add_group(dev, attr_grp);
>>>   }
>>>
>>> -int init_acpi(struct device *dev)
>>> +static int init_acpi(struct device *dev)
>>>   {
>>>        u16 sock_ind;
>>>        int ret;
>>> @@ -270,3 +277,72 @@ int init_acpi(struct device *dev)
>>>
>>>        return ret;
>>>   }
>>> +
>>> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>> +     {ACPI_HSMP_DEVICE_HID, 0},
>>> +     {}
>>> +};
>>> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>> +
>>> +static int hsmp_acpi_probe(struct platform_device *pdev)
>>> +{
>>> +     int ret;
>>> +
>>> +     if (!hsmp_pdev.is_probed) {
>>> +             hsmp_pdev.num_sockets = amd_nb_num();
>>> +             if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>>> +                     return -ENODEV;
>>> +
>>> +             hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>>> +                                           sizeof(*hsmp_pdev.sock),
>>> +                                           GFP_KERNEL);
>>> +             if (!hsmp_pdev.sock)
>>> +                     return -ENOMEM;
>>> +     }
>>> +
>>> +     ret = init_acpi(&pdev->dev);
>>> +     if (ret) {
>>> +             dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>>> +     if (ret)
>>> +             dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>>> +
>>> +     if (!hsmp_pdev.is_probed) {
>>> +             ret = hsmp_misc_register(&pdev->dev);
>>> +             if (ret)
>>> +                     return ret;
>>> +             hsmp_pdev.is_probed = true;
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void hsmp_acpi_remove(struct platform_device *pdev)
>>> +{
>>> +     /*
>>> +      * We register only one misc_device even on multi-socket system.
>>> +      * So, deregister should happen only once.
>>> +      */
>>> +     if (hsmp_pdev.is_probed) {
>>> +             hsmp_misc_deregister();
>>> +             hsmp_pdev.is_probed = false;
>>> +     }
>>> +}
>>> +
>>> +static struct platform_driver amd_hsmp_driver = {
>>> +     .probe          = hsmp_acpi_probe,
>>> +     .remove_new     = hsmp_acpi_remove,
>>> +     .driver         = {
>>> +             .name   = DRIVER_NAME,
>>> +             .acpi_match_table = amd_hsmp_acpi_ids,
>>> +     },
>>> +};
>>> +
>>> +module_platform_driver(amd_hsmp_driver);
>>> +
>>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>>> +MODULE_VERSION(DRIVER_VERSION);
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> index 78945750d590..5e0c9c36f435 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
>>> @@ -15,17 +15,11 @@
>>>   #include <linux/acpi.h>
>>>   #include <linux/delay.h>
>>>   #include <linux/device.h>
>>> -#include <linux/module.h>
>>> -#include <linux/platform_device.h>
>>>   #include <linux/semaphore.h>
>>>   #include <linux/sysfs.h>
>>>
>>>   #include "hsmp.h"
>>>
>>> -#define DRIVER_NAME          "amd_hsmp"
>>> -#define DRIVER_VERSION               "2.2"
>>> -#define ACPI_HSMP_DEVICE_HID "AMDI0097"
>>> -
>>>   /* HSMP Status / Error codes */
>>>   #define HSMP_STATUS_NOT_READY        0x00
>>>   #define HSMP_STATUS_OK               0x01
>>> @@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>>>        return ret;
>>>   }
>>>
>>> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>>   {
>>>        int __user *arguser = (int  __user *)arg;
>>>        struct hsmp_message msg = { 0 };
>>> @@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>>>        return 0;
>>>   }
>>>
>>> -static const struct file_operations hsmp_fops = {
>>> -     .owner          = THIS_MODULE,
>>> -     .unlocked_ioctl = hsmp_ioctl,
>>> -     .compat_ioctl   = hsmp_ioctl,
>>> -};
>>> -
>>>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>>                             struct bin_attribute *bin_attr, char *buf,
>>>                             loff_t off, size_t count)
>>> @@ -414,193 +402,25 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>>>        return ret;
>>>   }
>>>
>>> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>>> -     {ACPI_HSMP_DEVICE_HID, 0},
>>> -     {}
>>> -};
>>> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>>> -
>>> -static bool check_acpi_support(struct device *dev)
>>> -{
>>> -     struct acpi_device *adev = ACPI_COMPANION(dev);
>>> -
>>> -     if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
>>> -             return true;
>>> -
>>> -     return false;
>>> -}
>>> -
>>> -static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>> -{
>>> -     int ret;
>>> -
>>> -     /*
>>> -      * On ACPI supported BIOS, there is an ACPI HSMP device added for
>>> -      * each socket, so the per socket probing, but the memory allocated for
>>> -      * sockets should be contiguous to access it as an array,
>>> -      * Hence allocate memory for all the sockets at once instead of allocating
>>> -      * on each probe.
>>> -      */
>>> -     if (!hsmp_pdev.is_probed) {
>>> -             hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>>> -                                           sizeof(*hsmp_pdev.sock),
>>> -                                           GFP_KERNEL);
>>> -             if (!hsmp_pdev.sock)
>>> -                     return -ENOMEM;
>>> -     }
>>> -     if (check_acpi_support(&pdev->dev)) {
>>> -             ret = init_acpi(&pdev->dev);
>>> -             if (ret) {
>>> -                     dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> -                     return ret;
>>> -             }
>>> -             ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
>>> -             if (ret)
>>> -                     dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>>> -     } else {
>>> -             ret = init_platform_device(&pdev->dev);
>>> -             if (ret) {
>>> -                     dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> -                     return ret;
>>> -             }
>>> -             ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>>> -             if (ret)
>>> -                     dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>>> -     }
>>> -
>>> -     if (!hsmp_pdev.is_probed) {
>>> -             hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>> -             hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>> -             hsmp_pdev.mdev.fops     = &hsmp_fops;
>>> -             hsmp_pdev.mdev.parent   = &pdev->dev;
>>> -             hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>> -             hsmp_pdev.mdev.mode     = 0644;
>>> -
>>> -             ret = misc_register(&hsmp_pdev.mdev);
>>> -             if (ret)
>>> -                     return ret;
>>> -
>>> -             hsmp_pdev.is_probed = true;
>>> -     }
>>> -
>>> -     return 0;
>>> -
>>> -}
>>> -
>>> -static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>> -{
>>> -     /*
>>> -      * We register only one misc_device even on multi socket system.
>>> -      * So, deregister should happen only once.
>>> -      */
>>> -     if (hsmp_pdev.is_probed) {
>>> -             misc_deregister(&hsmp_pdev.mdev);
>>> -             hsmp_pdev.is_probed = false;
>>> -     }
>>> -}
>>> -
>>> -static struct platform_driver amd_hsmp_driver = {
>>> -     .probe          = hsmp_pltdrv_probe,
>>> -     .remove_new     = hsmp_pltdrv_remove,
>>> -     .driver         = {
>>> -             .name   = DRIVER_NAME,
>>> -             .acpi_match_table = amd_hsmp_acpi_ids,
>>> -     },
>>> +static const struct file_operations hsmp_fops = {
>>> +     .owner          = THIS_MODULE,
>>> +     .unlocked_ioctl = hsmp_ioctl,
>>> +     .compat_ioctl   = hsmp_ioctl,
>>>   };
>>>
>>> -static struct platform_device *amd_hsmp_platdev;
>>> -
>>> -static int hsmp_plat_dev_register(void)
>>> +int hsmp_misc_register(struct device *dev)
>>>   {
>>> -     int ret;
>>> -
>>> -     amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>>> -     if (!amd_hsmp_platdev)
>>> -             return -ENOMEM;
>>> -
>>> -     ret = platform_device_add(amd_hsmp_platdev);
>>> -     if (ret)
>>> -             platform_device_put(amd_hsmp_platdev);
>>> -
>>> -     return ret;
>>> +     hsmp_pdev.mdev.name     = HSMP_CDEV_NAME;
>>> +     hsmp_pdev.mdev.minor    = MISC_DYNAMIC_MINOR;
>>> +     hsmp_pdev.mdev.fops     = &hsmp_fops;
>>> +     hsmp_pdev.mdev.parent   = dev;
>>> +     hsmp_pdev.mdev.nodename = HSMP_DEVNODE_NAME;
>>> +     hsmp_pdev.mdev.mode     = 0644;
>>> +
>>> +     return misc_register(&hsmp_pdev.mdev);
>>>   }
>>>
>>> -/*
>>> - * This check is only needed for backward compatibility of previous platforms.
>>> - * All new platforms are expected to support ACPI based probing.
>>> - */
>>> -static bool legacy_hsmp_support(void)
>>> +void hsmp_misc_deregister(void)
>>>   {
>>> -     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>>> -             return false;
>>> -
>>> -     switch (boot_cpu_data.x86) {
>>> -     case 0x19:
>>> -             switch (boot_cpu_data.x86_model) {
>>> -             case 0x00 ... 0x1F:
>>> -             case 0x30 ... 0x3F:
>>> -             case 0x90 ... 0x9F:
>>> -             case 0xA0 ... 0xAF:
>>> -                     return true;
>>> -             default:
>>> -                     return false;
>>> -             }
>>> -     case 0x1A:
>>> -             switch (boot_cpu_data.x86_model) {
>>> -             case 0x00 ... 0x1F:
>>> -                     return true;
>>> -             default:
>>> -                     return false;
>>> -             }
>>> -     default:
>>> -             return false;
>>> -     }
>>> -
>>> -     return false;
>>> +     misc_deregister(&hsmp_pdev.mdev);
>>>   }
>>> -
>>> -static int __init hsmp_plt_init(void)
>>> -{
>>> -     int ret = -ENODEV;
>>> -
>>> -     /*
>>> -      * amd_nb_num() returns number of SMN/DF interfaces present in the system
>>> -      * if we have N SMN/DF interfaces that ideally means N sockets
>>> -      */
>>> -     hsmp_pdev.num_sockets = amd_nb_num();
>>> -     if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>>> -             return ret;
>>> -
>>> -     ret = platform_driver_register(&amd_hsmp_driver);
>>> -     if (ret)
>>> -             return ret;
>>> -
>>> -     if (!hsmp_pdev.is_acpi_device) {
>>> -             if (legacy_hsmp_support()) {
>>> -                     /* Not ACPI device, but supports HSMP, register a plat_dev */
>>> -                     ret = hsmp_plat_dev_register();
>>> -             } else {
>>> -                     /* Not ACPI, Does not support HSMP */
>>> -                     pr_info("HSMP is not supported on Family:%x model:%x\n",
>>> -                             boot_cpu_data.x86, boot_cpu_data.x86_model);
>>> -                     ret = -ENODEV;
>>> -             }
>>> -             if (ret)
>>> -                     platform_driver_unregister(&amd_hsmp_driver);
>>> -     }
>>> -
>>> -     return ret;
>>> -}
>>> -
>>> -static void __exit hsmp_plt_exit(void)
>>> -{
>>> -     platform_device_unregister(amd_hsmp_platdev);
>>> -     platform_driver_unregister(&amd_hsmp_driver);
>>> -}
>>> -
>>> -device_initcall(hsmp_plt_init);
>>> -module_exit(hsmp_plt_exit);
>>> -
>>> -MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>>> -MODULE_VERSION(DRIVER_VERSION);
>>> -MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
>>> index 9c5b9c263fc1..9ab50bc74676 100644
>>> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
>>> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
>>> @@ -52,7 +52,6 @@ struct hsmp_plat_device {
>>>        struct hsmp_socket *sock;
>>>        u32 proto_ver;
>>>        u16 num_sockets;
>>> -     bool is_acpi_device;
>>>        bool is_probed;
>>>   };
>>>
>>> @@ -61,14 +60,13 @@ extern struct hsmp_plat_device hsmp_pdev;
>>>   ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>>>                             struct bin_attribute *bin_attr, char *buf,
>>>                             loff_t off, size_t count);
>>> -int hsmp_create_non_acpi_sysfs_if(struct device *dev);
>>> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>>>   int hsmp_cache_proto_ver(u16 sock_ind);
>>>   umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>>>                                  struct bin_attribute *battr, int id);
>>>   int hsmp_create_attr_list(struct attribute_group *attr_grp,
>>>                          struct device *dev, u16 sock_ind);
>>>   int hsmp_test(u16 sock_ind, u32 value);
>>> -int init_platform_device(struct device *dev);
>>> -int init_acpi(struct device *dev);
>>> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
>>> +void hsmp_misc_deregister(void);
>>> +int hsmp_misc_register(struct device *dev);
>>>   #endif /* HSMP_H */
>>> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
>>> index e18cf82478a0..e49b53f8c5e3 100644
>>> --- a/drivers/platform/x86/amd/hsmp/plat.c
>>> +++ b/drivers/platform/x86/amd/hsmp/plat.c
>>> @@ -12,11 +12,16 @@
>>>   #include <asm/amd_nb.h>
>>>
>>>   #include <linux/device.h>
>>> +#include <linux/module.h>
>>>   #include <linux/pci.h>
>>> +#include <linux/platform_device.h>
>>>   #include <linux/sysfs.h>
>>>
>>>   #include "hsmp.h"
>>>
>>> +#define DRIVER_NAME          "amd_hsmp"
>>> +#define DRIVER_VERSION               "2.3"
>>> +
>>>   /*
>>>    * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>>>    * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
>>> @@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>>>        return ret;
>>>   }
>>>
>>> -int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>>> +static const struct file_operations hsmp_fops = {
>>> +     .owner          = THIS_MODULE,
>>> +     .unlocked_ioctl = hsmp_ioctl,
>>> +     .compat_ioctl   = hsmp_ioctl,
>>> +};
>>> +
>>> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>>>   {
>>>        const struct attribute_group **hsmp_attr_grps;
>>>        struct attribute_group *attr_grp;
>>> @@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
>>>        return false;
>>>   }
>>>
>>> -int init_platform_device(struct device *dev)
>>> +static int init_platform_device(struct device *dev)
>>>   {
>>>        struct hsmp_socket *sock;
>>>        int ret, i;
>>> @@ -134,3 +145,132 @@ int init_platform_device(struct device *dev)
>>>
>>>        return 0;
>>>   }
>>> +
>>> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
>>> +{
>>> +     int ret;
>>> +
>>> +     hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
>>> +                                   sizeof(*hsmp_pdev.sock),
>>> +                                   GFP_KERNEL);
>>> +     if (!hsmp_pdev.sock)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = init_platform_device(&pdev->dev);
>>> +     if (ret) {
>>> +             dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
>>> +             return ret;
>>> +     }
>>> +
>>> +     ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
>>> +     if (ret)
>>> +             dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
>>> +
>>> +     return hsmp_misc_register(&pdev->dev);
>>> +}
>>> +
>>> +static void hsmp_pltdrv_remove(struct platform_device *pdev)
>>> +{
>>> +     hsmp_misc_deregister();
>>> +}
>>> +
>>> +static struct platform_driver amd_hsmp_driver = {
>>> +     .probe          = hsmp_pltdrv_probe,
>>> +     .remove_new     = hsmp_pltdrv_remove,
>>> +     .driver         = {
>>> +             .name   = DRIVER_NAME,
>>> +     },
>>> +};
>>> +
>>> +static struct platform_device *amd_hsmp_platdev;
>>> +
>>> +static int hsmp_plat_dev_register(void)
>>> +{
>>> +     int ret;
>>> +
>>> +     amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
>>> +     if (!amd_hsmp_platdev)
>>> +             return -ENOMEM;
>>> +
>>> +     ret = platform_device_add(amd_hsmp_platdev);
>>> +     if (ret)
>>> +             platform_device_put(amd_hsmp_platdev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +/*
>>> + * This check is only needed for backward compatibility of previous platforms.
>>> + * All new platforms are expected to support ACPI based probing.
>>> + */
>>> +static bool legacy_hsmp_support(void)
>>> +{
>>> +     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
>>> +             return false;
>>> +
>>> +     switch (boot_cpu_data.x86) {
>>> +     case 0x19:
>>> +             switch (boot_cpu_data.x86_model) {
>>> +             case 0x00 ... 0x1F:
>>> +             case 0x30 ... 0x3F:
>>> +             case 0x90 ... 0x9F:
>>> +             case 0xA0 ... 0xAF:
>>> +                     return true;
>>> +             default:
>>> +                     return false;
>>> +             }
>>> +     case 0x1A:
>>> +             switch (boot_cpu_data.x86_model) {
>>> +             case 0x00 ... 0x1F:
>>> +                     return true;
>>> +             default:
>>> +                     return false;
>>> +             }
>>> +     default:
>>> +             return false;
>>> +     }
>>> +
>>> +     return false;
>>> +}
>>> +
>>> +static int __init hsmp_plt_init(void)
>>> +{
>>> +     int ret = -ENODEV;
>>> +
>>> +     if (!legacy_hsmp_support()) {
>>> +             pr_info("HSMP is not supported on Family:%x model:%x\n",
>>> +                     boot_cpu_data.x86, boot_cpu_data.x86_model);
>>> +             return ret;
>>> +     }
>>> +
>>> +     /*
>>> +      * amd_nb_num() returns number of SMN/DF interfaces present in the system
>>> +      * if we have N SMN/DF interfaces that ideally means N sockets
>>> +      */
>>> +     hsmp_pdev.num_sockets = amd_nb_num();
>>> +     if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
>>> +             return ret;
>>> +
>>> +     ret = platform_driver_register(&amd_hsmp_driver);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = hsmp_plat_dev_register();
>>> +     if (ret)
>>> +             platform_driver_unregister(&amd_hsmp_driver);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void __exit hsmp_plt_exit(void)
>>> +{
>>> +     platform_device_unregister(amd_hsmp_platdev);
>>> +     platform_driver_unregister(&amd_hsmp_driver);
>>> +}
>>> +
>>> +device_initcall(hsmp_plt_init);
>>> +module_exit(hsmp_plt_exit);
>>> +
>>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>>> +MODULE_VERSION(DRIVER_VERSION);
>>> +MODULE_LICENSE("GPL");
> 

