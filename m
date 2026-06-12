Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F11D2D3ED1;
	Fri, 12 Jun 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781269047; cv=none; b=i9edc2D/vhSo/hRD7ua0Bekq0PrhUQElaZwM8vjMmKhqAe+c5OzQ+ztURFCD3qBOClov1N3BUVyOdENm3IXLGJ5S+MqN8wK5w4V6Ui9BROCkadDfBXjYx3QVH5mO07Ev0ugm6sfqd0XyntW+a8diOqm4VlyRip3Qxnl8qUKHhR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781269047; c=relaxed/simple;
	bh=dCXhucpfXSDi1MoaQGEj5q6KiCE/X9MjP7vNPH2VS4s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=H1HnotY0Yv8IwV2eMWgG46lLqPPETZRKMSSxwllBB9xTc+y6kEYRhJ3kstAIsFq0nM3MaeH72EP4lLbT3SJDA24r5UTkxuODQ9sAt3lyII6Mq4155ZBeI5YmeXyBCcO45TMYO6MMlkgtK6YhGWrPbKiwFd7ioNHMSMztpZNlzNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKUpgCoZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKUpgCoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781269045; x=1812805045;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=dCXhucpfXSDi1MoaQGEj5q6KiCE/X9MjP7vNPH2VS4s=;
  b=XKUpgCoZrQL0qMMY4kSLYEAROahST9rL6wxqHAsgIAiaUHVW6JwUrau2
   NfoNQQ0qjV7b6dLt5DT2KBYjWdXlP55lWZO4L/Aw0VlQzpONDv/5eGlIp
   7p+gpJm3rKL0O9Gr00PG0afcaPF6Nhc4J2qSr8z+3Ykzsl9WYN6fbb759
   kl6iuTgbs+l6fAxXbkRXEMAfFaN4HouHFMtPTtgRwvZ1smCB3coSyYdqz
   h/DIBxFXL+S36DokeDeo4Fq16u2WesAPbxeERf3521wOuUiDGR4blF/FH
   8vxFStsCwnZtr8nN2cVYRyoCoWIZKyqpufzlLbB5SS23owERDf49rwzCL
   g==;
X-CSE-ConnectionGUID: hjWGX33ySTGpni2PvbXjsQ==
X-CSE-MsgGUID: jifqu31VTBq+OIc1kdgnzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69643992"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="69643992"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:57:25 -0700
X-CSE-ConnectionGUID: ygR660kfTai+dKwRpz/5MQ==
X-CSE-MsgGUID: ZQSVORo1QkO3xV7taXB7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="277014701"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:57:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 12 Jun 2026 15:57:19 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
Subject: Re: [PATCH v6 8/8] platform/x86/amd/hsmp: Serialize metric table
 access and ACPI HSMP teardown
In-Reply-To: <20260612042610.1629037-9-muralidhara.mk@amd.com>
Message-ID: <d24358bb-e6e4-6046-4da7-5709ca543726@linux.intel.com>
References: <20260612042610.1629037-1-muralidhara.mk@amd.com> <20260612042610.1629037-9-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 12 Jun 2026, Muralidhara M K wrote:

