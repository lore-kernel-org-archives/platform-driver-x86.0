Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588274;
	b=XVd29XRb3MDkERwGdrXCEnWTwlalvGg3AdCsLpugOMH0Pk32vWnfJe7/9wFk86aFLp1l
	 foDezYSUsliX6CXRYvyLBd8LEFBmucKxn6Kpl3nc5OII/HtWOYsiH4x20GSW66lDUTvDs
	 yhLSMDrGxcfLvMYpM54ZNEJqJxm1I7MW+EJrSUFv4TxxsnjAeDzpyW7e7rrjDKNIl/lwM
	 ECYL25LsEAzpqf6mBIWBcSwLO/bAMzUgt4IlRg54EnXcc0JCnzEYW11AyHcvK/0+bD8fc
	 muMFnnTUoOzBLYeSdkYbwsol2TvyFbfdgLPn722WP4fixYiq/EApM9yzzooxyL48xbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=7KF0SQZHj3GlobQfzzP0SE9FYagXDcGBM8Sc59D2mtA=;
	b=gjSmwhcyOR3P0OgeQvy3vNRiFwbcDff62l7en7Vyanggiyj+opSi2v2eog12NTW/v/O9
	 Dz2bGXBq0DwRPOISMUVmnFvDD/O92kV14OXyWN/8yUwSq1vFDNdyluxlgHrYOvadzn73U
	 LRzHrxF+emFJvrtDwjRd3C0ma0hPJPjrNATDM+G29/wxGCAQF3+oBPaQvEpdk7MaNwNj0
	 IoV59i91gNsB38hoa+PF6myw79ocWC1W9EBsU30pBmQUfej8qTbGGWr4PrtIVOHfe+JZJ
	 cqxCDVwHfgFwtA8u4GKjn8l8RhOQUZ4E874XdpnCE89KdGeeuphvPEbmu8kSR3v+72g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuT5OllO;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EEB606A326
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 02:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EEB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuT5OllO
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15943c9c005so90095c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 18:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793588272; x=1794193072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KF0SQZHj3GlobQfzzP0SE9FYagXDcGBM8Sc59D2mtA=;
        b=fuT5OllO9iF+e9hgedaNZBW2dnfTIWEAf/mnPWP+vkGKm6E1VLwIQsTG3b1tTipASp
         fGqsgPEnho5ZsqhgwuJOkThm66DVH8uGnh34EIRnZJycn5EfzURp1mVOLt5dl8Rg4IpJ
         73ca0uNEgxrUgYYbwOoIiKr/6/X91PaSHDcDEQ2rEh5VlvIKblDdewVXbeCtK9mez0tt
         QALW+s10+y6wqPnQLFwK+oIl6+ncqUtxKYQcgjP1qRtuvJEnHslCVCHEDmY78Fh2a6ej
         kBMxjWXLP7qT0K5gzc7x70MF+wvsRNYeDzTGIL4+YjpbOeTyUnGpKY18G5Lp5wo5q/c5
         G04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588272; x=1794193072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KF0SQZHj3GlobQfzzP0SE9FYagXDcGBM8Sc59D2mtA=;
        b=Qr70lnz6S1ukeH6XzVonzYi/repx26Otfb7s05yTtDERCzmqX1HBMPy8bAjYlVFmJj
         u/kjTT+1YreXy+XAjBYGRZf9W+KuGJduYKkqf8/kzKkbYqktUV2fgauhm5zyGnJqzw5L
         sDTgRyFIYvKPO/TkDbdC9vNAC7YGUc05KPVDKCz6WY506ZTZi2Ols84MAtj8RublqcG6
         1lb4PYOsfEmUZFJLPJLDyBGGgj6KFyR7sbhFGLtEsT7Rqp9sUPF4L9b7ogJ8LHJQQD+M
         wj6c6M5VuEkpIA/kehOLQ9K4KFaMrMYwIMpZL6fQMaZJAYVn5RZPzGZnysIdv8IJq89X
         wtUA==
