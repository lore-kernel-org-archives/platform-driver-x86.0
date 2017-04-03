From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Mon,  3 Apr 2017 11:38:56 +0200
Message-ID: <20170403093859.6685-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This series contains a few cleanups for the call_fext_func() function.
It does not depend on the previous series I submitted for
fujitsu-laptop, which is why I am sending it in parallel with the
backlight cleanup series.

While patches 1 and 2 are tangible improvements, I will understand if
you deem patch 3 to be unnecessary churn.  I decided to submit it anyway
as I think it might bring some benefit to a casual reader of the
module's code, but it is basically just a suggestion and as it is the
last patch, it can simply be omitted when the series is applied.

 drivers/platform/x86/fujitsu-laptop.c | 39 +++++++++++------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

-- 
2.12.1
