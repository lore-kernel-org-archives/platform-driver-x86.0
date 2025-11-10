Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB404307486
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772851; cv=none; b=snTCVcHzBbot0/pbYApdFPNZV9lH7Gr3d5vSPWh9W7F/zR5oLLjrubrJlBhbtG8yCfks3rZS4tHBhfapUMwRdhnpkWrexty05sB5A/P4IOLsHDRopLv1wW+YYpEbsEkbzBG5MPFVMAWmlrDNvPvjOZpBHLVt3P0chRaX32hLAz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772851; c=relaxed/simple;
	bh=P9gC+lGzjtMArrtoyqNulbP4U/Rr/r9sqlbgUdghZh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BWBAlG/zvO6ktTiGRz6toBl1aY+xH+oKP1+uxiXWU3BIbnmOTBdyNkJdjpAD41Lq0zV1IxzaAolt20npdgee7YLIvGkxZIXDY/PjX1YZz1qrQ27aat1u63/GbVhQL++/rfEESjCsRtrvwK0E0i1KsQxvzeywSXqyowhF5gvzGUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AYl3H+E6; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AYl3H+E6"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aad4823079so2536627b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=AYl3H+E6yMrrrrIq0CYTN5ssxJXa2EHFHx+ESaNyCZaBPjsB5yBPVFN07QC3IfzdZv
         fc/RFcb0W0kPOxXNr6K5+PF1zTjSKLkWduJKAEoZbbzN8eyDl5LZenrQzhU1BXYrv2r3
         gu/00GVcSMvK5lyVdh1b9K/GsBNFyLrpGLMl8KjaiaJr0Odninhk5h0U9CfHW4Srn6MJ
         luLr6bJBgYPzMCCmO3TNhzq2QD3H6OpURz2oWLGwIKRSeLl6dUKBG/nxfrQz3w1eIma0
         zRxeyvfdSqu1Ab1dPi3Dqln5EiAW4BEOPZvjJd566QxOQSDsUC4XmTTqsZJoO2EFGnJb
         IgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=Da1NbhjGb+a2iU4p4PylR8W1broavFBeaJ02o2QMu0hgs7tSZ1ybhzM6OWdxVDp6cR
         Hn+kjX7O1BQ8YC3zBPavcBrAF+7hx+ed8vQTUDZ+ArBSmJZgceNDr2+uFBoyGGBW7bjY
         UtANZyopq6Bjsmn6Q7jYINesFpkj4FDJv7HkwH2zyN2tXk6MQLlJt3A8l59bPtXaM1uZ
         kqX0ZBqdkUXgiEkOLvuA1ZiJlHM3yy0BS9Lh6zytiBs4GgE/oAR0CfGuldCkhH5sVSc9
         a1uJIlV4DeDdS5TVL8KtVs24Zl0HoJwpgh2Wk6AsBvb41kNOW+ui7HRvB57qz9Vz9rq9
         rNEg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTs7Fk/t7J2BkUgqqDKM/cmbRZnJIFF/fdJgrd1GsKsL3tHCIOBF0QUfk6PHb1UXkDqa+0DM8EduP/umrZ0u822LU@vger.kernel.org
X-Gm-Message-State: AOJu0YwqsedL8radYEZipEa1nsGGbTirNEY6voOPIAUIge8qT7SQxfsz
	+dlHuIy0O7PHGXNp3GG++x8MJ16meAl/oCrnOSUzNajI7dsOtVyi46DyGEZHjqin5XQ=
X-Gm-Gg: ASbGncsmxnGbdksJ3jqk7qYhwM+EuoEpM2khvqUU5BJfXuF2Fy0SxurkxyzkZ2FJBY5
	6X4DZS0bVrv/KtASFcZVH/+kV+Isw1vQX1QBKo/yVsAp8fPjCHmU2pfwhsCmeRamf4wRB4UKlaf
	EjrbCBfeUehuKDKys0tF5dOf5ugXsuge9/qasumFg5Jdk2xpXAIu1Ecb8hGW58FFmoIt/rp0gMS
	vjDTUEMCBAEO0PpRcIv2EpqgAcnNSmkzCdEGPCP8vEdkV6aUzqCaIrsHv81BhM6OinfOTumffWN
	rZe/lbyrJNjNVetgV277gVMm3YNFx8OLRRE+jzlmEC4jNpkOFYvE8F/Lx1EEzCOYWCx+TBLYfXh
	eUkGBMbBeuSyqk8U9Z21Ua4mp9vMbEKDhzQNrfpdgYumvloEDoX/MDui3Y4MLy5wXtIQGU0JIu6
	++
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
