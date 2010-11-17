From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 0/3] ideapad: hotkey enablement
Date: Wed, 17 Nov 2010 14:59:25 +0800
Message-ID: <1289977165-14802-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:55575 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756765Ab0KQG7c (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Nov 2010 01:59:32 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, David Woodhouse <dwmw2@infradead.org>

Here are the enablement patches for hotkey events on ideapads and these patches
are made against current checkout of mainline kernel.

These patches are available in the git repository at:
  git://kernel.ubuntu.com/ikepanhc/ideapad-laptop.git ideapad-laptop

Ike Panhc (3):
  ideapad: add platform driver for ideapad
  ideapad: let camera power control entry under platform driver
  ideapad: add hotkey support

 drivers/platform/x86/ideapad-laptop.c |  174 ++++++++++++++++++++++++++-------
 1 files changed, 140 insertions(+), 34 deletions(-)
