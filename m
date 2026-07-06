Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039E541D4E6;
	Mon,  6 Jul 2026 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338071; cv=none; b=QtYWoqk4epSZLDJP0JlypAx08VvZxss04ju6VD4Go6j9ijL20IPm0k08CvAUkkbwDpctcBUQprqYfvcenNId3niK2JCpptro02yCf+ToBw1N4zKceT7l3OocxxE4KlLgVcH29iG2OL7Zj5X0rEvgJnoP5bM0gpYSWXM+jVKY0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338071; c=relaxed/simple;
	bh=nSlQP4XFpXMopXT/GVqAQB3dDMBfqKkJpkEqEhFWpyg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=blhZptebpEymhBpzbVgzXyKOOlBQ7m7yW2CuQQ6WYsUtIaUn+ZezIDS0nYx04nobHHheYaZPu65HTk20dzzYWUIC2XumzUcqr9eoA9naDxnPBvxr/KpauAsw4b2mEaZdbSaX+oJE3M50S44aQ/nWpd8VSwj7XXm3VTf5RZ9+G6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYshEyB9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYshEyB9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783338069; x=1814874069;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=nSlQP4XFpXMopXT/GVqAQB3dDMBfqKkJpkEqEhFWpyg=;
  b=FYshEyB9MLR8blV/PwSohqmWFovIS4C7cZnvCyiKzkZEDOA/fVrRt6pD
   cIvVoQm3HGYFQ9bRNHt++vhMPNoVZhvCD/GGFaZBprKNzIzPnRr5Uo5SQ
   3E6PaO3jCehBrW5cojJU1mhTnBphPGI5Xb/U8SH5l+NFvzo9lFuQ4QlHQ
   EJmWUKWRjSqwGGexVR27bzYW+jUz0iS70v+6dTfwMvlh3Xg8/0uQd9tLE
   xsVDu0rJIF8auCq0KXyonaWffSNWJKMsRbJPwil37qf3+xxrBnlB0z5FB
   ZztS83lDabvnbKk9E17aTntQb0cUlsES++7al76mtOR6/D2nqLPVzUia/
   g==;
X-CSE-ConnectionGUID: dv/CkJebRg2epYa6qn7aFA==
X-CSE-MsgGUID: N2AO1qzaRuy5dpKlKr+r4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82948937"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="82948937"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:41:08 -0700
X-CSE-ConnectionGUID: OfUVklBUR5yUv4SZ6IE5Ng==
X-CSE-MsgGUID: lTl39yMsQ8qhfAnJm6FKrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="258595411"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.95])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 04:41:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 Jul 2026 14:41:03 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: muthusamy.ramalingam@amd.com, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/7] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
In-Reply-To: <20260625123337.886435-6-muralidhara.mk@amd.com>
Message-ID: <0c56c0bc-a14d-dc75-9897-b70127c8e991@linux.intel.com>
References: <20260625123337.886435-1-muralidhara.mk@amd.com> <20260625123337.886435-6-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 25 Jun 2026, Muralidhara M K wrote:

