Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191940;
	b=W5LVQHSXR89eOEfn+jaMEPiLC7E98CZb4Lcijbzq+RoReNLnZf9dLuD2jujT/3Zc9ur1
	 QyUoE0Klp1MHvVt4YW1VRjMETZgbM0OaPWzQ2Ai4I+5AMaKIGNqAIa0khjTa0Qqr1cDT3
	 5uyYMmphMDjeBwwzsC2K4woRxPXoCJhUmPxfeUyDdjtCEOkGcw+RqFMMqcYV8t9f+KHsR
	 XJKivo4lyC075k0LLdcAfu/icx5vUF7nWyrDeG5BqlNnbTci2r35dKe9jOLAQiSUkTaos
	 QeSdfmoaRr4zTMNTkocy2gfITUxDOnxWWK6f/nq3T4LQCJk94DCpkTi3ybGI7e9BxPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
	b=ikS6Sw2dcDwAJc92A1JwEb+5cOXEUZggMDUwfSDN2tGnE1I+OLPOJttxASTW4715n6RM
	 3zd2vdo6QFruBzQc7q7xuUaS/aKu7YiA1vp/+QKpJ+fshUn71IC6/IkQEhkUXqrF4DF2k
	 yXX1f7hg6HfbHYlg03f8aJ68U15CqFItKUeu0URQ63Fq5sa+bTawurvBUbsleuE48cSgu
	 YvVCmn8ycdHEXO0eF5dQ8sJAKCAIDPahKwJgVJKM+TDPOxqIHi7z3OBeK0TLv2GIrMeII
	 KzABXI/1nbdinb/hWBtSDna/3X3lrHtWG3s3rUsIeMHwkn0kzgVWD1RAIYQACMiaWGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72616606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 12:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72616606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKnwUVbT
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a06b44bd01so508658b3a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 05:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191935; x=1793796735; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=ZKnwUVbTIEGSp3YRgh3c5uKjT02PZpb8VjznUtGAmlyaZaegMduYT+jTcMWxiWUnpW
         ZA4rCNqIZLDv97TYXn/nyqIe67U8TFasmoaaub/5wikT/0QXhdo4aLEzUifNj26SgGbI
         +3Uxb9Whc4EmPZomkH3zEcCJg2MKSC0fTCHCk9M3E08VZbjjLcDUcD5sgejKUoU/xOaE
         QF8lP4uGpqnkxU/4i6A2h64zncOHnLPFid4GRNhKvGOeIJSs6vQA07i7fj6axZfAjsL0
         6HRACEo1ufoTcN5ln4SxVcuwkCZQKfSYlqmaYRLZtS5/rUE2O7sGCqyLiGTAhdTBxZT5
         5Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191935; x=1793796735;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jif9CDAVAYhJXkuCpp/HgAnuYrVFMmNUw2aPhFOa0WA=;
        b=JN8nXHsq1/DqdoaOusIfDkGCHsa91heZFGT5ZftbdCT72L4ma7iFW9g8qfQpAQ5gvb
         1fTd6uI39eqTmudpgBaz28EFKL4eJ9hhxN/Vigghz/yixE9wcyLGoaf963fw8MbzrQUg
         /EAuQ4Rk+iaNS2bCC1S1MlaNGPV81f7bWsREJkMANsV81LWZ0TAQzTFhcnBDZ9MQ5PaX
         2kb3z1sh1NeTN9R2G0+2Iy9muOKLr8cIHNwCutwfEjmAuCYS73ZAtnGZNT0qm/AyXsep
         XzraVwP0GT61Rmc9mkNG+O2ziWH+lH3AVjw6BYT1+VMfuqkv1PQ9/SQwB/NtwPomGYmB
         4l4g==
X-Forwarded-Encrypted: i=1; AKwUvBzalrcK9kbbFH05fBTskh51htsdyR5tl/WSvAQwjtSvETjkEiDwEndAqjMOBLUlFPDoyMxAQjcFuEHSn7w+ynQMIvZy@vger.kernel.org
X-Gm-Message-State: AFq9FYKCGurhXnrd1bDa4wSiMwLV9VuXtCxFEskOw7LzYVNTXHeYuJf0
	4xwI54tFJy8NBZ7ZlfPeAbVjIZffTHjMJcMWtQo8wcHUPOR3fZbZsJCc
X-Gm-Gg: AYBFou1RMUvuSgLW64r1CKQ/+021DXQabsvr4DS8kCURBhAdydHoDhlhd9KbesNZTyv
	FLvYGfTrrL5IcDGvSIfPhChwr0wP8Zhd2+HqPacln7qjLKe7k1y5cWLATosN/gwv5gRZxheOCwk
	sMka78skONnW7Y0p4m1seg0vrIvbWUZp/syI9h/vuAW9Kq73ZHWUi2N1JLgAG/EXt/o+xyrmH2t
	3aj9n8GcesaZS/tN8TwGE4cZvNt5GTDsW9HyNZ9tHpe0erbEDhUCE0yIS8q2nLLipNCuTYU1MRE
	3eaZ1wfNfKJztVxTjzdU6nXPx5qupqqig1XcSevKR/6wyN3wmJtuGJtk4L6qP1goaL/5ZTkIEEX
	a8Ny6nuP2WMXABYl8NKUuXC7SQw9giIqJiB5mhv073GarLxKq5kC7zYcIheDVDmjdJHD/tZmcNw
	bMA0oEYQuT/fjngB3yp3UsI+blssBUxrfJ+D5eMc3T+b21xlX4lmeQ17qFn4t8ZOgsnPiwbL0oP
	JupKsEsQcX75KUMYOIP1NNnUW32ShAmelyohxcgA3XhgDZeu5Zi6qtETQ==
X-Received: by 2002:a05:6a00:3a0e:b0:881:fa65:d507 with SMTP id d2e1a72fcca58-8a6e6a17a2fmr1919876b3a.22.1793191934270;
        Wed, 28 Oct 2026 05:52:14 -0700 (PDT)
Received: from [127.0.1.1] ([240e:46c:8910:7739:c024:4f7e:9059:99de])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6e634ae83sm751438b3a.20.2026.10.28.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
Message-ID: <6ae1effd.d3aa34e6.c46b1.441f@mx.google.com>
Date: Wed, 28 Oct 2026 05:52:13 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
 Martin K . Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Marco Scardovi <scardracs@disroot.org>
Subject: Re: (subset) [RFC v10 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB
 LED driver for ROG NVMe enclosures
In-Reply-To: <179319085271.3664457.8130606663267466619.b4-ty@b4>
References: <20261015140051.1159817-1-nbg2974@gmail.com>
 <20261015140051.1159817-2-nbg2974@gmail.com>
 <179319085271.3664457.8130606663267466619.b4-ty@b4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks, Lee. Your reviews along the way made the driver much
better, and I'm glad to see it land.

Liang
