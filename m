Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428271F2380
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Apr 2026 01:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775352878; cv=none; b=WT9F51UdTDOaHqi2af/HSJKD1xeMhKUWCJepjPtP5Vt9oNmnb2D/jceWq3SV2BkxsdKWZbHNr2DqGkH9YDLopnUx0j8v68iNzePOxyKq2bDdhe7GTgmX7u8kq+VUzpvJ4lPvrHuFUpPyjnNEnoZiRwl6o0I5cSGzudXZnFSjebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775352878; c=relaxed/simple;
	bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NERoIoi27B82Ddlbwl9TwjaAlNKK8+AXH0RGe8R9w1mH+8WZ/MdzOSos0vhMCq5V7sqD9HRHXWz++ucBp0iAPqGEkLKLIMx0NCmY/3BvIxZyr5enatsCk0vdWcOoO9oL6aH0DpeiXuSGyqGnU6GjpxkFwEk38gHkE/FVGL4D5bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuI52SQw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuI52SQw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c742723c863so1949208a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 04 Apr 2026 18:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775352876; x=1775957676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
        b=PuI52SQwRxtbLsZrY/lDIpdGo/JdYSj9OuzmB/kFPh1Z1Vz41RZzKRtUGwrZevl1eA
         K+nmu7u4MLTSJeIcyi9tueaocjzBzt4W6Tx9jjlIcBeddKNOgjLhp8jwHTLYaNk5GDO0
         TB4/Q2gAqPFD2tPvtXCq21olHhA6O1AQZjVfk0duMJB4GDeiczcnTEQNbozbExKu3Fi9
         KEAv4ClYHjOXAfMYFKSkskAW5DQ6MrRmxs4r1jUFf8xNOhBSDdZJCf6AjQcseAD+n7ld
         WT3FBNaFIPwDXgbx1LSfe4jVBXgQXhf+baUgntSt1Jz5074chHQJHB7fVjBjkGlaZqqE
         wHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775352876; x=1775957676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bbCEwMYOOmUt5mImHSJulgW1Lj73B+j2F83yFEj6hdY=;
        b=PLo5dL8LVMA+7fpHU0h7rmd8Q6oE0lr0Hvc4BIUbXbdbaQ8YCmg4PFgYhDU/2DW4py
         ChhBZQXjrR7gbrnXut2aaRcQdBQV9eVmXvG4wPDAm1uGSrNbRr3zT5vOpfvfbSfVF3i2
         kr9b0FbbzRLc01NfFoeEBXsX10j4VuPUXoNrsM33vYWBpt97Vwslwt+hUvAWTXbmTLta
         MahCN+f2eOEoAFSIeIxE46NYswsCN1h6d2ydT9bdY1v7zQ1CwA8UxHenboCAWepYxk6R
         fInGsltEOSkEWIi/8UMs3Iohs4URj8rupf/lVO0u/ntoAPPXxA0Rvhu6AwRt63CE/eTE
         OgIg==
X-Gm-Message-State: AOJu0Yz2KOrjiM8TAxdx93ZgEm7bxm9H6eKn50FSNgrPBM2FDtJNs7mo
	ecmCuebcxnvQHQAIZH8MjcQ4GRkQrup9hUWXDxM8yBNXhLxUDsSHsVLY
X-Gm-Gg: AeBDieseJqnJ7dK9nzvxXp8DTwP6Y2YGgpHNdBCHrH3E3+PLUCALtVbleqgItF7PaNK
	W/xhyw5HGNJjFYwX+lhekZvqmFUx8NI6kTQQfi6nYY+u9h+sp4UOALAxzslyZ4tGWT379AtCc69
	atgqIS3K47DTqTYUseoRSc+GSxjR7ZKKZ8ZUnN+BIJAoDp64/9Ml9DMt9OXPaLNYILZIhvyYfIt
	LojAunNZpv1mBbp6KHKJXxhqCylyT34cJRkZm2IB0g88q3rBuJXksRJGQET1asKmYeDBTzTGtmY
	5rRHzKq1FOhM08tZFyx8n6OODoFoY6+v7LXnOGhkcdJe0FhiYCq/WunvncckiSizgJ1HQLZWlJw
	q9DhrTX1KJrlucSwZRelujEYUOdFya3kClmL23P9Uc4/vDgW6suJdnYKl3OzyRbwIqmmywMzczM
	Pr3/LTAenJ0cFvT1tmDso=
X-Received: by 2002:a05:6a20:958e:b0:39c:2b9d:93ae with SMTP id adf61e73a8af0-39f2f1ae00dmr7515520637.60.1775352876467;
        Sat, 04 Apr 2026 18:34:36 -0700 (PDT)
Received: from dell.. ([2406:7400:98:ade4:7ae6:3380:c4:fb8c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b261b6sm11765724b3a.3.2026.04.04.18.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 18:34:36 -0700 (PDT)
From: Vasu <vasuhansalia05@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	djrscally@gmail.com,
	mika.westerberg@linux.intel.com,
	Vasu Hansalia <vasuhansalia05@gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: intel: platform: Add INTC10B5 ACPI ID for Lunar Lake
Date: Sun,  5 Apr 2026 07:04:12 +0530
Message-ID: <20260405013413.31970-1-vasuhansalia05@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <adFsG9mTkoE3kIF4@ashevche-desk.local>
References: 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vasu Hansalia <vasuhansalia05@gmail.com>

Thank you for the feedback Andy.

Understood - this is a BIOS bug where the firmware is not setting _CID
properly for INTC10B5. I will file a bug with Dell to get their BIOS
fixed.

Should I drop this patch entirely, or would a kernel workaround still
be acceptable with a comment noting the BIOS bug?

Regards,
Vasu Hansalia
