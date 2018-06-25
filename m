From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 09/13] x86, sgx: basic routines for enclave page
 cache
Date: Mon, 25 Jun 2018 12:01:12 +0300
Message-ID: <2329657de3b24cd45db2ad4abaddf3d473da4fdf.camel@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-10-jarkko.sakkinen@linux.intel.com>
         <3c1b04d6-6e93-efaa-1890-101b7fd9784c@intel.com>
         <20180619145753.GB8034@linux.intel.com>
         <5226fbdc-dcad-4856-68bb-3219ab31b30d@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5226fbdc-dcad-4856-68bb-3219ab31b30d@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 2018-06-19 at 08:32 -0700, Dave Hansen wrote:
> > For 32-bit (albeit not supported at this point) it makes sense to always
> > use kmap_atomic_pfn() as the virtua address area is very limited.
> 
> That makes no sense.  32-bit kernels have plenty of virtual address
> space if not using highmem.

AFAIK the vmalloc area is located in the last 128MB that and ioremap()
of EPC would consume a big portion of that.

> > KVM works only with writable MSRs. Driver works both with writable
> > and read-only MSRs.
> 
> Could you help with my confusion by documenting this a bit?

Sure.

/Jarkko
