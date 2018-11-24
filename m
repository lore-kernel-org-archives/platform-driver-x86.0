From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v17 06/23] x86/cpu/intel: Detect SGX support and update
 caps appropriately
Date: Sat, 24 Nov 2018 05:54:31 -0800
Message-ID: <20181124135431.GA7048@linux.intel.com>
References: <20181116010412.23967-1-jarkko.sakkinen@linux.intel.com>
 <20181116010412.23967-7-jarkko.sakkinen@linux.intel.com>
 <20181121181728.GA27559@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181121181728.GA27559@zn.tnic>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-sgx@vger.kernel.org, dave.hansen@intel.com, sean.j.christopherson@intel.com, nhorman@redhat.com, npmccallum@redhat.com, serge.ayoun@intel.com, shay.katz-zamir@intel.com, haitao.huang@linux.intel.com, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, kai.svahn@intel.com, mark.shanahan@intel.com, luto@amacapital.net, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, David Woodhouse <dwmw@amazon.co.uk>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, David Wang <davidwang@zhaoxin.com>, "Levin, Alexander (Sasha Levin)" <alexander.levin@verizon.com>, Jia Zhang <qianyue.zj@alibaba-inc.com>, open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Nov 21, 2018 at 07:17:28PM +0100, Borislav Petkov wrote:
> I see the build failure here has been pointed out already but lemme
> repeat it out for another reason:
> 
> It is very important that no patch we merge breaks bisectability -
> please build every patch before sending:

Yep, the patch ordering was incorrect. I agree and will check this
for the next version. Thanks for your remarks.

/Jarkko
