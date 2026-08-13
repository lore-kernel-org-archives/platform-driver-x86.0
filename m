Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85448CD7E;
	Thu, 13 Aug 2026 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636242; cv=pass; b=Y1UOKkPJTO43BcdFq53r7z+rAwvJqYlFHvp0usoYnh980znRCryhVFiGREIPHkeqhbomByWZNo/Be+OrqcZGWTY68Ny/yG8qdfY7Hn31LUdSoqHrhvebdtFKXN6GNqyzU+oqLP6NXEmDf4uG+UVXoHW8boDx/XgFlMGF3iTfOt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636242; c=relaxed/simple;
	bh=IQbNlXnmPz8QS/645Z1BAHq6NNvqgyw4dDa6G5/bn1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LLveZYwYqA/uR9f+C7v8ZAltjInznUNmmvVTaQW085W9UNtKnr/yTuXRgxON03lHdoVHqgmyKuONj9Ok4wjkNrGSgMvXur777BnwuX25Cv0gTlNp8tiSIlCcSzqQWg801/ZO0zHizW/r+KE+PCUugkEaDE9OnGGv9wxKMldX3/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=Q/1EvoLS; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="Q/1EvoLS"
ARC-Seal: i=1; a=rsa-sha256; t=1786636228; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bNrVJBRKTGjqHaj8+4mUX9kLcEeqi7FU9vGcs0XbpFHmQN4db2jjGEPgeE1TyVZrItWY/oSGUbjGqPe3irAFYZfse3BzVJUok/ASxh/2rJju2vt0nu6zS3+8ZpWclLljUNIF4OcCmiRBESQuWWE/kXds5Xxi1BfFEAV5s7JFfio=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786636228; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2KQE1Fw0255yIT2UhBuDcZkYb/mo5K+9KEF4Buvezeg=; 
	b=PYh/jtO8LW97q0t9iKGqLOFsfuynSReUzWZhBM3gD1nW07i9oJoprHHtXlgk3bxtLGXgTDaYKtnhaoDSWziH6IWI19fXrhwwyphQHoHF+G2fRKb5mp/amPg9gAnOlH/otPh1lT4gUWkWNgsvxxXVIh39w6mrAlt8UIEhnmAZUo4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786636228;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=2KQE1Fw0255yIT2UhBuDcZkYb/mo5K+9KEF4Buvezeg=;
	b=Q/1EvoLS2N83+BSA1J7RfY90HNgRsvqjxld36iM/lHLGEvyNerM0mTwPk9vPsedI
	HpLJpY46LEnEY3/okxs/1zAKXxoQ+PlrqvSzPI/TfFfhAU+c1NgXSQkkfpI8weV6+R2
	SYOexhhUpCTMzs6Ge/hVr6nKPAqyDnlMUlmE1tt8=
Received: by mx.zohomail.com with SMTPS id 1786636224809995.2604596570251;
	Thu, 13 Aug 2026 08:50:24 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH 2/2] platform/x86: acer-wmi: enable hwmon on Aspire A315-58G
Date: Thu, 13 Aug 2026 19:19:37 +0330
Message-ID: <20260813154939.9850-2-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813154939.9850-1-moh53n@moh53n.net>
References: <20260813154939.9850-1-moh53n@moh53n.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

The Acer Aspire A315-58G supports the Acer hwmon interface and reports
CPU, GPU and external temperatures.
Note that the GPU temperature reports 0 when the Nvidia MX350 GPU is in
D3cold, but reports a valid value when the GPU is in D3hot/D0.

This commit enables hwmon for this model.

Signed-off-by: Mohsen Tahmasebi <moh53n@moh53n.net>
---

Tested on Acer Aspire A315-58G (BIOS V1.35).

With this series applied and MX350 GPU in D3hot:

  $ cat /sys/class/dmi/id/sys_vendor
  Acer

  $ cat /sys/class/dmi/id/product_name
  Aspire A315-58G

  $ sensors
  ...
  acer-isa-0ace
  Adapter: ISA adapter
  temp1:        +57.0°C
  temp2:        +50.0°C
  temp3:        +56.0°C
  ...

Sensor mapping:
  temp1: CPU temperature
  temp2: GPU temperature
  temp3: external temperature


 drivers/platform/x86/acer-wmi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 83448561189..d251752d51e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -455,6 +455,10 @@ static struct quirk_entry quirk_acer_aspire_1520 = {
 	.brightness = -1,
 };
 
+static struct quirk_entry quirk_acer_aspire_a315_58g = {
+	.hwmon = 1,
+};
+
 static struct quirk_entry quirk_acer_travelmate_2490 = {
 	.mailled = 1,
 };
@@ -639,6 +643,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Aspire A315-58G",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-58G"),
+		},
+		.driver_data = &quirk_acer_aspire_a315_58g,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer TravelMate 2490",
-- 
2.54.0

