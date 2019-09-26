From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH] x86/efi: Don't require non-blocking EFI callbacks
Date: Thu, 26 Sep 2019 17:29:57 +0200
Message-ID: <CAKv+Gu8ok=v6WaKWW1AmhPgf1-n7p=4h8Tkno9YNW6H8p4fg8w@mail.gmail.com>
References: <20190926141234.8271-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926141234.8271-1-ross.lagerwall@citrix.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: linux-efi <linux-efi@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, platform-driver-x86@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sai Praneeth <sai.praneeth.prakhya@intel.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 26 Sep 2019 at 16:12, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:
>
> If a backend does not implement non-blocking EFI operations, it implies
> that the normal operations are non-blocking.

Is that documented anywhere?

> Instead of crashing
> dereferencing a NULL pointer, fallback to the normal operations since it
> is safe to do so.
>

I agree that crashing is never the right thing to do, but I wonder
whether we shouldn't just bail instead. If the provided default
operation is non-blocking, the platform can populate the function
pointer with a reference to the default implementation.


> Fixes: 5a58bc1b1edc ("efi/x86: Use non-blocking SetVariable() for efi_delete_dummy_variable()")
> Fixes: ca0e30dcaa53 ("efi: Add nonblocking option to efi_query_variable_store()")
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> ---
>  arch/x86/platform/efi/quirks.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/platform/efi/quirks.c b/arch/x86/platform/efi/quirks.c
> index 3b9fd679cea9..4167f5e8f3e8 100644
> --- a/arch/x86/platform/efi/quirks.c
> +++ b/arch/x86/platform/efi/quirks.c
> @@ -106,11 +106,13 @@ early_param("efi_no_storage_paranoia", setup_storage_paranoia);
>  */
>  void efi_delete_dummy_variable(void)
>  {
> -       efi.set_variable_nonblocking((efi_char16_t *)efi_dummy_name,
> -                                    &EFI_DUMMY_GUID,
> -                                    EFI_VARIABLE_NON_VOLATILE |
> -                                    EFI_VARIABLE_BOOTSERVICE_ACCESS |
> -                                    EFI_VARIABLE_RUNTIME_ACCESS, 0, NULL);
> +       efi_set_variable_t *set_variable = efi.set_variable_nonblocking ?:
> +                                          efi.set_variable;
> +
> +       set_variable((efi_char16_t *)efi_dummy_name, &EFI_DUMMY_GUID,
> +                    EFI_VARIABLE_NON_VOLATILE |
> +                    EFI_VARIABLE_BOOTSERVICE_ACCESS |
> +                    EFI_VARIABLE_RUNTIME_ACCESS, 0, NULL);
>  }
>
>  /*
> @@ -127,10 +129,12 @@ query_variable_store_nonblocking(u32 attributes, unsigned long size)
>  {
>         efi_status_t status;
>         u64 storage_size, remaining_size, max_size;
> +       efi_query_variable_info_t *query_variable_info =
> +               efi.query_variable_info_nonblocking ?:
> +               efi.query_variable_info;
>
> -       status = efi.query_variable_info_nonblocking(attributes, &storage_size,
> -                                                    &remaining_size,
> -                                                    &max_size);
> +       status = query_variable_info(attributes, &storage_size,
> +                                    &remaining_size, &max_size);
>         if (status != EFI_SUCCESS)
>                 return status;
>
> --
> 2.21.0
>
