From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page cache
Date: Tue, 19 Jun 2018 08:32:02 -0700
Message-ID: <5226fbdc-dcad-4856-68bb-3219ab31b30d@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
 <3c1b04d6-6e93-efaa-1890-101b7fd9784c@intel.com>
 <20180619145753.GB8034@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180619145753.GB8034@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On 06/19/2018 07:57 AM, Jarkko Sakkinen wrote:
> On Fri, Jun 08, 2018 at 11:24:12AM -0700, Dave Hansen wrote:
>>> Each subsystem that uses SGX must provide a set of callbacks for EPC
>>> pages that are used to reclaim, block and write an EPC page. Kernel
>>> takes the responsibility of maintaining LRU cache for them.
>>
>> What does a "subsystem that uses SGX" mean?  Do we have one of those
>> already?
> 
> Driver and KVM.

Could you just say "the SGX and driver both provide a set of callbacks"?

>>> +struct sgx_secs {
>>> +	uint64_t size;
>>> +	uint64_t base;
>>> +	uint32_t ssaframesize;
>>> +	uint32_t miscselect;
>>> +	uint8_t reserved1[SGX_SECS_RESERVED1_SIZE];
>>> +	uint64_t attributes;
>>> +	uint64_t xfrm;
>>> +	uint32_t mrenclave[8];
>>> +	uint8_t reserved2[SGX_SECS_RESERVED2_SIZE];
>>> +	uint32_t mrsigner[8];
>>> +	uint8_t	reserved3[SGX_SECS_RESERVED3_SIZE];
>>> +	uint16_t isvvprodid;
>>> +	uint16_t isvsvn;
>>> +	uint8_t reserved4[SGX_SECS_RESERVED4_SIZE];
>>> +};
>>
>> This is a hardware structure, right?  Doesn't it need to be packed?
> 
> Everything is aligned properly in this struct.

The compiler doesn't guarantee the way you have it laid out.  It might
work today, but it's subject to being changed.

>>> +enum sgx_tcs_flags {
>>> +	SGX_TCS_DBGOPTIN	= 0x01, /* cleared on EADD */
>>> +};
>>> +
>>> +#define SGX_TCS_RESERVED_MASK 0xFFFFFFFFFFFFFFFEL
>>
>> Would it be possible to separate out the SGX software structures from
>> SGX hardware?  It's hard to tell them apart.
> 
> How do you draw the line in the architectural structures?

I know then when I see them.

"SGX_TCS_DBGOPTIN" - Hardware
"SGX_NR_TO_SCAN" - Software

Please at least make an effort to do this.

>>> +#define SGX_NR_TO_SCAN	16
>>> +#define SGX_NR_LOW_PAGES 32
>>> +#define SGX_NR_HIGH_PAGES 64
>>> +
>>>  bool sgx_enabled __ro_after_init = false;
>>>  EXPORT_SYMBOL(sgx_enabled);
>>> +bool sgx_lc_enabled __ro_after_init;
>>> +EXPORT_SYMBOL(sgx_lc_enabled);
>>> +atomic_t sgx_nr_free_pages = ATOMIC_INIT(0);
>>
>> Hmmm, global atomic.  Doesn't sound very scalable.
> 
> We could potentially remove this completely as banks have 'free_cnt'
> field and use the sum when needed as the value.

That seems prudent.

>>> +struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
>>> +EXPORT_SYMBOL(sgx_epc_banks);
>>> +int sgx_nr_epc_banks;
>>> +EXPORT_SYMBOL(sgx_nr_epc_banks);
>>> +LIST_HEAD(sgx_active_page_list);
>>> +EXPORT_SYMBOL(sgx_active_page_list);
>>> +DEFINE_SPINLOCK(sgx_active_page_list_lock);
>>> +EXPORT_SYMBOL(sgx_active_page_list_lock);
>>
>> Hmmm, global spinlock protecting a page allocator linked list.  Sounds
>> even worse than at atomic.
>>
>> Why is this OK?
> 
> Any suggestions what would be a better place in order to make a
> fine grained granularity?

The bank seems a logical place.  Or, create a structure that actually
hangs off NUMA nodes.

