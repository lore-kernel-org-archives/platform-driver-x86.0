Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223395;
	b=rCCDe/vOPGw/NtjQFtIn0HuHkIpVxHfdyHesnudtpBaONt2gcdQ3Fl4zQ4+Y16u4ywIJ
	 7S3ypO5stIHwipRIQn6Gz9ZT6thwvRWqlALvNLEZUxiOVNXlJpFM+huYIl091mWnEu07D
	 HIwnkfb1+dO5Hd1aS+cjM6pfUkPCM+7OFkcSa+AhFHbIHY36jRqKXYOEo0YQwGNzLITh4
	 nWeOQ01u0a++KLa1xX9E/16ZlRShNkJ3tBvsC7DlrrSFvDbFj9bPMH3LT2Ir/HTRNBCUj
	 Q5ZB5Wezmu9j708x6WJCDP/8+0pdRxtywM903u4ZHOu0e1ja63J2KH6d4QWoGjpuWjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
	b=XfJFrpo1+9cAu+itmsNJjpMVvVda/2UGkMPefdmhx1a0uZsL23McfY+Die/96NMszKDl
	 etl1O9xjPGDx4BL0qcv7wvltSbkpq96l2L7/5g5ANFtBkp8VUcuQ56meB6hRA152lwoUx
	 chLYezdEV+cp69EbadN7D9mnrE5l2qQE4bMT3ua1DMZUxXrzOo+P+r43q/2DNbOZ2brc4
	 VZNMhC3pLvRKGPAQB11IQICe6f2j4j07m5Zjqy08PSMGMy2v0QC5rCPon962rEGttFiFI
	 GZuLZxmc8Q9sRiWQEAZird/AVvIF8mGzPVbDkrsAt/LeZi4dgvaeqrV+iEyGm6/Fdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqIx9bfX;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCEC606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Nov 2026 11:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BCEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JqIx9bfX
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15dd124bbe7so204115c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2026 03:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794223394; x=1794828194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
        b=JqIx9bfXAd4VH2Rnnaq2Yml6+m1m/OKu+/zbPwFwMYnAHPBpLF/CRES64cqaFzFg6M
         EyiBi/qB7+7X95v76SZh/bNlpDiPagfXhMmtN5la/5ZsGVjnuEQbXrogURHIHV8r07Mk
         X4NatdTHBYQ4doLhKhfkjQxsMaVFphz2BZUQp9j5KDEZ9If0fAFUglMJVs/vbzLXof0r
         axjQNUCnSgmf5Xl8HkivSIy429Pe4wR+CBhLD7XiC04meLgzlk5Ne47WSf7hIiip3rBS
         fWs2ISIRrgw0cvGa/faDlVudMB86u5Tbs82nFLuMunkzuxPRszg3npwhOuXqkVoLGRGn
         pqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794223394; x=1794828194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ug9suDDMXCYm5zIIS238Z17j/kqNhOBIwrfXJjx/zS4=;
        b=ydyqPuXTbsHuTyPaEox79igDF7jGHPzIt3iLxDgCPeXX6U/mXFhBD6YhUaPEiYJDz0
         vkafELp/IL/GobnU+9KSjwODXkNzNPQXrUKw71QbrG45nZFQ+wVawu4r8Oevmh6G16Xn
         ft08aEjNEtraDWiRf429Usd1+weYJSB0GDWLKWF3HUiGA36TtYN4SVDIPo7I4ufcDQKG
         uI03rLhVfjkFgjKtm6t8+pXKIpFzj7/HNgWUgsNBM8bfPA1nKtx6Bhj6txc0qpq9rlKz
         IySVrmRGSEV9g3Tk6mxranpPoeSVmay0MuPp29WqCk6s0enlGg+PwZCyAuIRZy0J+ElK
         Gtyg==
X-Forwarded-Encrypted: i=1; AL+hErGx+SMlEgylpZ6DV2oSDAk3wDRnTCmOlBB4g7YFnWXQ2BdkEHdCsSfGNd9gJ/AWBue+6OlnxCZsUJItGPQ8ioRZlEjq@vger.kernel.org
X-Gm-Message-State: APuU4Z/9lq6Vl6noRhnvn0CMoxcdURo/XVWpUKLTfOvz1rZ+X1OF9Oic
	/FFvAg/9mCXMkFHFMHPUCocu/NklgxJeXgJ2LbHVwzDl7U1pPWAxf39A
X-Gm-Gg: AYBFou2i/4r/Sfiz7S/Npkboi3oHYuAQflZQAXAx3C2W+SeygEpf5R4C3Atn0CMFply
	/nsbEKu/4ns2FUpMJMp3zO1+giR2xecxcOS39mXB0WROC7ccaLhdivYInCaogj1v/WjF57aULXf
	2u9tN+B2uXMIjNkdD932WL/TFpFofOx9npn1UEhxM2AJIkC432Ozt23GDihrpFlSkuMi17JtrkC
	DmfN/WRZBOeXCk6e+10LLa5zbnYirnyVYQEYP3D1Qfe4FveYw0FMCMdOgzIyX/bvUwdzQIT5yV0
	/hoKghLjFUdj2GMqvs5+Cm4Ei7o59bXYQ86o2cyyF8e1F8g2wqtlp7pkXBZNSq3zhpLqv3j53ab
	kaTo7EKtZ1Khoiuhj2Ftn2qDtihOy5GZ0lReHuOVKJ04lMlFM8I12CjIzachaqM9cTm5rMFL1mS
	2XQ2Za6pv1e/dOss8emjqWJKWuF/ktl+1VuREe7HY79nJwCWI5dQuhKe8HGz4tybuVQ/GN6zqis
	XLm0zIbJe1Zlzj8Mi8zcnXPgprHxBdQhwLvEJSTIrjgtGe8VRXXz5/ijBzg3IRc8fkb8JUxDvJX
	CnixdnUibc/+MxYhux/H0XDp0xMm5v3Q06HLa3q8a/xNA0Ezd2rvEgWqC3w7dMNk0ULcrJHp80p
	KdCCt0+n/U1rggQ==
X-Received: by 2002:a05:701b:241c:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1b39feb90f4mr5465372c88.30.1794223393699;
        Mon, 09 Nov 2026 03:23:13 -0800 (PST)
Received: from chitransh.. ([2401:4900:93b8:dd7c:3c58:450f:7886:86ec])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b372ed839fsm13449164c88.0.2026.11.09.03.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:23:12 -0800 (PST)
From: Chitransh Mandhaniya <chitranshmandhaniya@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: Re: [PATCH] platform/x86: dell-uart-backlight: switch to devm_mutex_init()
Date: Mon,  9 Nov 2026 16:52:37 +0530
Message-ID: <20261109112237.424875-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
References: <20261026042310.596206-1-chitranshmandhaniya@gmail.com>
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

Hi Ilpo,

Just a gentle reminder about this patch. Hans has reviewed it, and it
still applies cleanly on top of for-next.

Please let me know if anything else is needed from my side.

Thanks,
Chitransh
