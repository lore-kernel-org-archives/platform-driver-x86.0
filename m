Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFD0307ACF
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762772838; cv=none; b=HEHrwvNC0J5Febvrkuk7lb07bjkJQ5p8gsNqz4t4c3Y4CpqUOavF5UlV/9Dmmn6eJ8iPrb3x3fPb3mTyYnUQKoFw6iGx0K5E/NK8iDj/JaWEqxfjRDfAZsZks4ljXBp6uv8zWd8v6bYbPH7XR+UWDnkmTINkE50zCAyWG14cJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762772838; c=relaxed/simple;
	bh=y9Rc2TSg2Orx+cZa9j2QdmCSgqy1wVj5vvqljCG9AMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pA2osV0x8EXI4XwVIvSploUlN5YM0aS+11J4xfpmrEVHLA+E9V29PlJuM6RaDIi37nKSh6olJvJP9/PwTvE7OifqZAxx65HyUaQUil6guJw7KGwFHULToxFoJLj6F7scOQiZcDwSRMYRcbmdAeG67LWMBOL5olTVVjKYHcta1U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pITaHv7F; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pITaHv7F"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso2343140b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Nov 2025 03:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772834; x=1763377634; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=pITaHv7FQd7Ixj+gmMcfdIpoCp452jsxe5wrcUQnPkmqLdRptFvnTrXkBLEmj1B3dY
         8T9yTfQcHwQlEDmQgVFb+uYgN8AiJAeC2iB59o3D9AY8ZwfpNMKDvxDxp2L+iYYepaGE
         7G+M4Fq0mSIte22N7kwZJot8nVqApdjdpAdrW+WeZ4TqOvNVJ978ZtDu6PIfo/s2Sbqp
         vOuOTn/MdTjzOK+VLNxHxn5KGFq2MprbrWECDW0RGd9RTHUTbAUm8rCmmaCJC9v3mKJK
         d8BJB9xKbSsLq5nXQEyu3sl6CEJpSZMvKsMe+ej0jRPga47fzdAS8+Vz7WyPiWkCzn2x
         CAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772834; x=1763377634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZrYqw2/O2UZmuuLXYkU5bIjhuFDnuqQ3/E5dCC+u7U=;
        b=JgL868sHLVJz9M2yByacemR7xfT0JFYaXwrx03GSI3gD8sMKG97dVzX/IK6WGfyZMC
         0icbulrjB1GRL47wAN2BnSeOv2ig1RywbpJOFFkClGVEd+qxdXGFL4xIqbAhZ8LikLAn
         2sFrarANmNwm5G5tc4rHsiTUB/ITQsjXVOgmymxqa7steSzj4rrDGrzNjW9XUptBGdCP
         uxr3hJhQPx+KbJaxoPFIj2Lo/kUF7aU2kNCvKuIjD26WR6PAaTZynI6H5JaTUC8N3Ttg
         KnuED5Iw5MEm8C96Gib2yoaZ2FEk9uch+GTuXNTJxHSSLBV/eyORdf74wbHg8IHQwCTS
         rT3g==
X-Forwarded-Encrypted: i=1; AJvYcCU0RnGZ4BzaSuf6+vIukaK2PV+3KgKRZya4cTPxPkQagj8A07f08TT2pP0txw73r4LRsh0bT9B8pGWN/gXk5GKM6nVK@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1IlDuVxerzsZmtKYeCAWw7yT7oE5Bxj6EHZsMHPbjy2MW+0e
	QDmc3R1yleFzqzHEHw3JajR8RVFEMoB0MJVRc+6upXFQwk0ZSwxQSlMJ/Ijzc/0BVPI=
X-Gm-Gg: ASbGncsVv8ssGEur/fAho75DwtXyitE9gpnanZRlNMBR0OwuinYNQwbRrKvRp2qwzOn
	9oYzpiAmVRMeZ9Lhj6K8o1dOdnzS89WZ5cUbWDpRIWJKebak0sewMRxbyK5NuSxru6ldJ6loUzZ
	LqdY7+avXQO1Hz/zvGbhyraVp2S0kB42ffdWIhIysMsdQ4+C6aCX75Ns15siVufXt76U0FYnIyD
	hLCZN5tu4Yyqf5/ZTUXxJap/uz22JhPB109SADKzxixltnPbS3ZJYXBr5bOaOVXDB1boOYPGxvy
	UxUtuK17VKQDyS2Y0tyz3sikfkp9xvaYk96RGkTNpLYSXSSqd0BAwwa5rBXfhWTZRTJTyRzMQJN
	eqs94rrZF4GxxIQsy85IIxU5BSNd+XOejVVw70qE5faI/IPsowivwNskT7lmJ0IVa89ErUmD0jA
	k6+AwcxaXyzq8=
X-Google-Smtp-Source: AGHT+IEEBmMVZO0k0MIdHGG3oOt1wzE07GZr0Rosgte3T2/mK8NYjyyq/dXAAAQzolcEZu8MEC+rkQ==
X-Received: by 2002:a05:6a20:12c1:b0:350:d523:80a4 with SMTP id adf61e73a8af0-353a314ff11mr11044525637.28.1762772834004;
        Mon, 10 Nov 2025 03:07:14 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953cf79sm11625705b3a.3.2025.11.10.03.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:13 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:11 +0530
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
Subject: Re: [PATCH 02/13] cpufreq: dt-platdev: Simplify with
 of_machine_get_match_data()
Message-ID: <qg6xxh3vwbfnl3z6otlr2bue2paig7w3agbpbauuzmppiof3q5@e4xjlcfu43cw>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-2-d780ea1780c2@linaro.org>

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
