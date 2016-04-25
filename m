From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH] toshiba_acpi: Fix regression caused by hotkey enabling value
Date: Mon, 25 Apr 2016 11:45:17 -0600
Message-ID: <CAGdLNWGr=jAEX3ccRCoRQSg7hm1onyJnEnK9MA-SG_EjKLtoHQ@mail.gmail.com>
References: <1461338976-5194-1-git-send-email-coproscefalo@gmail.com>
	<20160425173135.GA2115@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33638 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754456AbcDYRpS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 Apr 2016 13:45:18 -0400
In-Reply-To: <20160425173135.GA2115@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Darren,


No problem with me, ohh and thanks, I forgot to include stable.


Cheers
Azael


2016-04-25 11:31 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Fri, Apr 22, 2016 at 09:29:36AM -0600, Azael Avalos wrote:
>> Commit 52cbae0127ad ("toshiba_acpi: Change default Hotkey enabling value")
>> changed the hotkeys enabling value, as it was the same value Windows uses,
>> however, it turns out that the value tells the EC that the driver will now
>> take care of the hardware events like the physical RFKill switch or the
>> pointing device toggle button.
>>
>> This patch reverts such commit by changing the default hotkey enabling
>> value to 0x09, which enables hotkey events only, making the hardware
>> buttons working again.
>>
>> Fixes bugs 113331 and 114941.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>
> I wasn't planning on another pull to Linus at r5, but since this is a
> regression, I've queued it for 4.6-rc6. It will liketly be the only patch in the
> pull request. If Linus objects, we'll push it to 4.7. Either way, I'll tag it
> for stable.
>
>> ---
>>  drivers/platform/x86/toshiba_acpi.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index df1f1a7..01e12d2 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -135,7 +135,7 @@ MODULE_LICENSE("GPL");
>>  /* Field definitions */
>>  #define HCI_ACCEL_MASK                       0x7fff
>>  #define HCI_HOTKEY_DISABLE           0x0b
>> -#define HCI_HOTKEY_ENABLE            0x01
>> +#define HCI_HOTKEY_ENABLE            0x09
>>  #define HCI_HOTKEY_SPECIAL_FUNCTIONS 0x10
>>  #define HCI_LCD_BRIGHTNESS_BITS              3
>>  #define HCI_LCD_BRIGHTNESS_SHIFT     (16-HCI_LCD_BRIGHTNESS_BITS)
>> --
>> 2.8.1
>>
>>
>
> --
> Darren Hart
> Intel Open Source Technology Center



-- 
-- El mundo apesta y vosotros apestais tambien --
