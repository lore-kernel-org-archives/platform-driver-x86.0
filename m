Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E5214228
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Dec 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684260; cv=none; b=aH59wyYCxR9idql9zYWsBBqb1TH31SfQmarTWbBC1o4LccXrNLn2s8cp0XZjLzwQGWHjcivei+xEAlvBhy9zevRw9RYnpHyKKtFpwVpY46qxCI/+sz+r8/kDaG+vuZvedU8yUp23nTIX3pByeBbRzhg4rv0Vf+o4gQxHxQnGrrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684260; c=relaxed/simple;
	bh=ak/Rt6uWiX+MT4pBJfZ+PD2Fezju7a0RibofMkxgxGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTVwPfNp1bvFXd0UfUfsqtv4hF9ADEnQgdIOm5dK59zQdBO1cQcxrDSfWGGxrdpUNhAmTMh8YFCuGTEsZzoM9RGG98dMU3Gz5hSODFIxbn6r2F/0vWWnLy+RTTkmbI/VY/Wj0f+15Aooya5XUhR97ThYVjoxAFHxfdw2QwtFFLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6545434b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2025 06:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684258; x=1765289058;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcG/XQXLp9HYcvharszf8uW0YuqvJnIwjKHOdBnLhz4=;
        b=aYl7CQD1g/abH9urtRjqK+sgce+GXPxcEPl9enPThRkN/8G/fwV4xUaD/ZWPzoy5YR
         02MVKlHfjbs604Az5/9LWwpLx0eLIU0i9AA4aOcgMQYmqJZrsBy53CpB6TXpSlUIR3zk
         Pr32ZzcWehqhbx+AZfliHMySkNfVUcF4e5feIWn35GK23nE+AfE6Tm4CfW5JgytiRxkS
         xwWy1W330yKUs8t8RLYeeLI0kLmoDYrzka5CAxjBrytpoaKxESFOMB44i+PF//0LKr27
         mvdVgSfvagpDB/FDYy3r7l/PqbTS3TtL8gFjU/c3NM6f++FaEuJCo7HAgbfI/OCxOg0P
         Z2WQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUQy0Rahlg7O7iUImpngva9fH3Y0mIQkFvZS1xLG3jd6u14CsoF+dEx6elUiecDrBrx2iuYpa08IlpQegh9nwCRTZY@vger.kernel.org
X-Gm-Message-State: AOJu0YxAG53wTEeJcFCYxMIp3Ww1hZj6uQV8DseVol43xN5shKSLpDbk
	OosQG0jFvyUVwTz4ytlDWl2J7OzYaEfWGdMdUmEjn8s2rYPGPEV8HGGPefsZP7qe
X-Gm-Gg: ASbGncu7eUsbqaL3YnVPh3pgFpIXAttdv9Jcj58G9QK4v8VTo1DOj4e8Jr/Z/0aF8Mk
	ODwJDcTZeWIUqwhh0lNZLvyJtFFo3NYrwsNan0AIrWJWIBKjDXMEvvCwptVxoQFRWXyL6i5iLIA
	7CTBWH83UIfhYd2Up3jfN9+sIUtElDy86SUYJ+UgQx0i1QmLgxGI7PhnHjVE3X3WHM6a5FMHJKL
	zn9mi5trErpu/48kb2FbR28S/9o2J43FxwF9VGml+J/t8AGPG2WSu87cXAjbiLn3/10wGuqNIRR
	5f9teRLywWZKMvivSXrWhJSkYY32wavbAdrBQOhG9O22t4pwT73fznBlew3ERtU2yogex/MRwFR
	R7InKfHc9Niy3W0/nMJUjAk5vGaBZeETFImhkAG0FFGWsxr+oyXWZk0H+OlC6ki2c5yvRE7HNYE
	GQOp9D/NOi4BHj2TQDlIl1Uyk508pGD578WjZrHd63Yis3dlumwRpj
X-Google-Smtp-Source: AGHT+IETXIEOKz5AdmPn0udLfQWIZMvyiOxCspSCp54t/QL3em4hfSFiKc8Svp6hwjPw/EvjJxtWrg==
X-Received: by 2002:a05:6a21:33a3:b0:2ca:1b5:9d45 with SMTP id adf61e73a8af0-3614ed962c5mr42727377637.32.1764684257624;
        Tue, 02 Dec 2025 06:04:17 -0800 (PST)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-be5095a0e65sm15033984a12.27.2025.12.02.06.04.17
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:04:17 -0800 (PST)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso6545378b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2025 06:04:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVJxSaJX7r9SoGOWfu7E+3Ss5Pqr4ceRAg2UvxQofBav8t9tqMynmDNToGFFJwfMgSD09PWWM1R7baRjimLCF65TxrN@vger.kernel.org
X-Received: by 2002:a05:6102:26c9:b0:5dd:89c1:eb77 with SMTP id
 ada2fe7eead31-5e1de39d9cemr17004298137.29.1764683823416; Tue, 02 Dec 2025
 05:57:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-2-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 14:56:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnP_BfEGwKLqJN8UevZeVXg10-IsXC-lVqCY3H9e2HFkqZ11liOD_Kw768
Message-ID: <CAMuHMdVJD4+J9QpUUs-sX0feKfuPD72CO0dcqN7shvF_UYpZ3Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] cpufreq: dt-platdev: Simplify with of_machine_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzystof,

On Wed, 12 Nov 2025 at 11:37, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with two new helpers: of_machine_get_match_data() and
> of_machine_device_match().
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks for your patch, which is now commit 6ea891a6dd370ab2
("cpufreq: dt-platdev: Simplify with of_machine_get_match_data()")
in dt-rh/for-next.

> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -219,20 +219,13 @@ static bool __init cpu0_node_has_opp_v2_prop(void)
>
>  static int __init cpufreq_dt_platdev_init(void)
>  {
> -       struct device_node *np __free(device_node) = of_find_node_by_path("/");
> -       const struct of_device_id *match;
> -       const void *data = NULL;
> +       const void *data;
>
> -       if (!np)
> -               return -ENODEV;
> -
> -       match = of_match_node(allowlist, np);
> -       if (match) {
> -               data = match->data;
> +       data = of_machine_get_match_data(allowlist);
> +       if (data)
>                 goto create_pdev;
> -       }

I think this is a change in behavior:
Before, the pdev was created immediately if the node's compatible
value is found in allowlist, regardless of the value of data (which
is always NULL, except on RK3399),
After, the pdev is created immediately if the node's compatible value
is found in allowlist, AND data is non-NULL.

>
> -       if (cpu0_node_has_opp_v2_prop() && !of_match_node(blocklist, np))
> +       if (cpu0_node_has_opp_v2_prop() && !of_machine_device_match(blocklist))
>                 goto create_pdev;
>
>         return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
