From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] ACPI / platform: Fix return value check in check_acpi_dev()
Date: Thu, 9 Jul 2020 22:54:55 +0300
Message-ID: <CAHp75Vci3KCT0J_E9S2odgTr0aDXcjRe=s=-rZGGzrbUV3N+5A@mail.gmail.com>
References: <1591357094-39850-1-git-send-email-luwei32@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1591357094-39850-1-git-send-email-luwei32@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lu Wei <luwei32@huawei.com>
Cc: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, AceLan Kao <acelan.kao@canonical.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 5, 2020 at 2:42 PM Lu Wei <luwei32@huawei.com> wrote:
>
> In the function check_acpi_dev(), if it fails to create
> platform device, the return value is ERR_PTR() or NULL. Thus it must
> use IS_ERR_OR_NULL to check return value.
>

Thanks!

> Fixes: ecc83e52b28c (intel-hid: new hid event driver for hotkeys)

This is not the correct format. Please, fix it in the next version, thanks!

>  drivers/platform/x86/intel-hid.c  | 2 +-
>  drivers/platform/x86/intel-vbtn.c | 2 +-

Please, split per driver.

-- 
With Best Regards,
Andy Shevchenko
