From: Bhumika Goyal <bhumirks@gmail.com>
Subject: [PATCH 0/2] platform/x86: add const to thermal_cooling_device_ops structures
Date: Wed, 21 Jun 2017 12:34:15 +0530
Message-ID: <1498028657-12059-1-git-send-email-bhumirks@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34239 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751742AbdFUHGX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jun 2017 03:06:23 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: julia.lawall@lip6.fr, peter@piie.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, sujith.thomas@intel.com
Cc: Bhumika Goyal <bhumirks@gmail.com>

Declare thermal_cooling_device_ops structures as const.

Bhumika Goyal (2):
  acerhdf: add const to thermal_cooling_device_ops structure
  intel_menlow: add const to thermal_cooling_device_ops structure

 drivers/platform/x86/acerhdf.c      | 2 +-
 drivers/platform/x86/intel_menlow.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4
