From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/4] sony-laptop for 3.8
Date: Fri, 21 Dec 2012 07:21:07 +0900
Message-ID: <1356042071-8903-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:37700 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751618Ab2LTW2E (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 20 Dec 2012 17:28:04 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Hi Matthew,

here's a few patches I would like to include in 3.8. First two are
resubmissions of bug fixes sent previously (please use this version), the
others add some functionality for recent vaios.

Mattia Dongili (4):
  sony-laptop: fully enable SNY controlled modems
  sony-laptop: fix SNC buffer calls when SN06 returns Integers
  sony-laptop: allow reading the status of gfx switch
  sony-laptop: support basic functions for handle 0x14B and 0x14C

 drivers/platform/x86/sony-laptop.c |  158 ++++++++++++++++++++++++++++++++----
 1 file changed, 141 insertions(+), 17 deletions(-)

-- 
1.7.10.4
