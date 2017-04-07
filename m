From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/6] fujitsu-laptop: LED cleanup
Date: Fri,  7 Apr 2017 15:07:07 +0200
Message-ID: <20170407130713.8417-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33543 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755571AbdDGNHS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 09:07:18 -0400
Received: by mail-lf0-f66.google.com with SMTP id r36so6101163lfi.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2017 06:07:17 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This patch series cleans up parts of fujitsu-laptop responsible for
handling LED class devices.  It was tested on a Lifebook E744.  It
depends on the previous patch series I submitted for fujitsu-laptop and
should be applied on top of the backlight cleanup series.

 drivers/platform/x86/Kconfig          |   2 +-
 drivers/platform/x86/fujitsu-laptop.c | 402 +++++++++++++++-------------------
 2 files changed, 176 insertions(+), 228 deletions(-)

-- 
2.12.2
