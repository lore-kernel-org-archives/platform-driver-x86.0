Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B02222574;
	Thu, 19 Dec 2024 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734603586; cv=none; b=jhbflt3koQUqv3kALNisJN3nWOgmtZsmcTblAGHofTfhGhJktX2XPDEWOW0Jg5anpEYqW+A7gmjapb2Nj+1MMFlXQGMA/3HNxEEACUVqzAML2k6EYNOc/ZWKHTFsBa1Ng2G+L+Biz4GG0Y+RLIpQfGBADpXDM+X3n32NRxrxrpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734603586; c=relaxed/simple;
	bh=gVeuNperevnlpq5lWwsD7itOj8WjroOqnWDPKCJd1ic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mgjmz2O1kfOp/MCi1wdFoiaynCd56stKo03mH3pm0DkD7Uc47kcADvKSVA/RoN3nt8Je4cvmGhdWudV2MVWxQMVE7Mvp0MOtFPTlmQWZDpcd4ezMH9nFVO2k2EmSIWMJtp/MIL1THwFSLWUd91NTnSJScXRA2FYqk+FNv6WgqO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from test-Lenovo-ThinkBook-14-Gen6.lenovo.com (unknown[123.114.236.251])
	by rmsmtp-lg-appmail-02-12080 (RichMail) with SMTP id 2f306763f2517c0-1390d;
	Thu, 19 Dec 2024 18:16:19 +0800 (CST)
X-RM-TRANSID:2f306763f2517c0-1390d
From: Jackie Dong <xy-jackie@139.com>
To: ike.pan@canonical.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	bo.liu@senarytech.com,
	kovalev@altlinux.org,
	me@oldherl.one,
	jaroslaw.janik@gmail.com,
	cs@tuxedo.de,
	songxiebing@kylinos.cn,
	kailang@realtek.com,
	sbinding@opensource.cirrus.com,
	simont@opensource.cirrus.com,
	josh@joshuagrisham.com,
	rf@opensource.cirrus.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	mpearson-lenovo@squebb.ca,
	waterflowdeg@gmail.com,
	Jackie Dong <xy-jackie@139.com>,
	Jackie Dong <dongeg1@lenovo.com>
Subject: [PATCH 1/2] platform/x86: ideapad-laptop: Support for mic and audio leds.
Date: Thu, 19 Dec 2024 18:15:30 +0800
Message-Id: <20241219101531.35896-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement Lenovo utility data WMI calls needed to make LEDs
work on Ideapads that support this GUID.
This enables the mic and audio LEDs to be updated correctly.

Tested on below samples.
ThinkBook 13X Gen4 IMH
ThinkBook 14 G6 ABP
ThinkBook 16p Gen4-21J8
ThinkBook 16p Gen8-IRL
ThinkBook 16p G7+ ASP

Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Jackie Dong <xy-jackie@139.com>
Signed-off-by: Jackie Dong <dongeg1@lenovo.com>
---
 drivers/platform/x86/ideapad-laptop.c | 157 +++++++++++++++++++++++++-
 1 file changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index c64dfc56651d..acea4aa8eac3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -32,6 +32,7 @@
 #include <linux/sysfs.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
+#include <sound/control.h>
 #include "ideapad-laptop.h"
 
 #include <acpi/video.h>
@@ -1298,6 +1299,15 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_END },
 };
 
+/*
+ * Input parameters to mute/unmute audio LED and Mic LED
+ */
+struct wmi_led_args {
+	u8 ID;
+	u8 SubID;
+	u16 Value;
+};
+
 static int ideapad_input_init(struct ideapad_private *priv)
 {
 	struct input_dev *inputdev;
@@ -2023,15 +2033,145 @@ static void ideapad_check_features(struct ideapad_private *priv)
 /*
  * WMI driver
  */
+#define IDEAPAD_ACPI_LED_MAX  (((SNDRV_CTL_ELEM_ACCESS_MIC_LED -\
+		SNDRV_CTL_ELEM_ACCESS_SPK_LED) >> SNDRV_CTL_ELEM_ACCESS_LED_SHIFT) + 1)
+
 enum ideapad_wmi_event_type {
 	IDEAPAD_WMI_EVENT_ESC,
 	IDEAPAD_WMI_EVENT_FN_KEYS,
+	IDEAPAD_WMI_EVENT_LUD_KEYS,
 };
 
+#define WMI_LUD_GET_SUPPORT 1
+#define WMI_LUD_SET_FEATURE 2
+
+#define WMI_LUD_GET_MICMUTE_LED_VER   20
+#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
+
+#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
+#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
+
 struct ideapad_wmi_private {
 	enum ideapad_wmi_event_type event;
+	struct led_classdev cdev[IDEAPAD_ACPI_LED_MAX];
 };
 
