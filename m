From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH v2 0/2] Disable rfkill hardblock if BIOS date > 2016
Date: Mon, 15 Feb 2016 18:23:33 +0800
Message-ID: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

V1: https://lkml.org/lkml/2015/12/15/940

V2 changes:
  * Only affect on ideapad whose BIOS date > 2016 to avoid
    regression on existing ideapads.
  * Show has_hw_rfkill_switch in debugfs

Ike Panhc (2):
  ideapad: No hardware switch after 2016
  ideapad: show has_hw_rfkill_switch in debugfs

 drivers/platform/x86/ideapad-laptop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.9.1
