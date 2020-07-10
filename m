From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 0/2] Fix return value check
Date: Fri, 10 Jul 2020 23:37:51 +0300
Message-ID: <CAHp75VeOKoZN9x9HnKSeTtbm=0+c6YQ9b1P7XUyC7c6M7nhPkw@mail.gmail.com>
References: <1594373418-24833-1-git-send-email-luwei32@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1594373418-24833-1-git-send-email-luwei32@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lu Wei <luwei32@huawei.com>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, AceLan Kao <acelan.kao@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jul 10, 2020 at 12:28 PM Lu Wei <luwei32@huawei.com> wrote:
>
> In the function check_acpi_dev(), if it fails to create
> platform device, the return value is ERR_PTR() or NULL.
> Thus it must use IS_ERR_OR_NULL to check return value.
>

Pushed to my review and testing queue, thanks!

> ---
> v2->v3
> - Modify format
> v3->v4
> - Change commit number to 12 characters
>
> Lu Wei (2):
>   intel-hid: Fix return value check in check_acpi_dev()
>   intel-vbtn: Fix return value check in check_acpi_dev()
>
>  drivers/platform/x86/intel-hid.c  | 2 +-
>  drivers/platform/x86/intel-vbtn.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> --
> 2.7.4
>


-- 
With Best Regards,
Andy Shevchenko
