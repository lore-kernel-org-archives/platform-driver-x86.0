From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/4] fujitsu-laptop: acpi_fujitsu_hotkey_notify() cleanup
Date: Wed, 11 Jan 2017 09:59:29 +0100
Message-ID: <20170111085933.2486-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:34289 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936764AbdAKI7m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2017 03:59:42 -0500
Received: by mail-lf0-f67.google.com with SMTP id q89so10814875lfi.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2017 00:59:41 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

I am currently preparing a patch series which makes fujitsu-laptop use a
sparse keymap for hotkey handling.  Before that will happen, though,
acpi_fujitsu_hotkey_notify() could use a revamp because it is pretty
hard to read as it is.  To avoid posting everything at once, here are a
few patches which IMHO make that function easier to read.  Some of these
changes might be a matter of taste, so feel free to NACK them or suggest
a preferred alternative.

 drivers/platform/x86/fujitsu-laptop.c | 174 ++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 82 deletions(-)

-- 
2.11.0
