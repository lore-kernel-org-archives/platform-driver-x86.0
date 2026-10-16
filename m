Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF946D2A9;
	Fri, 16 Oct 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792148571; cv=none; b=A+NWTQDCQSQVRPfB6hXwJLz6LPX3xscqBwfSfB5WQAXY/cO+Mo8CxaAPugZ7aL3/VTbjTk9rQuuiuN3TvSXx1w06vJRn38+9YhvAhHEDASBvAQZuh7IVYZ/dJjgiAsOeEZWxvWJ3V2Z/CQc6DEVfnKEodVLSWc+7YCOf9XfHBRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792148571; c=relaxed/simple;
	bh=cd9NHChjukRyOmLhluj4QgQvN2dgP1Kr8gC4ABon+98=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fj2idNyZrulGSfLVUg+j4KlXRrEJntG1ns14yL4MubXjl5yPPmyF7xWWJItDYSIicS0L3Cd+RSG4dCwnbbU3V+mGGeF6j0cxHWx8a0lyj4qkQ0icGANHO940wT6poMxsdGeOchikNOV0CsfARVAHdXrvUSYc3iqwvgDxFRQL1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihF6dBbW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihF6dBbW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792148571; x=1823684571;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cd9NHChjukRyOmLhluj4QgQvN2dgP1Kr8gC4ABon+98=;
  b=ihF6dBbW7PIJKcKOMamYc4rutfybYnteeEOx6N38Eq8/iza78MyCuL0p
   oCFP3C1OYDedywcW6geMfivc2wU89JV9rNFQujnD8dGC37AVWZNh6YLCu
   vNKCQHRVwCKXvc7AWMkvyuYRAfnxuw8TbOiuXK4W4lWC/FEnoNhjJcrsx
   /IdBPzHq4b9nf/uvlKRB1T9sncRznszh5+G3YoTmyKOiuEUmeoRHBM9mp
   wTgHJcu97/L97Yu2uJViU8BJrWQ2ueveKeXnQPtyCvsRo+0n8zoK7vv+8
   NOsaSXLC8q0ivaRodE4+uyfUblnvW9c4hNbQGz+2PtqirMLTqWCkweCJj
   w==;
X-CSE-ConnectionGUID: s7zTbn0JStaQ6RxzCXJk/Q==
X-CSE-MsgGUID: 3IswGisASVanC9zX72kZgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="829746"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="829746"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:02:50 -0700
X-CSE-ConnectionGUID: uX//t1EwQLuzSr+4ziQVIA==
X-CSE-MsgGUID: vapTHZbHSPSx4qTZZxxgnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="2284183"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 04:02:46 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 16 Oct 2026 14:02:42 +0300 (EEST)
To: Erwan Velu <erwanaliasr1@gmail.com>
cc: platform-driver-x86@vger.kernel.org, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
    Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
In-Reply-To: <20261007125908.321186-3-erwanaliasr1@gmail.com>
Message-ID: <0ce3cf8c-2e00-835c-caed-c0b099a70c3b@linux.intel.com>
References: <20261007125908.321186-1-erwanaliasr1@gmail.com> <20261007125908.321186-3-erwanaliasr1@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 7 Oct 2026, Erwan Velu wrote:

