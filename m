From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 6/7] platform/x86: fujitsu-laptop: More accurately represent the hotkey ring buffer managed by firmware
Date: Tue, 27 Feb 2018 22:15:38 +0100
Message-ID: <20180227211539.5708-7-kernel@kempniu.pl>
References: <20180227211539.5708-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180227211539.5708-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The MAX_HOTKEY_RINGBUFFER_SIZE constant is set to 100, which allows up
to 100 hotkey events to be drained from the firmware ring buffer upon
module load.  However, no known firmware is capable of holding more than
16 hotkey events in its internal ring buffer:

    Method (SIRB, 1, NotSerialized)
    {
        If ((BNCT < 0x10))
        {
            CreateWordField (BNBF, BNSP, BNP1)
            BNP1 = Arg0
            BNCT++
            BNSP += 0x02
            If ((BNSP >= 0x20))
            {
                BNSP = Zero
            }
        }
    }

The RINGBUFFERSIZE constant is set to 40, which allows the module to
queue up to 40 hotkey events for delivery to user space.  As this value
seems arbitrarily chosen and 16 should be more than enough for any
practical use case, merge the two aforementioned constants into one
(HOTKEY_RINGBUFFER_SIZE) in order to simplify code and more accurately
represent the underlying data structure.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/platform/x86/fujitsu-laptop.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
index 5acf1ccc6864..46c9f4441c24 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -107,8 +107,7 @@
 #define EVENT_HK4			0x413
 #define EVENT_HK5			0x420
 
-#define MAX_HOTKEY_RINGBUFFER_SIZE	100
-#define RINGBUFFERSIZE			40
+#define HOTKEY_RINGBUFFER_SIZE		16
 
 /* Constant related to FUNC_FLAGS */
 #define FLAG_DOCK			BIT(9)
@@ -815,7 +814,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	/* kfifo */
 	spin_lock_init(&priv->fifo_lock);
-	ret = kfifo_alloc(&priv->fifo, RINGBUFFERSIZE * sizeof(int),
+	ret = kfifo_alloc(&priv->fifo, HOTKEY_RINGBUFFER_SIZE * sizeof(int),
 			  GFP_KERNEL);
 	if (ret)
 		return ret;
@@ -825,7 +824,7 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
 
 	while (call_fext_func(device, FUNC_BUTTONS, OP_GET_EVENTS,
 			      0x0, 0x0) != 0 &&
-	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE)
+	       i++ < HOTKEY_RINGBUFFER_SIZE)
 		; /* No action, result is discarded */
 	acpi_handle_debug(device->handle, "Discarded %i ringbuffer entries\n",
 			  i);
@@ -941,7 +940,7 @@ static void acpi_fujitsu_laptop_notify(struct acpi_device *device, u32 event)
 
 	while ((irb = call_fext_func(device, FUNC_BUTTONS, OP_GET_EVENTS,
 				     0x0, 0x0)) != 0 &&
-	       i++ < MAX_HOTKEY_RINGBUFFER_SIZE) {
+	       i++ < HOTKEY_RINGBUFFER_SIZE) {
 		scancode = irb & 0x4ff;
 		if (sparse_keymap_entry_from_scancode(priv->input, scancode))
 			acpi_fujitsu_laptop_press(device, scancode);
-- 
2.16.2
