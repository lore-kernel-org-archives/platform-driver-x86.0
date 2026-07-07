Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD173FDC06;
	Tue,  7 Jul 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426400; cv=none; b=BbAito1iR6Sg8h9tHl4Y6OyPExZNtwFxpMEAb0irgKzXf2Sv68JZ8g6gzimTe6K1/8gULLE553NMnU0vR6BrvukcnUReZRCiC1GpgSmwSF4vi02sHJcSx0TEayDORmNDFZBGkgJLGbYD6XY1aDiFc8Iyx3bzccPSlvNZq6FW/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426400; c=relaxed/simple;
	bh=Q82L2Q9KeKo7LwICsiTaKXCDHdSfgZ2TKiMNMqiwz9A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VrWOHisnl2vdZazRXsBHw/iEzluJsFS3ySLG2lO97cDeLONHynz8b5cgzvpn/7No7S+qDkguWREt9qEkSbkR/3I4hC8+uVELxw2gCIzWwZi4Ialv0UhD2U0V9+n6v/jZgviXrm8Ur66Eyasj5AR/sFH07upj8wtOVHQSFbEm9a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3F77Hxi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3F77Hxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783426396; x=1814962396;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Q82L2Q9KeKo7LwICsiTaKXCDHdSfgZ2TKiMNMqiwz9A=;
  b=b3F77HxijbV2eSCVA2x2JExpSzhDfwxjlxBxa21MgFGFpwgpbGVvCm9O
   Cxus8ylIKJnF3RCblY7/xZYAw63nspXJ3x3kgfdhQlF1bXB6L/iQwOVnk
   omCliAajnKsp5zxkFdoJgPM6y6OWVWNis/NPNsFjlTnx9qu0IMCJmoj5M
   c02jw8t0PPdlB3h3qRDNTubaj6CVefXAhMeyruWW3atUmi/E546NCyeia
   HujNCsWEbOoyW5DNpWVtz6t2JURoGWSEWwAeMozgfPjgmERm2p1jBiyAb
   gMalOq/Q//XrDyFG6zIUg7HWiqO9aLNP0jYWQICE9Hc3t5MUaJOUxyUDF
   w==;
X-CSE-ConnectionGUID: sZpWMuFqTRiyoatA83lsVA==
X-CSE-MsgGUID: nI1we5piQiCkM7tRJdWhfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95585741"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95585741"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:13:16 -0700
X-CSE-ConnectionGUID: rXSz60vwQy+E6oeb/opB6g==
X-CSE-MsgGUID: 3KgY2GKIS+GkjVOjf1suQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277196134"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:13:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 15:13:12 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v3 4/5] platform/x86/amd/hsmp: ACPI HSMP refcounted
 sockets and coordinated release
In-Reply-To: <20260707051711.3382354-1-muralidhara.mk@amd.com>
Message-ID: <516b5c9e-6b0a-0c2e-f684-1e3973ad09f2@linux.intel.com>
References: <20260707051711.3382354-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jul 2026, Muralidhara M K wrote:

