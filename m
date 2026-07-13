Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD0540756E
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 12:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945458; cv=none; b=YSVvWE56pTVQSxUTYHoXG9nqxqDkoYuOjkJu4k5+XO0Bq4FHWXbNHO1QaB5isAgJ/PSJWSQap42d1JzWbI3oIVxTxf+TWdNK4+/F0nMQQ8EOpXVwoRPiXVNiYGAZrnhrOkXw7UdOE2s0dJ9UNcUs+QOYK7dVPQU2P4vGWT5CHA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945458; c=relaxed/simple;
	bh=+LSITkVt42rVOhi6nPNXozhVTeiKxCV/jfJHRYjFhx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jH0+Mb0cChyR20fgqWnL6DIw8oNvZUhKe0luyP4YtEKa1v/9Jx0NHd2SaEdvwztxUV0auMqWgcI4oj3X7meIXwtEswklC4fhfQx13fO+5YJBcj7bT/NCblwOTrsAr6EOjm0DQNw5oVvdjSI41FaozilZLfuPtwfJ4LeiQK4tqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6pptWcd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6pptWcd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f140ca8eso19453395e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 05:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783945456; x=1784550256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+LSITkVt42rVOhi6nPNXozhVTeiKxCV/jfJHRYjFhx4=;
        b=j6pptWcd/2hNSGrz3tuEbhLSobpGc/0WEJ1EzvMKsfN4a5sAP4Lmb/EotZIfxkWeaP
         bl5+UitItFyhe1b7zAhhhvuO4/Oam9lziCQyNIW8UBCzVsxpag8PJNP/EwIKz4+oKV4u
         Sn2ZQQBUXJT/ZleCxdSYF0LVlq/H/2DSG/Rh6e4eUIGlDSa72ZgSJ+9VetsRewVJ/E/R
         2FHMdu7eBwuuGZbirAsXryFu6yDofQQxr7Ph/CtSF1EWNwlAiLo7lhxBnLGrqwxyaoJs
         sJ1KhVnTUQhWqDCiiFySyv6bX/R8Cr4Bt1AKNWXMpZKi+KUvQ3gocq2Mb2kwJpDyUOif
         DDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945456; x=1784550256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+LSITkVt42rVOhi6nPNXozhVTeiKxCV/jfJHRYjFhx4=;
        b=f5r3ytFOPqipmsWbh88V8QsW9YSpFCllBm8DuxtjABr9qKypyRxaY2PzxVbACo028/
         9rFk/O+xLN/xtJdo0DO+wbMPI5iU8UP/ZgmKACcSCbdyy1WF2mfCrG00l39LooU8fc5X
         RJ0fFYFiGNcXazCZE4Hd3lpJpdPHZdQHlL37K2o/+084j7P6bNiRHfm0tnj9vzNmdx0q
         lZATzD0x9wqz9GuXPFtz5Y9DmDewLviSfNyt0p8KOSau6Yth/K7XoUfrIpCpcjaLhTpr
         MWMeqJu8RH7fIkhwZ/VLYgzqGRoQfbY74aqGc1o+zGhtxd0HOPu4WD/DupDAM5//PhAh
         VArg==
X-Gm-Message-State: AOJu0YyP34G0wI6M/BWZPBDw5h+o4A6G7MD5ESmrKTJM4hpWm/USWULj
	V+GyvyM98hlGbmjYR7JwqOQ2Esepd4yNxablw64CPzK382N9C2X+xSnBgO2/5A==
X-Gm-Gg: AfdE7clUBzkNtFoky6SZ1QavCInDBTA+MZ2dIafwpf3fMCVUmSr5g7rYKhbZRw55MBL
	9YZyKxKBffuD0v9qYX31TZ7WukOtoxW3aTvSA03FZMJesyuw885e74sQnguSQN/LVRfAEXaaTrY
	SIbDf0iH6ZBVD8QnHd6nLR3tcGgBVfpcgIR/4xG1F0lTdjCD3lFy6Q6hLMKNPGNX6MvvQtB6tvP
	C5lLPxYpzV4mTN0I2NUeJOcxEcZuDZKg4OpSEFyddJwF34MYZkw7UN18D6W/m1tTh+gcqGd4DGi
	0Kp/oNhqrY1V3+7n5KfhqRnMsEOH9kSxZNKQSa3lV/S5uNMws1orkIpLYjuefjsGffzpi2Zv6kp
	4ej7z1GxLcSrWwQVLasZya1dh4evq1YYPIp/b4j6fEJ/hBaH5IZ91wYQbH9lG5VsN0Wdo+h9sBm
	0VwYFTLHMKUXZm/g==
X-Received: by 2002:a05:600c:608e:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493f881f934mr90826205e9.19.1783945455356;
        Mon, 13 Jul 2026 05:24:15 -0700 (PDT)
Received: from user ([197.197.151.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3b85sm582418005e9.2.2026.07.13.05.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:24:15 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] hp-wmi: fix potential integer underflow
Date: Mon, 13 Jul 2026 15:24:12 +0300
Message-ID: <20260713122412.8484-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2c2be85b-62e0-8431-9cc5-1cdc48c1c149@linux.intel.com>
References: <2c2be85b-62e0-8431-9cc5-1cdc48c1c149@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ilpo,

Please drop this patch series as you are correct that
hp_wmi_perform_query() uses the deprecated wmi api, i will send another
another patch that rewrites it using the modern wmidev_evaluate_method()
though i fear rewriting using the modern api and risk breaking all legacy
devices using the encode_outsize_for_pvsz() function for example, which i
believe is completely redundant on any hp laptop besides ones from 2008 to
2015.

Best regards,
yahia