> The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs
> reads call hsmp_send_message() without any coordination with driver
> teardown.  misc_deregister() does not drain already-open fds, so an
> in-flight message can race a concurrent unbind and touch a freed socket
> array or an unmapped mailbox.
> 
> Add hsmp_sock_rwsem.  hsmp_send_message() now holds it for read across
> the whole bounds-check + MMIO access, and hsmp_sock_teardown_lock()/
> hsmp_sock_teardown_unlock() let a teardown path hold it for write to
> drain any in-flight message and keep new ones out while it tears the
> socket down.
> 
> Wire the non-ACPI platform path into the drain: hsmp_pltdrv_remove()
> and the probe-failure cleanup take the write lock and drop the global
> socket pointer before devres frees the devm_kcalloc() array.  num_sockets
> is left intact so a later rebind can re-create the array.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/hsmp.c | 55 +++++++++++++++++++++++++---
>  drivers/platform/x86/amd/hsmp/hsmp.h |  2 +
>  drivers/platform/x86/amd/hsmp/plat.c | 23 ++++++++++++
>  3 files changed, 74 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index c3939908d95f..c15acba241c4 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -15,6 +15,7 @@
>  #include <linux/io.h>
>  #include <linux/mutex.h>
>  #include <linux/nospec.h>
> +#include <linux/rwsem.h>
>  #include <linux/semaphore.h>
>  #include <linux/slab.h>
>  #include <linux/sysfs.h>
> @@ -44,6 +45,16 @@
>  
>  static struct hsmp_plat_device hsmp_pdev;
>  
> +/*
> + * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
> + * MMIO access it performs) against socket teardown.  Callers of the data plane
> + * hold it for read so multiple sockets can be driven concurrently; ACPI
> + * removal holds it for write while it clears sock->dev,

I don't see acpi change in this patch (just hsmp_send_message and plat 
changes)???

> frees the socket array
> + * and unmaps the mailbox, so a reader can never observe a half-torn-down or
> + * freed socket.
> + */
> +static DECLARE_RWSEM(hsmp_sock_rwsem);
> +
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
>   * or by writing to MMIO space.
> @@ -215,8 +226,19 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	if (ret)
>  		return ret;
>  
> -	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
> -		return -ENODEV;
> +	/*
> +	 * Hold the teardown rwsem for read across the whole MMIO access.  ACPI
> +	 * removal takes it for write before clearing sock->dev, freeing the
> +	 * socket array and unmapping the mailbox, so the lock-free data plane
> +	 * (open /dev/hsmp fds and hwmon sysfs reads) can never dereference a
> +	 * freed socket or touch an unmapped mailbox.
> +	 */
> +	down_read(&hsmp_sock_rwsem);
> +
> +	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets) {
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
>  
>  	/*
>  	 * Sanitize sock_ind after the bounds check.  A mispredicted branch can
> @@ -235,18 +257,22 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	 * semaphore or an unmapped mailbox.  A non-NULL dev also guarantees
>  	 * virt_base_addr, the mailbox offsets and the semaphore are visible.
>  	 */
> -	/* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */
> -	if (!smp_load_acquire(&sock->dev))
> -		return -ENODEV;
> +	/* Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev). */
> +	if (!smp_load_acquire(&sock->dev)) {
> +		ret = -ENODEV;
> +		goto out_unlock;
> +	}
>  
>  	ret = down_interruptible(&sock->hsmp_sem);
>  	if (ret < 0)
> -		return ret;
> +		goto out_unlock;
>  
>  	ret = __hsmp_send_message(sock, msg);
>  
>  	up(&sock->hsmp_sem);
>  
> +out_unlock:
> +	up_read(&hsmp_sock_rwsem);

Don't add unlock labels at the end but please use cleanup.h. It will 
simplify the patch too as you don't need to alter those direct returns.

>  	return ret;
>  }
>  EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");
> @@ -529,6 +555,23 @@ struct hsmp_plat_device *get_hsmp_pdev(void)
>  }
>  EXPORT_SYMBOL_NS_GPL(get_hsmp_pdev, "AMD_HSMP");
>  
> +/*
> + * Take the write side of the data-plane rwsem.  A caller tearing a socket down
> + * uses this to drain any in-flight hsmp_send_message() and to keep new ones out
> + * while it clears sock->dev, frees the socket array or unmaps the mailbox.
> + */
> +void hsmp_sock_teardown_lock(void)
> +{
> +	down_write(&hsmp_sock_rwsem);
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_lock, "AMD_HSMP");
> +
> +void hsmp_sock_teardown_unlock(void)
> +{
> +	up_write(&hsmp_sock_rwsem);
> +}
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_teardown_unlock, "AMD_HSMP");

Just export the lock to be taken directly in plat/acpi. It's much easier 
to follow who locks what when you don't add wrappers like this.

I don't understand why acpi doesn't use write side of this lock though 
but has it's own lock (hsmp_acpi_probe_mutex)?

>  MODULE_DESCRIPTION("AMD HSMP Common driver");
>  MODULE_VERSION(DRIVER_VERSION);
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 91bc21232646..5d0a6d819865 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -70,6 +70,8 @@ void hsmp_init_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets)
>  ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>  void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev, u16 num_sockets);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
> +void hsmp_sock_teardown_lock(void);
> +void hsmp_sock_teardown_unlock(void);
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  #else
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 685f2d2c574b..26c1363e79a1 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -233,15 +233,38 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	 * init_platform_device() may have ioremap()ed metric tables before
>  	 * failing.  hsmp_destroy_metric_read_locks() unmaps them and tears
>  	 * down the per-socket mutexes; the socket array itself is devm-managed.
> +	 *
> +	 * init_platform_device() also runs the data plane (hsmp_test()), so
> +	 * drain it via the teardown rwsem and drop the global socket pointer
> +	 * before devres frees the array.  num_sockets is left intact: it is
> +	 * only computed once in __init (amd_num_nodes()) and is needed to
> +	 * re-create the array on a later rebind.
>  	 */
> +	hsmp_sock_teardown_lock();
>  	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
> +	hsmp_pdev->sock = NULL;
> +	hsmp_sock_teardown_unlock();
>  	return ret;
>  }
>  
>  static void hsmp_pltdrv_remove(struct platform_device *pdev)
>  {
> +	/*
> +	 * Drain the lock-free data plane and keep it out while the sockets are
> +	 * torn down.  misc_deregister() does not drain already-open /dev/hsmp
> +	 * fds and the driver permits sysfs unbind, so without this an in-flight
> +	 * hsmp_send_message() could touch the devres-freed socket array or an
> +	 * iounmap()ed metric table.  Dropping the global socket pointer makes
> +	 * later messages bail out at the first check.  num_sockets is left
> +	 * intact so an unbind/rebind cycle can re-create the array; it is only
> +	 * computed once in __init (amd_num_nodes()) and is never recomputed on
> +	 * probe.
> +	 */
> +	hsmp_sock_teardown_lock();
>  	hsmp_misc_deregister();
>  	hsmp_destroy_metric_read_locks(hsmp_pdev, hsmp_pdev->num_sockets);
> +	hsmp_pdev->sock = NULL;
> +	hsmp_sock_teardown_unlock();
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 

-- 
 i.

