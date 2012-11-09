From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/2 resend] sony-laptop fixes for 3.7
Date: Sat, 10 Nov 2012 07:55:59 +0900
Message-ID: <1352501761-7299-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:53239 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756062Ab2KIW4F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 9 Nov 2012 17:56:05 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Hi Matthew,

Can you pick up these to patches? the second one is a regression introduced in
3.5, cc-ing stable to that.

Mattia Dongili (2):
  sony-laptop: fully enable SNY controlled modems
  sony-laptop: fix SNC buffer calls when SN06 returns Integers

 drivers/platform/x86/sony-laptop.c |   22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
1.7.10.4
