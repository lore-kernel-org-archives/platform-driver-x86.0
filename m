From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 19/30] platform/x86: Use kmemdup rather than duplicating
 its implementation
Date: Wed, 3 Jul 2019 18:20:41 +0300
Message-ID: <CAHp75Vef=H492wUnGWGSu7wg5qTb0Q7Y1VrcM60WK=8ejr=bcQ@mail.gmail.com>
References: <20190703131908.26138-1-huangfq.daxian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703131908.26138-1-huangfq.daxian@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fuqian Huang <huangfq.daxian@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 3, 2019 at 4:19 PM Fuqian Huang <huangfq.daxian@gmail.com> wrote:
>
> kmemdup is introduced to duplicate a region of memory in a neat way.
> Rather than kmalloc/kzalloc + memset, which the programmer needs to
> write the size twice (sometimes lead to mistakes), kmemdup improves
> readability, leads to smaller code and also reduce the chances of mistakes.
> Suggestion to use kmemdup rather than using kmalloc/kzalloc + memset.
>

Please, split on driver basis and use correct prefix.

> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c      |  3 +--
>  drivers/platform/x86/thinkpad_acpi.c | 17 +++++++----------
>  2 files changed, 8 insertions(+), 12 deletions(-)
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
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7bde4640ef34..d379bdf98a0f 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3647,22 +3647,19 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>                 goto err_exit;
>
>         /* Set up key map */
> -       hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
> -                                       GFP_KERNEL);
> -       if (!hotkey_keycode_map) {
> -               pr_err("failed to allocate memory for key map\n");
> -               res = -ENOMEM;
> -               goto err_exit;
> -       }
> -
>         keymap_id = tpacpi_check_quirks(tpacpi_keymap_qtable,
>                                         ARRAY_SIZE(tpacpi_keymap_qtable));
>         BUG_ON(keymap_id >= ARRAY_SIZE(tpacpi_keymaps));
>         dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
>                    "using keymap number %lu\n", keymap_id);
>
> -       memcpy(hotkey_keycode_map, &tpacpi_keymaps[keymap_id],
> -               TPACPI_HOTKEY_MAP_SIZE);
> +       hotkey_keycode_map = kmemdup(&tpacpi_keymaps[keymap_id],
> +                       TPACPI_HOTKEY_MAP_SIZE, GFP_KERNEL);
> +       if (!hotkey_keycode_map) {
> +               pr_err("failed to allocate memory for key map\n");
> +               res = -ENOMEM;
> +               goto err_exit;
> +       }
>
>         input_set_capability(tpacpi_inputdev, EV_MSC, MSC_SCAN);
>         tpacpi_inputdev->keycodesize = TPACPI_HOTKEY_MAP_TYPESIZE;
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
