From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: never 'select DMI' from a driver
Date: Mon, 29 Feb 2016 15:10:54 -0800
Message-ID: <20160229231054.GI7499@dvhart-mobl5.amr.corp.intel.com>
References: <1456748014-358588-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56973 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751212AbcB2XK7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 18:10:59 -0500
Content-Disposition: inline
In-Reply-To: <1456748014-358588-1-git-send-email-arnd@arndb.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, Andy Lutomirski <luto@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Feb 29, 2016 at 01:13:31PM +0100, Arnd Bergmann wrote:
> CONFIG_DMI is a user-selectable Kconfig symbol that some drivers
> depend on. As part of a recent patch, other drivers started
> adding a 'select' for the same symbol, which now causes
> a recursive dependency:
> 
> drivers/gpio/Kconfig:34:error: recursive dependency detected!
> subsection "Kconfig recursive dependency limitations"
> drivers/gpio/Kconfig:34:        symbol GPIOLIB is selected by GEOS
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> arch/x86/Kconfig:2591:  symbol GEOS depends on DMI
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> arch/x86/Kconfig:815:   symbol DMI is selected by DELL_LAPTOP
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/platform/x86/Kconfig:104:       symbol DELL_LAPTOP depends on BACKLIGHT_CLASS_DEVICE
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/video/backlight/Kconfig:158:    symbol BACKLIGHT_CLASS_DEVICE is selected by FB_BACKLIGHT
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/video/fbdev/Kconfig:192:        symbol FB_BACKLIGHT is selected by FB_SSD1307
> For a resolution refer to Documentation/kbuild/kconfig-language.txt
> subsection "Kconfig recursive dependency limitations"
> drivers/video/fbdev/Kconfig:2462:       symbol FB_SSD1307 depends on GPIOLIB
> 
> Basically we should either always use 'depends on' or always use 'select'
> to avoid this kind of loop. Using 'depends on' is more useful here,
> as it still allows users to turn off the symbol of they really
> want to, without having to track down every driver selecting it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: cbd9d95b2b27 ("dell-wmi, dell-laptop: select DMI")

Thanks Arnd, queued to testing.

-- 
Darren Hart
Intel Open Source Technology Center
