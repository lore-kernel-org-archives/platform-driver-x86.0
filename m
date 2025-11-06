Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E72D3559F8
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456102; cv=none; b=N3YGh/IMXvDO2mzwej1voF7pg28zaRut1vRbdvT1R+yH2PZqwu/R7VYiwafqhuYmxPMSpjMrLqwGUmHy5z7Cv5BuMSdpS8N0THB84DTWAVEJQQ4CYrgIoqBVsf9hfUDkNVH4D0VPEyqHLYd7AXhIwXVW/+UKM32YIrcfifQJjms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456102; c=relaxed/simple;
	bh=TMccTrAY6jfews27rwbvbYNjT+D0HJWoublqLUUZsRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uid585cSMhOo+l4vrAh0IaH43V4fjiK3WlS/THyz6aOU4HAIPjikgr3szCISYRoVXuCO3G7EMrj/ZKHqRAUypCpIuIqRzneWPfIjmq0P6OqdDOHIlKxhFwzKx5szyCyebLTANKqaTTAJMPzpL1KY4WbGvkByfOziaVmgxKK02x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFMf2J6p; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFMf2J6p"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b70b40e0321so16685366b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 11:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456099; x=1763060899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=pFMf2J6pq6OPcsMh6NM3h8fhbzref8vj9T1FiWrgTZV/qMUiJS7XFt82jdO4Qs2/kP
         6CVy9ci8XSu+HobAjiuMoDvkioxFbgN+m35GUsTX/0hKlDYnswRhnFBj0r69o5FP5N5B
         qVby6FTscwZN+/+5RmzOwXEtRoH27BZX9Tc9dA4dQ15q6fBjF2Uz1tP2gWZrvlKPmh/h
         IWM05G2w+8QVjKOSVBdIOF9DRJDBv2E6BC0DioxlUmEEnEjQEw6rvROewmjhpUQsVBkz
         uqL5C4hPZ/YLYTjz22mfC9gFWO/2ro0dflcZjvVr871xEChX0lRRNT6DM+RfoLDUYSHI
         AUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456099; x=1763060899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0EMfoJJAJUSJrYVhvefLkn8x0fM0S4lrrFEN5ZpP6No=;
        b=fTidT6aqA8cV75Icnvtmi+hUAuzwOoQfaQxEpZ7GKp6m6CrOaB4xg2QdbBSRPgngEd
         mAiTtqIA2FpIkgIx1EetmAwPSN1RxQMmPbOKIgx81POEiuE84UPCZ9BTdLnCOjGpKPHH
         YQ6u4ONTZh2bUCJHUuLvc8i2sRwuA8oMNwRb1hxagOXZV+EvBg2/SiWWrkoQ0FaevA+2
         TDTGGN8WJodfCXW1fOJ2jbSUGYJoVBuqXMFXt/saDplpLavrdP6mf94ddGyuqeekFD6l
         FGrQHCn7FXBLbNc6r6sj+RvTOl8UhXZZMS3aAlFz1BPgyRD9SWgB01hTP/pXG0kmSmmd
         8H1A==
X-Forwarded-Encrypted: i=1; AJvYcCVcKlY1/cEBhJV4Z1IWNYx0Rg5QpCswUXQ/cGyti1pwZGMDljNNwjUzTa04apFz4bGaQ/Q/6Y6Lz7rJzCpwWMvM30Rc@vger.kernel.org
X-Gm-Message-State: AOJu0YyCJ29TFpwoKE2oS7PP77upXxR26r3HkbS8Pg5JHgGTYslJO6r/
	4V7ix23hPhS9emrFilAb3aWGBiLopoXqgL5eVkEjarkHcHb86PPZEv3CNpsUVh1g9bo=
