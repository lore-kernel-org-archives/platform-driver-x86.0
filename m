From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Tue, 7 Feb 2017 00:01:23 +0530
Message-ID: <20170206183122.GA14651@rajaneesh-OptiPlex-9010>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
 <201702062146.dHHXqmBG%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:28307 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751321AbdBFSb1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Feb 2017 13:31:27 -0500
Content-Disposition: inline
In-Reply-To: <201702062146.dHHXqmBG%fengguang.wu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>
Cc: Shanth Murthy <shanth.murthy@intel.com>, kbuild-all@01.org, platform-driver-x86@vger.kernel.org, dvhart@infradead.org, andriy.shevchenko@linux.intel.com, qipeng.zha@intel.com, linux-kernel@vger.kernel.org

On Mon, Feb 06, 2017 at 10:01:43PM +0800, kbuild test robot wrote:
> Hi Shanth,
> 
> [auto build test ERROR on tip/x86/core]
> [also build test ERROR on v4.10-rc7]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Shanth-Murthy/platform-x86-intel_pmc_ipc-read-s0ix-residency-API/20170206-213213
> config: i386-randconfig-x007-201706 (attached as .config)
> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/platform/x86/intel_pmc_ipc.c: In function 'gcr_data_readq':
> >> drivers/platform/x86/intel_pmc_ipc.c:193:9: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
>      return readq(ipcdev.ipc_base + offset);
>             ^~~~~
>    cc1: some warnings being treated as errors
> 
> vim +/readq +193 drivers/platform/x86/intel_pmc_ipc.c
> 
>    187	{
>    188		return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>    189	}
>    190	
>    191	static inline u64 gcr_data_readq(u32 offset)
>    192	{
>  > 193		return readq(ipcdev.ipc_base + offset);

Seems readq is not available for 32 bit configuration. Will send a fix soon.

>    194	}
>    195	
>    196	static int intel_pmc_ipc_check_status(void)
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation



-- 
Best Regards,
Rajneesh
