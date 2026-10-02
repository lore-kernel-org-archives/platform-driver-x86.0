Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75273DDDB1
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 19:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968497; cv=none; b=X0Vd19ylxTBLbLzdHvQY37oiDl6h8NaqQ9TYAp50zdwnmJnQJNIsfoPGQiqhQCXVLSI5eci3MkVxD8BrqkdCSzdABFQh4nd47iKF+jousShId0oGmwU4f0h3ReN3wjeLxEQFFAsQq1puA4VMsUTbaVkf7aiomwN0QuHIiQXlkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968497; c=relaxed/simple;
	bh=eHsLpEW3L5my6AzeGFTT3RBfCv34bN1BS8YV5Ip/vaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bh33pPvwAHiYuHySFpek4XI9Xh+f5CR7cfl4w5/RM8zhU9iCIN3w0HBGbVTlog/IJSWc3iA6usYxKFxYeWPydnaK1/caEal80kKN3YToTOJotuD1gOU4eKJ3ENAk9/O3v7MDSFMVXIlybm63xUy3d4HstVGfwa768QuDC9mJb8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1uzrkb4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1uzrkb4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49fff72474fso1406855e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 12:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790968494; x=1791573294; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yXT1p1XHemTBGXdiXf7n1rJKfg3H1kTVdAIHj2f2cLA=;
        b=B1uzrkb4Mj7fp+f+ubsIitDaGp1YTrxCxh502YfO/1vrNySD3e5NvYrD2t/5YNQDHV
         aa0o9td/rNSeCOHsXpcZpdGHOq9TEyeWWli29RwILGDUgED8H7p9mDAqqLVvEYORb+TV
         Hu03exdVpL8SVgOFpnQ2r6EdbCivu4NmjtLbtN7brt/p8SCLTL5TJyZ5ygqtbYITZvXT
         tmZdzlgiYvBvlyFkNlIdybSNEVTN77AQduJz3Elia7LC+TLKCpoxAxjvX08Kime3YgsU
         HCODmIr2hy1sbs8cOuK847zXmd7pUxRunftuEXzu037r60jhF4YmR3UGqip8lDF7BkN3
         zYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790968494; x=1791573294;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yXT1p1XHemTBGXdiXf7n1rJKfg3H1kTVdAIHj2f2cLA=;
        b=AOlyBr4SyvC9C9IHSbDOEgUESuupMus9ondq8Aqfnf3n0g2XfahW4VIAsGyMPIXwCR
         ZfS/5KorhgMNr1PF8dichhPiShgpBAfbHkIaEm+JiQUjQbFIjzsaW6x+fK9G214kwwkn
         1MJepnZOyahEK2pdfughVss+v2GKRKnrmuJCxQg5nqvWTPEojAqmjoxhUPjXbHPaIVhF
         HY8kazsleYa5caEqaiBHOtlaLdkRjVo8LgY3hW8abJ3xM9aNeVRlIQTfPVfDxhb2ut0V
         A+uf+aIOxJIl6DHu40YbjczIsUsGcJfmnqsdeAiF7eL9UT144IbkEoJ0vD7gleJhq/Zu
         Z0VA==
X-Forwarded-Encrypted: i=1; AKwUvBxJPR51sBlYb+leLtz4IZZUiWjfrR5fmm3Qu/9+eyLrWHUCQPbQjORaQwJdkE2Z7G2lG85mIxiTuC7qv/Y/mSfvOs1P@vger.kernel.org
X-Gm-Message-State: AFuF++lCk71Xs4wz/PgTQgLjG3rK4SiNVWPhYEIK8eQP+WV0NUy0ni9B
	IrSpqUv4z0hhk20zhxBUd6q1rc4CURNGpwMT9Fiek62KQCkBQqONHjMl
X-Gm-Gg: AYBFou1DdwBiuy+jHSGaKCWeRYx+hcCFPXBmplhrDu9rkf6V92pX/GTg9v2PeM1Zlw8
	c1wjzMrH0GFHREST7POqgRzPdDuc4fnDYxLMGwAxS7tBElf7+0lHVoCnntfQ7Hnq4RciEVhK/Kw
	GZ7ZfQbpAFF1FsTQm5HAPPjNuXhb3HxQMVYJ7etNyXWeGJtSiAl4yWW2Qb0txF0eLLuGVUw6TaM
	5+u5jia0n82lLtaIIucplRo90fQwIF4tXJOp9fPOQhtA1mAFgjuUryo3lbU2asMt3bACtHSETtC
	zJD3pJz4AOAI0p7+yKloC7fuk7EGIFgnWaLWWsChoFBthtd8oqyFrxDvhm/N0iZU4nENXPyOgPG
	4Idl1jKdSZi0DeFSYU50SNR73Hpzhlg+MCxPW+mz5ir9nbZaSIMgdXs/BMJ5rOf8mF288fqyC1f
	34YpklDCcUaMv4sWpr5HM2QStSAlvD6epRw9tqA/tkrW31Fv81i++bRWV1zIl+d4/Ilv5WDV2LO
	+03S41pn/xOpgIP5N2SW0nDcRwxjOZVKpd9lVTP/QDMIwmWpdqw
X-Received: by 2002:a05:600c:4ecf:b0:49f:ce78:3567 with SMTP id 5b1f17b1804b1-4a02769ceefmr68921655e9.24.1790968493618;
        Fri, 02 Oct 2026 12:14:53 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0e1afbc44sm81151145e9.4.2026.10.02.12.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 12:14:53 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v4 0/9] platform/x86: hp-bioscfg: buffer handling fixes
Date: Sat,  3 Oct 2026 00:14:25 +0500
Message-ID: <20261002191434.58529-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Buffer handling fixes for hp-bioscfg.

Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
handling, 6 the sysfs store paths, 7-9 SPM and integer parsing.

Changes in v4:
 - Add patches 4-9

Changes in v3:
 - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
   and declarations (Andy)
 - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
 - Drop a blank line in the declarations in patch 1 (Andy)

Changes in v2:
 - Split the hp_get_string_from_buffer() fix in two (Ilpo)
 - Drop the lib/string_helpers patch, use @only of string_escape_mem()
   instead (Andy)
 - Add patch 3

Muhammad Bilal (9):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
  platform/x86: hp-bioscfg: allow clearing current_password
  platform/x86: hp-bioscfg: fix off-by-one in password length check
  platform/x86: hp-bioscfg: fix heap OOB with embedded NUL in store
    paths
  platform/x86: hp-bioscfg: validate SPM state returned by firmware
  platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
  platform/x86: hp-bioscfg: fix oops on short integer attribute buffer

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  2 +-
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 20 +++--
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  8 +-
 5 files changed, 51 insertions(+), 65 deletions(-)

-- 
2.43.0

