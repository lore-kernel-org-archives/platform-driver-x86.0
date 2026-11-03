Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690510;
	b=ukUa4LgzhzdQDesYYwcssJhRKUxXpqLYyptavjE2c5pkku5OTn14I8dBn0cmkz8wdeM4
	 l+qBl1bya+yDD39XNKBzJwI2mJxDYXhCQqL8xz7Rq7odzoqa0/k9mewGrWIFLW8Ii7XMY
	 61JAmdERa3YEim4w/0+yMOY0/Rr/nQOqvat4Q7Xf/NH18+lVlpZBxfBihGMgtWFLrIEXv
	 NVJuyCuzAoapXmw86csWgAS20rLh7SOcwiLsKR9c2s+QKz28cDvSOXKY9INVEnTN6j3X4
	 CF2CVxErA2UJzo4GMkIrvSLsmE37JXAxD/SPTQO6LYy+0lxPbKq6Xq2VdjhVNfEFgWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
	b=OBX6zijuNlP8ed8Vk5JrjIGcbF4GjdnhlB0KTIg0UJNLmO9Gs1VwxUY9IahH6SnwEMs0
	 sw0Q3CrRhytIooov629Waf5wqIrddnXSK/4xRcPLBUBWwjO9RKD6jDJU7x5auvY9M6y0A
	 Z7IBhEkPZAd7f9ZPXpq827Eix+847EQgFFb0izIr3r77Y+s1n3Kz+R/GvA9X+wInosCL9
	 8C10/RPz5ve8x9gCbZ4e44WrG55il6h4rY6SQuRGUdqJstOaNoCH5QWNgxCqi0rocaUEX
	 /CAmPFUvasFO8WdSgfIzSaXNn+L3XGSMdlfjmuse51akiqYKt8zJ8YnssX5Q8a9WxTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAc5e13a;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C941606A329
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 07:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C941606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAc5e13a
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so33836415e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690508; x=1794295308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
        b=rAc5e13ajULG1v3AnfLLIAD5cCrCxGudDlVWRdaYveV05iOKHOtx6s3SmbzF4RgQfc
         ngE1LrUGF5rKL7pwoGri8s2Eb+TzsZqa77WH1ekA3cC5qiw2YKUL/BS9YypQOQDuXdL3
         wo6Z/vHxOPrO5n1kkXCTOwIi8CrIlZe4NAL4OX9ZJHC0nYOodQZu6+62QUwfYYIDmSqJ
         35pvTa60Z+HScl3f/0Aj9abXG84txnSzRtOon3j8uk13JMeC7tiyTAHQKkzdZOAl6Vzd
         okqBPoNoZDwcJaffKKCNPlMTg0H3K43ZIrK4FG91Z3h2QYGhUSVo6MXDO9WjLlMSr3Kp
         wVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690508; x=1794295308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
        b=BIYu63AXOVG+nX/DRiB/tb1wxRnaFODJWYFhKfu+tQDJx15hfbuZn5wWf6045WG2Ap
         uaE7wZwiOIIPoCk8UDT8teTnmzXGRvXcz8eGFbD/zITV5oD38kQOhWuBXyC+M/S5qv+H
         8m1ZLU9enIVjkLh6wfmgS5mwpsOakFUKMLiAWqMVQ7zvhDCqngIrKsfvgJSvMiL7BzQZ
         NWgzCEuSBEMjegIfxb7wDiU26JKusO3Q/Y3omTLXgsOHAx8lJtGj8ugxgTXVrzpPA7rr
         Nnu9IZhN9fZQIBF266B1gD+PXRMQHV/imvDlWjfZqf/sQQPTrpJtOuEFd060NjTJGNyU
         whcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxf8kMxChWVM4qxtn142cJ/XFIrI14d/qU4xnHXHRJOMvnXZYHdkQMyqixt06EMEFJY1tfFNNgCsB1ntNp8wWx9Rqjj@vger.kernel.org
X-Gm-Message-State: APuU4Z8E43h5MLqtLJQuFc1O0Rx8ClaqKCO2h2zFi16N842mCjeVFNQ7
	HjTYJr/7KrfPvAOyQBk/s5ovsYPsnZOq5QR4G5ldiOLE8zMY4sTI2gge
