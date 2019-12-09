From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] x86/platform/goldfish: add a check for platform_device_register_simple
Date: Mon, 9 Dec 2019 19:55:03 +0200
Message-ID: <CAHp75VfienOzF0NVqS9+YDVSwqCB27E16SWKLy3_Yf4b5Ggbmw@mail.gmail.com>
References: <20191209162230.14991-1-hslester96@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191209162230.14991-1-hslester96@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chuhong Yuan <hslester96@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@linux.intel.com>, "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Bruce Beare <bruce.j.beare@intel.com>, Sheng Yang <sheng@linux.intel.com>, Yunhong Jiang <yunhong.jiang@intel.com>, Alan Cox <alan@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Dec 9, 2019 at 6:22 PM Chuhong Yuan <hslester96@gmail.com> wrote:
>
> goldfish_init() misses a check for platform_device_register_simple().
> Add a check to fix it.

Thanks for a patch. My comments below.

>  static int __init goldfish_init(void)
>  {
> +       struct platform_device *pdev;
> +
>         if (!goldfish_enable)
>                 return -ENODEV;
>
> -       platform_device_register_simple("goldfish_pdev_bus", -1,
> -                                       goldfish_pdev_bus_resources, 2);

> +       pdev =  platform_device_register_simple("goldfish_pdev_bus", -1,

Perhaps idea for a separate patch or maybe here:
-1 -> PLATFORM_DEVID_NONE

> +                                       goldfish_pdev_bus_resources, 2);

> +       if (IS_ERR(pdev))
> +               return PTR_ERR(pdev);
> +
>         return 0;

This can use PTR_ERR_OR_ZERO() macro instead.

>  }


-- 
With Best Regards,
Andy Shevchenko
