From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v12 07/10] Input: silead - Switch to firmware_request_platform for retreiving the fw
Date: Wed, 15 Jan 2020 17:35:51 +0100
Message-ID: <20200115163554.101315-8-hdegoede@redhat.com>
References: <20200115163554.101315-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <20200115163554.101315-1-hdegoede@redhat.com>
Sender: linux-input-owner@vger.kernel.org
To: Ard Biesheuvel <ardb@kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Peter Jones <pjones@redhat.com>, Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org, platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-input@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Unfortunately sofar we have been unable to get permission to redistribute
Silead touchscreen firmwares in linux-firmware. This means that people
need to find and install the firmware themselves before the touchscreen
will work

Some UEFI/x86 tablets with a Silead touchscreen have a copy of the fw
embedded in their UEFI boot-services code.

This commit makes the silead driver use the new firmware_request_platform
function, which will fallback to looking for such an embedded copy when
direct filesystem lookup fails. This will make the touchscreen work OOTB
on devices where there is a fw copy embedded in the UEFI code.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/touchscreen/silead.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscre=
en/silead.c
index ad8b6a2bfd36..8fa2f3b7cfd8 100644
--- a/drivers/input/touchscreen/silead.c
+++ b/drivers/input/touchscreen/silead.c
@@ -288,7 +288,7 @@ static int silead_ts_load_fw(struct i2c_client *clien=
t)
=20
 	dev_dbg(dev, "Firmware file name: %s", data->fw_name);
=20
-	error =3D request_firmware(&fw, data->fw_name, dev);
+	error =3D firmware_request_platform(&fw, data->fw_name, dev);
 	if (error) {
 		dev_err(dev, "Firmware request error %d\n", error);
 		return error;
--=20
2.24.1
