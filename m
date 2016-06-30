From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: UP Board and similar
Date: Thu, 30 Jun 2016 23:36:04 +0300
Message-ID: <CAHp75VcOMFygekkhCEtWigW+JaKOgNQrM9M-3MtKemBF3arBOQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:36661 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751840AbcF3Vbm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Jun 2016 17:31:42 -0400
Received: by mail-oi0-f50.google.com with SMTP id f189so84703174oig.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jun 2016 14:30:43 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: "Darren Hart (Google+)" <reply-101378268367730737515@profiles.google.com>, Dan O'Donovan <dan@emutex.com>, Mika Westerberg <mika.westerberg@linux.intel.com>

Hi!

Thank you for the series and sorry to answer as a new mail, just
subscribed to the list and didn't manage to retrieve archives (seems
VGER doesn't have them).

So, regarding to enabling UP Board and similar open connected  boards
(Galileo, Edison/Arduino, etc.).

The mentioned boards are x86. There is currently no way to handle
pinctrl on them since they are ACPI-based. Moreover pinctrl doesn't
have a way to configure stuff for customer needs!

What is my vision on the issue. Currently we have pending ACPI patches
from Octavian that help us to load ACPI DSDT overlays in a way as it
works for DT. This will make possible to create a blob to configure
pins. Thus, part of the patch series which hard codes the mappings is
not needed. And therefore your drivers should go somewhere under
drivers/pinctrl/intel folder which Mika (mostly) and I are supporting.

We still need to agree on the above: which folder and how those
drivers should look like.

P.S. Dan, next time please include me and Mika into Cc list for such
things. Thanks!

-- 
With Best Regards,
Andy Shevchenko
