From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v13 07/13] x86/sgx: Add data structures for tracking the
 EPC pages
Date: Fri, 31 Aug 2018 14:10:38 +0300
Message-ID: <20180831111038.GA16827@linux.intel.com>
References: <20180827185507.17087-1-jarkko.sakkinen@linux.intel.com>
 <20180827185507.17087-8-jarkko.sakkinen@linux.intel.com>
 <4666cae8-c711-8dd5-cbce-3d97cc19a9e5@intel.com>
 <20180828103040.GA21326@linux.intel.com>
 <68d730bc-898c-973f-9506-648fd8a7c610@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <68d730bc-898c-973f-9506-648fd8a7c610@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, linux-sgx@vger.kernel.org, Serge Ayoun <serge.ayoun@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Suresh Siddha <suresh.b.siddha@intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Aug 28, 2018 at 09:53:11AM -0700, Dave Hansen wrote:
> >>>  extern bool sgx_enabled;
> >>>  extern bool sgx_lc_enabled;
> >>> +extern struct sgx_epc_bank sgx_epc_banks[SGX_MAX_EPC_BANKS];
> >>> +
> >>> +/*
> >>> + * enum sgx_epc_page_desc - defines bits and masks for an EPC page's desc
> >>
> >> Why are you bothering packing these bits?  This seems a rather
> >> convoluted way to store two integers.
> > 
> > To keep struct sgx_epc_page 64 bytes.
> 
> It's a list_head and a ulong now.  That doesn't add up to 64.

Ah, there used to be one more variable in it.

> If you properly describe the bounds and limits of banks we can possibly
> help you find a nice solution.  As it stands, they are totally opaque
> and we have no idea what is going on.

Great, I see what I can do. I understand now better what you are looking
for. Thanks Dave.

/Jarkko
