From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v3 00/12] USB Type-C device-connection, mux and switch support
Date: Mon, 26 Feb 2018 13:39:43 +0200
Message-ID: <CAHp75VcAVKEyjqidVBbupeNb4cxviBeNtjigddn_gH=xpA5x6g@mail.gmail.com>
References: <20180226090925.29436-1-hdegoede@redhat.com> <CAHp75VevNQB_8BTaazq94RHQ_Nbs=CcjJwfw+Ph9iLunLYb9kg@mail.gmail.com>
 <f8fc1193-2057-497f-3494-aeef437f1341@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f8fc1193-2057-497f-3494-aeef437f1341@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Feb 26, 2018 at 1:19 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> On 26-02-18 11:59, Andy Shevchenko wrote:
>> On Mon, Feb 26, 2018 at 11:09 AM, Hans de Goede <hdegoede@redhat.com>
>> wrote:

>> Didn't have time to comment on v2, so here we are:
>> you are using in even the same file two styles, i.e. IS_ERR_OR_NULL
>> vs. !x || IS_ERR(x) (and negative ones).

> Good catch, I only see this in "usb: common: Small class for USB role
> switches",
> will fix for v4.
>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> So with the above fixed I can apply your reviewed-by to the entire series?

Right.

-- 
With Best Regards,
Andy Shevchenko
