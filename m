Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6153EACD
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Oct 2025 08:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759826976; cv=none; b=ksRS0OHQdLe3UlsW1N8MlNOGH6wjxtbznbEO9Pc6B4qbCllLib/0DUGIBLCxDHDk6qkGYFn4xQi2TiUfmjOk4xoiPTMWQzWRKVY1oQwzMQ5FkgRZ5qe513ENk0o3ZqBUAtqymwjqc2T3rilvlx6YNQmPvaSvSTIXO5SkFNG35WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759826976; c=relaxed/simple;
	bh=O3L/XZLmC85gR/d/1Hy4L4WSiXPLVz/k1RQRB2/ZMIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tRwzbmZaJOmyTgIbjMaFJWvRvqZ6br0arkbsRR6B6bF9diCxPTKrlc1UXonKCGbslA0wxoqnIrGVLp42mlBPg2CdSLCsYd1+CvRTgEXl39mx/o+P7MgDoOY6Q/PuL088YU8S5bEVeSM8iHRJz94vI/Q+7B6Ytc7qnRKUyAK3Mfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=QzBpcbA+; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="QzBpcbA+"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 527973F6B5
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Oct 2025 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1759826961;
	bh=E3rtUFCViqdZZ7KrmRGr1BqhyEbALN31u16UVqI8Dks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=QzBpcbA+EmJ0URay+XUe9ydnW8Z9JV8rfflLusjJEia2i6N79V91xBijtNPk32o72
	 FThTQmmhlimf/tv3rZMc8vtdXpAbTDNq1R1FRfmA41z2w0l4Z5n1SgzE3/IBwvmPzZ
	 io38OxoCpi1PqGBQrupuUj8zqw4r839w7PRHQpg33zBhEgmE8le3NgQOxePZNBqeBb
	 7WbtOF6i3qoNxRG5POWO3kHn1YpttiiTQ1omBQEuVflP4BPf4S7bySUyYiSwqvHyGL
	 xmvTy1oPYaJ1UloGUrYENwLh5H5qlnpCbWQrdGeJpmwGZ+eVTFHUdF2CkiSwhd7Tsr
	 DrdmRcY7zZsJt9kfc7BSJbuOwP9sbZ1SKm8tNxHlsCX2/DizWq1xkNZTS3fcgHusJg
	 wNyOOJsU8vticThQ2qTdwiSFPQwxtvKK2WIATuqRczacJAb+BRquW6vQqnQBbIwSow
	 uBTDoXvCB/5MzhW1LfyfIt1rpaWxbyevMdisTlJa7EpKMOcTqGs9jJbvetmmVNIRtf
	 VcnwacL8E0ErYpZ2upePAlK+6jViXR7I+hkZS9ASlyccV+udr//lGO3a71PIDEeyk/
	 IgCx9BYrDmG7su0rf+QgMDDNcqNpmEdEwhgkpxaMoO2kvEwBJV5EMCdMkjvNTIdnbT
	 VjGIgSJkIqdTBT21ueAyeZyM=
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b609c0f6522so10132534a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Oct 2025 01:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759826859; x=1760431659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3rtUFCViqdZZ7KrmRGr1BqhyEbALN31u16UVqI8Dks=;
        b=JI17RPruh1TAN7Kj3w9Jn52502ElbIfzBlEugT+qFgF3FXE3/2NyyhoMF/wuw5EldQ
         CS2eNwRWYBZ51wI2OVC/LBub6XX0nYhlL+AKT8KsLuqFUpcriZnluHYr2/qIruE2ukoo
         wGjnoPgzHguY99XZAUVOeokvDmkzJCPS23FQF3cZ6wjFD7ZfIQ8H6BmwjlxqRyPzQK0f
         vv8S0tzcsuQsYiggsiIBQcbwNSXP08m6HhpbmbO1FxqOhixVkEzYedk8jl9gihXrOaBc
         XaevLWg3c7t13K6k+E6njGdX2QFolxvlk2/GgUeMtt0QiecqZJ/jBBdl+VBFyczr2FYL
         +lbw==
X-Gm-Message-State: AOJu0YxPWToaEnM0BUSRcZBYcBcx/bFG7TRf5farRS7uUD6xcC6NMToO
	+dTf/CAlSb2qTWFLJ1cvRWZwk8J4elkNR51gTSZ/cWY5tOddJzZQ3/CHzQN+9a5fk71lgncBhAn
	uuU+Qaqpr5kljObiUmFbMY3PzRUt6niCdIC/89JvB/J0cq1ksIp7MI99jFYn8U4SnUKrlkKDlYM
	OJQLjwyKHfDA0yHIYELStkgKtceQDc
X-Gm-Gg: ASbGncsIn4LIhVqi5DerctqonXxNuaS4DpN+7A0IOeb13ZI7PJqP3pjMI6I3XHuPWSp
	HNAfwwtc+vWzonfX5yqedduVcQFpZ063nnGq4RcNvFQgPyL6eb9Vw8D6bGRXrMjvJupAsLNuDCS
	QoNkSK1Do71524YPRC9Y1o9A3m6BAuMtxwKfELHPEVPuRglAZLB8r7C9CMrbLp8DrCr8Dmw3H12
	UolF+JMY/IlE4jC/WoVEXTGdGAKlmxX6KeIQMB7ddR3Nrghe8ZVKE8mfwfUXWg/xjSwL18BAr5s
	ulEYp3K5EjS329Yb5Nrz4O+//s240iwl3lkse6m749N+eIRJJ616fcJZkQGqPmYSyCoVT8/vh56
	18g==
X-Received: by 2002:a05:6a20:3950:b0:2e2:9575:3a32 with SMTP id adf61e73a8af0-32b61dfba29mr21100193637.7.1759826859004;
        Tue, 07 Oct 2025 01:47:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEECrvJ2Q7PdDpmyp1sTFSJvospJ/YBEudTkIDluWmBIkFxsK7aix4tp2yYgaYyyhri5H5Kpg==
X-Received: by 2002:a05:6a20:3950:b0:2e2:9575:3a32 with SMTP id adf61e73a8af0-32b61dfba29mr21100167637.7.1759826858649;
        Tue, 07 Oct 2025 01:47:38 -0700 (PDT)
Received: from mac.. (14-0-175-240.static.pccw-hkt.com. [14.0.175.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0206ea2fsm14701764b3a.66.2025.10.07.01.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:47:38 -0700 (PDT)
From: Anthony Wong <anthony.wong@canonical.com>
To: platform-driver-x86@vger.kernel.org,
	kuurtb@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Dell.Client.Kernel@dell.com
Subject: [PATCH] platform/x86: alieneware-wmi-wmax: Add AWCC support to Alienware 16 Aurora
Date: Tue,  7 Oct 2025 16:47:34 +0800
Message-ID: <20251007084734.25347-1-anthony.wong@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony Wong <anthony.wong@ubuntu.com>

Add AWCC support to Alienware 16 Aurora AC16250.

CC: stable@vger.kernel.org
Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index 31f9643a6a3b5..eb7c3fb6b078d 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks = {
 static struct awcc_quirks empty_quirks;
 
 static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware 16 Aurora AC16250",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora AC16250"),
+		},
+		.driver_data = &generic_quirks,
+	},
 	{
 		.ident = "Alienware Area-51m",
 		.matches = {
-- 
2.43.0

