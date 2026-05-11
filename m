Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF4B47276B;
	Mon, 11 May 2026 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778522470; cv=pass; b=I5b3BksOHCmvnwIpiIwEWBpCYF/DmU5LR8WvbwTAGuEBBbzBjOn54iWcPr2Ex2nqxgYhB/ILrGpMBY0FfwU3K+ITd1s8zzCv+F0ie4fTBsPiBvIk5u+cNPmbSOXJmo1L+TAuuuvrwhV+tHjcHZlutDzplXM+IAeAh8MSeY44vXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778522470; c=relaxed/simple;
	bh=L/WkftEEMpWluyWbKIYnGm3nT1IgGCeudTMsUmtywQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AWCG2A+8syytmtO2GhRgza2EF3KJAOZoGMFQSIdIkb4HqX92NY32IE3+IMXnTAXxxYcFtyiQ9MsTNX/UR2R0TYtcsXqge87v/KFRYg9tLNYiWsGRPpCY4NN6AySv8BMyB4bXlEyq1aAVsiWERlmJbQPdkm7h4gzgA/oeEs6tJJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=AsG5cu6v; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="AsG5cu6v"
ARC-Seal: i=1; a=rsa-sha256; t=1778522462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b+354lyEb8Zffxcx/8Ay5BRL7PK2xSFI17VGKvl9eNqP3ry2to4j+zYASr2DK6U6Gsylbnd88XqePpOcq3wKTZozwjlvCDR31z769VcJhaSbEXW04AI78Y1SqxPbxhyNXD9DQDASMhO1vJllf5M2t9zsA05KLzT7zAn1Zmh28AA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778522462; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4R9WxN8Fm+k0Bq5kbv6pH39sM9YXRT7BbUngrQ8pnxY=; 
	b=OhwteSQLPkJ1HVmh+kGD7infD1ws/KcQOniiUAXJgHZ3NYlt7RcGtzxRk75437FrYIG6b5xs9aynd2pe6Vqni9WAHoapbtzPYN15zi67eKG34MXLLCkRyYv3iVZ9w5LqGETloop+DM9emIEC2MyuoNJSa6bN6opIQ74qq3U4tT0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778522462;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=4R9WxN8Fm+k0Bq5kbv6pH39sM9YXRT7BbUngrQ8pnxY=;
	b=AsG5cu6vnHRCBIP3XIGog7yh2U44LKjsBxRqguiKQDMhoYwKRd6rg+qQW+8YWlJg
	r0zHSDVjlCjWMc8+4A8FlWdcd19ukHLpgUFilDL8ILmvCTNbdYsfh9OWge2R0+WVsqM
	CY/NWbctswBSzUqLT0mERlvpNVqo5hu9ElM+ILHojxQtMTNnLAcFUPv0lo4kUj0+F8C
	NMKglBTt8iECimDdn/EfYVvYPuy6zsiXKA6LDBcPtIXIzNuYIiy4ecP483qyrT9aQvn
	SKX+edgWFOkeEEv+Q2g6c0y8mmTpx84yrH51dOp6iqEGoO5D92n08OWzRhCGNKPnnyT
	MBU8cnPavQ==
Received: by mx.zohomail.com with SMTPS id 177852245995748.963904823614826;
	Mon, 11 May 2026 11:00:59 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 12 May 2026 01:59:34 +0800
Subject: [PATCH] usb: typec: ucsi: acpi: Disable on devices with broken
 firmware
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ucsi-acpi-broken-devices-v1-1-0f8cd90c35b5@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAUZAmoC/yXMwQqDMAyA4VeRnBdIKzq2Vxk7tDHbskGVRkUQ3
 91Oj9/h/1cwySoG92qFLLOa9qnAXSrgT0hvQe2KwZNvqXEeJzbFwINizP1PEnalYjHkWx1cE6/
 UEkHJhywvXY7143napvgVHv8/2LYd6qtEVXwAAAA=
