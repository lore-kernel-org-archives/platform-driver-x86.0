From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC PATCH 0/5] platform drivers for UP Board
Date: Fri, 1 Jul 2016 15:44:50 -0700
Message-ID: <20160701224450.GG60048@f23x64.localdomain>
References: <1465762392-9205-1-git-send-email-dan@emutex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:44846 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752115AbcGAWow (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2016 18:44:52 -0400
Content-Disposition: inline
In-Reply-To: <1465762392-9205-1-git-send-email-dan@emutex.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan O'Donovan <dan@emutex.com>
Cc: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@intel.com>

On Sun, Jun 12, 2016 at 09:13:07PM +0100, Dan O'Donovan wrote:

Hi Dan,

My apologies for the delay. Two tips on getting a response to RFCs.

1) Always include the individuals you are looking for a response from directly
on Cc. In this case, that should have been me as the maintainer of the
platform-driver-x86 tree. Also, Andy and Mika as he noted in a separate email. I
would also suggest the mfd maintainer as your CPLD driver is just that. The
get_maintainer.pl script will help you there:

$ scripts/get_maintainer.pl -f drivers/platform/x86/
Darren Hart <dvhart@infradead.org> (maintainer:X86 PLATFORM DRIVERS)
platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
linux-kernel@vger.kernel.org (open list)

$ scripts/get_maintainer.pl -f drivers/mfd
Lee Jones <lee.jones@linaro.org> (supporter:MULTIFUNCTION DEVICES (MFD))
linux-kernel@vger.kernel.org (open list)

2) All patches should Cc LKML

Before I respond, I would recommend that you resend this series, as is, and
include the above names and lists on Cc. For Andy and Mika, please use:

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

I'll wait for you to resend and we'll start the review so that everyone that
needs to receive the emails has, and that people that may be interested that we
haven't thought of can find it on LKML.

Thanks,

> The UP Board is a new SBC based on the Intel Atom X5-Z8350 "Cherry 
> Trail" SoC and features a 40-pin I/O pin header and form-factor 
> inspired by the Raspberry Pi 2.
> 
> It utilises a CPLD between the SoC and the external 40-pin header
> to provide buffered voltage level-shifting of the I/O signals, mux
> switching and LED control, and programmable pin mapping between the
> SoC and the external pin header.
> 
> The gpio, pinctrl and led drivers provided in this patch series 
> enable and manage the functions provided by that CPLD.
> 
> I have some open questions about this patch series:
>  * Is it ok to place all of these various UP board drivers together
>    in drivers/platform/x86/, or would it be preferable to place them
>    in the respective sub-system directories (gpio, pinctrl, etc.)?
>    My rationale for keeping them together here is that they are all
>    specific to this UP Board platform and not expected to be
>    generally useful on any other platforms (except variants of UP).
>  * Is it acceptable to include hard-coded references to ACPI device
>    IDs (representing devices integrated on the SoC devices) for the
>    purpose of pin map and gpio references? Or is it required to
>    use only named gpio pins?
> 
> Any feedback/suggestions on the questions above, and the patch series
> in general, would be greatly appreciated!
> 
> Further information on the UP board can be obtained from [1] and [2].
> 
> [1] https://www.up-board.org
> [2] https://up-community.org
> 
> Dan O'Donovan (5):
>   platform: x86: add driver for UP Board I/O CPLD
>   platform: x86: add UP Board I/O pinctrl driver
>   platform: x86: add UP Board I/O gpio driver
>   platform: x86: add UP Board CPLD LED driver
>   platform: x86: add platform driver for UP Board
> 
>  drivers/platform/x86/Kconfig            |  13 +
>  drivers/platform/x86/Makefile           |   5 +
>  drivers/platform/x86/up_board.c         | 167 ++++++++++
>  drivers/platform/x86/up_board_cpld.c    | 560 ++++++++++++++++++++++++++++++++
>  drivers/platform/x86/up_board_cpld.h    |  38 +++
>  drivers/platform/x86/up_board_gpio.c    | 254 +++++++++++++++
>  drivers/platform/x86/up_board_gpio.h    |  59 ++++
>  drivers/platform/x86/up_board_leds.c    |  85 +++++
>  drivers/platform/x86/up_board_leds.h    |  50 +++
>  drivers/platform/x86/up_board_pinctrl.c | 285 ++++++++++++++++
>  drivers/platform/x86/up_board_pinctrl.h | 102 ++++++
>  11 files changed, 1618 insertions(+)
>  create mode 100644 drivers/platform/x86/up_board.c
>  create mode 100644 drivers/platform/x86/up_board_cpld.c
>  create mode 100644 drivers/platform/x86/up_board_cpld.h
>  create mode 100644 drivers/platform/x86/up_board_gpio.c
>  create mode 100644 drivers/platform/x86/up_board_gpio.h
>  create mode 100644 drivers/platform/x86/up_board_leds.c
>  create mode 100644 drivers/platform/x86/up_board_leds.h
>  create mode 100644 drivers/platform/x86/up_board_pinctrl.c
>  create mode 100644 drivers/platform/x86/up_board_pinctrl.h
> 
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Darren Hart
Intel Open Source Technology Center
