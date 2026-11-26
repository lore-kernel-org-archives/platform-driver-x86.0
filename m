Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709504;
	b=EfsjMeV7amMnvwEfBDMasUxdB/U0egAkSThDp3nYCf0TGOELQjABm1DVbVZTOJPZqUhM
	 JvU9wVppSLLl+ndlIZBGHUSOvhLU7GjDD01xOanUpY4l3LPMsqaufy3hi0G+qG9TRocCe
	 k8z7ly09rpjN0xGtdLo7VDR2vW0zGib/k8CANlm5AvJqgSGJPClGIuLq7M4M1rG7F6FsE
	 f2AW3+xmitow5CiNZqVXTv1vLZGNu6eT5/69b4fOCoySAILpUgvt6PQbX1ZgGbamOs18r
	 8vw6KiUr55KJmqGdrrha/lguvffEnr4rRRPcBqDfHLlq9oxxuscEGXOC6ENVJFIn7IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
	b=eTHAwdqJDr6RiwvOyMgS34LvLBkXm82kjU7EZLygnWS3XOIz8C3XAQapFvP77vRHucrw
	 qus3OJXEZqq4oEze73o5F2Q9U5+PslFG8aREigtty8QPrNq0kkcWK5q5JBCXgjZ7vNU6W
	 NU2WZpJ7cbUAdeYcYRriW1O/OGXoF+LB1wpDHvfDXj15kPtxRrXxVs9OLFrFZmKOA7WQP
	 5pC8I9ONIOQvu1G9UpYdk1RqiLUfVFmhBbSvhsTJkeiygA8n9i3bJGV8nPMxNQL96tXzx
	 PMfrxNHzpjED/bjGrLrEAtUDMzWI37NTl+0EzcCvsdH8Bqb1LiekJO/CDzPcZg1LCbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo2BhleG;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86200606A31E
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 16:11:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86200606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xo2BhleG
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3273822b3a.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 08:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795709504; x=1796314304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
        b=Xo2BhleG+abqRQjMhA/fSFjg1DX0D6mg83IZSNux4uLnB+KLs2diZBmvTrTFf8Xhqw
         I0Qo/ATkt7PwCHsBKQXcuJtZL3FbTCc41QrHHEXnrMvC6CKRdA+tRCUisiMoXvvJ1XJx
         8Eh8dmJ373Ab++ADuEbmUNFUrG1Xhtt5r9DTShW9Xo0w3ml8WjWiEdHbFjjprp8qC7fT
         32QFxrgSH0XtZDXpaM5uskHdmFzkhPCyHapLQhjWjz5Vu0hFA3fTAT/ZB3f1p5tyW3Va
         Pt9UdsMdclRWaULk7UYENX6yxB/Xc/ax4rzHXVTPX5dutBuBSKZwUsjzSjKb5zPqAtZO
         ZwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709504; x=1796314304;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJ1J2T0KZjP+N1piV9zXMZIO+JdMps98HsKI1Aw7bHk=;
        b=vMZkseOzfS3g2MkNlDe36Hg+/dlt5JaxzYsbv/dCUA6NUGl4pD6aJTHDzEAtjjc8HW
         y5lKm9K0tCWG+Jd1+c5T0F2C6vMT8mSQYnS8c/L10WmVqe7GsrYC/gmcsNbgpY724agC
         5Azh+pcc2FE9+CUz5ET/00w5stytaEDHf2grRTG13pE/fYOBdeeM7BFTDC6KpR3sQd58
         X7b6ABvjmOcy6Ahna/Vt1+UunzRJmrQaCO8QHpofh9imar5YEF5k5NvN6MwcrD+KVJO+
         o+GLeR8m3oKDIPjBIzghwMarzWqkMcbEy3x0MI8I/TzjushcMfxI4Poo/QuapP9mcwaU
         MXuQ==
