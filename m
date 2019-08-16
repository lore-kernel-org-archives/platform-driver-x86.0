From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Do not ioremap RAM
Date: Fri, 16 Aug 2019 12:21:58 +0300
Message-ID: <CAHp75Vc1BP9UXBWW1tv7T8v8vgqxZWngD+tN9=ZKkgc1imUVxQ@mail.gmail.com>
References: <20190816014140.10687-1-m.v.b@runbox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816014140.10687-1-m.v.b@runbox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "M. Vefa Bicakci" <m.v.b@runbox.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Aug 16, 2019 at 4:42 AM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
>
> On a Xen-based PVH virtual machine with more than 4 GiB of RAM,
> intel_pmc_core fails initialization with the following warning message
> from the kernel, indicating that the driver is attempting to ioremap
> RAM:
>
>   ------------[ cut here ]------------
>   ioremap on RAM at 0x00000000fe000000 - 0x00000000fe001fff

> This issue appears to manifest itself because of the following fallback
> mechanism in the driver:
>
>         if (lpit_read_residency_count_address(&slp_s0_addr))
>                 pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
>
> The validity of address PMC_BASE_ADDR_DEFAULT (i.e., 0xFE000000) is not
> verified by the driver, which is what this patch introduces. With this
> patch, if address PMC_BASE_ADDR_DEFAULT is in RAM, then the driver will
> not attempt to ioremap the aforementioned address.

Thank you for the patch.
Is there anything preventing us to use memremap() in such case?

-- 
With Best Regards,
Andy Shevchenko
