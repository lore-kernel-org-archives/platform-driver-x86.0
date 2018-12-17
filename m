From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 10:47:32 -0800
Message-ID: <ccfb67a0-fd8d-82c8-8018-fd68e901f287@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217184333.GA26920@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Sean Christopherson <sean.j.christopherson@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 12/17/18 10:43 AM, Jarkko Sakkinen wrote:
> On Mon, Dec 17, 2018 at 10:36:13AM -0800, Sean Christopherson wrote:
>> I'm pretty sure doing mmget() would result in circular dependencies and
>> a zombie enclave.  In the do_exit() case where a task is abruptly killed:
>>  
>>   - __mmput() is never called because the enclave holds a ref
>>   - sgx_encl_release() is never be called because its VMAs hold refs
>>   - sgx_vma_close() is never called because __mmput()->exit_mmap() is
>>     blocked and the process itself is dead, i.e. won't unmap anything.
> Right, it does, you are absolutely right. Tried it and removed the
> commit already.
> 
> Well, what we came up from your suggestion i.e. setting mm to NULL
> and checking that is very subtle change and does not have any such
> circular dependencies. We'll go with that.

This all screams that you need to break out this code from the massive
"18" patch and get the mm interactions reviewed more thoroughly.

Also, no matter what method you go with, you have a bunch of commenting
and changelogging to do here.
