From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 00/11] fujitsu-laptop: backlight cleanup
Date: Wed,  5 Apr 2017 08:48:59 +0200
Message-ID: <20170405064910.3162-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:34866 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753477AbdDEGtP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Apr 2017 02:49:15 -0400
Received: by mail-lf0-f54.google.com with SMTP id j90so2109706lfk.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Apr 2017 23:49:14 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This series introduces further changes to the way LCD backlight is
handled by fujitsu-laptop.  These changes include fixing a bug in code
responsible for generating brightness-related input events, cleaning up
handling of module parameters, reducing code duplication, removing
superfluous debug messages and other fixes.

This series was tested on a Lifebook S7020 and a Lifebook E744.

This series is based on the testing branch as it requires earlier patch
series I submitted in order to apply cleanly.

Changes from v1:

  - Update debug message logged by set_lcd_level() to reflect code flow
    changes introduced by patch 04/11.

 drivers/platform/x86/fujitsu-laptop.c | 157 ++++++++++------------------------
 1 file changed, 46 insertions(+), 111 deletions(-)

-- 
2.12.2
