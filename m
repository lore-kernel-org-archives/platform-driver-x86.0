Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6203341F7C3
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 22:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788044260; cv=none; b=efEszzlOfU2ix4L+TGlj+1dN+TLXmuucRCePjKri881d7zT3Zu8PNska+h3qzWMu9KjVdkvGwCPnFyHsJmOADKUMxrTsksc0pgPGbgCOxWPa9ITmdLNePNn0KINOggtAPpPK96pAK/lmfwOtgXcKqCKRih0h865B5WmKRmS4w+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788044260; c=relaxed/simple;
	bh=dh+ci8nOHAGtq1C6/sbPJD/4AGFO48IBfY1R/zi8ezI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzczo0pFVxTBsW0+OG8WFXKuhh5F6v5qhpSPF2Wc+hlbOh91Wc5zu84I/c5ip5VeU0iEu35sVFhIjC8KTa97r00Eh0DkS7gIXCv69OSfWWpzN/v/dFXRemeO0Pv2QGwxU7V/lNztq8mA9PDOsEXvo9CIsyiIA4GoHnVbejsbd6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxW+McXH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxW+McXH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso23102365e9.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 15:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788044256; x=1788649056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iCfpX8oHZX9uMVNSgaZX3RDhyiRh7DN6yNAWOLc9co=;
        b=jxW+McXH1P9HKgZHNbaq1PwMvDfQSLqIZKsFFEOQiO4+r8VwmqNsY/YSmLszfWUBQ9
         h8Uibd1R/o9l0sXmMm0TFKwY+UTbptOmT6IjIoWA6S2u4itZzrJDfN84ALLl5wIks7FG
         Fg9QGQmd9JwetvQuxh/oRL4vZGUFLkJkhDZLVaAmM9dBRCEtPlP834n4EUMj+PFhnttt
         Fdvp3PDScUVJ16fd6NRdTHQyNoaklYw35RLBuk5cPtiqp+vwfOD+Nn6oo5HSbjXvMgwQ
         9zpjEBWlOCOD0ULjS1vuxqEAEp4APzm3FR0Cpbk2eKmi72E5gw1dpHzHaw3IwFGYIuya
         A+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788044256; x=1788649056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iCfpX8oHZX9uMVNSgaZX3RDhyiRh7DN6yNAWOLc9co=;
        b=dpq9iZVDkIIhGWGAEd1yH8U7PKJiMDgqorciZJ2A/YdFmJRxEzFGWj9Ew0NENUSKq5
         YwtDkDmJJMYrngzry54be/ka/ixXt8MmAGEPGptPkfNcgz3bD0ooEaoPa2GZJ5XJMAj8
         hDTZy2QLx41iJQe1B1f9i8ZXba3eXsSfrDAcy/BAwTNUfbB/JZ8vN/MN75TSn9t2feJn
         te3EorYj41h9XHOtPwTjvLvGkT/MG2MswBEA/m5Ku094HE4lzoNmeUg0Y7KvqLLytN4O
         QxTfbkct1Tr+AiL/9va3hp3gA6vMwyBAykstSGQmRJtJ2bWYSq4yLfozfKEzdtMdeBgR
         ztxA==
X-Forwarded-Encrypted: i=1; AHgh+Rp98Vsjbgy/wbmynkgnjE2aYm5LVzyifCelMOp3wo0NOQvRRT+fVrN6sBXw87aUFEM1GdnfKbvgyO6be5/55NcXDgiK@vger.kernel.org
X-Gm-Message-State: AFuF++kuj8wEJJiF43OEGdRGQ8VsZi3gPPV0toRH56yc/Zie8eOnszfv
	vBmoc9mKcgOZa6tYJAxHTAqgqYasKfvhvRHhZIDOWMaK+6yoxYkNrFIx
X-Gm-Gg: AR+sD12wbPDYyNdvj3gzU2kzkPKbqQkWBfYSCdac6Y9IXZ4vSwcZnOlAED7aT9EDPM4
	iYwDBUNjmiM6pynNFsNFKosDzmAQ/FdCr9Mc4bjeJTLsrw5hz74X3l012MfbZ56/8pF6OMRlBRk
	vyH0IVgd6x5AL70Ixm4tJHuK2/QTnoniQIb3gjS++6B3rF849xUI3zujNQ40HBA4/A4GjmnPW3a
	caNFWlmJZWrW/5xMf70klhlK4iE4ae+MJVMDaob5gssAb7tz7lmsUIOOkergxSt0wfsNtLAcmuU
	MbaH5H324XdSE7iW+FhQUlCUK3ZW4KAp5k/fHndWUVm3u7st4R2b9YxZj0tHSSWOY3A+XjgSrKA
	/SPvuHnyIMNKi8FSVe9UQ61U2LXr0KWbItpwOkcJhEAUlfA882bxtFoKV440wShMx5N0hPphFUR
	3KVxSMxNTRNhe9umghrORQr0YCiaSZr9KSqfxo3v6eQ7+cxv98p25HaKMbAFow/3s4orFNWI+Ms
	IymTb3YfQV+ESGkqEOcHYt62oBi6zVTVM0IHSxzX7ye
X-Received: by 2002:a05:600c:4683:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49cca3125c5mr114538965e9.6.1788044256458;
        Sat, 29 Aug 2026 15:57:36 -0700 (PDT)
