Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C338030E828
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 10:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943365; cv=none; b=mCUMe/7YbGB33gZXtDOJlxXYkBJ1GBRhEWzakltHP6Atd2Kz/qEsJBarDI+H0K5i8G/YfxNlCQEQq4/YqyRNsrDdlOw69WU8sTpwBUKBseuyycuYtxK3LazVsdJuZ6ryMGgEWO+4UVynrysePrRS/WWFUBDbu0vhxPVIbhAFFJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943365; c=relaxed/simple;
	bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dq8e5gzeMRxEaizbTc9YKbiWTplklwCk/IY0Ux8E+tO9cbehI63Os2IKGFPQpk8JMjIDtepDENXBjJXMM640x8ktj/PKB5UC+Bx8Da8mL0//FDp8/I9eAsNwgji6imztfSevaKyKa3oLvoZDHelC7wI6iRWH27ZLV9aQPX4Lzxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XXNJleC5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XXNJleC5"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47714bb5c49so148705e9.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 02:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943361; x=1763548161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=XXNJleC5qKSNtvmIEAkGOLxGDmq3jFud4he9epG4tSDPUS/BaAsJZfI0ShwvsWT3mD
         e1oLw8ucPt7CnuwflacurAAAeUKuN42fY3PxyWX99NlwcIymhFDb1Ax99lmFTRO4U7NX
         HpRarxQaBWFbjmPe9nh1W8CQSFgxzZZzMTmVgt1+moogPtFsdG8OCz/LdzFKxNL+tFwp
         CBMvk5q0qTb+NqhtPf7I2XKuGxoXVruE0FGfnbGd+7ewGokwoZs8RiG7xpPx4oo+EThX
         K1U7EK6DxF+n0n9UwupPTaV4BD6bjnObrm62Zb4c+Dvelfu6XyESHbuvV6zcnKi5g+Gt
         M30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943361; x=1763548161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CsvFfAvlWLWUNByqNFGDgf521DahJAyf+bE64GmioBo=;
        b=rqTjcaZaucNdPDKeJXm+j1NnixSWavYDqKiDIzkEKh+ElqMvlnxe9E36AbWHZIyWE4
         qS4AGO0neYlhZgRkqAyijUFSzw+l3qBEDEjJkpo4H0J8p17ykchiYf+A8juWN8bBC4T2
         P1U4vcJ2CParz64ia+PGIz2ff+bNWplzI7zBE7w6laSREGL3NfVDfEtIMn8v1UBcP1JS
         3mud6hKAzA0B6Web/++bX88LzMWtSx7fTLnm1Zf4yRyYhx8AKpjatFo5Ovz+l6rb88pF
         PQUNjHwDVcUcxJuXd3X0zrOZwnO+OhRvuJndgu/PxjxjxIjoUDM9oLIo4EofbZ9co79x
         MGDw==
X-Forwarded-Encrypted: i=1; AJvYcCVHENcnqo/zKTDwwQmWyMG0bEim61IG/eXdDo7hiTevCQsGvaqd+1ZH8oNrOwZ5ov19h6gXcQqqmFk9gN8lhj9h0qzs@vger.kernel.org
X-Gm-Message-State: AOJu0YyhObbl2OUaEqGCHlkmz6dSascjojgGNxUPYRn0kkdZ95fKrpBa
	zFA3qLJgc2aC2jk1yS22/CNE1c6nJy4klQfeSbT52obUkMafUGeTTY7t70T2s0MgOKg=
X-Gm-Gg: ASbGncsFXMNUvVpLSh8pi0N2f2BVnTIJquvCD3yUsSWpRiZBw3ZUgxdcK5xlBBLYSRA
	+3cKanuheTKtg75m4WgzketuScAgl5PFKWVd9YRQ1DSBX9WCVA1joTewM8qhRwZyXsss54nFyI0
	Xcb/5HJS/vlK78j1/BD19SgNEFdYjrZBNbqAv1uoS/1FK5WPczsi9z1Q5uUmwDhbb4qMIeLMd9z
	Jqife0PmJLwxF275ubwHjw6CUhtAs/4OIMcr9XJNjIqbbwtSLAPRZb4MnnhzdVdHr49V5ZJ4ve8
	0bwAIysfxTsfpA5/lxTo1fDRpPxiV4brNUNbefIovP9OR9NlCrAR8rXAZCTI4JlB3X+RywMP82c
	yi00a0ftrthpOek1qU0KkwZTIFVGBXq1LMMRI1JpwATCH+NXRyRxqbLIqDgurat7jc12gToCah3
	1hVDtM17az2P1PXanLvUurkpYit2I=
X-Google-Smtp-Source: AGHT+IHAInGs1fY6MhYk+BOaIQN6jWgnuAcNUMCj8asWuYpXZLP7gT6bSs36V8+DqD/oHKzLuMjE9A==
X-Received: by 2002:a05:600c:458d:b0:468:7a5a:14cc with SMTP id 5b1f17b1804b1-477870a634fmr13473095e9.3.1762943360967;
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:53 +0100
Subject: [PATCH v2 08/11] platform: surface: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-8-d46b72003fd6@linaro.org>
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nbwVZd1B/0VhFu7wCpDEX+Xq7qXUW4QXmwaphM2p2IQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFqdZoAVmnIlbNdcg1Y+7nkfxGC6i0n15Upq
 K4jKAztwCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhagAKCRDBN2bmhouD
 16TrD/9AMI5SrOqJWRLQ7jKUbUsOysXBLyuiMqQn38xIXkce16vSkar8aQIikXJi255w8BCbJN5
 XpoXeQslytCRS2CvSCYzSnwLKm2jyAZ/UJ1eYLlbnFgA+bS/tLQ+ZxexHjt9zLRFy5y/asoQ9P5
 T9ql1bh7o1gtWYg/4FFEWUimNr9blWrvDirnEFXFokhYDjS3gC7o+PuR2zOwO1cDK1KeZJJNkxN
 4siZTPlGWjvimJMhb9MFFIaD1FGMjk8Oo9RuC38wtEQu+3Qnfv/pidmsMkt9EOEP0qyuk39qX97
 K0bF8PhZ0HlmSGHSqBDDnZ7h6TT47NdxsBFm6VztA4UBwafUt0laGgFVTbdjsPh9eLldIzc6gX4
 qd98n+HB0L0CRvu5lEA4fuApN250SBVNphKHTRCHH4rvm+c92d9Rviz27WVVP6aXK0lXrLRvuSQ
 a/h5NgHZvUsRgGR6F+KsWkKyMqs82BCAQMm3hAXYKGAHaMWvvL+CBlqoakEF16kOlukPZ2PeyBx
 +LBG4qy8sQRRamg1wPYLUZkGifRetG7z45hjdPYQwpEltgLy0irZZM9ct+2IGITcZjmMnULegw4
 nTMQ+fbC0RPtlIJPjVmVA3X+PhxBpo1um9dL60Lwd6bft0tS+sEppobeeBlN0d0Kr9qBJ5OTrXg
 yG81W0MnFMi2LXg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

