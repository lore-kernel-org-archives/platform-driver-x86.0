From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/2] fujitsu-laptop: acpi_fujitsu_notify() cleanup
Date: Tue, 17 Jan 2017 12:07:33 +0100
Message-ID: <20170117110735.2543-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:33278 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750983AbdAQLPE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Jan 2017 06:15:04 -0500
Received: by mail-lf0-f49.google.com with SMTP id k86so104266630lfi.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Jan 2017 03:14:35 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Here are two minor cleanups for acpi_fujitsu_notify() that I came up
with while preparing the sparse keymap migration.  They can be reviewed
and applied independently of the other series for fujitsu-laptop I
posted recently.

Jonathan, I decided to post this after re-reading the subjects of Alan
Jenkins' cleanup patches - I believe his work should not overlap with
this series.  In case it does, feel free to ignore or postpone this
series.  Also, there is no rush to apply these, they are just a base for
the upcoming sparse keymap patches.

 drivers/platform/x86/fujitsu-laptop.c | 61 ++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 34 deletions(-)

-- 
2.11.0
