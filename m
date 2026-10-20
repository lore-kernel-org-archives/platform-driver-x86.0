Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792478090;
	b=vxl+HlTkkzHuyDtznBVfK+Rl6gBgtpfdeDQlJiqdGuqGlXb0WoCf0Ot77nIGighAuRfH
	 zx5ww3v4zW8RX2BPARVpsJ9wv3oOm1J2a21dQ6JKuYWGDUIw2gMpPDtzA7JdVgXwWbKuN
	 TuH2rdb/EER2B5Mj+Unyt9HiS3vqzAazr6XQR9V6afoxiJDXU3ccNCTg2A92HgEHbswYH
	 /Jy0Yr4ucwYHFwu2ypEx5AAl0yWsjHAbsq5Cn/8VRR6pd514UWYAlilxFY3TW2icMC0r3
	 YKEh0FoKJSaEa7m8bed8fkyklGkkLsPY5OJzlEDAE0bIBxvYeoQlXr8lpARzfGTtaLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
	b=UMcJdBVm4DOevxPVJPu2AuS1C/1fuBRdICgHE6HHqru7mTyjtg5wC/4hkAbzhlnf6eIH
	 ih9Mv+AJwB4jgZ6BfV+OORFFmvgw5A5BH3K4QpZkVXEHXT7dbL+3mcfPUdDKacPLTk/p9
	 BvDWucxGFClxcWglCIYETnWgCzyEXvNDx0XCgDj502RoDgqHyktRxssN5mCIsa4YI6vcm
	 kiSWhrhzV3e7U5cn6FE184hJFM14hG+reCxcfiXemDURtvw1yMUFLJQhf43FxtG4mpcuK
	 gcFEEV2H6EisPQOuYra1An6AgYMcRmfXmNy+CBpYx/YCXlBBMq3DDPmVn32+ODJ1BfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyrFzfDc;
	arc=fail smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDFD606A31B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 06:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDFD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TyrFzfDc
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4395d31228so250716966b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 23:34:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478088; cv=none;
        d=google.com; s=arc-20260327;
        b=cpfgKVfQ92ubJDS381C7hmtjj/gpLFJ/NKPvQzIgZGiNcyIGMzU3aomjEaiV6/uxai
         Irzc49ymOY2c23OTZWYavQ5MC+dmbBvQm6SGvdWvjhGOmMfh91MUce5S4GR8baYWMGmg
         8rEzRBO/fx0fYWlxSRdUBlNVVwKN7hof+IlWJVNR0xwl4YNrqaIMYWhUqnucQjudADGO
         NhRGkQY3quFSUYyQ12mlHY24AIUxsYehixfSMMxpv4cZwE2Ay/8g5WdQjL7LKpv0Brh6
         Fy9G84lm8MavoSwOPYuBFKSrg4nr28MQ9ncqXU9XbDTOHHXuqFBYei+oV/cGPv356yOa
         GqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        fh=ffbXay80UZlISO1wZs6k9gzKfJ6rlgTRY0OuX0Vjzq0=;
        b=YhzSpBzHWP0vd8E1Qd8Mvv8Xo+2ItB0ENUMhngBjvUrgoMHaao5fMizoEpWR4eAaXP
         yqJ8m32qUHBG1zfVSHrXsWjmwugImJbvAUMnGRea93Ve+b90gafE5SweYvwftxI3NBmv
         duldvFuUVklsbJ/UIFzx3MSaIcaGkATZicYnaeAXySovkjhFEJNGXNKl5AJmnhJe9EN8
         C9gBCaxQifB51HQkQeuvY1MbLQ2HCVkVSe8LfjABZEqtw0bMEUU2pBlp+jlGwXithiPP
         aOU54yuMJC9EO8/C4frbqpFg9AqI8SzMb+fevp2chpS0VjDFbQEAWcyg4EBa7gDGXsba
         JchA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478088; x=1793082888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        b=TyrFzfDcm//CDOdpT58Hf++OQ7UIqKplmBjhAvdi/767yUNkUIh8lNwsDadn3DEYiq
         AYmms7foplWL4NJJsTIgQMEDkrriffcVyxg/C+Gller3mrNWt1wDjKeejhBX3VN94v8R
         Ht2cp+PU1jQtDbsWG783Hs02ePiUBi8rLcfeKZgwcKp9vL8GpiDNKcs2BMIwstIIlplt
         G3MKSNY6kAlmZSEz6XMGholavTtUTUcpDq0mTjcDdajune0rqHqWC2Sm2bKS9+vDDCKE
         g+4eej3ybfw/Zot0DBcboJFLpWgDFLq18+ZxPxAPgwvnA7BU9vv8rXcB2ug1t4GLSCY9
         sQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478088; x=1793082888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fZFyrGnKjSZQP434QTLDvpHoAeJBavWJ2Vq/PH6CLec=;
        b=JE9hSOJOGxkO/YyMj8+7RhvL6xEAjqQqJYza68L6BFqVeKVLBg3joys7vpT2lnZjwh
         51KxKkEx8iXBuHe2gbMqhp9CG7Msg1Wz57idTsosQ2h1dmbUfn4S+I7rMaQM63igMnEv
         OwR9BDi2yP4FkDXQwfSzbteDKZwJ/F8jZfqoI+z25si1txWreMpjA+RIttKjqs7x0+aA
         IKOt0HePvmnd6tdEXWqFGtFH2npCviGezMejWan9Sw/VvIgZ3irwN6pklj9jZdprcx6U
         RiHhFogcIpLSNoezkPqkRxjehwuJZLqCjZCoMdp6QGvPkfamQn2LrZiOif3/2K2hTCld
         4uGw==
