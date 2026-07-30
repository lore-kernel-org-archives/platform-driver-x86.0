Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781DE3B42FB
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 21:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785446164; cv=none; b=P5oE4terDFPWBy0rn8+uhEm5UIvcNqJmqqv4m7soSKFTHOE8o7wJOgYXVaCt8nSwetUjkn8/NmCDDgSH3I48/sFVxUbNKJrlmeMGazTy1LLNDZdt3zdAEcVvta38gsXtvpA2y1hLTU09655hbDhSrPHc5rU1UJl3A4CpXGxwx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785446164; c=relaxed/simple;
	bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlJFhe1UTXJHAQbUrcDwt9meYudkkbktEXh1wRzO+N7PJd3r6Q2c5YZScGBvbpCuF3oTYPbaz0btl94kBlR+CG4TrjDEoGB8a+QLJs11JGe2M2krsPG7IRmNaUSfy2Kj38HdbTAzhNHniI+7YKpuetUIOa1vj8Kk/yoa6Y5dxR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdANWppI; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdANWppI"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso422977a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785446156; x=1786050956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
        b=gdANWppIZaHHVrO4NaZ0vAnYOeETJRqHszRJALyTxCLTqgXFXrtYSNK//frvSJEA1M
         3XJJ9haOTo6G6TFEVFdIkZaz52Q8g5dIQV2bVosoXWU/WWUFW/93r52sljYl22mpBKl/
         2MLJqA4PXP/ZhvSSifBMiJxZWjtupSytErT1RK1s73DP0GXqpIkcM5CzcKqA+eoYZkU1
         8HpTUNx7+9bcYo5oBcQR8sogLak4n13pvrOpuY+MEVc05W3e9bhnbfFlWDdj5mvoouCI
         HnAYRTRyxcZIqKGWZbU3wEQlEpc7dIhx8SWOIQw7iUrd9xDOnXw6dWZtVg/1OHfI5+BD
         2i+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785446156; x=1786050956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WG0+e1KN1nsoMOFFn5MjuvZvyoDnerqjnUnTWeX68Mg=;
        b=TS3HichXfQiuHqbmnLvY6w0RyF2gLmsSoyL0loVDF90Y4LW54qZ9Ew7j/jo8ta1JIE
         l6ug10atHgQoITEtPD5V8KqB+xDuwgy/iHI7AZEjZhBtdaNl4j4GUkkpQOszpzJtnaQj
         eRMT9VCQ9qB+yZv9vrM45p7qWabfwIMw/rvJWxivghHgERpbQ5NxCn5btd7ZGRmRuGfP
         YWJk6cSx+aOANSmGbxy6wLK9G2Dx19GE3McFbSDDwmUqZ366ITtpkmarHw/Pv5bMwLT8
         rX2xGa1buC/NjQRgsEagSL7r4p64zRxLgoKoCUBw3PXf4IW/vLea4eNQvg75WzQq7W8M
         Tztg==
X-Forwarded-Encrypted: i=1; AHgh+RpTYCXKwg9CqmvoCqFs9B2eL/Oar4/iZ/7s/YfCJ4wDmyJeNDl4uuGzkdh1rPecz/dZD9njEmOj4Yeo4mjAiljooHZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0pBpQBSWCJ6kZhmbGj4mBsdrCUqy3FFWdnfSBRjSmAhbbWIso
	yiN0P5ycYIJenNJs2xaKn620DIxssbTA/1EHId0s54xUE5L9gpnMv8M=
X-Gm-Gg: AR+sD10Jw6sLP8Qgp0WQAQOB888Y3Huic0HlCY+M3EnAIhAUfTtt+58InHXZCAmNs51
	k4u8ZQohQIdieRNafufXKGS3m+t/zS8xmdghkptyZ6MilcfGdyiBduxIUmH3x8QYXDJhcDBqxEr
	XExwhJBNTEn/9A2js0lGyGGZJ8oFnGF0dXCFyldlBfCgK2gtXbE8iAftD8IxYrwWpGsc+Z741H5
	zl5b9skYTFHe0Hb6df1/ay+kZqIO+FyrY57nc1M4NzGWA7+k9EcxbwSjPGiq1247gQ0YMYE5jY+
	EbIVP2PKoUICky9p3nJRau+TdTgR2osHk/AO452JEVcHWjmcp6JW7LKwyk9cvc3X0SFX/c6I3GD
	67xwUKhgkGkkE/uHmcbilTp/1dr+QA8vQ0Nus2z9rKgTDK4ofilvfIGXkihshEbifj8j6E9gfiM
	tPrgZXCD7lYLoK9W4MMPOWjzM7k0tBy/w5pkKGUeM2Kmw7vjeH4ZdT1gpY2nWxrSWRns+d/leio
	MGudP/zA+YXL186OTR8TUKervr0FrvL4+rxoQ==
X-Received: by 2002:a17:90b:380b:b0:387:e0db:3faf with SMTP id 98e67ed59e1d1-38f9c0abaecmr3050277a91.40.1785446155807;
        Thu, 30 Jul 2026 14:15:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.221.78.187])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7263cfd9sm36251186c88.4.2026.07.30.14.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 14:15:55 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: mika.westerberg@linux.intel.com
Cc: YehezkelShB@gmail.com,
	andreas.noever@gmail.com,
	atharvatiwarilinuxdev@gmail.com,
	bhelgaas@google.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	dev@deq.rocks,
	dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com,
	hansg@kernel.org,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	jarkko@kernel.org,
	jmorris@namei.org,
	keyrings@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-usb@vger.kernel.org,
	mingo@redhat.com,
	paul@paul-moore.com,
	platform-driver-x86@vger.kernel.org,
	roberto.sassu@huawei.com,
	serge@hallyn.com,
	tglx@kernel.org,
	westeri@kernel.org,
	x86@kernel.org,
	zohar@linux.ibm.com
Subject: Re: [PATCH v5 2/2] thunderbolt: Add device links for Apple T2 NHI
Date: Thu, 30 Jul 2026 17:15:42 -0400
Message-ID: <20260730211542.1422-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730113209.GF20844@black.igk.intel.com>
References: <20260730113209.GF20844@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Agree. It should be preparatory patch for the series.

I think ur ideas should be implimeneted AFTER the patch, because this
patch adds a kind-of important feature to T2 macs, and well ur ideas
are for code quality, and well it takes time for patches to upstream
