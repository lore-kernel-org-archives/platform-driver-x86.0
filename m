Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422197;
	b=CYzcrsV2ogycaPcs6qCchjGd5TwQ5v4r4fhl3Qe25rOO7nOffoi8lzmFJ9q+3fRgKQ6K
	 j9/eUa6D27mkb9IZC9O6X63sPloIPaNby1IOrvDf+ns03fN+1OinP0/6WVsFtvYXGe+ru
	 5ZZUb2+QeJ5mMO5g9nM7SwDHJ9Eude8viF6Op6oXyPv0dGK4oOU6fmFJd9FWfZMfpFyL2
	 zaYwjnvrj53AH7Ugrac0bhxfYkYR1vsSHet+YoeC0BvX3bPL742Kss+sM2jV5pQeLEuup
	 noBcdt4NWn6hI21q5vqPUCCPMHeiXbiZhgjBYW+IC/RiKPpHayxGZQOxOJACUOqie5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422197;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=ReRS4ZShNiHqof3Nd8ldDThiBg0uWWLo8oSubqtXzPw=;
	b=TYcj3Ce8IwtulIcXUPyzf85qJ+iTH5Awj+DXddi9ESfLprpjrdc6fqzfX8pbIIHuOJWc
	 zLkLXBRTME2Dg0tZG7syeoTR6UrdmHOqBXciahTGr1TVt9VkPaWMkJsdU/u/FPcwiAvJC
	 5VSGs+sDTduR2jj53Kr4S5wkLZ/R/1CxbP9byzjMnn4Qo03Mp4BrKLUg31UX0lzBYvkE1
	 8F6O09vJPD0pmTwcocu3o002UDfESUZlwa7JoKXwbNm81S13O0xwzGJ7hoV+sHwxW8pee
	 nflyULzWaQms0AXTw2TBQZWcaAJfxWuZmWXlp+UYdFxtctCCiRtVrs7+5XmzqFGjcXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=og1VQhRa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B717D607D379;
	Mon, 19 Oct 2026 15:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B717D607D379
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=og1VQhRa
ARC-Seal: i=1; a=rsa-sha256; t=1792422178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vk5DC4eH9degSumq8VHdGQuo3n8pdRMnqCp5EOKeKajHUpCthzc/MUIkaS63vlYiJWGZ5u8GPF0lsm2nhnORFU1Z1rYMe+DmYPo4NtMJlHFYBXQWg/2GJzzfax4UYxwf5EkwE3+j41oi/u1XYqyWeLNDjT+SstinQhoQ/6t1xok=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792422178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ReRS4ZShNiHqof3Nd8ldDThiBg0uWWLo8oSubqtXzPw=; 
	b=DufN+gMns12A2ja1DISQ+zqIDRlBxk9N9PyQxq2GxmFw0/mzYph623+3z4MrOia+NozVBVHbPF560eZXX/TEafdcyI9I73F8tTF4V4HKAuIi1yQ9eNH3KdfY1zzydixlJs1KQAC7qp1e1fil2LtALNAVlu1EmnRxR1YeLHcZTNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792422178;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ReRS4ZShNiHqof3Nd8ldDThiBg0uWWLo8oSubqtXzPw=;
	b=og1VQhRaPgP5q9VWvnlWd0i8eNQu/ikTpxx5t1clhplp9LZSsEcTrOn4Wo5e0LP8
	KpI7zPIYzV2grKrKfPol0x+9JhL2uYusjPPcxquJH+YHM9yup8xdCxiXjf+hWgNKawZ
	6DsDKnqOfH7A3glCDOyOXAa3L4wBdWQ6nm+V/9ZMIZT6pYZtQzNa5eAmQbbwEiPR6uQ
	355t/xxPa+GF9t+VQQvad9r2gO1m7qJsvLMs3l21xh/yPAhsL7T937H+L3oq8UQOb/F
	d4nB2xpqF6gKDZXqkOcn9dOlX3G3+DNleCJAwaOZQdLecRyZpig7NYRFPHA5aKjzoOE
	FUlMBWoBLw==
Received: by smtp.zohomail.com with SMTPS id 1792422174220856.6185355186998;
	Mon, 19 Oct 2026 08:02:54 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Mon, 19 Oct 2026 23:02:23 +0800
Subject: [PATCH v5 01/12] platform/wmi: Introduce wmidev_exists()
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-lwmi-wmi-new-api-v5-1-71557d28d058@rong.moe>
References: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
In-Reply-To: <20261019-lwmi-wmi-new-api-v5-0-71557d28d058@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
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

