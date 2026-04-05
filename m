Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259BC3FFD
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775380542; cv=none; b=pZfXVJQb2xCX3qPqKpEFZ0g5qg8Zuq6l42ZosxB+a7ECYKMC+4h5jlgERKxUQ42mTKSQ1xAkuOE1zghGjX51ZcdhZl+Sn8vdmZhLvP/f8gll9dbxF1qI8/e5PTZ7R9WEfrlECy3XWPD4wx79aHdIkLs6nXiwnrxORNbpNFGjPRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775380542; c=relaxed/simple;
	bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RX1uB+cjIPhMVEz/xz39oc2MMoeFIU5HeIe9RDNhyLxPEL7atDk5VZTY/HTerpB5TxWNdZMW9akE0JaZP4Gl1AmFoEJpW8nFV4IF/28QRTM++UaEaYyGRnTENqXVwOAswzjathStIi/DJiA5vdMkaaONycxrsEyUl+ouQIfneCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtzZkoEm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtzZkoEm"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da2d35eccso1955352a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 02:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775380540; x=1775985340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
        b=UtzZkoEmYnLOep6m+Z7hgR0dNwzBhIEFfIieZedYhqaHcDkLb7/Q/UzdcnYewjU6CE
         wbT6jAm06d9quupXWZ3H+QaTlewJpO08MpsD1RHWuB9PZG63IB0ktHjj44HzuSY3Kv9y
         Sptbsau+M/0FqVVE6kxG2ltBcRQ3s1WkjXb9REUuFj80mSaIr4qzqzacY2VLpJgIb+A2
         3CRzKlJKM+8hPEmaVft+jvBLjKX9pq/ETNxEWTG137+8kk8JtQyGhT0kl98G4PhfbA54
         bOStoEb5oBoa6E++b+Tci5+xx3oUkmJRBirzebELJwcYP4Ims4BGAre2aD28D4FsOudR
         DiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775380540; x=1775985340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QsgUECxygV8T/LN69w1baPyglSdRdFa9YjKb3vC8QAo=;
        b=Cl3RGKC7ZbfIXhm64mR7hmEZMybt8AYV/ALjWzof/c3Y27JCjDaR9FI1KCCm+2hLyd
         BKrycOzx6boZD2aUIPR+UVQj+26AzN/HDl+VeOKW/VEkiQKK5kRRFbUQ0i4seLzMUqzX
         0t0qu+647FrwLR4z0ISy9kX3kcP/zf6MI5b24s7dCJ3XtdEzFJadUD9YtBPwbLHwo8P/
         YiWXuhvTwtjos76prLDvREKWffOA5gc0SVdH4Xp49smoWxdOlHHiqCSLrTgaqTlLeh28
         2QDZkWyrxPSCnt1CBG7F32eNDxi1o+5Ojr8Yt4dyXtaK8+jJeHdaVpRv5tfVxTkpKb2s
         Bl8g==
X-Gm-Message-State: AOJu0YzCHglb6hF2RLr8gr846XSNZfKTBrBhgZ+Vm8yx3wnmGWgSw+B8
	ND4uoCspzuqILaYzKw+WzXbDn3+jzPpnMpdam1fpCcfJmBm6CIKCU4yo
X-Gm-Gg: AeBDiesHpHy5Locy4Mw/2uf/uSHokwwyBWeMCYMFf2g2NZfrXAhhfZyqmAkn/jBTVyO
	Z0UCm1CacI/+keD/jL/G7XfBAJKNUDFZ2hHcUZjX579zWLV7qC1o8wIOMZAhYOVS7i8dIebP6/4
	p0s+zqLGL/tUJlspxppjHqOCdTAJ9GZPqutnHzQGDUM9QGHhpEGrJE4umobYqM95z8TkXUhFrgY
	DZL8pugBrmUTFYShboSxAzLxMcA7TxHVdXxnNK7Jirw3MS4Q3wpoe6o+kWzJq/ENUT+g52oYxZ/
	a3oXQ+dPm3DCMLKLycc1pprgTXtU6GmSQMuGQW6rr6yGrUvH9cr7uX26LuY+fVLxd7kp1geCjtg
	AgN910mMZCNWssSQhilk6+aG+apXOMUZa0uoM4PikMus7F8IvLMmzbm4XqGlhrmwoGIUrQYsF0r
	0f3Qwg7TBPlsRgA7d2w0moqDg=
X-Received: by 2002:a17:90b:4c8b:b0:35d:a2d3:5c44 with SMTP id 98e67ed59e1d1-35de69d5567mr8170403a91.28.1775380540368;
        Sun, 05 Apr 2026 02:15:40 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:d639:9368:51aa:bf9c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de674a87dsm3208105a91.3.2026.04.05.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 02:15:39 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 14:45:17 +0530
Message-ID: <20260405091518.5322-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adIkXdCXr2x2zTrE@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Yes, multiple PA14250 variants are already on the market and shipping.
The Core Ultra 5 variants ship with Ubuntu 24.04 and are Ubuntu-certified.
The Dell Pro 13 Plus (PB13250) with Core Ultra 7 266V is also
Ubuntu-certified. My device, the PA14250 with Core Ultra 7 266V, ships
with Windows 11.

All of these Lunar Lake Dell laptops share the same ACPI BIOS issue with
INTC10B5 not having _CID set properly.

Regards,
Vasu Hansalia
