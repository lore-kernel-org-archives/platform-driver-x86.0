From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [PATCH 0/4] MRST/Medfield thermal updates
Date: Thu, 15 Dec 2011 22:27:44 +0000
Message-ID: <20111215222702.9670.63670.stgit@bob.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from lxorguk.ukuu.org.uk ([81.2.110.251]:60673 "EHLO
	lxorguk.ukuu.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756377Ab1LOWPa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 Dec 2011 17:15:30 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org

Update the thermal driver to use the MSIC MFD layer, and make sure we turn
off the thermistor by default
---

Mika Westerberg (4):
      x86, mrst: add msic_thermal platform support
      platform-x86: intel_mid_thermal: turn off thermistor voltage by default
      platform-x86: intel_mid_thermal: convert to use Intel MSIC API
      platform-x86: intel_mid_thermal: add msic_thermal alias


 arch/x86/platform/mrst/mrst.c            |    6 ++++
 drivers/platform/x86/Kconfig             |    2 +
 drivers/platform/x86/intel_mid_thermal.c |   46 +++++++++++++++---------------
 3 files changed, 30 insertions(+), 24 deletions(-)
