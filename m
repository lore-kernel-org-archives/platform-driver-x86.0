From: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v17 13/23] x86/msr: Add SGX Launch Control MSR definitions
Date: Fri, 16 Nov 2018 09:29:08 -0800
Message-ID: <20181116172907.GC29898@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-14-jarkko.sakkinen@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116010412.23967-14-jarkko.sakkinen@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Haim Cohen <haim.cohen@intel.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Matt Turner <mattst88@gmail.com>, Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, open list:X86 ARCHITECTURE (32-BIT AND 64-B
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 03:01:20AM +0200, Jarkko Sakkinen wrote:
> From: Sean Christopherson <sean.j.christopherson@intel.com>
> 
> Add a new IA32_FEATURE_CONTROL bit, SGX_LE_WR.

Introducing SGX_LE_WR needs to land before patch 06/23, which references
the flag when updating feature bits.
