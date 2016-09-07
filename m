From: Azael Avalos <coproscefalo@gmail.com>
Subject: [PATCH 0/2] toshiba_haps: Small updates to driver code
Date: Wed,  7 Sep 2016 09:28:12 -0600
Message-ID: <20160907152815.5950-1-coproscefalo@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f44.google.com ([209.85.218.44]:36012 "EHLO
        mail-oi0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932610AbcIGP2V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2016 11:28:21 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Azael Avalos <coproscefalo@gmail.com>

These two patches make some small changes to the driver code, the first
splits the error check fro the ACPI status and the HDD protection, and
the second simply changes the printing level of two strings from info
to debug.

Azael Avalos (2):
  toshiba_haps: Split ACPI status error check from HDD protection
    support
  toshiba_haps: Change the error logging level from info to debug

 drivers/platform/x86/toshiba_haps.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.9.3
