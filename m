From: YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next 0/2] Platform: OLPC: Fix two randbuild error
Date: Tue, 28 May 2019 17:28:04 +0800
Message-ID: <20190528092806.20080-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org, lkundrak@v3.sk
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, YueHaibing <yuehaibing@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org

Fix two randbuild error:
1) Fix build error with CONFIG_SPI is not set
2) Fix build error with CONFIG_INPUT is set to m

YueHaibing (2):
  Platform: OLPC: Fix build error without CONFIG_SPI
  Platform: OLPC: Add INPUT dependencies

 drivers/platform/olpc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.7.4