> From: Erwan Velu <e.velu@criteo.com>
> 
> The per-socket attributes live under /sys/devices/platform/AMDI0097:0X
> with the ACPI driver, while the platform driver uses
> /sys/devices/platform/amd_hsmp/socketN. Userspace has to know which
> driver probed to find them.
> 
> Add a driver-independent /sys/devices/amd_hsmp/socketN device per
> socket carrying hsmp_sock_groups, and register it from the ACPI driver.
> The AMDI0097:0X attributes are kept, as they are documented ABI.
> 
> The socket device is unregistered before remove takes hsmp_sock_rwsem:
> device_unregister() waits for in-flight sysfs reads, which take the
> rwsem for read.
> 
> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> ---
>  Documentation/arch/x86/amd_hsmp.rst   |   8 +-
>  drivers/platform/x86/amd/hsmp/acpi.c  |   6 ++
>  drivers/platform/x86/amd/hsmp/hsmp.h  |   5 ++
>  drivers/platform/x86/amd/hsmp/sysfs.c | 112 +++++++++++++++++++++++++-
>  4 files changed, 129 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index fa1fc240e212..aba4a009bd8d 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -57,6 +57,12 @@ In-kernel integration:
>  HSMP sysfs interface
>  ====================
>  
> +The ACPI driver exposes its per socket sysfs files in a per socket
> +directory created at /sys/devices/amd_hsmp/socket%d/.
> +
> +For backward compatibility, the files are also available under
> +/sys/devices/platform/AMDI0097:0X/.
> +
>  1. Metrics table binary sysfs
>  
>  AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
> @@ -80,7 +86,7 @@ The same is defined in the amd_hsmp.h header.
>  
>  2. HSMP telemetry sysfs files
>  
> -Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
> +Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
>  
>  * c0_residency_input: Percentage of cores in C0 state.
>  * prochot_status: Reports 1 if the processor is at thermal threshold value,
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index d76979baffa8..468d4b1515db 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -441,6 +441,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>  	}
>  
> +	ret = hsmp_sock_dev_register(dev_get_drvdata(&pdev->dev));
> +	if (ret)
> +		dev_warn(&pdev->dev, "Failed to register HSMP socket device: %d\n", ret);
> +
>  	return 0;
>  }
>  
> @@ -448,6 +452,8 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
>  	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>  
> +	hsmp_sock_dev_unregister(sock);
> +
>  	/*
>  	 * Serialize the kref_put() and any release it triggers against a
>  	 * concurrent probe, and drain the data plane for the whole
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 692721e2e6d3..f638edd7768b 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -28,6 +28,7 @@
>  
>  #define HSMP_CDEV_NAME		"hsmp_cdev"
>  #define HSMP_DEVNODE_NAME	"hsmp"
> +#define HSMP_ROOT_DEV_NAME	"amd_hsmp"
>  #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>  
>  #define DRIVER_VERSION		"2.6"
> @@ -47,6 +48,7 @@ struct hsmp_socket {
>  	/* Size of the region mapped at @metric_tbl_addr, as reported by SMU */
>  	size_t metric_tbl_size;
>  	void __iomem *virt_base_addr;
> +	struct device *sysfs_dev;
>  	struct semaphore hsmp_sem;
>  	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
>  	struct mutex metric_read_lock;
> @@ -80,6 +82,9 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>  #endif
>  int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
> +int hsmp_sock_dev_register(struct hsmp_socket *sock);
> +void hsmp_sock_dev_unregister(struct hsmp_socket *sock);
> +
>  extern const struct attribute_group *hsmp_sock_groups[];
>  
>  /*
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index b1db3b4d77b9..e9e91b640b2a 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -4,7 +4,8 @@
>   * Copyright (c) 2024, AMD.
>   * All Rights Reserved.
>   *
> - * This file provides the per-socket sysfs attributes of the HSMP interface.
> + * This file provides the per-socket sysfs attributes of the HSMP interface
> + * and the /sys/devices/amd_hsmp/socket%u devices carrying them.
>   */
>  
>  #include <asm/amd/hsmp.h>
> @@ -12,7 +13,12 @@
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bits.h>
> +#include <linux/cleanup.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
> @@ -336,3 +342,107 @@ const struct attribute_group *hsmp_sock_groups[] = {
>  	NULL
>  };
>  EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
> +
> +/*
> + * /sys/devices/amd_hsmp is created when the first socket device is registered
> + * and removed with the last one. hsmp_root_lock serializes that against the
> + * per-socket register/unregister calls.
> + */
> +static DEFINE_MUTEX(hsmp_root_lock);
> +static struct device *hsmp_root_dev;
> +static unsigned int hsmp_root_users;
> +
> +static void hsmp_sock_dev_release(struct device *dev)
> +{
> +	kfree(dev);
> +}
> +
> +/**
> + * hsmp_sock_dev_register() - Create /sys/devices/amd_hsmp/socket%u for @sock.
> + * @sock: fully probed HSMP socket.
> + *
> + * The device carries hsmp_sock_groups with @sock as its drvdata, so @sock must
> + * stay valid until hsmp_sock_dev_unregister() returns.
> + *
> + * Return: 0 on success, a negative error code otherwise.
> + */
> +int hsmp_sock_dev_register(struct hsmp_socket *sock)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	guard(mutex)(&hsmp_root_lock);
> +
> +	if (!hsmp_root_users) {
> +		hsmp_root_dev = root_device_register(HSMP_ROOT_DEV_NAME);
> +		if (IS_ERR(hsmp_root_dev)) {
> +			ret = PTR_ERR(hsmp_root_dev);
> +			hsmp_root_dev = NULL;
> +			return ret;
> +		}
> +	}
> +
> +	/*
> +	 * Built by hand rather than with device_create_with_groups(), which
> +	 * rejects a NULL class: these devices belong to no class or bus.
> +	 */
> +	dev = kzalloc_obj(*dev);
> +	if (!dev) {
> +		ret = -ENOMEM;
> +		goto err_root;
> +	}
> +
> +	device_initialize(dev);
> +	dev->parent = hsmp_root_dev;
> +	dev->groups = hsmp_sock_groups;
> +	dev->release = hsmp_sock_dev_release;
> +	dev_set_drvdata(dev, sock);
> +
> +	ret = dev_set_name(dev, "socket%u", sock->sock_ind);
> +	if (!ret)
> +		ret = device_add(dev);
> +	if (ret) {

Tricky control logic. Preferrably handle errors first.

> +		put_device(dev);
> +		goto err_root;
> +	}
> +
> +	sock->sysfs_dev = dev;
> +	hsmp_root_users++;

Why reinvent the wheel and not use kref.h? It got immediately complicated 
on the rollback path when you tried to do this with your own approach.

> +	return 0;
> +
> +err_root:
> +	if (!hsmp_root_users) {
> +		root_device_unregister(hsmp_root_dev);
> +		hsmp_root_dev = NULL;
> +	}
> +	return ret;
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_register, "AMD_HSMP");
> +
> +/**
> + * hsmp_sock_dev_unregister() - Remove /sys/devices/amd_hsmp/socket%u for @sock.
> + * @sock: HSMP socket; a no-op if its device was never registered.
> + *
> + * device_unregister() waits for in-flight show/read handlers, which take
> + * hsmp_sock_rwsem for read. The caller must therefore not hold it, or a
> + * concurrent sysfs read would deadlock the teardown.
> + */
> +void hsmp_sock_dev_unregister(struct hsmp_socket *sock)
> +{
> +	lockdep_assert_not_held(&hsmp_sock_rwsem);
> +
> +	guard(mutex)(&hsmp_root_lock);
> +
> +	if (!sock->sysfs_dev)
> +		return;
> +
> +	device_unregister(sock->sysfs_dev);
> +	sock->sysfs_dev = NULL;
> +
> +	if (!--hsmp_root_users) {
> +		root_device_unregister(hsmp_root_dev);
> +		hsmp_root_dev = NULL;
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_dev_unregister, "AMD_HSMP");
> 

-- 
 i.

