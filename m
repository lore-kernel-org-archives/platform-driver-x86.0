From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/mellanox: Add bootctl driver for Mellanox
 BlueField Soc
Date: Thu, 31 Jan 2019 19:02:18 +0200
Message-ID: <CAHp75Vfr7+NONzthw=E77BqLb06=wgfmNqu7D01fkcNQMqUCsQ@mail.gmail.com>
References: <0b74e9ad12360b56bc0a3c2ca972798c424f2610.1548790896.git.lsun@mellanox.com>
 <1548953587-12719-1-git-send-email-lsun@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548953587-12719-1-git-send-email-lsun@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Liming Sun <lsun@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, David Woods <dwoods@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 31, 2019 at 6:53 PM Liming Sun <lsun@mellanox.com> wrote:
>
> This commit adds the bootctl platform driver for Mellanox BlueField
> Soc, which controls the eMMC boot partition swapping and sends SMC
> calls to ATF running at exception level EL3 to program some system
> register. This register is only accessible in secure code and is
> used to enable the watchdog after reboot.
>
> Below are the sequences of a typical use case.
>
>   1. User-space tool upgrades one eMMC boot partition and requests
>      the boot partition swapping;
>
>   2. The bootctl driver handles such request and sends SMC call
>      to ATF. ATF programs register BREADCRUMB0 which has value
>      preserved during software reset. It also programs eMMC to
>      swap the boot partition;
>
>   3. After software reset (rebooting), ATF BL1 (BootRom) checks
>      register BREADCRUMB0 to enable watchdog if configured;
>
>   4. If booting fails, the watchdog timer will trigger rebooting.
>      In such case, ATF BootRom will switch the boot partition
>      to the previous one.

Thanks for an update. My comments below.


> Reviewed-by: David Woods <dwoods@mellanox.com>

I'm not sure I see this guy to review v2. Of course if you consider
all changes minor, you may leave this tag.

> Signed-off-by: Liming Sun <lsun@mellanox.com>
> ---

Here should be a changelog what had been done in new version.
> +/* UUID used to probe ATF service. */

> +static const char * const mlxbf_bootctl_svc_uuid_str =
> +       "89c036b4-e7d7-11e6-8797-001aca00bfc4";

static const char *xxx = ...;

> +/*
> + * UUID structure used to match the returned value from ATF in
> + * four 32-bit words. No need to do endian conversion here.
> + */
> +union mlxbf_bootctl_uuid {
> +       guid_t guid;
> +       u32 words[4];
> +};

I'm not sure it's the best you can do. instead of using union, better
to use conversion from and to corresponding uuid type.

The rest I will comment on v3.

-- 
With Best Regards,
Andy Shevchenko