X-Gm-Gg: ASbGncsprEv+SFsM5RXYRojhRFmCImIIu4j7fLC13EpRnNaG47nytzQJfU4WClTvh2p
	yc5Yt8/0rFj1S4oh3Tml+GPdqHLQWYHJTdC+hNZqd2pBY5qVYznMf+JRjkJ/jmcEO0+bb0Vdxa7
	mbU2NFAQa4LwxH7/s6GYI2/nxUOD5N42wotrpLjIcDbp4imzjeSSXL1qwY5DcMW9TA7CHE4ghf+
	8iOSatcJT24xlD+lBIlqSDYQuic5KYU402StMvlkm0GKK4MwyH7ESzN5oH+8vY33hrmRapJg4iT
	2GXJBxm2Z5H0a7UjPSnhl2Eqk7G1CUYW/hOdqbgxVGqodIAv0OB58E6TmoEtACOa9DUZigU+3qe
	d6B5gEfWk3feD0RVoqDjOsE3O91i3NcQzbfrAZ3Pxf1HtccSAl3sxZJhkZIy6R5bsberLp9uwsg
	df4k4/lNeXhubMpC4k54qeMCDjhX0=
X-Google-Smtp-Source: AGHT+IHpy6g/ExB/tXdG9aK+X/w5cAOjpzKRGt7oFbCPlJ5xOgLfDQqFln7LmAaTDVmt8oPYZbetjw==
X-Received: by 2002:a17:906:c142:b0:b71:a627:3da5 with SMTP id a640c23a62f3a-b72c052b1acmr20747066b.0.1762456099430;
        Thu, 06 Nov 2025 11:08:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:12 +0100
Subject: [PATCH 05/13] cpufreq: ti: Simplify with of_machine_device_match()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-5-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=TMccTrAY6jfews27rwbvbYNjT+D0HJWoublqLUUZsRg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPINB2hcjM8CllrcU/oYMlxMVbOrIG9ZbKt4r
 J6A6ykHWZOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyDQAKCRDBN2bmhouD
 18HqD/42Qwhh3/IZCwym1Z2urYA7CwYVB0JU2PVOoJidbH45aheJiAWatbUnTpQFaKg3s6UY/mG
 6YgQWLLLUEM44nIcAqUj1X7y/lJyx5tsfzotB0ZHdFOalzT89gwIBXCVg2sIEwjTV9snZYAfPDT
 1Pd3QZhFbWmTMmmyMFkX5dQGM4lnd0eRqml1TuEdr3MuhBaHqf5McFPM+YDg15hSXu8+hs4OkiT
 KEwlJCETrfYYWbNcQCHObHuiSUKqDazpYiNiiC5ETOrgjctCN0/aknRcm9lYgJIx0xflcJFT7RI
 mcodL8/DSE2FEc2chRC2iYMWb6ulfHrvkPPHZiIMaqLA589bwocGzqGvKin3kil8du8Z7goWk9a
 E4D9PHxlumE2TIwLlciKDQKo5ivphUdDLk6G4r8DdlPf49USQ7QowjNwn9pKh0zCM6c8fm7wmdT
 y/hISSHuivvUxDO7fSRLcA9sWKGCbviaEYXkqiUadw/4cgbM4jOmomFLhQ5NI+ED/Xv/HsrkxcL
 4MsQ8/PPH5X/DZe7hJGMzD/ib7ejn2sBTqeLBRqERrAYwKdlV+iGwk53skesHNPE29+S1daNwZ6
 gyB3Si51e0pvvHjEd/ZJg3rRwBbu+ySMPDMpSi6sxJxgCLs/rHlUkNzMV5SZRV1UVZNRzWmZVjv
 rdRauxzz0zz6+ZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/cpufreq/ti-cpufreq.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 6ee76f5fe9c5..b59c46a3cbd6 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -470,16 +470,6 @@ static const struct of_device_id ti_cpufreq_of_match[]  __maybe_unused = {
 	{},
 };
 
-static const struct of_device_id *ti_cpufreq_match_node(void)
-{
-	struct device_node *np __free(device_node) = of_find_node_by_path("/");
-	const struct of_device_id *match;
-
-	match = of_match_node(ti_cpufreq_of_match, np);
-
-	return match;
-}
-
 static int ti_cpufreq_probe(struct platform_device *pdev)
 {
 	u32 version[VERSION_COUNT];
@@ -564,8 +554,7 @@ static int __init ti_cpufreq_init(void)
 	const struct of_device_id *match;
 
 	/* Check to ensure we are on a compatible platform */
-	match = ti_cpufreq_match_node();
-	if (match)
+	if (of_machine_device_match(ti_cpufreq_of_match))
 		platform_device_register_data(NULL, "ti-cpufreq", -1, match,
 					      sizeof(*match));
 

-- 
2.48.1

