From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 04/11] usb: xhci: Add Intel cherrytrail extended cap /
 otg phy mux handling
Date: Thu, 21 Sep 2017 13:55:54 +0200
Message-ID: <e7e99900-85d7-0e88-afde-adc3342d41ea@redhat.com>
References: <20170905164221.11266-1-hdegoede@redhat.com>
 <20170905164221.11266-5-hdegoede@redhat.com>
 <59B14628.5030700@linux.intel.com>
 <40e23f9e-538f-088a-96a3-402818bcf3fb@redhat.com>
 <59C1103A.9030509@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <59C1103A.9030509@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 19-09-17 14:40, Mathias Nyman wrote:
> Hi,
> 
> sorry about the long delay
> 
> On 07.09.2017 18:49, Hans de Goede wrote:
>> Hi,
>>
>> On 07-09-17 15:14, Mathias Nyman wrote:
>>> On 05.09.2017 19:42, Hans de Goede wrote:
>>>> The Intel cherrytrail xhci controller has an extended cap mmio-range
>>>> which contains registers to control the muxing to the xhci (host mode)
>>>> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
>>>>
>>>> Having a mux driver included in the xhci code (or under drivers/usb/host)
>>>> is not desirable. So this commit adds a simple handler for this extended
>>>> capability, which creates a platform device with the caps mmio region as
>>>> resource, this allows us to write a separate platform mux driver for the
>>>> mux.
>>>>
>>> I think it would be better to have one place where we add handlers for
>>> vendor specific extended capabilities.
>>>
>>> Something like xhci-vendor-ext-caps.c, or just xhci-ext-caps.c as
>>> there's a xhci-ext-caps.h header already
>>>
>>> We could walk through the capability list once and add the needed handlers.
>>> Something like:
>>>
>>> +int xhci_ext_cap_init(void __iomem *base)
>>
>> This will need to take a struct xhci_hcd *xhci param instead
>> as some of the ext_cap handling (including the cht mux code)
>> will need access to this.
>>
> 
> yes, sample code added in second patch for reference/testing.
> 
>>
>> So I see 2 options here (without making this function PCI specific)
>> 1) Add an u32 product_id field to struct xhci_hcd; or
>> 2) Use a quirk flag as my current code is doing.
>>
>> I'm fine with doing this either way, please let me know your preference.
> 
> Lets go with the quirk for now, I'll sort that out later
> 
>>
>> Can you do a "git format-patch" of that and send it to me? If you
>> can give me that + your preference for how to check if we're
>> dealing with a cht xhci hcd in xhci_ext_cap_init I can do a v3
>> with your suggestions applied.
> 
> Ended up modifying xhci_find_next_ext_cap() using id = 0 for
> the next capability in list. Patch attached,
> 
> Second patch is just for reference how to use it.

Thank you for the patches, I'm working on prepping a v3 of
this series which includes and uses the first patch.

Regards,

Hans