X-Forwarded-Encrypted: i=1; AKwUvBx3lqmzm7RztM27bK/cdVU4HgF3e9lkepB36vWdMn2DEXKk6Zytwo+cwvIr0oYrXSGgzZkOC9gJu41HDIIb+5aAOsvi@vger.kernel.org
X-Gm-Message-State: AFq9FYLUV9DZOoV5xy6lniwmbD8n179D0HI5d3xo9rPD2i2YsUqCs0K/
	EtyMjZclUuSp7618e4FyLvDieV++4HNt5CXl50UmomwBqU8VIgS4th+puFFnkg==
X-Gm-Gg: AYBFou3fh0TG5h/NN/XAx1RUIej8Grqz0Y0g10I2baHEC9HNWwH7CeDX/f6IcYJ9sr5
	6jwZ6AqB4ue6vpVT/gxhO02tPiImPvS3tG3Nx+kVCXWP3DnYCRSrITjiw4yq+LS8NBiuq7e0ay+
	8UhK2nShrhG0OZsK9vYcGyC6oABkkziS0PXF2JnANs3mm5FT4KlU14lQAuMvr5Ws/ROGXLdW4zy
	yOoHzh36UsdYgzxLd/mC1fopOngFSEMhlVIixWABoWbXJ7wcshIraWunp6pV3tGPO7wEkdZTqLY
	uB2+Tteh9JUojdv75ASmYKPlWFN9ViAnWP/1bAlzBJK70k8xTbMbmYmbIe2Vs/53snYOnPx7tYz
	NMh62yilKVPNjPgVivDKnWcYjt8whG5qeWWcgalBnzLPhKH6WyJeZSvzcCo2tF9Y47BO8YHt9GX
	vfUGSKREWLGwO3mKdWsRBDV3Ak3UBpahvEk9gbzl5+e7seaD+mJUbT4jaOfBb+0BGgoECyB0T/G
	NMxrZS7JLUXn9F9bwkz6yIaqj/9nxKavk7+vldb4YVNFdORCyoclEXZopblkZqgOIycq37eut+e
	dbe7hOoUqgmTpYoGhQXZalI00lLwCba4KFvfoc360LiVMA==
X-Received: by 2002:a05:7022:1507:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1ac5d4b1972mr14072691c88.27.1793588272400;
        Sun, 01 Nov 2026 18:57:52 -0800 (PST)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm28264858c88.19.2026.11.01.18.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 18:57:51 -0800 (PST)
Message-ID: <73b9c9a8-479d-4a5f-9321-2e095f11951d@gmail.com>
Date: Sun, 1 Nov 2026 18:57:50 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86/amd/hsmp: Add /sys/devices/amd_hsmp
 socket devices
To: Erwan Velu <erwanaliasr1@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20261007125908.321186-1-erwanaliasr1@gmail.com>
 <20261007125908.321186-3-erwanaliasr1@gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20261007125908.321186-3-erwanaliasr1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 10/7/26 05:59, Erwan Velu wrote:
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


Is this over-engineering it? The platform driver already creates
/sys/devices/platform/amd_hsmp/socket0/, socket1/, etc. they're just dumb
dirs with only metrics_bin inside. This patch series ignores those and
builds a whole new /sys/devices/amd_hsmp/socket0/ tree from scratch with
root_device_register(), manual refcounting, etc. instead of building a
parallel tree, upgrade what's already there. Turn those existing socketN
directories from bare sysfs dirs into proper struct device objects?


