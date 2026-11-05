Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842951;
	b=Se5vf9fjgTouq2ho/Km1IexCeFb5esFMz61+iyFXG4O5R3WVNFIWO+PgO8atemR5nDgA
	 RoqXR3J6cKpQd7QmlU8lDs3pQZdDo0ntaXt4AzGcufdFJDUgygTv+sn5J7+x1dv/kTAG5
	 hXF4RZHFncLcejSkK/hFscuUdAe1jXfsvp11wPcm8JERFrH/dfDvViVsZn2oQRAop23vV
	 k7mzrCPtrlM5ujQ7IKn+JDRT5D9dscIDtTQJWpeTpnJNEFf897LVtExSqjhREgRraGRNT
	 QCi9tZCO5/cXDe1ecVC+0sna7tWYSSYzvoZH3tWgVc4uoU6G5yV2PIuPmbPqtmKPvqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	b=FDGaUn+ftIcm/hpDqkWPeYsfFLmVH9BthaDJEnk7HBMZeZ8A/RLmNSga2FqwvgNxb7GN
	 2NJstvZMf1B7WoVNPNlD2k3CLjnCLbbLTF5dvOQbKRnOuvhTopT7vD0rsgrPYdX+RpHHq
	 MGhclYotREKvhjMUxraUU7XpDZbslJ4LiWYmQzVflZsRXjXiNWXv/1QFTKindEYQ+0bDy
	 92wuUuVrBwUOcDrCYQECRzicuVhbgaFHjHOfrr0N66MFrPf5sVO+vqh26vP91JmIZdbm+
	 T1LDfWitgkC2e5tSwt+iwFkvWz9fyFfyVAi2MG6ELbW3g8XwsZ84SQoDX9KuZ9Azkdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B25F606A339
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 01:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B25F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RzVtavYk
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7CE653F6ED
	for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2026 01:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793842948;
	bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=RzVtavYkE/LBMxpLKB6QGcQKcna+jHZBHZlBmThLYzqMGoIRU3ImDyxu0guCqITMo
	 1eTiTck2Q1vsq8KW7GRcZCEOtnHGWaCZi4rk4cFEoMMc69lT6Yh691ZABf7DsakKqz
	 iyIB0ekVqFgCJlXYlHWYMa2mpnlQbZpKa4e1pK76R0MtJBN0J9RFHLHX3tVGFzzOnP
	 xBANUb2YsSym8zl8ao97CXb1wvT7eNVhiBPw36eW1PvLwFTUrpxgnePVbPXbo53B8i
	 4isztSi/ujZGsKjwC7zZ9jrm8Qgs3kUcXMwAjZwUaJQ5gNUv6UaSIZ61FT/VasXGcO
	 Rs6UaqOiE9Nx+x2Lr/k5oW1f08JL1YNEjDQK+fnfkcrxXy25dGIpaYLOfw3/cLjUn0
	 6JUIYm1SSAV0lAE3yVIwdGgc9mO0QTb8jjEVR0FUjMCCZWaqP1O1euNBFq3DoNvSTd
	 vLHzbUh/SiNzgaBnTkE5fDvUd9oDV0ctvrRmK4PF6FzaSDWWULYKdcfSgi9A44mrIO
	 DU5HtQX7fJ5keKbmbq3LA6sWemlfErQwfVn1dAFMNTrOvXIcBCxI5SwUzR8GNj5OHg
	 WEV35Uyc2fPyKEWqofJC+HMYp7pwKHsI9El4JLf2lTVuGHrjkcf9RQfcUydXl6Kkbn
	 wqw9dLFexkl5BN1HI96ZQ3CE=
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c58d35c0aso166510eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Nov 2026 17:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842946; x=1794447746;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9y+op9MwcAYKiVxV6x1Polc0TJVtfhV5fChD4LyxGU=;
        b=QPz2BSYH1TgJpyLiVccwDLqERvyz89tSKjHj78Wh8XnO3H9V+hX5mBr4wFqvnKtHDR
         sK94Xr9ybZH0UelmcMLx0ck7/+bx/mpCAq0NK2IxNjG6IChKPGTywSb3D12ajdaiiBlV
         sMIfv/G2EYOgWf45cLdf1u+65jSsWEDLm8vtYFP8FNUgSrgpVo/GU2qoK99+MoMBGBgu
         YeVlWVUctfFtS32dhtwfF+OlkaOa+U71HfzbMxoN2OtlnBozmrPOlIz8EGDhOYnHM9lh
         19j80JXhQzW0DchUABCbmAiHPPsLRR5jjjtjiZio7Fdnd+x4M17CAdeoHY0m6KBPt77P
         pRqw==
