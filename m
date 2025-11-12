Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBE23081AC
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943357; cv=none; b=FoHpXvjjhGRChMJ289Lc/YqMryg+WNZHsKzFghkTz9d+1R5nubX79k97lLtF5VgEH8eJstCQf91sE9eona/G4wdAA+fERzTgMWEDM7Fv1vWi4YZN6da8T1ZI9rMwTeWwnxTG4rvl1ZzpmFk5ioWwA930ddbXdoJ7xWu6S3q3O5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943357; c=relaxed/simple;
	bh=NtaVRn5fOdSnDL05sWEjwQYKJh+onKYC0wteYH9Ybhg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0CoKDIXUKkNIMVDUDJvvqCUyAeqo+VvNuRp14Y6BCYIjHyWx6jfv2cZ+fybZ5oK4TF69d1WaUEHfDDz4L7Lo/LCndOyLT+H6UZkKwD2jxWbe1TQwQH4LzvDIsvIIy5WiQSrBWz8fYlpaT2lCqf02DDMwYeuAA/P7ANVkMrD69I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VNPLOnAT; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VNPLOnAT"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477774a878aso168855e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 02:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943353; x=1763548153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=VNPLOnATZbtR6f9w8LW5AUXK1f+iEPZjtetGuCB5NC0u5PMKEt8cO4I12WdequMuCp
         nLK0BGxU/0Jz6LhUHKXUNpmEy58PWztDi3v5eCHtuhqnijSUd1Fbwz0OfeP6KpVSyBwz
         hueXCtboPLrNhUB8izlSamSAJKIGOWGueeSYHbyLmMuUKJLzUgIX0A0epCfic5ya5Ts4
         I25fMcpvbezomqD5NxCP6gPhj3BxA9tzZa31oEKpTyujOJskdcbfugBlZsXHNRWfqkaj
         n5vLh3ICMTJ//hhwfVfKNT2CsKo189EK7ztyyq5gEmR/DtIAHZPO80u32ZGeqazZh5uW
         szlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943353; x=1763548153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3uEWFCapL3xuNBc2CPMG4t/kBRPzDDIx7Zzq9T/LZFs=;
        b=vPZOtz+RPSrFrQBEWJZxI/iUt4hcOkg/n4AxGSLtVUrfLVPphKh8Xq7LZ1Wd8FcvSw
         1g4ZoxQ0bQTm5z3RA+BCQghWzbJLRC2vHyjp2K6FEYYf+DDJtUbYYQU2BhFejO5RJ0o7
         FYX3D4htKBULz33U+JXDU3vSp4UZ/gCjNtxqTC72mgYQ2Q45GvqH9sUAaJzj96wryhSC
         bZa+ooUihGO3BQNZzcTwPHkmvHcZLgE4T0h7XBRT6+giXNhioP/EunlXD72E4O3n85j5
         QIHG21IvuNWP/eAUKJ1QsuG5kW9eeBRfzFz65Am2BriuYh2I2U9oqyGv8tDECi6I5oaB
         USVQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5/q05dg04Fe8fcNjUuICH76A2lq8m2nQyXObpEJS+aEJgtph+xbZYdrUbj37UWeqjq1y+GabRVdLy6xNSBN/6U1QS@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz2Fsofsq5Zxe8ZWcqAV4Dsl0GZIoyoRmhDLmBxfLKhXuPAeDT
	LKDGbQojRdNlLTrzUJsW2d5+j4PhM6ZwxKX8KhpaiI2M1fUolHyjqmTBUR2egnoqxcM=
X-Gm-Gg: ASbGncsIccC4+gj1Dc9htyb2H98HX6M4GhhHVeqdjiz+rbxfshMYYWlUNYQca3xKba8
	Jj72owi4LZozdluF81mLFqOucpt8NrFVR92b4iTyQeiwqBSAVwv9FdtzH0OX1CVyLOlE8eaDiz8
	BnOEi0Lv2tPypsjfk0ALa5PcILL7stZJ59/ulr1fpzwZ+npJxeCDinsZ96pPDpkiowPAZJatemf
	vGtXDcizCrKVTI9X2ZXixWvdfvKxZMtFc2UHO3Xlozp1MMA4DWqJuF2MGSWKkQL9p1FYBeldAj2
	hNJHSzMy1Gki/ZvpnQw1cIRoUPo0GCV0PZsiY3NQO8kvOWTt4eynlyUPXuFuQNWK1MBJdu8XzIB
	QKBHHxro0YZItaI5MArunt1o1QGt+s0xB+fcnmUeV5ytRtJkSZgvqCFFTVXWWRPWGalHzEC0HAQ
	WSiXa14Z/Z9/n9OBi9
