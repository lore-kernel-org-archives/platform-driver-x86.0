From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] platform:x86: add Intel Broxton PMC IPC driver
Date: Tue, 26 May 2015 23:02:40 -0700
Message-ID: <20150527060240.GA2681@fury.dvhart.com>
References: <1432216020-21643-1-git-send-email-qipeng.zha@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:38135 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752027AbbE0GCm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 02:02:42 -0400
Content-Disposition: inline
In-Reply-To: <1432216020-21643-1-git-send-email-qipeng.zha@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "qipeng.zha" <qipeng.zha@intel.com>
Cc: platform-driver-x86@vger.kernel.org, fei.yang@intel.com, huiquan.zhong@intel.com, jason.cj.chen@intel.com, qi.zheng@intel.com, One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>, Jacob Pan <jacob.jun.pan@intel.com>

On Thu, May 21, 2015 at 09:47:00PM +0800, qipeng.zha wrote:
> From: "qipeng.zha" <qipeng.zha@intel.com>
> 
> This driver provides support for PMC control on Broxton platforms,
> PMC is ARC processor which defined some IPC commands for communication
> with other entities running in IA

A credit to intel_scu_ipc.c is probably in order here - I presume you modeled
this heavily on that driver?

> 
> Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
> ---

Please provide a change log for the various bersions

It really helps to get code reviews if you will take the time to provide your
reviewers with the context they need review the delta from what they have
previously reviewed. See Documentation/SubmittingPatches. This is especially
critical for a 1000 line patch.

Specifically, Alan gave some broad feeback which is generally difficult to
determine if you followed.

Also, Jacob and Fei discussed the regmap interface, and that possibly that would
come later. Is this in the works for this driver?

A few minor nits below, spelling, DEVICE_ATTR_RW usage, etc.

>  arch/x86/include/asm/intel_pmc_ipc.h |  82 ++++
>  drivers/platform/x86/Kconfig         |   7 +
>  drivers/platform/x86/Makefile        |   1 +
>  drivers/platform/x86/intel_pmc_ipc.c | 766 +++++++++++++++++++++++++++++++++++
>  4 files changed, 856 insertions(+)
>  create mode 100644 arch/x86/include/asm/intel_pmc_ipc.h
>  create mode 100644 drivers/platform/x86/intel_pmc_ipc.c


> +	pci_resource = pci_resource_start(pdev, 0);
> +	len = pci_resource_len(pdev, 0);
> +	if (!pci_resource || !len) {
> +		dev_err(&pdev->dev, "Fail to get resource\n");


Here and elsewhere, please use the past tense: "Failed"


> +static DEVICE_ATTR(simplecmd, S_IWUSR | S_IRUSR,
> +		NULL,
> +		intel_pmc_ipc_simple_cmd_store);
> +static DEVICE_ATTR(northpeak, S_IWUSR | S_IRUSR,
> +		NULL,
> +		intel_pmc_ipc_northpeak_store);
> +
> +static struct attribute *intel_ipc_attrs[] = {
> +	&dev_attr_northpeak.attr,
> +	&dev_attr_simplecmd.attr,
> +	NULL
> +};


Please use the DEVICE_ATTR_RW macro.


> +	ret = platform_device_add(pdev);
> +	if (ret) {
> +		dev_err(ipcdev.dev, "Fail to add punit platform devcie\n");


s/devcie/device/


> +
> +MODULE_AUTHOR("qipeng <qipeng.zha@intel.com>");
> +MODULE_DESCRIPTION("Intel PMC IPC driver");
> +MODULE_LICENSE("GPL");
> +
> +fs_initcall(intel_pmc_ipc_init);

If not using module_init(), please document why you need an alternate init
priority.


-- 
Darren Hart
Intel Open Source Technology Center
