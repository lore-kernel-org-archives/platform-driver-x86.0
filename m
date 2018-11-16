From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v17 02/23] x86/cpufeatures: Add Intel-defined SGX feature
 bit
Date: Fri, 16 Nov 2018 21:53:34 +0100
Message-ID: <20181116205334.GO20313@zn.tnic>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-3-jarkko.sakkinen@linux.intel.com>
 <20181116142840.GI20313@zn.tnic>
 <20181116151351.GB4244@linux.intel.com>
 <20181116151845.GC4244@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181116151845.GC4244@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Kai Huang <kai.huang@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, Fenghua Yu <fenghua.yu@intel.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 16, 2018 at 05:18:45PM +0200, Jarkko Sakkinen wrote:
> I will also add Sean as co-maintainer as he has the KVM angle and is
> needed to ack patches in the future. This functionality really needs
> two eyes. Has shown to have value in many occasions.

Yap, two maintainers or a maintainer group for a bigger subsystem or
arch is always much better than a single poor dude trying to cover it
all.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
