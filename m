From: Lu Wei <luwei32@huawei.com>
Subject: [PATCH v3 0/2] Fix return value check
Date: Fri, 10 Jul 2020 17:30:16 +0800
Message-ID: <1594373418-24833-1-git-send-email-luwei32@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, acelan.kao@canonical.com, andy.shevchenko@gmail.com, luwei32@huawei.com
List-Id: platform-driver-x86.vger.kernel.org

In the function check_acpi_dev(), if it fails to create
platform device, the return value is ERR_PTR() or NULL.
Thus it must use IS_ERR_OR_NULL to check return value.

---
v2->v3
- Modify format
v3->v4
- Change commit number to 12 characters

Lu Wei (2):
  intel-hid: Fix return value check in check_acpi_dev()
  intel-vbtn: Fix return value check in check_acpi_dev()

 drivers/platform/x86/intel-hid.c  | 2 +-
 drivers/platform/x86/intel-vbtn.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--
2.7.4
