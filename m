From: Chris Chiu <chiu@endlessm.com>
Subject: Re: [PATCH] platform/x86: Add Acer Wireless Radio Control driver
Date: Tue, 21 Nov 2017 11:34:12 +0800
Message-ID: <CAB4CAwdR6_5JAFETXZ07jLfdXniRudRaM1EfYzGGrJ5q9W9MhQ@mail.gmail.com>
References: <20171116134405.24819-1-chiu@endlessm.com> <CAHp75VcvDDuCp5M2CsMSFyFsnaP8GXAAqpGmJFq=TOsEwjw1aw@mail.gmail.com>
 <CAB4CAweWf_66_gN3gz3AdcPojm59jP5S3fO5Ou7Nc3=MZsFUsg@mail.gmail.com> <CAHp75Vd9u3VqHh77BcW35rmSDCB-zuiNoV_6ZtWVYss-QtCjZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vd9u3VqHh77BcW35rmSDCB-zuiNoV_6ZtWVYss-QtCjZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Upstreaming Team <linux@endlessm.com>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Nov 20, 2017 at 8:24 PM, Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Nov 20, 2017 at 8:31 AM, Chris Chiu <chiu@endlessm.com> wrote:
>> On Fri, Nov 17, 2017 at 10:25 PM, Andy Shevchenko
>> <andy.shevchenko@gmail.com> wrote:
>>> On Thu, Nov 16, 2017 at 3:44 PM, Chris Chiu <chiu@endlessm.com> wrote:
>
>>>> +
>>>> +struct acer_wireless_data {
>>>> +       struct input_dev *idev;
>>>
>>>> +       struct acpi_device *adev;
>>>
>>> Do you need this one?
>>> I suppose whenever you need struct device out of it you may find it
>>> via input->parent. Right?
>>>
>>
>> But I think it would make life easier to have the following line in
>> .notify callback
>> struct acer_wireless_data * data = acpi_driver_data(adev);
>>
>> I can get its parent acer_wireless_data and point to input_dev easier.
>
> Yes, though if I'm not mistaken, you may get rid completely of your
> custom container and use struct input_dev for accessing that via
> to_acpi_device(idev->dev.parent).
>
> It would be less code, less data structures, cleaner view.
> Right?
>
>>>> +static int acer_wireless_remove(struct acpi_device *adev)
>>>> +{
>>>> +       return 0;
>>>> +}
>>>> +
>>>
>>> No need UI suppose.
>>>
>>
>> You mean remove this acer_wireless_remove which does nothing? Will do.
>
> Correct.
>
> --
> With Best Regards,
> Andy Shevchenko

I think I get your point. Will soon have a v2 patch later.
