From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1] platform/mellanox: Add Mellanox TRIO driver
Date: Mon, 18 Nov 2019 12:47:11 +0200
Message-ID: <CAHp75VdWM8Y7TAbVYNoo9vV2N+ZYDZWWGHtgvt8WjD5KiFfZRA@mail.gmail.com>
References: <cover.1573460910.git.sramani@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1573460910.git.sramani@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shravan Kumar Ramani <sramani@mellanox.com>
Cc: Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Vadim Pasternak <vadimp@mellanox.com>, Liming Sun <lsun@mellanox.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 11, 2019 at 4:35 PM Shravan Kumar Ramani
<sramani@mellanox.com> wrote:
>
> This patch adds support for Mellanox BlueField TRIO PCIe host controller.
> The driver supports multiple TRIO instances and provides a sysfs interface
> to allow the user to read/set the L3 cache profile for transactions going
> through the TRIO. It also provides an interrupt handler for the TRIO blocks.

Besides on-going review, this doesn't apply. So, please check that you
rebase it on top of our for-next branch, thanks!

P.S. I'll wait for v2 with Vadim's comments being addressed.

>
> Shravan Kumar Ramani (1):
>   platform/mellanox: Add Mellanox TRIO driver
>
>  MAINTAINERS                            |   5 +
>  drivers/platform/mellanox/Kconfig      |   8 +
>  drivers/platform/mellanox/Makefile     |   1 +
>  drivers/platform/mellanox/mlxbf-trio.c | 624 +++++++++++++++++++++++++++++++++
>  4 files changed, 638 insertions(+)
>  create mode 100644 drivers/platform/mellanox/mlxbf-trio.c
>
> --
> 2.1.2
>


-- 
With Best Regards,
Andy Shevchenko
