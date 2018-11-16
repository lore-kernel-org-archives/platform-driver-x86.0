From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v17 06/23] x86/cpu/intel: Detect SGX support and update
 caps appropriately
Date: Fri, 16 Nov 2018 15:32:36 -0800
Message-ID: <71af0361-3296-42a2-d76f-4f1e26e676b8@intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-7-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181116010412.23967-7-jarkko.sakkinen@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org
Cc: sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Wang <davidwang@zhaoxin.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, Jia Zhang <qianyue.zj@alibaba-inc.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 11/15/18 5:01 PM, Jarkko Sakkinen wrote:
> +static void detect_sgx(struct cpuinfo_x86 *c)
> +{
> +	unsigned long long fc;
> +
> +	rdmsrl(MSR_IA32_FEATURE_CONTROL, fc);
> +	if (!(fc & FEATURE_CONTROL_LOCKED)) {
> +		pr_err_once("sgx: IA32_FEATURE_CONTROL MSR is not locked\n");
> +		goto out_unsupported;
> +	}

This needs a check against the config option somewhere so the compiler
can toss it in its entirety if SGX is config'd out.
