From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: [PATCH 06/10] CONFIG_HP_ACCEL: Fix help text
Date: Mon, 25 Jul 2011 17:20:19 +0200
Message-ID: <4E2D89B3.2020804@tremplin-utc.net>
References: <4E2D8858.8000900@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E2D8858.8000900@tremplin-utc.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: Malte Starostik <m-starostik@versanet.de>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Adapt the help text for CONFIG_HP_ACCEL to the move of
Documentation/hwmon/lis3lv02d to Documentation/misc-devices/ in
ff606677f6a47c63329cf8e6c7cf978c29f2d736

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfi=
g
index 45e0191..d25f486 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -164,7 +164,7 @@ config HP_ACCEL
=20
 	  Support for a led indicating disk protection will be provided as
 	  hp::hddprotect. For more information on the feature, refer to
-	  Documentation/hwmon/lis3lv02d.
+	  Documentation/misc-devices/lis3lv02d.
=20
 	  To compile this driver as a module, choose M here: the module will
 	  be called hp_accel.
--=20
1.7.6
