Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690531;
	b=Ywg/C8cSFfNYqO45WiaGzsYQO+FDxqZ95SdOS2XczhNN/VNW/K2FImtbuFcwoMvLAbrw
	 g81vVHcIxWqFnmhQrs+ljqfwrzNLQDcia7GG3mwxndsKo3ahRY4MY4AnqPlaz6d/OKSw5
	 bMCPR0yXw7E9pTGPqte7rcyxHlSpZdU2s7GPFZjGTy1oQIU2Da+kcdcTZyAr165HUBGy0
	 ILYNRxOLnQ0e+4kiELyluGWK5qSUWOnN30wNjFIx7TJYK5k3jqU9Rd9nCmTpjw+mS9Z5J
	 Z7dpNJK3lDsi5h55KP9uVEXyVDhzlKB8Wfr+kBvVqB0Z7WO2rqXvIKr7vomTQGIPgaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
	b=J3JnC36O8+DYprbO7BgO7giYYUjPEPC5jmYep0OKWt/AUmBw+8EFDCCG+QtNYB0Q032T
	 H/18hKYBL7A+D9T5A9vcOvXjET71IL6c9haiv63MxX3J0qR0VZ2AEx7cz6s6/hB2I3OXn
	 qwG/mLys+6/NtbCPjYUbish1DFxzcFDjMHdZjNhQvpOgEji/NiMUv9izMPmZHYN1cdOhz
	 rJEIm+L7RsmBHpSfd+NHI2BJE1kwPayeRADgQubx6/45N9ms5l7KGpztapDI8mPBZnOyX
	 dEItO/XKsMDlLXz+ljx2O7k8W0l2f4Gi+muB4AibdzqaHfXN34Ed2/irW+S4CLdWO2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odyE8Yx6;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E75E606A32D
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 07:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E75E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=odyE8Yx6
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so24454835e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 23:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690529; x=1794295329; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
        b=odyE8Yx65t7UsqvcKqLhGzKhrrqO8u63aeWrdMumgLCHNAkRMRNKLZ94Fdb4ABER4G
         Xqxm/dhzsDrYsM3LYV2j6/Iw8zJ42pkhJsIT+AHkvC0LD4ak4XsSszP8mU+ocuZ7G8iO
         RLbQOxQfAiqF5C7K2pXjz1ukuvWPTDx4eQkaPV4WjOrugqcyHQ155B+DRXG8EqpS+iHs
         cimiWx/UsmQHZW12PGCdfs5k6bNUs4XBVMhSfJv6lgEdTjGiQOOKtC7Ew1BVUxLe8OsK
         31D0UZANQTVx0TNw12/y7SFZvysT0hxyv/YuVw4lPEREjVVGLY6cDMFr+FCmkwojsSA3
         6JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690529; x=1794295329;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aU0Fo/t+9JMAeVCzpMHJlOqMoWJ9Ex7tTQwt5AkyeMU=;
        b=wrOYeSZ9es/RsYVqjDfgFMjK6ZbKc0kwN+o5QlRfx73sikYRotrTFT7iX6wUe3vw8g
         GtHnpEakHieXvJx0bLJ+A8fUXW3EcClIoq1JLI/xMGwafeOm02LYYREsg11wBfIMcX8G
         nONlrCQuB6l/wVE1VuSJ7kZMnO1AM4alK9g32PuCNaFJI6YyKORTAVlLOfcN5ZVSaPaS
         ZLhOz23qWE+b7kg1kXCMGYnqvjz2ca03L3AdIhXzkTwpzVXokNNR4Cs3c1+sYqasyp/B
         8qClAUHXfcc4GERuArQXp+NY4d4An4MFtOK0SHFD+soTcAjI73CZIpCRyJ2B457sPUec
         3f5Q==
X-Forwarded-Encrypted: i=1; AKwUvByWjBj/KaZ9mP1K3YK9n+OSiir/W4RttyMBYNlYSGqdRvfrb2kj0uQL9ZXF7M48aH4EFQFKAZNvlz45tNVwkOpTnN9D@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qta+XiJ3+dKdEmDInJHcYBcpKabZ7UiDbqxg50aCRdPPvghWH
	GEekvRQcWPRHMghQwDjjSeEYLpWICu2esWqJ7XeSCD+jztAIxjYaVRNR
