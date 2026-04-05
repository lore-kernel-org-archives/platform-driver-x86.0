Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106EF371046
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775380545; cv=none; b=gmaSbxNY1YzeLQhTjPupKxVw1weamO5NfpMy+au70prtJBm+Z4LRhRyXQHbNI1A1B/fpRXggJisn2Oz/fJ7FWHEFhB2xC9kHbps5wC+YXoksVNsFicrpZXuj0EzILfrHQzunOzofcdezqNkhZbZ+RxixqEbovdUsPFDm0V0ciHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775380545; c=relaxed/simple;
	bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q866x1leD6ze9K5CG8EfQxTQsMp/IB9n5upkcfF6U9Ky/yBfbwoaa45mFxPbF393I3pw1Jsihu2fQV8YVLehYpaqh51kDVBDc0PtQs+vZaG7JO1FC62z4rmk5fBIwaIQlL8LdjgnD6kYdR5poXNBjqv9x6EuKXHG0P7mLphj0dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cUDDcNGO; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUDDcNGO"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d9827661bso1504503a91.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775380543; x=1775985343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
        b=cUDDcNGOqWi3JwQgfqiTCe2F87PesAKpVw89ITgY6H3z9VXmdPQVAlYmJ2vjXWRe30
         8lz+4ew22wiI8ZF5doRVFaeh8YBdqvNnNszHpYmIBUsPzWQdoOOBSZHvak1EUmwx5Vj5
         XV9ieO7MJhvpudAXYiVrqEKZOfczapPZ9o/DYlXFMv3sBxICWCrVmx3UL9gGb77C8O+P
         HG81YLIf+Z7lUu2FgyT8vPDTdDvAr4wUS38xJZiDfsjtGjsHWXs3IIyMsfiCVkbpaODH
         +o8En9n8pzWDEMgcNSR802b+mxIpV0pa5c2yOL6J4qtdPE2FHaQXiT2nrImRn1nSuW0P
         Y6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775380543; x=1775985343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14QcobTYAs6tmK4DZbG1d7Ts8aPo1wgkXwEuKU5/0gk=;
        b=M1OK4z7mJKfAVLRC/H7EsWA2it/7VR9Hp7HlymmCCLXi9y7YtX2Dg8m+ECENtMx9s7
         idlfSDLw7Q7JELb8bocBkW4X7uUJJJ2R/QkreC6Liq3V5CQaqPItXsSP8+dWYh+mvvfa
         0qLL8v4DfbfDYdpHfrFkvGykLg/G8dMcYtYjl9BcUwEHNpHt80vNmBi4zN/LxMem45PC
         O/MTNtG46gy/XyUSJy2wUUBC6+mEiEnkQU4LT2mkR36RK/d8MAc/oxW8a35w741Db95b
         l8v16MN+UkztAXejQpnOJEq6QxpzHVeOBXYnkOSXte0dSNc3O2XKSN4mb6VsctFlcjEU
         sAhw==
X-Gm-Message-State: AOJu0YzB7gCsBpVLYV+TPVyxQnZK/jm8PEHLX/tWSdlw+lmMtLUNcyLr
	CpUQSADIJ8phtKUjoRtjLizgJDma+auqoWb/VTO+u/HEcrNpNSeC3mOu
X-Gm-Gg: AeBDievCTzn6Iygn1uaFUKzsD0tyyCJx/0jf3to6PfcGJhqVmevPdfVPAuOIjS8JtnU
	XeNPqriV/RuMc5ZyrJ74FgvkLpIJALz6+BKYOB6+yPWt5w0U5kHBSAz/qR7Wb3B4VlzF3i721q4
	ebhsKDZCPnINKDWS3Yl1G9NBjv0PJ54k5ajFTRIV1P57thaIP+1fQ5JUYJvafwzfXUQlQ9qsw8I
	MEoGFBx3TNd5lWmVX2TwN+DyYgZE3D5nMgffCnx6NMIUYvIhGSx8TtGyw1By6nbCZuINUAWnSOk
	kSVC1X2mLwhRP+XtVTdNcRq2r+22UNoF2xKkfF8VaSawQFYwxDLv3BCweHbR8PphlpdmqSJrOMZ
	bRACn8i86m9GhZiflTEvABlBNGQ293K4yPy7EAlCZK3TdJb6TaeI+hdehzL+xbUR7QgITlrU4S5
	2V+gbxJrVPFWtpK0qflG3h+M0=
X-Received: by 2002:a17:90b:3fcf:b0:35d:997c:8ebc with SMTP id 98e67ed59e1d1-35de69448e5mr8236060a91.19.1775380543369;
        Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de674a87dsm3208105a91.3.2026.04.05.02.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:15:43 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: int3472: Handle GPIO types 0x02 and 0x12 for Lunar Lake
Date: Sun,  5 Apr 2026 14:45:18 +0530
Message-ID: <20260405091518.5322-2-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIk5GhZ9ZXj1kt9@ashevche-desk.local>
References: <20260405091518.5322-1-vasuhansalia05@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the pointer to the STROBE series.

Based on the specification, the correct name for type 0x12 appears to
be "handshake". I will use INT3472_GPIO_TYPE_HANDSHAKE in v2.

I will prepare v2 dropping type 0x02 (handled by the STROBE series)
and adding the proper #define for type 0x12.

Regards,
Vasu Hansalia