> The ACPI driver binds one platform device per socket but shares a single
> socket array and a single /dev/hsmp misc device across them.  Replace the
> global is_probed flag with state that tracks this shared ownership:
> 
>  - miscdevice.this_device tells whether /dev/hsmp is registered, so the
>    misc device is registered on the first socket and torn down last.  Clear
>    mdev.this_device in hsmp_misc_deregister() so a later re-probe does not
>    skip registration on a stale pointer.
> 
>  - hsmp_acpi_sock_refs counts the sockets that have probed successfully.
>    It is guarded by hsmp_acpi_probe_mutex, so a plain counter is enough and
>    no atomic refcount is needed.  The shared socket array is allocated with
>    kcalloc() on the first probe and freed by hsmp_acpi_sock_release() when
>    the count drops back to zero.
> 
> hsmp_acpi_sock_release() is the single teardown helper: it deregisters
> /dev/hsmp if registered, unmaps any metric-table DRAM, destroys the
> per-socket mutexes and frees the array.  Both the remove path and the
> probe-failure path call it once they are the last owner, so the teardown
> lives in one place.
> 
> Both paths also clear this socket's dev before devres unmaps the mailbox,
> so a message issued after a non-final unbind (or to a socket that failed
> to probe on a multi-socket system, whose array stays alive and whose
> remove() is never called) cannot reach an unmapped mailbox.
> 
> Two lifetime fixes fall out of the array now persisting across a non-final
> unbind:
> 
>  - hsmp_get_tbl_dram_base() iounmap()s any stale metric_tbl_addr before
>    remapping, so a rebind does not leak one mapping per cycle.  It runs
>    during (re)probe before the metric sysfs attribute is exposed, so no
>    reader can be using the old mapping.
> 
>  - /dev/hsmp is no longer parented to a per-socket device.  Sockets can be
>    unbound individually and out of order, and the misc device outlives all
>    but the last of them, so parenting it to one socket's device would leave
>    a dangling parent.  Register it unparented instead.
> 
> This provides the refcounted socket ownership the ACPI teardown needs;
> the following patch wires both teardown paths into the data-plane rwsem so
> they are drained against the lock-free data plane, nested inside
> hsmp_acpi_probe_mutex.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 103 ++++++++++++++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.c |  26 ++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.h |   1 -
>  3 files changed, 112 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 16edcf51c971..11a478503fa7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -44,6 +44,13 @@ static struct hsmp_plat_device *hsmp_pdev;
>  
>  static DEFINE_MUTEX(hsmp_acpi_probe_mutex);
>  
> +/*
> + * Number of ACPI socket platform devices that have probed successfully.
> + * Guarded by hsmp_acpi_probe_mutex; the shared socket array is allocated on
> + * the first probe and freed once this drops back to zero.
> + */
> +static unsigned int hsmp_acpi_sock_refs;

That mutex should say what it protects, though I think you can probably 
just add one comment for this, which covers both followed by the mutex and 
this variable.

