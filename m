Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4F53126A6
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 10:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762943371; cv=none; b=MbU73v3u2cqX/lAXMJkzZ47vTImZn1hvIxiU5de9I4GyHu2rGPBzZhKfxc18zgcsBR2XKFOlbOFzh4ZSVWwTi11em5B7D4xiE/Cn3pmM70XT4fJ8KpMxKL17tbxpbqmEQX0SGJqQQQfqaKOMy8zPeSfM1hT3FFwQJixlRdmTle4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762943371; c=relaxed/simple;
	bh=GB94KyWxhTOTJwckGHT/UMyyYTBhNHxn8zgXA+NUlbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y6dD2Qtq+cMZmu6JO6dIxtgdMXAin8GFijcRPXb/EfgvIsnXF3jb9cJ5EfDaCBF/yJreUSyAkwXPBjUnzAchuklIW+Y7/5micO5BdzUALz3H0GBKEQDCKd0Qh4Ne6jHdtDowjTuWp1Bgzy5Jf6S3obHF3+x0dvYlhWytCaaZUT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfP3rUrK; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfP3rUrK"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3288fc31so81307f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Nov 2025 02:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762943367; x=1763548167; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=UfP3rUrKFGJ6EMQvtpAP+QL72+dMdLmHpZ/ppS7BaBEkHkzVn3LpIufiidM8a8ENDC
         IBJeK3VuatTjIuDzw4RRmHaMAjtM67Rl19Wm/TfCTB1I3ihJJkr4rIn0pxhc5yGnqyCe
         hSyorx262v8gpAonmTLCiPYg7gS0bwbsShPm5xPtlZRwciRlal8ufZgwXUE3kgyK8l1o
         HdXvP/51J87FgSJdcT1LzYXq/OaL6qSS9UJpc9a/Jk3kfYfVcJnJZfRfZJeijVeAlx8b
         YLl4YgaFdTJP1PbMIWxLsXzC+qzxiZVpKXPgM4H5lhJT1EGmV5tUnqv4KKfGy1TsVq2Y
         5k9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762943367; x=1763548167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BOzNeziSlOyb1g3MGAncFJukfzAYPENN5aoa0rhsnAI=;
        b=hqJ9/u01KUhgP+Swvew1SYvLkva0thf/5Bu4LhKEF3uYWb9NDDOo0zD+F2s44UpEYn
         yUjUxI4BxC+qG2316Tgq1Nbgq8dDbFvGrHxxlSeV86zE4mCb/56N0s89mHiCh6yTeuVq
         2z1nyhpLlgUguziRIgRahC82rtuAUY1Z14QYnb1AtZ6gTnc8+bK1mjmLEj7uu58VFd3Z
         aFKhK0hu6Yz05uv1mD9C81KJnJ01fVnR5SpI5Rzr80DHzMLUFUTTkjELFipJlSkbcmOf
         wFJm53VHoqt2wkVfLguub07+dPzSMAJxMPQKEbimptz399q4IllJghCIbYaETcaR9gUD
         KAcA==
X-Forwarded-Encrypted: i=1; AJvYcCUS2sWYyv2AaY0Lb2PE24UYtOMG0dIsRk3hMxXYvwp0WnsYNAnYoikRNAa+CW1oT2v9hAkzNbxVTH09CD7fbfP4T7vm@vger.kernel.org
X-Gm-Message-State: AOJu0YwL1Bl3GeA+E+/TR+opjGmKYlRpDS2kJFyYwe1FxrNhn/zA2UDN
	ZkvWD8/l1Mto8Xvqn2UbABqcura08/pbR8Pd4UOYhaBkS5UuvBPHTRYjQ3694VaQeyA=
X-Gm-Gg: ASbGncuZwMCZf1XVb6gP5d1Ys/d6h5mFSuPZSO00BfRWsLDM1GpfdvkYGFKGE2pAXy8
	rJaiJPb52KmhYiqA+7J5LNoa2XN0U6FtpDMSNzh0/9jFC6M3FyIE28gZxDt6yjidV91Z2AE2xbI
	yjoj3Emd0de/IzonoqsHGFkIqDFyRXawkRFXca4cATXlEyz8ZJCh4t6OZZN6Zd4ravpk3/4+iGN
	mvYi3HEfjVqojaAFS6DfIubMjfwRc6DmrbFnnbKygw26wVRq78ccMcFQ796hY79414Ro+k3c5MJ
	4VL/wTpHFt3tBA3fC9KcYp3DesCCMHngbPn21NhEzB/ZehPCGbDAonf1CLojynHczsekO3pR5UG
	+P5WaEKHeCCuGlI2SLETxT9wzx5BPq/sBx1d7e0we/iaHZplwmdd1M/6Yb5O2pHV6eqWItpvx83
	C+iURbjgZJU5SN5Z2X
X-Google-Smtp-Source: AGHT+IGy7b4A4+u/uGsBiLyOXS7Gsk6nxN9fGfA8X4fo9GU6bM3+pQFL29gZ0wTZR8WKoFNMAnOUPg==
X-Received: by 2002:a05:6000:2888:b0:429:ed57:d17f with SMTP id ffacd0b85a97d-42b4bdaf0ffmr1104643f8f.6.1762943366954;
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm22020001f8f.45.2025.11.12.02.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 02:29:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Nov 2025 11:28:56 +0100
Subject: [PATCH v2 11/11] soc: tegra: Simplify with
 of_machine_device_match()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-b4-of-match-matchine-data-v2-11-d46b72003fd6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1047;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GB94KyWxhTOTJwckGHT/UMyyYTBhNHxn8zgXA+NUlbM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpFGFtg/s4nNx0uYgFz0GOtpfIGABdMtbdQMANV
 +JRa/rp5UaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRRhbQAKCRDBN2bmhouD
 1w/fEACKMeFrgy5574qcsFru9xUr0YzMLGL2fJ86eoBrcMob9jAASCEdZ4D1Ej7bxnGW90YnM8p
 kQTuDSm0k1uWwm9FiVqJrUcnQf+MzR+X7U/gz94Kt90nLdBQV5YnPGcIsm3iHmIP4oVXHOpXokP
 x2OCQWPmfvbyFBjPZBy/1jGg6gNsMuRrWRfRLgz8jGcpoJMIafCEYZfKGZHHy3oWdOtwum/ndpN
 lJWa/sWwNglSxmB4Nu9YPiMgt1dJKy/7Tv6q+BiTDc81aEuRjfamh5IFFc9Urmb7O3UHiKtdokW
 b1zy3QDFK7/HNrHvi3T+16GKEVsHfU1sSG6d5jbbhEGoCC9GzPoirQLGKCjP2yaONa2vevaXN2G
 eCDpQZj58sVFngMltyb2r24bL9TAKWfw4nb7Z3kkOHAoRHS3yYZ9Jukr2BH4hKPGGItXAk845US
 AqAxHGs1G+QmXZZE0T6JjmUDUuPP8GFF0/gXiPr8oQLTQn/qjJCF2+svvkeWcT5zGvadb1pZvRz
 sS70yht/Xs4f0SAUjiukfj1ZmpBioU08dGxd6BUYbPY3gEBd6rQAqXDRnOfk62c+DVnksvKFMWc
 jrZSlC+mX8Y6PtbObKFPeYpzQQgx1xpwIgMl1zj9pilDXpDo8QxzUh4CwjnjvF+KeaSAVtnx/8E
 ZrNgwAuRB6iES6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Replace open-coded getting root OF node and matching against it with
new of_machine_device_match() helper.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
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

