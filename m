From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v2 1/3] dell-laptop: Clear buffer before each SMBIOS call
Date: Mon,  6 Jul 2015 12:08:55 +0200
Message-ID: <1436177337-13654-1-git-send-email-pali.rohar@gmail.com>
References: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1435774101-12329-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Make sure that before initializing SMBIOS call input buffer does not
contain any garbage (e.g. values from previous SMBIOS call). This fix
problem with passing undefined/random parameters to SMBIOS functions.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 drivers/platform/x86/dell-laptop.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index 35758cb..2caefb2 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -310,10 +310,15 @@ static DEFINE_MUTEX(buffer_mutex);
=20
 static int hwswitch_state;
=20
+static void clear_buffer(void)
+{
+	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+}
+
 static void get_buffer(void)
 {
 	mutex_lock(&buffer_mutex);
-	memset(buffer, 0, sizeof(struct calling_interface_buffer));
+	clear_buffer();
 }
=20
 static void release_buffer(void)
@@ -557,6 +562,8 @@ static int dell_rfkill_set(void *data, bool blocked=
)
 	    !(buffer->output[1] & BIT(16)))
 		disable =3D 1;
=20
+	clear_buffer();
+
 	buffer->input[0] =3D (1 | (radio<<8) | (disable << 16));
 	dell_send_request(buffer, 17, 11);
=20
@@ -571,6 +578,7 @@ static void dell_rfkill_update_sw_state(struct rfki=
ll *rfkill, int radio,
 	if (status & BIT(0)) {
 		/* Has hw-switch, sync sw_state to BIOS */
 		int block =3D rfkill_blocked(rfkill);
+		clear_buffer();
 		buffer->input[0] =3D (1 | (radio << 8) | (block << 16));
 		dell_send_request(buffer, 17, 11);
 	} else {
@@ -773,6 +781,7 @@ static int __init dell_setup_rfkill(void)
 	get_buffer();
 	dell_send_request(buffer, 17, 11);
 	status =3D buffer->output[1];
+	clear_buffer();
 	buffer->input[0] =3D 0x2;
 	dell_send_request(buffer, 17, 11);
 	hwswitch_state =3D buffer->output[1];
--=20
1.7.9.5
