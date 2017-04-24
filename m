From: Jean Delvare <jdelvare@suse.de>
Subject: intel_turbo_max_3 non-modularity
Date: Mon, 24 Apr 2017 11:31:03 +0200
Message-ID: <20170424113103.0de3ea31@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42533 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1167999AbdDXJbM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2017 05:31:12 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Hi all,

I see that the intel_turbo_max_3 driver was originally supposed to be
modular, and then support for that possibility was removed. Is there
any fundamental reason why this driver can't be built as a module?

I am asking because the description of the driver says:

"This driver is only required when the system is not using Hardware
P-States (HWP). In HWP mode, priority can be read from ACPI tables."

This pretty much implies that this driver will be useless on a wide
range (maybe even the majority?) of systems. Given this, not being
forced to build the driver into the kernel would seem preferable.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
