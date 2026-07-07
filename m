Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0BA72618;
	Tue,  7 Jul 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426993; cv=none; b=C5dDa/d+A+FCXw6BE9APlwyfB+FWGBZ2z8s8PMiOFABQNC8PAz/a0q84dZYKVkN/2AnymmtQ2pVCScnrUueecXZN9+tt48uDGBcAeOUaiWLo0l7f9BCfxWPkRdEfNE0nre9Mfl33VpUu4djrW9XGOfWGCnLSViUXDE8a7A5CYJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426993; c=relaxed/simple;
	bh=hiJuwORdlV4mHlFNUtb8z3tTdZ8n6s1UHXoJO0E3MHg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uS+Pd7PgQlXFRxVGKYHhBO9kFheDZCPpW6crjov2BUTCLEroAtI2ZWQJmPGvpuXg5d+4xUiwcPcI7EUSUNlJhg1JGsQq4TMdiu0SkirUq3RWDfooBI2r6tXI296okCdVHaxr18CQF2KnXuu5Y2o6it99XoVDFq5lQCy/CNTvlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jsSr2p8U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jsSr2p8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783426992; x=1814962992;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=hiJuwORdlV4mHlFNUtb8z3tTdZ8n6s1UHXoJO0E3MHg=;
  b=jsSr2p8UM2fmR7Jzocson9YjXLKb7Jtk+rJXLE4jmPON1NZ3ONuexgyr
   HYODBS4aVxuy/jqqcy1XGduQ4BV5vjT0msR6Z51mbpCUt08ipIpziGhgB
   TzLyN1OsGMKyXwHic165QfSUsNbWvcKkjacqVBRvcx9QDCvZpwFzTGNgO
   +DH7Jry7dIunhF1ICyguHc6nIKSI2rzhbdmHB3qposuhqL6gQkttxhTGA
   PhC8WLfRTJjMjn7kDlrudYS/fLfPI8wNMCzAyWCkTQkx6qhfdixu6TLOY
   G4O3HlsOpDh3xFQLsmfgU965IkPlyUtdJds4icKknR/58KeK2bijf3+SK
   Q==;
X-CSE-ConnectionGUID: iMfEUtAoShivLjb8beJV6g==
X-CSE-MsgGUID: hHe7JCsjQemQ4p4IA4563A==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="84095577"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="84095577"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:23:12 -0700
X-CSE-ConnectionGUID: z2IcqUQaSbmfpRhKKZ9Ytg==
X-CSE-MsgGUID: UW+JvgxzRHOV1Y1k1XMNDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="258888994"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.226])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 05:23:09 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jul 2026 15:23:06 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v3 5/5] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
In-Reply-To: <20260707051731.3382577-1-muralidhara.mk@amd.com>
Message-ID: <707da8e1-aaee-a221-3bfd-24d9c38415f4@linux.intel.com>
References: <20260707051731.3382577-1-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Jul 2026, Muralidhara M K wrote:

