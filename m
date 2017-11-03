From: Hans de Goede <hdegoede@redhat.com>
Subject: Status of merging "[PATCH resend v5 3/3] platform/x86:
 intel_cht_int33fe: Update fusb302 type string, add properties"
Date: Fri, 3 Nov 2017 12:06:58 +0100
Message-ID: <512ff43f-323f-5820-1cb4-6a1a6e0c632f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:36704 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752719AbdKCLHB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2017 07:07:01 -0400
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, platform-driver-x86@vger.kernel.org

Hi Darren, Andy,

What is the status of merging:
https://patchwork.ozlabs.org/patch/824314/

?

Now that Wolfram has created an immutable-branch for the 2
i2c commits this depends on for you to merge, this is
ready for merging. And since one of those 2 i2c commits
change the device-properties attached to the bq24190
charger when instantiating it, the driver for the charger
will now look at the fusb302 provided max-current instead
of at the old usb2-only extcon stuff. So without also
merging this patch, we end up regressing from charging
at 5v 2A to slowly-discharging (when on) at 5V 0.5A,
so we really need this in 4.15.

Regards,

Hans
