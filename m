From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: [PATCH 04/10] lis3: add support for HP EliteBook 8540w
Date: Mon, 25 Jul 2011 17:19:01 +0200
Message-ID: <4E2D8965.7000905@tremplin-utc.net>
References: <4E2D8858.8000900@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E2D8858.8000900@tremplin-utc.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Lyall Pearce <lyall.pearce@hp.com>
List-Id: platform-driver-x86.vger.kernel.org

Add axis correction for HP EliteBook 8540w.

Reported-by: Lyall Pearce <lyall.pearce@hp.com>
Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 drivers/platform/x86/hp_accel.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_=
accel.c
index 76b24e6..626b162 100644
--- a/drivers/platform/x86/hp_accel.c
+++ b/drivers/platform/x86/hp_accel.c
@@ -209,6 +209,7 @@ static struct dmi_system_id lis3lv02d_dmi_ids[] =3D=
 {
 	AXIS_DMI_MATCH("NC6715x", "HP Compaq 6715", y_inverted),
 	AXIS_DMI_MATCH("NC693xx", "HP EliteBook 693", xy_rotated_right),
 	AXIS_DMI_MATCH("NC693xx", "HP EliteBook 853", xy_swap),
+	AXIS_DMI_MATCH("NC854xx", "HP EliteBook 854", y_inverted),
 	AXIS_DMI_MATCH("NC273xx", "HP EliteBook 273", y_inverted),
 	/* Intel-based HP Pavilion dv5 */
 	AXIS_DMI_MATCH2("HPDV5_I",
--=20
1.7.6
