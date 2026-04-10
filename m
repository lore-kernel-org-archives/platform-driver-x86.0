Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D42333A70F
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 19:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848253; cv=none; b=bgUS8qGAZg/E80wS1GPwrSuf9S9jjODh8cRVU5qRKUASnGTL/pVTi1vJUhdOg3tiRvm+KJK0/7hN0r2ZcWhfdfNAInjK0T4WTxopjXLP4uiWuj6iquaa5Wul4B9FOG2IHT3cXWi1T4Qts7s0+stZhbrBPQzxBEBSWBdh9wqfTi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848253; c=relaxed/simple;
	bh=ctdmocaRM5JFqgc4+N4OccZrWh7kLpFri1DOurgN1Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O1XCbBimqVCb9W34bgM3mTOF2w3Eem47B2JR3LCW5p4lZkBwKXFynwxBy5KYZNrQb9Lh/ZTQKBjTAugj+Sco+hNRhwkeRmsmniC0FgxD/eugqjVnP9CXhfp3icxc4xSE8Q5+LCvXrbXx5FaRqkTcqZAC0YkmKIk2n9gPfOU0kPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJOco2IZ; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJOco2IZ"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82c20b9fb15so1287466b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 12:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775848252; x=1776453052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8u0tpZmQ2BZyhityjf/BJYX5tB/dkPqNVh54tnjtbs=;
        b=RJOco2IZ8g9wkj3L0gEXbCqY0mKmb9/DiXsb4Lo3j4HvwowCkapRihqRHo5KaxYOu1
         AOUpL9WHD/a7CYPRxRmSYIBAag/MJ//S8dbiKyVhtdkwfND+6O06oykw4nLGW2+iDXb2
         kQn72pBhAefhnaBWFTTRyfc3wpZFn15UyoiJOTwPJykltNGSsul/8gFwNR/QAj+7V215
         vFCTF+jgkp5Pf9hZYcBtC6U+Q5s152q7zPz8KL3niYIYMsCVeM+t3IMAvkNdx8q2uUuP
         Ackb3qolcYvNCn97FG9INQ9PTARWG0pxy1YD66yAaCyEGf3jdblMFVEnYwZYrtSAHDRQ
         DD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848252; x=1776453052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8u0tpZmQ2BZyhityjf/BJYX5tB/dkPqNVh54tnjtbs=;
        b=FoRzaBO0N0vvTCJxu2F7FyybRxWfjGmS0u7jayF/VigVUVp1Vu003ESOhYZXkVXZgI
         qw340rTuIVzGptzFPCASzpkXt6s5iAnRpOi3ZO2Kk/UKpbJ9BtgZR8wS+4AejUDbUyZL
         bBQaGjk+XqYgLRfyNWNXLDysi8l3apSYKUfKt6jxrJNHuBPPZbj6PmPDHnfLTBVawp1e
         MjXLyyyFOvFh7B1SNezxdERbObh68h6pNtVnBZv+mCaLXHceajcBi+CjMP50ZIX19VcA
         naToWD4DO9n1tbZY5CkGu3p+kswpoj1J2ZicHfIR4dCKLm/utn2zECotv4DCDgErsxim
         NoJw==
X-Gm-Message-State: AOJu0Yy2lJRuMTixJ4t7Bomn8dkT12jfd9AXkf0XrLuuXmvU0hJnQGem
	ZyEyQmHNvV6y3pl9z3Bi83SiUTQk+FH1Gnnl97nQN59htZgc+rBIpQ4lC66kzg==
X-Gm-Gg: AeBDieta5lc+dGBOWRMXlvndSM/HqlEIXFjU7FN8H8Mn3ZAlAW6hz/IEXg9hovNOO/3
	ja8AQ24NIGH+qZx3t4FmLopwfuOjJSRigIZET/H4CR1qZB0375RNlAjSiXqc21bjwSfvVIrM4Ne
	KtHI6n/+AMVJcjvS5rZjBcTNBrLrqMGNE2+xuA8tJJENoQplxZLRroAcx6gvxzZogM6LShMOf1M
	To8svjzvgjaqj4o6Y7ZGQow9MJMealiZxIskFefBipy9WFF+0RVmHy9Y4r0he2PyQVQbVSe/ogv
	AboUvfZs6dP/OkFBcZ6QG/VZsLzljJk3AjiFxKeziOo2TiMOX4/SHR30ctVBbs3XzxgtHlyYyc3
	5qbYEJD8/PpSfmhWduTzblT4V97oh1bKqh2oE92QyVlJ0SSetgIvROSUaQduzTqZXQG6l10HEjK
	373VhERoo0oyKQb1lKTnTAMUbwmVVrZmX2IGA73x7D3QFhOLE4/K8U6t7++FTH0XL8lGots+j89
	tNdI7xSQrcJFP8lm19T
X-Received: by 2002:a05:6a00:3a1d:b0:81f:5238:5560 with SMTP id d2e1a72fcca58-82f0c27e606mr4501721b3a.13.1775848251776;
        Fri, 10 Apr 2026 12:10:51 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm3400739b3a.55.2026.04.10.12.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:10:51 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jakie101@proton.me,
	prasoon5050@outlook.com,
	absolute3d86@gmail.com
Subject: [PATCH v2 0/4] platform/x86: hp-wmi: Improve support for some HP boards
Date: Sat, 11 Apr 2026 00:40:35 +0530
Message-ID: <20260410191039.125659-1-krishna.chomal108@gmail.com>
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

Changes in v2:
- Rebased on review-ilpo-next for easier merging.
- No functional changes.

Krishna Chomal (4):
  platform/x86: hp-wmi: fix fan table parsing
  platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8D87)
  platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
  platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)

 drivers/platform/x86/hp/hp-wmi.c | 67 +++++++++++++++++++++++++++-----
 1 file changed, 57 insertions(+), 10 deletions(-)

-- 
2.53.0