X-Forwarded-Encrypted: i=1; AKwUvBzirdu1TlJxNic3eZkbS5NYNg8kDmYWoY8QqZDEsTqhMfkWHmqJP/XW9YxzxrdEvhT1jMDtEjKNp5Z3yJ4qx8uCC42W@vger.kernel.org
X-Gm-Message-State: AFq9FYIO2L0ffCdTxIGa1Ki6yaw87i7Yq9hcKxlTiOwYufIZMVj0ScB+
	j9ilDUuSGlPAZvqcFlsEUehoc0uM5EDRufkA9ldIO/x68Gy9NJJH5Jq2DcSU0ZJ9PaIvXo4eLyd
	F1sksGOk8U3XqWF9TwRIwJedGUxhEm6s=
X-Gm-Gg: AYBFou3uG2zJClT2JZ34X/gQKMvo+sLzgXsLmJNFL7rVG3dl9LdvS1T4lh7JQS9wAzR
	Trj668gOW3c6I5j4ARYlTggaXDiVEA+ecGHjFEIqmbHVuc0Pm0jdoPHrJelZhCq3T8jh7fBGF3G
	N2VYtD+oYIDmvMob4Wvxm8b9O0D+tZjMNrh/ptVhZOzWntPdC3WSGc6Ddwxd2bM+UWlfkiCYgwI
	ExPq8WJ0enjMHGxGBB2O7x0LnhUMsG5cjkLdMwheHSJnD3EeZ2dAvMsgLa/BbpdFgYWDVXYG9ky
	aGIk4Ai7B8bfCvAD+uINMm/39wDqYxsKrYMvrKVHx52JgZ3DJ0U2B1Cj5Hy28qAR02rZPmGug8h
	JTl3mijeIGQfRYB2TPbaxlwJ1tw5TAuNSLs+R6uRsss+iHw4Lq7Ebud1z8gJrffhcJpD5ciJ4KB
	5yqYHk0rx6TDhgo0qSaW6dyZLuK0SyU/2YPP7jVAwO
X-Received: by 2002:a17:907:e109:b0:c43:6d40:4f84 with SMTP id
 a640c23a62f3a-c436d405421mr304474466b.4.1792478087855; Mon, 19 Oct 2026
 23:34:47 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAN_LGv3QH4oupSv6KzopjHRXO7tWhY4wvBuCHBzNhJoDW4ZL4g@mail.gmail.com>
 <20261020015001.15672-1-patrakov@gmail.com> <20261020015001.15672-2-patrakov@gmail.com>
In-Reply-To: <20261020015001.15672-2-patrakov@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Oct 2026 09:34:09 +0300
X-Gm-Features: AclHuK-0DWmL4ciHRdqJ13K1229Nrgrf0eszph6lmY66CYqR_mlykGne-GAUrRQ
Message-ID: <CAHp75Vc_yxWNeuSi8jwTtT=0CvrBW1nQkHvzEYkhqkGhRhTrrw@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: i2c: ov5675: Defer the probe until the
 endpoint exists
To: Alexander Patrakov <patrakov@gmail.com>
Cc: johannes.goede@oss.qualcomm.com, adee.sahan@gmail.com, andy@kernel.org, 
	antti.laakso@linux.intel.com, dan.scally@ideasonboard.com, 
	diamondback@cohunt.app, ilpo.jarvinen@linux.intel.com, 
	linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 4:50=E2=80=AFAM Alexander Patrakov <patrakov@gmail.=
com> wrote:
>
> On ACPI systems the sensor's endpoint is a software node which ipu-bridge
> creates when the IPU probes. Nothing orders that before the probe of the
> sensor. If the sensor is first, there is no endpoint yet, parsing it
> fails, and the probe fails for good: the camera is missing until the
> next boot.
>
> Return -EPROBE_DEFER when there is no endpoint, as ov2740, ov13b10 and,
> since commit 437e1f6a9600 ("media: mt9m114: Return -EPROBE_DEFER if no
> endpoint is found"), mt9m114 do.

It is also possible (I think) to call reprobe in the ipu-bridge
driver, but I dunno which approach is less hackish.

--=20
With Best Regards,
Andy Shevchenko
