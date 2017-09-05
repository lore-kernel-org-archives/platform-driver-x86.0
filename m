From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
Date: Tue, 5 Sep 2017 09:07:27 +0200
Message-ID: <CAHR064jrkntSf8_5kiL5x8B+_BwCHrrZajgedYe-FNt439wDpA@mail.gmail.com>
References: <20170904082110.30925-1-corentin.chary@gmail.com>
 <CAHp75VcWfzEiZAt+ESoF==q0LnCgWRzBuo6FDizmSJ7V-8Rw3w@mail.gmail.com> <CAHR064i+x=MeuHxTfDNRUr1C_p2dW8+nORqtGQUcYE4Dcbyppg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHR064i+x=MeuHxTfDNRUr1C_p2dW8+nORqtGQUcYE4Dcbyppg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

[re-send for the mailing list, I forgot that gmail was stupid]

On Tue, Sep 5, 2017 at 9:05 AM, Corentin Chary <corentin.chary@gmail.com> wrote:
>
>
> On Mon, Sep 4, 2017 at 7:15 PM, Andy Shevchenko <andy.shevchenko@gmail.com>
> wrote:
>>
>> On Mon, Sep 4, 2017 at 11:21 AM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
>> > This driver has been available on https://github.com/iksaif/thinkpad-wmi
>> > for
>> > a few year and is already deployed on large fleets of thinkpad laptops.
>> >
>> > The WMI interface is documented here:
>> > http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_en.pdf
>> > It mostly focused on changing BIOS/Firmware settings.
>>
>> I will do full review later, few comments right now though.
>> Thanks for doing this btw.
>>
>> > +Date:          Aug 2017
>> > +KernelVersion: 4.14
>>
>> v4.15 apparently
>
>
> Done
>
>>
>>
>> > + * Thinkpad WMI hotkey driver
>>
>> Solely for hot keys?
>>
>
> /hotkey/configuration/
>
>>
>> > + *
>> > + * Copyright(C) 2012 Corentin Chary <corentin.chary@gmail.com>
>>
>> 2012,2017?
>>
>
> done
>
>>
>>
>> > + *  You should have received a copy of the GNU General Public License
>> > + *  along with this program; if not, write to the Free Software
>> > + *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
>> > 02111-1307  USA
>>
>> Remove this. It had been changed once, no guarantee it will not again.
>
>
> done
>
>>
>>
>>
>> > +#include <linux/kernel.h>
>> > +#include <linux/module.h>
>> > +#include <linux/init.h>
>> > +#include <linux/types.h>
>> > +#include <linux/debugfs.h>
>> > +#include <linux/uaccess.h>
>> > +#include <linux/seq_file.h>
>> > +#include <linux/platform_device.h>
>> > +#include <linux/device.h>
>> > +#include <linux/acpi.h>
>>
>> Alphabetical.
>>
>
> done
>
>>
>> > +static int __init thinkpad_wmi_init(void)
>> > +{
>> > +       platform_device = platform_create_bundle(&platform_driver,
>> > +                                                thinkpad_wmi_probe,
>> > +                                                NULL, 0, NULL, 0);
>> > +       if (IS_ERR(platform_device))
>> > +               return PTR_ERR(platform_device);
>> > +       return 0;
>> > +}
>> > +
>> > +static void __exit thinkpad_wmi_exit(void)
>> > +{
>> > +       platform_device_unregister(platform_device);
>> > +       platform_driver_unregister(&platform_driver);
>> > +}
>> > +
>> > +module_init(thinkpad_wmi_init);
>> > +module_exit(thinkpad_wmi_exit);
>>
>> I didn't read the code, does it use WMI bus which Andy L. introduced
>> recently?
>>
>
> No, I wasn't aware of it. I checked the dell-wmi conversion patch and it
> should not be too hard.
> I'll probably sent that as a patch on top the existing driver (in the same
> series).
>
>>
>> --
>> With Best Regards,
>> Andy Shevchenko
>
>
>
>
> --
> Corentin Chary
> http://xf.iksaif.net



-- 
Corentin Chary
http://xf.iksaif.net
