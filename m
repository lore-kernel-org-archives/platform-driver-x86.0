Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677893;
	b=ypgtm4eUWNgdch1ROTUfOgjhUAYa20+kWPXAKrIKOHLdm94HYjfGwZhOH4z+JaomMO94
	 0i5+2sf3u8MaRYKj3KGwD0r3EUgwgEdYadWxGVQdMRnWMBficH4C2xywCX3/lndmJPL0Q
	 qg0g5DSwhdrOKAhe+z4A5Z7FVeWt7PIQMWy1/OFyXSuYDNGRMjdnt21pyZTt1y3xGxgGC
	 MbZBNSp+k8W5a2+L3P3i/dpuz6xRIUogsyDpJ/qnWC5ovtyQjLG8s4SXgNNIA1/Zszwt8
	 Y+JhIq8Ef1oCtUImM1iSM0lqDeu4QnUoT2+51IEbhBkNa9RIwn9muusId6ievkRkxxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
	b=pf3Jat1pH8FJAv/QuTUP9qsW+6gfpE0uBjw53FZCgLEbBuAVhxce+9EspA1pJC9LpTPs
	 tkUEZftSzshX4WL7y7Li+Ngy43e8RrbKDfujkIMqkGoqDX6ehpqEWPGyWjvrHKRYmatLf
	 SVmeLpukEUIFWg3FCubVXyoEaoUXzckQnIkDoMtE5YG7koj3HJ/wz66caY7qvKWyM+VVZ
	 MmuyHq2HjF92y0Q6ybG15rUtZAWPqU0PIjr+lwuz0AhjkioKs6dBa86x8OXAPPmPhk54k
	 gYpy3OTWqzqLgzLq0qhezF9ZZT4QUcbYNJ929c3qhkb47uaNTDL9TfBT3Q7QkokH21w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrOzT7nq;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFC606A31C
	for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2026 07:24:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDFC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QrOzT7nq
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04ad2c46dso42137335ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795677892; x=1796282692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
        b=QrOzT7nqsMKQdm1h0hM5kVEdttUFmTjDCZFoczT1B3aYxsWIQThcVUHk3pfelT1jwh
         EN49IfvEiOImLzrZ0pCpyI960PEPTP7XSal6sBHYZcP/ssTw6Xcd2X8NX0lgjAvLTPCe
         /T0An6yGxJiI5HGn/bJ4LdFT4YYnm5bfJHZh8cMXI/4nq7KhoWQEE9Iet+rypk9qCmyF
         kml58u4rUspDyJiP9+qGJ4wvFdI7wTohjMtyyqoNVOz8qkZehSXlfnOKSUsOdPo/efep
         mk6ZMlQoPJPthnLOwnSterVZJts1IbbG0IfqWnwgCcwC1wkXUMQSMNyz4Ks6AvuVhbrD
         zT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677892; x=1796282692;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mk/72Ud1w99NhITuoR5LpdVTpngaXRQ5Qgh0L/idvEo=;
        b=YzasRpz46m797KeTS1gWNSw2yzVz5d6AZbgq6CFUUab1la2ua7AKWvBaokibA0Yjtr
         wl6K/bdl8zzTWMCnIJmmiR3FCPHxsT5R4lKOID27zxUq7OVhyUTnT0/lVUBV5J5mIeMH
         v/saZXIhuZ9WEhS+NCPXn49WVFZoHjzxE3PDbhqCgnIHKFIFNeRJqePfQcLLCOUIG50M
         rRSd0SpFeUAD7UiLalk45Ooyv4IRPHw/RC3JOpo89yY4G0Eny8YJTpphVJrBkCksheJ3
         6V0HtjJlkkSxazUKLzvFHXaOdPHCr8cAoKarMC7m5jM6EjTrRin7uyStMEaGPcjedDym
         g9Bg==
