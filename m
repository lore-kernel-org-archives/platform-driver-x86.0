From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [PATCH v5 0/2] platform/x86 asus_wmi: Support of ASUS TUF laptops on Ryzen CPUs
Date: Sun, 24 Nov 2019 16:06:25 +0200
Message-ID: <20191124140625.20736-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Leonid Maksymchuk <leonmaxx@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

this patch series adds support of Throttle themal policy ACPI device to
existing asus_wmi platform driver. Support of this device is required
for ASUS TUF laptops on Ryzen CPUs to properly work on Linux.

v2: fixed indentation.
v3: patches 2/3 and 3/3 are refactored.
v4: patch 2/3 are simplified.
v5: add new device instead of merging with fan boost mode

Leonid Maksymchuk (2):
  platform/x86 asus_wmi: Support throttle thermal policy
  platform/x86 asus_wmi: Set throttle thermal policy to default

 drivers/platform/x86/asus-wmi.c            | 128 +++++++++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 129 insertions(+)

-- 
1.8.3.1
