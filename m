From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] platform/x86: intel-vbtn: Detect switch position before registering the input-device
Date: Sun, 10 May 2020 14:20:47 +0200
Message-ID: <20200510122047.123613-2-hdegoede@redhat.com>
References: <20200510122047.123613-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200510122047.123613-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Setting the initial state of input-device switches must be done before
registering the input-device.

Otherwise the initial state will get send out as an event as soon
as input_sync() gets called.

E.g. when undocking a tablet using intel-vbtn to report SW_TABLET_MODE
and SW_DOCK before this commit we would get (evemu-record output):

E: 0.000001 0005 0005 0001	# EV_SW / SW_DOCK              1
E: 0.000001 0000 0000 0000	# ------------ SYN_REPORT (0) ---------- +0ms
E: 0.000109 0005 0005 0000	# EV_SW / SW_DOCK              0
E: 0.000109 0000 0000 0000	# ------------ SYN_REPORT (0) ---------- +0ms
E: 0.000133 0005 0001 0001	# EV_SW / SW_TABLET_MODE       1
E: 0.000133 0000 0000 0000	# ------------ SYN_REPORT (0) ---------- +0ms

The first SW_DOCK=1 report is spurious, setting the initial switch
state before registering the input-device fixes this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 29984154f8e4..ef92c1c3adbd 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -111,6 +111,9 @@ static int intel_vbtn_input_setup(struct platform_device *device)
 	priv->input_dev->name = "Intel Virtual Button driver";
 	priv->input_dev->id.bustype = BUS_HOST;
 
+	if (priv->has_switches)
+		detect_tablet_mode(device);
+
 	return input_register_device(priv->input_dev);
 }
 
@@ -217,9 +220,6 @@ static int intel_vbtn_probe(struct platform_device *device)
 		return err;
 	}
 
-	if (priv->has_switches)
-		detect_tablet_mode(device);
-
 	status = acpi_install_notify_handler(handle,
 					     ACPI_DEVICE_NOTIFY,
 					     notify_handler,
-- 
2.26.0
