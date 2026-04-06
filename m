Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A53932F8;
	Mon,  6 Apr 2026 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775510249; cv=none; b=YeUcb2yLL7a4WVkBovqqo4C+kVy5IGjcJeZ43TGNjXi/gzkQtM6NDdJVbSkOh7g91avoMYCI+RQx7YRStxWmJZZ1p+wxJ0ctM0U572mrA89KF6DwfwG+nkWib1CthHC/ZQczHVTswYgCpc5cgh2UvryxLL8UjIw7J6m9/w8Feks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775510249; c=relaxed/simple;
	bh=ttJ8SvSxR/RjC95uSY4S/rNKXqtakwl+yiRcTXk+XYI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HPQJjLGeuSz4jwwR4SnU/p2a+BWjXrYCdlX17FeGCgYTSwqaQSUhxHUotQ43sQ/sls1hOb3xdBf6FaJYE5KSnOrPEawEd2AxLCAFm7CaOIhLIiN0kTNfytKuuYLRRk5vHf2NItx8hYR3JKC93MEDzlLubY0ZmJhoBao1XoFQYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=uLyQMsaT; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="uLyQMsaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775510238; x=1776115038; i=w_armin@gmx.de;
	bh=fv8bPPROsUknmy+9S0UYADRcI9Wfh0gm23V4QcQHP9k=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uLyQMsaTW9ArpN2xMuX292iWbQIh2V91xkoOCG8ALy/cgAt9cbFXMA+A91c2wEXh
	 n4mu74Udq7aLW3oyukzQfFLvXqqeNFSw2Lnhjv2EJRENWE84BfBJvyABJ5Dr+tTIv
	 Jb7OsNAD2cDuh4Gm4jA6ipXbLs/Cu0+AHNvAXhwYNk6HP3xlKtPPBMqEID5SIp45h
	 CmuCNxy/V33JYe7Xtxj5Wgdl7Zr/zp6o3Gw+aepbBVtRAwcL1IHgtafK1lrtRGIkC
	 iEXh6UTd1qe/Brt55iWibiMnFoScEQD8frXQ8tw5YQxkbGXWKCmI98VA8LPgfgBSm
	 t5DrD4RNgQjXszOZWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mzyuc-1vEKym0gXm-00rKFM; Mon, 06
 Apr 2026 23:17:18 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] platform/wmi: Replace .no_notify_data with .min_event_size
Date: Mon,  6 Apr 2026 22:32:37 +0200
Message-Id: <20260406203237.2970-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406203237.2970-1-W_Armin@gmx.de>
References: <20260406203237.2970-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gHMqHXmGrJYU2CK0sYFpkHuhU4oY83YS2GqkKTUhC8FTGwhlsPz
 CRdy6WfJw571Wch+vVpXPeSOxotI+/t4LXqaavKTNp77TFkRPS8SOR4FyjJX9Yi0NXQ8yKA
 LsmYyi+ladNsTdPxrbrqS/9e0y3Gsc/iT2Jv2VNqGy+CRz4Sg4AKYAx8eFPLcMYQaLDoEKv
 ESYlyqKv7YvLpfnVUBH7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jl/iLwPvAOo=;pxqNLfXnAFmIANSZV7upS36Utpm
 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
 p8

WMI drivers using the buffer-based WMI API are expected to reject
undersized event payloads. Extend the WMI driver core to allow
such drivers to specify their minimum supported event payload size.
Also remove the now redundant .no_notify_data field.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/driver-development-guide.rst |  8 +++++---
 drivers/platform/wmi/core.c                    | 12 ++++++++----
 drivers/platform/x86/bitland-mifs-wmi.c        |  8 ++------
 drivers/platform/x86/dell/dell-wmi-base.c      |  1 +
 drivers/platform/x86/lenovo/ideapad-laptop.c   |  1 +
 drivers/platform/x86/lenovo/wmi-camera.c       |  1 +
 drivers/platform/x86/lenovo/wmi-events.c       |  1 +
 drivers/platform/x86/lenovo/ymc.c              |  1 +
 drivers/platform/x86/lenovo/yogabook.c         |  2 +-
 drivers/platform/x86/redmi-wmi.c               |  1 +
 drivers/platform/x86/uniwill/uniwill-wmi.c     |  1 +
 drivers/platform/x86/xiaomi-wmi.c              |  1 +
 include/linux/wmi.h                            |  7 +++++--
 13 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/Documentation/wmi/driver-development-guide.rst b/Documentatio=
