From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: Add driver for GPD pocket custom fan
 controller
Date: Tue, 12 Dec 2017 17:39:18 +0100
Message-ID: <7e78fc7d-b837-6b8c-55cc-799cca9b9fc2@redhat.com>
References: <20171212151102.18672-1-hdegoede@redhat.com>
 <CAOFm3uE540=Y=pgz=tcM2djQVYZw5b8uOP5wQwJNNhCNEXuW=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOFm3uE540=Y=pgz=tcM2djQVYZw5b8uOP5wQwJNNhCNEXuW=g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Ombredanne <pombredanne@nexb.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James <james@panaceas.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 12-12-17 16:33, Philippe Ombredanne wrote:
> Dear Hans,
> 
> On Tue, Dec 12, 2017 at 4:11 PM, Hans de Goede <hdegoede@redhat.com> wrote:
>> Add a driver for the GPD pocket device's custom fan controller, which
>> gets controlled through 2 GPIOs listed in a FAN02501 ACPI device.
> [...]
> 
>> --- /dev/null
>> +++ b/drivers/platform/x86/gpd-pocket-fan.c
>> @@ -0,0 +1,193 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> 
> This should be IMHO this style as requested by Linus on list and
> documented by Thomas in the doc patches:
> // SPDX-License-Identifier: GPL-2.0

Ok, fixed for v2.

>> +MODULE_LICENSE("GPL");
> 
> This module license means "GPL 2 or later" and does not match your top
> level GPL 2.0 license tag and should be instead as per module.h doc:
> MODULE_LICENSE("GPL v2");
> 
> .... unless you want this to be GPL 2.0 or later all the way in which
> case it should be:
> // SPDX-License-Identifier: GPL-2.0+
> and
> MODULE_LICENSE("GPL");
> 
> ... though I am not sure what is the point of "or later" for a module.

I prefer for "v2 or later" just in case there ever is a GPL v4
which is more sensible then v3...

So I've changed the SPDX identifier to:

// SPDX-License-Identifier: GPL-2.0+

Regards,

Hans
