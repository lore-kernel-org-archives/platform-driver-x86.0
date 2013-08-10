From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/2] Fixes for sony-laptop for 3.11
Date: Sat, 10 Aug 2013 13:11:17 +0900
Message-ID: <1376107879-22608-1-git-send-email-malattia@linux.it>
References: <20130710212017.GA24522@kamineko.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:52442 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750825Ab3HJESF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 10 Aug 2013 00:18:05 -0400
In-Reply-To: <20130710212017.GA24522@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>

Hi Matthew,
trying again. Could you get these in 3.11?

Daniel Serpell (1):
  sony-laptop: Fix reporting of gfx_switch_status

Wei Yongjun (1):
  sony-laptop: return a negative error code in sonypi_compat_init()

 drivers/platform/x86/sony-laptop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.4.rc1
