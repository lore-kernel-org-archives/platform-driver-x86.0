Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE19305E05
	for <platform-driver-x86@vger.kernel.org>; Thu,  6 Nov 2025 21:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762464087; cv=none; b=tuTg8KWpnrAki4i6VDHEDXy5aMqB7zl01LAHIcqylqlXSYLVVSKwcha62pJgooQHQv7W1GO19CasZ0zUKTWmjxt8P+H/9bqYB5TyZmuE8XdGbZXcCpCFU2XHvyWIg9x/b1e7kGAjH+haZe7MR0DjCMhiauDvFQirq1D6W/3CL/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762464087; c=relaxed/simple;
	bh=jSzKWqr0vfaMJTVkCWGxYqps9AjxQj1t7eU9pBBZbAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ksh2m5V6Q7k1iHtH9gEuXeqS8KD7NN0ByLyvWJXpGFWXkxae0Jy9g0i3EI9/hD2+1U6COHJ+WZ17ieLRAhKiagtdOTXmSo+fTkgHZ5QE7HDq8Ypsrs2voRhXzsbnV5ph/K7xK1lbGcFEtCa4pxTc2Hy0h8mt0Gy9NJCYnth5yc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4hd8ZyC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4hd8ZyC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b0246b27b2so111555b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Nov 2025 13:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762464085; x=1763068885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5F887MQIF+aT57M0ZWlF9T7zoNXNuCnKmSum8jew75k=;
        b=O4hd8ZyCBpv86GEBKRQF3buQzp6KgAzCSdb8G0lkN2d5LN5/AqWtTLlGyNzihs/gYL
         fLtMwjfI2+KoYhtP2EuqGCl1hbIWB0kYy4wh60slKN4D5OJpEWUQazGfyHsAu4sNG2h7
         ndBee39oXwY7bdCr/mzNx3oSsVSOHRYyK9svdancJgbxm7ivnfnjMYz6XDKRh1i4HO9J
         627pQf1RjO8gU85k+OuF2n3hbXPfArJL9v2QEPhj1xR65iAHNthsCylmX9rz9JSy72ch
         W92GZmDZn/hUJZ5NS0keYwGpQPqXyQms2oy40VJF8eArfbgv3ZApmBc/ghY6FWd756Yb
         XVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762464085; x=1763068885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5F887MQIF+aT57M0ZWlF9T7zoNXNuCnKmSum8jew75k=;
        b=sUDejy8Z78GX48iY0EBPBzutLcHo4f8HcM1W+B9bbEFXkIk7E2UfnqH4tG7PBRqNl8
         Ubu01U9n7l9elAbefDaQSUbjxTgf426ko5eRvQFhG+yCpmicduaHlRH16gzD6jHQvih4
         hH7D7EsFChFR9GIrg34G0l8VxH5C3LyJFB9a38j++2G/l7jbrfZLQtd/X6j686Pau5tT
         bh29PBCVZWxvmIhPinqZzPolMlONs/wDIcJ75O7uFL3QitLtWclvJTlRshIt3jQb9H2Y
         sAvrkOo3lGoUEMiSR8DncNgxcTRpJhaVjV5oBfcdqzYAHH7vp5h2DEwITIgFGq8Ctb/C
         EYdg==
X-Forwarded-Encrypted: i=1; AJvYcCUJugY9OYT53N/v1Vn3vQ4I+7GcfOvafPJrxvu2V9P9gIAN8ZzbdWWvxY2kpx3+39iiqYCPg01mo9wtWZCMD+SfLkUi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1ST+3hTgYISDhM9DjSSoNFNubipMsf4lalo+g+mNZ2TW9XOEs
	FevLSOkjkWw6bIRiLjpskWPGpCNIjGcwvwy16an4Cz5T+zrR32c3FPTG
