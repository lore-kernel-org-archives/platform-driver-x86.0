Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C1A30F800
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943367; cv=none; b=EPwk2DBNmr5r9fCCRJuIf5LafgPf9tzb75LG61GCj8v+ABvhVA9p914OPZI9ZjtXPyejNWQ9eaIXwisAYbC6U2B8ihykLZu6PVc3yyLwY8bBibdmkZ9dS7xp5Pgt1Fihl4KwssRMekvGi018vKqWajrK7WyIBUfSMEzP2+NTP/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943367; c=relaxed/simple;
	bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RYsHVskPv3QhvbDPRg2mW5Do4u5KgjY1VYF420PaeS1ILbvAR3G0R9OUujCd9RcCG9Ap0D7l5KuAsnIE9FowZ7h4TUWDSwlLnKG9eqZqFXbPuN62a+8VOSXFfMn3pWWw51uQ88XN6xmiXIU3NT35rVJO7sm3KtB2v/xQ0xbUod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zu4CF3Nz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zu4CF3Nz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b2de74838so72044f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 02:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943363; x=1763548163; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=zu4CF3NzZ5kD1ZXQwcddAdAKqtb5LzqQ5w648XyMbnHUs7vAxZSEboCPBpZHvvuUar
         nveZh0Q9HVmHQBCXmnOpiyYaHZvR6983l8QlG6uLC9Gpq1fbR+K8Zhn2wxvY2YMgqEsl
         1T7U0lD6TewkLcmfNPOM/4eL+zJ9ouKmdCeLU11/GMEgzJh7Mb8eliuKQpaQZZ7oS3Z1
         4soZ6E8nrx6qIB+X802mQW/UfcMH1Z3CLjtAFL4lt8exvxfah8Pr41XvxFOo2DU9o1G6
         q+8NDK13nWGJMTsip+qcjbjaHg3gSKFP3uWGXGSK3IEumW9yU5bCBPs5FSYxLn7s81BL
         Tu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943363; x=1763548163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nB+3RSbUxVhm7JIM+0TQGTITyXpP2tjxIcWVIQgzWAo=;
        b=RsW6xHtRVRqXxw4o7NOJyLw85V41TQhEh8SCuS+EYcDMjuvcsMLkpH3zFxlxG8kBew
         YQac8CnWHF6oEUNBQa5PSx0u2oEWir7ycRinE1O5mqUw9z8l7EH1qKCMu9UBwXfAeu7o
         jFyBkd6y0d48m42u6EhZNxthweBEpaoNagrRc6sZZdEciChXfpCtSIO8w5OmdJo9BS6q
         +erA3dDleZXPkcMO/HmCryd7uLzMmUZhchLIBYPxp/PCvFDETH0SQTy6bOexsfzl6Fi1
         RZyxS1JDN17YhvrWQN0x6kNwlt1tlZbZvhAA7XKQtCnDn2ZEYcCiMA/ygsMh4kmdb9u8
         Esyw==
X-Forwarded-Encrypted: i=1; AJvYcCXViDYKUGWOoHuyXupKE96R16scISA97D/1VswseJgqaEJQmsGDjcF47zu2Hkap1R42KzWR47t8X0L3hFWujpXJdHtA@vger.kernel.org
X-Gm-Message-State: AOJu0YzWjc85qV+SE4JGvOikGzZUjPkoGea2x9/VQ2o/Gj78xZgbq1iN
	/CnNIy5l+g+v3vPMTOLhBTAou1NuJXVEhAyg5iHMfpyvyGAY4f4QLJ3/sqnSxkGcCok=
