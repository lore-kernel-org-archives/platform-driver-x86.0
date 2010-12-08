From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: Tree for December 8
 (drivers/platform/x86/Kconfig:422:error: recursive dependency detected!)
Date: Wed, 08 Dec 2010 09:53:09 +0000
Message-ID: <1291801990.5992.105.camel@i7.infradead.org>
References: <AANLkTim3FJjVpbjM10kJJhXbONpvGSGQFE+mfGX9pAS6@mail.gmail.com>
	 <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:48743 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754405Ab0LHJxe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 8 Dec 2010 04:53:34 -0500
In-Reply-To: <AANLkTimjVY-6OwRfFUzUbmyacM81M35wf5qDWqAouUYb@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: sedat.dilek@gmail.com, Matthew Garrett <mjg@redhat.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>

On Wed, 2010-12-08 at 10:12 +0100, Corentin Chary wrote:
> 
> I don't really see how it's a recursive dependency, but maybe it's
> time to clean this KConfig.
> What is our current policy about that ?
> 
> I think we should *depends* on important subsystem (ACPI, INPUT, ...)
> and select obscure things so
> that the driver does not get lost if you don't enable the leds.

A better policy is: "NEVER USE SELECT".

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