X-Change-ID: 20260512-ucsi-acpi-broken-devices-c93a15b70600
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External

Some Lenovo devices have broken firmware, which reads/writes half-valid-
half-garbage values.

While executing UCSI_DSM_FUNC_READ, the firmware repeatedly (> 20 times)
calls a helper function, which reads and returns a byte from the EC, and
then copies the return value from the helper function into the UCSI
buffer. The helper function internally acquires a heavily shared mutex
with a timeout. When the timeout is somehow reached, 0x00 will be
returned. Unfortunately, the return value is copied into the buffer
blindly, leaving a half-valid-half-garbage value in the buffer while the
method still succeeds.

Similar for UCSI_DSM_FUNC_WRITE, in which some bytes in the UCSI buffer
may be silently left unwritten to the EC but the method still succeeds.

What's worse, race condition could happen since the mutex only protects
a single byte read/write instead of the whole method.

All these issues lead to a lot of UCSI errors upon power events, e.g.,

  ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
  ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-5)
  ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-5)

  ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)
  ucsi_acpi USBC000:00: ucsi_handle_connector_change entered without EVENT_PENDING
  ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONNECTOR_STATUS failed (-110)

Given that everything is broken, disable ucsi_acpi on these devices. The
impact of disabling it is minimal, as Lenovo laptops usually have most
USCI commands more or less stubbed, and the EC can always handles USB-C
events on its own.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221065#c33
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 91 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 6b92f296e985..7632b441d401 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -155,6 +155,91 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
 	{ }
 };
 
+static const struct dmi_system_id ucsi_acpi_broken_devices[] = {
+	/* Firmware reads/writes half-valid-half-garbage values. */
+
+	/* BIOS: P1CN??WW */
+	{
+		.ident = "Lenovo IdeaPad 5 2-in-1 14AHP9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83DR"),
+		},
+	},
+	{
+		.ident = "Lenovo IdeaPad 5 2-in-1 16AHP9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83DS"),
+		},
+	},
+
+	/* BIOS: R0CN??WW */
+	{
+		.ident = "Lenovo IdeaPad Slim 5 14AKP10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83NJ"),
+		},
+	},
+	{
+		.ident = "Lenovo IdeaPad Slim 5 14AKP10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HX"),
+		},
+	},
+	{
+		.ident = "Lenovo IdeaPad Slim 5 16AKP10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HY"),
+		},
+	},
+
+	/* BIOS: QXCN??WW */
+	{
+		.ident = "Lenovo Yoga 7 2-in-1 14AKP10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83JR"),
+		},
+	},
+	{
+		.ident = "Lenovo Yoga 7 2-in-1 16AKP10",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83JU"),
+		},
+	},
+
+	/* BIOS: LNCN??WW */
+	{
+		.ident = "Lenovo Yoga Pro 7 14ARP8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83AU"),
+		},
+	},
+	{
+		.ident = "Lenovo Slim Pro 7 14ARP8",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83AX"),
+		},
+	},
+
+	/* BIOS: PSCN??WW */
+	{
+		.ident = "Lenovo Yoga Pro 7 14ASP9",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83HN"),
+		},
+	},
+	{ }
+};
+
 static void ucsi_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct ucsi_acpi *ua = data;
@@ -181,6 +266,12 @@ static int ucsi_acpi_probe(struct platform_device *pdev)
 	if (adev->dep_unmet)
 		return -EPROBE_DEFER;
 
+	id = dmi_first_match(ucsi_acpi_broken_devices);
+	if (id) {
+		dev_warn(&pdev->dev, "broken UCSI ACPI implementation, disabling");
+		return -ENODEV;
+	}
+
 	ua = devm_kzalloc(&pdev->dev, sizeof(*ua), GFP_KERNEL);
 	if (!ua)
 		return -ENOMEM;

---
base-commit: 5d6919055dec134de3c40167a490f33c74c12581
change-id: 20260512-ucsi-acpi-broken-devices-c93a15b70600

Thanks,
Rong

