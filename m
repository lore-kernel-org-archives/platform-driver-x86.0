Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9A394780
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 Apr 2026 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775042283; cv=none; b=LjZRlwi3BksbWtMiRltBQDVQSbm+4DTgydc8ZsBJEpE7RasimnwK8epjyFqn53bX5MZggKYWzsAWdlje/lrcVB+8lhpDyP/F73ArxvKmumk3/qICpRlQe9btQCxwMjycl6QrSuIx7oA3tLHzM3qY/feDCfXImACaRQy3jFKZFbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775042283; c=relaxed/simple;
	bh=+oTUsiMjJ3iqR5btEZSkGuDF570zzoOnPYd8loGIMu0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPK6fKfpJrFxZxQT7HnbgodkkqqC2c1qej7gEOJ/W5dAgiz7B6S8Fh25dxyz6jwQlVqgJM/CxBGcjUM9R7mtnD3W0/8KOyZcnuM7W4egbFIZegB/dskxjve7expjZRD9H6csDj5NhynNsHI7xDuWXrivoU2DouaUSijZiZ5rbhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ktw3M4DS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ktw3M4DS"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2530435a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775042282; x=1775647082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0P1osnyGEDoEI1bPxdELXCz3M6vQVZl8HdAvaHIMNI=;
        b=Ktw3M4DSIawJjgvF3v8PgE6D3jkgMKTfMTvTGOEgQw0G/Un/4UQjDDWjFANbcxjYSh
         TJ55O85CMYZkmdcVVMkDYUvbIMDIRjUc1NYQ2qDfDZSI4GNgkWywGWYJUI9GBFf5OtC2
         UJKnDXuKSiHvpi849XcPrcYTgAyBuEgLcc3TqgqAoyHUuZlD1hQ01IOLPjbHTfjEeGsY
         fYPdTluPCGHd+R1+92e/LzYl9ZdSlfYVoIPcNo2WOAnqV13GclXvldBT+QcIstNDhOZm
         EFi8/SLTd1KTV3Rq5OZTJOxtCCvp8gf87UZCEl3UTXB3+pTidq6Ws2DbTT2T3z7NcEC1
         nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042282; x=1775647082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0P1osnyGEDoEI1bPxdELXCz3M6vQVZl8HdAvaHIMNI=;
        b=kSWcimKx4BFgtxj9l/TuVMqORDiFPLmspXP/bDd7plJjHk5qj4Ww0xpk7V9kmLZ7R5
         Ck9AE/afhMFyVSgg7cyNgixNdXZpUkbj9aNJOaYdvSnNc47CNcx181zEnMB4Y2Mja1Hb
         YJLqbA5ROMIAbw8crtwPMuayvHShVek66qusRca0Vh7nirdaB1J0XhR+AhG4mhme4w7L
         euZT4X9Puzierf0pTZj2JaqYio71WZZISCDq6akXTsuUVyF0OOHUI9vXDuHvgu/ni+Do
         bQ1860CnprK9CzNXBWmGMcqZl6HysYqMUcF539bpThab5ABXKXHcuUZvZaaarnFm44J9
         /nIA==
X-Gm-Message-State: AOJu0Yy5VyUucfRrctO6E35HmSgrcxe6FOEqU1ZNoG6/EgzacbMeJjAF
	66+afbSUFMsC6N0tgfWFWYmxFv9upNiMCnPB6C1rsPVV6ubzgx7+RlmO
X-Gm-Gg: ATEYQzydnQKUZof7+gltj7mzeTgco9ZcoskKGs7PvZLbskt89XIQ5h5t1Abf9EUTMVx
	BhVuigAe2uJG4lQXPs2kJffG8/i4hunFc8d1CuKyCv2JxZqg3l6gxall88bkYhz6jMFwfAP/qil
	l4HCG3lT2qk2Pso/h5hSN/Guspfad9BDHOdIrF6BL3jVwnd+5i6+cDdcMKyJXkwVsal01ulrp+D
	AL7TlCLcGcbUCfuszKteSQmMAW0qEETgPBQmulQp5teKFB7TxSsjHzAu0Xlw8wqcEnaRBNNSgoJ
	iQDohzbnYiCHeO7AAovfMdc5/lu4KiI1JAOH+hHyW21E87Xq7UoljECT2iz0vH/4bcbuu6a7dsF
	1WiVUQFg2dudEJbYEYgA9+pr3d/9RNIBCFtQUTs2wzaGtYyAyQVajwv5EtTfDNeJ97Kr/1WN7Bn
	n/upjutuQDpEHYC+AeO6MvQs1NBEFQu/x2U055vFExd9DvQlhMox/l5anUe5AKv+btBVn3FIVQw
	fSGaddY3OC9i2VNwBkDYAJAcNLXRGM=
X-Received: by 2002:a17:90b:5868:b0:35b:96bb:47b9 with SMTP id 98e67ed59e1d1-35dc6f7aaf0mr2937871a91.19.1775042281679;
        Wed, 01 Apr 2026 04:18:01 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dcafd004fsm1889689a91.12.2026.04.01.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:18:01 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jakie101@proton.me,
	prasoon5050@outlook.com,
	absolute3d86@gmail.com
Subject: [PATCH 0/4] platform/x86: hp-wmi: Improve support for some HP boards
Date: Wed,  1 Apr 2026 16:47:44 +0530
Message-ID: <20260401111748.106970-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series improves support for some HP boards.

The first patch fixes an incorrect assumption in the fan table header
which leads to a parsing error and eventually failure to load the driver
in some devices.

The second patch adds support for board 8D87 by adding it to Victus S
list. Unlike other boards, here the EC does not expose platform profile
value, so EC readback is disabled.

The third patch adds support for board 8A44 by adding to Victus S list.

The fourth patch adds support for board 8C77 by adding to Victus S list.

Krishna Chomal (4):
  platform/x86: hp-wmi: fix fan table parsing
  platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
  platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
  platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)

 drivers/platform/x86/hp/hp-wmi.c | 74 +++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 10 deletions(-)

-- 
2.53.0

