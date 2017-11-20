From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] platform/x86: Add Acer Wireless Radio Control driver
Date: Mon, 20 Nov 2017 14:31:59 +0800
Message-ID: <CAB4CAweWf_66_gN3gz3AdcPojm59jP5S3fO5Ou7Nc3=MZsFUsg@mail.gmail.com>
References: <20171116134405.24819-1-chiu@endlessm.com> <CAHp75VcvDDuCp5M2CsMSFyFsnaP8GXAAqpGmJFq=TOsEwjw1aw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcvDDuCp5M2CsMSFyFsnaP8GXAAqpGmJFq=TOsEwjw1aw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 17, 2017 at 10:25 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Nov 16, 2017 at 3:44 PM, Chris Chiu <chiu@endlessm.com> wrote:
>> New Acer laptops in 2018 will have a separate ACPI device for
>> notifications from the airplane mode hotkey. The device name in
>> the DSDT is SMKB and its ACPI _HID is 10251229.
>>
>> For these models, when the airplane mode hotkey (Fn+F3) pressed,
>> a query 0x02 is started in the Embedded Controller, and all this
>> query does is a notify SMKB with the value 0x80.
>>
>>         Scope (_SB.PCI0.LPCB.EC0)
>>         {
>>                 (...)
>>                 Method (_Q02, 0, NotSerialized)  // _Qxx: EC Query
>>                 {
>>                     HKEV (0x2, One)
>>                     Notify (SMKB, 0x80) // Status Change
>>                 }
>>         }
>>
>> Based on code from asus-wireless
>
> Thanks for the patch! Overall looks good, comment below.
>
>
>> +#include <linux/kernel.h>
>
>> +#include <linux/module.h>
>> +#include <linux/init.h>
>
> Either from that, not both.
>
>> +#include <linux/types.h>
>> +#include <linux/acpi.h>
>> +#include <linux/input.h>
>
>> +#include <linux/pci_ids.h>
>
> Why do you need this one?
> Okay, you are using Vendor ID from there.
>
> Besides above, please keep them in alphabetical order.
>
>> +
>> +struct acer_wireless_data {
>> +       struct input_dev *idev;
>
>> +       struct acpi_device *adev;
>
> Do you need this one?
> I suppose whenever you need struct device out of it you may find it
> via input->parent. Right?
>

But I think it would make life easier to have the following line in
.notify callback
struct acer_wireless_data * data = acpi_driver_data(adev);

I can get its parent acer_wireless_data and point to input_dev easier.

>> +};
>> +
>> +static const struct acpi_device_id device_ids[] = {
>
> acer_wireless_acpi_ids
>
>> +       {"10251229", 0},
>> +       {"", 0},
>> +};
>> +MODULE_DEVICE_TABLE(acpi, device_ids);
>> +
>> +static void acer_wireless_notify(struct acpi_device *adev, u32 event)
>> +{
>> +       struct acer_wireless_data *data = acpi_driver_data(adev);
>> +
>
>> +       dev_dbg(&adev->dev, "event=%#x\n", event);
>
> This makes sense after the check, otherwise you will get two messages in a row.
>
>> +       if (event != 0x80) {
>> +               dev_notice(&adev->dev, "Unknown SMKB event: %#x\n", event);
>> +               return;
>> +       }
>
>> +       input_report_key(data->idev, KEY_RFKILL, 1);
>> +       input_report_key(data->idev, KEY_RFKILL, 0);
>
>
>> +       data->idev = devm_input_allocate_device(&adev->dev);
>> +       if (!data->idev)
>> +               return -ENOMEM;
>> +       data->idev->name = "Acer Wireless Radio Control";
>> +       data->idev->phys = "acer-wireless/input0";
>> +       data->idev->id.bustype = BUS_HOST;
>> +       data->idev->id.vendor = PCI_VENDOR_ID_AI;
>
> Where is product ID?
>
> I suppose you can use ACPI ID (which is basically PCI one in ACPI
> table) and split it.
>
> u32 id = simple_strtoul(...ACPI ID..., 16);
>
> vendor = id >> 16;
> product = id & 0xffff;
>
> Or just hard code product ID for now.
>

Thanks. I will hard code the product ID for now with
data->idev->id.vendor = 0x1229;

>> +static int acer_wireless_remove(struct acpi_device *adev)
>> +{
>> +       return 0;
>> +}
>> +
>
> No need UI suppose.
>

You mean remove this acer_wireless_remove which does nothing? Will do.

>> +MODULE_LICENSE("GPL");
>
> GPL v2 ?
>
> --
> With Best Regards,
> Andy Shevchenko
