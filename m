From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: [PATCH 0/3]  fix x86 driver memleak
Date: Mon, 20 May 2013 10:30:01 +0800
Message-ID: <51998AA9.6070206@huawei.com>
References: <1368889004-5520-1-git-send-email-libo.chen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368889004-5520-1-git-send-email-libo.chen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jlee@suse.com, matthew.garrett@nebula.com, corentin.chary@gmail.com
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, Li Zefan <lizefan@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org


fix memleak or invalite point acesss about x86 platform drivers

Libo Chen (3):
  x86: msi-laptop: fix memleak
  x86: asus-laptop: fix invalid point access
  x86 platform drivers: fix gpio leak

 drivers/platform/x86/asus-laptop.c     |  1 -
 drivers/platform/x86/intel_pmic_gpio.c |  5 ++++-
 drivers/platform/x86/msi-laptop.c      | 24 ++++++++++--------------
 3 files changed, 14 insertions(+), 16 deletions(-)
-- 
1.8.1.2