X-Google-Smtp-Source: AGHT+IEZxhWPWikCbrAnGfoelUubQn+zumXi8NTKXDPb/rrgk5SQKq+1ZC5MQQVGOw/Dnv2a3nat5w==
X-Received: by 2002:a05:600c:4fd2:b0:477:7ae0:cd93 with SMTP id 5b1f17b1804b1-477870b44b1mr12471145e9.5.1762943352640;
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:49 +0100
Subject: [PATCH v2 04/11] cpufreq: sun50i: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-4-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NtaVRn5fOdSnDL05sWEjwQYKJh+onKYC0wteYH9Ybhg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFn6/m9j+vXfhwgQcvMShnjjZfSHkT4opZZX
 DHqGi3TBpSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhZwAKCRDBN2bmhouD
 1/86D/9xLSU8geMKbGZqQqq+gpYJEvoD+GGEeh6cjW5htbTvlWOfvwgeOsv7EMHmjZb4EAEHORs
 AFvbHIO29KrO50mOR6LWzHeEtoMbjKRxpPpeFHL0WAJ0zeaGgYFQkVDLFTHb+tcJKZNzaQcfTOr
 A/gX0qt9wWyZUy483xKQSHzNencn4A5qm2KeTLjezWyjKRMqOxNcCqFmbGX38K43Am3QmMZ3AL7
 YVFre1EJbT91zoN7MCGE2vUscm7rpE/mljuHR5i/gJ7Uj7Q23emhpxMeTD7QmdYvYP7F83LsCQ3
 unLQR73BO8Pgm/+aNS4AhAvH7IWEn7REYkZFdGDYLzeC/G/Vg42R0QVo8NUdZTWL7mXelmpdG9Z
 DjmAXvVA1Ymxjfo8gNJ6YeKeB2voZyM98mtlwcgr354wN8V9DFoAwZeRx3p6bzqQhucTooTlrrD
 vuLisnyvxIeghESp180iNmZsCzRaiVM1DxQhnA40Tqs88QUKVirgWolnf+3SF0XEwMmOieEsmRk
 XbUoyC0vCzl6+Niz43jJgm1/yNSkFfgG1QJySFurCg0aI7Xrc8Jmbn46/FHPTNSkiwFP7sqbyX1
 uqHFTQ1d+BsJkhEW5yJDhqAYf8W0lvrmTtejmDepIdVQovzVNtHxSFWyrfn2LltV3ysYc0VIw33
 YpwPc5aDBmI/CNA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Acked-by: Chen-Yu Tsai <wens@kernel.org>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Depends on the first OF patch.
---
 drivers/cpufreq/sun50i-cpufreq-nvmem.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
index 744312a44279..4fffc8e83692 100644
--- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
+++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
@@ -332,13 +332,6 @@ static const struct of_device_id sun50i_cpufreq_match_list[] = {
 };
 MODULE_DEVICE_TABLE(of, sun50i_cpufreq_match_list);
 
-static const struct of_device_id *sun50i_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-
-	return of_match_node(sun50i_cpufreq_match_list, np);
-}
-
 /*
  * Since the driver depends on nvmem drivers, which may return EPROBE_DEFER,
  * all the real activity is done in the probe, which may be defered as well.
@@ -346,11 +339,9 @@ static const struct of_device_id *sun50i_cpufreq_match_node(void)
  */
 static int __init sun50i_cpufreq_init(void)
 {
-	const struct of_device_id *match;
 	int ret;
 
-	match = sun50i_cpufreq_match_node();
-	if (!match)
+	if (!of_machine_device_match(sun50i_cpufreq_match_list))
 		return -ENODEV;
 
 	ret = platform_driver_register(&sun50i_cpufreq_driver);

-- 
2.48.1

