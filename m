Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D55C2472A2
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 22:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773612529; cv=none; b=ojK+0uPqR2QYWJJiG0fj6gjw/hkd0KHS6uuSGbX1v/Z1bc4z2LhRGrG1w93VN8IJca0W6JUPAjJEhUrKnRkp6hBEDa1kK/DFICArxeYfm5lyBHWpJrOX6CDp0IohH7m5kj3mKaXorMxSEBBIOZtExZCkO5tesROWqJut9K9vp2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773612529; c=relaxed/simple;
	bh=w5Db/9d2lyV7GdjV3cjRQbozmz9PzWXv5aWSbNcRY9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WnO2Ux77ZfQrj+pNxt0EJ5TcXVuWzSFCKhYwQiIz7X/WmnCO2g1/Xf4w4GDV6gyhy6OhnYwcgV6tNlccYWQoqgXbr0UFMHsJ9ZYOJ303m4QvXv1x3RJd1P/iA1Mz2UcXlqvd4P8kWxJ366IOLwzrK44OjSAXtmlDN4XNQK0Gsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ivSlLgvq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ivSlLgvq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so1705113a91.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 15:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773612528; x=1774217328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5Db/9d2lyV7GdjV3cjRQbozmz9PzWXv5aWSbNcRY9s=;
        b=ivSlLgvq5cxK2LmQ3L8WBwAI0Lh87P61rbyeZUymqEPFXKdw8TIJwLU82hmH0JSQ9Y
         uS9MslYClGOGsGbDFlll0nMXxWH6mIJuZSL8aQWy9LyyDDEQ+YCJpmJdAbFT1ecZnXyT
         FD7yr2kofggPN+5/crTv6LmXgQtfrewbdX5LElE450ds/DGN2vYJPbEDKeS69sifWP2+
         2AhPIdVZQSV1SOOARlVvjmWtip3QML8Aj5TCsQVF9LNzkk9fcAR6Bo8ro0uY21fAD2ty
         JjZW6wNUXA8KK2gJJQpBb0vOsJQx/FRX2hVZrM3GQEIkaHFQ4Lm9IQCUFu8t2W1Kd+WK
         VbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773612528; x=1774217328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5Db/9d2lyV7GdjV3cjRQbozmz9PzWXv5aWSbNcRY9s=;
        b=VQW81/qY0UFXoO6TSFMZTXJxZmouYea7Ml9hGajFM2QnUfhG1d+MieN1TKCOEU13iY
         W1+rSsvRs+f4MiIvsXgD9Trb/rAuZrlUBlIi9mQTwer9WpSZpgn9/w06F0XJ9eEHuJ5Q
         u9MIoEjw/vJ+A/8ia3Wtd9VlWujbNMbSMFVTwvClNY2JcqtZ8D3hLZyJK59uP8FNUuMV
         6mRGF78pDFgc3k7AVdwb0qkJOowhNZtY0apFGS1/8LgfJdHG5lLsp7Y6ol4I7zg/IydF
         ThNrPc9xXnPNpOQ8rt8yWWQB3sCPBdRA6JFVw1kJ9zkfyM3V2PEUMKaWv2jZLbazqc0V
         gzAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXRwYvejcIhmREOuTpKbfyFSBZtvUkXRG4MeDDG+mhv52qRHC00fTvxYorMboWe/MR4fP3UentF5C1tk+VjMX+DiEZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxY7u/MoDyxPoGHo4G01IqjGLruBDIBLmCuw7lDrYRpd3Qpj2pN
	93c7t5YXqU3AfQ/QY5ssbwgpYy0hyjEnnQEuY1cGypfkLNxFsEHCB50=
X-Gm-Gg: ATEYQzyTlpGtct8HNdnIsCPp7Ara12RKviLIQ2PjVY+/7tF3EIEyytjX49XmQIJ5SLN
	YdZUk/Y/kpC9dfOFbm+L1Zu7BcbctRQflqhP2aE+s1facNRtbG/yJ8mnw0/5PgfnQlqk3oz9YIq
	qNcrWum8WOtNtzQhZ3FJzJzP96LEcMPzmt9KLcUvAC5oDpSPv8woeMuf2/s6GikYSYt3jS/uMwK
	aUS04OFeCFaJGq5l+bi3VUSah+hRHZLSd+ipDDLk0pr83g/r9cZuYNc9N5fWnUnI9sS8sKykvWY
	SJqjcOg1/mbfjToiVp30NdhzvSPypO2c3+m5CzFhcrSD/aUZYNUIwhLch74yNlzYiEIZfze2bUs
	zlHsnuAf2leITuWmco65TF0BnP/vmVArsa/F8rfHawNuYplBsRGQyM6K0X+UlYWiXqSyUPNipR0
	X4pHxxOzr2mu+3lgbVZAIISc71tMUycH4os8v6jb4BedM20CynYNHEc65uTqzNKtiJduqy79pbf
	g==
X-Received: by 2002:a17:90b:250f:b0:35b:952c:43ab with SMTP id 98e67ed59e1d1-35b952c44f0mr1771521a91.4.1773612527688;
        Sun, 15 Mar 2026 15:08:47 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02e19708sm19144310a91.3.2026.03.15.15.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:08:46 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: w_armin@gmx.de
Cc: atharvatiwarilinuxdev@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Mon, 16 Mar 2026 03:38:41 +0530
Message-ID: <20260315220841.24188-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <21b44fb3-238a-417d-b414-e7903b8fdc18@gmx.de>
References: <21b44fb3-238a-417d-b414-e7903b8fdc18@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Systemd seems to already store the backlight brightness during shutdown/reboot, so maybe
> having a small oneshot service that synchronizes those values with the EFI variable during
> shutdown/reboot might be easier?

This is logical only if we assume every system uses systemd, and that isint the case, and trying
to port the same logical to every alternative to systemd will take more time and effort, than to just
embed this logic in the kernel.
