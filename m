From: Dan O'Donovan <dan@emutex.com>
Subject: Re: [RESEND RFC PATCH 0/5] platform drivers for UP Board
Date: Tue, 13 Sep 2016 22:51:04 +0100
Message-ID: <b00bfb33-5cb3-20cc-35d2-399e10655dc7@emutex.com>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
 <1467648434-29080-1-git-send-email-dan@emutex.com>
 <1473759772.11323.265.camel@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:55147 "EHLO bert.emutex.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754940AbcIMW2q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Sep 2016 18:28:46 -0400
In-Reply-To: <1473759772.11323.265.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Cc: lee.jones@linaro.org, mika.westerberg@linux.intel.com, linux-kernel@vger.kernel.org

On 09/13/2016 10:42 AM, Andy Shevchenko wrote:
> On Mon, 2016-07-04 at 17:07 +0100, Dan O'Donovan wrote:
>> [Re-sending to a wider audience suggested by Darren Hart]
>>
>> The UP Board is a new SBC based on the Intel Atom X5-Z8350 "Cherry 
>> Trail" SoC and features a 40-pin I/O pin header and form-factor 
>> inspired by the Raspberry Pi 2.
>>
>> It utilises a CPLD between the SoC and the external 40-pin header
>> to provide buffered voltage level-shifting of the I/O signals, mux
>> switching and LED control, and programmable pin mapping between the
>> SoC and the external pin header.
>>
>> The gpio, pinctrl and led drivers provided in this patch series 
>> enable and manage the functions provided by that CPLD.
>>
>> I have some open questions about this patch series:
>>  * Is it ok to place all of these various UP board drivers together
>>    in drivers/platform/x86/, or would it be preferable to place them
>>    in the respective sub-system directories (gpio, pinctrl, etc.)?
>>    My rationale for keeping them together here is that they are all
>>    specific to this UP Board platform and not expected to be
>>    generally useful on any other platforms (except variants of UP).
>>  * Is it acceptable to include hard-coded references to ACPI device
>>    IDs (representing devices integrated on the SoC devices) for the
>>    purpose of pin map and gpio references? Or is it required to
>>    use only named gpio pins?
>>
>> Any feedback/suggestions on the questions above, and the patch series
>> in general, would be greatly appreciated!
Firstly, many thanks to everyone for the valuable feedback provided on
this patch set so far, and apologies for the very delayed follow-up.  I
haven't abandoned it, but unfortunately haven't been able to get near it
for the past few weeks for various reasons.  I'm looking forward to
addressing all comments received as soon as I can.
> Looking closer to this and taking into account what is going on with
> ACPI support for open connected boards I think this patch set is not
> needed at all.
I do agree with your point about shifting a lot of this into ASL.  I do
think a driver is still needed though to manage the pin/led controller
(implemented on a CPLD).  Some previous comments have suggested an MFD
driver structure for representing the CPLD functions, which seems to
make sense. 
> Basically most (everything?) you are trying to do in C code may and
> should be done in ASL.
Among other things, one primary concept was to create a "virtual"
gpio-chip on top of this pin controller to represent the external header
pins, so that I could catch the run-time pin configuration updates (e.g.
gpio direction changes) and reconfigure the pin controller accordingly. 
It also had some other benefits, from my perspective, such as allowing a
more logical pin numbering scheme for those external pins.  I haven't
seen ASL examples yet that would indicate that it is possible to do it
all in ASL, but I'll do some more research on that front now to see what
I might be missing there.
>
> Mika, can you correct me if I'm wrong?
>
>> Further information on the UP board can be obtained from [1] and [2].
>>
>> [1] https://www.up-board.org
>> [2] https://up-community.org
>>
>> Dan O'Donovan (5):
>>   platform: x86: add driver for UP Board I/O CPLD
>>   platform: x86: add UP Board I/O pinctrl driver
>>   platform: x86: add UP Board I/O gpio driver
>>   platform: x86: add UP Board CPLD LED driver
>>   platform: x86: add platform driver for UP Board
>>
>>  drivers/platform/x86/Kconfig            |  13 +
>>  drivers/platform/x86/Makefile           |   5 +
>>  drivers/platform/x86/up_board.c         | 167 ++++++++++
>>  drivers/platform/x86/up_board_cpld.c    | 560
>> ++++++++++++++++++++++++++++++++
>>  drivers/platform/x86/up_board_cpld.h    |  38 +++
>>  drivers/platform/x86/up_board_gpio.c    | 254 +++++++++++++++
>>  drivers/platform/x86/up_board_gpio.h    |  59 ++++
>>  drivers/platform/x86/up_board_leds.c    |  85 +++++
>>  drivers/platform/x86/up_board_leds.h    |  50 +++
>>  drivers/platform/x86/up_board_pinctrl.c | 285 ++++++++++++++++
>>  drivers/platform/x86/up_board_pinctrl.h | 102 ++++++
>>  11 files changed, 1618 insertions(+)
>>  create mode 100644 drivers/platform/x86/up_board.c
>>  create mode 100644 drivers/platform/x86/up_board_cpld.c
>>  create mode 100644 drivers/platform/x86/up_board_cpld.h
>>  create mode 100644 drivers/platform/x86/up_board_gpio.c
>>  create mode 100644 drivers/platform/x86/up_board_gpio.h
>>  create mode 100644 drivers/platform/x86/up_board_leds.c
>>  create mode 100644 drivers/platform/x86/up_board_leds.h
>>  create mode 100644 drivers/platform/x86/up_board_pinctrl.c
>>  create mode 100644 drivers/platform/x86/up_board_pinctrl.h
>>
