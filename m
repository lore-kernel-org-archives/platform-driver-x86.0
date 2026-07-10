Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2054B36A365;
	Fri, 10 Jul 2026 17:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705877; cv=none; b=Zhx4Um+dX8flZ3jBopBMB1CIICFFth5odU4oIV5Vg6RaUlTTrEMryVSF0wOYSs1Ile3OrlcywqPiQlHAYsSuMz4g1m/nhEcJ1pAc2W78IZwp4nHTfGR2qTub/u0DanU9JZ/AiSXqwe+Gh1aHyQOvarLDd3UKbRrAv/f7gI7TTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705877; c=relaxed/simple;
	bh=RX3iQ2gEUVGdf+qY/fgkyRFCkE/42FCF+KTBg2+kpWM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ixg8VaUHfo4WXqoq4MPpypCHoJ0lPLV49BdMkNLdAlPoLcex2mpSa09DiJBhl84hxl/czJLW3H4ZH2b11hy59zz1/YziECUC7bgK5i15Zk/6Xu68bun8s01z0Kiz3K8387J3c/tLvjHEC0WwZHisLD7o2xDlEp80OSuz34YYUHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkV1gY7C; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkV1gY7C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783705874; x=1815241874;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RX3iQ2gEUVGdf+qY/fgkyRFCkE/42FCF+KTBg2+kpWM=;
  b=dkV1gY7ClfUDhNPL4PO9wgMjFYXFNN1/M8mf8Q1sgS3dY2W/rr28T8lJ
   gkcf1iY26AQ6cZT7LYX7X4F9C+7MofNG1OjJf79dd3u1VENMqFPsh8Mqu
   G48OrTkBpk10A5AaWuN8XCXFghBo1S3pFK3H44DJ+vplhX2tRCwrU7ho9
   kTif07Za0jP9YOCrDtTuQM4KjoFEIiRgbAzCLuCROPqGJ5cfgQJ1sJDeq
   8rZG8crJZ9rWaYsAtnBP6IAKYaCmSrBj5G6iW1kI9nyr/0ed36tV+ZSb4
   xLSxv6DQVQAJ+TjpANzNliERKAWqyn2tfuIBhQf4ZOidQde1KCsp3rnya
   A==;
X-CSE-ConnectionGUID: 6gXjb9QlSgqNpeemsNTvnw==
X-CSE-MsgGUID: iTgbSTuBTyWpCvRlD+5p5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95055016"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95055016"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:51:13 -0700
X-CSE-ConnectionGUID: eAYRechnQg6iY3HiHze/Yg==
X-CSE-MsgGUID: D4GcCG9LQ9KPZDLmGYww5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253825350"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:51:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 20:51:07 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v5 5/6] platform/x86/amd/hsmp: ACPI HSMP refcounted
 sockets and coordinated release
In-Reply-To: <20260710144633.879018-6-muralidhara.mk@amd.com>
Message-ID: <9469db87-7c63-aa00-1d0e-161df55fd180@linux.intel.com>
References: <20260710144633.879018-1-muralidhara.mk@amd.com> <20260710144633.879018-6-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 10 Jul 2026, Muralidhara M K wrote:

