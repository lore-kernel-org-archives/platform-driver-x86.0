From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Mon, 4 Sep 2017 20:15:32 +0300
Message-ID: <CAHp75VcWfzEiZAt+ESoF==q0LnCgWRzBuo6FDizmSJ7V-8Rw3w@mail.gmail.com>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:38858 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753890AbdIDRPd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Sep 2017 13:15:33 -0400
In-Reply-To: <20170904082110.30925-1-corentin.chary@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, Sep 4, 2017 at 11:21 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> This driver has been available on https://github.com/iksaif/thinkpad-wmi for
> a few year and is already deployed on large fleets of thinkpad laptops.
>
> The WMI interface is documented here: http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_en.pdf
> It mostly focused on changing BIOS/Firmware settings.

I will do full review later, few comments right now though.
Thanks for doing this btw.

> +Date:          Aug 2017
> +KernelVersion: 4.14

v4.15 apparently

> + * Thinkpad WMI hotkey driver

Solely for hot keys?

> + *
> + * Copyright(C) 2012 Corentin Chary <corentin.chary@gmail.com>

2012,2017?


> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, write to the Free Software
> + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

Remove this. It had been changed once, no guarantee it will not again.


> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +#include <linux/uaccess.h>
> +#include <linux/seq_file.h>
> +#include <linux/platform_device.h>
> +#include <linux/device.h>
> +#include <linux/acpi.h>

Alphabetical.

> +static int __init thinkpad_wmi_init(void)
> +{
> +       platform_device = platform_create_bundle(&platform_driver,
> +                                                thinkpad_wmi_probe,
> +                                                NULL, 0, NULL, 0);
> +       if (IS_ERR(platform_device))
> +               return PTR_ERR(platform_device);
> +       return 0;
> +}
> +
> +static void __exit thinkpad_wmi_exit(void)
> +{
> +       platform_device_unregister(platform_device);
> +       platform_driver_unregister(&platform_driver);
> +}
> +
> +module_init(thinkpad_wmi_init);
> +module_exit(thinkpad_wmi_exit);

I didn't read the code, does it use WMI bus which Andy L. introduced recently?

-- 
With Best Regards,
Andy Shevchenko
