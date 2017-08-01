From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH 0/3] Three WMI improvements
Date: Tue,  1 Aug 2017 08:37:25 -0700
Message-ID: <cover.1501601667.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:37954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751368AbdHAPhb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 11:37:31 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Andy Lutomirski <luto@kernel.org>

These are in decreasing order of appropriateness for 4.13.

Patch 1 is a straight-up bugfix.

Patch 2 is a further busification conversion inspired by patch 1.

Patch 3 implements a feature request from Pali.

Andy Lutomirski (3):
  platform/dell-wmi: Fix driver interface version query
  platform/dell-wmi: Update dell_wmi_check_descriptor_buffer() to new
    model
  platform/wmi: Expose the raw WDG data in sysfs

 drivers/platform/x86/dell-wmi.c | 75 +++++++++++++++++++++++------------------
 drivers/platform/x86/wmi.c      | 63 ++++++++++++++++++++++++++++++++--
 2 files changed, 104 insertions(+), 34 deletions(-)

-- 
2.13.3
