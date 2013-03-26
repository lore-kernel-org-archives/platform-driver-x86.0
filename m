From: Danny Baumann <dannybaumann@web.de>
Subject: [PATCH 0/1] dell-wmi: Add support for keys present on Inspiron 15R SE.
Date: Tue, 26 Mar 2013 12:36:33 +0100
Message-ID: <1364297794-3931-1-git-send-email-dannybaumann@web.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Danny Baumann <dannybaumann@web.de>
List-Id: platform-driver-x86.vger.kernel.org

This patch adds support for some keys of the newer Inspiron models not
yet supported (the two buttons in the upper right corner in [1]). I'm not
yet entirely sure what the best way to handle the audio one (in the middle)
is (whether it's best to handle the key-down or the key-up event, and what
scancode to use), I would appreciate input on that.

Regards,

Danny

[1] http://www.tomshw.it/files/2012/08/collezioni/1752/32067_b.jpg

Danny Baumann (1):
  dell-wmi: Add support for keys present on Inspiron 15R SE.

 drivers/platform/x86/dell-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
1.8.1.4
