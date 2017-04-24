From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 00/10] fujitsu-laptop: use device-specific data instead of module-wide globals
Date: Mon, 24 Apr 2017 15:33:24 +0200
Message-ID: <20170424133334.7064-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36151 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1171094AbdDXNdj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 09:33:39 -0400
Received: by mail-lf0-f47.google.com with SMTP id c80so73829657lfh.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2017 06:33:38 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

fujitsu-laptop registers two ACPI drivers.  Whenever an ACPI device with
a matching identifier is found by the ACPI bus, a new instance of the
relevant driver is bound to that ACPI device.  However, both ACPI
drivers registered by fujitsu-laptop access module-wide global data
structures, assuming neither ACPI driver will ever be instantiated more
than once.  While there are currently no indications of such issues
happening in the wild, it is theoretically possible for multiple
FUJ02B1/FUJ02E3 ACPI devices to be present in the firmware, which would
cause two instances of the relevant driver to simultaneously access
module-wide globals without any locking in place.  Also, modern Fujitsu
laptops ship without the FUJ02B1 ACPI device present in firmware,
causing memory to be needlessly allocated inside fujitsu_init().

To future-proof the module and lay the groundwork for separating the two
aforementioned ACPI drivers into separate modules, move away from
module-wide global data structures by using device-specific data
instead.

This patch series was tested on a Lifebook S7020 and a Lifebook E744.

I found it challenging to adhere to the "one logical change per patch"
rule while touching code commonly used by almost all other module code.
If the changes introduced are illegible, I will be happy to further
explain and/or improve the series.  Please also note that while the diff
stats for this series may seem daunting at first, using --color-words
should hopefully make reviewing much more manageable.

 drivers/platform/x86/fujitsu-laptop.c | 460 +++++++++++++++++-----------------
 1 file changed, 236 insertions(+), 224 deletions(-)

-- 
2.12.2