n/wmi/driver-development-guide.rst
index 5b94402874c4..387f508d57ad 100644
=2D-- a/Documentation/wmi/driver-development-guide.rst
+++ b/Documentation/wmi/driver-development-guide.rst
@@ -71,7 +71,7 @@ to matching WMI devices using a struct wmi_device_id tab=
le:
         .remove =3D foo_remove,         /* optional, devres is preferred =
*/
         .shutdown =3D foo_shutdown,     /* optional, called during shutdo=
wn */
         .notify_new =3D foo_notify,     /* optional, for event handling *=
/
-        .no_notify_data =3D true,       /* optional, enables events conta=
ining no additional data */
+        .min_event_size =3D X,          /* optional, simplifies event pay=
load size verification */
         .no_singleton =3D true,         /* required for new WMI drivers *=
/
   };
   module_wmi_driver(foo_driver);
@@ -142,8 +142,10 @@ right before and after calling its remove() or shutdo=
wn() callback.
 However WMI driver developers should be aware that multiple WMI events ca=
n be received concurrently,
 so any locking (if necessary) needs to be provided by the WMI driver itse=
lf.
=20
-In order to be able to receive WMI events containing no additional event =
data,
-the ``no_notify_data`` flag inside struct wmi_driver should be set to ``t=
rue``.
+The WMI driver can furthermore instruct the WMI driver core to automatica=
lly reject WMI events
+that contain a undersized event payload by populating the ``min_event_siz=
e`` field inside
+struct wmi_driver. Setting this field to 0 will thus enable the WMI drive=
r to receive WMI events
+without any event payload.
=20
 Take a look at drivers/platform/x86/xiaomi-wmi.c for an example WMI event=
 driver.
=20
diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 87b0e54dde5a..7df50c8238e5 100644
=2D-- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1040,7 +1040,7 @@ static int wmi_dev_probe(struct device *dev)
 	}
=20
 	if (wdriver->notify || wdriver->notify_new) {
-		if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_notify_=
data)
+		if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && wdriver->min_event_s=
ize)
 			return -ENODEV;
 	}
=20
@@ -1398,10 +1398,14 @@ static int wmi_get_notify_data(struct wmi_block *w=
block, union acpi_object **obj
 static void wmi_notify_driver(struct wmi_block *wblock, union acpi_object=
 *obj)
 {
 	struct wmi_driver *driver =3D to_wmi_driver(wblock->dev.dev.driver);
+	struct wmi_buffer dummy =3D {
+		.length =3D 0,
+		.data =3D ZERO_SIZE_PTR,
+	};
 	struct wmi_buffer buffer;
 	int ret;
=20
-	if (!obj && !driver->no_notify_data) {
+	if (!obj && driver->min_event_size) {
 		dev_warn(&wblock->dev.dev, "Event contains no event data\n");
 		return;
 	}
@@ -1411,11 +1415,11 @@ static void wmi_notify_driver(struct wmi_block *wb=
lock, union acpi_object *obj)
=20
 	if (driver->notify_new) {
 		if (!obj) {
-			driver->notify_new(&wblock->dev, NULL);
+			driver->notify_new(&wblock->dev, &dummy);
 			return;
 		}
=20
-		ret =3D wmi_unmarshal_acpi_object(obj, &buffer, 0);
+		ret =3D wmi_unmarshal_acpi_object(obj, &buffer, driver->min_event_size)=
;
 		if (ret < 0) {
 			dev_warn(&wblock->dev.dev, "Failed to unmarshal event data: %d\n", ret=
);
 			return;
diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x8=
6/bitland-mifs-wmi.c
index 78639407d67e..b0d06a80e89e 100644
=2D-- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -734,15 +734,10 @@ static void bitland_mifs_wmi_notify(struct wmi_devic=
e *wdev,
 				    const struct wmi_buffer *buffer)
 {
 	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
-	const struct bitland_mifs_event *event;
+	const struct bitland_mifs_event *event =3D buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
=20
-	if (buffer->length < sizeof(*event))
-		return;
-
-	event =3D buffer->data;
-
 	/* Validate event type */
 	if (event->event_type !=3D WMI_EVENT_TYPE_HOTKEY)
 		return;