X-Forwarded-Encrypted: i=1; AL+hErH5XWJ6JgCGv23YSvt6V6lTPS/Cjqcy0Gw5lNy6lnBcKwEI6f2uwH89EPa+iKaTCfqSrah9IFf8cI5x79SU1wpDx3xQ@vger.kernel.org
X-Gm-Message-State: APuU4Z+OXeFyBgS7pnmQqECxMJdqyEjPLw5//kDlB8n9DhdQO2e4tFFP
	pwq/SnLwIXJo3XcpU2KwR6sewLR8Y6fpWuza2t9rsctPmIzMwM9jwqXr6BDVfl5gAShauMlO
X-Gm-Gg: AZFdTZfyxJdNXVdBlIag3pfA7Jyzl+VgJ6qAnpxYkl6z6C90S/nsfS4uNA1O6yPqSrN
	VVL+74KSCVlJHhCvtCUr0toPpZzgYtSVN2G9/hG48M1BrGDJfhUGBTh6pnea9R//LKD580xmTZQ
	VTFX59jwPtmu1Srp2VlTIqWrBrYNtB0wjefMJb6gI5fJWJQP1Ro48TnVhfK3q2GjZ6j8i+DbW8s
	kdcSj8+DQdjE9lV3OJqOpiAPutRQhFsW0sproj83T5ACcSHagK9yYTtnb0qaTuUHCUkZvbneP5p
	wW8NlepdTr8eiWNstNL6WRPuWpaJcAhDNxNHca7Ax6BGnGA6K67Ah438TezPrpNIOXgDQOeO05l
	v8EljzRjVPANH/IAVCsR+lOF1ArgbC5OrJbDaDQYP6FwhNP1KSa0Kx7WCcum7GWQ2FXVy7sSRkR
	EKnX8YvX/x80AslwINdn4FoGL83KYb4xriJFSHxQrvQHbR29LtA0kXOBx62t01IuckWKxLnY89m
	EKHtSlYH8KdMI9MWqYmbYAODAPEhW+AFG4qXgYUc+jSNNpOLccmg/CoOabdfjGcL7CYlqcLSb/O
	Dstx+KpoHyFVCcrqq20q2SBcR3HwT1Na17WxgBsbrm7A0l4YFTme/G/JxbWCk/3xJ8VWtHgCbfu
	9SfavHBGNxgtwnyYWwyI0gcGTnwMCfiZfhJ7ij7soT5eXXOdL/jSKuPW15UNRsZrtDDzTuICZjS
	bWcB+/Asta5pHpNlEIkfNGSFM=
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr19051550a91.25.1795677892416;
        Wed, 25 Nov 2026 23:24:52 -0800 (PST)
Received: from kapoor ([149.40.62.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4afeaaa84sm15526820a91.10.2026.11.25.23.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:24:52 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to ideapad_dytc_v4_allow_table[]
Date: Thu, 26 Nov 2026 12:54:40 +0530
Message-ID: <20261126072440.749440-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <598e22ddcfa810915cead43afb9886d0564e9319.camel@rong.moe>
References: <20261116171817.21802-1-kapoorarnav43@gmail.com> <598e22ddcfa810915cead43afb9886d0564e9319.camel@rong.moe>
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

Hi Rong,

On Tue, 2026-11-17 at 01:31 +0800, Rong Zhang wrote:
> > Fn+Q does not switch profiles on
> > this model.
>
> Even on Windows?
>
> If Windows can switch profiles, you may improve the relevant Linux
> drivers.

Sorry for the slow answer, and a correction: Fn+Q does switch profiles
on Linux. I only checked for a key event in my first test and didn't
watch the profile itself. With allow_v4_dytc=Y, each Fn+Q press moves
/sys/firmware/acpi/platform_profile to the next profile
(low-power -> balanced -> performance -> low-power).

Fn+Q produces no WMI event, no keyboard scancode and no VPC event, so
the firmware/EC seems to switch the profile itself, and ideapad-laptop
just follows it through DYTC. Nothing more is needed in the drivers
for it.

Thanks for the review,
Arnav
