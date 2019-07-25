From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 20/35] platform/x86/asus: Use kmemdup rather than
 duplicating its implementation
Date: Thu, 25 Jul 2019 20:43:43 +0300
Message-ID: <CAHp75VeFrg6KwxAyMx6o46jbJ8teMMGSEckm8xM=J9kFyODQNg@mail.gmail.com>
References: <20190703162951.32737-1-huangfq.daxian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703162951.32737-1-huangfq.daxian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 3, 2019 at 7:30 PM Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memcpy, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memcpy.
>

Pushed to my review and testing queue, thanks!

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
> Changes in v2:
>   - Fix a typo in commit message (memset -> memcpy)
>   - Split into two patches.
>
>  drivers/platform/x86/asus-wmi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 9b18a184e0aa..472b317ad814 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -260,12 +260,11 @@ static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
>          * Copy to dma capable address otherwise memory corruption occurs as
>          * bios has to be able to access it.
>          */
> -       input.pointer = kzalloc(args.length, GFP_DMA | GFP_KERNEL);
> +       input.pointer = kmemdup(args.pointer, args.length, GFP_DMA | GFP_KERNEL);
>         input.length = args.length;
>         if (!input.pointer)
>                 return -ENOMEM;
>         phys_addr = virt_to_phys(input.pointer);
> -       memcpy(input.pointer, args.pointer, args.length);
>
>         status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_AGFN,
>                                         phys_addr, 0, &retval);
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
