From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v11 08/13] x86, sgx: added ENCLS wrappers
Date: Tue, 19 Jun 2018 16:25:34 +0300
Message-ID: <20180619132534.GE5609@linux.intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
 <20180608171216.26521-9-jarkko.sakkinen@linux.intel.com>
 <ff75a95a-c1fc-dfb7-ae5e-146278bee2b6@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ff75a95a-c1fc-dfb7-ae5e-146278bee2b6@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 08, 2018 at 10:43:50AM -0700, Dave Hansen wrote:
> On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> > This commit adds wrappers for Intel(R) SGX ENCLS opcode functionality.
> 
> What's ENCLS?  I know what an opcode is, but I don't know what "opcode
> functionality" is.  Could you give us more than a single, cryptic
> sentence, please?

Sure.

> > +enum sgx_commands {
> > +	ECREATE	= 0x0,
> > +	EADD	= 0x1,
> > +	EINIT	= 0x2,
> > +	EREMOVE	= 0x3,
> > +	EDGBRD	= 0x4,
> > +	EDGBWR	= 0x5,
> > +	EEXTEND	= 0x6,
> > +	ELDU	= 0x8,
> > +	EBLOCK	= 0x9,
> > +	EPA	= 0xA,
> > +	EWB	= 0xB,
> > +	ETRACK	= 0xC,
> > +	EAUG	= 0xD,
> > +	EMODPR	= 0xE,
> > +	EMODT	= 0xF,
> > +};
> 
> Again, please differentiate hardware-defined values from
> software-defines ones.  Also, would it hurt to expand the acronyms a
> bit, like:
> 
> +	ELDU	= 0x8, /* LoaD Underpants */

Not a bad idea at all.

> > +#define SGX_FN(name, params...)		\
> > +{					\
> > +	void *epc;			\
> > +	int ret;			\
> > +	epc = sgx_get_page(epc_page);	\
> > +	ret = __##name(params);		\
> > +	sgx_put_page(epc);		\
> > +	return ret;			\
> > +}
> 
> Have I seen sgx_*_page() yet in this series?  This seems out of order.

Oops, thanks for spotting this out.

> > +#define BUILD_SGX_FN(fn, name)				\
> > +static inline int fn(struct sgx_epc_page *epc_page)	\
> > +	SGX_FN(name, epc)
> > +BUILD_SGX_FN(sgx_eremove, eremove)
> > +BUILD_SGX_FN(sgx_eblock, eblock)
> > +BUILD_SGX_FN(sgx_etrack, etrack)
> > +BUILD_SGX_FN(sgx_epa, epa)
> > +
> > +static inline int sgx_emodpr(struct sgx_secinfo *secinfo,
> > +			     struct sgx_epc_page *epc_page)
> > +	SGX_FN(emodpr, secinfo, epc)
> > +static inline int sgx_emodt(struct sgx_secinfo *secinfo,
> > +			    struct sgx_epc_page *epc_page)
> > +	SGX_FN(emodt, secinfo, epc)
> 
> Wow, that's hideous.
> 
> Can't you just do:
> 
> BUILD_SGX_FN(__sgx_emopt, foo)
> 
> static inline int sgx_emodt(struct sgx_secinfo *secinfo,
> 			    struct sgx_epc_page *epc_page)
> {
> 	return __sgx_emopt(secinfo, page);
> }
> 
> Also, this entire patch seems rather comment-free.  Was that intentional?

Something that I've ignored (big series) but I'll add comments to
the next version.

/Jarkko
