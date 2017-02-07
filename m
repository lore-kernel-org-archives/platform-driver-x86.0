From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: read s0ix residency API
Date: Tue, 7 Feb 2017 12:19:10 +0200
Message-ID: <CAHp75VdHArjvkkx2CiLQZ2fvhwNhChNwvoCKrU7g7RMj=-nG=w@mail.gmail.com>
References: <1486386591-5739-1-git-send-email-shanth.murthy@intel.com>
 <201702062146.dHHXqmBG%fengguang.wu@intel.com> <20170206183122.GA14651@rajaneesh-OptiPlex-9010>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170206183122.GA14651@rajaneesh-OptiPlex-9010>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: kbuild test robot <lkp@intel.com>, Shanth Murthy <shanth.murthy@intel.com>, kbuild-all@01.org, Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Zha Qipeng <qipeng.zha@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 6, 2017 at 8:31 PM, Rajneesh Bhardwaj
<rajneesh.bhardwaj@intel.com> wrote:
> On Mon, Feb 06, 2017 at 10:01:43PM +0800, kbuild test robot wrote:
>> Hi Shanth,
>>
>> [auto build test ERROR on tip/x86/core]
>> [also build test ERROR on v4.10-rc7]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Shanth-Murthy/platform-x86-intel_pmc_ipc-read-s0ix-residency-API/20170206-213213
>> config: i386-randconfig-x007-201706 (attached as .config)
>> compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
>> reproduce:
>>         # save the attached .config to linux build tree
>>         make ARCH=i386
>>
>> All errors (new ones prefixed by >>):
>>
>>    drivers/platform/x86/intel_pmc_ipc.c: In function 'gcr_data_readq':
>> >> drivers/platform/x86/intel_pmc_ipc.c:193:9: error: implicit declaration of function 'readq' [-Werror=implicit-function-declaration]
>>      return readq(ipcdev.ipc_base + offset);
>>             ^~~~~
>>    cc1: some warnings being treated as errors
>>
>> vim +/readq +193 drivers/platform/x86/intel_pmc_ipc.c
>>
>>    187        {
>>    188                return readl(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>>    189        }
>>    190
>>    191        static inline u64 gcr_data_readq(u32 offset)
>>    192        {
>>  > 193                return readq(ipcdev.ipc_base + offset);
>
> Seems readq is not available for 32 bit configuration. Will send a fix soon.

I fixed and pushed to testing. No need to resend.
Thanks!


>
>>    194        }
>>    195
>>    196        static int intel_pmc_ipc_check_status(void)


-- 
With Best Regards,
Andy Shevchenko
