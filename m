From: Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 0/1] apple-gmux: Assign apple_gmux_data before registering
Date: Mon, 16 Nov 2015 21:38:40 +0100
Message-ID: <cover.1447097319.git.lukas__31862.8880115741$1447706996$gmane$org@wunner.de>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mailout2.hostsharing.net ([83.223.90.233]:55157 "EHLO
	mailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752146AbbKPUtn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 16 Nov 2015 15:49:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org

Hi Darren,

as requested, here's a resend of this patch with cc: platform-driver-x86.

The patch is a useful fix for apple-gmux by Matthew Garrett. It is well
over a year old but unfortunately never got merged.

The commit message makes it sound as if the fix is only needed for
reprobing (in case apple-gmux registers after the DRM drivers).
I'm not yet sure if we'll use reprobing or deferred initialization,
however the patch is needed even if we go with deferred initialization
as it fixes a race condition that is triggered by invoking a handler
callback between the call to vga_switcheroo_register_handler() and the
assignment of apple_gmux_data. I've amended the commit message to make
that clearer.

The patch has seen extensive testing and is actively used by myself
and others on various MacBook Pro models.

Could you take a look at the patch and (barring any objections) ack it?

Thanks,

Lukas


Matthew Garrett (1):
  apple-gmux: Assign apple_gmux_data before registering

 drivers/platform/x86/apple-gmux.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
1.8.5.2 (Apple Git-48)
