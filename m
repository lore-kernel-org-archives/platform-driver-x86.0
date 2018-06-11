From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v11 11/13] intel_sgx: ptrace() support
Date: Mon, 11 Jun 2018 08:02:09 -0700
Message-ID: <1528729329.9779.28.camel@intel.com>
References: <20180608171216.26521-1-jarkko.sakkinen@linux.intel.com>
         <20180608171216.26521-12-jarkko.sakkinen@linux.intel.com>
         <91e35b3e-b42d-b3d5-752c-031973e69273@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <91e35b3e-b42d-b3d5-752c-031973e69273@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org
Cc: nhorman@redhat.com, npmccallum@redhat.com, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "open list:INTEL SGX" <intel-sgx-kernel-dev@lists.01.org>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 2018-06-08 at 11:34 -0700, Dave Hansen wrote:
> On 06/08/2018 10:09 AM, Jarkko Sakkinen wrote:
> > 
> > +		ret = sgx_edbgrd(encl, entry, align, data);
> > +		if (ret)
> > +			break;
> > +		if (write) {
> > +			memcpy(data + offset, buf + i, cnt);
> > +			ret = sgx_edbgwr(encl, entry, align, data);
> > +			if (ret)
> > +				break;
> > +		}
> > +		else
> > +			memcpy(buf + i,data + offset, cnt);
> > +	}
> The SGX instructions like "edbgrd" be great to put on a license plat,
> but we can do better in the kernel.  Can you give these reasonable
> english names, please?  sgx_debug_write(), maybe?

IMO the function names for ENCLS leafs are appropriate.  The real
issue is the lack of documentation of the ENCLS helpers and their
naming conventions.

The sgx_<leaf> functions, e.g. sgx_edbgrd(), are essentially direct
invocations of the specific leaf, i.e. they are dumb wrappers to
the lower level leaf functions, e.g. __edbgrd().  The wrappers exist
primarily to deal with the boilerplate necessary to access a page in
the EPC.  sgx_<leaf> conveys that the function contains the preamble
and/or postamble needed to execute its leaf, but otherwise does not
contain any logic.

Functions with actual logic do have English names, e.g.
sgx_encl_init(), sgx_encl_add_page(), sgx_encl_modify_pages() etc...

> Note that we have plenty of incomprehensible instruction names in the
> kernel like "wrpkru", but we do our best to keep them as confined as
> possible and make sure they don't hurt code readability.
