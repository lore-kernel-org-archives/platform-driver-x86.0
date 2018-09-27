From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v14 04/19] x86/cpufeatures: Add SGX feature bits
Date: Thu, 27 Sep 2018 15:51:39 +0200
Message-ID: <20180927135139.GB19687@zn.tnic>
References: <20180925130845.9962-1-jarkko.sakkinen@linux.intel.com>
 <20180925130845.9962-5-jarkko.sakkinen@linux.intel.com>
 <20180925164854.GF23986@zn.tnic>
 <20180926111139.GA12037@linux.intel.com>
 <20180926113617.GD5584@zn.tnic>
 <20180927131642.GE5436@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180927131642.GE5436@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, linux-sgx@vger.kernel.org, andriy.shevchenko@linux.intel.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, David Wang <davidwang@zhaoxin.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, Jia Zhang <qianyue.zj@alibaba-inc.com>, "open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>, He Chen <he.chen@linux.intel.com>, Lu
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Sep 27, 2018 at 04:16:42PM +0300, Jarkko Sakkinen wrote:
> Still kind of leaves me puzzled about the situation :-) Why this wasn't
> used for example to replace detect_vmx_virtcap()?

I don't understand - detect_vmx_virtcap() is setting X86_FEATURE bits
based on MSR settings. get_scattered_cpuid_leaf() is regenerating a
CPUID leaf from the scattered bits.

Looks like apples and oranges to me...

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
