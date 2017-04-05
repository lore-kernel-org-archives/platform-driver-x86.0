From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 0/3] fujitsu-laptop: call_fext_func() cleanup
Date: Wed,  5 Apr 2017 08:50:20 +0200
Message-ID: <20170405065023.3267-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This series contains a few cleanups for the call_fext_func() function.
Just as a reminder, please note that v1 of this series is currently
applied in testing.

Changes from v1:

  - Update debug message logged by call_fext_func() to reflect code flow
    changes introduced by patch 2/3.

 drivers/platform/x86/fujitsu-laptop.c | 39 +++++++++++------------------------
 1 file changed, 12 insertions(+), 27 deletions(-)

-- 
2.12.2
