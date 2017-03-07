From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v3 0/4] fujitsu_init() cleanup
Date: Tue,  7 Mar 2017 11:15:12 +0100
Message-ID: <20170307101516.9852-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

These patches should make fujitsu_init() a bit more palatable.  No
changes are made to platform device code yet, for clarity these will be
posted in a separate series after this one gets applied.

Changes from v2:

  - Patch 2/4 from v2 did not work as expected and was thus replaced
    with a rebased version of patch 3/4 from v1.

  - Added a check in patch 3/4 to prevent a NULL dereference when
    ACPI device FUJ02B1 is not present and ACPI device FUJ02E3 is.

Changes from v1:

  - Rebase on top of reworked Alan Jenkins' cleanup patch series.

  - Drop patch 1/4 from v1 as it has already been applied in reworked
    Alan Jenkins' cleanup patch series.

  - Patch 3/4 from v1 has been replaced with a completely different one
    (patch 2/4).  It needs to be tested on a relevant machine as it is
    based purely on a dump of a DSDT table (further details can be found
    in the patch itself).

  - Patch 3/4 in v2 is a rebased version of patch 8/10 from the reworked
    Alan Jenkins' cleanup patch series.  Patch 2/4 from v2 (the one
    mentioned in the previous bullet point) ensures this one can be
    safely applied without causing a NULL dereference under any
    circumstances.

 drivers/platform/x86/fujitsu-laptop.c | 98 ++++++++++++++++++-----------------
 1 file changed, 50 insertions(+), 48 deletions(-)

-- 
2.12.0
