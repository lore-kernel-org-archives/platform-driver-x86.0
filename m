Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4339313E00
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 16:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702740; cv=none; b=kxqzrD3tsu2QoAdYjWWqtGvS7Fk6+TEu01cbvQ/J3QsxzQD/DdtLsKNLoAhYxGD7W1y+GwVoyeT2ykkyxRZEMMgUocDSCO1cIAXMmlbwfoc2549duH5TBvojjfEMCwJStJ2LTdLiPczNJqmm1TZujPKf4pFIjnf0HhP+87zoLsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702740; c=relaxed/simple;
	bh=j+bTpiIQ4bXllqyRJjhRGgkgaOM1L2D+fqoHRG/P2g4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YVbJbEOvveaiHxSu3aNTTnC67eS266/GvhIs2I62pIBtzx5zvyQ4MgRgh/bZARkAjQLfWPFXQUQnK8ak6LxkkpVKLPKrg+04pwhNXBctwekO76r4G9geu8qEdpU/hH0fW1Y6YqW8SHPFQ/26HbMUO44ocw7nOM+S0tbIQped+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r9SzCZey; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r9SzCZey"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783702726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Di9KwTtc1m+2gZiyfUBIi5aVLIe8i6tJV4oCMQ7EP5A=;
	b=r9SzCZeyKq6YO5s/OoOBdk3V4MLl0iwXPp6DbV/NTjKNnH8ynN087oWczU1b+f2qS5GDmV
	peEZEZBifo1fr2L4np2H5UG71Od5BiS8IuFRqB2lyz/axxhMQRx6bv9/tdhbqKVj2y0xdZ
	M8CC7FQLU0/TR8gYKcW4gdYNhaPjcto=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Travers Biddle" <traversbiddle@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-wmi: temporarily revert to setting a charge limit
Date: Fri, 10 Jul 2026 16:58:41 +0000
Message-ID: <20260710165841.59957-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

A userspace regression has been observed leaving the battery charging
threshold unconfigured, so while the fix is being shipped revert
the change keeping the infrastructure in place to return to the
preferred behaviour as soon as it's appropriate to do.

Link: https://lore.kernel.org/all/5db117b7-aad1-437f-a3d4-ba7b29fc68b3@redhat.com/
Link: https://gitlab.freedesktop.org/upower/upower/-/work_items/347
Closes: https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/
Fixes: 186bf9031666 ("platform/x86: asus-wmi: do not enforce a battery charge threshold")
Reported-by: Travers Biddle <traversbiddle@gmail.com>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index c7c8fcfc1d72..0adb5cebf523 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1618,6 +1618,8 @@ static DEVICE_ATTR_RW(charge_control_end_threshold);
 
 static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
 {
+	int ret, rv;
+
 	/* The WMI method does not provide a way to specific a battery, so we
 	 * just assume it is the first battery.
 	 * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
@@ -1635,12 +1637,30 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
 
 	/* The charge threshold is only reset when the system is power cycled,
 	 * and we can't read the current threshold, however the majority of
-	 * platforms retains it, therefore signal the threshold as unknown
-	 * until user explicitly sets it to a new value.
+	 * platforms retains it.
+	 *
+	 * Setting a negative value would signal the threshold as unknown
+	 * until user explicitly sets it to a new value, however to avoid
+	 * regressing userspace, we initialize it to a value of 100.
 	 */
-	charge_end_threshold = -1;
+	charge_end_threshold = 100;
+	ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, charge_end_threshold, &rv);
+	if (ret) {
+		pr_err("Failed to reset battery charge threshold\n");
+		goto asus_wmi_battery_add_err;
+	}
+
+	if (rv != 1) {
+		pr_err("Error in battery charge threshold reset\n");
+		ret = -EIO;
+		goto asus_wmi_battery_add_err;
+	}
 
 	return 0;
+asus_wmi_battery_add_err:
+	device_remove_file(&battery->dev,
+			   &dev_attr_charge_control_end_threshold);
+	return ret;
 }
 
 static int asus_wmi_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
-- 
2.47.3

