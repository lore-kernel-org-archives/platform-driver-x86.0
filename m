From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 9/9] platform: x86: get rid of a non-existent document
Date: Fri, 28 Jun 2019 17:49:48 +0300
Message-ID: <CAHp75VfkWkVvvufTje1G+w=7gjsr7D2On-NsOsOoTEBNLVLJzQ@mail.gmail.com>
References: <cover.1561723736.git.mchehab+samsung@kernel.org> <9472251c3ff159b832b4e82d77836c44f89b49b0.1561723736.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9472251c3ff159b832b4e82d77836c44f89b49b0.1561723736.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Jun 28, 2019 at 3:12 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Changeset 163ede97a9a2 ("Documentation: platform: Delete x86-laptop-drivers.txt")
> removed the x86-laptop-drivers.txt file, but forgot to update its
> Kconfig.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Fixes: 163ede97a9a2 ("Documentation: platform: Delete x86-laptop-drivers.txt")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  drivers/platform/x86/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index bd15b47abcb4..c318501773bc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -433,9 +433,6 @@ config COMPAL_LAPTOP
>           It adds support for rfkill, Bluetooth, WLAN, LCD brightness, hwmon
>           and battery charging level control.
>
> -         For a (possibly incomplete) list of supported laptops, please refer
> -         to: Documentation/platform/x86-laptop-drivers.txt
> -
>  config SONY_LAPTOP
>         tristate "Sony Laptop Extras"
>         depends on ACPI
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko
