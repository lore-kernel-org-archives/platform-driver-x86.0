From: Leonid Maksymchuk <leonmaxx@gmail.com>
Subject: [PATCH v2 0/3] asus_wmi: Support of ASUS TUF laptops on Ryzen CPUs
Date: Mon,  4 Nov 2019 23:34:17 +0200
Message-ID: <20191104213417.18036-1-leonmaxx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, chiu@endlessm.com, yurii.pavlovskyi@gmail.com, kristian@klausen.dk, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, Leonid Maksymchuk <leonmaxx@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

this patch series adds support of ASUS TUF laptops on Ryzen CPUs to existing
asus_wmi platform driver and also fixes minor bug.

v2: fixed indentation.

Leonid Maksymchuk (3):
  asus_wmi: Fix return value of fan_boost_mode_store
  asus_wmi: Add support for fan boost mode on FX505DY/FX705DY
  asus_wmi: Set default fan boost mode to normal

 drivers/platform/x86/asus-wmi.c            | 57 ++++++++++++++++++++++--------
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 43 insertions(+), 15 deletions(-)

-- 
1.8.3.1
