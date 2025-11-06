Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413B357A53
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 19:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456114; cv=none; b=QMDnhvc/Br17qT6m5Td8fDnOXF3ugVnDHRUzHCwu8K5zgX7ypTu9pXdktTMaA8iXVhh2RlQFRyNbP/4xjTWw3/uglJW8ZMYkfZcBjKjBTrJxZ1mFu90FtROd7w0Gc8U7OUlDvdAzX4vl2W9MTbxW5EGi0wYn/7M3B5kEKZfwb1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456114; c=relaxed/simple;
	bh=u7YvQdbfgeK3r2KrWjEjECrNLAFFKQw+0JuX/tEQ9/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNWzrAkKceqYmcU8LN2CWlvGpxJ1axmW6ox0j3lun1QH9C2M577hv5nF3f4VsKmvO5FxBt50TZsTyzL0kBfhIw+qweEyYSRgNHxDngFNCBfQAVshrzGrp8jjJBl8OvXpHALeb1ZNgmAxgbOMn/jkNuZ7sTa2i1utz2zc1pdG+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LofBvCnN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LofBvCnN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64106cfa518so236346a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 11:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456109; x=1763060909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0wRqNZjDhxKoGJXV0usfDeV7Mj3Zg6leQf7T0uY07Y=;
        b=LofBvCnNiQGgw83Vv/4su4NPD/N/BEqeQx7uP9pOS+2YxD6BweGYbq7Kus/TBmiT91
         qdWLAEfOHfEveYqt1uqQyLTd1Ulp1E7SmRFnOSMz2dgvAacUAfM7n9npOtCHl+QCuaJR
         LToQcGQ0/gOI6usP5yQz/W+VEJgsdtQslQQEmVkLo9V3icIbziAZC/5A331pQt5bAilY
         8GYWegdMOB878kFQVNw/09zvTLmRmTrbq65EQrExmZ68Hwscpq31wSwPW1/7kMo7Py5q
         AtyRyKxCM88pk8uhTSqj9pMoPe2UhEnc7A1LJFXdhmHnT2t2C3tMUS5DW67LPWZd+Ifr
         d6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456109; x=1763060909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/0wRqNZjDhxKoGJXV0usfDeV7Mj3Zg6leQf7T0uY07Y=;
        b=szHkTJi2EZE1+V+czOWYZGgqahds8pC23ikeOoOdc+OZJwYjGkZH8m7UM5pgwU5lUh
         Z4+pJUA4BmVgSEZhNlRM19WrNVaM+XfD7PD0FrY3ghAug5T/NinaUJ/tRDkX7jiRyFQx
         0TrpBhhNqewmqeQFTk+J/vIdF9EyHuAWB3WRCiXMl/xIwO0wfqRj3pITfsYI3aAMoIev
         94iA+Qkscnp0xWaXbwt01HG2kxwNzzUhR4ax03cXl8i8QEqmhEO8wOmZNKrg6B3iVgRU
         +o8qlpeFTNIvNhnmcJsw71rvKPAEnxziUMCuPHtOUlxB2Bqbig1EQGY5nepTu1WXtbp7
         w+fg==
X-Forwarded-Encrypted: i=1; AJvYcCXb3nVIofSkvVbuhyiL9+PZx8Y7EgONH3UicyVhQrA0uMfV9WVT9/TVmU0dLuYwmObSqvtsqrdAY45U7BRtLhi5Mf76@vger.kernel.org
X-Gm-Message-State: AOJu0YxrtP96op4NJQZIKKzpDRkH6dBUWoIYX8SuajEoj1fsWsa7Wz6G
	A8q39cdJvEz+jsVR2WtO3Yvy6loxUcNpUBAjQteCwT9DTHn0JglmoVTXiwNll4GiHtE=
