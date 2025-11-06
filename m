Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BFF3590AF
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456123; cv=none; b=ryucbEt/viDSFqCq1cjBYRHtEtyzBIALYiV3gR1T7WQ9vSozLaPf89YISzivQRiIjyL4OgtdPGF/t1ETZjmVV+no/dGYTl2IwNV6IJqMNfyt93M369qfChZSlHHbNTmQ9lrxcr3fs8PR1uP+AQoXlWqC5P8fXp6GXHBTP5z6Ubk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456123; c=relaxed/simple;
	bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hDDOoCBhEj2G84rdElfBUw0odHn+BCb6dl00xiUa7IvIXmBHzES5vjXu/F0cpTDiyug4BkFhOKR1T65eYnPxtmae8xoNL17hD8um67h/UbFSzKEt/zXa3Lg621AMd4zumCrACA0dA9bhQyx/u0AcZeQYfc3iOc7J8+dHH+KYmZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQMxyWVP; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQMxyWVP"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b70b338426fso22735966b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 11:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456118; x=1763060918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=TQMxyWVP80OOCFTev9aaPVlZgN6ouu2fjFqRCxbnGAwR3ANJqjIVK304v9poJp9Qq/
         aqO5mYV0Km5Y0HiR97LJ+N8xOyODYFh3CAqRkBDebWY9A1o6sC6q1vgpFzZ3ydNtYWt3
         og6qPlrIU4sHTvaU4FpOTMYxvnQlPBHonhoz4B+W5zBEaf9Drqx8tQl3d/B9v1O5fs5a
         gAxs++DkJb+dCh0EKkR8KKC6xV7mX4YJwz1DtbK3KolnqzJzBANkA8OIlc+iLn90/Oya
         p0tcoYKrmcCvcf3g1KNvZJVBnv7BVytIehQpz0v+YW0gjonh6mewXdBxTJk5wdpiY/QK
         RMmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456118; x=1763060918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cEcJAtodzbUC3xZVWApwBo4tG7vpFkamgYaCQUU+adg=;
        b=IE6W6c6fL9Jn5BgkgHl+KbbV/hvo3Z6kmCT1dRGsv3gUDU1rGHNKoJwiUcgEQ9WppY
         hOn04S7Y+gwVuKgJwK9XOEMazBd0pans7ICI+FnovnYciVadPwk1TNisYiW+nMqfFlwC
         NnB634cHiz1gG9kTvdofhwP6L+0VrC8vXhTXfLuju7dFa6trv5mGB60Hqh2/mz5mL9fs
         /mzuRr83msaXlgK7rahumKb+BFH4o0r7vbuzYNxbtKHlrE9P8vAw6cwi0byhcGQCIA8V
         n2KBwYus/rX6BY2adIzuicxDRV1CBCVzTDYCXoqSAjx59W6Ip7sFIbLZt5mvxaOlT8YD
         u4OA==
X-Forwarded-Encrypted: i=1; AJvYcCUhG8MxeEKrAM/iu1BXLlsN+opR+q95uRyVvRENZj5DzPTpFYTXAwi65Bu+MyrBFKZYaU4Vk0GcuWTED5ZdHiVxKT2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YxgAvOxJSefM/9eJqOzShbXHBNCFusHgJxJuoS21PimJuRbf6hD
	v2xcuZPzh8yd2neEw6X69bQnkqFJmBxo23rRQARsw5yBpMHSK60D2W/gooIb/Cn4PdU=
