Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837F2E2286;
	Wed, 19 Aug 2026 15:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151788; cv=pass; b=irfYG22kPN/dqvMdCnVgxu1gfvr1+8b1ETpQFAkoVQOyR0Pf5YRT3ORpMDP9G30M741fLpZqpF4YFhfr85PCRRRVNYJIFDZ3eRv75hMwnHx2/XxT/aRFHj7LWfuSmU99rZDUF9uZw9sPp7X6/2UUS+8SzRQvQyl6Yd4CjUGy5Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151788; c=relaxed/simple;
	bh=1zdlcDSdVfkExXAIBQVPG5DSLOfh0fmqIta9Y3+UyxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tm7WHElH5xlKXkjyJi+tLXMrDwR7HdUDjlQF7dAGiP1LJg0riY0/5ScWW42SBcypB4JkU0mQzXfKks80+/B182iIv6BO42cCJ8Y5BWJF+7JCuZC9yHCVcNIHzyhMlwKJcaaqKuB7wLBO77to2qdDi5/yUN15ElaDodvntHX0B0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=qx/BzFvu; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="qx/BzFvu"
ARC-Seal: i=1; a=rsa-sha256; t=1787151781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lI3NyIbNpgKr6kqd5esBHzu3EQCN5ah0RqCekH9DNO8+iXQJOKsm+MNNMqh1qyrw8DxhOJhjRI+q101KeFWYv4eVKjOCB39Z0YYWjwU2XtPfoqrmQ6ymSJYn9um1EpLoyFLZUZbIDg+ekqwhOV6s92LzF5jdzzYeyeShfScKq8U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787151781; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w1pIiMV0CDPT1wXtgm8CpGYvIn/qekcSsBDMkUN3DtY=; 
	b=a1uCIu6+1DDZy63Iw2PPP1Kki7YQSfh5ZprOVhoPxDGe4aZN+tJJ8qsQHP/3nz6smB1oCtEgPYNIwGoQ0f2KISb7n8QNqdccJDnCuLulsvMrwbx91/VzaQv0+MPXyTQrw6XbQMk+Jo/jVd8V5LvKC7kTEBnjjLtpZkFGK5Fgx/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787151781;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=w1pIiMV0CDPT1wXtgm8CpGYvIn/qekcSsBDMkUN3DtY=;
	b=qx/BzFvubiybJ6O2PTCjNSjZyructaSDlvxjaVdDqfVRIGwG7I1snJw/fB3lAPO0
	5EI2EvfE18JmQvOT74zQm6HGn4Cnsz2a7DZyOyOA5gh403+7lkcgyDHJngnZL1x5Cdm
	RwWWGjVPMJhNV6JYM3Tpv7gnEwyS4Zw6komBRXrU=
Received: by mx.zohomail.com with SMTPS id 1787151778736586.4064554143913;
	Wed, 19 Aug 2026 08:02:58 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH v2 3/3] platform/x86: acer-wmi: enable hwmon on Aspire A315-58G
Date: Wed, 19 Aug 2026 18:31:58 +0330
Message-ID: <20260819150205.19453-4-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260819150205.19453-1-moh53n@moh53n.net>
References: <20260819150205.19453-1-moh53n@moh53n.net>
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
index 1d1c0d3bcec3..8f02be054ca6 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -454,6 +454,10 @@ static struct quirk_entry quirk_acer_aspire_1520 = {
 	.brightness = -1,
 };
 
+static struct quirk_entry quirk_acer_aspire_a315_58g = {
+	.hwmon = true,
+};
+
 static struct quirk_entry quirk_acer_travelmate_2490 = {
 	.mailled = 1,
 };
@@ -642,6 +646,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
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