X-Gm-Gg: ASbGncsH7Yje+ZR3Vj9edwmePZvGRMNZanKsENMeRHgSX39LsTN4jPSCWLD1iJrG0wx
	wzgDBwMJ6EHMGWYII/3XcGM7PtMNvKQ0FSaWzUwR7QW5p34Ncuws+c+cY/OfgvzZJbfLLoRbcql
	VCU8ETxOPL/2HDCF1h8bxXxNEpE5RE4bfcBo/J/Fk9S5kjPiejmeFet7DU+KB/P1stWQ1ioni4i
	cA7bod7x5SHs9/NSJPG8HoHgrftLXgngpKs0EgFVgLU4IPIQIuvicmz+ktXYYX0NCyYwPAqw5tg
	O0BCrAAqrUxB1wFp6U9NRP1RxClu263tNwRLP9Lrx5gR2IVfDx34xbJKE0ZSL7X14HK10KPkU6v
	BxPDDrMGMlf+4aiEk+Icn+hFsYNPISK/GzvqJ7MBKWw/0P5cdsgImXUxOZCYfY/Baemwtl2T8sV
	0Wvl8dyMgzFTVLd5GdD6gaXP++1L4=
X-Google-Smtp-Source: AGHT+IH4c9+FBzEsbksRLPluAEN5Q7bHrM/fI2f7vZ+JiCnXsA9u+zTGILggtvCf5W5Ec2dC2M2+Eg==
X-Received: by 2002:a17:907:7b83:b0:b71:a627:3d9f with SMTP id a640c23a62f3a-b72c05a79b9mr18769266b.0.1762456109330;
        Thu, 06 Nov 2025 11:08:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:16 +0100
Subject: [PATCH 09/13] platform: surface: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-9-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u7YvQdbfgeK3r2KrWjEjECrNLAFFKQw+0JuX/tEQ9/Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIQS0NKG5M8Y9dtPEfNKTnde+xk+nLbIiL/5
 gZmzZeeBqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyEAAKCRDBN2bmhouD
 18IuD/485ZrsWmmctVDH8SJy+QlRAB9G6pjgkgZCsJfoEU8YNLRcSo+N5QfbZ8vq7xgBZM6GfME
 Xk34JS9iLYYgEgfFMRtA3/uM3M1U37fJyzng1fw3aPcRICCnY6Vz2mwVL5Q8MVqIof24NgdWpu9
 0SLyBUs7Py1HicjE3zHaYTsvDbZIjYGwdRam+QhhmCh5aUy3k0ee6ws2AZMGaf9jTS4N2bq0ZN5
 PAIqqjwEBcxYj80H8KlJJrvtqn2lZ8EJribf1wlTg8Tn4m0kSlpjnTWcnsDmC2WqDwlvFnBtQK4
 oy655q6F8f98COg+E2qETR7V1oUJFhMU6p25zR0eRvR5zF5ccdp7DhYlmkMrvJCagkv+8On8AjD
 plSomWDS/IUkuqmiarbHjxcG004xbozEA8J2Y0cUaQHmh3KKva+BETKxo/0StI2jpz3mHwHv3+E
 KCCYZUNAiCgbSi5vr+KWoQvUvpQfkKQpk/d1H+uNE5TxYVfj0b6dgkqxsleWst1GxTh8zfFvvn8
 W/PBbn70TH1kE8i2VP3s6UcRZAHkxmBgc4TOF3bAVQGPOhn44A2631dukvOLGyQILOlJ+3Or4JG
 SQphnIWjT7wfgFxy1m3Y8OO6FQEos0eUYYJEERoDgaUdbPafYH1GPSzBjWNn39LWsQUT6Phfa9q
 jiVezEzJwysuNMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index a594d5fcfcfd..78ac3a8fbb73 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -491,24 +491,13 @@ static const struct of_device_id ssam_platform_hub_of_match[] __maybe_unused = {
 static int ssam_platform_hub_probe(struct platform_device *pdev)
 {
 	const struct software_node **nodes;
-	const struct of_device_id *match;
-	struct device_node *fdt_root;
 	struct ssam_controller *ctrl;
 	struct fwnode_handle *root;
 	int status;
 
 	nodes = (const struct software_node **)acpi_device_get_match_data(&pdev->dev);
 	if (!nodes) {
-		fdt_root = of_find_node_by_path("/");
-		if (!fdt_root)
-			return -ENODEV;
-
-		match = of_match_node(ssam_platform_hub_of_match, fdt_root);
-		of_node_put(fdt_root);
-		if (!match)
-			return -ENODEV;
-
-		nodes = (const struct software_node **)match->data;
+		nodes = (const struct software_node **)of_machine_get_match_data(ssam_platform_hub_of_match);
 		if (!nodes)
 			return -ENODEV;
 	}

-- 
2.48.1

