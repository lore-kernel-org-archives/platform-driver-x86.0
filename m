From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/1] dell-laptop: Only install the i8042 filter when rfkill is active
Date: Tue, 24 Dec 2013 20:34:00 +0100
Message-ID: <1387913641-7498-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:57855 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752360Ab3LXTeI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Dec 2013 14:34:08 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

https://bugzilla.redhat.com/show_bug.cgi?id=1045807 has made me take a closer
look at the dell-laptop.c code-paths on devices which are not on the rfkill
whitelist. Compared to 3.12 there is one change on these devices, the
i8042 filter gets installed independently of the whitelist, and if a
wireless keycode is detected by the filter a dell_send_request(buf, 17, 11)
will be done to query the rfkill settings.

Although unlikely to be the cause of rhbz#1045807, or to cause any problems
(the old rfkill code had the same issue on blacklisted devices), it seems
better to change the code so that there are no functional differences at all
on non white-listed models. This patch does this, can you send it to Linus
for the 3.13 ?

Thanks & Regards,

Hans
