From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v16 18/22] platform/x86: Intel SGX driver
Date: Tue, 06 Nov 2018 08:40:00 -0800
Message-ID: <1541522400.7839.48.camel@intel.com>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
         <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2018-11-06 at 15:45 +0200, Jarkko Sakkinen wrote:
> Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> can be used by applications to set aside private regions of code and
> data. The code outside the enclave is disallowed to access the memory
> inside the enclave by the CPU access control.
> 
> SGX driver provides a ioctl API for loading and initializing enclaves.
> Address range for enclaves is reserved with mmap() and they are
> destroyed with munmap(). Enclave construction, measurement and
> initialization is done with the provided the ioctl API.

...

> +struct sgx_encl {
> +	unsigned int flags;
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	unsigned int page_cnt;
> +	unsigned int secs_child_cnt;
> +	struct mutex lock;
> +	struct mm_struct *mm;
> +	struct file *backing;

Is there any particular reason why the kernel manages the backing for
the enclave and the PCMDs?  Could we have userspace provide the backing
either through the ECREATE ioctl() or maybe a completely new ioctl(),
e.g. to give userspace the option to back the enclave with a NVDIMM
instead of RAM?  A separate ioctl() with control flags might give us
some flexibility in the future, e.g. maybe there are use cases where
userspace would prefer to kill enclaves rather than swap EPC.

> +	struct kref refcount;
> +	unsigned long base;
> +	unsigned long size;
> +	unsigned long ssaframesize;
> +	struct radix_tree_root page_tree;
> +	struct list_head add_page_reqs;
> +	struct work_struct add_page_work;
> +	struct sgx_encl_page secs;
> +	struct pid *tgid;
> +	struct mmu_notifier mmu_notifier;
> +	struct notifier_block pm_notifier;
> +};
