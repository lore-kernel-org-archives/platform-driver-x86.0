From: Corentin Chary <corentincj@iksaif.net>
Subject: [PATCH 00/10] eeepc-wmi: updates for 2.6.38
Date: Mon, 29 Nov 2010 08:14:04 +0100
Message-ID: <1291014854-17961-1-git-send-email-corentincj@iksaif.net>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from slow3-v.mail.gandi.net ([217.70.178.89]:58864 "EHLO
	slow3-v.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754873Ab0K2HPC (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Nov 2010 02:15:02 -0500
Received: from relay4-v.mail.gandi.net (relay4-v.mail.gandi.net [217.70.178.78])
	by slow3-v.mail.gandi.net (Postfix) with ESMTP id B13CD862AD
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Nov 2010 08:15:01 +0100 (CET)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, "David S. Miller" <davem@davemloft.net>, Yong Wang <yong.y.wang@intel.com>, Corentin Chary <corentincj@iksaif.net>

Hi,

I finally got a WMI aware Eeepc on my desk, so I made a quick
series to add missing features to eeepc-wmi. Theses patchs were done
and tested on an Eeepc 1005PE with an updated BIOS.

Thanks,

Corentin Chary (10):
  eeepc-wmi: rework eeepc_wmi_init and eeepc_wmi_exit
  eeepc-wmi: add touchpad led support
  eeepc-wmi: add rfkill support for wlan, bluetooth and 3g
  eeepc-wmi: use attribute group to manage attributes
  eeepc-wmi: add debugfs entries
  eeepc-wmi: fix confusion between ctrl_param and retval
  eeepc-wmi: claim eeepc-wmi maintainership
  eeepc-wmi: remove unneeded static
  eeepc-laptop: add a getter for touchpad led
  eeepc-wmi: never load if legacy device is enabled

 MAINTAINERS                         |    8 +
 drivers/platform/x86/Kconfig        |    3 +
 drivers/platform/x86/eeepc-laptop.c |   11 +
 drivers/platform/x86/eeepc-wmi.c    |  609 ++++++++++++++++++++++++++++++----
 4 files changed, 559 insertions(+), 72 deletions(-)

-- 
1.7.3.2
