From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 02/12] usb: typec: Start using ERR_PTR
Date: Fri, 16 Feb 2018 12:21:42 +0100
Message-ID: <c0b2929e-ca14-3341-6e47-57f6fe49d4e6@redhat.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-3-hdegoede@redhat.com>
 <CAHp75VfRX3sPKS8Fbt-5cRskRg=75XYfnE7UYLO5c37iUvkgWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfRX3sPKS8Fbt-5cRskRg=75XYfnE7UYLO5c37iUvkgWg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 16-02-18 12:07, Andy Shevchenko wrote:
> On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> In order to allow the USB Type-C Class driver take care of
>> things like muxes and other possible dependencies for the
>> port drivers, returning ERR_PTR instead of NULL from the
>> registration functions in case of failure.
>>
>> The reason for taking over control of the muxes for example
>> is because handling them in the port drivers would be just
>> boilerplate.
> 
>>   void typec_unregister_altmode(struct typec_altmode *alt)
>>   {
>> -       if (alt)
>> -               device_unregister(&alt->dev);
>> +       device_unregister(&alt->dev);
>>   }
> 
> But it's a pattern to guarantee that unregister type of functions are
> NULL (or ERR_PTR) aware.

Agreed this needs an if (!IS_ERR_OR_NULL()), will fix for v2.

Regards,

Hans

> 
> 
>>   void typec_unregister_partner(struct typec_partner *partner)
>>   {
>> -       if (partner)
>> -               device_unregister(&partner->dev);
>> +       device_unregister(&partner->dev);
>>   }
> 
> Ditto.
> 