> Each ACPI HSMP socket bumps acpi_sock_refcnt after a successful probe;
> the last socket to remove runs refcount_dec_and_test() and tears down
> shared state once. If init_acpi() or misc_register() fails before
> refcount_inc(), call hsmp_acpi_free_sock_alloc_if_idle() to free
> hsmp_pdev->sock so a concurrent probe cannot follow a dangling pointer.
> 
> 1) Metric table sysfs reads ask the SMU to refresh the table, then
>    memcpy_fromio() from the mmio mapping.  Concurrent readers could
>    interleave those steps and return inconsistent data.  Serialize with
>    per-socket metric_tbl_lock and guard(mutex) around
>    hsmp_send_message() and memcpy_fromio() so each read() observes one
>    coherent snapshot.
> 2) Every ACPI AMDI0097 device shares hsmp_pdev->sock[].  The driver used
>    devm_kcalloc() from whichever device probed first, an unlocked probe
>    flag, and misc_register() from the first successful path.  Parallel
>    probes could race, and devm tied the array lifetime to one device
>    while others (and devm hwmon paths) still called hsmp_send_message(),
>    which could use-after-free the array on remove.
> 3) Metric DRAM used devm_ioremap() and devm_mutex_init() per ACPI device
>    while the socket table is global, so devm teardown order did not
>    match shared storage.  Switch to ioremap(), one-time mutex_init()
>    (metric_lock_inited), and hsmp_metric_tbl_unmap_all() on the last
>    ACPI remove together with the rest of global teardown.
> 4) After kcalloc(sock) but before refcount_inc(), one failing probe
>    could kfree() the array while another probe still ran init_acpi() on
>    the same pointer.  Hold hsmp_acpi_probe_mutex across init_acpi(),
>    misc_register(), and refcount_inc() so setup does not overlap
>    teardown or a concurrent probe.
> 5) On the legacy platform driver, call hsmp_misc_deregister() before
>    hsmp_metric_tbl_unmap_all() so /dev/hsmp is gone before metric mmio
>    is unmapped, matching the ACPI remove path.

Thanks. To me it would look better to have the concurrency fixes done 
first. You could actually send them in own series and once that work is 
done, I'll process the ver7 series on top of that.

I took patch 6 nospec change into the review-ilpo-next already as it seems 
independent of the ver7 changes.

Many comments below.

> Tested-by: Muthusamy Ramalingam <muthusamy.ramalingam@amd.com>
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 58 +++++++++++++++++++++-------
>  drivers/platform/x86/amd/hsmp/hsmp.c | 56 +++++++++++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.h |  9 ++++-
>  drivers/platform/x86/amd/hsmp/plat.c |  1 +
>  4 files changed, 106 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 8dc6b4a8bd27..e526e2cea3e2 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -20,7 +20,10 @@
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
> +#include <linux/refcount.h>
> +#include <linux/slab.h>
>  #include <linux/sysfs.h>
>  #include <linux/topology.h>
>  #include <linux/uuid.h>
> @@ -595,6 +598,19 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>  
> +static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
> +
> +/* Caller holds hsmp_acpi_probe_mutex. */

Please use lockdep_assert() to enforce any context requirement.

For comments, the kerneldoc compatible formatting should be used (even if 
not writing a full kerneldoc comment):

* Context: caller must hold hsmp_acpi_probe_mutex.

