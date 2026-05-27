Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29CB311C07
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 May 2026 06:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779862514; cv=none; b=ZzwBiej/CYJlm1ckItZHgbTzGHUeQoj/lfp4ly98yiN0AqiI3N0yY3iwlUru81e/Ck1FXug3HMYY3LJnJJ+wBZfxY8es0VGn5CQqDzJssg1P2ULxPq+rtlRphBlBkfTV5cllNjAzRYg0Ieq4LJlZbX/8UGDsrl4/XuhKERG0pNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779862514; c=relaxed/simple;
	bh=+1D3hVb+6Zt/jokGOSsQCDspQRx3xjk+nJ/y2DHFEIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQ8f3dh8c3Rhtam3zkTQAsEKS2JL/t1tppauFtDSQYPUX83nlFRuNXPElUL5ZT2tV3YiFbrjhGcUFgLSsKcKHtWgY5IF50VQJEAoReauW9/QDBN8e6ptG7SSTyRmOZyKvPA9i5kZDs8lbnXYZhUD8V5RMc9kEJc0PQ0FvpMSlSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7Hsgw+j; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7Hsgw+j"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-83f63abdd83so220942b3a.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 May 2026 23:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779862512; x=1780467312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1D3hVb+6Zt/jokGOSsQCDspQRx3xjk+nJ/y2DHFEIo=;
        b=O7Hsgw+jGMS7SvQal6bo+TX38F2x6KWaZ6B4h0Mg9Pv4fO3ZxxLMb5BM/QCt+ol7NK
         cksiRAIhijoGGtw4Gdt+OEQ9uBUWyCJWDbo77s8/bO5lUEIaqO7O0I7OKN039TwE/zcg
         2mEqjBwN2w1j2+uhrw9Jw3KD3xQ2kxZLXGK7McpjyIPC1UL0JrbinxWyv7H65kDbD2Nb
         +DtSOzaUEVkSJtSWCPo4rFlZRtJdMOHnEcgnQKl1Qmc7qGFvxgVZNYh4TdcxMjsH3Erj
         W0SU/KATGs1drpkFf58Pp7qeegirEOoKfv+6jdaU1dolg7ZQRrIXbdp6KyoiWIELGfMA
         aGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779862512; x=1780467312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+1D3hVb+6Zt/jokGOSsQCDspQRx3xjk+nJ/y2DHFEIo=;
        b=CEC+2QgxpOcL/uxagZvk9i+LfnrT5EHyuCaIbymDbduANUvyuqEqCnqn08GL3KIgpl
         TSh7s6ICpb7DBvh99kezuz20MBWrITEJ6tSPrm4ci11nnrm6xdYK4P2OdEstb8PXjtpY
         90tKpUgvGtSUhdiYN5MUjZDtFgYo1La5q/H4icaFkcaFuI6zdF/UZp9FulAfhB/1VmWv
         pKYbdhRtthJnxClhxU1jnaOCmiSgl06EUv8WY3hDx4glOoB8fVhiXRC67B3IaD/FaSKH
         NbGkfJ9mapGZY+gYdJ7zPJ+LQY0YM3YtA+FulP0mOJaccKaap2nzQI6WD0tOZ6l6u6PY
         HfAg==
X-Forwarded-Encrypted: i=1; AFNElJ+oxAxh6VsBOojCa5mL8XNunFTHt1RypvgfdxhS9/2vK6zZ0bAC6QBc2NlCiicNKAGUyJ6ZLwxNy/PlUTwQOss4KJ+/@vger.kernel.org
X-Gm-Message-State: AOJu0YyIW/53cMM+0F3O+6HyeXbBjS2IyFToe4AkR0xm77k93h4zkaeq
	M8lG6XUXYQQUMHQaRILIArrzQFgScUq55IwAal4eGrtqjhGqWr6gdyct
X-Gm-Gg: Acq92OEIvqUl0Xt9NllrcKchhNuJlEMdITJhIXR907jLKT346bfBxaJHgM+P7h+HBnb
	PBFdJK73RMDHSjscSHtZemNE6j+Xkl6Jy2fDvUGjDN0lD922Yr7Vfb5/YiCCMUftu8aMHQiv6qM
	2YKYGdmkNJZTd6v+LuGP4AkEVKJHd3gZT6nD/R8kPMqPpUZDO5j2PRzIO0INAfI3OQDWZ//53/V
	5KZhSXJMM51ZAwOJgsEAfvVOqXodAz2gqrOH0otRXYOECxC75MpL5d870iOyWJZQgLVjXQxPNPy
	AfW6poqTSdZ3bjm5nQbMWfFmwVRkyxtsZiFSzwCDpMBYsqhaG5Li9ICSiKqpdHwccs5D5lb5D2z
	l+qKeQ1zlZna4t+n0HH04MvdHMiW3ApKtcH4aTnYmWiNBecnCj0xKjg57GTpqYtDT29A27XFIx5
	dNAj0Eqjst5I0tZiI6AQ3saiVZ9AqqtrdtiFZidiUHTj74
X-Received: by 2002:a05:6a00:a86:b0:82f:99c5:868d with SMTP id d2e1a72fcca58-8415f5f36d9mr10609174b3a.4.1779862511836;
        Tue, 26 May 2026 23:15:11 -0700 (PDT)
Received: from magniquick ([2409:40f3:1420:77e7:78d8:bb76:bcfb:498a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70df178sm1339088b3a.42.2026.05.26.23.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 23:15:11 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Sebastian Reichel <sre@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] platform/x86: hp-wmi: Add charge behaviour support
Date: Wed, 27 May 2026 11:45:01 +0530
Message-ID: <20260527061501.10943-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505200222.157144-1-navonjohnlukose@gmail.com>
References: <20260505200222.157144-1-navonjohnlukose@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this RFC.

Is this approach acceptable for hp-wmi, or would you prefer this to live
elsewhere / use different gating before I prepare a non-RFC version?

Thanks,
Navon
