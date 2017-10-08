From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add entry for the PEAQ WMI hotkeys driver
Date: Sun, 8 Oct 2017 21:08:22 +0300
Message-ID: <CAHp75VetOUDKwSBnBs9exH2dMSJW=RzaKooo1_3aEfxC2Go3Ng@mail.gmail.com>
References: <20171005143147.5092-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005143147.5092-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Oct 5, 2017 at 5:31 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add an entry to make myself the maintainer of the PEAQ WMI hotkeys driver.

Pushed to my review queue, thanks!

>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea7d7955516e..e250a9c356c5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10544,6 +10544,12 @@ S:     Maintained
>  F:     crypto/pcrypt.c
>  F:     include/crypto/pcrypt.h
>
> +PEAQ WMI HOTKEYS DRIVER
> +M:     Hans de Goede <hdegoede@redhat.com>
> +L:     platform-driver-x86@vger.kernel.org
> +S:     Maintained
> +F:     drivers/platform/x86/peaq-wmi.c
> +
>  PER-CPU MEMORY ALLOCATOR
>  M:     Tejun Heo <tj@kernel.org>
>  M:     Christoph Lameter <cl@linux.com>
> --
> 2.14.2
>



-- 
With Best Regards,
Andy Shevchenko
