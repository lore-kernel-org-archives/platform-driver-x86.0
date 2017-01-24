From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] platform/x86: Add IMS/ZII SCU driver
Date: Tue, 24 Jan 2017 10:45:10 -0800
Message-ID: <430e7545-68ab-d5bb-f58b-4c18980eabee@gmail.com>
References: <20170111212644.9217-1-f.fainelli@gmail.com>
 <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:32916 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750739AbdAXSpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Jan 2017 13:45:13 -0500
In-Reply-To: <CAHp75VcH9ez0AjybBA8mtJ=nSyTTjXeV6d_P_NBA-mZmxjZ+Ng@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, cphealy@gmail.com, Guenter Roeck <linux@roeck-us.net>, Darren Hart <dvhart@infradead.org>, open list <linux-kernel@vger.kernel.org>

On 01/13/2017 08:38 AM, Andy Shevchenko wrote:
> On Wed, Jan 11, 2017 at 11:26 PM, Florian Fainelli <f.fainelli@gmail.com> wrote:
>> From: Guenter Roeck <linux@roeck-us.net>
>>
>> This patch adds support for the IMS (now Zodiac Inflight Innovations)
>> SCU Generation 1/2/3 platform driver. This driver registers all the
>> on-module peripherals: Ethernet switches (Broadcom or Marvell), I2C to
>> GPIO expanders, Kontrom CPLD/I2C master, and more.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
>> ---
>> Darren,
>>
>> This is against your "for-next" branch thanks!
> 
> I'm going to review this later, though few of comments.

Waiting for this to happen so I can do a respin with an updated file
location/Kconfig symbol
