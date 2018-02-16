From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 01/12] drivers: base: Unified device connection lookup
Date: Fri, 16 Feb 2018 12:21:15 +0100
Message-ID: <ee0d4723-ab1c-85d8-e6b7-a66e1a045b02@redhat.com>
References: <20180216104751.8371-1-hdegoede@redhat.com>
 <20180216104751.8371-2-hdegoede@redhat.com>
 <CAHp75VcyrUvPzojY1J2cUheuYz6mRCP_VppSx740ELanNaQ+Hw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcyrUvPzojY1J2cUheuYz6mRCP_VppSx740ELanNaQ+Hw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 16-02-18 12:00, Andy Shevchenko wrote:
> On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>>
>> Several frameworks - clk, gpio, phy, pmw, etc. - maintain
>> lookup tables for describing connections and provide custom
>> API for handling them. This introduces a single generic
>> lookup table and API for the connections.
>>
>> The motivation for this commit is centralizing the
>> connection lookup, but the goal is to ultimately extract the
>> connection descriptions also from firmware by using the
>> fwnode_graph_* functions and other mechanisms that are
>> available.
> 
>> +void *__device_find_connection(struct device *dev, const char *con_id,
> 
>> +                              void *data,
>> +                              void *(*match)(struct devcon *con, int ep,
>> +                                             void *data))
> 
> Perhaps swap them, since data is dependent parameter to match.

The pattern of having the data before the callback function is not
unheard of in the kernel. Changing this now feels like needless
churn, but if there is a strong preference for this then we can
fix this for v2.

Heikki, do you want me to take care of minor changes like this for v2?

> And put match function on one line disregard 80 character limit?

I think that breaking the 80 chars limit here would make sense, yes.
Any other opinions on this?

> 
>> +/**
>> + * struct devcon - Device Connection Descriptor
>> + * @endpoint: The names of the two devices connected together
>> + * @id: Unique identifier for the connection
>> + */
>> +struct devcon {
>> +       const char              *endpoint[2];
>> +       const char              *id;
>> +       struct list_head        list;
>> +};
>> +
> 
>> +void *__device_find_connection(struct device *dev, const char *con_id,
>> +                              void *data,
>> +                              void *(*match)(struct devcon *con, int ep,
>> +                                             void *data));
> 
> Ditto.
> 
>> +
>> +struct device *device_find_connection(struct device *dev, const char *con_id);
>> +
>> +#define DEVCON(_ep0, _ep1, _id)                { { _ep0, _ep1 }, _id, }
> 
> Please use (struct devcon) here to make it possible to do like
> 
> struct devcon foo;
>  > foo = DEVCON(...);

Good idea, will fix for v2.

Regards,

Hans