> +static void hsmp_acpi_free_sock_alloc_if_idle(void)
> +{
> +	if (refcount_read(&hsmp_pdev->acpi_sock_refcnt) == 0 &&
> +	    !hsmp_pdev->acpi_misc_registered && hsmp_pdev->sock) {
> +		kfree(hsmp_pdev->sock);
> +		hsmp_pdev->sock = NULL;
> +		hsmp_pdev->num_sockets = 0;
> +	}
> +}
> +
>  static int hsmp_acpi_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -603,49 +619,63 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	if (!hsmp_pdev)
>  		return -ENOMEM;
>  
> -	if (!hsmp_pdev->is_probed) {
> +	mutex_lock(&hsmp_acpi_probe_mutex);

You should generally use cleanup.h when taking the mutex, especially, if 
you need to duplicate the unlock to many places.

> +	if (!hsmp_pdev->sock) {
>  		hsmp_pdev->num_sockets = topology_max_packages();
>  		if (!hsmp_pdev->num_sockets) {
>  			dev_err(&pdev->dev, "No CPU sockets detected\n");
> +			mutex_unlock(&hsmp_acpi_probe_mutex);
>  			return -ENODEV;
>  		}
>  
> -		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
> -					       sizeof(*hsmp_pdev->sock),
> -					       GFP_KERNEL);
> -		if (!hsmp_pdev->sock)
> +		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
> +					  sizeof(*hsmp_pdev->sock),
> +					  GFP_KERNEL);
> +		if (!hsmp_pdev->sock) {
> +			mutex_unlock(&hsmp_acpi_probe_mutex);
>  			return -ENOMEM;
> +		}
>  	}
>  
>  	ret = init_acpi(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		hsmp_acpi_free_sock_alloc_if_idle();
> +		mutex_unlock(&hsmp_acpi_probe_mutex);
>  		return ret;
>  	}
>  
> -	if (!hsmp_pdev->is_probed) {
> +	if (!hsmp_pdev->acpi_misc_registered) {
>  		ret = hsmp_misc_register(&pdev->dev);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register misc device\n");
> +			hsmp_acpi_free_sock_alloc_if_idle();
> +			mutex_unlock(&hsmp_acpi_probe_mutex);
>  			return ret;
>  		}
> -		hsmp_pdev->is_probed = true;
> -		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
> +		hsmp_pdev->acpi_misc_registered = true;
> +		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>  	}
> +	refcount_inc(&hsmp_pdev->acpi_sock_refcnt);
> +	mutex_unlock(&hsmp_acpi_probe_mutex);
>  
>  	return 0;
>  }
>  
>  static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
> -	/*
> -	 * We register only one misc_device even on multi-socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (hsmp_pdev->is_probed) {
> +	mutex_lock(&hsmp_acpi_probe_mutex);
> +	if (refcount_dec_and_test(&hsmp_pdev->acpi_sock_refcnt)) {
>  		hsmp_misc_deregister();
> -		hsmp_pdev->is_probed = false;
> +		hsmp_pdev->acpi_misc_registered = false;
> +		hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
> +		kfree(hsmp_pdev->sock);
> +		hsmp_pdev->sock = NULL;
> +		hsmp_pdev->num_sockets = 0;
> +		hsmp_pdev->proto_ver = 0;
> +		hsmp_pdev->hsmp_table_size = 0;

Using kref.h, you can give a release function for the put call and 
get/put will be cleaner interface anyway than handling the refcount 
directly.

>  	}
> +	mutex_unlock(&hsmp_acpi_probe_mutex);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 9f7a5fb67728..4dc3826a0d57 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -12,6 +12,7 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/nospec.h>
>  #include <linux/semaphore.h>
>  #include <linux/slab.h>
> @@ -41,7 +42,9 @@
>   */
>  #define CHECK_GET_BIT		BIT(31)
>  
> -static struct hsmp_plat_device hsmp_pdev;
> +static struct hsmp_plat_device hsmp_pdev = {
> +	.acpi_sock_refcnt = REFCOUNT_INIT(0),
> +};
>  
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
> @@ -488,6 +491,7 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE;
>  	msg.sock_ind	= sock->sock_ind;
>  
> +	guard(mutex)(&sock->metric_tbl_lock);
>  	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
> @@ -497,6 +501,28 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size)
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_read, "AMD_HSMP");
>  
> +void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets)
> +{
> +	u16 i;
> +
> +	if (!pdev->sock || !num_sockets)
> +		return;
> +
> +	for (i = 0; i < num_sockets; i++) {
> +		struct hsmp_socket *s = &pdev->sock[i];
> +
> +		if (s->metric_tbl_addr) {
> +			iounmap(s->metric_tbl_addr);
> +			s->metric_tbl_addr = NULL;
> +		}
> +		if (s->metric_lock_inited) {
> +			mutex_destroy(&s->metric_tbl_lock);
> +			s->metric_lock_inited = false;
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_metric_tbl_unmap_all, "AMD_HSMP");
> +
>  int hsmp_get_tbl_dram_base(u16 sock_ind)
>  {
>  	struct hsmp_socket *sock = &hsmp_pdev.sock[sock_ind];
> @@ -504,6 +530,31 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	phys_addr_t dram_addr;
>  	int ret;
>  
> +	if (sock->metric_tbl_addr)
> +		return 0;
> +
> +	/*
> +	 * Initialize the per-socket lock before anything that can set
> +	 * sock->metric_tbl_addr to a non-NULL value.  hsmp_metric_tbl_read()
> +	 * gates on sock->metric_tbl_addr being non-NULL and then takes
> +	 * metric_tbl_lock unconditionally; both callers of this function
> +	 * (init_acpi() and init_platform_device()) intentionally only log
> +	 * a failure here and continue probing, so an init order that left
> +	 * metric_tbl_addr populated while mutex_init failed would leave the
> +	 * read path locking an uninitialized mutex.  Doing the mutex init
> +	 * first preserves the invariant "metric_tbl_addr != NULL implies the
> +	 * lock is usable" on every error exit.
> +	 *
> +	 * Use non-devm mutex + ioremap so the shared sock[] array (ACPI
> +	 * allocates once for all sockets) can be torn down from a single
> +	 * refcounted release path without devm lifetime being tied to the
> +	 * wrong struct device.
> +	 */
> +	if (!sock->metric_lock_inited) {
> +		mutex_init(&sock->metric_tbl_lock);
> +		sock->metric_lock_inited = true;

Perhaps it would be possible to arrange code such that booleans like this 
are not required.

This problem may in part stem from using global array to store sock 
instead of sock[] being just pointers to memory allocated dynamically 
on probe and freed on remove, and in part from the init order.

> +	}

This patch should probably be split into series so it's easier to 
differentiate what belongs to which fix (or if something strictly belongs 
to the ver7 ioctl additions and not the existing code, it should be sent 
with them once the concurrency changes are made to come first).

> +
>  	msg.sock_ind	= sock_ind;
>  	msg.response_sz	= hsmp_msg_desc_table[HSMP_GET_METRIC_TABLE_DRAM_ADDR].response_sz;
>  	msg.msg_id	= HSMP_GET_METRIC_TABLE_DRAM_ADDR;
> @@ -527,8 +578,7 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  	else
>  		hsmp_pdev.hsmp_table_size = sizeof(struct hsmp_metric_table);
>  
> -	sock->metric_tbl_addr = devm_ioremap(sock->dev, dram_addr,
> -					     hsmp_pdev.hsmp_table_size);
> +	sock->metric_tbl_addr = ioremap(dram_addr, hsmp_pdev.hsmp_table_size);
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
>  		return -ENOMEM;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 7343f8a1681f..5f5ad2885c22 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -15,7 +15,9 @@
>  #include <linux/hwmon.h>
>  #include <linux/kconfig.h>
>  #include <linux/miscdevice.h>
> +#include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/refcount.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> @@ -42,11 +44,14 @@ struct hsmp_socket {
>  	struct bin_attribute hsmp_attr;
>  	struct hsmp_mbaddr_info mbinfo;
>  	void __iomem *metric_tbl_addr;
> +	/* Serializes concurrent metric table refreshes from the sysfs path */
> +	struct mutex metric_tbl_lock;
>  	void __iomem *virt_base_addr;
>  	struct semaphore hsmp_sem;
>  	char name[HSMP_ATTR_GRP_NAME_SIZE];
>  	struct device *dev;
>  	u16 sock_ind;
> +	bool metric_lock_inited;
>  	int (*amd_hsmp_rdwr)(struct hsmp_socket *sock, u32 off, u32 *val, bool rw);
>  };
>  
> @@ -55,7 +60,8 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_probed;
> +	refcount_t acpi_sock_refcnt;
> +	bool acpi_misc_registered;

Don't you know this based on the reference count?

>  	size_t hsmp_table_size;
>  };
>  
> @@ -66,6 +72,7 @@ void hsmp_misc_deregister(void);
>  int hsmp_misc_register(struct device *dev);
>  int hsmp_get_tbl_dram_base(u16 sock_ind);
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
> +void hsmp_metric_tbl_unmap_all(struct hsmp_plat_device *pdev, u16 num_sockets);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e07f68575055..2ef2102d0af3 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -230,6 +230,7 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
>  	hsmp_misc_deregister();
> +	hsmp_metric_tbl_unmap_all(hsmp_pdev, hsmp_pdev->num_sockets);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 



-- 
 i.

