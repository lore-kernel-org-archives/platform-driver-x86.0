From: "=?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?=" <jprvita@gmail.com>
Subject: [PATCH 0/1] asus-wireless: Use the correct HSWC parameter for each HID
Date: Thu, 26 Jan 2017 10:00:30 -0500
Message-ID: <20170126150031.11840-1-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33705 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752480AbdAZPAk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Jan 2017 10:00:40 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux@endlessm.com, =?UTF-8?q?Jo=C3=A3o=20Paulo=20Rechi=20Vita?= <jprvita@endlessm.com>

As stated in the commit message, different machines can use different values to
represent LED ON/OFF, and this commit makes sure we use the correct value pair
for each _HID.

I don't know if there is a better way to store these pairs than in a structure
matching the device_ids[] indexing that would avoid looping through
device_ids[] in asus_wireless_add(). I'm happy to try suggestions to improve
that.

João Paulo Rechi Vita (1):
  asus-wireless: Use the correct HSWC parameter for each HID

 drivers/platform/x86/asus-wireless.c | 46 ++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 13 deletions(-)

-- 
2.11.0
