From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/5] fujitsu-laptop: platform device code cleanup
Date: Tue, 14 Mar 2017 11:26:26 +0100
Message-ID: <20170314102631.8203-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:33176 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750842AbdCNK0k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Mar 2017 06:26:40 -0400
Received: by mail-lf0-f45.google.com with SMTP id a6so74510353lfa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Mar 2017 03:26:39 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

This series removes backlight-related sysfs attributes from the platform
device registered by fujitsu-laptop and does some other cleanups to
platform device code which hopefully make it easier to understand.

 drivers/platform/x86/fujitsu-laptop.c | 197 ++++++++++------------------------
 1 file changed, 57 insertions(+), 140 deletions(-)

-- 
2.12.0
