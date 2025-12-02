Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CF13161BD
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Dec 2025 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764684439; cv=none; b=FXxVkpVCXziBMw+qb70N2w7y0wXPVXJrh3Ikv7kZydUyTg40lt57X0pnZDnDlJVoXXmgCuf71zNKwyNxGWQuGlt4MdxHTRgY+4E6jKSKXsmsILWTmahTpeXSdEpjMCJnvvAZbHUwffS04+uVGy11POGWxvFJO9oSA0qKkSI1l08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764684439; c=relaxed/simple;
	bh=vHUrQ6w324fYnCNxiHl4mdFInNGEkkrZLMojf3dBXGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keJWN9CllgCoX81yBw2ax7G83LqsMDNpReJ6kz9jsrFtGwEFvxtoUZRJ5swqvbIrvicDkT+0eva1H1qy9LOE6O04/YrGJ4HHygk26zqqZwqUcWSDiZ/UapWG2/NVihuijRixpsQ+6aH/yCOYYcd6P5M8MEmtPsvW9E19Joj7Mpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6420dc2e5feso4336892d50.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2025 06:07:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764684437; x=1765289237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P35uIC8+DPfTCMfHgmdtX7Glr2h/6n9nJWKZMAhyHf0=;
        b=dDsYNe1fI5goEZ0Lg7Z1yt/tFCaDdzCo306dgVzlNg3IlLufNhpBBxg/Xiq2PUj3Lf
         j9R/rMxbm2D1H19SuKm4U+7iaImPLiqD/ttMHlTl2Fay8yps6lMqkR40ObQ8LjwJQDfq
         vwoZjvboxZnN4k//fYsejcuR+RAhtNvdgtpadF+2BmWlytvXcltfYy8gF3eMTR735j2x
         lw4sNiC/ueSjkIfht0INIaAY/vWTLhn0dRXFpBoHDywWUn/tRus+TVrsJDZYx46uNbd9
         tb8GdqukI+idICn9ODM1mrsJi1jXgVscJ+K//atDVhUQ8WeRHJpbGsntdTAEqXfBybiI
         mkSw==
X-Forwarded-Encrypted: i=1; AJvYcCU59J10t6MriEAi+JgDWowbczDzRfmB33twrsz1q1+Ah8Xjrydcw6IKHe8v8z1Hoa0hPv7WDl7i9IO4mgKimk0X9mmz@vger.kernel.org
X-Gm-Message-State: AOJu0YwLK0FcsqveGbvXngSgVGlDIZo6PhPP/iX9yznxw6Qe3ix3nmw9
	hpoWZS/mXEdd1GIZ25rnWJy4+RMwhZ1vneOKdHXR7TeHIBlUVe08MTdhEoHkikJp
X-Gm-Gg: ASbGncskrPSBHznqI02XJazBM/5P1mLQpD3qRrh+8rDduHWBtk1ao7HZbbnBty/3zt8
	7k7goQIimK9E+3Xh9hJDFnlp07h4I0IayKLboFV2+5Gmwx7I25xFniDdLZi8/WiNeEcfhBjj89n
	Bt140ppoGzbuV1zhkmfoXQtsxGZTRiIekicUMhHqoSDp5y3JKxZ7iTp4+VJczxAIi/p9Buzvl2+
	HTW/Z4FiHh8z1wzNrIzLQiShs6IzsskiFzzRpyrSv2nV20/kQwy9v2ubtv2LdEwivqclwiLcjO1
	9pS3VvpL4tgAVoh+gz4epmgF9QJNlpM2HNTJRYGuvknGCdhhiHEdoT+3hr7z9Zj8bRtF53lqAHz
	HixUQ4DSv7cWeLLgepgaMxjVAlcdvbmZ/sFDQdTr9BUBhPd43BdjC/ICYlgwBVsZM8u5R/tuIGz
	RL29H0cJuCLxNQ+FpMmHqrX0wJUvCeATFGVCHmZe6+5SN6qH+06OSO4SpBMis=
