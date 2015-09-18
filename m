From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: [PATCH 2/2] toshiba_acpi: Change default Hotkey enabling value
Date: Fri, 18 Sep 2015 15:45:05 -0600
Message-ID: <CAGdLNWFAfWsqz1XJWngEdR=SHzvHA2yRKq7vKWHnHmOvkMks2w@mail.gmail.com>
References: <1441819700-11678-1-git-send-email-coproscefalo@gmail.com>
	<1441819700-11678-3-git-send-email-coproscefalo@gmail.com>
	<20150918213717.GJ66179@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150918213717.GJ66179@vmdeb7>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

2015-09-18 15:37 GMT-06:00 Darren Hart <dvhart@infradead.org>:
> On Wed, Sep 09, 2015 at 11:28:20AM -0600, Azael Avalos wrote:
>> The driver currently uses the hotkey enabling value of 0x09 to enable
>> hotkey events, but windows uses a different value (0x01).
>>
>> All Toshiba laptops accept the following "hotkey" parameters:
>> 0x01 - Enable hotkey and system events.
>> 0x03 - Enable system events only.
>> 0x09 - Enable hotkey events only.
>> 0x0b - Disable (hotkey and system) events.
>>
>> This patch changes the default hotkey enabling value from 0x09 to 0x01,
>> enabling both the hotkey and system events.
>>
>> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
>
> Queued to testing for 4.4.
>
> Let me know if you were expecting 4.3....

Nope, just the first two fixes were meant for 4.3, the rest
is 4.4 material, I just wanted to send them early.

>
> --
> Darren Hart
> Intel Open Source Technology Center


Cheers
Azael



-- 
-- El mundo apesta y vosotros apestais tambien --