X-Gm-Gg: ASbGnctKjQ3zi5Ml+j6sfinIZFQd3laVtnoACmbX+zKug2fiazvA5P+5Ack1j2A55SU
	MCX6UYh4s+KJ7TeFhkQG3wtXWbvCBuz0ExCFpR8IvyGjZRZVOSeSoOQThW93+I/JgitPsAj6I5T
	t1wdPH+VDDE/ljyPmGKVCBPXXvu+/OfZNkXAfH1EPkP4eEq8/zGjqRBbwfLQpG0fDKnm9IrXCDQ
	77cIahSYGEE/y2Klru0ROYqyDnACc4ZLHhrD0u/SrI5uSYV3ghkOxTWxUKw0yrNws0joQd2+Bvu
	J3N9EnDyvc6bnsfMllr/OmiRRWKTVBQABpTUQEs4+maB8hQOEBJI1FiAFuNQA4pnxezay/hWGSW
	epxushvJRN3ggXAbEJ5JMWBV/VBF03dqNfdz0XmoghyqqMkg9BGNFRY6XRsKrartfHN/o/uRi1P
	YDY/sh9jEgjyka7R7BAIaJmtr7vlc=
X-Google-Smtp-Source: AGHT+IG4PYkMnNw0ODvtXOUL94VjBv1SVm7gv9pdwxJVf+TJ17wVy2egXepWnzI6OYpTuU2LqPLsAQ==
X-Received: by 2002:a05:600c:3b99:b0:46f:ab96:58e9 with SMTP id 5b1f17b1804b1-47786ffa240mr13184865e9.0.1762943362906;
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:22 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:54 +0100
Subject: [PATCH v2 09/11] powercap: dtpm: Simplify with
 of_machine_get_match_data()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-9-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=HOTpv8E7M3Z9++7bQRRNeja2y7FI7o/hDZwnKU6ywmQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFr1tYOKM8LvWVApmUF795FPE3v7DdzNxeRs
 sD8X/1CFaWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhawAKCRDBN2bmhouD
 17C6D/9Gk7S57LO4NXNBYYNtibDL8ljONOe8Ig0TRx0qtjvLyrRWtyTVEodm+FhIyH5crFSibku
 khWIr85eaZnyI7DZmi9EEFVE4TwF2EuzXUHW8BfsvL7GRGYpX14S1sHSR8EleDgvDqMR9NTL6V0
 jNIwfovhLn7VP+62qwBkcAlM/2T+zgdVrn1DzN5L7mfWJoxKIEyDNH6m/+NJZXFUpV8HAOSggLF
 aFaSy/KjIdyDDmdGdCwFyzya7/r4WobRUj2kgaeARLZL89D8+WH9h28f/7hCc/hAfW4Ii4hbv91
 ImiE/Pyo//QGhxgZOOxCC7SdAgA3h0gKzFE0Mgg0fENxJH3ErQLNax2+sn8jNbPg4xi/IW20mCb
 2t3DHlPLJLbhonIQc/3zosje4H2HU5cCZ8aqRjTNCRsbwSOVm0Szz99U91i8FgFfFR/laV42FcG
 Nei3Qs4ZfN50R0C9Dh4TaDOeeBx8nKNoE3EzI2l5AY7zjvVe8CkMAl7LjCpfWFxFj9v9bhYmsoV
 L/k42dG7HJvL4TkMRdbp6cOYV+0MPV7QY9nt7Fb1vu14PeCkZlFCr9Px35eZypnM018TUFkKaCU
 8PQcNvW9cis67Ie9IKba4R0f1wkpZVuHgWxJeR4dLwWs8Upggvlxq5bhVrL2wWCvymS1SWwmlnp
 ZVHhvRQqrTykRYA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node, matching against it and getting
the match data with new of_machine_get_match_data() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/powercap/dtpm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index f390665743c4..129d55bc705c 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -548,9 +548,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  */
 int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 {
-	const struct of_device_id *match;
 	const struct dtpm_node *hierarchy;
-	struct device_node *np;
 	int i, ret;
 
 	mutex_lock(&dtpm_lock);
@@ -567,19 +565,7 @@ int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
 		goto out_pct;
 	}
 
-	ret = -ENODEV;
-	np = of_find_node_by_path("/");
-	if (!np)
-		goto out_err;
-
-	match = of_match_node(dtpm_match_table, np);
-
-	of_node_put(np);
-
-	if (!match)
-		goto out_err;
-
-	hierarchy = match->data;
+	hierarchy = of_machine_get_match_data(dtpm_match_table);
 	if (!hierarchy) {
 		ret = -EFAULT;
 		goto out_err;

-- 
2.48.1

