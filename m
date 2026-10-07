Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163584AAC50
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377996; cv=none; b=NJgA9i7XqQsnhpn6EwpEn3uof60uBHxPxRmJs2bUuflTl6RurRbaRJJLk/sSmq/L1TN9lUAMvO07HP8VCpM0E2bBM5KYROVHQAE1Ou8+ZPOBoQTVEjiw7t1mmwvXoXqeFwsin3TMV4W0//U72Sn+fHi36T/9ibcac+GOYeMr4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377996; c=relaxed/simple;
	bh=dXlEoLZn8xIfnNC7jxrPUVl7m9FtX0nbVYNpExtd+WE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5+tZdTCTGnEp/3xMq9uZeahT9Vh2nSLaKbMMeCMquTFKR3zE+YFTVdJJe2NCbiIpdip+3LJYqlH8frFildgUTjyB1yOfEv/dl1VCzxOYAZct8Qw82wNifZVhY+uOGqPA6ZMewVWxdz7RXQNwexAlysrhdgFRHUl9JyLcKuTbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B+5KW5Mx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B+5KW5Mx"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2a832c6554so268991566b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791377983; x=1791982783; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=B+5KW5Mx8TYu8VtZbOMLgAUVxdUYBD5u2qe0CTv8KoYgmHBAywSvFffRCiZyvrZagJ
         n0jZOTQUNEjekyfnW+uszsiJLLd8ntT+Do4f80338G9JAEAjCy5J/IOdYyg2phf1rJnr
         4z5kFx1a9D9WBi4ioKNvQXgzuE3uxm/T78PzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377983; x=1791982783;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+rvRY3MxyDDJlHyGuP46Q73CKubNnzJd6vSmt+6L74=;
        b=OFIKSY7szNBM+inHJuU9yPLSm1oIm3m0lALVvnhEBIM1HcKMevEQXHNo1qg1D1GYD5
         R6sbgf2yspDUec5uM6oMGTrPA3KKVm6ZhsJr5j8R2cIqaQ1w9o3sWVhUr+jNmpwUyNoB
         dqRdJe9V/RJez9zqA6uQH0imtQbQ1Bk0ifMH1tPRYbsDddolQyoQNbUYj9PyRvFjO9rd
         UHuO9ZS1W2pKPre0BdJ+mDfUkeGi/EYyQ6sQT3CtWpJ2CryZUqwVYA7wysE9+lchJvQp
         gnZMa4PKQJ0725U7LplcodbUP+8YuIiYcf3w6Xkd/5AUCHZLXOlOFrLMDadGEdL5Aniv
         mDyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFffi1CEOwg9GIO1ZvQ6TMm9kbgDWfaHz2NyJxXOa1CksmylBqq+RPcN78S89waKGsH5Z4v1RJaKq7CGniUKk5WQgu@vger.kernel.org
X-Gm-Message-State: AFuF++lLb4LM70/Vb+yTyo/ACXncG9+4iBM9ufMZqiW1ogzvN9pnBjmc
	qaBU9OALjE7a+gZ3v4JmwiGb7bpRgH1D7jIyK7MKEIsOePIC00ZpG0cDtC8F3VJXY7yR7SH8kIF
	Nl+B113mf
X-Gm-Gg: AYBFou2EmXa+WQSrxpPcUyFmJDe+Y8C9CeyQN6OG2ZhjWEnPI02mLZPjGckSsiU+ZtB
	V2JBkNiUA8uHzVuok5DtYnYaYujNYkJpio9neKJKkTT6LhLy8wYOOT2Nja3lUPxTqD94pWr4vlu
	eSoViJnAIpLZz6+dLwxiftYaAzWvJQZtD98MYCgCtQUQpTjium11GtR6xoyu0lSLAuXLnTAtfgU
	zP4MksO0/Gj10nqS0V2f/LmjmEOsf3f4LKMkBdkt3SncWEDvTvrwadgpnfYUShhHuFNiJyL95CL
	Y/zksqAQPyGbhAkFBO9XKN2I3oHE8ZPGYSiwFdVVYmu8/WXnahpy6nvqItsnzyOQBe6T9/KJat/
	pdB5pQFkJa1SaMzlATMmSPLyhvw4Mcpp7xe+QfvwqWAlRi/C4lkyxFqCUkNx8edb6EWCL7Plp8b
	IcVaqESHICl01RG3abHpVLbUW6SMGf33RhoW61KurCrUnaaGhM6LvoPxO2HVdKIlF8uxwcSiYGo
	OXAofiyj0kD7m6AmbnOxUXCDtTGG2jhHe/XHA==
X-Received: by 2002:a17:907:e143:b0:c31:8984:7fad with SMTP id a640c23a62f3a-c31898498famr35258166b.15.1791377983003;
        Wed, 07 Oct 2026 05:59:43 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c317c35ac5asm100618666b.79.2026.10.07.05.59.42
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 05:59:42 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2621070a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 05:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByxx3zXWm1VWCrplVjxOO7tHxkwuCFdKDYwF0V2OzgzapbYX1Ryr27YWtlCU/kAXLUvLjMkse7zoZm+JFPgNsOYLowu@vger.kernel.org
X-Received: by 2002:a05:6512:b83:b0:5bc:a9f9:b649 with SMTP id
 2adb3069b0e04-5bcd06e8b11mr798936e87.31.1791377665307; Wed, 07 Oct 2026
 05:54:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com> <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 7 Oct 2026 05:54:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
X-Gm-Features: AclHuK-ILqIUiSWOn4shaOpkE4nC07lDEACeQZtcv49rxdfgv5oCmNXTTOAhHtk
Message-ID: <CAD=FV=Vh-GRYtuGM+By9BfpO4X7skp9QOYeHRj7Rzc_tgQ0KEA@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 6, 2026 at 2:50=E2=80=AFAM Gopikrishna Garmidi
<gopikrishna.garmidi@oss.qualcomm.com> wrote:
>
> The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
> is not in edp_panels[], so panel-edp falls back to conservative timings.
>
> EDID, read over the panel's DP AUX DDC bus:
>
>   00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
>   31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
>   0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
>   3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
>   30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
>   78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
>   00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e
>
>   02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa
>
>   Manufacturer: SHP
>   Model: 0x1572
>   Made in: week 49 of 2025
>   Display Product Name: 'LQ138P1JX61'
>   DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
>   DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)
>
> No datasheet is available, so use delay_200_500_e200: it keeps the
> 200 ms enable delay of the conservative fallback, but uses the 500 ms
> unprepare delay of the real panels in the table. This matches the entry
> for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).
>
> Assisted-by: LLM
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

[4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
      commit: 7cf88d0a3f5324eb44c2ae9840568adb2374ec10
