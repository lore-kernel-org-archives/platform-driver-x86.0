From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>
Subject: [PATCH] pvpanic: handle missing _STA correctly
Date: Fri, 29 May 2015 22:18:52 +0200
Message-ID: <1432930732-16568-1-git-send-email-rkrcmar@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56248 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756391AbbE2U1K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 May 2015 16:27:10 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Igor Mammedov <imammedo@redhat.com>

pvpanic was not properly detected when _STA was missing.

ACPI 6.0 April 2015, 6.3.7 _STA (Status)
  If a device object (including the processor object) does not have an
  _STA object, then OSPM assumes that all of the above bits are set
  (i.e., the device is present, enabled, shown in the UI, and
  functioning).

Not adhering to the specification made pvpanic dormant under QEMU 2.3.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
---
 drivers/platform/x86/pvpanic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/pvpanic.c b/drivers/platform/x86/pvpa=
nic.c
index 073a90a63dbc..7b6860333267 100644
--- a/drivers/platform/x86/pvpanic.c
+++ b/drivers/platform/x86/pvpanic.c
@@ -95,8 +95,7 @@ static int pvpanic_add(struct acpi_device *device)
 	acpi_status status;
 	u64 ret;
=20
-	status =3D acpi_evaluate_integer(device->handle, "_STA", NULL,
-				       &ret);
+	status =3D acpi_bus_get_status_handle(device->handle, &ret);
=20
 	if (ACPI_FAILURE(status) || (ret & 0x0B) !=3D 0x0B)
 		return -ENODEV;
--=20
2.4.2
