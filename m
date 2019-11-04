From: Leon Maxx <leonmaxx@gmail.com>
Subject: [RFC PATCH 0/3] asus_wmi: Support of ASUS TUF laptops on Ryzen CPUs
Date: Mon, 4 Nov 2019 12:52:53 +0200
Message-ID: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, andy@infradead.org, dvhart@infradead.org, corentin.chary@gmail.com, drake@endlessm.com, yurii.pavlovskyi@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

Hi,

this patch series adds support of ASUS TUF laptops on Ryzen CPUs to existing
asus_wmi platform driver and also fixes minor bug.

Leonid Maksimchuk (3):
  platform/x86: asus_wmi: Fix return value of fan_boost_mode_store
  platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
  platform/x86: asus_wmi: Set default fan boost mode to normal

 drivers/platform/x86/asus-wmi.c            | 57 +++++++++++++++++++++--------
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 43 insertions(+), 15 deletions(-)
