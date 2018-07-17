From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] headers: fix linux/mod_devicetable.h inclusions
Date: Wed, 18 Jul 2018 00:37:05 +0300
Message-ID: <CAHp75VdHZ4jCMLZn3RwhQ3ZCabZVsPMMUUOeXLvKT1y=m_z+WQ@mail.gmail.com>
References: <20180709151947.940759-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180709151947.940759-1-arnd@arndb.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gabriel Somlo <somlo@cmu.edu>, "Michael S. Tsirkin" <mst@redhat.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, Jean-Christophe Trotin <jean-christophe.trotin@st.com>, Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, qemu-devel@nongnu.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, linux-arm-msm@vger.kernel.org, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Jul 9, 2018 at 6:19 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> A couple of drivers produced build errors after the mod_devicetable.h
> header was split out from the platform_device one, e.g.
>
> drivers/media/platform/davinci/vpbe_osd.c:42:40: error: array type has incomplete element type 'struct platform_device_id'
> drivers/media/platform/davinci/vpbe_venc.c:42:40: error: array type has incomplete element type 'struct platform_device_id'
>
> This adds the inclusion where needed.
>
> Fixes: ac3167257b9f ("headers: separate linux/mod_devicetable.h from linux/platform_device.h")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  drivers/platform/x86/intel_punit_ipc.c     | 1 +


> --- a/drivers/platform/x86/intel_punit_ipc.c
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -12,6 +12,7 @@
>   */
>
>  #include <linux/module.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/bitops.h>

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

for the above bits.

-- 
With Best Regards,
Andy Shevchenko
