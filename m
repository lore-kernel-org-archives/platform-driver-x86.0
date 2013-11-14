From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
Subject: Re: [PATCH 3/3] ipc: Added support for IPC interrupt mode
Date: Thu, 14 Nov 2013 13:48:42 +0000
Message-ID: <20131114134842.7225c7f8@alan.etchedpixels.co.uk>
References: <1384373671-12814-1-git-send-email-david.a.cohen@linux.intel.com>
	<1384373671-12814-4-git-send-email-david.a.cohen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:57375 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753628Ab3KNNtB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Nov 2013 08:49:01 -0500
In-Reply-To: <1384373671-12814-4-git-send-email-david.a.cohen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, eric.ernst@linux.intel.com, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

O> +	prompt "IPC access mode"
> +	depends on INTEL_SCU_IPC
> +	default INTEL_SCU_IPC_INTR_MODE
> +	---help---
> +	Select the desired access mode for IPC call.

This seems to depend at runtime on the platform so ifdefs seem
inappropriate.

>  static inline void ipc_command(u32 cmd) /* Send ipc command */
>  {
> +#ifdef CONFIG_INTEL_SCU_IPC_INTR_MODE
> +	INIT_COMPLETION(ipcdev.cmd_complete);
> +	writel(cmd | IPC_IOC, ipcdev.ipc_base);
> +#else
>  	writel(cmd, ipcdev.ipc_base);
> +#endif
>  }

If this is platform specific then add an IRQ to your platform data and
check for it then set an irq field in your scu objects and check at
runtime. If it depends upon the command and/or user then pass irq as a
parameter.

>  
>  /*
> @@ -194,6 +203,37 @@ static inline int busy_loop(void) /* Wait till scu status is busy */
>  	return 0;
>  }
>  
> +#ifdef CONFIG_INTEL_SCU_IPC_INTR_MODE
> +/* Wait till ipc ioc interrupt is received or timeout in 3 HZ */
> +static inline int ipc_wait_for_interrupt(void)
> +{
> +	int status;
> +	int ret = 0;
> +
> +	if (!wait_for_completion_timeout(&ipcdev.cmd_complete, 3 * HZ)) {
> +		ret = -ETIMEDOUT;
> +		goto end;
> +	}
> +
> +	status = ipc_read_status();
> +
> +	if ((status >> 1) & 1)
> +		ret = -EIO;
> +
> +end:
> +	return ret;

What happens on a timeout if the command then completes. Will it not
potentially produce a bogus completion on the next command just being
issued in some cases. Also it should probably be logged ?


So I think

1. Pass the informatio upon whether IRQ mode should be used in the
platform information and remove all the ifdeffery
2. Log timeouts
3. Explain what happens on a timeout that allows you to issue further
commands without a race - eg do you need to do any kind of reset or will
the next command issue stall sufficiently etc ?

Alan
