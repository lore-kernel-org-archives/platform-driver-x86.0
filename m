From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v17 06/23] x86/cpu/intel: Detect SGX support and update
 caps appropriately
Date: Wed, 21 Nov 2018 19:17:28 +0100
Message-ID: <20181121181728.GA27559@zn.tnic>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116010412.23967-7-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Wang <davidwang@zhaoxin.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, Jia Zhang <qianyue.zj@alibaba-inc.com>, open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:01:13AM +0200, Jarkko Sakkinen wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Similar to other large Intel features such as VMX and TXT, SGX must be
> explicitly enabled in IA32_FEATURE_CONTROL MSR to be truly usable.
> Clear all SGX related capabilities if SGX is not fully enabled in
> IA32_FEATURE_CONTROL or if the SGX1 instruction set isn't supported
> (impossible on bare metal, theoretically possible in a VM if the VMM is
> doing something weird).
> 
> Like SGX itself, SGX Launch Control must be explicitly enabled via a
> flag in IA32_FEATURE_CONTROL. Clear the SGX_LC capability if Launch
> Control is not fully enabled (or obviously if SGX itself is disabled).
> 
> Note that clearing X86_FEATURE_SGX_LC creates a bit of a conundrum
> regarding the SGXLEPUBKEYHASH MSRs, as it may be desirable to read the
> MSRs even if they are not writable, e.g. to query the configured key,
> but clearing the capability leaves no breadcrum for discerning whether
> or not the MSRs exist.  But, such usage will be rare (KVM is the only
> known case at this time) and not performance critical, so it's not
> unreasonable to require the use of rdmsr_safe().  Clearing the cap bit
> eliminates the need for an additional flag to track whether or not
> Launch Control is truly enabled, which is what we care about the vast
> majority of the time.
> 
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> Co-developed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/intel.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
> index fc3c07fe7df5..8a20a193d399 100644
> --- a/arch/x86/kernel/cpu/intel.c
> +++ b/arch/x86/kernel/cpu/intel.c
> @@ -596,6 +596,40 @@ static void detect_tme(struct cpuinfo_x86 *c)
>  	c->x86_phys_bits -= keyid_bits;
>  }
>  
> +static void detect_sgx(struct cpuinfo_x86 *c)
> +{
> +	unsigned long long fc;
> +
> +	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
> +	if (!(fc & FEATURE_CONTROL_LOCKED)) {
> +		pr_err_once("sgx: IA32_FEATURE_CONTROL MSR is not locked\n");
> +		goto out_unsupported;
> +	}
> +
> +	if (!(fc & FEATURE_CONTROL_SGX_ENABLE)) {
> +		pr_err_once("sgx: not enabled in IA32_FEATURE_CONTROL MSR\n");

Start those messages with a capital letter: "sgx: SGX is not enabled ...".

> +		goto out_unsupported;
> +	}
> +
> +	if (!cpu_has(c, X86_FEATURE_SGX1)) {
> +		pr_err_once("sgx: SGX1 instruction set not supported\n");
> +		goto out_unsupported;
> +	}
> +
> +	if (!(fc & FEATURE_CONTROL_SGX_LE_WR)) {

I see the build failure here has been pointed out already but lemme
repeat it out for another reason:

It is very important that no patch we merge breaks bisectability -
please build every patch before sending:

arch/x86/kernel/cpu/intel.c: In function ‘detect_sgx’:
arch/x86/kernel/cpu/intel.c:619:13: error: ‘FEATURE_CONTROL_SGX_LE_WR’ undeclared (first use in this function); did you mean ‘FEATURE_CONTROL_SGX_ENABLE’?
  if (!(fc & FEATURE_CONTROL_SGX_LE_WR)) {
             ^~~~~~~~~~~~~~~~~~~~~~~~~
             FEATURE_CONTROL_SGX_ENABLE
arch/x86/kernel/cpu/intel.c:619:13: note: each undeclared identifier is reported only once for each function it appears in
make[3]: *** [scripts/Makefile.build:291: arch/x86/kernel/cpu/intel.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:516: arch/x86/kernel/cpu] Error 2
make[1]: *** [scripts/Makefile.build:516: arch/x86/kernel] Error 2
make: *** [Makefile:1060: arch/x86] Error 2
make: *** Waiting for unfinished jobs....


> +		pr_info_once("sgx: launch control MSRs are not writable\n");
> +		goto out_msrs_rdonly;
> +	}
> +
> +	return;

<---- newline here.

> +out_unsupported:
> +	setup_clear_cpu_cap(X86_FEATURE_SGX);
> +	setup_clear_cpu_cap(X86_FEATURE_SGX1);
> +	setup_clear_cpu_cap(X86_FEATURE_SGX2);

<---- newline here.

> +out_msrs_rdonly:
> +	setup_clear_cpu_cap(X86_FEATURE_SGX_LC);
> +}

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
