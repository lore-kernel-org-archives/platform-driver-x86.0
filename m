From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/4] Improve intel-hid's self-consistency
Date: Fri, 24 Feb 2017 11:33:05 +0100
Message-ID: <20170224103309.19463-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Commit 2cfa4b311acc ("platform/x86: intel-hid: Support 5 button array")
contains some coding style cleanups compared to the code it was based
on.  This patch series "backports" these cleanups to the rest of the
driver in order to make it more self-consistent and removes a redundant
set_bit() call as a bonus.

This series was not tested on hardware supported by intel-hid.

 drivers/platform/x86/intel-hid.c | 48 ++++++++++------------------------------
 1 file changed, 12 insertions(+), 36 deletions(-)

-- 
2.11.1
