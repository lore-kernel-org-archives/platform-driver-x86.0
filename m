From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Only bind to the
 INT0002 dev when using s2idle
Date: Tue, 14 Apr 2020 15:15:53 +0200
Message-ID: <32d57d33-5278-aead-1545-fac1ab936fbd@redhat.com>
References: <20200407213058.62870-1-hdegoede@redhat.com>
 <cfd3171a-94fb-7382-28e1-a236cb6759cc@redhat.com>
 <CAHp75VdqQnHbMSSeoDESMgywH-1VxBTT=Uo_GLV1aycmg=MXtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAHp75VdqQnHbMSSeoDESMgywH-1VxBTT=Uo_GLV1aycmg=MXtA@mail.gmail.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxim Mikityanskiy <maxtram95@gmail.com>, "5 . 3+" <stable@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/8/20 12:26 AM, Andy Shevchenko wrote:
> On Wed, Apr 8, 2020 at 1:24 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi all,
>>
>> I just realized that I should have added a cover letter to this
>> patch to discuss how to merge it.
>>
>> Rafael has already queued up the
>> "[PATCH v3 2/2] platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()"
>> in his tree. Looking at both patches the parts of the file the
>> touch are different enough that that should not be a problem though.
>>
>> So I guess this can go through platform/x86 as usual, or
>> (assuming everyone is ok with the change itself) alternatively
>> Rafael can take it to make sure there will be no conflicts?
> 
> You will need different patches for v5.7 and the rest.
> In v5.7 new CPU macros are in use.

I see, I will send out a v2 rebased on top of 5.7-rc1.

Regards,

Hans
