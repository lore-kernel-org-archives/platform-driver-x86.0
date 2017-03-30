From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 00/11] fujitsu-laptop: backlight cleanup
Date: Thu, 30 Mar 2017 12:34:58 +0200
Message-ID: <20170330103509.32509-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This series introduces further changes to the way LCD backlight is
handled by fujitsu-laptop.  These changes include fixing a bug in code
responsible for generating brightness-related input events, cleaning up
handling of module parameters, reducing code duplication, removing
superfluous debug messages and other fixes.

This series was tested on a Lifebook S7020 and a Lifebook E744.

This series is based on the testing branch as it requires earlier patch
series I submitted in order to apply cleanly.

 drivers/platform/x86/fujitsu-laptop.c | 156 ++++++++++------------------------
 1 file changed, 45 insertions(+), 111 deletions(-)

-- 
2.12.1
