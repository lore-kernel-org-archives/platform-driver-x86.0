From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 0/3 v2] ideapad: add backlight driver and changes of sysfs nodes
Date: Wed, 22 Jun 2011 16:03:01 +0800
Message-ID: <1308729781-2590-1-git-send-email-ike.pan@canonical.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:46154 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344Ab1FVIDJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 04:03:09 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>

Changes since last post
 * Using generic blacklight class.
 * Drop touchpad sysfs node. I will send patch again after knowing which
   PM infrastructure for input device.
 * More information for cfg bits in documents
 * Let sysfs node invisible if no camera.

These patches are also available in the git repository at:

  git://kernel.ubuntu.com/ikepanhc/ideapad-laptop.git ideapad-laptop

Ike Panhc (3):
  ideapad: define cfg bits and create sysfs node for cfg
  ideapad: let camera_power node invisiable if no camera
  ideapad: add backlight driver

 .../ABI/testing/sysfs-platform-ideapad-laptop      |   17 ++
 drivers/platform/x86/ideapad-laptop.c              |  198 +++++++++++++++++---
 2 files changed, 189 insertions(+), 26 deletions(-)

-- 
1.7.4.1
