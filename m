From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH v16 18/22] platform/x86: Intel SGX driver
Date: Wed, 7 Nov 2018 10:29:20 +0000
Message-ID: <ed7b04087e59403f986bab27a668933f@AcuMS.aculab.com>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
 <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: 'Jarkko Sakkinen' <jarkko.sakkinen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-sgx@vger.kernel.org" <linux-sgx@vger.kernel.org>
Cc: "dave.hansen@intel.com" <dave.hansen@intel.com>, "sean.j.christopherson@intel.com" <sean.j.christopherson@intel.com>, "nhorman@redhat.com" <nhorman@redhat.com>, "npmccallum@redhat.com" <npmccallum@redhat.com>, "serge.ayoun@intel.com" <serge.ayoun@intel.com>, "shay.katz-zamir@intel.com" <shay.katz-zamir@intel.com>, "haitao.huang@intel.com" <haitao.huang@intel.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "kai.svahn@intel.com" <kai.svahn@intel.com>, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, open list:X86 ARCHITECT
List-Id: platform-driver-x86.vger.kernel.org

From: Jarkko Sakkinen
> Sent: 06 November 2018 13:46
> 
> Intel Software Guard eXtensions (SGX) is a set of CPU instructions that
> can be used by applications to set aside private regions of code and
> data. The code outside the enclave is disallowed to access the memory
> inside the enclave by the CPU access control.
> 
> SGX driver provides a ioctl API for loading and initializing enclaves.
> Address range for enclaves is reserved with mmap() and they are
> destroyed with munmap(). Enclave construction, measurement and
> initialization is done with the provided the ioctl API.
..
> +struct sgx_encl {
> +	unsigned int flags;
> +	uint64_t attributes;
> +	uint64_t xfrm;
> +	unsigned int page_cnt;
> +	unsigned int secs_child_cnt;
> +	struct mutex lock;
> +	struct mm_struct *mm;
> +	struct file *backing;
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

It may not really matter (yet) but there is at least one hole in that strcture.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
