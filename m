From: Mario Limonciello <mario_limonciello@dell.com>
Subject: [PATCH 0/1] Fix memory errors found by intel buildbot
Date: Fri,  4 Apr 2014 14:40:19 -0500
Message-ID: <1396640420-9777-1-git-send-email-mario_limonciello@dell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ausc60pc101.us.dell.com ([143.166.85.206]:53036 "EHLO
	ausc60pc101.us.dell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754124AbaDDTlH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 4 Apr 2014 15:41:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario_limonciello@dell.com>

Intel build bot caught a few errors with alienware_wmi not testing for
bad results when allocated memory.  Here's the fixes for them.

Mario Limonciello (1):
  alienware-wmi: cover some scenarios where memory allocations would
    fail

 drivers/platform/x86/alienware-wmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

-- 
1.9.1
