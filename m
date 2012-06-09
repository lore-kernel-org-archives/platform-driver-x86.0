From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/7] sony-laptop fixes on 3.5-rc1
Date: Sat,  9 Jun 2012 13:18:07 +0900
Message-ID: <1339215494-4020-1-git-send-email-malattia@linux.it>
References: <20120531220257.GA3986@kamineko.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from ac250205.ppp.asahi-net.or.jp ([183.77.250.205]:33914 "EHLO
	smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813Ab2FIESg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Jun 2012 00:18:36 -0400
In-Reply-To: <20120531220257.GA3986@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

here's a few fixes on top of the patches you took for 3.5.
I may have more coming but I'm a bit short of time these days so I'm sending
these first.

--- 
Dan Carpenter (2):
      sony-laptop: fix sony_nc_sysfs_store()
      sony-laptop: fix a couple signedness bugs

Marco Chiappero (1):
      sony-laptop: notify userspace of GFX switch position changes

Mattia Dongili (4):
      sony-laptop: use an enum for SNC event types
      sony-laptop: store battery care limits on batteries
      sony-laptop: add lid backlight support for handle 0x143
      sony-laptop: input initialization should be done before SNC
--- 
 drivers/platform/x86/sony-laptop.c |  132 ++++++++++++++++++++++++------------
 1 file changed, 87 insertions(+), 45 deletions(-)
-- 
Mattia
