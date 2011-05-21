From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 0/4] acer-wmi: two Bugs fixed and set device state by access new wmi method
Date: Sun, 22 May 2011 07:33:50 +0800
Message-ID: <1306020834-5186-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40865 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757333Ab1EUXfQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 21 May 2011 19:35:16 -0400
Received: by pzk9 with SMTP id 9so2153807pzk.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 May 2011 16:35:15 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>

Here have 4 patches, from first to third patches fixed bko#32862, bko#34142,
the 3 patches will check negative number before set initial devices state, make 
sure 3G device exist before generate 3G rfkill and allow 64-bits return buffer
from 2 old wmi methods.

And, the fourth patch improve to set communication device state by evaluate new
WMID_GUID3 method, it's good to avoid potential problem if we still use old wmi
method on new Acer machines.

Changed after last posted:
 + Add negative number check in commandline_init() before set initial state. bko#32862
 + Add check 3G device exist flag in WMID_set_capabilities(). bko#32862
 + Allow u64 result buffer in WMI_execute_u32(). bko#34142
 + Add wmid3_set_device_status() then access it in set_block.

Next step for acer-wmi:
 + Dig more old wmi event in DSDT, try to remove devices state polling on more machines.
	+ Already found some old wmi event, can be used by sync devices state.
 + Clear up acer-wmi driver base on different wmi interface on different time frame.


Lee, Chun-Yi (4):
  acer-wmi: does not allow negative number set to initial device state
  acer-wmi: check the existence of internal 3G device when set
    capability
  acer-wmi: allow 64-bits return buffer from WMI methods
  acer-wmi: support to set communication device state by new wmid
    method

 drivers/platform/x86/acer-wmi.c |  131 ++++++++++++++++++++++++++++++++++++---
 1 files changed, 123 insertions(+), 8 deletions(-)
