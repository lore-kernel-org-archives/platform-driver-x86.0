From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v6][RESEND] platform: x86: New BayTrail IOSF-SB MBI driver
Date: Tue, 07 Jan 2014 10:15:03 -0800
Message-ID: <52CC4427.20405@infradead.org>
References: <1388427149-25456-1-git-send-email-david.e.box@linux.intel.com> <1389117812-28061-1-git-send-email-david.e.box@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:38256 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752765AbaAGSPH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jan 2014 13:15:07 -0500
In-Reply-To: <1389117812-28061-1-git-send-email-david.e.box@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "David E. Box" <david.e.box@linux.intel.com>, mjg59@srcf.ucam.org, rjw@rjwysocki.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On 01/07/14 10:03, David E. Box wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index b51a746..6e199a5 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -819,4 +819,14 @@ config PVPANIC
>  	  a paravirtualized device provided by QEMU; it lets a virtual machine
>  	  (guest) communicate panic events to the host.
>  
> +config INTEL_BAYTRAIL_MBI
> +	tristate

Is this kconfig option displayed when you run menuconfig/nconfig/xconfig/gconfig etc.?
Doesn't it need a prompt string?
How did you enable it and test it?

> +	depends on PCI
> +	---help---
> +	  Needed on Baytrail platforms for access to the IOSF Sideband Mailbox
> +	  Interface. This is a requirement for systems that need to configure
> +	  the PUNIT for power management features such as RAPL. Register
> +	  addresses and r/w opcodes are defined in

Think of users reading this.  At least change "r/w" to read/write.
What is IOSF?  does it matter here?
PUNIT?  RAPL?

> +	  drivers/platform/x86/intel_baytrail.c.
> +
>  endif # X86_PLATFORM_DEVICES


-- 
~Randy
