Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798F651DE1F;
	Tue, 13 Oct 2026 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919631; cv=pass; b=c0ousFN/asWAejbAPEqFXP2BZY91riYjd2UaZsa6yCm+mh/JjXBjWE8UlepDWDrelVTZQZWhi7dzjNeNNe0F6sBzTUVf2wX+oO5D9HsfV+HvG4MFiZWMoEJwSgEN9iLmjI4uW0G8XIY3Z5yMJsq81rNZOOfczN+AoXjjSx6haLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919631; c=relaxed/simple;
	bh=c1efmwifO1stTw131+mH0kerfKrDGSq6CCjLjls6aNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFzPo4SHmoIrHkQF7Y+c2vWhM91+K5QAhAhsC1dDF6wZXiKuUUDabXDfuG4p+QFqtXVjx4AspGrRjl6Y5KDT6+d4L//UG1EBX/GrGzHWwMfcs3iR2yg1dV5naFIh1kirbc2QiW9N1rgis+R+Aear7IO+Tskfte+pzK7PpyvwTy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=a8+2RmKZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="a8+2RmKZ"
ARC-Seal: i=1; a=rsa-sha256; t=1791919608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VoEx71ONdEQtT9PDAy2vDDfQ55Kv0+2sCj1vY1yggwYqHMHKeugtv8Y4csY0+5Wp4TsyGIeVlLhda4rCyoRd+8A6J5xPSNGWMf1Lc6y11RX/kGN4UyyxA76zAZMyKsU1LlW4VkHb0soLio88f4n89SaYwk4cE4BtVLsJpbqENWw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919608; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ReRS4ZShNiHqof3Nd8ldDThiBg0uWWLo8oSubqtXzPw=; 
	b=QN3MuAqT5/u06WjXioiiCuNuwt9QswoJIqPPzthOPrP962rI2/SriHDMiJCigLQipZQJNHCpqPL3dVW0a3FwzD5NOGwLi9OQfX5VkbSUz3spiuXNr+QgZhUBXKWbd/HgmqZLbJU7vMngxUkIrKQaGgfK38pyW5UAhrz8Nt2KE1w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919608;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ReRS4ZShNiHqof3Nd8ldDThiBg0uWWLo8oSubqtXzPw=;
	b=a8+2RmKZ28vtv9uTCftH9ivJRonge/EoFDGkUzxtI0eGJa1H2PFaZt0tC0vOeUTQ
	KDadmXyJhmObHIR4V1brFzn3h30DBiJ5l4tg/hUXaOoE1fk74cjnvebNCmHpVRecBNY
	Grcx4xZW6hm8l5DjjrfCoKCu1I16ijRQwkDtyAhwAqoc6+dOytY0L/WjIR0hjJJbM56
	RKes86qFHF4ENlNcjhTYCsDwo/6ecrUb5TJkL8rxYVatXEAsSrcu9IZSGVB1CxVRbQL
	JHuWoguRsMnTpT8WrTz1mDIOwzI4tw9HLI8JSle81uKNW8IhBtlF5ebNTmEQurk+vXe
	m/zcxI3kGg==
Received: by smtp.zohomail.com with SMTPS id 1791919603598555.5407710219861;
	Tue, 13 Oct 2026 12:26:43 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:44 +0800
Subject: [PATCH v3 01/12] platform/wmi: Introduce wmidev_exists()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-1-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

From: Armin Wolf <W_Armin@gmx.de>

Some WMI drivers need to be able to detect the existence of WMI
devices matching a given GUID in order to determine the availability
of optional features. Using wmi_has_guid() for this will not work for
WMI devices that cannot be used with the legacy GUID-based API (aka
have WMI_GUID_DUPLICATED set).

Introduce wmidev_exists() that also checks WMI devices that are only
available to the bus-based API. Also mark wmi_has_guid() as deprecated
because only WMI drivers using the legacy GUID-based API will continue
to have use for it.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- New patch in the series as discussed at
  https://msgid.link/83776200-4A60-4756-A99F-D5A3BB4D834A@rong.moe
---
 drivers/platform/wmi/core.c | 33 +++++++++++++++++++++++++++++----
 include/linux/wmi.h         |  3 +++
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 529825dcfbfe..a99da9b7039d 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -145,7 +145,7 @@ static inline void get_acpi_method_name(const struct wmi_block *wblock,
 	buffer[4] = '\0';
 }
 
-static int wmidev_match_guid(struct device *dev, const void *data)
+static int wmidev_match_guid_legacy(struct device *dev, const void *data)
 {
 	struct wmi_block *wblock = dev_to_wblock(dev);
 	const guid_t *guid = data;
@@ -218,7 +218,7 @@ static struct wmi_device *wmi_find_device_by_guid(const char *guid_string)
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	dev = bus_find_device(&wmi_bus_type, NULL, &guid, wmidev_match_guid);
+	dev = bus_find_device(&wmi_bus_type, NULL, &guid, wmidev_match_guid_legacy);
 	if (!dev)
 		return ERR_PTR(-ENODEV);
 
@@ -800,10 +800,10 @@ acpi_status wmi_remove_notify_handler(const char *guid)
 EXPORT_SYMBOL_GPL(wmi_remove_notify_handler);
 
 /**
- * wmi_has_guid - Check if a GUID is available
+ * wmi_has_guid - Check if a GUID is available (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  *
- * Check if a given GUID is defined by _WDG.
+ * Check if a given GUID is available and usable with the legacy GUID-based API.
  *
  * Return: True if GUID is available, false otherwise.
  */
@@ -821,6 +821,31 @@ bool wmi_has_guid(const char *guid_string)
 }
 EXPORT_SYMBOL_GPL(wmi_has_guid);
 
+static int wmidev_match_guid(struct device *dev, void *data)
+{
+	struct wmi_block *wblock = dev_to_wblock(dev);
+	const guid_t *guid = data;
+
+	if (guid_equal(guid, &wblock->gblock.guid))
+		return 1;
+
+	return 0;
+}
+
+/**
+ * wmidev_exists - Check if a WMI device with a given GUID exists
+ * @guid: GUID of the WMI device to search for
+ *
+ * Check if a WMI device with a given GUID exists at the given moment.
+ *
+ * Return: True if a matching WMI device exists, false otherwise.
+ */
+bool wmidev_exists(const guid_t *guid)
+{
+	return bus_for_each_dev(&wmi_bus_type, NULL, (void *)guid, wmidev_match_guid) == 1;
+}
+EXPORT_SYMBOL_GPL(wmidev_exists);
+
 /**
  * wmi_get_acpi_device_uid() - Get _UID name of ACPI device that defines GUID (deprecated)
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
diff --git a/include/linux/wmi.h b/include/linux/wmi.h
index defcb624a7e2..3dd223f2ff18 100644
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/device-id/wmi.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 
 /**
  * struct wmi_device - WMI device structure
@@ -83,6 +84,8 @@ acpi_status wmidev_block_set(struct wmi_device *wdev, u8 instance, const struct
 
 u8 wmidev_instance_count(struct wmi_device *wdev);
 
+bool wmidev_exists(const guid_t *guid);
+
 /**
  * struct wmi_driver - WMI driver structure
  * @driver: Driver model structure

-- 
2.55.0