> +
>  struct hsmp_sys_attr {
>  	struct device_attribute dattr;
>  	u32 msg_id;
> @@ -610,6 +617,56 @@ static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>  
> +/*
> + * Tear down the shared ACPI socket state once the last socket is gone:
> + * deregister /dev/hsmp if it was registered, unmap any metric-table DRAM,
> + * destroy the per-socket mutexes and free the socket array.
> + *
> + * Called with hsmp_acpi_probe_mutex held (serializing it against a concurrent
> + * probe).  Coordination with the lock-free data plane (draining in-flight
> + * hsmp_send_message() before the mailbox is unmapped and the array is freed)
> + * is added in a subsequent patch via the data-plane rwsem.
> + */
> +static void hsmp_acpi_sock_release(void)
> +{
> +	lockdep_assert_held(&hsmp_acpi_probe_mutex);
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
> + * probe() returns.  Without clearing dev, a later message to this index would
> + * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
> + */
> +static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
> +{
> +	struct hsmp_socket *sock = dev_get_drvdata(dev);
> +
> +	lockdep_assert_held(&hsmp_acpi_probe_mutex);
> +
> +	if (sock)

Is this needed?

> +		sock->dev = NULL;
> +
> +	if (!hsmp_acpi_sock_refs)
> +		hsmp_acpi_sock_release();
> +}
> +
>  static int hsmp_acpi_probe(struct platform_device *pdev)
>  {
>  	int ret;
> @@ -620,16 +677,16 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  
>  	guard(mutex)(&hsmp_acpi_probe_mutex);
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
> @@ -639,35 +696,49 @@ static int hsmp_acpi_probe(struct platform_device *pdev)
>  	ret = init_acpi(&pdev->dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		hsmp_acpi_probe_failure_cleanup(&pdev->dev);
>  		return ret;
>  	}
>  
> -	if (!hsmp_pdev->is_probed) {
> +	if (IS_ERR_OR_NULL(hsmp_pdev->mdev.this_device)) {
>  		ret = hsmp_misc_register(&pdev->dev);
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
> -	mutex_lock(&hsmp_acpi_probe_mutex);
> +	struct hsmp_socket *sock = dev_get_drvdata(&pdev->dev);
> +
>  	/*
> -	 * We register only one misc_device even on multi-socket system.
> -	 * So, deregister should happen only once.
> +	 * Serialize the decrement (and the release it may trigger) against a
> +	 * concurrent probe so the count cannot be revived from zero.
>  	 */
> -	if (hsmp_pdev->is_probed) {
> -		hsmp_misc_deregister();
> -		hsmp_destroy_metric_read_locks(hsmp_pdev);
> -		hsmp_pdev->is_probed = false;
> -	}
> -	mutex_unlock(&hsmp_acpi_probe_mutex);
> +	guard(mutex)(&hsmp_acpi_probe_mutex);

So here you convert it, please do it with guard() right from the start.

> +
> +	/*
> +	 * Clear this socket's dev so hsmp_send_message() rejects it before
> +	 * touching the mailbox that devres is about to unmap.  On a non-final
> +	 * unbind the socket array stays alive, so without this a later message
> +	 * to this index would reach an unmapped iomem region.
> +	 *
> +	 * This teardown is drained against the lock-free data plane in a
> +	 * subsequent patch that wires it into the data-plane rwsem.
> +	 */
> +	if (sock)

Can this ever be not true?

> +		sock->dev = NULL;
> +
> +	if (!--hsmp_acpi_sock_refs)

This would be simpler form (does not require thinking unlike !-- construct):

	hsmp_acpi_sock_refs--;
	if (!hsmp_acpi_sock_refs)

> +		hsmp_acpi_sock_release();
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index c3d0e64c415d..8440671235de 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -492,6 +492,17 @@ int hsmp_get_tbl_dram_base(u16 sock_ind)
>  		dev_err(sock->dev, "Invalid DRAM address for metric table\n");
>  		return -ENOMEM;
>  	}
> +	/*
> +	 * The ACPI socket array now persists across a non-final unbind, so a
> +	 * stale mapping from a previous bind can still be recorded here.  Drop

"a stale mapping from a previous bind can still be recorded here" sounds 
odd, and honestly I cannot fully grasp the meaning of it. I guess it 
revolves around what does "record" mean in this context.

Are you saying that without this change, we could encounter a stale 
mapping? (which is again history telling more than documenting what the 
current code does, and it is confusing obviously because how code behaved 
in the past doesn't match the behavior now.)

One space is enough.

> +	 * it before remapping to avoid leaking one metric-table mapping per
> +	 * unbind/rebind cycle.  This runs during (re)probe before the metric

Ditto.

> +	 * sysfs attribute is exposed, so no reader can be using it.
> +	 */
> +	if (sock->metric_tbl_addr) {
> +		iounmap(sock->metric_tbl_addr);
> +		sock->metric_tbl_addr = NULL;
> +	}
>  	sock->metric_tbl_addr = ioremap(dram_addr, sizeof(struct hsmp_metric_table));
>  	if (!sock->metric_tbl_addr) {
>  		dev_err(sock->dev, "Failed to ioremap metric table addr\n");
> @@ -529,7 +540,14 @@ int hsmp_misc_register(struct device *dev)
>  	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
>  	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
>  	hsmp_pdev.mdev.fops	= &hsmp_fops;
> -	hsmp_pdev.mdev.parent	= dev;
> +	/*
> +	 * /dev/hsmp is a singleton shared by all sockets and, on ACPI, is torn

Remove: on ACPI.

> +	 * down only on the last socket's unbind.  Do not parent it to a single

Remove: only

> +	 * per-socket device: those can be unbound individually and out of order,
> +	 * which would leave the misc device parented to an already-removed
> +	 * device.  Leave it unparented so its lifetime is independent.
> +	 */
> +	hsmp_pdev.mdev.parent	= NULL;
>  	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
>  	hsmp_pdev.mdev.mode	= 0644;
>  
> @@ -540,6 +558,12 @@ EXPORT_SYMBOL_NS_GPL(hsmp_misc_register, "AMD_HSMP");
>  void hsmp_misc_deregister(void)
>  {
>  	misc_deregister(&hsmp_pdev.mdev);
> +	/*
> +	 * misc_deregister() leaves mdev.this_device pointing at the now
> +	 * destroyed device.  Clear it so a subsequent re-probe does not skip
> +	 * registration on a stale pointer.
> +	 */
> +	hsmp_pdev.mdev.this_device = NULL;

I wonder how hard it would be to just make hsmp_pdev a pointer so the 
struct could be dynamically allocated/freed instead.

In any case, this looks like an independent problem/fix AFAICT.

>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_misc_deregister, "AMD_HSMP");
>  
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 71a8b202aa92..9036cb221635 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -57,7 +57,6 @@ struct hsmp_plat_device {
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

