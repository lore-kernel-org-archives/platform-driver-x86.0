From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/8] fujitsu-laptop: use sparse keymaps for input event handling
Date: Mon, 20 Mar 2017 10:32:16 +0100
Message-ID: <20170320093224.18541-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This series simplifies handling of both brightness key and hotkey input
events on Fujitsu laptops by making use of sparse keymaps.  This not
only makes the driver shorter and, hopefully, cleaner, but also enables
us to get rid of the keycodeX fields inside struct fujitsu_bl, which
facilitates further cleanups.  Also, to simplify error handling, input
devices registered by fujitsu-laptop are migrated to the devres API
along the way.

This series was tested on a Lifebook S7020 and a Lifebook E744.

This series depends on the platform cleanup series I posted last week.
While that series has not yet been merged into testing, Jonathan has
reviewed it and Darren also seemed to be okay with it, so I just assumed
it will get merged soon.  I wanted to post this one as soon as possible
as it requires a bit more thorough review and testing compared to the
previous series I posted for fujitsu-laptop.

 drivers/platform/x86/Kconfig          |   1 +
 drivers/platform/x86/fujitsu-laptop.c | 355 +++++++++++++++-------------------
 2 files changed, 154 insertions(+), 202 deletions(-)

-- 
2.12.0
