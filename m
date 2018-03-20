From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 01/12] drivers: base: Unified device connection lookup
Date: Tue, 20 Mar 2018 13:21:57 +0100
Message-ID: <eb9950fe-54fd-eda8-e678-f2216204f62f@redhat.com>
References: <20180314131215.70833-1-heikki.krogerus@linux.intel.com>
 <20180314131215.70833-2-heikki.krogerus@linux.intel.com>
 <20180320092004.GA21081@kroah.com> <20180320100412.GI11689@kuha.fi.intel.com>
 <20180320103259.GJ11689@kuha.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180320103259.GJ11689@kuha.fi.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Guenter Roeck <linux@roeck-us.net>, Jun Li <jun.li@nxp.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 20-03-18 11:32, Heikki Krogerus wrote:
> On Tue, Mar 20, 2018 at 12:04:12PM +0200, Heikki Krogerus wrote:
>>>> +void device_connection_remove(struct device_connection *con)
>>>> +{
>>>> +	mutex_lock(&devcon_lock);
>>>> +	list_del_rcu(&con->list);
>>>
>>> See, rcu?
>>
>> True. I'll send one more version.
> 
> Before I do that, Hans, can you quickly check this and see that I
> have not made any more mistakes? I don't trust myself anymore with
> these.

This looks good to me (note I did not test only reviewed).

Regards,

Hans
