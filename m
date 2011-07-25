From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: [PATCH 02/10] lis3: update maintainer information
Date: Mon, 25 Jul 2011 17:17:25 +0200
Message-ID: <4E2D8905.2040405@tremplin-utc.net>
References: <4E2D8858.8000900@tremplin-utc.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4E2D8858.8000900@tremplin-utc.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

In the move of the lis3 driver, the hp_accel.c file got dropped from th=
e
MAINTAINER file. Make it explicit again that this file is tied to lis3
again.

Signed-off-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>
---
 MAINTAINERS |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 187282d..00f7325 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3937,6 +3937,7 @@ M:	Eric Piel <eric.piel@tremplin-utc.net>
 S:	Maintained
 F:	Documentation/misc-devices/lis3lv02d
 F:	drivers/misc/lis3lv02d/
+F:	drivers/platform/x86/hp_accel.c
=20
 LLC (802.2)
 M:	Arnaldo Carvalho de Melo <acme@ghostprotocols.net>
--=20
1.7.6
