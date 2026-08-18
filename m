Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9547DD69
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 19:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080309; cv=none; b=uqNB64e+ZkJMU8bLmemTLVeLzBo0siaxgSsgDNGU40E3NbEHGjbeO0GPhv7AZd/am5jluaQ6vyv4Ot0BAhC5LtHdvJvPkDxHZ8dS1DIXS/Kyia+f2IvZRXwSuqh6JHnN2t/H5F1+aDo+ofbFBqUqfv+HpmGKxe7YhhnzExRVODs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080309; c=relaxed/simple;
	bh=ule8uQVSZjN9SPPiWy3GFwV3RocTGH0iwCj1Srick0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OWV6Z64nnZkDrXHbTW28pf+gb/QC6V7GVhlfeY6lyDzwT9OKpO1geUnizccdmrZ6WcJQ2/69fb9zM8n0HkbO8kuQa1fz7zhPV0sj/eZfNTNj/KCA1GhEO7HD73GNp03LfFo0Nf5k1SlnGthzK34X7moCkTad6YR/GujaXSmudUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myKX29Bg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myKX29Bg"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso370664a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787080306; x=1787685106; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBjTtOnXKHIl2x358G0aMOpF37tP5HHwZIxgH1uzThI=;
        b=myKX29BgKbqeVFArR+Ck0DDhnzsEzl1tfEvey3CzFrZywS1/GfaK9yFm/zGe96r+9p
         t/vMmEHON2LD8uUWU+Nb2zFUHMzDVvQc5C/ibjuK1z/mu9Wguu+xxLm2kut4LMom7rqN
         wcquF2lLNNG8IS+H0/5U9KFraOq1ugqvMoNLyeKldt4EvKD8yepmYYsxomGq553N+scx
         cq9pVhwoyqse82YDlKoTRbvU1x9wQRCKPfZ6/OwE1gRLgmOke051IBehv+SIc2W+C0MY
         jFZSh75w6eTJcL95GVRvHO5k+W7E0SuCDmS2wfmmNHs7kJB7IQcBcI3bA8/YOsHYuqHC
         Wtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080306; x=1787685106;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NBjTtOnXKHIl2x358G0aMOpF37tP5HHwZIxgH1uzThI=;
        b=aGrfBOtmwRrvQKaYUU0/YlPhCI5mSea+tFqrcYiMB/FgYRzLGqe9Kr1ukmCdOL5w3c
         zShtGlZpIMxZhjyou2QN4d0B/RvibNfefrpOoXeIOMrb6BbPP9ehYcighbKj8nvWZaZN
         Fe/5Sl8igK72MPqkbMocsyvrcczxtJ28Q71FeKjSzDc94yZrupUgvWbLKh1eB9LW43Ns
         KnpEXNvsEvSdQGCtfeppS4d9k4UeMRxQ7zW+Pkc8enK7u20hkxY8Nd9Oogvx88Qk19pD
         3EVYssla1+7AANER9gsseQcW3mdQ69UuEL11hSLcUPXI3G9aGyR4up7R1D+53jZ6IvvP
         4/5A==
X-Gm-Message-State: AOJu0YzWb64mlaUyY/jFCItzk4SOdINQzcFZQrv2guaYwzz4ScXHTeOu
	6h78Y8RiBbUQOWKZ34v9TO+Yjfw31IpBAzPAXCkfIMxGfErplfLJ59J2aurW7icM9RVEjw==
X-Gm-Gg: AR+sD10WOIyM0yAMpLLr6hbyqFh//zz9Ulhhk1gukxWu++omEP8aNgkLpVd/7+u9GTr
	sq0uVB/e/unICgB2aG98PWnHYsFQOrRaWK5OHKjP91R1mEuNG0ZXIrIb7pFZ6WAuX8eX+h8gu86
	8emxl4JwZfVy0qa2Yuf8BoLLKklh9v4/Uij0dfq3NOnDWltlTmJFkfPphxAL/ihzZJMxArFJ4li
	mS/YH+QZ7U4G5JMYq6GpJgvkOEbaLFszFv1T5Va4X6Ki4w9nFtv9D9ytwkArFrxzdi3x2tVA/nj
	p5XzZ6MYWqmtm7+m9XNKMLBqwoOUDCz/C3Mh7U0ycqFaayyiJRlMjNJNbQf0yhMSOpOGiO88ncF
	p08Kg9y0Q5zdwnVyc2urUMl4vz6RnBtmCujzNAifr/XZRzikzOY1YqcYhway9blKiFbAHtP7j3q
	v+6H/8LQ+KqN0my2y0apejKjvnN64KzexpxGhwlWB2ytk2/yyCAz9kPg6c/9bIZyapq8SmXCXyL
	j1tTxiFcDMum/bpaa/5Eg==
X-Received: by 2002:a05:6402:2310:b0:6a0:a644:355e with SMTP id 4fb4d7f45d1cf-6a3fb7191c9mr119441a12.2.1787080306275;
        Tue, 18 Aug 2026 12:11:46 -0700 (PDT)
Received: from fedora ([2a00:7c80:0:3b5::11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8531694sm2291552a12.11.2026.08.18.12.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:11:45 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 0/2] platform/x86: hp-bioscfg: fix empty auth token overflow and clean up audit log loop
Date: Wed, 19 Aug 2026 00:11:06 +0500
Message-ID: <20260818191120.38556-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

This is v3 for the remaining two patches (patches 4 and 5) from the v2
series [2], addressing your review feedback:

- Patch 1/2 (was patch 4 in v2): Remove the special-case "if (!authlen)"
  return entirely in hp_calculate_security_buffer(). The generic
  calculation already naturally yields 20 bytes for empty strings,
  eliminating duplicate logic and fixing the 16-byte heap overflow
  (reported earlier by Josh Snyder [3]).

- Patch 2/2 (was patch 5 in v2): Remove the dead inner bounds check in
  audit_log_entries_show() since "count * LOG_ENTRY_SIZE > PAGE_SIZE" is
  already checked prior to entering the loop, and clean up the redundant
  "else" block after "break".

Changes in v3:
  - Patch 1/2: Remove the "if (!authlen)" check completely instead of
    adjusting the formula, avoiding code duplication as suggested by
    Ilpo Järvinen.
  - Patch 2/2: Remove the dead loop check and the redundant else block
    instead of adjusting loop boundary math.

Changes in v2:
  - Squashed v1 patches 9-13 into a single patch (applied in
    review-ilpo-next).

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [2]
Link: https://lore.kernel.org/r/20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com [3]

Muhammad Bilal (2):
  platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth
    token
  platform/x86: hp-bioscfg: remove dead bounds check in
    audit_log_entries_show

 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c    | 4 ----
 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c | 9 +++------
 2 files changed, 3 insertions(+), 10 deletions(-)

-- 
2.43.0
