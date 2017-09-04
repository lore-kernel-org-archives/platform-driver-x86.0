From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 11/11] platform/x86: intel_cht_int33fe: Add mux mappings
 for the Type-C port
Date: Mon, 4 Sep 2017 16:20:35 +0200
Message-ID: <e1be9239-daff-1f67-dc15-a504acc433a4@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-12-hdegoede@redhat.com>
 <CAHp75VdFAY6HaOh5-yBsgBoeJgpDrVUizX+zESq1Pr0-sQR6Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VdFAY6HaOh5-yBsgBoeJgpDrVUizX+zESq1Pr0-sQR6Pg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 02-09-17 12:42, Andy Shevchenko wrote:
> On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> We need to add mappings for the mux subsys to be able to find the
>> muxes for the fusb302 driver to be able to control the PI3USB30532
>> Type-C mux and the device/host mux integrated in the CHT SoC.
>>
> 
> I suppose it will go via not PDx86 tree,

Hmm, as I just mentioned in the "[PATCH v4 0/3] i2c: Hookup typec power-negotation to the PMIC and charger"
thread I've multiple patches for the intel_cht_int33fe.c driver pending,
so I think it would be best if these were merged through platform/x86,
but that is going to require a merge-tag for the mux stuff so that
that can be merged into platform/x86 as we need some mux/consumer.h
changes.

Anyways lets figure this out as we go along, it is also going to depend
on the timing, if the mux changes land for 4.15 but some of the other
bits don't then this patch (which ties everything together) becomes
4.16 material and we don't need to worry about a merge-tag,

Regards,

Hans



  so
> 
> Acked-by: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>



> 
>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/platform/x86/Kconfig             |  1 +
>>   drivers/platform/x86/intel_cht_int33fe.c | 23 +++++++++++++++++++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index c5554577681a..4256e05ee584 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -794,6 +794,7 @@ config ACPI_CMPC
>>   config INTEL_CHT_INT33FE
>>          tristate "Intel Cherry Trail ACPI INT33FE Driver"
>>          depends on X86 && ACPI && I2C && REGULATOR
>> +       select MULTIPLEXER
>>          ---help---
>>            This driver add support for the INT33FE ACPI device found on
>>            some Intel Cherry Trail devices.
>> diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe.c
>> index 24a1662be81d..611b8af9cefd 100644
>> --- a/drivers/platform/x86/intel_cht_int33fe.c
>> +++ b/drivers/platform/x86/intel_cht_int33fe.c
>> @@ -24,6 +24,7 @@
>>   #include <linux/i2c.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> +#include <linux/mux/consumer.h>
>>   #include <linux/regulator/consumer.h>
>>   #include <linux/slab.h>
>>
>> @@ -35,6 +36,19 @@ struct cht_int33fe_data {
>>          struct i2c_client *pi3usb30532;
>>   };
>>
>> +static struct mux_lookup cht_int33fe_mux_lookup[] = {
>> +       {
>> +               .provider = "i2c-pi3usb30532",
>> +               .dev_id   = "i2c-fusb302",
>> +               .mux_name = "type-c-mode-mux",
>> +       },
>> +       {
>> +               .provider = "intel_cht_usb_mux",
>> +               .dev_id   = "i2c-fusb302",
>> +               .mux_name = "usb-role-mux",
>> +       },
>> +};
>> +
>>   /*
>>    * Grrr I severly dislike buggy BIOS-es. At least one BIOS enumerates
>>    * the max17047 both through the INT33FE ACPI device (it is right there
>> @@ -170,6 +184,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
>>          board_info.properties = fusb302_props;
>>          board_info.irq = fusb302_irq;
>>
>> +       mux_add_table(cht_int33fe_mux_lookup,
>> +                     ARRAY_SIZE(cht_int33fe_mux_lookup));
>> +
>>          data->fusb302 = i2c_acpi_new_device(dev, 2, &board_info);
>>          if (!data->fusb302)
>>                  goto out_unregister_max17047;
>> @@ -193,6 +210,9 @@ static int cht_int33fe_probe(struct i2c_client *client)
>>          if (data->max17047)
>>                  i2c_unregister_device(data->max17047);
>>
>> +       mux_remove_table(cht_int33fe_mux_lookup,
>> +                     ARRAY_SIZE(cht_int33fe_mux_lookup));
>> +
>>          return -EPROBE_DEFER; /* Wait for the i2c-adapter to load */
>>   }
>>
>> @@ -205,6 +225,9 @@ static int cht_int33fe_remove(struct i2c_client *i2c)
>>          if (data->max17047)
>>                  i2c_unregister_device(data->max17047);
>>
>> +       mux_remove_table(cht_int33fe_mux_lookup,
>> +                     ARRAY_SIZE(cht_int33fe_mux_lookup));
>> +
>>          return 0;
>>   }
>>
>> --
>> 2.13.5
>>
> 
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
