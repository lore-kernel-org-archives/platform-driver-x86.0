From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 11:40:18 -0800
Message-ID: <6e6e6eec-f2a3-9b18-eed8-e0ba965774b0@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <20181217184858.GF12491@linux.intel.com>
 <cf377db5-c702-0a1d-42b3-4caeb14eb6fa@intel.com>
 <20181217193758.GC29785@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217193758.GC29785@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: Sean Christopherson <sean.j.christopherson@intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 12/17/18 11:37 AM, Jarkko Sakkinen wrote:
>> Suggestion:
>>
>> It looks like you only expect one VMA per enclave.  Things go bonkers if
>> this is not true.  So, instead of storing encl->mm, don't.  You can get
>> the mm from vma->vm_mm and you could just store encl->vma instead.
> The code actually supports having multiple VMAs per enclave.

That seems at least somewhat at odds with this comment:

> static void sgx_vma_open(struct vm_area_struct *vma)
> {
>         struct sgx_encl *encl = vma->vm_private_data;
> 
>         if (!encl)
>                 return;
> 
>         /* kref cannot underflow because ECREATE ioctl checks that there is only
>          * one single VMA for the enclave before proceeding.
>          */
>         kref_get(&encl->refcount);
> }
