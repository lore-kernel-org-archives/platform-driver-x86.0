From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 0/1] platform/x86: Add Slim Bootloader firmware update support
Date: Mon, 27 Apr 2020 13:03:38 +0300
Message-ID: <CAHp75Vezc9-vTSVsTE=ce_2XRPfFVT2gHwZhwqZiRX8M=sdmmg@mail.gmail.com>
References: <20200423224222.29730-1-jithu.joseph@intel.com> <CAHp75VcqV3e8ecAUX+dr9h-bE+1XJ_71hJRA1b9XdouJJLD2ZA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcqV3e8ecAUX+dr9h-bE+1XJ_71hJRA1b9XdouJJLD2ZA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jithu Joseph <jithu.joseph@intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, maurice.ma@intel.com, ravi.p.rangarajan@intel.com, Sean V Kelley <sean.v.kelley@intel.com>, kuo-lang.tseng@intel.com
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 24, 2020 at 2:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Apr 24, 2020 at 1:49 AM Jithu Joseph <jithu.joseph@intel.com> wrote:
> >
> > v1 Upstream submission is available here:
> > https://lore.kernel.org/lkml/20200420194405.8281-1-jithu.joseph@intel.com
> >
>
> Pushed to my review and testing queue, thanks!

One question, though.

We use a bit different template for module names

vendor-...-wmi

(yes, with exception to TBT)

I would like to rename sbl_fwu_wmi to something like this:

intel-wmi-sbl-fw-update

What do you think?

-- 
With Best Regards,
Andy Shevchenko