> The ACPI driver binds one platform device per socket but shares a single
> socket array and a single /dev/hsmp misc device across them. Replace the
> is_probed flag with state that tracks this shared ownership:
> 
>  - miscdevice.this_device tells whether /dev/hsmp is registered, so the
>    misc device is registered on the first socket and torn down last. A
>    preceding change clears mdev.this_device on deregister so this gate
>    stays reliable across a re-probe.
> 
>  - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
>    It is guarded by hsmp_sock_rwsem, which probe and remove already hold
>    for write, so a plain counter is enough and no atomic refcount is
>    needed. The shared socket array is allocated with kcalloc() on the first
>    probe and freed by hsmp_acpi_sock_release() when the count drops back to
>    zero.
> 
> hsmp_acpi_sock_release() is the single teardown helper: it deregisters
> /dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
> per-socket mutexes and frees the array. The remove path and the
> probe-failure path each call it once they are the last owner, so the
> teardown lives in one place.
> 
> Both paths also clear this socket's dev, so a message issued after a
> non-final unbind (or to a socket that failed to probe on a multi-socket
> system, whose array stays alive and whose remove() is never called) cannot
> reach the mailbox that devres is about to unmap.
> 
> Two lifetime fixes fall out of the array persisting across a non-final
> unbind:
> 
>  - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
>    remapping, so a rebind does not leak one mapping per cycle. It runs
>    during (re)probe before the metric sysfs attribute is exposed, so no
>    reader can be using the old mapping.
> 
>  - The ACPI path registers /dev/hsmp unparented by passing NULL to
>    hsmp_misc_register(). Its per-socket devices can be unbound individually
>    and out of order and the misc device outlives all but the last of them,
>    so parenting it to one socket's device would leave a dangling parent.
>    hsmp_misc_register() now takes the parent from its caller, so the
>    platform driver keeps parenting /dev/hsmp to its single device.
> 
> hsmp_sock_rwsem is held for write across probe and remove, so the release
> and probe-failure cleanup run with it already held; an upcoming change adds
> its read side so the same lock also drains the lock-free data plane.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 122 ++++++++++++++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.c |  20 +++++
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
>  3 files changed, 123 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index a092d7589bcb..8339af1624f4 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -24,6 +24,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/rwsem.h>
> +#include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/sysfs.h>
>  #include <linux/topology.h>
> @@ -42,6 +43,14 @@
>  
>  static struct hsmp_plat_device *hsmp_pdev;
>  
> +/*
> + * Number of ACPI socket platform devices that have probed successfully.
> + * Guarded by hsmp_sock_rwsem, which probe and remove hold for write, so a
> + * plain counter is enough; no atomic is needed. The shared socket array is
> + * allocated on the first probe and freed once this drops back to zero.
> + */
> +static unsigned int hsmp_acpi_sock_refs;
> +
>  struct hsmp_sys_attr {
>  	struct device_attribute dattr;
>  	u32 msg_id;
> @@ -611,6 +620,60 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>  
> +/*
> + * Tear down the shared ACPI socket state once the last socket is gone:
> + * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
> + * destroy the per-socket mutexes and free the socket array.
> + *
> + * Called with hsmp_sock_rwsem held for write by the remove and probe-failure
> + * paths. The write lock has drained any in-flight hsmp_send_message(), so
> + * unmapping the mailbox and freeing the array cannot race the lock-free data
> + * plane.
> + */
> +static void hsmp_acpi_sock_release(void)
> +{
> +	lockdep_assert_held_write(&hsmp_sock_rwsem);
> +
> +	if (!IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device))
> +		hsmp_misc_deregister();
> +	hsmp_unmap_metric_tbls(hsmp_pdev);
> +	hsmp_destroy_metric_read_locks(hsmp_pdev);
> +	kfree(hsmp_pdev->sock);
> +	hsmp_pdev->sock = NULL;
> +	hsmp_pdev->num_sockets = 0;
> +	hsmp_pdev->proto_ver = 0;
> +}
> +
> +/**
> + * hsmp_acpi_probe_failure_cleanup() - Undo a failed ACPI socket probe.
> + * @dev: ACPI companion device whose probe failed.
> + *
> + * This device never incremented hsmp_acpi_sock_refs, so clear its sock->dev
> + * and, if it was the only socket in play, release the shared state.
> + *
> + * Clearing sock->dev matters on multi-socket systems: when a non-first socket
> + * fails, the array stays alive (owned by an already-probed socket) and
> + * remove() is never called for this device, yet devres unmaps its mailbox once
> + * probe() returns. Without clearing dev, a later message to this index would
> + * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
> + *
> + * sock is NULL if probe failed before hsmp_parse_acpi_table() set the drvdata.
> + *
> + * Called from hsmp_acpi_probe(), which already holds hsmp_sock_rwsem for write.
> + */
> +static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
> +{
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +
> +	lockdep_assert_held_write(&hsmp_sock_rwsem);
> +
> +	if (sock)
> +		sock->dev = NULL;
> +
> +	if (!hsmp_acpi_sock_refs)
> +		hsmp_acpi_sock_release();
> +}
> +
>  static int hsmp_acpi_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -620,23 +683,24 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	/*
> -	 * Multiple ACPI socket devices probe in parallel, but the is_probed
> -	 * handshake and the one-time socket-array allocation below must run
> -	 * exactly once.  Serialize the whole bring-up against concurrent
> -	 * probe/remove by holding the socket rwsem for write.
> +	 * Multiple ACPI socket devices probe in parallel, but the one-time
> +	 * socket-array allocation and /dev/hsmp registration below must run
> +	 * exactly once. Hold the socket rwsem for write across the whole
> +	 * bring-up so it cannot race a concurrent probe or remove, and so the
> +	 * probe-failure teardown drains the lock-free data plane.
>  	 */
>  	guard(rwsem_write)(&hsmp_sock_rwsem);
>  
> -	if (!hsmp_pdev->is_probed) {
> +	if (!hsmp_pdev->sock) {
>  		hsmp_pdev->num_sockets = topology_max_packages();
>  		if (!hsmp_pdev->num_sockets) {
>  			dev_err(&pdev->dev, "No CPU sockets detected\n");
>  			return -ENODEV;
>  		}
>  
> -		hsmp_pdev->sock = devm_kcalloc(&pdev->dev, hsmp_pdev->num_sockets,
> -					       sizeof(*hsmp_pdev->sock),
> -					       GFP_KERNEL);
> +		hsmp_pdev->sock = kcalloc(hsmp_pdev->num_sockets,
> +					  sizeof(*hsmp_pdev->sock),
> +					  GFP_KERNEL);
>  		if (!hsmp_pdev->sock)
>  			return -ENOMEM;
>  
> @@ -646,35 +710,55 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	ret = init_acpi(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>  		return ret;
>  	}
>  
> -	if (!hsmp_pdev->is_probed) {
> -		ret = hsmp_misc_register(&pdev->dev);
> +	if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
> +		/*
> +		 * Register /dev/hsmp unparented. It is a singleton shared by all
> +		 * ACPI sockets and outlives all but the last of them, so
> +		 * parenting it to this socket's device would leave a dangling
> +		 * parent once that socket is unbound.
> +		 */
> +		ret = hsmp_misc_register(NULL);
>  		if (ret) {
>  			dev_err(&pdev->dev, "Failed to register misc device\n");
> +			hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>  			return ret;
>  		}
> -		hsmp_pdev->is_probed = true;
> -		dev_dbg(&pdev->dev, "AMD HSMP ACPI is probed successfully\n");
> +		dev_dbg(&pdev->dev, "AMD HSMP ACPI misc device registered\n");
>  	}
>  
> +	hsmp_acpi_sock_refs++;
> +
>  	return 0;
>  }
>  
>  static void hsmp_acpi_remove(struct platform_device *pdev)
>  {
> +	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
> +
> +	/*
> +	 * Serialize the decrement and any release it triggers against a
> +	 * concurrent probe, and drain the lock-free data plane for the whole
> +	 * teardown: this covers the per-socket unbind, whose mailbox devres
> +	 * unmaps once we return, and the last unbind that frees the socket
> +	 * array in hsmp_acpi_sock_release().
> +	 */
>  	guard(rwsem_write)(&hsmp_sock_rwsem);
>  
>  	/*
> -	 * We register only one misc_device even on multi-socket system.
> -	 * So, deregister should happen only once.
> +	 * Clear this socket's dev so hsmp_send_message() rejects it before
> +	 * devres unmaps the mailbox. On a non-final unbind the socket array
> +	 * stays alive, so without this a later message to this index would
> +	 * reach an unmapped iomem region.
>  	 */
> -	if (hsmp_pdev->is_probed) {
> -		hsmp_misc_deregister();
> -		hsmp_destroy_metric_read_locks(hsmp_pdev);
> -		hsmp_pdev->is_probed = false;
> -	}
> +	sock->dev = NULL;
> +
> +	hsmp_acpi_sock_refs--;
> +	if (!hsmp_acpi_sock_refs)

Now that I can actually follow the series this far (pretty easily 
actually, so good work so far!), I again started to wonder why this has 
moved back away from kref to manually handling the reference counting?

I understand you don't strictly need the atomic part of refcount_t because 
you're under another lock but it would still be cleaner interface with 
kref_get/put().

It might even be possible to use kref_get_unless_zero() instead of the 
read side of hsmp_sock_rwsem to ensure datastructures won't vanish 
underneath a data place call.

> +		hsmp_acpi_sock_release();
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 584fd9b1d31f..967307abe641 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -491,6 +491,18 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> +	/*
> +	 * The ACPI socket array is shared across sockets and outlives a
> +	 * per-socket unbind, so metric_tbl_addr may hold a mapping from an
> +	 * earlier bind of this socket. Unmap it before remapping so an
> +	 * unbind/rebind cycle does not leak a metric-table mapping. This runs
> +	 * during probe before the metric sysfs attribute is exposed, so no
> +	 * reader can be using it.
> +	 */
> +	if (sock->metric_tbl_addr) {
> +		iounmap(sock->metric_tbl_addr);
> +		sock->metric_tbl_addr = NULL;
> +	}
>  	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
> @@ -528,6 +540,14 @@ int hsmp_misc_register(struct device *dev)
>  	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
>  	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
>  	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	/*
> +	 * The caller chooses the parent. The platform driver has a single
> +	 * device whose lifetime matches /dev/hsmp and parents it there. The
> +	 * ACPI driver passes NULL: its /dev/hsmp is a singleton shared by
> +	 * per-socket devices that can be unbound individually and out of order,
> +	 * so parenting it to one would leave it attached to an already-removed
> +	 * device.
> +	 */
>  	hsmp_pdev.mdev.parent	= dev;
>  	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
>  	hsmp_pdev.mdev.mode	= 0644;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index ec92c2a429bb..45dab9253c13 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -58,7 +58,6 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_probed;
>  };
>  
>  int hsmp_cache_proto_ver(u16 sock_ind);
> 

-- 
 i.

