Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C414307AD
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 22:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784674073; cv=none; b=BL5HmXEv0tuYy/ExHgxaREs3gLKfKVl43bk7tfe5sGZWWluqphIrXlOQipm5SfzR78QjDCB71gzaACBqFNvh4TuD3YMBzhzSr+DFFhvUfoHr+u0QCLLMHIQKbfbSytM2qQ5+AkjM/2TUiSNEGeIvhrevQJd07Y0Px47n0DtkEWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784674073; c=relaxed/simple;
	bh=ZJkPcjDKx62XIoj4FsVUX7izH81HNL67Bka7vuSk8no=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WSyO5nsKP0cxV3Ri/XJDebfuTOAwkJ47CI5pEupYf4YyYahZd0Ngn+nlImjfoCeNjNwsDH2o5v3b9s7Fb0JyWiyIFPvAagIoTkSvTb+sz0i7GHGS3AIdY055BliZ+CjqYBo82ZaEKBBndwuCtlFaxJU2Af5bYnTKFHDOuIwYfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oIm7rhlW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oIm7rhlW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955158f26aso22881625e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2026 15:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784674066; x=1785278866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=487cN5Oryb3DPXZe3NZpr9Mq5vHq/u24/jWuRAggv5A=;
        b=oIm7rhlWfVtUj2O4uzbX4QJonfK8Vx9AsX9iGvth/d12WzQGVwqGDAsl8LgiH3Y0Ks
         cNDZksZ32hFrXYEPgaEzywkSWH+r7GmILSe62GV0VxbCJk0cR7D2Uf6g/UpvTCnkJNXV
         LqBI6a5qVPPLe8Fgi8VDin3hUs/uZwS6ZcxTFrCE3YsJBHg4hDrHwXo26Kkmt1JXxKQe
         dXm+CxivG2w6C35cddrDp2GB3PAbgUj51DAH6csrTNVXEfOKa8kSCid2xxuYFWroM0iR
         uQ13cIM2sJfq0A87BGol1WBIUaykw+B2La5hCjBau4f5yRibQIP11NSK8ty1hNEBEcyL
         yDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784674066; x=1785278866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=487cN5Oryb3DPXZe3NZpr9Mq5vHq/u24/jWuRAggv5A=;
        b=lg1tGqwrx8Ql4wwotWX8hurqG47WcNBhrvIiWg1fGIGdIpO2pbU5gz3n0T487YODPt
         hO1n4HB9tWtknR6QBx51wZBhQDgjyEZa1rqEk0y62TVfrLZqig9o3dHnI8LZeqV1sK3g
         /6LY7vVkJJHH5qtwqMdd1TCNJXHhJJyf6fy63hIndLCCQLenqLihTIuBatzQzExO40Jg
         GQjCLTGbr3r6Gf6ThIiZX6rGSeE0JAnnkqtH3LymezogDt5mUYQ9xYPa63cerp8g9LBY
         ts4ccYGysWAgYSQj/rG3UbR0ksuQeCpPi0aM7dvFDCUnsecOBdVVQlt2PFsDVfZF0+JQ
         ykdw==
X-Gm-Message-State: AOJu0YykARv50FlHr9L3UNl7sqV/UVMktTll4Pqn2HOBsMxouD/KQUL7
	u1yAGFKNJKxkKM8fwHgrmtAjH6gZoFGXrQOQCL0vTeX5pC8dMcgLejMz
X-Gm-Gg: AfdE7cmt33mK3h4fmpQUUoOqF+0a6HP04CIgfXUaPK4z2Q9nXhWS93JadmI64TaU/Tb
	ck5XyvVdwuK/I0OwZhlEyTJ6Q06yo9VC7MJy24cqvEla91MeHSZl/TyqTlwF8EhQYKelveAzxTa
	HH69ZAPKYtkhSRlA8wNiKQnAfz1aEADm/ugT+oOnEsNUM6wSAZGbv+zZnOpksts5Qtbu6fcXUOG
	/YFVKulUBAWIpE1gT/h0RBvAqWvjTGIGBrWB0D/RQeQDMo2PVHPWbHV2t7fWTyQ6vEXIYdaJXml
	NH7D2ZBgTQ15VDpp2S6Tm2+LglIrLaVgb3F0WRPbd1nrCwuewayfju6OEYaLovdJUCCz7+SNNFP
	wD6pJHRt/hxSOORzCn5f4/iFarXsiBHXhAeVCNQf6Mhnd8uBuYtdfm/Px1xNi3EodQLdLxQD6FJ
	TffQ==
X-Received: by 2002:a05:600c:c84:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4954a3ed4bamr223939185e9.13.1784674066204;
        Tue, 21 Jul 2026 15:47:46 -0700 (PDT)
Received: from user ([154.176.96.113])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm212850f8f.31.2026.07.21.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:47:45 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: hp-wmi: Modernize driver API and perform_query()
Date: Wed, 22 Jul 2026 01:47:37 +0300
Message-ID: <20260721224741.33624-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

Refactor various parts of hp-wmi, including hp_wmi_perform_query() and
encode_outsize_for_pvsz(), to use newer APIs, resource cleanup
attributes, and bounds safety checks.

Patch 1 migrates the hp-wmi driver from the deprecated
wmi_evaluate_method() API to the modern wmidev_evaluate_method()
function by registering as a WMI driver.

Patch 2 refactors encode_outsize_for_pvsz() with a switch statement, adds
early ACPI return buffer length validation to prevent potential integer
underflow in hp_wmi_perform_query(), replaces kmalloc with kzalloc_flex
to zero memory, and use __free() macro to free variables.

yahia (2):
  hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
  hp-wmi: use modern cleanup and refactor allocation functions

 drivers/platform/x86/hp/hp-wmi.c | 100 +++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 33 deletions(-)

-- 
2.55.0

