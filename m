From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 0/7] fujitsu-laptop: Consistent naming of constants
Date: Tue, 27 Feb 2018 22:15:32 +0100
Message-ID: <20180227211539.5708-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

This patch series is an attempt to organize all the named constants used
throughout fujitsu-laptop so that their names more clearly convey their
purpose: a set of prefixes is introduced to "map" constant names to
call_fext_func() parameters.

The chosen constant naming patterns are a compromise between readability
and enabling longer conditional expressions to fit into the 80-character
line length limit.  Some changes (like those in patches 4/7 and 5/7) may
be perceived as bikeshedding, so please just think of them as proposals,
not fixes.

Finally, patch 7/7 again [1] proposes a set of helper functions which
seem to be making quite a difference in terms of code readability in
certain places (especially in long conditional expressions).  YMMV,
though, feel free to disagree.

This patch series should be applied on top of for-next as it builds on
the previous patch series I submitted.

[1] https://www.spinics.net/lists/platform-driver-x86/msg11633.html

 drivers/platform/x86/fujitsu-laptop.c | 228 +++++++++++++++++++---------------
 1 file changed, 127 insertions(+), 101 deletions(-)

-- 
2.16.2
