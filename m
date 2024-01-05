Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF04822EF0
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YChzdImP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA3FC433C8;
	Fri,  5 Jan 2024 09:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704446303;
	bh=KL+tpRpekzLuo1joEf13QEYqYrXUBWzxpornrqG3FEc=;
	h=Subject:To:From:Date:From;
	b=YChzdImPRFjdujTDYxUHvljX71dnvPYnBb5cHEBl/1h/vKE0cSg3EZsQv54KW9tdO
	 UzJWk0nEK2CoDrQX8PMwpxM3bDOhehg6zdZTTOzML7sDHYe508/KGmYLB/5G37Iwte
	 eBwhzoYx1J0gwjlfpCZYGnMRj0cyMb7RkYtCvNBk=
Subject: patch "platform/surface: aggregator: make ssam_bus_type constant and static" added to char-misc-next
To: gregkh@linuxfoundation.org,hdegoede@redhat.com,ilpo.jarvinen@linux.intel.com,luzmaximilian@gmail.com,platform-driver-x86@vger.kernel.org
From: <gregkh@linuxfoundation.org>
Date: Fri, 05 Jan 2024 10:17:30 +0100
Message-ID: <2024010530-unseeing-hardening-4126@gregkh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This is a note to let you know that I've just added the patch titled

    platform/surface: aggregator: make ssam_bus_type constant and static

to my char-misc git tree which can be found at
    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
in the char-misc-next branch.

The patch will show up in the next release of the linux-next tree
(usually sometime within the next 24 hours during the week.)

The patch will also be merged in the next major kernel release
during the merge window.

If you have any questions about this process, please let me know.


From e1be24b2e1190a7662462e8e398189ac795339cd Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Dec 2023 18:18:58 +0100
Subject: platform/surface: aggregator: make ssam_bus_type constant and static
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that the driver core can properly handle constant struct bus_type,
move the ssam_bus_type variable to be a constant structure as well,
placing it into read-only memory which can not be modified at runtime.

It's also never used outside of
drivers/platform/surface/aggregator/bus.c so make it static and don't
export it as no one is using it.

Cc: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc:  <platform-driver-x86@vger.kernel.org>
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/r/2023121957-tapered-upswing-8326@gregkh
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/surface/aggregator/bus.c | 5 +++--
 include/linux/surface_aggregator/device.h | 1 -
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/surface/aggregator/bus.c b/drivers/platform/surface/aggregator/bus.c
index 42ccd7f1c9b9..118caa651bec 100644
--- a/drivers/platform/surface/aggregator/bus.c
+++ b/drivers/platform/surface/aggregator/bus.c
@@ -35,6 +35,8 @@ static struct attribute *ssam_device_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ssam_device);
 
+static const struct bus_type ssam_bus_type;
+
 static int ssam_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
 	const struct ssam_device *sdev = to_ssam_device(dev);
@@ -329,13 +331,12 @@ static void ssam_bus_remove(struct device *dev)
 		sdrv->remove(to_ssam_device(dev));
 }
 
-struct bus_type ssam_bus_type = {
+static const struct bus_type ssam_bus_type = {
 	.name   = "surface_aggregator",
 	.match  = ssam_bus_match,
 	.probe  = ssam_bus_probe,
 	.remove = ssam_bus_remove,
 };
-EXPORT_SYMBOL_GPL(ssam_bus_type);
 
 /**
  * __ssam_device_driver_register() - Register a SSAM client device driver.
diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
index 42b249b4c24b..8cd8c38cf3f3 100644
--- a/include/linux/surface_aggregator/device.h
+++ b/include/linux/surface_aggregator/device.h
@@ -193,7 +193,6 @@ struct ssam_device_driver {
 
 #ifdef CONFIG_SURFACE_AGGREGATOR_BUS
 
-extern struct bus_type ssam_bus_type;
 extern const struct device_type ssam_device_type;
 
 /**
-- 
2.43.0


