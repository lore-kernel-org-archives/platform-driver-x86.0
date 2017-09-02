From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 03/11] mux: consumer.h: Add MUX_USB_* state constant
 defines
Date: Sat, 2 Sep 2017 21:46:12 +0200
Message-ID: <26df089e-9b49-977d-1a73-ad021f2a0067@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-4-hdegoede@redhat.com>
 <8a05c405-3649-ac99-d4ca-3e519e1c63a8@roeck-us.net>
 <3e777501-aa94-70ae-3dc5-f64a15fd9704@redhat.com>
 <20170902190629.GA30251@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57024 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752739AbdIBTqS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Sep 2017 15:46:18 -0400
In-Reply-To: <20170902190629.GA30251@roeck-us.net>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>

Hi,

On 02-09-17 21:06, Guenter Roeck wrote:
> On Sat, Sep 02, 2017 at 05:59:14PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 02-09-17 16:59, Guenter Roeck wrote:
>>> On 09/01/2017 02:48 PM, Hans de Goede wrote:
>>>> Add MUX_USB_* state constant defines, which can be used by USB
>>>> device/host and Type-C polarity/role/altmode mux drivers and consumers
>>>> to ensure that they agree on the meaning of the mux_control_select()
>>>> state argument.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>> ---
>>>>   include/linux/mux/consumer.h | 16 ++++++++++++++++
>>>>   1 file changed, 16 insertions(+)
>>>>
>>>> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
>>>> index 912dd48a3a5d..e3ec9b4db962 100644
>>>> --- a/include/linux/mux/consumer.h
>>>> +++ b/include/linux/mux/consumer.h
>>>> @@ -15,6 +15,22 @@
>>>>   #include <linux/compiler.h>
>>>> +/*
>>>> + * Mux state values for USB muxes, used for both USB device/host role muxes
>>>> + * as well as for Type-C polarity/role/altmode muxes.
>>>> + *
>>>> + * MUX_USB_POLARITY_INV may be or-ed together with any other mux-state as
>>>> + * inverted-polarity (Type-C plugged in upside down) can happen with any
>>>> + * other mux-state.
>>>> + */
>>>> +#define MUX_USB_POLARITY_INV    BIT(0)   /* Polarity inverted bit */
>>>> +#define MUX_USB_NONE        (1 << 1) /* Mux open / not connected */
>>>
>>>
>>> Why BIT(0) but (1 << 1) and so on ?
>>
>> Because the polarity can be or-ed together with any of the other options.
>> Each option can be selected normal and inverted polarity (connector
>> inserted upside down).
>>
> Ah yes, it is (2 << 1), not (1 << 2).

Ack.

> But then why don't the options start > with (0 << 1) ?

Because I somehow thought that would conflict with the polarity
bit which of course it will not, so I will fix this for v2.

Note I used BIT(0) for the flag and not say BIT(8) because the mux subsys expects
a mux-driver to declare a max value for the state parameter to mux_control_select(),
which is what the MUX_USB_STATES define is for. If I were to use say BIT(8) for
the polarity then the MUX_USB_STATES value would become (256 + 5) even though we
only have 12 unique states.

> I'll have to look into the series more closely; 

Thank you.

> so far the polarity was
> a separate parameter to tcpm_mux_set() and the low level API.

Right, I've kept the polarity as a separate parameter at the tcpm level,
but the mux_control_select() function has only one argument, so I or
the polarity and the alt-mode to mux for together there.

Regards,

Hans


> 
> Guenter
> 
>> Regards,
>>
>> Hans
>>
>>>> +#define MUX_USB_DEVICE        (2 << 1) /* USB device mode */
>>>> +#define MUX_USB_HOST        (3 << 1) /* USB host mode */
>>>> +#define MUX_USB_HOST_AND_DP_SRC    (4 << 1) /* USB host + 2 lanes Display Port */
>>>> +#define MUX_USB_DP_SRC        (5 << 1) /* 4 lanes Display Port source */
>>>> +#define MUX_USB_STATES        (6 << 1)
>>>> +
>>>>   struct device;
>>>>   struct mux_control;
>>>>
>>>
