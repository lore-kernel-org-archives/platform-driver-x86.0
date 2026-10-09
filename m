Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29204D5996;
	Fri,  9 Oct 2026 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550488; cv=pass; b=nVjfUcmZYIUaHhVCnZl/Gd4A/fj/2lzswb/S42vKk6C1R74w+7LwpUJO2zkRUNflkA/ATlGy5Oh612WO5t9It28gnF4WW9WlHzEXykjNjr+emsLd+vsKUbip5MHUhiBTYSbqKjRIjpH0oPmYCgKMYJEGI6cQCmgpixmEtda/sb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550488; c=relaxed/simple;
	bh=MD0b4ZFQ80ZroFvnJWg2GqeovVgIEFx9KgL6h36wXBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IUJGfLbfxrh8Q+xA0l06jY7LdiAuLhekp5ME//zu+zcXQGcKwsZJgem0fRJNb/3e1F+SsMP5FFl8mGudsgE0CdvBSgDMkJw0fNNg/teEX9e1rMu+DF+XZqQXSB0h1qnzY5OjllNUXCHqxb6IZYV3jadpqTCCwp+g8j+em3FUHds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=H3rOsbdH; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="H3rOsbdH"
ARC-Seal: i=1; a=rsa-sha256; t=1791550463; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZsLo03RBE8N7dbz35GFtegr7Ebl4nOSZyBV4HXD7soz1N3hD49QFhJnFUUk4TPHzs0xCketCgirpoU19zyI2UFyj97jKd8af8Mst5nPLZWyx4cQYxcOfJEo3/QmekiXAVjCb7Gg6oPtlFBYuE9sQgvw1HZNUNz9zxRH5So35TIA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791550463; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KT4VwFtpPIKtNydAaKnxPFKacLY64KvaoRGWxk8mbzA=; 
	b=a4lplizdi1L3DfMKaJXNGYPXOLZx5y+1B0mrFbsSxMm6HY9FKYpeYUbrLTBNpaHMX9xxhwg6jeCsWKOn0d2isLxxlzXOM42LbEFm4unGxxqibgPDUraOAjB0bV5R0MPh+kWyHUVxlgxSJRoEHVuYL7tvO860ypuOEY2lkqja8iI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791550463;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KT4VwFtpPIKtNydAaKnxPFKacLY64KvaoRGWxk8mbzA=;
	b=H3rOsbdHON6kbsA+QSDjNJ0NTPhxtBm2LNMQDs/8JxKfdpfPuS8aYfePwhyfUjAb
	t25y4CMUHEYxsqHN0F5f4nVqT3fOloCnueaqjxLJPbyDg2rz6ziiAHvUfMpquWkBGoW
	ebMATvhjaTzVgl4w0HORoXIxaStBe+ZOc3DEbAiV+dtLMDEfN5lS+Fcb2+clKTZs9ak
	yyHNjr+W0rlSlfMeRusTznUqKfcRKksFP/0tSYdfVvuIldXCBB9M9Q+oSxBEKy/hsRf
	m3FNgpO6ZAVM6b3buKR70+v8YgVKA20tiC+lumBeQRyDAGkb/YLCbZdTxiYzEFutDuC
	svg6oe3cmA==
Received: by smtp.zohomail.com with SMTPS id 1791550462601176.74875808076922;
	Fri, 9 Oct 2026 05:54:22 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Fri, 09 Oct 2026 20:53:43 +0800
Subject: [PATCH v2 01/12] platform/wmi: Introduce wmidev_exists()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-lwmi-wmi-new-api-v2-1-402828382679@rong.moe>
References: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
In-Reply-To: <20261009-lwmi-wmi-new-api-v2-0-402828382679@rong.moe>
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

