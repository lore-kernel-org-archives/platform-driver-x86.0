Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908F3101CE
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775406883; cv=none; b=okra90YChggGOiI0M6fW/gu80cAqQarUrmsljE8ckK/TLMCyjzrvyb9X/WX2ZQjQijyQQojyiBAf6ATwsZ0tDu7RxD5M9iLNz3Yrs6Q5QwZMAX2vU8VthLAkgLdzXdyWXlYogcclgjSY8ZXLtSLkwvxwngZ+naJCs4I82pEd5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775406883; c=relaxed/simple;
	bh=ShIU28ywAnLhIe50H6/Hg2mhHzijFwPqKIsC5176nbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hYanwErbFnyeXHlwq1VLORxSUxbUe90I1FW4M1/YzvuPU5rB8r912TrpQ3yZQJG+dEFlijkjCuk/ilkqvzZ6xoLPn0565S0Dgh95cQmzCRcSO0s0aYvJrkQr95aBvMDJaA7PvJV/rN+rZITrgaknwGGEJHPsaHfUBPGl5ECQm6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjWsyRgp; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjWsyRgp"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1126314a12.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Apr 2026 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775406882; x=1776011682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hsly7+smhD3XJiINoBvEMNmOhTjXHx7S3IbobJZ4UMc=;
        b=EjWsyRgpt0OEf7KLINNGwj4HsFfr627giZzp3d6u2luuzs8a4NxC+rZXbYTYmlbydr
         5BU7MN9kSn67KtSbNUojTr0ZunPqegrEjiE9wawb2A7BmtG67FLzzr/BYueXy3Jxc1F/
         suVyiEseb0Yv8KJwlJspuExSetREFSKG6EmGQZAskbM1I9aWc24OnN26WYDxfpbNTedo
         KPhowVj9Rh4ERw5jDo0jl6ANQYf4PQxeB/iv461SnNJ1Z6e9Eq55HPWqe2ny4IOzvtD9
         +sNvYx8EQByMOvIYEM7dMpqBW+YivjKjROnaFH1kMQ8l21HEeHfznjBszKFwFJVsVQsh
         u2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775406882; x=1776011682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hsly7+smhD3XJiINoBvEMNmOhTjXHx7S3IbobJZ4UMc=;
        b=brD/dMxPj3N7XQxWs5r/WXY5o3w6VrMOqbSVF1higJtm3/RwFf9AinwhsQUfKeHkl1
         7RQQNwb2hRxb3KzPPhkgAn1YLPdVlRO2OmLEVl1/kwF7syJSvn0WLBoKB1nZI/OYRMva
         Ke1NlQH3E+iB245e64Wqv9cczpJDBg+QD+FWRwoK+TBWwXbiad9306q5yTB8kBrpE7gD
         tX41y6rB7eFqYiQL6oIf6KnvyZTrT7yWZkxLFNBg1TNZa5AFWnjsplSShwkCCLc2LXdA
         JSPrx9Vo18W6vNCg/OxASkdeUMI5qPUWRBAQPi/6rkAOyk8Mlbi380DN7PhQqefxZgHC
         h1Ag==
X-Gm-Message-State: AOJu0YyZBIprZCU7WNEnfvYG4FHd5m/FnbWJwRWDhqYimAUKadVewE0S
	k+pGXKsk4M8HR/32tqyNyPSg4mNQlg45dmV5x7D2B6hDG94CckZcWEfZ
X-Gm-Gg: AeBDies9M+e7/6JqeEMYBimucXYd48IkH5SUoPZpBFqhjLYD8D9H1zUU3NOEO4+k9Ca
	dDT8jwM7OT6BazW3mYqcvT0LcdRchxeoDo6BDaDHfkO0VgWxQHH17SG2pOyAZ5o3OxBd3gkJFeQ
	oJkTQJxYMZX2IwM90KASRRGOhyYR+enQY0OcW5Z0yod2BfxNNIhPazmaR2NyRPYL/lflHiE/24p
	3MI6t4/wkn3HyTKmnMKkgld563NIlzb3jaDXrHmfygltb2jLp7w5Chhvh9Qva8MKdNck+V+AjVr
	T3fd7mhXsrFmMRe2z4s4MseoMqI64ItgSAdHumw/hiOc9amkSY7+uICSlunEoqJi0igzGJnFdN4
	o0lXzUUhnUahDBFDSrQE4STMDWAlmkun2OYhdUO20Y5dWXyC7hjOua83MTWfQGvi3zDRxY4rXf8
	j4S+A18H45/pY+dNdzfgSal60=
X-Received: by 2002:a05:6a20:eecc:20b0:39f:5c38:8cf9 with SMTP id adf61e73a8af0-39f5c38c5afmr2604722637.40.1775406881540;
        Sun, 05 Apr 2026 09:34:41 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:6ae4:fd41:84ce:ea1e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c657dfb7sm9828915a12.24.2026.04.05.09.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 09:34:40 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 22:03:06 +0530
Message-ID: <20260405163420.16654-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adKLLO1oKOy1tjdo@ashevche-desk.local>
References: <adKLLO1oKOy1tjdo@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the clarification Andy.

Confirmed — the LJCA drivers (gpio-usbio and usb-ljca) are present
and loaded on the system:

  $ lsmod | grep -E "usbio|ljca"
  i2c_usbio    12288  0
  gpio_usbio   12288  2
  usbio        20480  2 gpio_usbio,i2c_usbio

You are correct, Patch 1 is not needed. I will drop it.

For Patch 2, I will follow stable-kernel-rules.rst to request the
backport of INT3472_GPIO_TYPE_HANDSHAKE to the Ubuntu OEM kernels.

Thank you for your patience and guidance throughout this process.

Regards,
Vasu Hansalia
