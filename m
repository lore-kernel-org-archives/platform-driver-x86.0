From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/2] sony-laptop fixes for 3.10
Date: Wed, 29 May 2013 06:55:31 +0900
Message-ID: <1369778133-24015-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:46673 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758049Ab3E1WCi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 May 2013 18:02:38 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Hi Matthew,
a couple of small fixes for sony-laptop, one for a bug in reporting the
gfx_switch status, the other is a minor fix for returning meaningful values on
error path in sonypi_compat_init.

Daniel Serpell (1):
  Fix reporting of sony-laptop gfx_switch_status.

Wei Yongjun (1):
  Fix to return a negative error code in the sonypi_compat_init()

 drivers/platform/x86/sony-laptop.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.10.4
