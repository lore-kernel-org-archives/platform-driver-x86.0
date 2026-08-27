Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655284C6F10
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 18:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854598; cv=none; b=CrGsnN+eYOgHqm9CveyGVXF0yJvOWkKFEeBtpxhzDxrKX/KeTUpgReEB4cNZPtiBKgLDv4G843JdG3d7I0wMSr7q7oSAVPHUONi653m7/26BPmNCTk4YEDP2xxIS0AXPi0dfjEx/Uwpktz2PtmSnsteOW+q/OrNqHthwhFZ1Two=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854598; c=relaxed/simple;
	bh=aTG/uz+tVhkKtaJIGX4Cd8rrk2gEkeMnqZ89kfxyTwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTTLsiPk473uzKv17u7xTsC4abx+tfoybGKxYEEk777pt0YcPvfUj8g55PdKFL9F5wDFh7GGM/CvDQrRF4y2a1SQO7sA75vWu39Bow/HdGBc3iNyyTdQ7paoxcVaRrrGXbSv3wUqv9/NXfmaKOVqy2K9sN5BPGlpuM9jtshsF3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdlg9N/3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdlg9N/3"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f92e3c14bso111041f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 11:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854593; x=1788459393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dMiJJYqXk3kfgLrjtvNLpclwwx4oSYqJYc7envt2b2E=;
        b=gdlg9N/3Nh7FrKHvnG0KJ9xxCQJIB/t3cHnmOg3fPdNHkWMKUy/XzB7KxtQHFN28St
         sUdQiTazbl8JyE5JxI9lszwXhnqIL5kC3jYbKb9omzRv7y6AaO1zPzmFjScY4clIIarl
         ftRgp6g2HZDEO8I2csic24xECj9yPM2p+btAEgHnf+Qv5QsHGa03idiI2iI0tNEGI8Wp
         lKvXOPQ+xukVauqV2o7nfWzUwpHB4Za1x/3wh8VOPv911vPb0WHezCAhuDvMZAOp9cBW
         t0WBNZjl9oLa4Z3IHKrZGW58X55Ut5fvePQwtske+0cHoDd3oQsCtAzldCk+6Z55M9p1
         50Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854593; x=1788459393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dMiJJYqXk3kfgLrjtvNLpclwwx4oSYqJYc7envt2b2E=;
        b=GeLbdElhf/103GG48S3a9py/Du0miP/OSI2ys4wK85aiIhSX7lQnHuT1EgNQi8gvoU
         Ge9E35FhfrpEkD+7X/0FkqH3pjb+yG8F88orbHq5EqzPcwZ3ScHyJp/Nm04ocoMuojO0
         qPM5RKv/et3JQdfOudzRhLU3SCmq58h5HTp82R1MZbO81H/8d5chNAo067oVLH4xyvtx
         M7fcZTexe84/e6IGAAOyimcS2ku8NYOMvz81YI6y4aNrdH1gsRp5w1iQ4BM2mpyTkunj
         +bNXxJtJyUaZ8xM9yHRarodwWMhrd86vshb9WnRP26wjVBf1g+npF/YTzESfEzMgrGtJ
         eteQ==
X-Gm-Message-State: AFuF++mwX4ik65XjDzNacwr4XRaJDIueBckY3ZQXDorPZYlPDtIiOXN8
	DTl3EirdV00j4g1fYogRHBtZnNdiEtjMZniq4mvRSLhntu13zzdzw+/vqnkMLYG4
X-Gm-Gg: AR+sD1300n3sR7lm4RA9hvmYYuJcrHrVmuaKDRtNANX7LUUuWBLLFYPEF06n7u5bkwD
	m0f3ReqIvWdvnKBrhNXnkwCdlqmumCKBVMlRJ5n+I68brUTvKjWe3UU94norK+FJqscviDSTK0e
	SNQ8WP9UGyr3os3ROfhnmzHqsfV3wu+xVRtI7Y0rf7q0cK5WOcXZxqU85nPhuC9n5m3RvKwi5tC
	+S4CbWhv72uMMg2Fyxap0Cr8O2xrtIqirnp/aJkQaeCQ26BcZKkOAt3GN1bcshjBzRuG9geIvey
	f+nQUITV0lsIP4ht5XbuICfeqm73A5nI3H6+5SOQwaSY+ePQp6nOK7dZNgHNvhsqRKCx5TfCoZH
	PTAzAEQ3Vsy5M6qv7DGoZv61vnxqEvXyN/uvaNEO70o2HEUd0lW9IHzO4S/Yqh36DLSrLLF/YkD
	mAxpkarXIDd2W2pru2uyL30v1axTsVUUm920ChLlxdZQHRaGd7ne/lgrtK65RPX04dnGviQ5BGJ
	nIcOBnFe2yOt8RInDL0MamUzvCDgmOmz/IOi8xurciY
X-Received: by 2002:a05:6000:381:b0:482:552f:ef68 with SMTP id ffacd0b85a97d-482f79ccac5mr817136f8f.19.1787854592778;
        Thu, 27 Aug 2026 11:16:32 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:31 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 1/4] platform/x86: x86-android-tablets: Fix GPIO software node matching
Date: Thu, 27 Aug 2026 20:16:24 +0200
Message-ID: <20260827181627.2427880-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio_secondary_fwnode_init() attaches each provider software node to the
ACPI device. The registered gpio_device has a different primary fwnode,
so gpio_device_find_by_fwnode() never sees that secondary node and
software-node GPIO consumers defer indefinitely.

Find the gpio_device by its matching label and attach the secondary node
directly to that device. Keep the returned reference until the managed
cleanup action unsets the node.

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../platform/x86/x86-android-tablets/core.c   | 21 ++++++++++++-------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 5db794d65eb5..8dfd15afdca2 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -16,6 +16,7 @@
 #include <linux/dmi.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/module.h>
@@ -364,9 +365,10 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 
 static void gpio_secondary_unset(void *data)
 {
-	struct device *dev = data;
+	struct gpio_device *gdev = data;
 
-	set_secondary_fwnode(dev, NULL);
+	set_secondary_fwnode(gpio_device_to_device(gdev), NULL);
+	gpio_device_put(gdev);
 }
 
 static void gpio_secondary_unregister_node_group(void *data)
@@ -396,20 +398,23 @@ static int gpio_secondary_fwnode_init(struct device *parent)
 		return ret;
 
 	for (swnode = gpiochip_node_group; *swnode; swnode++) {
-		struct device *dev __free(put_device) =
-				acpi_bus_find_device_by_name((*swnode)->name);
-		if (!dev)
+		struct gpio_device *gdev;
+
+		gdev = gpio_device_find_by_label((*swnode)->name);
+		if (!gdev)
 			return dev_err_probe(parent,
 					     -ENODEV, "Failed to find the required GPIO controller: %s\n",
 					     (*swnode)->name);
 
 		fwnode = software_node_fwnode(*swnode);
-		if (WARN_ON(!fwnode))
+		if (WARN_ON(!fwnode)) {
+			gpio_device_put(gdev);
 			return -ENOENT;
+		}
 
-		set_secondary_fwnode(dev, fwnode);
+		set_secondary_fwnode(gpio_device_to_device(gdev), fwnode);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, gdev);
 		if (ret)
 			return ret;
 	}
-- 
2.53.0