X-Forwarded-Encrypted: i=1; AL+hErGYLD/Hxnm6GfvDHZPWzKAjEFnHwD3nDPqCluQE/2B6UnDb0Hap3lZOjvHaaJwK9No143swa5qnB5JpBSg1qzNJjtOD@vger.kernel.org
X-Gm-Message-State: APuU4Z+6MU8UdQQ48vhLIPqX6wrn3GgvdKfGCKchun+iJ1FxecMsuK9X
	W5a1DE0JjKVNqEfagYWXegKGdxDB/o66WhrMvpccW7jFCIuRFKtCUngh
X-Gm-Gg: AZFdTZd/Ut4Sfl4yhSV3vXxGzsFpPDaTeMoUGzQ3OzUBU4PkE81/cWx/WQkxAk1cq3X
	wGpyh2XCR4lm8P36cs3lixZxCIdrEGxeQV4T+fLx+/Lanj/gJJ2Ibe3oqM65frSKqAygX3iKLoS
	e75EG3/GYyf2juzbXIDTBF9powlPDhxCAS/Ti7rI6NK2KXHcLsUlDdfvEfJhEq8thmamhlx52Aa
	/OmHjZj/1bwJxeyBjPi6niQeGNQ0PwKomHAEMsJE31GsvHPkIxLkLq3PQHMyfXE3QppkBqIH7gJ
	uZc9L7CHGE4CLGKVQFwQJzJRZv1QYkKhMH6ljNm/bH3CBgaihV66OL2ozBj54KzwBknKcTa/x2m
	5XvbS3nloKq7KPC+RVU+5nWKtJnnwzX8z1J5SVIhpyIwV94fty5fFMStZvw1bphFvLqZYAIkilz
	obIDU4yMZD9qr5MUs4vDpafXDeu0rdTjRrKdjx/xECrgcK6Uk39TUh0Om2DrWGU6WstE31a3yzi
	/sJ+MXa5kc4DFAM2StquXLMPm0z1e+zPGEgrciYyED8xHqnqBjJC6nG9+nF49IagWZGgzPkwFmJ
	7KGhTMCQnaqKlvbukClEpBwghIJ0diI/kOF83Kc4lKmwSmQyDXdeQEu8rL/gRKfPA2hyIQ0rW4y
	//Xy/PtAPiVRiOLZJOQmWbBjB8jTD8thwqjqXtNHrhTUWGY6GFQjyAtzR9MBPvIr5B4zArX0YSD
	GsEYNPlfHXxwTkx4EIqenx1Q==
X-Received: by 2002:a05:6a20:6699:b0:40a:5649:4ec5 with SMTP id adf61e73a8af0-40a564958c8mr1609462637.57.1795709503835;
        Thu, 26 Nov 2026 08:11:43 -0800 (PST)
Received: from kapoor ([149.40.62.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm10698001b3a.21.2026.11.26.08.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:11:43 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Punnay Sharma <punnaysharma805@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: don't warn about keyboard backlight type 0
Date: Thu, 26 Nov 2026 21:41:31 +0530
Message-ID: <20261126161131.962234-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126152448.847538-1-kapoorarnav43@gmail.com>
References: <20261126073107.765676-1-kapoorarnav43@gmail.com> <3e932924940536878264c1ab46d24bd6db362183.camel@rong.moe> <20261126152448.847538-1-kapoorarnav43@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Correction, sorry: I replied before reading Punnay's patch closely. It
only skips the warning for type 1 (KBD_BL_NONE_TYPE); this V14 G2 ITL
returns 0, so the warning stays with it applied.

Type 0 is a separate case: no bits set, and KBLC also returns 0 when
the EC or LFCM is unavailable, so it can't mean any backlight type.

Hans, Ilpo, please ignore my earlier request to drop this patch. I'm
happy to rebase it on top of Punnay's patch, or to fold both cases into
a single check, whichever you prefer.

Thanks,
Arnav
