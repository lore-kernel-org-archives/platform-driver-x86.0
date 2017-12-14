From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [intel-sgx-kernel-dev] [PATCH v7 4/8] intel_sgx: driver for
 Intel Software Guard Extensions
Date: Thu, 14 Dec 2017 15:10:06 +0200
Message-ID: <20171214131006.moogpmrugtx43qju@linux.intel.com>
References: <20171207015614.7914-1-jarkko.sakkinen@linux.intel.com>
 <20171207015614.7914-5-jarkko.sakkinen@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39193@ORSMSX108.amr.corp.intel.com>
 <20171207160548.doovfdh2lqg5brm3@linux.intel.com>
 <37306EFA9975BE469F115FDE982C075BC6B39E1D@ORSMSX108.amr.corp.intel.com>
 <1513115208.27842.18.camel@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513115208.27842.18.camel@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: "intel-sgx-kernel-dev@lists.01.org" <intel-sgx-kernel-dev@lists.01.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 12, 2017 at 01:46:48PM -0800, Sean Christopherson wrote:
> So it looks like you avoid the described case by moving B to the head of
> the list in sgx_eldu.  The bug I am seeing is still straightforward to
> theorize:
> 
>     1. Three VA pages.  List = A->B->C
>     2. Fill A and B, use one entry in C.  List = C->B->A
>     3. ELDU, freeing a slot in B.  List = B->C->A
>     4. EWB, consuming the last slot in B.  List = B->C->A
>     5. ELDU, freeing a slot in A.  List = A->B->C
>     6. EWB, consuming the last slot in A.  List = A->B->C
>     7. ELDU, but both A and B are full
>     8. Explode

I see. It is easy to fix by moving back to of the list immediately after
last allocation. Thanks for pointing this out.

/Jarkko
