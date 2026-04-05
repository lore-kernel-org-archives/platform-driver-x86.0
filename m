Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960B91A3029
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 02:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775354882; cv=none; b=Y9l7Dugy6LnpxR79BkQhFUdFoDYo/+3I41PvKcBDGA72kupNrgX7xFgDaJtbYqnseKrd0GmYKTTdCejLA/WAede0M9qxXdKXYy65A0Xe8reFVV/NRYII8NR+cBwLAN57rICYSx78PCSqXJ7rYxhYOpAcYIwXzqizWybJZ8JtFnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775354882; c=relaxed/simple;
	bh=E4g65yvLu0fcn1IkVOLQj7pPV2zJHOkBVhdsZHOQbmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjQG1K6y34RRxrR4kRJNX68iPJUybAvFGYBgq5WiJL9hdkkSsEkuv/+aslWmJGS2lQ85f+K1iAVgsU+eTxDs6QuVUqTnT+F1IHKJL8HXu7URzFMLwqdAmvgOc5XDuJxjdzyalztTOG/EnlH9Lsakqu+ID/++lfxr5kSR+oJ4hWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXlcsLet; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXlcsLet"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2429f98d0so18822545ad.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 19:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775354881; x=1775959681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5unS9RT/mwVK9Q3rFwUfXupKzLnXXtbKuHJYYbkhV+o=;
        b=AXlcsLetl9t0J9OM7DFUVuLMN9WWvzdoTYHB7lcUNmIAmE5Jgb2vNFNHsquFIUCLUy
         0cRFmqXvrxrC95a/k/fDZUCbc5xrawLYg1BCi9kCxzwtYsKzyZc5M6LlAxOkOOsBjyHz
         QZ2Yk1akKLTwIRc56hqw21awBt30jlCzIWReuUm579T3J1gimfoX2E+/4lEpsw5KQItO
         AIigeJIc/2hXMGT5uhEpRe+b9UerrO3bNa7oUAKSABro+S61nc0t7i9Rdm+O46CYrTUt
         GZ24SnZIG+jizjTwGQJG3Qs2eZPS7a7GAiQBYm6PzCOxVBqjokYpLFSI5AlZ2sjmDCMr
         uRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775354881; x=1775959681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5unS9RT/mwVK9Q3rFwUfXupKzLnXXtbKuHJYYbkhV+o=;
        b=HsBitkG8B8XlfQ4druxeE4Zts8R5MueLuLwo6KK9zKKoipaB9D0E3hao38NUHW8FVT
         Uafa6ZqDRmnnQcOD+hks4IWYRrpS9mzis/E5iWGeNjKhJv8tenfoxfrtZ6DPZivOmEaZ
         AIez5lfQT0Zz1U+A1NaPotaCL9tuZ+zZPtxmzX6JP8ihTbyDIcVZvsLmb820FKZdPBMY
         RzYlSkKOUdH3/hI7GdakVWMnjNgFb3AhjjqOt7n0jwb2hUQ8bK2K1StYcy24W4WpwbSj
         39josERW6eMCEYusi30SV1V1yFp/SAFbR5oHWYYLRqwOY59c7l/x7A/nHmqaUVeLDsET
         HOMg==
X-Gm-Message-State: AOJu0YxrMSURT0DFxl5SHys8l8CpXE5GDAa2O54EHwz3V1M45ldvrcWr
	d0Mq26DhRXrPdpQucqAhTDXqmldRMhF7sHNUNIR4FzwSGVhvgG9Urfwp
X-Gm-Gg: AeBDies6EifU3e8bF5TtWlK+VJTEHFQuVWy1kFD64maUHwyV3m9AAl4ycpN5yxPYUds
	3Ud0AiQOQuMwjaYNJH0waqWVk0avz5FSLh9V/9+Zuk2V9iQ87cawo8/i5p+/izsWnWvFxIchd4R
	FfJj4FiSRt2dNHeLiGhRYilkuCgeDMCmmypHugs0qw2jECecfNBEGG7VV9Ius3jY58spPkNi6KN
	hsRvLnSXkrexUTZR4H0Amg1bz/9RoYQ/v6nQ+5s3/d6Fl23Snkc9gjGqPoZjZZi/Qg64M/7HmVH
	R/13axAZwDlHsR+kC5igacLsy5NxvQ6mxhyKvrEfWOilQ0o2wt7kFGyocl1wgfPxOgzI675MpR2
	t1j3ody+EEFd6axNEYhzNljILYg1r+6aSn/m06anYYQVOcBgQoTUmxW1L1CihyIKJTV1q6b1J/H
	Yn+Q9EKi8dNYF2U6z1By8=
X-Received: by 2002:a17:902:e78b:b0:2b2:57df:264d with SMTP id d9443c01a7336-2b28178c3b7mr82639705ad.33.1775354880854;
        Sat, 04 Apr 2026 19:08:00 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:7ae6:3380:c4:fb8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749b2423sm127556535ad.67.2026.04.04.19.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 19:08:00 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 07:37:42 +0530
Message-ID: <20260405020742.34869-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adFsG9mTkoE3kIF4@ashevche-desk.local>
References: <adFsG9mTkoE3kIF4@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Hi Andy,

Thank you for confirming this is a BIOS bug.

I have filed the issue in the following places:

1. Ubuntu Launchpad bug tracker:
   https://bugs.launchpad.net/ubuntu/+source/linux-firmware/+bug/2131016

2. Intel ipu7-drivers issue tracker:
   https://github.com/intel/ipu7-drivers/issues/26

Unfortunately I could not find an official Dell bug tracker or public
repository where BIOS/firmware bugs can be reported. Dell does not appear
to have a public GitHub repository for BIOS bugs unlike other vendors.

Since Intel has a direct relationship with Dell OEM, would it be possible
for you or someone at Intel to escalate this BIOS _CID issue to Dell's
firmware team? This affects all Lunar Lake Dell laptops (PA14250, XPS 13
9350) running Linux.

The affected users are currently unable to use the camera in any native
Linux application. A BIOS fix from Dell would resolve this permanently
without requiring a kernel workaround.

Thank you for your help.

Regards,
Vasu Hansalia
