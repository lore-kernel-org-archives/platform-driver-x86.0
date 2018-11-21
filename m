From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v16 18/22] platform/x86: Intel SGX driver
Date: Wed, 21 Nov 2018 13:46:50 +0200
Message-ID: <20181121114650.GA1638@linux.intel.com>
References: <20181106134758.10572-1-jarkko.sakkinen@linux.intel.com>
 <20181106134758.10572-19-jarkko.sakkinen@linux.intel.com>
 <1541522400.7839.48.camel@intel.com>
 <20181107163757.GB11509@linux.intel.com>
 <20181107180057.GB24807@linux.intel.com>
 <20181108144603.GA14072@linux.intel.com>
 <20181115200002.GA24006@linux.intel.com>
 <20181115200406.GA24299@linux.intel.com>
 <20181115201625.GA25953@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181115201625.GA25953@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Nov 15, 2018 at 10:16:25PM +0200, Jarkko Sakkinen wrote:
> This is how strongly think. I can go with VMAs for swapping *but* if
> that is the route I would recommend using vm_mmap() instead of taking
> pointer from user space. This way the way swapping is done can be always
> changed. It will be a huge lock-in to do it otherwise.

I digged out my old code and it should be easy to replace. Most of the
issues were related to exit_mm(), which have been anyway sorted in the
code base.

I'll do it for v18.

/Jarkko
