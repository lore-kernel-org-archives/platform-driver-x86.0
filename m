From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86: add Intel Broxton PMC IPC driver
Date: Thu, 30 Apr 2015 10:55:32 -0700
Message-ID: <20150430175532.GA40200@fury.dvhart.com>
References: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49565 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752013AbbD3Rzc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Apr 2015 13:55:32 -0400
Content-Disposition: inline
In-Reply-To: <1429571069-55055-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com

On Tue, Apr 21, 2015 at 07:04:29AM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> This driver provides support for PMC control on Broxton platforms,
> PMC is ARC processor which defined some IPC commands for communication
> with other entities running in IA
> 

Hi Qipeng,

After the responses from Alan, Fei, and Jacob, I assume a second version of this
patch is in the works.

A few points I do want to call out before that one lands here.

1) There are a number of whitespace errors throughout this patch which make it
harder to review and focus on the technical implementation. Please abide by
coding style and when in doubt, compare with the SCU driver this so closely
resembles.

2) There are a number of undocumented functions which have well documented
parallels in the SCU driver, please pull those in.

3) Alan mentioned a number of cleanups for the SCU driver that are missing from
this one. I wasn't around for those, but I did notice a few rather severe
differences. See the commentary below regarding the ipclock mutex for an
example.

4) As a general rule, and when possible, please order your local variable
declarations in decreasing line length:

	int really_log_variable;
	int a_shorter_one;
	int ret;

Please consider these in your second version.

> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  79 ++++
>  drivers/platform/x86/Kconfig         |   7 +
>  drivers/platform/x86/Makefile        |   1 +
>  drivers/platform/x86/intel_pmc_ipc.c | 740 +++++++++++++++++++++++++++++++++++
>  4 files changed, 827 insertions(+)
>  create mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
>  create mode 100644 drivers/platform/x86/intel_pmc_ipc.c
> 

...

> +
> +int intel_pmc_ipc_simple_command(int cmd, int sub)
> +{
> +	int ret;
> +
> +	if (ipcdev.dev == NULL)
> +		return -ENODEV;
> +
> +	mutex_lock(&ipclock);

In the SCU driver, the check for ipcdev.dev == NULL is done with ipclock held. I
suspect this is because the assignment of ipcdev.ipc is done with the lock held.
While you can catch NULL and exit here without serious detriment in the case of
a race, if you continued after the check and it was set to NULL just before
acquiring the lock, you will end up with a kernel panic.

Other examples of this exist as well.

> +	ipc_send_command(sub << IPC_CMD_SUBCMD | cmd);
> +	ret = intel_pmc_ipc_check_status();
> +	mutex_unlock(&ipclock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(intel_pmc_ipc_simple_command);

...

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
