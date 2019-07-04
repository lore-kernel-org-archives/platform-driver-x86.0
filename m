From: Florian Eckert <fe@dev.tdt.de>
Subject: [PATCH 0/3] Update pcengines-apuv2 platform device
Date: Thu,  4 Jul 2019 11:02:02 +0200
Message-ID: <20190704090205.19400-1-fe@dev.tdt.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Florian Eckert <fe@dev.tdt.de>
List-Id: platform-driver-x86.vger.kernel.org

This patchset adds the following changes to this pcengines-apuv2
platform device.

* Add mpcie reset gpio export
* Add legacy leds gpio definitions
* Update gpio buttion definitions

Florian Eckert (3):
  platform/x86/pcengines-apuv2: add mpcie reset gpio export
  platform/x86/pcengines-apuv2: add legacy leds gpio definitions
  platform//x86/pcengines-apuv2: update gpio button definition

 drivers/platform/x86/pcengines-apuv2.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

-- 
2.11.0
