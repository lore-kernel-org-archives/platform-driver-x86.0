From: Guillaume =?utf-8?Q?Dou=C3=A9zan-Grard?= <gdouezangrard@gmail.com>
Subject: [PATCH 0/4] Topstar ACPI LED Workaround
Date: Tue, 17 Oct 2017 18:17:26 +0200
Message-ID: <cover.1508255487.git.gdouezangrard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:55902 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934114AbdJQQRg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 12:17:36 -0400
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Darren,

On Topstar U931 Notebooks, an issue prevents the WLAN toggle key from
being properly managed by the Embedded Controller and successfully
disconnect the adapter. A specific ACPI method allows to toggle the WLAN
LED state regardless.

These are barebone laptops, sold under quite a lot of brands and
configurations, with different firmwares and so on. I can only say for sure
that this issue is present for all the models sold under a specific brand,
that's why I'm reluctant to enable this by default with a DMI check.

Thus, the new `led_workaround` option registers this LED with the
corresponding subsystem, making possible to use a software-based trigger
(rfkill for instance to synchronize the LED with the softkill state).

Thank you for your time,
