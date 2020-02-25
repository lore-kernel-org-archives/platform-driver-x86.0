From: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2] x86/efi: Add additional efi tables for unencrypted
 mapping checks
Date: Tue, 25 Feb 2020 18:45:06 +0100
Message-ID: <CAKv+Gu_FJeiaY5yw9=ER4XyBZrDFZ5L4igrqxP6hhJ7Z8easpw@mail.gmail.com>
References: <261ea8108c6290e95962be2638bd204f90787c1c.1582652466.git.thomas.lendacky@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <261ea8108c6290e95962be2638bd204f90787c1c.1582652466.git.thomas.lendacky@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 25 Feb 2020 at 18:41, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> When booting with SME active, EFI tables must be mapped unencrypted since
> they were built by UEFI in unencrypted memory. Update the list of tables
> to be checked during early_memremap() processing to account for new EFI
> tables.
>
> This fixes a bug where an EFI TPM log table has been created by UEFI, but
> it lives in memory that has been marked as usable rather than reserved.
>
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
>
> ---
> Changes since v1:
> - Re-spun against EFI tree

Which one? Surely not the one in the link I included?

> ---
>  arch/x86/platform/efi/efi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/x86/platform/efi/efi.c b/arch/x86/platform/efi/efi.c
> index 43b24e149312..c6ca959e2366 100644
> --- a/arch/x86/platform/efi/efi.c
> +++ b/arch/x86/platform/efi/efi.c
> @@ -88,6 +88,9 @@ static const unsigned long * const efi_tables[] = {
>  #ifdef CONFIG_EFI_RCI2_TABLE
>         &rci2_table_phys,
>  #endif
> +       &efi.rng_seed,
> +       &efi.tpm_log,
> +       &efi.tpm_final_log,
>  };
>
>  u64 efi_setup;         /* efi setup_data physical address */
> --
> 2.17.1
>
