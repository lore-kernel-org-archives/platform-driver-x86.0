From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/2] fujitsu-laptop: Debugging cleanup
Date: Thu, 23 Jun 2016 12:02:46 +0200
Message-ID: <1466676168-4199-1-git-send-email-kernel@kempniu.pl>
References: <20160616234630.GB4764@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36371 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751026AbcFWKDF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 06:03:05 -0400
Received: by mail-wm0-f67.google.com with SMTP id c82so9468345wme.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 03:03:04 -0700 (PDT)
In-Reply-To: <20160616234630.GB4764@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Jonathan,

> > BTW: the debug message is a little misleading, as all of them are prefixed
> > 'FUJ02B1', even if the ACPI event is handled by the FUJ02E3 device.
> 
> Yes, good point.  The use of "FUJ02B1" (via ACPI_FUJITSU_HID) would have
> been for convenience and possibly dates from before FUJ02E3 support was
> included in the driver.  A case can certainly be made for a more generic
> descriptor.

vdbg_printk() was introduced by 20b9373, which is the same commit that
adds FUJ02E3 support, so it has been the way it is now from the start.
This patch series attempts to tidy things up a bit.

 drivers/platform/x86/fujitsu-laptop.c |   12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

-- 
1.7.10.4