@@ -830,6 +825,7 @@ static struct wmi_driver bitland_mifs_wmi_driver =3D {
 		.pm =3D pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
 	},
 	.id_table =3D bitland_mifs_wmi_id_table,
+	.min_event_size =3D sizeof(struct bitland_mifs_event),
 	.probe =3D bitland_mifs_wmi_probe,
 	.notify_new =3D bitland_mifs_wmi_notify,
 };
diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/=
x86/dell/dell-wmi-base.c
index e7a411ae9ca1..2a5804efd3ea 100644
=2D-- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -825,6 +825,7 @@ static struct wmi_driver dell_wmi_driver =3D {
 		.name =3D "dell-wmi",
 	},
 	.id_table =3D dell_wmi_id_table,
+	.min_event_size =3D sizeof(u16),
 	.probe =3D dell_wmi_probe,
 	.remove =3D dell_wmi_remove,
 	.notify =3D dell_wmi_notify,
diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platfo=
rm/x86/lenovo/ideapad-laptop.c
index ae1ebb071fab..4fbc904f1fc3 100644
=2D-- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2340,6 +2340,7 @@ static struct wmi_driver ideapad_wmi_driver =3D {
 		.name =3D "ideapad_wmi",
 	},
 	.id_table =3D ideapad_wmi_ids,
+	.min_event_size =3D sizeof(u32),
 	.probe =3D ideapad_wmi_probe,
 	.notify =3D ideapad_wmi_notify,
 };
diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/x=
86/lenovo/wmi-camera.c
index eb60fb9a5b3f..89ecbce60bf4 100644
=2D-- a/drivers/platform/x86/lenovo/wmi-camera.c
+++ b/drivers/platform/x86/lenovo/wmi-camera.c
@@ -134,6 +134,7 @@ static struct wmi_driver lenovo_wmi_driver =3D {
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table =3D lenovo_wmi_id_table,
+	.min_event_size =3D sizeof(u8),
 	.no_singleton =3D true,
 	.probe =3D lenovo_wmi_probe,
 	.notify =3D lenovo_wmi_notify,
diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/x=
86/lenovo/wmi-events.c
index 0994cd7dd504..4a6a2c82413a 100644
=2D-- a/drivers/platform/x86/lenovo/wmi-events.c
+++ b/drivers/platform/x86/lenovo/wmi-events.c
@@ -183,6 +183,7 @@ static struct wmi_driver lwmi_events_driver =3D {
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table =3D lwmi_events_id_table,
+	.min_event_size =3D sizeof(u32),
 	.probe =3D lwmi_events_probe,
 	.notify =3D lwmi_events_notify,
 	.no_singleton =3D true,
diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/leno=
vo/ymc.c
index 470d53e3c9d2..1b73a55f1b89 100644
=2D-- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -153,6 +153,7 @@ static struct wmi_driver lenovo_ymc_driver =3D {
 		.name =3D "lenovo-ymc",
 	},
 	.id_table =3D lenovo_ymc_wmi_id_table,
+	.min_event_size =3D sizeof(u32),
 	.probe =3D lenovo_ymc_probe,
 	.notify =3D lenovo_ymc_notify,
 };
diff --git a/drivers/platform/x86/lenovo/yogabook.c b/drivers/platform/x86=
/lenovo/yogabook.c
index 69887de36c9b..1a4b2ab1f35d 100644
=2D-- a/drivers/platform/x86/lenovo/yogabook.c
+++ b/drivers/platform/x86/lenovo/yogabook.c
@@ -411,8 +411,8 @@ static struct wmi_driver yogabook_wmi_driver =3D {
 		.name =3D "yogabook-wmi",
 		.pm =3D pm_sleep_ptr(&yogabook_pm_ops),
 	},
-	.no_notify_data =3D true,
 	.id_table =3D yogabook_wmi_id_table,
+	.min_event_size =3D 0,
 	.probe =3D yogabook_wmi_probe,
 	.remove =3D yogabook_wmi_remove,
 	.notify =3D yogabook_wmi_notify,
diff --git a/drivers/platform/x86/redmi-wmi.c b/drivers/platform/x86/redmi=
-wmi.c
index e5cb348e3a39..58898630eda6 100644
=2D-- a/drivers/platform/x86/redmi-wmi.c
+++ b/drivers/platform/x86/redmi-wmi.c
@@ -141,6 +141,7 @@ static struct wmi_driver redmi_wmi_driver =3D {
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table =3D redmi_wmi_id_table,
+	.min_event_size =3D 32,
 	.probe =3D redmi_wmi_probe,
 	.notify =3D redmi_wmi_notify,
 	.no_singleton =3D true,
diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.c b/drivers/platform=
/x86/uniwill/uniwill-wmi.c
index 31d9c39f14ab..097882f10b1e 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-wmi.c
+++ b/drivers/platform/x86/uniwill/uniwill-wmi.c
@@ -77,6 +77,7 @@ static struct wmi_driver uniwill_wmi_driver =3D {
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table =3D uniwill_wmi_id_table,
+	.min_event_size =3D sizeof(u32),
 	.notify =3D uniwill_wmi_notify,
 	.no_singleton =3D true,
 };
diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiao=
mi-wmi.c
index badf9e42e015..3874f3336a0d 100644
=2D-- a/drivers/platform/x86/xiaomi-wmi.c
+++ b/drivers/platform/x86/xiaomi-wmi.c
@@ -83,6 +83,7 @@ static struct wmi_driver xiaomi_wmi_driver =3D {
 		.name =3D "xiaomi-wmi",
 	},
 	.id_table =3D xiaomi_wmi_id_table,
+	.min_event_size =3D 0,
 	.probe =3D xiaomi_wmi_probe,
 	.notify_new =3D xiaomi_wmi_notify,
 	.no_singleton =3D true,
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index da94580572a9..2d242575a8b3 100644
=2D-- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -91,7 +91,7 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
  * struct wmi_driver - WMI driver structure
  * @driver: Driver model structure
  * @id_table: List of WMI GUIDs supported by this driver
- * @no_notify_data: Driver supports WMI events which provide no event dat=
a
+ * @min_event_size: Minimum event payload size supported by this driver
  * @no_singleton: Driver can be instantiated multiple times
  * @probe: Callback for device binding
  * @remove: Callback for device unbinding
@@ -101,11 +101,14 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
  *
  * This represents WMI drivers which handle WMI devices. The data inside =
the buffer
  * passed to the @notify_new callback is guaranteed to be aligned on a 8-=
byte boundary.
+ * The minimum supported size for said buffer can be specified using @min=
_event_size.
+ * WMI drivers that still use the deprecated @notify callback can still s=
et @min_event_size
+ * to 0 in order to signal that they support WMI events which provide no =
event data.
  */
 struct wmi_driver {
 	struct device_driver driver;
 	const struct wmi_device_id *id_table;
-	bool no_notify_data;
+	size_t min_event_size;
 	bool no_singleton;
=20
 	int (*probe)(struct wmi_device *wdev, const void *context);
=2D-=20
2.39.5

