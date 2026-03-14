Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E40D23BCEE
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 22:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773528310; cv=none; b=ZmaA57mQkc1oTmRT9VZ5bw9+hbdLiNBo7ZqjVnjeTxU6+74Y4Xh9jpgG3NezhzIZNMqZEGjEezQV2li8R0d+mQrDAEPt2b4nhwOWjDF2FE5drmnnzz7FYjTTTaNStVfUVhdglgA6bjY5K+CIHgFrgu0NeT655pBjcjBUaprXrXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773528310; c=relaxed/simple;
	bh=CClvsyEacqnD+WAJ8DNWjrL5ehglcPd6KX206B917EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RtwZYknn3uX4PgYlXu7jdH8W9L56v6B1E/4TbFNa483ldhwOTnRLGFWhK7lAgEJZZb+jIzSMSsNF8T7Mh7YoObtQodolJb67CQUVAOnc8xX0rp/t718Y+9EtetR854uyYYlPias77MRRAgY+xhRM9kMD70k5XaDAms3Zi1tHrl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRn/yC0P; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRn/yC0P"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829a9d08644so1949467b3a.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Mar 2026 15:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773528309; x=1774133109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxRVDMRkMzVhFvS3BPCxYXWqUEN4lEbBgVIcoiT8/Ng=;
        b=YRn/yC0PS+TyCyb4kq5Pq79ZxQlUTDVyxGDVQ2Y7DR5+aOqoWWedGsdI3bxJl4ZUEW
         YBo+LwnYg5zUR4UMfWXaZ/T1SmALLwBxlIr8t/DNp6ItAiX0B2HbZOZZNTuCy5h3RT3L
         zQNx7V86L5bSIaYNPcY/FO17r1aRhxoCvCsebxIvNesVjT/MSzhinZd+JSmYJi83CWfD
         E77S62VtWcED74TTWo8KeK4vXFSVweO5KSgxn/B+e8RE7No/rlFKtysrls5glMINoOux
         ZscS/lTRrrhCTEcakIfpzxavqiQkBpE+OWgtoFockFn490i5yrzHiCUi3WjREHGG2ZAP
         jW6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773528309; x=1774133109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CxRVDMRkMzVhFvS3BPCxYXWqUEN4lEbBgVIcoiT8/Ng=;
        b=f8c1VsQk0ZTdlJezz3c8RXBgrg/5B3eUOvFgF3InpN6HmFHgZUFEWsPNBSH1h3mfYa
         Wwq8niFluiIE0M87MRSI+kEmExhrvEnkGv0SfVdbsydNiimO+OkiDI7sfIuiRk86Sxmw
         abMTecvMu88txxlh2XOVGp/O6QuJlXkPdQPLut2Z9erwhCwaJzSsDuHAXRA+2AY4B1Vl
         axQJ1VBOA94/GUgD4MJm1McuvVe1hZCcOhk1/jopq2AYj2xRKPiKAdcvi312KecIntxp
         umj0Pzu8QEGSB13GO6ou9X/RCPBnQS72VmPX7Fe/Hd6EdjLDq6EVTFj0mR4EumPN4YIf
         AGYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgWlX6yRqx3MEJERSelnZcPSVqVnouhCUC4ZzcUV43CLHczH17Fzpz4/eFh0l1ChGeVT8zHipbNZzTzk1K88BKZpzL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf75R1anayygg2x89iCX6fPmBCkCOwVsCr2szfAEza68F3lo84
	DEkYXMKvO5cwQEA7t2huKeiiiLrovnQ3rAW5www6wx4xkLYh/CWEpck=
X-Gm-Gg: ATEYQzxdAEcOnKhiptaOkV6qwxwKPj8OMJEbG2Aho9Y8U69HOuqpWzacQ61VvvuIJM7
	pNNaQ8IMRkrGSBK+zaGNpCFCvQFX6o3JQc49nY6GHKkW8kdUpxZyjNEF/HOlAs1wFIRZ9ut4dol
	YUiph/u6OP7ZQfxzPvuG+oBRna6gWCjUA2PpfVc/btFPGIsOeeih51SrGtDhlm+E52c9mF13bCy
	DWrupPzAHyyOIKLYWBS5EJrZ3DE6lbTofE1lKJKRgREx/JU5Kn61OQ8qsHJPDsHJcMHwmed5fT2
	2ELK2Z5l049t3pTeuBPDeiuKOrEPdfBWji2aEa778yGtJ0TsQe0E9EOEFIiPzZHuqun2hXDlkDm
	LojFLoqOFebOqff0pFUryJj66yd5O+8KxZgnYUfSaBEBstYbiJ7P5OyxKQsBYc+01FWfO6/ihyh
	fSwoMys9Te40+6/gBnlEjSNcdOgPUi8LudahZE7SMFy8lR5stHi54Iy5lCeiDkCIs=
X-Received: by 2002:a05:6a00:a256:b0:829:8aa3:2ebf with SMTP id d2e1a72fcca58-82a196b502bmr7476269b3a.2.1773528308745;
        Sat, 14 Mar 2026 15:45:08 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072422desm9743938b3a.1.2026.03.14.15.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 15:45:08 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: atharvatiwarilinuxdev@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Sun, 15 Mar 2026 04:15:03 +0530
Message-ID: <20260314224503.12022-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aYx6ocvaFHunfP5f@wunner.de>
References: <aYx6ocvaFHunfP5f@wunner.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> This version moves the EFI handling back to the gmux driver.  Why?

Because the platform maintainer just NACKed the EFI backend driver, so i
cant do anything

https://lore.kernel.org/all/c2d14818-1c34-47c7-a210-1f7c737f0bc9@kernel.org/
