From: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Subject: Re: [PATCH v3 08/11] platform/x86: asus-wmi: Enhance detection of
 thermal data
Date: Thu, 9 May 2019 19:49:07 +0200
Message-ID: <0d7f6a9e-d508-65ba-9646-39f1d1a42a13@gmail.com>
References: <7acd57fe-604a-a96a-4ca2-a25bc88d6405@gmail.com>
 <7595c4f0-3dbb-2fe5-4daf-4b9a266f67d7@gmail.com>
 <CAHp75VdE7MBjyLj=9bS6oc5jc8+BC_hftWUJgZGG02iDd=saiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdE7MBjyLj=9bS6oc5jc8+BC_hftWUJgZGG02iDd=saiQ@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Daniel Drake <drake@endlessm.com>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 08.05.19 15:58, Andy Shevchenko wrote:
> On Fri, Apr 19, 2019 at 1:12 PM Yurii Pavlovskyi
> <yurii.pavlovskyi@gmail.com> wrote:
> 
>> -               if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
>> +               if (value == ASUS_WMI_UNSUPPORTED_METHOD || (value & 0xFFF80000)
> 
> Seems like a bug fix and thus should be a separate commit predecessing
> the series.
The previous one should theoretically work as well, just thought that would
help readability, will revert this.

>> -       else if (attr == &dev_attr_temp1_input.attr)
>> -               dev_id = ASUS_WMI_DEVID_THERMAL_CTRL;
>
> I don't see how this change affects the user output or driver
> behaviour. Why is it done?
> 
>> -       } else if (dev_id == ASUS_WMI_DEVID_THERMAL_CTRL) {
> 
>> +       } else if (attr == &dev_attr_temp1_input.attr) {
> 
> So, I don't see why you change this line.
> 
Yes, looking at this patch now I'd guess the refactoring there is really
misguided as it adds a lot more code than it removes, will drop it
completely and just add a new condition to the current check instead in
next version:
-		/* If value is zero, something is clearly wrong */
-		if (!value)
+		if (!value || value == 1)

Thanks,
Yurii
