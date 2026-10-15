Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2403E49DB
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050255; cv=none; b=CuWgno9y9Nt46RqmMbWNwibp0zcoANBE4LnUYzHXZTfs1yhnaEI7CPBcCoDFyu9L2cOJk5vWYfjZuXD7Rko2UEkksOYzDVsa2s66oLXNb7nEWvnQg0ivHyhbUfHUT737eud7XFQjVqNyin4pv7T6r5NIHxszaHW9K867ayr8fvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050255; c=relaxed/simple;
	bh=5/hM9KccREcqxOCDDx/hlOgmeViHCwOy5cBYiVcsPmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sw0mh8FuWp1fWAq7P5sV5N71kxQ4velujP+e/H8yZVcpd5HlwCAK2snBo+BDQyHsRDbGJk6uemJS1IdM+K2O8C59wVT/7JDPxgDkxCLbdXuSwmZW2ad/5Q5iiBcwY6TevxFs8Kfy7QeXUbPw2rf1IlrEpZE8ykDZJ9hetZBqgo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfjqc+dU; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nfjqc+dU"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db710396ffso37928825ad.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 00:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050249; x=1792655049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7xI8VJhb2pJN/Q4Bvj8qR4K039vHFMTqoT09DNVRZM=;
        b=Nfjqc+dULBQu587+w3fwnpQPPHVdqn/0Lz4MlMTgRUbpcNqmeUv5o0tijNS1TzE0B/
         94OCwVVSB/S4fU2ruOjU8GR+66Dvol1KfkqLVpPa8SYOBBb2xiwm5neXrBMzB2HDkGoN
         DtmoRFvt7jTtwdvwiuZyJVMvMRI/pKxB0+TQIJAxN3/1jSkIbShrmd/p6rx4X1I347oo
         /nzB/v2NkVBhaVBXQnuZBN3It3HSM9dplhTDh2CStL4xDV05dOQwcRsM8ib9TzVRW18t
         gp9NQK3NPBkicmNVVTSzPl3Jalg5TOFZfiUjZYBsqFZXwerXSglSveyU4ipN7bg6sUA0
         aGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050249; x=1792655049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B7xI8VJhb2pJN/Q4Bvj8qR4K039vHFMTqoT09DNVRZM=;
        b=V/zbkDr7fNLWi0cE4kwLn8qpS9dMUr1bKUiHqU08n/MI2a6Fj7AgMAQj7kDuE4/okk
         FLEEPh2HOrj70nal+dfLHTWbrSh6AGtB9Vi6pVOlH/Zh493GMcx6dtbGrbd65YW0YKxI
         jrWfs6hF4m4MtXAOyf/YkuJbTQpgylnbUauahGHS5ztHJzXICFvmc69o1ojTIWhTPjRf
         oqLCaINmPs2dsAAnhWmILrj5QwTbA7JXs/8ABM2I2klfZv8BcOTkddMZ4WQPRCwB9wyQ
         XLP0Ai8p8oO0raY9BQcYNzRwWapUHKCNfB6NNxbvyi93CSOhu1wN7JmrLyQJglGhi+/T
         nB+w==
X-Gm-Message-State: AFq9FYK9bKueG7zRipCGfm4VAm2PT5A9tYmVRNDt8EHlQhz4aLTSdo1u
	rs/Pk+Ori5x59+fdjXQCQnc0dhDG5IkNQdCYyFTM/tRbc0pC0ARJmRaK
X-Gm-Gg: AYBFou3tvEHpvqsz0bT2qc8pY0aTH1gUS0uqHMHu8IOcg30oXDvr0pRmqOP8kCRQuPK
	IeKQrcnGu6Hw/o3K72Cz2xtBsA0snuLTo6ROXCcOR4PKz47p9/qRR5Q2YJDM0QeozQAI2dID+RB
	AC7bk7WxPXa62cZ6nDuWKO5xW524iviYoEFmLkkKgesnyxFFiKtMNtiYW7ucGjB5gGZF9Szxpc/
	+VzI5XWIJW87RX6YWJc5OseDcAyUM1Vv9R1w/6nohc/b3+5N9Lm0Q2gW1XN2uqCIkCeQyui0x7t
	9bx1TQ8bQwWbaNttnG6rg8SN7OjkZehuxpCuxmYahRYBT90Bj13teoLd13G9eOHaQD8t6beGeo8
	ZilRm16jU7zCCA5iLo0Gj/764xllkKjXliOyr8fJmVMwxYSHb8ohKHpzF7JGcnSLkGy0UwjUV3C
	3RHDMMBjsPH711OPZ7j3KMqG65m++S0nIALAbdW+je0EhmQnrwp0xHDPy5BkpCGPwYU1YimSAq6
	TOJ+7XmtbQfuuQ/7HDjY7I=
X-Received: by 2002:a17:90b:4c4d:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3ac928a6be0mr1338382a91.33.1792050249095;
        Thu, 15 Oct 2026 00:44:09 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:07 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 0/2] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Thu, 15 Oct 2026 13:13:37 +0530
Message-ID: <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames, causing checksum
mismatches and -EIO.

Patch 1 extracts the response parsing into a dell_uart_bl_receive_data()
helper so it can be called again after resyncing.

Patch 2 adds the stray byte recovery: on checksum mismatch, drop the
byte at the first payload position, shift data down, and call the helper
again to re-fetch the checksum byte from the wire.

v1 -> v2:
  - Extract dell_uart_bl_receive_data() helper instead of using a
    for-loop with pass counter, call it again after resync (Ilpo)
  - Split into two patches: refactor + feature (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data()
    helper
  platform/x86: dell-uart-backlight: recover from stray EC response byte

 .../platform/x86/dell/dell-uart-backlight.c   | 63 ++++++++++++++-----
 1 file changed, 48 insertions(+), 15 deletions(-)

-- 
2.43.0

