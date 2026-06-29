Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006C51A5B8A;
	Mon, 29 Jun 2026 12:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737439; cv=none; b=cA8bM3EJg13kGYF13wg2MBmB8sh8ZH9wjkf4wlCobxoCPHvGnhWqiYqmhhtsgJK1cJ1X9yR2XNkaHnlOW7xPiw2m0TMWTK8A+HLKcd6UyEl6RSUTSj02nHLaG9g3YayA0COnCS/e2v1950LDkZUFgAhBDFtteAn07f4iBC/VXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737439; c=relaxed/simple;
	bh=D6iBli2mNEsy01O3TXD1yYq0kj8+dz9u99NB/utwdDE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JFakSOqSn4Vq2F1Mtem5/cF7+xJJfqQduTYvDt/9T1szCLC5y5591eDEvMUim+7Rrr6iHj35Sc4OXyMIroFHfRNW0Oejpr5zX8UgzcZEvJaz3bBmjp9t72MPveTyO8uY2n7iEyOma3KahbVlG02aoaJJ5R95zA4dVeUDGmykvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9ebPH1u; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9ebPH1u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782737438; x=1814273438;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=D6iBli2mNEsy01O3TXD1yYq0kj8+dz9u99NB/utwdDE=;
  b=W9ebPH1u78g9gwMQlUU49v9yZ2C2ROTPkFmQyYgNhaLGd3EmKr6WPkFO
   6+kjw4D7+vVirItd92d+cNWgKl8z8t3gK1YefQNNHdKil05aYGZ+vCsz1
   lWQsdLt+BNtVfVXqXYW0a5YP7mK75EM/lB8JoHPYoe49r2X+u8TGZaEVk
   UkFCp4FuoXwe9wrHZLmfpTXB4iFX0U4nTuJcJc9B3UBoS0E8MyllkbFY7
   Zfgy12vvBCuRKV53BLn8dITSYxPmJ3K/Rr5yFRKntRHpJ9MdQhQoJH1pJ
   EA04H6MuEX2FsWRinAAQPZAAu80AwwThQoLeB0U5+kFyUHLQ28ahUOM8B
   A==;
X-CSE-ConnectionGUID: hnPu/HV/TJqyB9dE+1zXag==
X-CSE-MsgGUID: 4xQUXZKGT4mbuz6hS51w+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83623041"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="83623041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:50:38 -0700
X-CSE-ConnectionGUID: 7kXjRSpxR7iQnebZv1bQhA==
X-CSE-MsgGUID: E6bvzGMzQ8uk95nKX/j2TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="247498110"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.42])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 05:50:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 29 Jun 2026 15:50:33 +0300 (EEST)
To: Muralidhara M K <muralidhara.mk@amd.com>
cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] platform/x86/amd/hsmp: Gate the data plane on a
 fully initialized socket
In-Reply-To: <20260629073923.1595696-5-muralidhara.mk@amd.com>
Message-ID: <1ae5a8f4-9585-f520-e2fd-e32872b387f1@linux.intel.com>
References: <20260629073923.1595696-1-muralidhara.mk@amd.com> <20260629073923.1595696-5-muralidhara.mk@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 29 Jun 2026, Muralidhara M K wrote:

> hsmp_parse_acpi_table() published sock->dev before hsmp_read_acpi_crs()
> had mapped virt_base_addr.  sock->dev is the readiness gate for the
> lock-free data plane, so on a multi-socket system - where socket 0
> exposes /dev/hsmp before later sockets finish probing - an ioctl aimed
> at a socket still in bring-up could pass the gate and dereference a NULL
> virt_base_addr.
> 
> Publish sock->dev last with smp_store_release() once virt_base_addr, the
> mailbox offsets and the semaphore are initialized, and read it with
> smp_load_acquire() in hsmp_send_message() so a non-NULL dev guarantees
> the rest of the socket state is visible.
> 
> Signed-off-by: Muralidhara M K <muralidhara.mk@amd.com>
> Link: https://lore.kernel.org/platform-driver-x86/20260625123337.886435-5-muralidhara.mk@amd.com/T/#u [1]

What is the purpose of these links? We don't generally link to older 
version of the change unless there's clearly some useful discussion there.

> ---
>  drivers/platform/x86/amd/hsmp/acpi.c | 18 ++++++++++++++++--
>  drivers/platform/x86/amd/hsmp/hsmp.c | 12 ++++++++++++
>  2 files changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index f7fbba4c6b66..5aec3bded712 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -224,7 +224,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	int ret;
>  
>  	sock->sock_ind		= sock_ind;
> -	sock->dev		= dev;
>  	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
>  
>  	sema_init(&sock->hsmp_sem, 1);
> @@ -237,7 +236,22 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  		return ret;
>  
>  	/* Read mailbox offsets from DSD table */
> -	return hsmp_read_acpi_dsd(sock, dev);
> +	ret = hsmp_read_acpi_dsd(sock, dev);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Publish sock->dev last.  hsmp_send_message() uses it (via
> +	 * smp_load_acquire()) as the readiness gate for the lock-free data
> +	 * plane, so it must become visible only after virt_base_addr, the
> +	 * mailbox offsets and the semaphore are fully initialized.  On a
> +	 * multi-socket system socket 0 exposes /dev/hsmp before later sockets
> +	 * finish probing, so without this an ioctl aimed at a socket still in
> +	 * bring-up could pass the gate and dereference a NULL virt_base_addr.
> +	 */
> +	smp_store_release(&sock->dev, dev);
> +
> +	return 0;
>  }
>  
>  static ssize_t hsmp_metric_tbl_acpi_read(struct file *filp, struct kobject *kobj,
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 6a26937fc2b5..0cd4f691db49 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -223,6 +223,18 @@ int hsmp_send_message(struct hsmp_message *msg)
>  	sock_ind = array_index_nospec(msg->sock_ind, hsmp_pdev.num_sockets);
>  	sock = &hsmp_pdev.sock[sock_ind];
>  
> +	/*
> +	 * A slot exists for every possible socket, but it is only usable once
> +	 * that socket has actually been probed.  Reject messages aimed at a
> +	 * socket that was never brought up or is still in bring-up, so we never
> +	 * operate on a zero-initialized semaphore or an unmapped mailbox.  A
> +	 * non-NULL dev also guarantees virt_base_addr, the mailbox offsets and
> +	 * the semaphore are visible.
> +	 */
> +	/* Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table(). */

Change to:

	/*
	 ...
	 * the semaphore are visible.
	 *
	 * Pairs with smp_store_release(&sock->dev) in hsmp_parse_acpi_table().
	 */
> +	if (!smp_load_acquire(&sock->dev))
> +		return -ENODEV;
> +
>  	ret = down_interruptible(&sock->hsmp_sem);
>  	if (ret < 0)
>  		return ret;
> 

-- 
 i.

