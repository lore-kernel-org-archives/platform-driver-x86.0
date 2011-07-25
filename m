From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: [PATCH 05/10] hp_accel: Add HP ProBook 655x
Date: Mon, 25 Jul 2011 17:19:47 +0200
Message-ID: <4E2D8993.3070607@tremplin-utc.net>
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

Add axis correction for HP ProBook 6555b.

Signed-off-by: Malte Starostik <m-starostik@versanet.de>
Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 drivers/platform/x86/hp_accel.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_=
accel.c
index 626b162..89c5cb5 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -229,6 +229,7 @@ static struct dmi_system_id lis3lv02d_dmi_ids[] =3D=
 {
 	AXIS_DMI_MATCH("HPB452x", "HP ProBook 452", y_inverted),
 	AXIS_DMI_MATCH("HPB522x", "HP ProBook 522", xy_swap),
 	AXIS_DMI_MATCH("HPB532x", "HP ProBook 532", y_inverted),
+	AXIS_DMI_MATCH("HPB655x", "HP ProBook 655", xy_swap_inverted),
 	AXIS_DMI_MATCH("Mini510x", "HP Mini 510", xy_rotated_left_usd),
 	{ NULL, }
 /* Laptop models without axis info (yet):
--=20
1.7.6
