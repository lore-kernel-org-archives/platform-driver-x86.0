From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
Subject: [BUG] 2.6.36-rc1 compile breakage in toshiba_acpi driver
Date: Tue, 17 Aug 2010 18:57:25 +0900 (JST)
Message-ID: <20100817.185725.260189930.ryusuke@osrg.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from sh.osrg.net ([192.16.179.4]:60649 "EHLO sh.osrg.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751566Ab0HQJ51 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 17 Aug 2010 05:57:27 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Hi,

I got the following error during compiling 2.6.36-rc1.

> ERROR: "led_classdev_register" [drivers/platform/x86/toshiba_acpi.ko] undefined!
> ERROR: "led_classdev_unregister" [drivers/platform/x86/toshiba_acpi.ko] undefined!
> make[1]: *** [__modpost] Error 1
> make: *** [modules] Error 2

Is anyone looking at this issue ?

Thanks,
Ryusuke Konishi