Received: from 1Z10 ([37.161.113.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm60751835e9.0.2026.08.29.15.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 15:57:36 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 3/3] platform/x86: x86-android-tablets: Add Yoga Book audio GPIOs
Date: Sun, 30 Aug 2026 00:57:29 +0200
Message-ID: <20260829225729.395270-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829225729.395270-1-mauriziocasciano7@gmail.com>
References: <apLZF6b3F39z6bUc@google.com>
 <20260829225729.395270-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L uses two GPIOs provided by the RT5677 codec
itself. GPIO2 enables the second speaker amplifier and GPIO4 enables the
headphone path, but ACPI does not map either signal.

Describe both controls with a software node attached to the codec
device. The same node identifies the RT5677 GPIO provider, allowing the
Yoga Book ASoC machine driver to request the controls by function name.
Reprobe the codec after adding the node so the provider is initialized
with the new fwnode before the machine driver requests the descriptors.
Attach and remove the node with the tablet description lifetime.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Link: https://lore.kernel.org/platform-driver-x86/apLZF6b3F39z6bUc@google.com/
Assisted-by: Codex:gpt-5.6-sol [sparse]
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../platform/x86/x86-android-tablets/lenovo.c | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 88693b9a1b01..1b7a95f23306 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -138,9 +138,26 @@ static const struct software_node lenovo_yb1_x91_drv2604_1_node = {
 	.properties = lenovo_yb1_x91_drv2604_1_props,
 };
 
+static const struct software_node lenovo_yb1_x91_rt5677_node;
+
+static const struct property_entry lenovo_yb1_x91_rt5677_props[] = {
+	/* GPIO2 drives the second speaker amp; GPIO4 drives headphones. */
+	PROPERTY_ENTRY_GPIO("speaker-enable2-gpios",
+			    &lenovo_yb1_x91_rt5677_node, 2, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("headphone-enable-gpios",
+			    &lenovo_yb1_x91_rt5677_node, 4, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_x91_rt5677_node = {
+	.name = "rt5677",
+	.properties = lenovo_yb1_x91_rt5677_props,
+};
+
 static const struct software_node *lenovo_yb1_x91_swnodes[] = {
 	&lenovo_yb1_x91_drv2604_0_node,
 	&lenovo_yb1_x91_drv2604_1_node,
+	&lenovo_yb1_x91_rt5677_node,
 	NULL
 };
 
@@ -345,11 +362,53 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 	},
 };
 
+#define YB1_X91_RT5677_DEVICE "i2c-10EC5677:00"
 #define YB1_X91_DRV2604_0_DEVICE "i2c-DRV2604:00"
 #define YB1_X91_DRV2604_1_DEVICE "i2c-DRV2604:01"
 
+static struct device *lenovo_yb1_x91_rt5677_dev;
 static struct device *lenovo_yb1_x91_drv2604_devs[2];
 
+static void lenovo_yb1_x91_add_audio_props(struct device *dev)
+{
+	struct device *codec_dev;
+	int ret;
+
+	codec_dev = bus_find_device_by_name(&i2c_bus_type, NULL,
+					    YB1_X91_RT5677_DEVICE);
+	if (!codec_dev) {
+		dev_warn(dev, "cannot find %s, audio will be unavailable\n",
+			 YB1_X91_RT5677_DEVICE);
+		return;
+	}
+
+	ret = device_add_software_node(codec_dev, &lenovo_yb1_x91_rt5677_node);
+	if (ret) {
+		put_device(codec_dev);
+		dev_warn(dev, "failed to add properties to %s: %d\n",
+			 YB1_X91_RT5677_DEVICE, ret);
+		return;
+	}
+
+	/* Ensure the codec GPIO provider is initialized with the new fwnode. */
+	ret = device_reprobe(codec_dev);
+	if (ret)
+		dev_warn(dev, "failed to reprobe %s: %d\n",
+			 YB1_X91_RT5677_DEVICE, ret);
+
+	lenovo_yb1_x91_rt5677_dev = codec_dev;
+}
+
+static void lenovo_yb1_x91_remove_audio_props(void)
+{
+	if (!lenovo_yb1_x91_rt5677_dev)
+		return;
+
+	device_remove_software_node(lenovo_yb1_x91_rt5677_dev);
+	put_device(lenovo_yb1_x91_rt5677_dev);
+	lenovo_yb1_x91_rt5677_dev = NULL;
+}
+
 static void lenovo_yb1_x91_add_haptics_props(struct device *dev, int index,
 					     const char *name)
 {
@@ -392,6 +451,7 @@ static void lenovo_yb1_x91_remove_haptics_props(int index)
 
 static int __init lenovo_yb1_x91_init(struct device *dev)
 {
+	lenovo_yb1_x91_add_audio_props(dev);
 	lenovo_yb1_x91_add_haptics_props(dev, 0, YB1_X91_DRV2604_0_DEVICE);
 	lenovo_yb1_x91_add_haptics_props(dev, 1, YB1_X91_DRV2604_1_DEVICE);
 
@@ -402,6 +462,7 @@ static void lenovo_yb1_x91_exit(void)
 {
 	lenovo_yb1_x91_remove_haptics_props(1);
 	lenovo_yb1_x91_remove_haptics_props(0);
+	lenovo_yb1_x91_remove_audio_props();
 }
 
 const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
-- 
2.53.0