BTW, do we *have* locality information for SGX banks?
>>> +/**
>>> + * sgx_try_alloc_page - try to allocate an EPC page
>>> + * @impl:	implementation for the struct sgx_epc_page
>>> + *
>>> + * Try to grab a page from the free EPC page list. If there is a free page
>>> + * available, it is returned to the caller.
>>> + *
>>> + * Return:
>>> + *   a &struct sgx_epc_page instace,
>>> + *   NULL otherwise
>>> + */
>>> +struct sgx_epc_page *sgx_try_alloc_page(struct sgx_epc_page_impl *impl)
>>> +{
>>> +	struct sgx_epc_bank *bank;
>>> +	struct sgx_epc_page *page = NULL;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < sgx_nr_epc_banks; i++) {
>>> +		bank = &sgx_epc_banks[i];
>>
>> What's a bank?  How many banks does a system have?
> 
> AFAIK, UMA systems have one bank. NUMA have multiple. It is a physical
> memory region reserved for enclave pages.

That's great text to include near the structure definition for
sgx_epc_bank.

>>> +		down_write(&bank->lock);
>>> +
>>> +		if (atomic_read(&bank->free_cnt))
>>> +			page = bank->pages[atomic_dec_return(&bank->free_cnt)];
>>
>> Why is a semaphore getting used here?  I don't see any sleeping or
>> anything happening under this lock.
> 
> Should be changed to reader-writer spinlock, thanks.

Which also reminds me...  It would be nice to explicitly call out why
you need an atomic_t inside a lock-protected structure.

>>> +	}
>>> +
>>> +	if (atomic_read(&sgx_nr_free_pages) < SGX_NR_LOW_PAGES)
>>> +		wake_up(&ksgxswapd_waitq);
>>> +
>>> +	return entry;
>>> +}
>>> +EXPORT_SYMBOL(sgx_alloc_page);
>>
>> Why aren't these _GPL exports?
> 
> Source files a dual licensed.

Sounds like a great thing to ask your licensing or legal team about.

>>> +/**
>>> + * sgx_free_page - free an EPC page
>>> + *
>>> + * @page:	any EPC page
>>> + *
>>> + * Remove an EPC page and insert it back to the list of free pages.
>>> + *
>>> + * Return: SGX error code
>>> + */
>>> +int sgx_free_page(struct sgx_epc_page *page)
>>> +{
>>> +	struct sgx_epc_bank *bank = SGX_EPC_BANK(page);
>>> +	int ret;
>>> +
>>> +	ret = sgx_eremove(page);
>>> +	if (ret) {
>>> +		pr_debug("EREMOVE returned %d\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	down_read(&bank->lock);
>>> +	bank->pages[atomic_inc_return(&bank->free_cnt) - 1] = page;
>>> +	atomic_inc(&sgx_nr_free_pages);
>>> +	up_read(&bank->lock);
>>> +
>>> +	return 0;
>>> +}
>>
>> bank->lock confuses me.  This seems to be writing to a bank, but only
>> needs a read lock.  Why?
> 
> It could be either way around:
> 
> 1. Allow multiple threads that free a page to access the array.
> 2. Allow multiple threads that alloc a page to access the array.

Whatever way you choose, please document the locking scheme.

>>> +/**
>>> + * sgx_get_page - pin an EPC page
>>> + * @page:	an EPC page
>>> + *
>>> + * Return: a pointer to the pinned EPC page
>>> + */
>>> +void *sgx_get_page(struct sgx_epc_page *page)
>>> +{
>>> +	struct sgx_epc_bank *bank = SGX_EPC_BANK(page);
>>> +
>>> +	if (IS_ENABLED(CONFIG_X86_64))
>>> +		return (void *)(bank->va + SGX_EPC_ADDR(page) - bank->pa);
>>> +
>>> +	return kmap_atomic_pfn(SGX_EPC_PFN(page));
>>> +}
>>> +EXPORT_SYMBOL(sgx_get_page);
>>
>> This is odd.  Do you really want to detect 64-bit, or CONFIG_HIGHMEM?
> 
> For 32-bit (albeit not supported at this point) it makes sense to always
> use kmap_atomic_pfn() as the virtua address area is very limited.

That makes no sense.  32-bit kernels have plenty of virtual address
space if not using highmem.

>>> +struct page *sgx_get_backing(struct file *file, pgoff_t index)
>>> +{
>>> +	struct inode *inode = file->f_path.dentry->d_inode;
>>> +	struct address_space *mapping = inode->i_mapping;
>>> +	gfp_t gfpmask = mapping_gfp_mask(mapping);
>>> +
>>> +	return shmem_read_mapping_page_gfp(mapping, index, gfpmask);
>>> +}
>>> +EXPORT_SYMBOL(sgx_get_backing);
>>
>> What does shmem have to do with all this?
> 
> Backing storage is an shmem file similarly is in drm.

That's something good to call out in the changelog: how shmem gets used
here.

>>> +static __init bool sgx_is_enabled(bool *lc_enabled)
>>>  {
>>>  	unsigned long fc;
>>>  
>>> @@ -41,12 +466,26 @@ static __init bool sgx_is_enabled(void)
>>>  	if (!(fc & FEATURE_CONTROL_SGX_ENABLE))
>>>  		return false;
>>>  
>>> +	*lc_enabled = !!(fc & FEATURE_CONTROL_SGX_LE_WR);
>>> +
>>>  	return true;
>>>  }
>>
>> I'm baffled why lc_enabled is connected to the enclave page cache.
> 
> KVM works only with writable MSRs. Driver works both with writable
> and read-only MSRs.

Could you help with my confusion by documenting this a bit?