> The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs
> reads call hsmp_send_message() without any coordination with driver
> teardown.  misc_deregister() does not drain already-open fds, so an
> in-flight message can race a concurrent unbind and touch a freed socket
> array or an unmapped mailbox.
> 
> Add hsmp_sock_rwsem and export it so the data plane and the teardown
> paths take it directly.  hsmp_send_message() holds it for read across the
> whole bounds-check + MMIO access via guard(rwsem_read) from cleanup.h, so
> it is dropped on every return path without adding an unlock label.  A
> teardown path holds it for write (down_write() directly at the call site)
> to drain any in-flight message and keep new ones out while it tears the
> socket down.
> 
> Wire both teardown paths into the drain in this patch so it is clear who
> locks what:
> 
>  - plat.c: hsmp_pltdrv_remove() and the probe-failure cleanup take the
>    write lock and drop the global socket pointer before devres frees the
>    devm_kcalloc() array.  num_sockets is left intact so a later rebind can
>    re-create the array.
> 
>  - acpi.c: hsmp_acpi_remove() and the probe-failure cleanup take the write
>    lock (nested inside hsmp_acpi_probe_mutex) while they clear sock->dev
>    and, on the last unbind, unmap the mailbox and free the socket array via
>    hsmp_acpi_sock_release().
> 
> hsmp_sock_rwsem is deliberately separate from acpi.c's
> hsmp_acpi_probe_mutex: the probe mutex serializes the ACPI control-plane
> handshake (one-time socket-array allocation, misc registration state and
> the hsmp_acpi_sock_refs lifecycle) across concurrent probe/remove, a scope
> this rwsem does not cover.  The two nest as probe_mutex -> rwsem write.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 27 ++++++++++++++++-----
>  drivers/platform/x86/amd/hsmp/hsmp.c | 35 +++++++++++++++++++++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.h |  9 +++++++
>  drivers/platform/x86/amd/hsmp/plat.c | 23 ++++++++++++++++++
>  4 files changed, 87 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 11a478503fa7..ff6154426a81 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -623,9 +623,9 @@ MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
>   * destroy the per-socket mutexes and free the socket array.
>   *
>   * Called with hsmp_acpi_probe_mutex held (serializing it against a concurrent
> - * probe).  Coordination with the lock-free data plane (draining in-flight
> - * hsmp_send_message() before the mailbox is unmapped and the array is freed)
> - * is added in a subsequent patch via the data-plane rwsem.
> + * probe) and with the data-plane rwsem held for write, which has drained any
> + * in-flight hsmp_send_message(), so unmapping the mailbox and freeing the
> + * array here cannot race the lock-free data plane.
>   */
>  static void hsmp_acpi_sock_release(void)
>  {
> @@ -653,6 +653,10 @@ static void hsmp_acpi_sock_release(void)
>   * remove() is never called for this device, yet devres unmaps its mailbox once
>   * probe() returns.  Without clearing dev, a later message to this index would
>   * pass every gate in hsmp_send_message() and reach the unmapped mailbox.
> + *
> + * Runs under the data-plane rwsem write side so it is serialized against the
> + * lock-free data plane: init_acpi() runs hsmp_test() and a previously probed
> + * socket may already have exposed /dev/hsmp.
>   */
>  static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
>  {
> @@ -660,11 +664,15 @@ static void hsmp_acpi_probe_failure_cleanup(struct device *dev)
>  
>  	lockdep_assert_held(&hsmp_acpi_probe_mutex);
>  
> +	down_write(&hsmp_sock_rwsem);

Using guard() is preferred.

> +
>  	if (sock)
>  		sock->dev = NULL;
>  
>  	if (!hsmp_acpi_sock_refs)
>  		hsmp_acpi_sock_release();
> +
> +	up_write(&hsmp_sock_rwsem);
>  }
>  
>  static int hsmp_acpi_probe(struct platform_device *pdev)
> @@ -725,20 +733,27 @@ static void hsmp_acpi_remove(struct platform_device *pdev)
>  	 */
>  	guard(mutex)(&hsmp_acpi_probe_mutex);
>  
> +	/*
> +	 * Drain the lock-free data plane and keep it out for the duration of
> +	 * the teardown.  This covers both the per-socket unbind (this socket's
> +	 * mailbox is unmapped by devres once we return) and the last unbind that
> +	 * frees the socket array in hsmp_acpi_sock_release().
> +	 */
> +	down_write(&hsmp_sock_rwsem);

Ditto.

> +
>  	/*
>  	 * Clear this socket's dev so hsmp_send_message() rejects it before
>  	 * touching the mailbox that devres is about to unmap.  On a non-final
>  	 * unbind the socket array stays alive, so without this a later message
>  	 * to this index would reach an unmapped iomem region.
> -	 *
> -	 * This teardown is drained against the lock-free data plane in a
> -	 * subsequent patch that wires it into the data-plane rwsem.
>  	 */
>  	if (sock)
>  		sock->dev = NULL;
>  
>  	if (!--hsmp_acpi_sock_refs)
>  		hsmp_acpi_sock_release();
> +
> +	up_write(&hsmp_sock_rwsem);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 8440671235de..d9b6cb66ee33 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>
>  #include <linux/io.h>
>  #include <linux/mutex.h>
> +#include <linux/rwsem.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
> @@ -43,6 +44,27 @@
>  
>  static struct hsmp_plat_device hsmp_pdev;
>  
> +/*
> + * Serializes the lock-free data plane (hsmp_send_message() and the per-socket
> + * MMIO access it performs) against socket teardown.  Callers of the data plane
> + * take it for read (guard(rwsem_read)) so multiple sockets can be driven

Just remove the part in parenthesis

> + * concurrently; a teardown path takes it for write (down_write() directly in
> + * plat.c/acpi.c) while it clears sock->dev, frees the socket array or unmaps
> + * the mailbox, so a reader can never observe a half-torn-down or freed socket.

You didn't answer my earlier question about why the probe side cannot 
synchronize with this same rwsem by taking it for write but you added 
mutex instead?

> + *
> + * This is distinct from acpi.c's hsmp_acpi_probe_mutex: that mutex serializes
> + * the ACPI control-plane handshake (one-time socket-array allocation, misc
> + * device registration state and the socket refcount lifecycle) across
> + * concurrent per-socket probe/remove, a scope this rwsem intentionally does
> + * not cover.  A teardown path nests the rwsem write side inside that mutex.
> + *
> + * Both teardown paths take the write side directly: the non-ACPI platform
> + * path (plat.c) and the ACPI path (acpi.c), the latter relying on the
> + * refcounted socket ownership added in the preceding patch.

"the preceding patch" is not acceptable terminology in a comment. There's 
no way to anchor "previous patch" in the current state of code.

> + */
> +DECLARE_RWSEM(hsmp_sock_rwsem);
> +EXPORT_SYMBOL_NS_GPL(hsmp_sock_rwsem, "AMD_HSMP");
> +
>  /*
>   * Send a message to the HSMP port via PCI-e config space registers
>   * or by writing to MMIO space.
> @@ -214,6 +236,16 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * Hold the teardown rwsem for read across the whole MMIO access.  A
> +	 * teardown path takes it for write before clearing sock->dev, freeing
> +	 * the socket array or unmapping the mailbox, so the lock-free data plane
> +	 * (open /dev/hsmp fds and hwmon sysfs reads) can never dereference a
> +	 * freed socket or touch an unmapped mailbox.  guard() drops it on every
> +	 * return path below.
> +	 */
> +	guard(rwsem_read)(&hsmp_sock_rwsem);
> +
>  	if (!hsmp_pdev.sock || msg->sock_ind >= hsmp_pdev.num_sockets)
>  		return -ENODEV;
>  
> @@ -234,7 +266,8 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
>  	 * the semaphore are visible.
>  	 *
> -	 * Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table().
> +	 * Held under hsmp_sock_rwsem; pairs with smp_store_release(&sock->dev)
> +	 * in hsmp_parse_acpi_table().
>  	 */
>  	if (!smp_load_acquire(&sock->dev))
>  		return -ENODEV;
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 9036cb221635..091c9e92a80c 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -17,6 +17,7 @@
>  #include <linux/miscdevice.h>
>  #include <linux/mutex.h>
>  #include <linux/pci.h>
> +#include <linux/rwsem.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
> @@ -70,6 +71,14 @@ ssize_t hsmp_metric_tbl_read(struct hsmp_socket *sock, char *buf, size_t size);
>  void hsmp_destroy_metric_read_locks(struct hsmp_plat_device *pdev);
>  void hsmp_unmap_metric_tbls(struct hsmp_plat_device *pdev);
>  struct hsmp_plat_device *get_hsmp_pdev(void);
> +
> +/*
> + * Data-plane teardown rwsem.  hsmp_send_message() holds it for read; a
> + * teardown path in plat.c/acpi.c holds it for write (down_write()) to drain
> + * the data plane while it clears sock->dev, frees the socket array or unmaps
> + * the mailbox.
> + */
> +extern struct rw_semaphore hsmp_sock_rwsem;
>  #if IS_ENABLED(CONFIG_HWMON)
>  int hsmp_create_sensor(struct device *dev, u16 sock_ind);
>  #else
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index 8b3e5e767327..3ad4471ed46e 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -234,17 +234,40 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	 * failing.  hsmp_unmap_metric_tbls() drops those mappings and
>  	 * hsmp_destroy_metric_read_locks() tears down the per-socket mutexes;
>  	 * the socket array itself is devm-managed.
> +	 *
> +	 * init_platform_device() also runs the data plane (hsmp_test()), so

If you want to reference a function name, please try to avoid 
those parenthesis around it and merge it naturally into the sentence.
It's done in many of your comments and those extra parenthesis just reduce 
readability IMO.

> +	 * drain it via the write side of hsmp_sock_rwsem and drop the global
> +	 * socket pointer before devres frees the array.  num_sockets is left
> +	 * intact: it is only computed once in __init (amd_num_nodes()) and is
> +	 * needed to re-create the array on a later rebind.
>  	 */
> +	down_write(&hsmp_sock_rwsem);

guard()

>  	hsmp_unmap_metric_tbls(hsmp_pdev);
>  	hsmp_destroy_metric_read_locks(hsmp_pdev);
> +	hsmp_pdev->sock = NULL;
> +	up_write(&hsmp_sock_rwsem);
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

I don't think you need to talk about num_sockets, if you want to say 
that, it belongs to the changelog.

> +	 */
> +	down_write(&hsmp_sock_rwsem);

guard()

>  	hsmp_misc_deregister();
>  	hsmp_unmap_metric_tbls(hsmp_pdev);
>  	hsmp_destroy_metric_read_locks(hsmp_pdev);
> +	hsmp_pdev->sock = NULL;
> +	up_write(&hsmp_sock_rwsem);
>  }
>  
>  static struct platform_driver amd_hsmp_driver = {
> 

-- 
 i.

