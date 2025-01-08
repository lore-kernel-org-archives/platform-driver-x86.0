Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B09476;
	Wed,  8 Jan 2025 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325957; cv=none; b=uihXQIHfUgWU31hQxzq7HRxQoL2zAZfBcmqlIK0IZfJM/ipiI5S0VdG9zeKV2xQxnWGdBUXCxAxHv1YEQQMPs0wjEFIhg91RWpWH3lDI0ZmnAoIBM38WPO3JctVdN1OU2kgTVNIr6R0CCbvrqv3JHPwGkcqWmlywcu+HIfxx7po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325957; c=relaxed/simple;
	bh=ZUU4tCbX4EUULK86ZGKSQTG9qn8erScW+Sxi4TTokRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BfhQvmrZ8BDkZFPKxLI87n2H/k6di5lPJJxiiFWzi99x4KKEyzWpzZ6nFrQ/oXpxoEXgiTEh2g87fNk53NA+xS9/TTy6DTQQcIxub2WtD0I0/P9mwFZIcCJkPcSESvEAnTER+6Jrfi5pjpr1gohx/k4EWPcphqnGzNb6pO+0Kbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvFRli6l; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvFRli6l"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21649a7bcdcso235585665ad.1;
        Wed, 08 Jan 2025 00:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325955; x=1736930755; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SlFEUazc058JPyyfCIwv0H4BXWMuDsFcpTTxRgMlJhY=;
        b=kvFRli6l4m2CczLZHnFh9WM9rtcmyLDPIkkGQigcMx1R1NWLdYSDMyCUZ5s0aBy5cD
         LfsGfCj9t6yvFuXLC04gYUZV0OW0mQpG41Z2kg1WRX0AcRthTH2EnZNK7+SL2AM7urZ2
         zmqfNWfFgOI/iJBQELDB/jeSna0xKCJPkVIswTN6GO+8IJR20PhPfaxFQsnWylFB1Qgn
         Cit5ahaluL390j1tqP1lFifpeW3ssgerzD19BS9BhR3O/Ag5U+iooy7r33LI/n3LeFJz
         qs7LYHKaDc67OBCVSSI/Jdkciy+5H7+1rZYHoNAXZVlj315OZLtYbMk/+eyBGTbAlU7i
         PxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325955; x=1736930755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlFEUazc058JPyyfCIwv0H4BXWMuDsFcpTTxRgMlJhY=;
        b=JNGFv5EOjqUwBbpIOczpugtxb5U4u/KSo3lLcy/Gawh/Wuk5OqYdE9LZhNZgt3o+Li
         eCc7BwLSQQHuzcwLDlPREcbu4DSxSWQVHOU9V6ytTjH3iJ1+nSw9ZF58O2o7KzDkt35k
         xOB5LxbYio6A5CqwSCB3D7I1QjlivffJ2YK1H+4tyxPMvLi/l+uCvbtoFafY4zA5jnk9
         C7b3XrgfFsn7NKzI1Yod7fACGjuhx/UwyPghUHZGjUyfpONXcHg5NVBD1HxeuxcbO/sZ
         iwYQcfH4eUZ8UB/Q7iYIhXMNFyLDpUI9NYsdD55LZF5YdPdXl+O74MSZ2ncOQOq8Ske2
         bKOw==
X-Forwarded-Encrypted: i=1; AJvYcCUmrDQhy0n1zhZd45hhpe3qCG/47zTWDh4m+fI1dQpmzf11as3LzuI3h4oaX1nPUw4dgpj1yS1ukgU99YY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyswu4Jz0tKyGw1i2Qq3odGYQp3hzPrb9XecJTTANrBqJT0eFyy
	iqNWwDQUiER1//QSD+6W6orZ1G29rMXQONUQssQr8oQ+gA+ZBs08nABDF5oM3vo=
