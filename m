From: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 0/2] arm64: Support to find mirrored memory ranges
Date: Thu, 20 Feb 2020 10:21:29 +0100
Message-ID: <CAKv+Gu930691BaDLuoVOU_gz0V8MtfWbfSTKcYuHxDvLz5hAiA@mail.gmail.com>
References: <1582289580-24045-1-git-send-email-jingxiangfeng@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1582289580-24045-1-git-send-email-jingxiangfeng@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-efi <linux-efi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Linux-MM <linux-mm@kvack.org>, Kefeng Wang <wangkefeng.wang@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 20 Feb 2020 at 04:43, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
>
> This series enable finding mirrored memory ranges
> functionality on arm64 platform. This feature has been
> implemented on the x86 platform, so we move some
> functions from x86.
>

Hello Jing Xiangfeng,

Could you explain your use case a bit better? Usually, the firmware is
a better place to make modifications to the EFI memory map.

The reason I am asking is that currently, on ARM and arm64, we never
make *any* changes to the firmware provided tables (EFI system table,
EFI memory map, DT/ACPI/SMBIOS tables etc), in order to ensure that
kexec is idempotent, i.e., it will always see the exact same state as
far as the firmware is concerned. This is a bit different from x86,
where the memory map is already modified for various other reasons, so
using it for fake memory regions is not such a big deal.

Do you see a use case for this in production?

> Jing Xiangfeng (2):
>   efi: allow EFI_FAKE_MEMMAP on arm64 platform
>   arm64/efi: support to find mirrored memory ranges
>
>  arch/x86/include/asm/efi.h      |  5 -----
>  arch/x86/platform/efi/efi.c     | 39 ---------------------------------------
>  drivers/firmware/efi/Kconfig    |  2 +-
>  drivers/firmware/efi/arm-init.c |  2 ++
>  drivers/firmware/efi/efi.c      | 23 +++++++++++++++++++++++
>  drivers/firmware/efi/memmap.c   | 16 ++++++++++++++++
>  include/linux/efi.h             |  5 +++++
>  7 files changed, 47 insertions(+), 45 deletions(-)
>
> --
> 1.8.3.1
>