+static struct wmi_device *led_wdev;
+
+enum mute_led_type {
+	MIC_MUTE,
+	AUDIO_MUTE,
+};
+
+static int ideapad_wmi_mute_led_set(enum mute_led_type led_type, struct led_classdev *led_cdev,
+				    enum led_brightness brightness)
+
+{
+	struct wmi_led_args led_arg = {0, 0, 0};
+	struct acpi_buffer input;
+	acpi_status status;
+
+	if (led_type == MIC_MUTE)
+		led_arg.ID = brightness == LED_ON ? 1 : 2;
+	else if (led_type == AUDIO_MUTE)
+		led_arg.ID = brightness == LED_ON ? 4 : 5;
+	else
+		return -EINVAL;
+
+	input.length = sizeof(struct wmi_led_args);
+	input.pointer = &led_arg;
+	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_SET_FEATURE, &input, NULL);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int ideapad_wmi_audiomute_led_set(struct led_classdev *led_cdev,
+					 enum led_brightness brightness)
+
+{
+	return ideapad_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
+}
+
+static int ideapad_wmi_micmute_led_set(struct led_classdev *led_cdev,
+				       enum led_brightness brightness)
+{
+	return ideapad_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
+}
+
+static int ideapad_wmi_leds_init(enum mute_led_type led_type, struct device *dev)
+{
+	struct ideapad_wmi_private *wpriv = dev_get_drvdata(dev);
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	int led_version, err = 0;
+	unsigned int wmiarg;
+	acpi_status status;
+
+	if (led_type == MIC_MUTE)
+		wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
+	else if (led_type == AUDIO_MUTE)
+		wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
+	else
+		return -EINVAL;
+
+	input.length = sizeof(wmiarg);
+	input.pointer = &wmiarg;
+	status = wmidev_evaluate_method(led_wdev, 0, WMI_LUD_GET_SUPPORT, &input, &output);
+	if (ACPI_FAILURE(status)) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+	obj = output.pointer;
+	led_version = obj->integer.value;
+
+	wpriv->cdev[led_type].max_brightness = LED_ON;
+	wpriv->cdev[led_type].dev = dev;
+	wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
+
+	if (led_type == MIC_MUTE) {
+		if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
+			dev_info(dev, "This product doesn't support mic mute LED.\n");
+			return -EIO;
+		}
+		wpriv->cdev[led_type].name = "platform::micmute";
+		wpriv->cdev[led_type].brightness_set_blocking =	&ideapad_wmi_micmute_led_set;
+		wpriv->cdev[led_type].default_trigger = "audio-micmute";
+
+		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
+		if (err < 0) {
+			dev_err(dev, "Could not register mic mute LED : %d\n", err);
+			led_classdev_unregister(&wpriv->cdev[led_type]);
+		}
+	} else {
+		if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
+			dev_info(dev, "This product doesn't support audio mute LED.\n");
+			return -EIO;
+		}
+		wpriv->cdev[led_type].name = "platform::mute";
+		wpriv->cdev[led_type].brightness_set_blocking =	&ideapad_wmi_audiomute_led_set;
+		wpriv->cdev[led_type].default_trigger = "audio-mute";
+
+		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
+		if (err < 0) {
+			dev_err(dev, "Could not register audio mute LED: %d\n", err);
+			led_classdev_unregister(&wpriv->cdev[led_type]);
+		}
+	}
+
+	kfree(obj);
+	return err;
+}
+
+static void ideapad_wmi_leds_setup(struct device *dev)
+{
+	ideapad_wmi_leds_init(MIC_MUTE, dev);
+	ideapad_wmi_leds_init(AUDIO_MUTE, dev);
+}
+
 static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct ideapad_wmi_private *wpriv;
@@ -2043,6 +2183,12 @@ static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
 	*wpriv = *(const struct ideapad_wmi_private *)context;
 
 	dev_set_drvdata(&wdev->dev, wpriv);
+
+	if (wpriv->event == IDEAPAD_WMI_EVENT_LUD_KEYS) {
+		led_wdev = wdev;
+		ideapad_wmi_leds_setup(&wdev->dev);
+	}
+
 	return 0;
 }
 
@@ -2088,6 +2234,9 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
 				     data->integer.value | IDEAPAD_WMI_KEY);
 
 		break;
+	case IDEAPAD_WMI_EVENT_LUD_KEYS:
+		break;
+
 	}
 }
 
@@ -2099,10 +2248,16 @@ static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys = {
 	.event = IDEAPAD_WMI_EVENT_FN_KEYS
 };
 
+static const struct ideapad_wmi_private ideapad_wmi_context_LUD_keys = {
+	.event = IDEAPAD_WMI_EVENT_LUD_KEYS
+};
+
 static const struct wmi_device_id ideapad_wmi_ids[] = {
 	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, /* Yoga 3 */
 	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, /* Yoga 700 */
-	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* Legion 5 */
+	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys }, /* FN keys */
+	{ "CE6C0974-0407-4F50-88BA-4FC3B6559AD8", &ideapad_wmi_context_LUD_keys }, /* Util data */
+
 	{},
 };
 MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
-- 
2.34.1