X-Gm-Gg: ASbGncvGEGZ0937wmbMooPfjSQvyHciCRu1GlSlWHtXRKb4dO+z4jFc4n9MT5sJWgwQ
	uns6CAYXco/FAuZfaiHHno2itLIKG1Cejxa+IHfRZkZUbhyVT50KU8lF91sSi1FXxTpHuZR9iha
	GmD2E04sfbt6gowqXwamUs/Y3554WUqIV//ji3s+qBm4Tw4Ur2LBLzpmK+/DT6qD6XOnKiZmUxx
	1+IxjNuuXAjSMdvoSVjuJPqtJilCbeyDug8Ci9WTkZqKNMHDlIBoD19Ap0FZ+vi1vV06nRvU8md
	Us8v4kjfKTpZc/NvrX3pKa9CEtT52uSIvAUrREl3d5fahzFNvQsJKk6SHWtNMcBOO2B1GvNXBcl
	7UuYgnLbgW5IqdQUmW3nrDHk/KY0mn6UabVGi/RcOBoL7BcFavLCwgP3br7GYBRdmNm1CGR2Xdi
	rGCMIDTTneCoi2eaYA/YwlkpRPyLi8Uimj9VaPl1qugq9ePFoVN+vuPfYxNZOnUU5KoLc=
X-Google-Smtp-Source: AGHT+IGb5UU5LqOK9HNMDNWz+iA8UN/wT17BrzGBhaqUQJYwDSTtl1qRtQDwyVjhhL17NR6GPPqc/g==
X-Received: by 2002:aa7:88d0:0:b0:7aa:9e4d:b693 with SMTP id d2e1a72fcca58-7b0bd1bbf07mr1358378b3a.17.1762464084662;
        Thu, 06 Nov 2025 13:21:24 -0800 (PST)
Received: from bliptop (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953d0a6sm521360b3a.12.2025.11.06.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 13:21:24 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Len Brown <lenb@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mario Limonciello <superm1@kernel.org>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/3] Add extreme platform profile
Date: Thu,  6 Nov 2025 13:21:18 -0800
Message-ID: <20251106212121.447030-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a new "extreme" platform profile mode and uses it for
the lenovo-wmi-gamezone driver. It also adds the Lenovo Legion Go 2
to the extreme mode quirks table.

On some Lenovo Legion devices there is a thermal mode called extreme
that corresponds to setting ppt/spl vlaues to the maximum achievable by
the cooling solution. This correlates strongly with an overall power draw
that exceeds the DC power draw capability of the internal battery. This
mode being mapped to performance when extreme mode is detected as
supported, with the actual performance mode being set to
balanced-performance, has led to some misinformation being promulgated
that performance is always a bad setting in Linux for these devices.
There is also some confusion that the mode labeled performance in
userspace, which corresponds to a red LED in Windows, shows as purple
when set using the hardware extreme mode.

I'll also note that as the hard TDP limits are refreshed when on AC or DC
by the ACPI notifier of lenovo-wmi-other method driver, no special handling
of the battery is needed for safety limiting extreme mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v2:
 - Drop patch 3/3, keep extreme mode quirks table
 - Add Legion Go 2 to quirks table
 - Fix nits from Mario
v1:
https://lore.kernel.org/platform-driver-x86/20251026081240.997038-1-derekjohn.clark@gmail.com/

Derek J. Clark (3):
  acpi: platform_profile - Add Extreme profile option
  platform/x86: lenovo-wmi-gamezone Use Extreme vice
    balanced-performance
  platform/x86: wmi-gamezone: Add Legion Go 2 Quirks

 .../ABI/testing/sysfs-class-platform-profile  |  2 ++
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 29 +++++++--------
 drivers/acpi/platform_profile.c               |  1 +
 drivers/platform/x86/lenovo/wmi-gamezone.c    | 35 +++++++++++--------
 include/linux/platform_profile.h              |  1 +
 5 files changed, 38 insertions(+), 30 deletions(-)

-- 
2.51.1