X-Gm-Gg: AYBFou2vu6w72p+UscxBG25p6sgmpJH4Y4iH7xIry1pQVfPP/Ia1pVAqbDuxXxhNteE
	LUuapWHdWXePPdrHHD9kUPrefcjbYUcbNt9G1CNUbU5DlnGKjTDuPo8frW8LcLBA6TDLGQtXT01
	CJnqeNI4xF/y/i9sRqDYXvCMdzE0OKnm6pQPnwLdBkC0d3AWtPPQkYaTB7PWddugUpmsfMACdyN
	a8UFGGBBsZisiOmWvZUnUoKcwWCEZm3f87l66xJIcmTNwXsWc1yRKKj2yTY/PZJ9nyngPygQ4Ou
	rV9qKOs9Yz8TcqAfLbMvWwDBqUjSwbw7D9MF74Tr4Qlv2zloxymWJMRi+0Cku08+KKmO19elz5f
	Ip6i7yfurFiJf5HC9rBC/5ijJ68nu0asMHatLli53P+QRDIXrwQZDIXpJGQXUwhuX2XkGkTJyEW
	guiVozXTnajTu0EGIGZ9SCjXici9oD4bvE691J9V2FwxwXilybLUqYsvzj5GUc4CbYjjAd+Celn
	uyGn/8u8Mq9LWSynNkJAbmiARyZuy2STWQf+7Dd8+ArxeWsazCLPHB2zJmPz3uCywTjsyxd7ZEI
	v3EwRzFRLdSegcg62+r/MliTKcME/6q5LBag+j0UoVOzI4xwpxNmuNOfXlpqwYo25tXZqeXU/g8
	6aN+XuTGD2yNDBPtU9mNYzDObSvfGdXQkiBI=
X-Received: by 2002:a05:600c:190f:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4ac1275c26emr262447705e9.0.1793690528518;
        Mon, 02 Nov 2026 23:22:08 -0800 (PST)
Received: from [10.77.100.5] (ipservice-092-209-215-046.092.209.pools.vodafone-ip.de. [92.209.215.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e184esm41772445e9.2.2026.11.02.23.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:22:08 -0800 (PST)
Message-ID: <2479af7b-7919-434c-a205-14e3b545c9a4@gmail.com>
Date: Tue, 3 Nov 2026 08:22:05 +0100
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
Subject: Re: [PATCH] platform/surface: aggregator: Fix use-after-free in
 ssh_ptl_shutdown()
To: Wentao Liang <vulab@iscas.ac.cn>, hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <20260917135607.2154130-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20260917135607.2154130-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 17.09.2026 um 15:56 schrieb Wentao Liang:
> ssh_packet_put() is called on the loop variable of both
> list_for_each_entry() loops in ssh_ptl_shutdown(), freeing the packet
> before the iterator advances past it. Use list_for_each_entry_safe()
> and move pending packets to complete_p, as their links use
> pending_node, so that each loop walks a single list.
> 
> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Thanks! Overall valid fix, but similar to Ilpo I'd prefer this to be
two separate patches, and a better commit message for the typo. See below.

With that, feel free to add

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

> ---
>   drivers/platform/surface/aggregator/ssh_packet_layer.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> index 3dd22856570f..871780828419 100644
> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
> @@ -1983,13 +1983,13 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>   		smp_mb__before_atomic();
>   		clear_bit(SSH_PACKET_SF_PENDING_BIT, &p->state);
>   
> -		list_move_tail(&p->pending_node, &complete_q);
> +		list_move_tail(&p->pending_node, &complete_p);

This is fixes typo and should be addressed in a separate patch.

>   	}
>   	atomic_set(&ptl->pending.count, 0);
>   	spin_unlock(&ptl->pending.lock);
>   
>   	/* Complete and drop packets on complete_q. */
> -	list_for_each_entry(p, &complete_q, queue_node) {
> +	list_for_each_entry_safe(p, n, &complete_q, queue_node) {
>   		if (!test_and_set_bit(SSH_PACKET_SF_COMPLETED_BIT, &p->state))
>   			__ssh_ptl_complete(p, -ESHUTDOWN);
>   
> @@ -1997,7 +1997,7 @@ void ssh_ptl_shutdown(struct ssh_ptl *ptl)
>   	}
>   
>   	/* Complete and drop packets on complete_p. */
> -	list_for_each_entry(p, &complete_p, pending_node) {
> +	list_for_each_entry_safe(p, n, &complete_p, pending_node) {
>   		if (!test_and_set_bit(SSH_PACKET_SF_COMPLETED_BIT, &p->state))
>   			__ssh_ptl_complete(p, -ESHUTDOWN);
>   

