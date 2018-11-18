From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 03/23] x86/cpufeatures: Add SGX sub-features (as
 Linux-defined bits)
Date: Sun, 18 Nov 2018 10:36:33 +0200
Message-ID: <20181118083633.GL5897@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-4-jarkko.sakkinen@linux.intel.com>
 <1b326c2a-eec9-3a8b-1dff-81c596b2ac44@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1b326c2a-eec9-3a8b-1dff-81c596b2ac44@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Hansen <dave.hansen@intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Fenghua Yu <fenghua.yu@intel.com>, Brijesh Singh <brijesh.singh@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, open list:X86 ARCHITECTURE (32-BIT AND
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:31:28PM -0800, Dave Hansen wrote:
> On 11/15/18 5:01 PM, Jarkko Sakkinen wrote:
> > +#define X86_FEATURE_SGX1		( 8*32+ 0) /* SGX1 leaf functions */
> > +#define X86_FEATURE_SGX2		( 8*32+ 1) /* SGX2 leaf functions */
> 
> Is there a reason these are not (all) tied to CONFIG_INTEL_SGX via:
> 
> arch/x86/include/asm/disabled-features.h
> 
> ?

No any particular reason.

/Jarkko