X-Gm-Gg: ASbGnct41FpDiNQ2lisHS8i+1xuazUGKc7mkh6G6PzQy0URsBB7X2B0FAWBT9ZFdW9z
	zMacLMxC62DmCOjoS0nVfm1UIDYXN7ldc3x1Xz8/IEYS4Prj9uIMqLLwy+Fm7CjwkyLZpw8Kx1a
	AoAjqW0kJmt5fK6qnVYML28fdPH2fAFjUvkp0+clIo8POI0V1Q01mHoebFr/w+yLtoSVaFsAAP/
	B102XnAC3rJwEpf9kW7sVtywOkjaUVlVUDJo1DFXQ7BipdfdVN4MoCVToBL3g==
X-Google-Smtp-Source: AGHT+IEjYDS7o6t7AimLtKiUMMnbuhi27/P6OvwyLUFay41lySYdAxoLignYJYwCn9klRo62wzM+nw==
X-Received: by 2002:a05:6a00:240f:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-72d2201be04mr2617650b3a.22.1736325955154;
        Wed, 08 Jan 2025 00:45:55 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:45:54 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Subject: [PATCH v3 0/5] platform/x86 acer-wmi: Improve platform profile
 handling
Date: Wed, 08 Jan 2025 14:15:22 +0530
Message-Id: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACI7fmcC/2WNQQ6CMBBFr0Jmbc20gIIr72GIqTiFSYA2LWk0p
 He3krhy+V7y398gkGcKcCk28BQ5sF0ylIcC+lEvAwl+ZgaFqkaJSrhJr8b6+e68NTyRML0k1Nq
 oFhHyzHky/NqTty7zyGG1/r0/RPW1v1j1H4tKoHjUjTxVZ9m0WF6HWfN07O0MXUrpA3gx5r2wA
 AAA
X-Change-ID: 20250102-platform_profile-fc1e0aaf2900
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=2033;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=ZUU4tCbX4EUULK86ZGKSQTG9qn8erScW+Sxi4TTokRc=;
 b=VWfGv8CSRWhMnd0LQKHajw1zAQL5F04FXoQTNmPISQzBbL2W3yYu48AXhCiaZ3pbGG3SMb6lM
 CbTqaJ4j0DJDjFdr03KSffl2PGS+/rIb2zrR9ABOdHtjWr5SpzWfhgs
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

This patch improves the platform profile handling for laptops using the
Acer Predator interface by making the following changes - 

1) Using WMI calls to fetch the current platform profile instead of
   directly accessing it from the EC. A new helper function is
   introduced for this purpose.
2) Simplifying the cycling of platform profiles by making use of
   platform_profile_cycle()
3) Using an ACPI bitmap to dynamically set platform_profile_choices to
   better reflect the supported profiles.

The last patch also adds support for the Acer Nitro AN515-58 by adding
it to the quirk list.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
v1->v2:
[1/3]
   - Fixed enum member alignment and reordered them

[2/3]
   - Made use of test_bit to check bitmap values
   - Replaced magic numbers with proper variables

Link to v1: https://lore.kernel.org/platform-driver-x86/20241231140442.10076-1-hridesh699@gmail.com/

v2->v3:
[1/5]
   - Removed a line which was supposed to be in another patch

[3/5] 
   - Moved checking of max performance profile to [4/5]
   - Restored code in profile_set which updates last_non_turbo_profile

Moved the supported profiles patch closer to the end of the series

Link to v2: https://lore.kernel.org/r/20250104-platform_profile-v2-0-b58164718903@gmail.com

---
Hridesh MG (5):
      platform/x86: acer-wmi: use WMI calls for platform profile handling
      platform/x86: acer-wmi: use new helper function for setting overclocks
      platform/x86: acer-wmi: simplify platform profile cycling
      platform/x86: acer-wmi: use an ACPI bitmap to set the platform profile choices
      platform/x86: acer-wmi: add support for Acer Nitro AN515-58

 drivers/platform/x86/acer-wmi.c | 301 +++++++++++++++++++++++++---------------
 1 file changed, 188 insertions(+), 113 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250102-platform_profile-fc1e0aaf2900

Best regards,
-- 
Hridesh MG <hridesh699@gmail.com>

