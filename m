From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 01/12] drivers: base: Unified device connection lookup
Date: Thu, 1 Mar 2018 10:45:26 +0100
Message-ID: <bcf738d9-0bcb-42f8-d706-c2e72a150720@redhat.com>
References: <20180228150749.26831-1-hdegoede@redhat.com>
 <20180228150749.26831-2-hdegoede@redhat.com>
 <VI1PR0402MB3917DD93F114873CC736117389C60@VI1PR0402MB3917.eurprd04.prod.outlook.com>
 <20180301072825.GC5335@kuha.fi.intel.com>
 <CAHp75Vc4CF_Vn90FdFKwBf7egPNHvEWa=mja8w4SarKaW2KZRw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75Vc4CF_Vn90FdFKwBf7egPNHvEWa=mja8w4SarKaW2KZRw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jun Li <jun.li@nxp.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 01-03-18 10:32, Andy Shevchenko wrote:
> On Thu, Mar 1, 2018 at 9:28 AM, Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
>> Hi,
>>
>> On Thu, Mar 01, 2018 at 12:56:57AM +0000, Jun Li wrote:
>>>> +struct device *device_find_connection(struct device *dev, const char
>>>> +*con_id) {
>>>> +   return __device_find_connection(dev, con_id, generic_match, NULL); }
>>>
>>> -       return __device_find_connection(dev, con_id, generic_match, NULL);
>>> +       return __device_find_connection(dev, con_id, NULL, generic_match);
>>
>> Good catch!
> 
> It seems I proposed to put function first parameter followed by opaque
> data pointer for it.
> In that case it would be exactly like now.

Yes, but as mentioned I decided to keep it as is, so this is really a bug,
will fix for v6.

Regards,

Hans
