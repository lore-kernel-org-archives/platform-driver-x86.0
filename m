From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 2/2] dell-wmi: Process only one event on devices with interface version 0
Date: Mon,  4 Jan 2016 22:26:36 +0100
Message-ID: <1451942796-26574-3-git-send-email-pali.rohar@gmail.com>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

BIOS/ACPI on devices with WMI interface version 0 does not clear buffer
before filling it. So next time when BIOS/ACPI send WMI event which is
smaller as previous then it contains garbage in buffer from previous ev=
ent.

BIOS/ACPI on devices with WMI interface version 1 clears buffer and
sometimes send more events in buffer at one call.

Since commit 83fc44c32ad8 ("dell-wmi: Update code for processing WMI
events") dell-wmi process all events in buffer (and not just first).

So to prevent reading garbage from buffer we will process only first on=
e
event on devices with WMI interface version 0.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-wmi.c |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/del=
l-wmi.c
index 1ad7a7b..5db9efb 100644
--- a/drivers/platform/x86/dell-wmi.c
+++ b/drivers/platform/x86/dell-wmi.c
@@ -237,6 +237,22 @@ static void dell_wmi_notify(u32 value, void *conte=
xt)
=20
 	buffer_end =3D buffer_entry + buffer_size;
=20
+	/*
+	 * BIOS/ACPI on devices with WMI interface version 0 does not clear
+	 * buffer before filling it. So next time when BIOS/ACPI send WMI eve=
nt
+	 * which is smaller as previous then it contains garbage in buffer fr=
om
+	 * previous event.
+	 *
+	 * BIOS/ACPI on devices with WMI interface version 1 clears buffer an=
d
+	 * sometimes send more events in buffer at one call.
+	 *
+	 * So to prevent reading garbage from buffer we will process only fir=
st
+	 * one event on devices with WMI interface version 0.
+	 */
+	if (dell_wmi_interface_version =3D=3D 0 && buffer_entry < buffer_end)
+		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
+			buffer_end =3D buffer_entry + buffer_entry[0] + 1;
+
 	while (buffer_entry < buffer_end) {
=20
 		len =3D buffer_entry[0];
--=20
1.7.9.5
