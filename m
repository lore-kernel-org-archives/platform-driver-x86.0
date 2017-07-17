From: Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH v2 0/3] Constify lustre attribute_group structures.
Date: Mon, 17 Jul 2017 14:46:27 +0530
Message-ID: <1500282990-23929-1-git-send-email-arvind.yadav.cs@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, jwoithe@just42.net, cezary.jackiewicz@gmail.com, corentin.chary@gmail.com, laforge@gnumonks.org, coproscefalo@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

ttribute_groups are not supposed to change at runtime. All functions
working with attribute_groups provided by <linux/sysfs.h> work
with const attribute_group. So mark the non-const structs as const.

Arvind Yadav (3):
  [PATCH v2 1/3] staging: lustre: constify attribute_group structures.
  [PATCH v2 2/3] staging: lustre: ldlm: constify attribute_group structures.
  [PATCH v2 3/3] staging: lustre: obdclass: linux: constify attribute_group structures.

 drivers/staging/lustre/lustre/include/lprocfs_status.h      | 4 ++--
 drivers/staging/lustre/lustre/ldlm/ldlm_lockd.c             | 2 +-
 drivers/staging/lustre/lustre/lmv/lproc_lmv.c               | 2 +-
 drivers/staging/lustre/lustre/lov/lproc_lov.c               | 2 +-
 drivers/staging/lustre/lustre/mdc/lproc_mdc.c               | 2 +-
 drivers/staging/lustre/lustre/obdclass/linux/linux-module.c | 2 +-
 drivers/staging/lustre/lustre/obdclass/linux/linux-sysctl.c | 2 +-
 drivers/staging/lustre/lustre/obdclass/lprocfs_status.c     | 2 +-
 drivers/staging/lustre/lustre/osc/lproc_osc.c               | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

-- 
1.9.1