X-Gm-Gg: ASbGnctvqH4rYXknnQ+arHKQYWiITWIzXYOYO0A9+lbFQ9W+Iwfj0iqFR0hhUeDMgFH
	sDoIe3XoAh8raNn6Z1Jr4QXQ7Wp9lIX4S5e15NSvmCV5jA9o1w2hlu1N+l1cuSJMvWVO6tFA1WW
	b8pQvIcdxZYwc3OABQqfGhVnFlRDkuuXO+fIePqv03Dhe92O14ax45S5C+B9tAsHxgRJ5ZBeOhr
	g1Qj6XDesr7/ITDsqq6AG0/hndXWOI5247XSK1BEW+3mDaWD4UUoRDrqatKNwoOOz3ibeAaxnj1
	DvLDyyDIBq/A5FA34yqEhM9CFZg7gw3eCexKNGxfUA6aJoiBoPAVCWb8Bl3+PrexOaARzDtMyDH
	rZemtCzb/BogmPeYDRzXIq2oLe3mw2t/NcCM2JGX3rSuiYyH7rehxt+9ws0Pu+XtHxRSOf8C8tO
	pHUIlnQhInbX1ioF72+0Lxx3c+gzs=
X-Google-Smtp-Source: AGHT+IEG6JIHxsm0NSW77JVy6hqlVUyEbsXE+NHpA4hsr8vUkgMvS24h2IoWnZAH3XOZ5QWMzHmdwQ==
X-Received: by 2002:a17:907:3f24:b0:b65:c8b8:144f with SMTP id a640c23a62f3a-b72c0996c95mr16220166b.6.1762456118427;
        Thu, 06 Nov 2025 11:08:38 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:20 +0100
Subject: [PATCH 13/13] soc: tegra: Simplify with of_machine_device_match()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-13-d780ea1780c2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aS+78ja3p6OXPY5E9ndwnwq/bvuxECqbsbzsQlrHFPw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIU/bsdy2ckqomcJnNEJaYMWYw9A/Yk7qSg4
 /78uRfUhPeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyFAAKCRDBN2bmhouD
 1zSDD/0WA69UvlFQXYTOHuLcL+wvScWW8sP6X/fQsuharZFRRvPkmk5RKJ1H9q9haW5mFRgd8xZ
 kO4ELHeCytALDZhxzR3QwE4LgpseKDZSllt6k9bKnAGouD7wl63kISGTR95uVIILdEmQtH/OMYg
 9dplSgp+4dVxPa0TMzVjb0WV9RzYn9ubwlhRES5DFD5bkw7kpUYQY33eE2cmJlfu8p8On3ipNJy
 6bYBh7HG3mjy9NDDwKd81Dw7cMYRGCAV+Ce7NsEl5k92yn1B5nfokau0GlcFCUxhnsSZaUv36WN
 4TRVXpnSBeMhkM8HYEDdG/YqQFrTVm9ohoQrwVhSVRcjOU6I5YHA+OqDxvBRsjpV5YMXTa0JXi9
 GSoRXU2NxMxA8dXrc7ueXed+jGkJ2NNMBOTmQTjoOSU90vT6eQ0g+MQQl7/vUDIqba4kLTnLjsg
 qnj7S5s5q4cMGiqprqCXnP1Qei5JXuJtNsQzMlmH1GBncgQGLvI/8rwSqD8JGKZHVXHFXovLa7K
 O+juSa69kES3Y05oIwof7EKPSvvW+pOyi2uAXgt+v/ca2qUmbqicWLvSad49kbsc2SLlTGsBsxk
 dD6AtoUoZv3MGI7XcFgRReuI8yTr1b7oU3zSAcyqwA2aCLVxhUyBZr31EQaMVpQ9xST2iFnLrna
 O5LVFZW9cO0pqkw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first OF patch.
---
 drivers/soc/tegra/common.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/soc/tegra/common.c b/drivers/soc/tegra/common.c
index dff6d5ef4e46..d82b7670abb7 100644
--- a/drivers/soc/tegra/common.c
+++ b/drivers/soc/tegra/common.c
@@ -27,17 +27,7 @@ static const struct of_device_id tegra_machine_match[] = {
 
 bool soc_is_tegra(void)
 {
-	const struct of_device_id *match;
-	struct device_node *root;
-
-	root = of_find_node_by_path("/");
-	if (!root)
-		return false;
-
-	match = of_match_node(tegra_machine_match, root);
-	of_node_put(root);
-
-	return match != NULL;
+	return of_machine_device_match(tegra_machine_match);
 }
 
 static int tegra_core_dev_init_opp_state(struct device *dev)

-- 
2.48.1

