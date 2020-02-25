From: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 0/2] SME EFI table updates/fixes
Date: Tue, 25 Feb 2020 21:38:03 +0100
Message-ID: <CAKv+Gu_sd26ZEj8O10O3jLdzzh7FasBq9Suw_5kG_9hwtdNqmg@mail.gmail.com>
References: <cover.1582662842.git.thomas.lendacky@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1582662842.git.thomas.lendacky@amd.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 25 Feb 2020 at 21:34, Tom Lendacky <thomas.lendacky@amd.com> wrote:
>
> This patch series adds new EFI tables to the list of tables that are
> to be mapped unencrypted when SME is active
>
> - EFI TPM log and TPM final log tables
> - EFI RNG seed table
>
> ---
>
> Patches based on
>   git://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
>
> and commit:
>   dc235d62fc60 ("efi: Bump the Linux EFI stub major version number to #1")
>
> Changes since v2:
> - Split the patch into TPM related and RNG related patches
> - Account for the moving of the RNG seed EFI table from struct efi
>   to a static variable
>
> Tom Lendacky (2):
>   x86/efi: Add TPM related EFI tables to unencrypted mapping checks
>   x86/efi: Add RNG seed EFI table to unencrypted mapping check
>

Thanks Tom. I'll queue these up.
