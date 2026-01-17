Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D1121ABD0
	for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 20:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768680514; cv=none; b=Y386fllLf5sbP7hpmNOtfOZ5RZDPQgjsn6YC7BfzeabAmwNScLJbOfIzxP5AyMz7aC4s9uaBm9ny3nOo07bBok8XIr8OaQdHFBwtyeahlI3QZGN7YgJd3w5GgaSOlcZID8/Ps2+fp8lUK/wkGiWK/vLo+iIskoWAotG8M9qKPqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768680514; c=relaxed/simple;
	bh=7MhmRHG5OmWUrhM6cpa3CWRK7GYpks9krQuH1JNGUFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZOGObVaR5CEvPZ7McPuqiNfe85Is3YTu/scNc3zGR7WRBPlnmjOZK1klIEJXxvRufXJfpZ1pjSsaPRRfvlzFhvDSxMy1nGGI/g2hyY+UNuAPBuoD2IBrDCRZXbdleXdCpjLFt+yCHPlUXZrJnlrQ3tSgXVvOSLHNt4zNDslmtX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZiTi1gho; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZiTi1gho"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-382fd8aaa6eso28589231fa.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jan 2026 12:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768680511; x=1769285311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=46KVe15tN8TpcCSkpGIyJmZvxVcuVxo2lcJNsvw24l4=;
        b=ZiTi1ghoQmG2f5YY8JDZjvkRMncRxFE2w1HxdC5kBeUlCP5C22QsOYIhwqx4pL+4Fw
         0Yz+O1/qnlRY8k1VotDx8mcSG2NBvzl91NHeEilShCkxZLWshk6WWt2jOxhSWWmBdTC/
         JYmjepQx1CcoJi8KLcIN06fhBHFTIGKB1XNWh5+iHTK+SDnfr4p8XAN6TvGv5La+2QRX
         ZNn17xx8bcJzw9HLNuIEnf+4ah9EykaaqX4Nw0q3P+SmY0ttbAGvSK9iybdAVaIXdipi
         ojRYYqR1rnItTKYUsRspqghAplzRi+OhvK8O+3S4y7q41bWyvbHaqFyUcTlAzc3f3Ozv
         BnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768680511; x=1769285311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46KVe15tN8TpcCSkpGIyJmZvxVcuVxo2lcJNsvw24l4=;
        b=fZuZOrvOFTkxY5wcuiGq8hZOaZ3wFCwYfxe2KIQbLjsVPGDNBTUm9zHz3U+4E3nC1g
         zKUd8LdYOEBvnV46RFNIaAT83U+THmT+N3RlUDdezcxK8lMNnRn5CqLScwWySU6UO8qA
         ECS0ZtJwjdyyymkt3AzDwnM3Dq/hCthvKdD3xL9uvB5Yn+lokmKTEU0eA7dC3nvkP1aH
         mR/nUnDHDfx2qU+pV+KMxG9giAqN8P04I5bc6ogfgJrsbcWHNV6QrptDhcv6cfUM9nsg
         /0B/tv6Q4fRmpgvhVdI9tA3p6yKd74iA6d1vT60nfLBZahemm/NLGw32Gex1RAnXLwjC
         yGHw==
X-Gm-Message-State: AOJu0YyvvBHGkvVlJX8u4VH1faK3541hNag9QUMY6J88lWebkuk5Q3e9
	3RUksj3QMAKDqxQbGxuw6HrSD4DA6sn87Qd/9cOzrEEu08fgdXTN5XScIN4VNvrj
X-Gm-Gg: AY/fxX7hJLgWDvaOeZ+rcHf3N7Pjy9bDAGHMYbB65lRDYA/9+2WfhInuOGSHTbh1LUr
	Hw4DF0a9GATaMcFmvUZnnIhA9yNG8NasplWBh8tvk5t7pKG7a8TUKDcUKmXDvGwPP1Y/FBGNoE+
	sKRWBNfWsYCJOMWjjNFgAJYLZHU3yN5Jo10Ub1rSSC/rZU0jnOaw7QrVgjL7jWZbGEdGXXND/rk
	NF8+L5lXKtgbQjDsMRn0qEHblgKwJRCfa30y+hwBW0LYZNdjo3zelvGBQaMbKYO8BrOm48EHGbR
	imPCODgzXwfpU4i3jmGOoqEc0tO2h1TXeegwFUABFEdxwxMrG64V620P4dnOkSxRRIVO2t329vX
	9TPxqHAKi01CcuijrPLHAr4dFC8Er/bR+Txi4+7P2IZF4LKK28fbmFmyE+uOK4VWOahRPZPs8Mf
	Dg/++aSG/koy62dA==
X-Received: by 2002:a05:651c:25d5:20b0:381:1b32:e28 with SMTP id 38308e7fff4ca-383842ed0a0mr20255411fa.32.1768680511336;
        Sat, 17 Jan 2026 12:08:31 -0800 (PST)
Received: from gl-laptop.flowwow.loc ([2a0c:9a40:8950:800::67d])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb94f6sm19114571fa.49.2026.01.17.12.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:08:31 -0800 (PST)
From: Alexey Zagorodnikov <xglooom@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Alexey Zagorodnikov <xglooom@gmail.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] platform/x86/amd/pmf: Introduce option to disable Smart PC function in PMF
Date: Sun, 18 Jan 2026 01:08:10 +0500
Message-ID: <20260117200819.12383-1-xglooom@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces an option to disable Smart PC function in amd_pmf driver.
Sometimes, the vendor firmware may contain bugs or other unwanted behaviours in the power management domain.
This option allows the user to manually disable Smart PC power management and fall back to another strategy.

Alexey Zagorodnikov (1):
  platform/x86/amd/pmf: Introduce option to disable Smart PC function in
    PMF

 drivers/platform/x86/amd/pmf/core.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

-- 
2.52.0