> Assisted-by: claude-opus-5-5
> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> ---
>   Documentation/arch/x86/amd_hsmp.rst   |   8 +-
>   drivers/platform/x86/amd/hsmp/acpi.c  |   6 ++
>   drivers/platform/x86/amd/hsmp/hsmp.h  |   5 ++
>   drivers/platform/x86/amd/hsmp/sysfs.c | 112 +++++++++++++++++++++++++-
>   4 files changed, 129 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index fa1fc240e212..aba4a009bd8d 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -57,6 +57,12 @@ In-kernel integration:
>   HSMP sysfs interface
>   ====================
>   
> +The ACPI driver exposes its per socket sysfs files in a per socket
> +directory created at /sys/devices/amd_hsmp/socket%d/.
> +
> +For backward compatibility, the files are also available under
> +/sys/devices/platform/AMDI0097:0X/.
> +
>   1. Metrics table binary sysfs
>   
>   AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
> @@ -80,7 +86,7 @@ The same is defined in the amd_hsmp.h header.
>   
>   2. HSMP telemetry sysfs files
>   
> -Following sysfs files are available at /sys/devices/platform/AMDI0097:0X/.
> +Following sysfs files are available at /sys/devices/amd_hsmp/socket%d/.
>   
>   * c0_residency_input: Percentage of cores in C0 state.
>   * prochot_status: Reports 1 if the processor is at thermal threshold value,
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index d76979baffa8..468d4b1515db 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -441,6 +441,10 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>   		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>   	}
>   
> +	ret = hsmp_sock_dev_register(dev_get_drvdata(&pdev->dev));
> +	if (ret)
> +		dev_warn(&pdev->dev, "Failed to register HSMP socket device: %d\n", ret);
> +
>   	return 0;
>   }
>   
> @@ -448,6 +452,8 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
>   {
>   	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
>   
> +	hsmp_sock_dev_unregister(sock);
> +
>   	/*
>   	 * Serialize the kref_put() and any release it triggers against a
>   	 * concurrent probe, and drain the data plane for the whole
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 692721e2e6d3..f638edd7768b 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -28,6 +28,7 @@
>   
>   #define HSMP_CDEV_NAME		"hsmp_cdev"
>   #define HSMP_DEVNODE_NAME	"hsmp"
> +#define HSMP_ROOT_DEV_NAME	"amd_hsmp"
>   #define ACPI_HSMP_DEVICE_HID    "AMDI0097"
>   
>   #define DRIVER_VERSION		"2.6"
> @@ -47,6 +48,7 @@ struct hsmp_socket {
>   	/* Size of the region mapped at @metric_tbl_addr, as reported by SMU */
>   	size_t metric_tbl_size;
>   	void __iomem *virt_base_addr;
> +	struct device *sysfs_dev;
>   	struct semaphore hsmp_sem;
>   	/* Serializes HSMP_GET_METRIC_TABLE fill-and-copy for this socket */
>   	struct mutex metric_read_lock;
> @@ -80,6 +82,9 @@ int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>   static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return 0; }
>   #endif
>   int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
> +int hsmp_sock_dev_register(struct hsmp_socket *sock);
> +void hsmp_sock_dev_unregister(struct hsmp_socket *sock);
> +
>   extern const struct attribute_group *hsmp_sock_groups[];
>   
>   /*
> diff --git a/drivers/platform/x86/amd/hsmp/sysfs.c b/drivers/platform/x86/amd/hsmp/sysfs.c
> index b1db3b4d77b9..e9e91b640b2a 100644
> --- a/drivers/platform/x86/amd/hsmp/sysfs.c
> +++ b/drivers/platform/x86/amd/hsmp/sysfs.c
> @@ -4,7 +4,8 @@
>    * Copyright (c) 2024, AMD.
>    * All Rights Reserved.
>    *
> - * This file provides the per-socket sysfs attributes of the HSMP interface.
> + * This file provides the per-socket sysfs attributes of the HSMP interface
> + * and the /sys/devices/amd_hsmp/socket%u devices carrying them.
>    */
>   
>   #include <asm/amd/hsmp.h>
> @@ -12,7 +13,12 @@
>   #include <linux/array_size.h>
>   #include <linux/bitfield.h>
>   #include <linux/bits.h>
> +#include <linux/cleanup.h>
>   #include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/lockdep.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
>   #include <linux/sysfs.h>
>   
>   #include "hsmp.h"
> @@ -336,3 +342,107 @@ const struct attribute_group *hsmp_sock_groups[] = {
>   	NULL
>   };
>   EXPORT_SYMBOL_NS_GPL(hsmp_sock_groups, "AMD_HSMP");
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
> +		put_device(dev);
> +		goto err_root;
> +	}
> +
> +	sock->sysfs_dev = dev;
> +	hsmp_root_users++;
> +
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


Thanks,

Carlos

