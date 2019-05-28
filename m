From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] x86/efi: Free efi_pgd with free_pages()
Date: Tue, 28 May 2019 15:09:38 +0200
Message-ID: <CAKv+Gu8hXOLHLrBMJLYnDyW8xYhSHTAsNk6i034KA7gThjSpJQ@mail.gmail.com>
References: <20190528125805.2166-1-mail@lennart-glauer.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190528125805.2166-1-mail@lennart-glauer.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lennart Glauer <mail@lennart-glauer.de>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Lennart,

Thanks for the patch.

On Tue, 28 May 2019 at 14:58, Lennart Glauer <mail@lennart-glauer.de> wrote:
>
> This patch fixes another occurrence of free_page() that was missed
> in 06ace26.

Please don't trim commit IDs like that. I think 12 digits is our
current minimum?

error: short SHA1 06ace26 is ambiguous
hint: The candidates are:
hint:   06ace26edc14 commit 2016-02-12 - staging: lustre: fix all NULL
comparisons in LNet layer
hint:   06ace26f4e6f commit 2018-03-22 - x86/efi: Free efi_pgd with free_pages()

> The efi_pgd is allocated as PGD_ALLOCATION_ORDER pages and therefore must
> also be freed as PGD_ALLOCATION_ORDER pages with free_pages().
>
> Signed-off-by: Lennart Glauer <mail@lennart-glauer.de>

Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Ingo, can you take this directly? I can't really test this anyway.


> ---
>  arch/x86/platform/efi/efi_64.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/x86/platform/efi/efi_64.c b/arch/x86/platform/efi/efi_64.c
> index 08ce8177c3af..acad22a44774 100644
> --- a/arch/x86/platform/efi/efi_64.c
> +++ b/arch/x86/platform/efi/efi_64.c
> @@ -222,7 +222,7 @@ int __init efi_alloc_page_tables(void)
>         pgd = efi_pgd + pgd_index(EFI_VA_END);
>         p4d = p4d_alloc(&init_mm, pgd, EFI_VA_END);
>         if (!p4d) {
> -               free_page((unsigned long)efi_pgd);
> +               free_pages((unsigned long)efi_pgd, PGD_ALLOCATION_ORDER);
>                 return -ENOMEM;
>         }
>
> --
> 2.17.1