X-Forwarded-Encrypted: i=1; AKwUvBz3MkDIKaYfdFdi1k7jyrcUjCZl91N8/KFar76e4AybC852Jk4d705fa6ToEIaxqhV55NsgbJ0kjyAIXk8LfcZPW7Zw@vger.kernel.org
X-Gm-Message-State: APuU4Z9n7joNM9EzSOpEcwG1Xy+sKw12b/SRgTTTfSB2bjaxAKyaEoP2
	pa2a2Yf063+gC8A4pRO8oBadGJqxxHL9FEhXyQIZqQqp+PEspFjZsQcvllCeUpgVxQdci/1BBJz
	PmCcgHdlXFdjO1LatWfCMq04zg1nyS/ncwAhYWWzPgeofZglYHfEY/d5Y+K9mSJIGLUZ/cIdVOi
	Fi8Za3sxDrqRiMWrw=
X-Gm-Gg: AYBFou2JlUnQxO3s8gsHzj9653zjg2niOYlUkPtSxB2fMCHVu/bdqMt1NrjQRN4wDKn
	n7Ef5brT8OZQscYOKLacmevhv3QNRaB8MArHPm0MFbpTqzJ+/MKXZEnIgKayLedEfz6pGrkMm/P
	vE4tsG51klV1y20wD60w7aelmhHM0p9Y3baa1oKa2GgLqhY2W/oaJ9JwHDhzDLZfBGpSw/kp97T
	7icXxA6JQuM0JI4DbmCnPcoiQY+CxQmyBEbd+YO18A8hQ4p7MKQu+4OLT06k9EYxOgWuRbIjDLZ
	/p99MMHHTpHQPXwWb/1wn5z2hsjNiDAQNJRKCBQGBqwgTGYcC5dkwWYznlKOMtWN0sa8BWRp/qu
	d21G9ZbZV0IqjMuXMnRdhbIp4/XDGLZpGjOGo5Qqut13PiFzFB39zb1v//5CAgR+kN5lALRDEfv
	ZmCfnr61Wl3s4xbOOaFkfr7QLJ9R7nSlf8QarHUinX14/YQt4rObKHjnbKtHC39vHBpmeWG5uST
	Idl68ss04kAuFu5sOzyip8Fy90kEvDJcg3DWFG3ZNYOEXacS4tFxrcENMmGNfBjt9idAIPG0z4=
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43089049c88.2.1793842946360;
        Wed, 04 Nov 2026 17:42:26 -0800 (PST)
X-Received: by 2002:a05:7022:7e0c:b0:165:be2f:c56e with SMTP id a92af1059eb24-1ac5b7dcb2bmr43088986c88.2.1793842945775;
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Received: from localhost (2001-b011-2008-445c-f38f-16e4-9788-cb61.dynamic-ip6.hinet.net. [2001:b011:2008:445c:f38f:16e4:9788:cb61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm11629150c88.7.2026.11.04.17.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:42:25 -0800 (PST)
Date: Thu, 5 Nov 2026 09:42:23 +0800
From: ChunAn Wu <an.wu@canonical.com>
To: Markus Probst <markus.probst@posteo.de>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com, Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, cocci@inria.fr
Cc: linux-serial@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v6 1/3] serdev: handle devices without an ACPI or device
 tree node
Message-ID: <auve/wI4t7A+2G5W@an-XPS-15-9520>
References: <cover.1792856688.git.an.wu@canonical.com>
 <263a607c3602f31a3f6fdd245e3c2008cdf97abd.1792856688.git.an.wu@canonical.com>
 <75e6d86340073638d966acb85465c28e6a08ceda.camel@posteo.de>
 <20261027214742.3624605-1-an.wu@canonical.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027214742.3624605-1-an.wu@canonical.com>

On Wed, Oct 28, 2026 at 05:47:42AM +0800, ChunAn Wu wrote:
> On Mon, 2026-10-26 at 13:59 +0000, Markus Probst wrote:
> > Reviewed-by: Markus Probst <markus.probst@posteo.de>
> >
> > You should add the maintainers for the modpost scripts to To/Cc.
> >
> > $ ./scripts/get_maintainer.pl scripts/coccinelle/misc/of_table.cocci
> > scripts/mod/file2alias.c scripts/mod/devicetable-offsets.c
> > include/linux/mod_devicetable.h
> 
> Hi Markus,
> 
> Thank you for the reminder. Adding the Coccinelle and modpost
> maintainers to Cc now.
> 
> BR
>     An
gentle ping
