Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97FA1339A4;
	Sat, 21 Dec 2024 06:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734760833; cv=none; b=RfM2Uh+EpycRBvlCjQX56nIOOM64pdlJL9dkacKef1JQND6i8abJ3xQbYmx3XRAcdfVovCvFQxD1tQ4j4cdb+qebg+xHf7GAvQfUvxCE6k4jOvgEXk8/AWXCIAKC+zatgm+CpWCa/Jq0zyT+KzHQ7g+9kgm9kpAelUW3i3KdB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734760833; c=relaxed/simple;
	bh=zLPKxOlAI21p5WIQ9JT49JD0QdiKfToAL02o0UZK9nE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/l7xv5Ordl7EtEJ6htGX15nvQawSl1dymOY+MjydYG26Vc/bB0DWaIP4MeYfvftN07SpcvCedDObIezLF2wiHNFWFhFcIC8KBBl0VFTzcBPwtiHrSTHROq40hHpIW0BvvK7JBZ+iLvyNdc0fPI4wr9z5qNfP2RYHHgd8YkxBYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPlkLfTl; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPlkLfTl"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6eff5f99de4so22884987b3.1;
        Fri, 20 Dec 2024 22:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734760830; x=1735365630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G/6Fu5kwIqTD/F9OQau8gJqzRjheJ0dK8d8lE4LCvKs=;
        b=fPlkLfTla0ppy4SKaZLxcOOceCKN0Hoyst4r8u0pBxP9k5dkjQzwlfPaiy18XapBYn
         VoKU6/jL257AIBXgv0taB/xkmTOsEQ3/ZlW7+xiWG0/3SItWbqDYLzCkFtZDrQRyc1MT
         AfcQTDA/RLTRH4dMlU2EJck+ryzq+RA94dQviKQrglcXfRh/MCzwWG+5h2A9mByCM6jp
         K9lCIOP9dpO6I3GpaCf6P+RyCq1ClicDPI8pUCZy5JliK5FMJVTdfAe7VL5CP1Niv70R
         QartpRDA3iFU1KxlOqkEb38NNY+N9W5Wm7BuwtgsirmDu62Ia9siCwJjc4qcDJK5lxMv
         Y3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734760830; x=1735365630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G/6Fu5kwIqTD/F9OQau8gJqzRjheJ0dK8d8lE4LCvKs=;
        b=ORKiKC1fwDIP7t6kPqwA1xiHDR+ffzFj90dHX78vOsZ80l+h3eg3SY0HE5ZZl+RlTs
         h0Uy9fPXEd6Jj3hBxEqF5R65iYI2H8K9EIkYtQBIPSUl5lXDkLEUT0zONrSVjYVlEMg7
         inL2q8VtHqBL+XOV2/EEynZ22+lyYF71tZcNKhCe1UAzZZrq3HCKBRwsHqd5sgn9I0uM
         2WVbtoTh/LauuGDmldc1Fh/4hw9o5OHssQv6HxLgpo49BV33l7rFc+8UT1dPlEfDIMZV
         AAbyELNVcdwwdeE3kLlRHkSb+mff5UWMmKtDp3pevxDYxbZjfxGQrNPmKa0fFuYuxKwQ
         G3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVr66wzs4aOyNBuOMHG8hqMc2xKVeHKy0lWt1HmJiyzTAvRzhTDNrjRrMFwojCfGeJqrjtWCnJwb6iM6oI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOKwLFzF50dRe62ziN+jPnvnHmfMeTUS5SMFmpTETHFAX+2jjg
	Gdht0ELok3uP5fxCSbl72kAHljkajfDF9MJ7SSC4ghCXiigy9M5/5BHEyw==
X-Gm-Gg: ASbGncs+3Y8fqPbOIsEAqi3PIIFGZrwqrzMc4+NRVtqmIEoAJHTPpKY+bVeQU1R7PuE
	NXmSGYttEP9XgpDFQM2xfoag+N4BnSz/IlhieTcgETfaEhdk6xgLMiNZ/6UoU2Mb2duWXIkYul4
	X8Z986u6Rlq0eGie4q1zvlIyKYpv+wiFmy1qn/XC6icSRca56zEuOWWGtM44dRG40GtG/nQBIeg
	1omt0u0H8f8otsBI8YbW3/VwIIvk2MHOyaeY6QaNBX0K35Zd8ex0QAFNgmIgOpO
X-Google-Smtp-Source: AGHT+IECVUni8W1czdmslGXHGsZRuA9zcq/zi9/kmzZY2MEstg1jl8xgIhZ4e8Th/F/r8fwv5iF/Vw==
X-Received: by 2002:a05:690c:dd2:b0:6ef:90a7:16ce with SMTP id 00721157ae682-6f3f823c74emr37157667b3.42.1734760830253;
        Fri, 20 Dec 2024 22:00:30 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e783ab9dsm12164077b3.119.2024.12.20.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 22:00:29 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	mario.limonciello@amd.com,
	w_armin@gmx.de,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 14/20] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Sat, 21 Dec 2024 00:59:11 -0500
Message-ID: <20241221055917.10555-15-kuurtb@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241221055917.10555-1-kuurtb@gmail.com>
References: <20241221055917.10555-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell has been inactive in its maintainership role of this driver since
around 2021. Due to this, add myself as a maintainer.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3809931b9240..596c6a46478c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -784,10 +784,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
 F:	drivers/perf/alibaba_uncore_drw_pmu.c
 
 ALIENWARE WMI DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi.c
+F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
-- 
2.47.1

