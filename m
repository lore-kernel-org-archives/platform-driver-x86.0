From: Peter Feuerer <peter@piie.net>
Subject: [RESEND PATCH v5 0/5] acerhdf: adding new models, appropriate governor and minor clean up
Date: Fri, 28 Nov 2014 15:20:47 +0100
Message-ID: <1417184452-11884-1-git-send-email-peter@piie.net>
References: <1398561815-22033-1-git-send-email-peter@piie.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1398561815-22033-1-git-send-email-peter@piie.net>
Sender: linux-kernel-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org
Cc: Peter Feuerer <peter@piie.net>
List-Id: platform-driver-x86.vger.kernel.org

Hi Darren,

please apply this series of patches.

It is intended to:

  * Introduce "manual mode" support (Patch 1 & 2), which is needed to control
    the fan of a few new models.

  * Add an appropriate thermal governor (Patch 3).  Manipulating and
    fiddling around with the step-wise governor has been a very fragile thing
    in the past and as it broke again, I used the opportunity to add a two
    point thermal governor which implements the actual fan handling required by
    acerhdf and puts from my point of view things straight.

  * Do some minor clean up like:
      - adding second trip point for critical temperature (Patch 4)
      - removing _t suffix from struct which isn't typedef and replace unsigned
        char by u8 (Patch 5)

Thanks and kind regards,
peter 

Peter Feuerer (5):
  acerhdf: Adding support for "manual mode"
  acerhdf: Adding support for new models
  acerhdf: Use bang-bang thermal governor
  acerhdf: added critical trip point
  acerhdf: minor clean up

 drivers/platform/x86/Kconfig   |   3 +-
 drivers/platform/x86/acerhdf.c | 265 ++++++++++++++++++++++++++---------------
 2 files changed, 172 insertions(+), 96 deletions(-)

-- 
2.1.3
