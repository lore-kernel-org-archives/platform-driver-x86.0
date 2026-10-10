Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED43939D0
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627643; cv=none; b=dEZJv6zV7xtVyoA2W50swnTEbEMypQvSAmYbWq16/4muK2AcItC1VPLaLQ82fwkYwpAO3sf8ZjZm+OZotO6fW3x6yPMpFlslMANaoIWDs7inbotVpSaHwF7+VObeCg3jrDeOIRt/oFW4ft/Gs7sE4f/nJdd1FLZEpbdespYVG0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627643; c=relaxed/simple;
	bh=ps/c8m/I/059ZUxB+Z7eeMHqeSozTS8ry4Tk1f7HwOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EL2t/swQYXT4hajGAwg+U2QBtEHIRSRt83XiPSPl/+SJk4Bl+8uxeHGbim//99/fMYnHB9F8/zx9WV09ib0P+t5YfkUoRAkM0U733bu+ulkyIXt62CIttzn5fldaEHMiPYk+m3V1I4e/jd0UPMipyjHwjnox7zdJGsjiLBjI4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1vGRSs+; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1vGRSs+"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15168a20b47so369058c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791627642; x=1792232442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wa600bv2yNgaOc4w2jw/1YhMvLB2qD0tVmO6k4jww6w=;
        b=A1vGRSs+HIeH7cuG0TJXuZsd59egpyRy7mA/qn2CUJRw9ehlEU9VWvBjFk9Fv3eLNl
         z/eJmLttcwDRBdRuLyQaiv6NzUk/VEUciIhgqywPguGHF5l9mRyZ03V60iwN8N3vj5/b
         p+HahFlZJEKFlzJm0yJgjuROyKV1yvgvSes9CEj+khahf1syrs/x4XIhIzJDUVAEjyLv
         Pi7SEyzeF9Dy+8rYPWV3zy8DRuhmkAvRbi21LdRdqFuHliHEc7DZZ3zcsbedqH0i5MBi
         f78RnSSX+XaKaIDUyBcB9jE8oHboTpDXi77+wOmVMzH4pRkyNAO7UVUcacm3gjSu0xST
         upeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791627642; x=1792232442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wa600bv2yNgaOc4w2jw/1YhMvLB2qD0tVmO6k4jww6w=;
        b=DC9XgaKLGm/7aYPFDv47X4AWm+YBaJuXKhHLXGQxdx78vejXWj+/AEnaTNxptcVWg/
         MvO4qvZQL4IX+sEmYtOK1QnqFaiYj5zIdNNclX5UZ/3TUQKV+PowUb6+kzs+touCv5rS
         gp8oCmBV/haGgstXtI0nG1Bgz0/kV4BkghNtJRwnOF+6MdahY74D7P6vBuDrBUchqHCk
         +QTs1fAMirktpgyV/2O40pnTK7fb/WIgyzfQBvCMdTMCI4WKeVsQ9SLp6mJH8pdXcD2P
         bFBp1TAAFEwnsJoAtXwaB646OW/3iFeOrCswxCkM/3LLP7HscKqBGG4hURY/Lv51Z6r/
         lsNg==
X-Forwarded-Encrypted: i=1; AKwUvBwGDobs8a9wpwBGZjWX0YOmdG8rsvyDMXpRs6Y8MR6J7u0jKGrolCdW685kzE+SufgbPxuSeBZKmjxjDqfBkbvlNv1A@vger.kernel.org
X-Gm-Message-State: AFq9FYKlfD5YGzwICSU6GrBdM5F50bYHTe3iAzfN/iruMe3BTDkX1nn0
	MntmqZDlR3+23q0yeuDOCZWionJOQo99jnS3/Y6p0S5CXrJTijjkt+a6
X-Gm-Gg: AYBFou24TzDB29ARJFrtRwWHvcDbBoqkzRMUqHsVvIjoGUWjpwWN1zyV9snpFytb+vk
	1v7Tn1TNK6fgfrV5q8uX+RdQRKi5n1QGLo5b9rHy3nF8iFtEVZsB3ikpouUXmkIFXcq/VwRtdvT
	dXAxnngSqvEvsCiGCCyAe0AiNBryBqPKMOpqru0o0XMBTsttYlsWrW5UP7ym25dlQe4qfpQCibT
	+EPshyhQufXgz/NrUh6KBqWxcawPChz3ysh+BcjgRsGOAHiiQuzwQ8+zVGcV+iK1fP9Hj/Jq3R+
	7uzrxDaV6cKqgZCO5oPhewwVmmdaFMqFDjrL6mPCY6MitaxA9TMZBX1aWps51nzy8GNEEB3YIt6
	HnMe0NRQSlzX+vbJSNMeItwpqaRoPCXfoYCB8Epei0JIDQ7Hksqj8kL7WCXn0TIk4Z8CYLgrpMw
	eD41xrh+ygMREeqcDx+LlddyxzbgMv9Pf6qVxTAAtDpuSedMT4I8vrVGduCAsdHnWcWV0lzhnht
	D+nHYLceVVbnQ7iKY7xMl+RDbw=
X-Received: by 2002:a05:701b:231b:b0:14f:5549:c1ea with SMTP id a92af1059eb24-16a57a16d44mr6603742c88.1.1791627641303;
        Sat, 10 Oct 2026 03:20:41 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c920:95f0:d96a:36c9:8c1e:6661])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm12429714c88.19.2026.10.10.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:20:40 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v4 0/2] platform/x86: dell-uart-backlight: fall back to PCH PWM on UART timeout
Date: Sat, 10 Oct 2026 15:50:10 +0530
Message-ID: <20261010102012.110394-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
References: <20261009072401.52509-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Some Dell OptiPlex AIO 7410 (35W) ship with DELL0501 in ACPI but no
physical UART scalar board, leaving the machine with zero backlight
control after the UART probe times out.

Patch 1 is a preparatory refactor that extracts the UART initialization
sequence into dell_uart_bl_init() so the probe function can inspect its
return value.

Patch 2 adds a PCH PWM fallback path: when dell_uart_bl_init() returns
-ETIMEDOUT, the driver reads the Intel PCH BLC_PWM registers and
registers a BACKLIGHT_PLATFORM device.

v3 -> v4:
  - Revert __free(pci_dev_put) to manual pci_dev_put() calls to fix
    build error when CONFIG_PCI is disabled (kernel test robot)

v2 -> v3:
  - Split into two patches: preparatory refactor + fallback (Ilpo)

v1 -> v2:
  - Use SZ_16 instead of 0x10, add linux/sizes.h (Ilpo)
  - Name BIT(31) as PCH_BLC_PWM_ENABLE (Ilpo)
  - Fix double-space in block comment (Ilpo)
  - Reduce devm_backlight_device_register() to fewer lines (Ilpo)
  - Extract dell_uart_bl_init() for the normal UART backlight path (Ilpo)

Chitransh Mandhaniya (2):
  platform/x86: dell-uart-backlight: extract dell_uart_bl_init() from
    probe
  platform/x86: dell-uart-backlight: fall back to PCH PWM on UART
    timeout

 .../platform/x86/dell/dell-uart-backlight.c   | 158 +++++++++++++++---
 1 file changed, 135 insertions(+), 23 deletions(-)

-- 
2.43.0

