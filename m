From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH 00/10] fujitsu-laptop: use device-specific data instead
 of module-wide globals
Date: Mon, 1 May 2017 22:35:36 +0930
Message-ID: <20170501130536.GA25546@marvin.atrad.com.au>
References: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:59024 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1949993AbdEANGd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 May 2017 09:06:33 -0400
Content-Disposition: inline
In-Reply-To: <20170424133334.7064-1-kernel@kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Michael

On Mon, Apr 24, 2017 at 03:33:24PM +0200, Micha?? K??pie?? wrote:
> fujitsu-laptop registers two ACPI drivers.  Whenever an ACPI device with
> a matching identifier is found by the ACPI bus, a new instance of the
> relevant driver is bound to that ACPI device.  However, both ACPI
> drivers registered by fujitsu-laptop access module-wide global data
> structures, assuming neither ACPI driver will ever be instantiated more
> than once.  While there are currently no indications of such issues
> happening in the wild, it is theoretically possible for multiple
> FUJ02B1/FUJ02E3 ACPI devices to be present in the firmware, which would
> cause two instances of the relevant driver to simultaneously access
> module-wide globals without any locking in place.  Also, modern Fujitsu
> laptops ship without the FUJ02B1 ACPI device present in firmware,
> causing memory to be needlessly allocated inside fujitsu_init().
> 
> To future-proof the module and lay the groundwork for separating the two
> aforementioned ACPI drivers into separate modules, move away from
> module-wide global data structures by using device-specific data
> instead.

Apologies for the delay in getting this first set of feedback to you.  It's
a combination of the extent of the patch set and a very busy week.

This patch set represents another worthwhile clean up of the fujitsu-laptop
driver.  While I sincerely doubt any laptop vendor will place more than one
FUJ02B1 (or FUJ02E3) in a single machine, removing the dependency on global
variables makes the driver self contained and more consistent.  I have some
points of clarification which I will post as follow ups to the respective
patchs.

Regards
  jonathan
