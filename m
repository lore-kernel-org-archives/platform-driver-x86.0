Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2D331A57;
	Fri, 27 Mar 2026 18:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774635038; cv=none; b=dZpGqF+0s+r1bSpqoIzoVhXdXAp0kXfBLQZHYXCHhmtv2jdpa57wQ5TZX7/Efgq6cqQCLTYMcnQ7UWYT/if4CX0JSqO9IdzSW+x76voFRQtjKSgM0fsUewfDOTj2Aaz3uqe3MqoUzkWhpZnlb+oSb90vuyAl8Umo8MFd2NKQTxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774635038; c=relaxed/simple;
	bh=5anKZ713DKRvTehtWC+cBIeqxu/F84Rb60CaeZSmfbU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F4IVKRlaEw5HGb6Dc6pqQSQ3eUkO/dAu+LaIjQXSVbbwGvf6auruwxJ6Uo62zWh/mhR8JpY6m9xylHCtPeoWXyydVtYwnx0rEaYF6ZcwDmIv8HpqfMD23MHVB8mmot9HGEgE8rY1tlDWm9GE4Lp98peoa5N2vYv2hNWKseH4jcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=Icip6EW/; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="Icip6EW/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Qj3pMrPTJH8iNxFc7o1eObD1qZkpRNcjx2PEJh5+0qc=; b=Icip6EW/7Q1N/JORBasqN/+/n2
	59iGPfQMwvbZSwnTjx4pVALpvplEf/pIIA7wrldYGch8COlZByG8Y3t5sjR8Mf24ZDU1c2LlHhvNK
	AyTuXwC/zSP8AfLzh70CUJt7Ri3sQkZJDY+o/86roPXgawlTLC24LCHlvzoM1oTO76eo=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w6Bdf-006FSA-2U;
	Fri, 27 Mar 2026 19:10:31 +0100
From: Marco Nenciarini <mnencia@kcore.it>
To: Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Nenciarini <mnencia@kcore.it>
Subject: [PATCH v5 1/4] platform/x86: int3472: Use local variable for LED struct access
Date: Fri, 27 Mar 2026 19:10:28 +0100
Message-Id: <20260327181031.1489365-2-mnencia@kcore.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260327181031.1489365-1-mnencia@kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a local struct int3472_pled pointer in the LED registration
and unregistration functions to avoid repeatedly dereferencing
int3472->pled. In the brightness callback, use container_of() to get
the int3472_pled struct directly instead of going through
int3472_discrete_device.

No functional change.

Signed-off-by: Marco Nenciarini <mnencia@kcore.it>
---
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 drivers/platform/x86/intel/int3472/led.c | 42 +++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index b1d84b9..4c52f99 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -7,54 +7,56 @@
 #include <linux/platform_data/x86/int3472.h>
 
 static int int3472_pled_set(struct led_classdev *led_cdev,
-				     enum led_brightness brightness)
+			    enum led_brightness brightness)
 {
-	struct int3472_discrete_device *int3472 =
-		container_of(led_cdev, struct int3472_discrete_device, pled.classdev);
+	struct int3472_pled *pled = container_of(led_cdev, struct int3472_pled, classdev);
 
-	gpiod_set_value_cansleep(int3472->pled.gpio, brightness);
+	gpiod_set_value_cansleep(pled->gpio, brightness);
 	return 0;
 }
 
 int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gpio_desc *gpio)
 {
+	struct int3472_pled *pled = &int3472->pled;
 	char *p;
 	int ret;
 
-	if (int3472->pled.classdev.dev)
+	if (pled->classdev.dev)
 		return -EBUSY;
 
-	int3472->pled.gpio = gpio;
+	pled->gpio = gpio;
 
 	/* Generate the name, replacing the ':' in the ACPI devname with '_' */
-	snprintf(int3472->pled.name, sizeof(int3472->pled.name),
+	snprintf(pled->name, sizeof(pled->name),
 		 "%s::privacy_led", acpi_dev_name(int3472->sensor));
-	p = strchr(int3472->pled.name, ':');
+	p = strchr(pled->name, ':');
 	if (p)
 		*p = '_';
 
-	int3472->pled.classdev.name = int3472->pled.name;
-	int3472->pled.classdev.max_brightness = 1;
-	int3472->pled.classdev.brightness_set_blocking = int3472_pled_set;
+	pled->classdev.name = pled->name;
+	pled->classdev.max_brightness = 1;
+	pled->classdev.brightness_set_blocking = int3472_pled_set;
 
-	ret = led_classdev_register(int3472->dev, &int3472->pled.classdev);
+	ret = led_classdev_register(int3472->dev, &pled->classdev);
 	if (ret)
 		return ret;
 
-	int3472->pled.lookup.provider = int3472->pled.name;
-	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy";
-	led_add_lookup(&int3472->pled.lookup);
+	pled->lookup.provider = pled->name;
+	pled->lookup.dev_id = int3472->sensor_name;
+	pled->lookup.con_id = "privacy";
+	led_add_lookup(&pled->lookup);
 
 	return 0;
 }
 
 void skl_int3472_unregister_pled(struct int3472_discrete_device *int3472)
 {
-	if (IS_ERR_OR_NULL(int3472->pled.classdev.dev))
+	struct int3472_pled *pled = &int3472->pled;
+
+	if (IS_ERR_OR_NULL(pled->classdev.dev))
 		return;
 
-	led_remove_lookup(&int3472->pled.lookup);
-	led_classdev_unregister(&int3472->pled.classdev);
-	gpiod_put(int3472->pled.gpio);
+	led_remove_lookup(&pled->lookup);
+	led_classdev_unregister(&pled->classdev);
+	gpiod_put(pled->gpio);
 }
-- 
2.47.3

