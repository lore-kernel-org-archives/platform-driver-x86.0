Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFC3314B77;
	Wed, 22 Jul 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725885; cv=none; b=r92YAYFp4WebGL1pjg/8RIZwLKjzFGPqU794shtzDDdGuj1YaYj92cbTkg4Buss6bEUTO9YpJYcG5xy+iJ5cub9Rl018NWqnFRAn+iC39gRk81dUMGNC/p0vPyj2ofpHWBP3q5X/TQ6pgLXlYvgfpv1LAohuIpzXAQaJlvY+1tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725885; c=relaxed/simple;
	bh=EQJzRYydUltS496SvSnVyvHJz4oeJklkbVf8katfbNo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ewi15o1qwXOPvA+n/d9naa0TmIJbOW+UDjObm2rI0WEEAkOJ5yS/0WTLgsfFO8jbyxt53SZe3DY+yCnqNW5+zjtl8o5HQg1XhBGqoT3soRO8TVxebpX/0IiuMR7Mcba5AhRbFlTzeSVzIRwRfMB2/O7iFnwrZHDHBMnHCCfSmiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=STpfh4Nl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="STpfh4Nl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784725883; x=1816261883;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EQJzRYydUltS496SvSnVyvHJz4oeJklkbVf8katfbNo=;
  b=STpfh4NlJDd6YX8EU26aJye3ikhYy6rdD4DBg15KSKohZTHuDkF16Fxm
   UH5S5dHQcR7t93bglk3/W0Nv40VfiO/MoC+cWi3g3eg5zqvLEBJe0eQif
   6VLHrIiiBndpE8R7kxY9NySl1mpGkymZXRwykjsW8FsQGthOS7BDrTnuM
   vmI8zjZE/iluOPYbx4CmihCp1TBpndSP52EsGT9x4fsu3KfwISBdQcCGj
   IiTAO9gUWpLYXTjdF5CY4KcwRxyPd00K0wnl9rOO7VTYDLNjis+m1XkuH
   iSBRxp7mVq+wJmhU/5CcJysotpidiThH99g8nbIXWE14lXgapLlDg6Cd/
   A==;
X-CSE-ConnectionGUID: Tx1bPKRDR1+FQoOkourGPA==
X-CSE-MsgGUID: xpu8ylJaQ/upjGEnffmQ4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96875871"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96875871"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 06:11:23 -0700
X-CSE-ConnectionGUID: /tsqVbTGQpKyc1u90Z64Lg==
X-CSE-MsgGUID: gQdmyi+zRLineqp7ShgAEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="262379867"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.200])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 06:11:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Jul 2026 16:11:17 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    muthusamy.ramalingam@amd.com
Subject: Re: [PATCH v6 6/6] platform/x86/amd/hsmp: Serialize the data plane
 against socket teardown
In-Reply-To: <20260713044005.1194115-7-muralidhara.mk@amd.com>
Message-ID: <f17da159-2a34-79ea-5fd1-b73b91ea680b@linux.intel.com>
References: <20260713044005.1194115-1-muralidhara.mk@amd.com> <20260713044005.1194115-7-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 13 Jul 2026, Muralidhara M K wrote:

> The HSMP data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads
> call hsmp_send_message() without any coordination with driver teardown.
> misc_deregister() does not drain already-open fds, so an in-flight message
> can race a concurrent unbind and touch a freed socket array or an unmapped
> mailbox.
> 
> Add the read side of hsmp_sock_rwsem to the data plane. Split the message
> send into hsmp_send_message_locked(), which does the bounds check and MMIO
> access and asserts the rwsem is held, and hsmp_send_message(), which wraps
> it in guard(rwsem_read). Probe and remove hold the rwsem for write, so they
> drain in-flight messages and keep new ones out while they tear a socket
> down.
> 
> The probe-time senders run under the probe write lock and so must not take
> the rwsem again: route hsmp_test(), hsmp_cache_proto_ver() and
> hsmp_get_tbl_dram_base() through hsmp_send_message_locked() to avoid
> recursive locking. A single rwsem therefore covers both the data plane and
> the probe/remove handshake, with no separate probe lock:
> 
>  - acpi.c already holds it for write across probe for the socket-array and
>    misc-registration handshake, so the mailbox handshake now nests under
>    that same lock.
> 
>  - plat.c takes it for write around init_platform_device(). It is not held
>    across devm_add_action_or_reset() so the release action, which also
>    takes it for write, cannot deadlock if that registration fails.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> ---

While the code seems okay AFAICT, I think the comments are somewhat 
misleading:

> +int hsmp_send_message(struct hsmp_message *msg)
> +{
> +	/*
> +	 * The data plane is lock-free: open /dev/hsmp fds and hwmon sysfs reads

This says data plane is lock-free.

> +	 * issue messages without coordinating with driver teardown. Take
> +	 * hsmp_sock_rwsem for read so messages run concurrently with each other
> +	 * but are drained and kept out while probe/remove hold it for write to
> +	 * tear a socket down.
> +	 */
> +	guard(rwsem_read)(&hsmp_sock_rwsem);
> +
> +	return hsmp_send_message_locked(msg);
> +}
>  EXPORT_SYMBOL_NS_GPL(hsmp_send_message, "AMD_HSMP");


> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 45dab9253c13..cfd1a8cbd459 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -79,8 +79,8 @@ static inline int hsmp_create_sensor(struct device *dev, u16 sock_ind) { return
>  int hsmp_msg_get_nargs(u16 sock_ind, u32 msg_id, u32 *data, u8 num_args);
>  
>  /*
> - * Serializes HSMP socket bring-up and teardown. ACPI probe and remove take it
> - * for write.
> + * Gates the HSMP data plane: hsmp_send_message() takes it for read; probe and
> + * remove take it for write to bring sockets up and tear them down.
>   */
>  extern struct rw_semaphore hsmp_sock_rwsem;

This says data plane is gated.

Both cannot be true?

> @@ -204,15 +206,20 @@ static int init_platform_device(struct device *dev)
>  /*
>   * The socket array is devm-managed and freed by the driver core, but the
>   * metric-table DRAM regions are mapped with plain ioremap() during probe and
> - * are therefore not covered by devres.
> + * the per-socket mutexes need an explicit mutex_destroy(), neither of which
> + * devres covers.
>   *
> - * Drop those mappings from a devres action so both remove and probe failure
> - * unmap them exactly once, before the socket array they refer to is freed.
> + * Take the data-plane rwsem for write to drain any in-flight

This too talks about data-plane rwsem.

> + * hsmp_send_message(), unmap the metric tables, destroy the mutexes and drop
> + * the global socket pointer, all before devres frees the array. Registered as
> + * a devres action so it runs on both remove and probe failure.
>   */
>  static void hsmp_pltdrv_release(void *data)
>  {
> +	guard(rwsem_write)(&hsmp_sock_rwsem);
>  	hsmp_unmap_metric_tbls(hsmp_pdev);
>  	hsmp_destroy_metric_read_locks(hsmp_pdev);
> +	hsmp_pdev->sock = NULL;
>  }

My own understanding here is that the first comment tried to tell what 
the situation was before this patch (data plane was indeed lock free), not 
the behavior after the patch. Is my understanding correct?

To avoid potential terminology related confusion, rwsem is still a lock 
(even if the read sides are not block each other).

We don't write about historic state of things but document only the 
current code does. So if it's no longer lock free, stating it's lock 
free is sure way to confuse the reader. :-)

-- 
 i.

