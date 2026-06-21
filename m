Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF70242910
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 13:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782050272; cv=none; b=YPfqI5JH4yBHuh9xBPkDmWY7gm/AOfRZtODJiHFQ6/gRrDC5jmntHhyb3zN+W78i/dZze+LgpY1CJtVW5YeFPB3W2T2+Qe5q+IiKryAS0M8Fymdhsgc7Y9mjHVL36g4q3KBiOLPdY2dn7/oI8+Xn+yU3YeO/cwFkAFJKsarWb+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782050272; c=relaxed/simple;
	bh=ymDRfByPMCiQkRoxFtnzuDqc4mvz8poEB+CcmhtMY2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTpHmbDopvy8V/5u71717o8JWLpDoEvFJXDFfPoOTTpEiRRa34wlJZXdb6+oxvJTlLDgwNIO6+0EGSYHKxPx0zkmeYgEasnZnkkOgNeIkpGzdVmRKSu87CONGCiHkLvdQIW0wHNVsPcEf2VpMU/eJo3AiVbZX0D1t1U0mHALQiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCqCfgbW; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCqCfgbW"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-9157d3f2098so400036385a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Jun 2026 06:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782050270; x=1782655070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGTkHvZxIlm4/NIaLgam/W1cvCG7uAwPxu+hLpy70Q4=;
        b=jCqCfgbWnEUnVL7D8anzSU1GbjI+0+Lsm/F/jCn+7f9HXead0VDvFpiLT8QstSVEDU
         JDChuazrjY9IFzqMFqGjRyUGtkRLIBLavI43smMNjCHQQdPsV5ouqijHnGLpE9gY7dD0
         nohYTivcaUMDHyDS9kA60qxuuQOzwrCKLpIYqmshRgAayPUohJflGuGPIR9zaDNvjGjr
         iMTif3XglwHJ6aFZQqbiqM/IrkdKeZojN29sND1h27bTleSnRA0D7XXiRrECfSSgTVKZ
         +D4QjR2bUJMewRUcDCPS5UIStumJXtEhJOPQWmIK37QhrlLtdTkUpM3nNfS0hwhAzZpH
         8XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782050270; x=1782655070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGTkHvZxIlm4/NIaLgam/W1cvCG7uAwPxu+hLpy70Q4=;
        b=bvuTkmXvFzTD3c37CRHkMIr5yPKQEVquYMfTQgLMgt/LhhKn6m650nW+O+VvxcSDVq
         fBUdDlpuHyVvhRTdv50l3LLK3r6XEiH5QFCgOt/dOR6Xxri66IxnQLo1eFZYfEl23+Us
         YNNxgB2r374TLvUw6UXsvZJVM8sQY2AiyllzDPuE3Je5xHkXnwei9KJ5GzoW9g/CVFUq
         0hKCT7aX0i9/cX4460Pb11GagDpoidw0HaA1Rv2wVz4SxmSPtNUD7U8KWBPx9lGN1Gk8
         9fI4+xofgk02PfS2oauZT4ZqSpyZvUtZico7+THK0nKP8MY6Sw7qaFsexYALxIJKMP3u
         GSKw==
X-Gm-Message-State: AOJu0YzwFwkGl/E4yW5nTdfLKx0iAeAQ9ZZdhd1xPH0VPVagoqkANex2
	f7pqrAA/wXM/3B7SF8Yj5LbmCL59BwxnCKYkqmGTkJqFmRAWR1W2DoSoL/+OIAu8
X-Gm-Gg: AfdE7ckT+vQkZrHQwSHhD5oNN4H9N59tXUxFtYuJvGHt5laXIpUCiftt+kLVieA1F8D
	pfAu+UUZZpj58xLvXwAbcjouQupURleEs5ueSOud27m08xyWh01DSwryG36soEl4s1ER9YMA4WU
	PowwsjiQD0s4sDFkAsms+lQ+1x5QdxBqmcbFGoVNQbwrJ2BbGrBA7FGIvWOC93yPORh9fxdXZYx
	Nz6upL4a8qdNruDdxf0XgsBAIkrjK5YA+RTCGInFEy0gsQ2DZC9Z8XR4aSZTjQHYayTfrya9V1K
	lLqF5o+tKqZKA3NV9GbriBoTaBuEcI+XamXUSYGq3EC2l+JWT+EM51VUyUNxvPEa6eT2pjzc8gd
	DxxuOt8z5EI3cj3t/Wn9y+GiIyOJfrYdpRAwI+NMU95hdeq6CEzr7X/4mx2xGOFZlgHqJGRf6S7
	ZKe1HQ85Vr9OD4/K8EZ8y6hvjBvji3aDMUKOtaUNRDK4JNHVSu3gRAxO2CwQ==
X-Received: by 2002:a05:620a:6493:b0:920:6f7b:ac9b with SMTP id af79cd13be357-920d3f3cb73mr1508841985a.47.1782050270504;
        Sun, 21 Jun 2026 06:57:50 -0700 (PDT)
Received: from fedora (pool-100-11-178-145.phlapa.fios.verizon.net. [100.11.178.145])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-921db451a12sm600578985a.40.2026.06.21.06.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 06:57:50 -0700 (PDT)
From: Dave Carey <carvsdriver@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	johannes.goede@oss.qualcomm.com,
	W_Armin@gmx.de
Subject: [PATCH v10 0/2] Lenovo Yoga Book 9 keyboard dock detection
Date: Sun, 21 Jun 2026 09:57:42 -0400
Message-ID: <20260621135744.504613-1-carvsdriver@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616143508.124122-1-carvsdriver@gmail.com>
References: <20260616143508.124122-1-carvsdriver@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v10 (addressing Armin Wolf's v9 review of patch 2/2):

  - Update ABI doc: Date: June 2026, KernelVersion: 6.16
  - Add #include <linux/compiler_attributes.h> and <linux/types.h>
  - yb9_kbdock_query(): change return to pointer-out u32 *bkbd to avoid
    a 0xFFFFFFFF status value being misread as -EPERM
  - struct yb9_kbdock_data: add spinlock_t lock
  - yb9_kbdock_report(): hold lock across input_report_switch + input_sync
  - yb9_kbdock_sync(): return int, propagate query error to callers
  - yb9_kbdock_resume(), yb9_kbdock_block_probe(): propagate sync error
  - struct wmi_buffer out: remove zero-initializer (not needed)
  - yb9_kbdock_notify_new(): drop manual length check; use
    .min_event_size = sizeof(__le32) in struct wmi_driver instead

Patch 1/2 (lenovo-ymc) is unchanged from v9.

Dave Carey (2):
  platform/x86/lenovo: lenovo-ymc: Suppress probe on Yoga Book 9 14IAH10
  platform/x86/lenovo: Add Yoga Book 9 keyboard dock detection driver

 Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock |  19 ++
 MAINTAINERS                                               |   7 +
 drivers/platform/x86/lenovo/Kconfig                       |  14 +
 drivers/platform/x86/lenovo/Makefile                      |   1 +
 drivers/platform/x86/lenovo/yb9-kbdock.c                  | 322 ++++++++++++
 drivers/platform/x86/lenovo/ymc.c                         |  19 ++
 6 files changed, 382 insertions(+)

2.47.0
