From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v16 18/22] platform/x86: Intel SGX driver
Date: Tue, 6 Nov 2018 08:57:39 -0800
Message-ID: <a4895bc5-3234-8555-2709-1407dd1bf8e7@intel.com>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
 <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
 <1541522400.7839.48.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541522400.7839.48.camel@intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 11/6/18 8:40 AM, Sean Christopherson wrote:
>> +struct sgx_encl {
>> +	unsigned int flags;
>> +	uint64_t attributes;
>> +	uint64_t xfrm;
>> +	unsigned int page_cnt;
>> +	unsigned int secs_child_cnt;
>> +	struct mutex lock;
>> +	struct mm_struct *mm;
>> +	struct file *backing;
> Is there any particular reason why the kernel manages the backing for
> the enclave and the PCMDs?  Could we have userspace provide the backing
> either through the ECREATE ioctl() or maybe a completely new ioctl(),
> e.g. to give userspace the option to back the enclave with a NVDIMM
> instead of RAM?  A separate ioctl() with control flags might give us
> some flexibility in the future, e.g. maybe there are use cases where
> userspace would prefer to kill enclaves rather than swap EPC.

I'll take the blame for this little nugget.  I think it was my idea.  We
have a few of these kernel-internal shmfs files.  But, as you note, it
would be really nice if they were subject to the normal memory APIs and
we could set NUMA policies on them and so forth.

We could just wire the NUMA (and other) APIs up to the SGX VMA.
