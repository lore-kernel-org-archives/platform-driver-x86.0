From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel_cht_int33fe: Work around BIOS bug on
 some devices
Date: Mon, 14 Aug 2017 22:52:06 +0200
Message-ID: <06a1d48c-9f75-4aab-107d-f71ce8ebbb26@redhat.com>
References: <20170814201425.20991-1-hdegoede@redhat.com>
 <CAHp75Vdityzx+fzU_q0vULGpT3ww8C0_D0fYtEW77Hyh1yTX6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:30959 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752199AbdHNUwJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Aug 2017 16:52:09 -0400
In-Reply-To: <CAHp75Vdityzx+fzU_q0vULGpT3ww8C0_D0fYtEW77Hyh1yTX6A@mail.gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On 14-08-17 22:45, Andy Shevchenko wrote:
> On Mon, Aug 14, 2017 at 11:14 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> At least one BIOS enumerates the max17047 both through the INT33FE ACPI
>> device (it is right there in the resources table) as well as through a
>> separate MAX17047 device.
>>
>> This commit checks for the max17047 already being enumerated through
>> a separate MAX17047 ACPI device and if so it uses the i2c-client
>> instantiated for this and attaches the device-props for the max17047 to
>> that i2c-client.
> 
>> +int cht_int33fe_check_for_max17047(struct device *dev, void *data)
>> +{
>> +       const char *name = dev_name(dev);
>> +       struct i2c_client **max17047 = data;
>> +
>> +       if (name && strcmp(name, "i2c-MAX17047:00") == 0) {
> 
> Can we stop using bad practice of comparing against _instance_?
> If device is suppose to be single in the system, wouldn't _HID be enough?

Yes _HID would be enough, but that takes some extra code with little
gain IMHO, we are effectively checking the HID here as that is where
the device-name comes from.

Anyways if you strongly prefer a HID check I can do a v2 doing that
either way let me know.

Regards,

Hans



> 
>> +               *max17047 = to_i2c_client(dev);
>> +               return 1;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> 
