From: Aaron Ma <aaron.ma@canonical.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: not loading brightness_init
 when _BCL invalid
Date: Thu, 2 Jul 2020 18:51:12 +0800
Message-ID: <2ecf4032-267c-32c8-361f-2396730aaa65@canonical.com>
References: <20200702085520.16901-1-aaron.ma@canonical.com>
 <CAHp75VeCHW=GMgyHRswsTrZ7b3TEnFh15F-5fyHcUsqXzoFS_g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VeCHW=GMgyHRswsTrZ7b3TEnFh15F-5fyHcUsqXzoFS_g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: mapengyu@gmail.com, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On 7/2/20 5:30 PM, Andy Shevchenko wrote:
> On Thu, Jul 2, 2020 at 11:55 AM Aaron Ma <aaron.ma@canonical.com> wrote:
>>
>> When _BCL invalid, disable thinkpad_acpi backlight brightness control.
>>
>> brightness_enable is already checked at the beginning,
> 
>> Always print notice when enabled brightness control.
> 
> Why?
> 

Default brightness_enable = 2, so this message will always be printed as before
Actually no change here.

> ...
> 
>> +       pr_notice("thinkpad_acpi native brightness control enabled\n");
> 
> 'notice' level is quite high, why do we spam users with this?
> 

Like above.

Another reason is  most thinkpads are using native gpu driver to control
brightness, notice when thinkpad_acpi brightness is enabled.

Aaron
