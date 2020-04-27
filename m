From: Jithu Joseph <jithu.joseph@intel.com>
Subject: Re: [PATCH v2 0/1] platform/x86: Add Slim Bootloader firmware
 update support
Date: Mon, 27 Apr 2020 12:57:05 -0700
Message-ID: <01620c87bb6aa7870854ae1e23ec7bd379a058de.camel@intel.com>
References: <20200423224222.29730-1-jithu.joseph@intel.com>
         <CAHp75VcqV3e8ecAUX+dr9h-bE+1XJ_71hJRA1b9XdouJJLD2ZA@mail.gmail.com>
         <CAHp75Vezc9-vTSVsTE=ce_2XRPfFVT2gHwZhwqZiRX8M=sdmmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vezc9-vTSVsTE=ce_2XRPfFVT2gHwZhwqZiRX8M=sdmmg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, Sean V Kelley <sean.v.kelley@intel.com>, kuo-lang.tseng@intel.com, jithu.joseph@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 2020-04-27 at 13:03 +0300, Andy Shevchenko wrote:
> 
> 
> We use a bit different template for module names
> 
> vendor-...-wmi
> 
> (yes, with exception to TBT)
> 
> I would like to rename sbl_fwu_wmi to something like this:
> 
> intel-wmi-sbl-fw-update
> 
> What do you think?

Yes I think it is better to rename this driver to intel-wmi-sbl-fw-
update as you suggested, given many drivers follow vendor-wmi-*
pattern. Thanks for pointing this out.

I will send v3 which addresses this.

Thanks
Jithu