X-Gm-Gg: AYBFou2otsu0FD7o1OnVY0OdjVHxDTIY/3lHFWHxqoybzBzBfl5euk+f39XUleWG3yn
	EKB2EUsWDiWATfu3pBX84sMoSm3DqKve9FYg8WpYAmGtwdI3Ml0ZAAx6GlPe5a+HVIPoQW+M2vE
	H4SeLnN8XWzkQiBrOFhDExkscCBoI7G+Il3XL4LIF+sr0zbiihoWBVqlwHnvW2GqqmtGtkveoC0
	vIsMgUjSicEFKam04C9C9ELgUKRfnjLGPurW0xyGRUbMqIhFDqgY+Rw04HnSH07mu3IqaGU9+Ln
	Kb4QgN+Dj+J3IL6q1j053/PLan4KXQBZ9qEq2oEhcoSsbjHQFyDMgnFifXfum6veTKawgdxz9vT
	M1A0AS9gAL3dulggdeGphjii3Cn3C0falQeb0Jb+5eyZLeTCAKz7LhJ3mwZQUCW6KMKKnT1GFup
	lvVLCYNqsbN5VUwWU3+BwzCZ5Q/9PCHfON/eMG0ziHgjg7xPwKzdcL9LZg9N3AOrHHupkM62LZU
	WUYweL+dCr/bq/IIhR7LZt/Ng8iQ2LgIyY7MW6No6vdN4JGQLuiBK5Wq5+WSq3yWtFhBdx1ZcVD
	0EsX50dVper5jvXKnC9hEHvMKMJ6hk6x/uvLIZYudvxCklwGPwpiQL/6DzJRWs1n+d09s9gYJVr
	AQwsQuYiM9FOVbIPiI2IbQQzhpyL9R76N2A4=
X-Received: by 2002:a05:600c:e548:20b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4ac86c9b146mr172730365e9.13.1793690508288;
        Mon, 02 Nov 2026 23:21:48 -0800 (PST)
Received: from [10.77.100.5] (ipservice-092-209-215-046.092.209.pools.vodafone-ip.de. [92.209.215.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm43172275e9.1.2026.11.02.23.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:47 -0800 (PST)
Message-ID: <cdf44987-3a3e-41f2-a067-8181aea08880@gmail.com>
Date: Tue, 3 Nov 2026 08:21:23 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] power: supply: surface_battery: handle battery event 0x1a
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
 Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.10.2026 um 19:32 schrieb Ramón Jesús Miranda:
> On the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100), the
> Surface Aggregator Module (SAM) emits battery target category (0x02) event
> CID 0x1a alongside standard battery status notifications. Because CID 0x1a
> is currently unhandled in spwr_battery_event(), surface_battery logs:
> 
>    surface_battery: unhandled battery event (cid = 0x1a)
> 
> Add SAM_EVENT_CID_BAT_0x1A (0x1a) and trigger a battery status recheck via
> spwr_battery_recheck_full(), matching the existing battery state events.
> 
> Assisted-by: Antigravity:gemini-2.5-pro
> Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
> ---
>   drivers/power/supply/surface_battery.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/supply/surface_battery.c b/drivers/power/supply/surface_battery.c
> index c759add..a3fa899 100644
> --- a/drivers/power/supply/surface_battery.c
> +++ b/drivers/power/supply/surface_battery.c
> @@ -26,6 +26,7 @@ enum sam_event_cid_bat {
>   	SAM_EVENT_CID_BAT_BST         = 0x16,
>   	SAM_EVENT_CID_BAT_ADP         = 0x17,
>   	SAM_EVENT_CID_BAT_PROT        = 0x18,
> +	SAM_EVENT_CID_BAT_0x1A        = 0x1a,

I don't particularly like it being named 0x1A. Do we know what exactly
triggers this event?

Best,
Max

>   	SAM_EVENT_CID_BAT_DPTF        = 0x53,
>   };
>   
> @@ -368,6 +369,7 @@ static u32 spwr_notify_bat(struct ssam_event_notifier *nf, const struct ssam_eve
>   		break;
>   
>   	case SAM_EVENT_CID_BAT_PROT:
> +	case SAM_EVENT_CID_BAT_0x1A:
>   		/*
>   		 * TODO: Implement support for battery protection status change
>   		 *       event.

