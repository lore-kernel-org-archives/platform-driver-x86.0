From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH v2 5/8] platform/x86: fujitsu-laptop: track the last instantiated FUJ02E3 ACPI device
Date: Fri, 19 May 2017 09:44:45 +0200
Message-ID: <20170519074448.12716-6-kernel@kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170519074448.12716-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

fujitsu-laptop registers two ACPI drivers: one for ACPI device FUJ02B1
enabling backlight control and another for ACPI device FUJ02E3 which
handles various other stuff (hotkeys, LEDs, etc.)  In a perfect world,
private data used by each of these drivers would be neatly encapsulated
in a structure specific to a given driver instance.  Sadly, firmware
present on some Fujitsu laptops makes that impossible by exposing
backlight power control (which is what the FUJ02B1 ACPI device should
take care of) through the FUJ02E3 ACPI device.  This means the backlight
driver needs a way to access an ACPI device it is not bound to.  When
the backlight driver is extracted into a separate module, it will not be
able to rely on a module-wide variable any more and such access will
happen through an API exposed by fujitsu-laptop.

For all known firmwares out in the wild, it seems that whenever the
FUJ02B1 ACPI device is present, it is always accompanied by a single
instance of the FUJ02E3 ACPI device.  We could independently grab an
ACPI handle to the FUJ02E3 ACPI device from the backlight driver, but
that would require using a hardcoded absolute path to that ACPI device,
which is subject to change.  It is easier to simply store a module-wide
pointer to the last (most likely only) FUJ02E3 ACPI device found, make
the aforementioned API use it and cover our bases by warning the user if
firmware exposes multiple FUJ02E3 ACPI devices.

Introducing this pointer in advance allows us to get rid of the
acpi_handle field of struct fujitsu_bl and also enables a bit more
step-by-step migration to a device-specific implementation of
call_fext_func().

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 3916f0ae59f3..21bd60afea75 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -155,6 +155,7 @@ struct fujitsu_laptop {
 };
 
 static struct fujitsu_laptop *fujitsu_laptop;
+static struct acpi_device *fext;
 
 #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
 static u32 dbg_level = 0x03;
@@ -788,6 +789,9 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 	if (!priv)
 		return -ENOMEM;
 
+	WARN_ONCE(fext, "More than one FUJ02E3 ACPI device was found.  Driver may not work as intended.");
+	fext = device;
+
 	fujitsu_laptop = priv;
 	fujitsu_laptop->acpi_handle = device->handle;
 	sprintf(acpi_device_name(device), "%s",
-- 
2.13.0
