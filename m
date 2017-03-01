From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 0/2] fujitsu-laptop: acpi_fujitsu_bl_notify() cleanup
Date: Wed,  1 Mar 2017 07:42:52 +0100
Message-ID: <20170301064254.1311-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34512 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750778AbdCAGoY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2017 01:44:24 -0500
Received: by mail-lf0-f66.google.com with SMTP id y193so1302696lfd.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Feb 2017 22:43:03 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Here are two minor cleanups for acpi_fujitsu_bl_notify() that I came up
with while preparing the sparse keymap migration.

Changes from v1:

  - Rebase on top of reworked Alan Jenkins' cleanup patch series.

  - Join integer variable declarations into a single line in patch 2/2.

 drivers/platform/x86/fujitsu-laptop.c | 64 +++++++++++++++--------------------
 1 file changed, 28 insertions(+), 36 deletions(-)

-- 
2.12.0