X-Google-Smtp-Source: AGHT+IF7vl9X9h66HMULkRvqf3JAIWeRqy258D+qKdPVe/a8ctIZSGUznzPbslywXV/gO3lnxq3tCQ==
X-Received: by 2002:a53:edc8:0:b0:63f:aef7:d005 with SMTP id 956f58d0204a3-64302acdaf5mr25518768d50.61.1764684437011;
        Tue, 02 Dec 2025 06:07:17 -0800 (PST)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com. [74.125.224.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad102ac1bsm62709157b3.40.2025.12.02.06.07.15
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:07:15 -0800 (PST)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6442e2dd8bbso912379d50.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Dec 2025 06:07:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwghSwAEEKbxOz2uRsviS8QHhWR/W37plWE3FFsOcTb40VRXbveanjlHXql4ZLwaw3rm4KcOZHwMv/XbKAlVOFt9JA@vger.kernel.org
X-Received: by 2002:a53:dd48:0:b0:63e:17d8:d977 with SMTP id
 956f58d0204a3-64302abbb9cmr22209916d50.41.1764684434875; Tue, 02 Dec 2025
 06:07:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251112-b4-of-match-matchine-data-v2-0-d46b72003fd6@linaro.org> <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
In-Reply-To: <20251112-b4-of-match-matchine-data-v2-1-d46b72003fd6@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Dec 2025 15:07:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
X-Gm-Features: AWmQ_bnQtK_C28o8ts-DX6QMHSfgR5FWBqGmuyp3cjxdu41cx4XkoPs5W_lQhYE
Message-ID: <CAMuHMdVAZpp7M+pp27+kHZwoet2Q8Rm-Y4ePu7=W_1oXhebLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] of: Add wrappers to match root node with OF
 device ID tables
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

Hi Krzysztof,

Thanks for your patch, which is now commit 4a93adcbd201aad5
("of: Add wrappers to match root node with OF device ID tables")
in dt-rh/for-next.

On Wed, 12 Nov 2025 at 11:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Several drivers duplicate same code for getting reference to the root
> node, matching it against 'struct of_device_id' table and getting out
> the match data from the table entry.
>
> There is a of_machine_compatible_match() wrapper but it takes array of
> strings, which is not suitable for many drivers since they want the
> driver data associated with each compatible.
>
> Add two wrappers, similar to existing of_device_get_match_data():
> 1. of_machine_device_match() doing only matching against 'struct
>    of_device_id' and returning bool.
> 2. of_machine_get_match_data() doing the matching and returning
>    associated driver data for found compatible.

Shouldn't the first function be called of_match_machine(), and return
a const struct of_device_id *, cfr. of_match_device()?

>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
>  }
>  EXPORT_SYMBOL(of_machine_compatible_match);
>
> +/**
> + * of_machine_device_match - Test root of device tree against a of_device_id array
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns true if the root node has any of the given compatible values in its
> + * compatible property.
> + */
> +bool of_machine_device_match(const struct of_device_id *matches)
> +{
> +       struct device_node *root;
> +       const struct of_device_id *match = NULL;
> +
> +       root = of_find_node_by_path("/");
> +       if (root) {
> +               match = of_match_node(matches, root);
> +               of_node_put(root);
> +       }
> +
> +       return match != NULL;
> +}
> +EXPORT_SYMBOL(of_machine_device_match);
> +
> +/**
> + * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
> + * @matches:   NULL terminated array of of_device_id match structures to search in
> + *
> + * Returns data associated with matched entry or NULL
> + */
> +const void *of_machine_get_match_data(const struct of_device_id *matches)
> +{
> +       const struct of_device_id *match;
> +       struct device_node *root;
> +
> +       root = of_find_node_by_path("/");
> +       if (!root)
> +               return NULL;
> +
> +       match = of_match_node(matches, root);
> +       of_node_put(root);
> +
> +       if (!match)
> +               return NULL;
> +
> +       return match->data;
> +}
> +EXPORT_SYMBOL(of_machine_get_match_data);

These two functions are very similar, but look different.  If the
former would return a pointer instead of a bool, the latter could be
built on top.

Even if you still prefer returning a bool, they could share a common
private helper returning a pointer.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
