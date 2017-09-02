From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 03/11] mux: consumer.h: Add MUX_USB_* state constant
 defines
Date: Sat, 2 Sep 2017 17:59:14 +0200
Message-ID: <3e777501-aa94-70ae-3dc5-f64a15fd9704@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <20170901214845.7153-4-hdegoede@redhat.com>
 <8a05c405-3649-ac99-d4ca-3e519e1c63a8@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49736 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752697AbdIBP7W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Sep 2017 11:59:22 -0400
In-Reply-To: <8a05c405-3649-ac99-d4ca-3e519e1c63a8@roeck-us.net>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org

Hi,

On 02-09-17 16:59, Guenter Roeck wrote:
> On 09/01/2017 02:48 PM, Hans de Goede wrote:
>> Add MUX_USB_* state constant defines, which can be used by USB
>> device/host and Type-C polarity/role/altmode mux drivers and consumers
>> to ensure that they agree on the meaning of the mux_control_select()
>> state argument.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   include/linux/mux/consumer.h | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
>> index 912dd48a3a5d..e3ec9b4db962 100644
>> --- a/include/linux/mux/consumer.h
>> +++ b/include/linux/mux/consumer.h
>> @@ -15,6 +15,22 @@
>>   #include <linux/compiler.h>
>> +/*
>> + * Mux state values for USB muxes, used for both USB device/host role muxes
>> + * as well as for Type-C polarity/role/altmode muxes.
>> + *
>> + * MUX_USB_POLARITY_INV may be or-ed together with any other mux-state as
>> + * inverted-polarity (Type-C plugged in upside down) can happen with any
>> + * other mux-state.
>> + */
>> +#define MUX_USB_POLARITY_INV    BIT(0)   /* Polarity inverted bit */
>> +#define MUX_USB_NONE        (1 << 1) /* Mux open / not connected */
> 
> 
> Why BIT(0) but (1 << 1) and so on ?

Because the polarity can be or-ed together with any of the other options.
Each option can be selected normal and inverted polarity (connector
inserted upside down).

Regards,

Hans

>> +#define MUX_USB_DEVICE        (2 << 1) /* USB device mode */
>> +#define MUX_USB_HOST        (3 << 1) /* USB host mode */
>> +#define MUX_USB_HOST_AND_DP_SRC    (4 << 1) /* USB host + 2 lanes Display Port */
>> +#define MUX_USB_DP_SRC        (5 << 1) /* 4 lanes Display Port source */
>> +#define MUX_USB_STATES        (6 << 1)
>> +
>>   struct device;
>>   struct mux_control;
>>
> 
