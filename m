From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 18/23] platform/x86: Intel SGX driver
Date: Mon, 17 Dec 2018 11:09:33 -0800
Message-ID: <cf377db5-c702-0a1d-42b3-4caeb14eb6fa@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-19-jarkko.sakkinen@linux.intel.com>
 <7d5cde02-4649-546b-0f03-2d6414bb80b5@intel.com>
 <20181217180102.GA12560@linux.intel.com>
 <20181217183613.GD12491@linux.intel.com>
 <20181217184333.GA26920@linux.intel.com>
 <20181217184858.GF12491@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217184858.GF12491@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 12/17/18 10:48 AM, Sean Christopherson wrote:
> We can't set mm to NULL as we need it to unregister the notifier, and
> I'm fairly certain attempting to unregister in the release callback
> will deadlock.

Suggestion:

It looks like you only expect one VMA per enclave.  Things go bonkers if
this is not true.  So, instead of storing encl->mm, don't.  You can get
the mm from vma->vm_mm and you could just store encl->vma instead.

Doing that, you could even axe encl->base and encl->size, I think
because you just get those from the VMA itself.

That makes the relationship clearer: 1 VMA per enclave.  We also
implicitly understand that if you have a VMA, you implicitly have a ref
to the mm *and* the VMA is immutable.

If there were ever a path where encl->vma wasn't immutable, we'd have a
bug (or load of bugs) somewhere, right?
