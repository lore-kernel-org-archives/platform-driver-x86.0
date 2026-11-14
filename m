Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794647345;
	b=LDGhjCzE8Vz9O8fSox9J1+h97LFEsVc+JxUDJza0baBDR4Zg4YRbgWyEqsOtV6cFhu74
	 CFg7hCQ6ky6XFTgYWfeq69OZ4S9XAXOA+TOGoWl7895JpVjb74bZCmkD13bRWlw2owSQ9
	 9RG+akHpEHX82rCS7OinACo6l+jytmKc0G9vYMuJgAkXs6PH0NHQB5Y1ZXDnTiIySGuiH
	 XoKF3dz5pzGtWUqfiNjSg1W3kanP85gi7UBQIjOM1OGJGwPgzwO27VD7hfCwcU6asAjGd
	 QZVWFQkTgSqJiLg3oVOrAxwS2N0SHW+2kkJMIiHFj8fgjrEu8Wj0HjcYzQ59zRccgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794647345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
	b=PuW5m4Zpz8qUFyuh7GkM3UAIaQatPcY60fz65PgtS7lt+euxy0VVpxXv2jPbwhar3NH3
	 mLu7sDoXVEnK0HcNJyREGlZKdkA2k50KlEdpmyayHDaMlptabGt8zIUJRaOhVOOATLXcD
	 KaN/Z09xQvMSCzk3kN+K/G8oKd76OZH+JaOaeBherAdm6JyJLPxBdnWg/kJKYJlIms3YN
	 L1XvxlBeNoTpYMpHwb5NGsOVMTP+TmNDtqQSYb4TvGcKhz3zi/WENdoRsrHKs8gvCIqzX
	 50zTYQFs2hpeob0z03SFMm/HFT8+DdU9acYFfrFWrJ6cUyRNZqRMsP+6hyJq0b1MtRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i69q62HH;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34E606A334
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 09:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC34E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i69q62HH
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso13217275e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 01:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794647343; x=1795252143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
        b=i69q62HHFhkHKTVK/qXfvHQDtYRrPDkAB+9osvNwwBzwdlTFuJHb3Bvt8HGM+i3EiG
         75rJYcCRNOzqyNzbBY8UmtEz7qDA2ywDPpBaGXfIg8yMVOz91AL4adWgp747OPpbbEmc
         r3EyGC3dnat7RRerjWsYF32siAdNIKujMMFrc1T4bCrEO4JSEonohLjQ/M3Bd+VI5x6H
         1gxZEtjz88AxMz9vst9NY343rGkNB5C/CExJhwovMzngUammcIefIDZufS8sfc9w/igm
         fCTjndUkRmhW0PEv7zdEe24SIEnRqxAC5ri17h14mULBZLLHnjp5PEhNtyygqMHySX5H
         7ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794647343; x=1795252143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zp/vkQyPzI5pRFIXlYz1ZDuX/xuXzNa/22vdFr/uK3Q=;
        b=vIydCWCO9bD+hQwONwiyLtHujVDVhYzh+3hQQeBzWAZQBatKBFanJ/GxpZ67uM3U6u
         BUPU3UCKrS9I5E9zSu21FHmcRtEIa9vlyvhzDvb56iHoZXEKazza1tQfDxqk1WY2yg7T
         5E8I9JNFsxs1H49z8D38MtLE7MQ4TF1nLtmLJ5x9ZfKc0+3hFMtpg58G7WTyCkOiP/h1
         ZP2nMFGOb/Gs0h4GuLyauW6xvMJXPFy5MmNBDC9qj0Zt8dYbig3nhHAsBAXrwlM2UZ2n
         2boRC5m45/WTiyIx8oOukMkt02f5nellCusGCDh+Dcd49gngQtA6eKNipsy0enRc84jI
         1uvQ==
X-Gm-Message-State: APuU4Z+Y7fRDQlQZAqT/WG/8hsZQkfC/ltZojRDnWRTaDP2MCADjzQAl
	qTtSNW/JDpRO+1Mh1Hh5ACIYySmrny5xv/EzUj06vUsItl+L4O41Q8F4
X-Gm-Gg: AYBFou3Haba76hR+BxNkeWquuuJVQbYReqTmWaXmpnhB0i0Kqlk6DycDk6kQQAvkDFl
	WwnLDwL6L4GFaq6cskWqDod9+nHOJgQZnOjkXR/t21nkQtI5Ju2duJYJNVj97NEyxMNtmSqvudL
	ev4hP7W5UMNGIQh6r3Q8pkhAOpwpgoure031zX4AVh2rWbIoGpFPZzxAvHg56A+Zlugyxy2Rwe3
	NHyY0XIFDGIlal+iOtDgKIHZ3NdZkoduRd/ZmD8k9rQY7Z55kpjfCDWy2azlnDNbGHhYA0LUdax
	8bKOPJwm3ndTquM5iq4bwIFiaKxoZ1cz4EekvL5P6z+dViHpF3EQQCnJvX81HnZF0dR3S/IfOHW
	sCilCxvuPHFynoLL0TCfnx53RHK/lHCcvUQ+Lh+TdF05qJ+w4TRuFulHVlh9HxxijN69cxrTv3Z
	hJs9ANteIpKMziZz/inVFjJIUxIE4eUFVfEE+iiVLVDpWk+6X+/w2NIuiKd4t+l2Bf9epk/Etct
	nGNiz/TtB83yTvOi1za2Q+EdciiQs4Ss9gIWWblWEKlwYsE32Wj1pLquyICDCTsvXr7Bgut8BzR
	bkhQalvgC13Ln+6kv7xNiGRxyn8VjpVpnwY7siqP2OGTMF/emhetJWzTp884somxD3LbrgHQvus
	=
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr106570305e9.28.1794647342762;
        Sat, 14 Nov 2026 01:09:02 -0800 (PST)
Received: from ahmad-HP-ZBook-17-G3 ([37.63.208.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm60877895e9.15.2026.11.14.01.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 01:09:01 -0800 (PST)
From: ahmad baghereslami <ahmad.b1995@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: wireless-hotkey: Drive the HP airplane mode LED
Date: Sat, 14 Nov 2026 12:38:44 +0330
Message-ID: <20261114090844.2573200-1-ahmad.b1995@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
References: <20261030051839.1625859-1-ahmad.b1995@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hans, Ilpo,

A gentle ping on this patch from October 30. Is there anything you
would like me to change? It has been running on my ZBook 17 G3 since
then, across suspends and a kernel update, without problems.

Thanks,
Ahmad
