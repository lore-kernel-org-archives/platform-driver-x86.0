Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B053153598
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766672612; cv=none; b=bobfHAncvbs3ZUM7pi6qf2YRjWQzh97XLJ50EXsZZdr283DIe0XWt4cGPuPN5GgzCL6G6Z5b8sK8d4O6r72jDhjqDaMK2Z02VhnXIaQ3GmfYzI7KDFB58VNRMKhNjbX4tHBKIr3OqL7OzPYEMH5Ls1Kv1poLhHh2uClqy2zCdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766672612; c=relaxed/simple;
	bh=dsrn3N+A51ks7sZLvgkYsRGf+s0sbrbkVTdSHltC0CY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gr8u8HX8I0Rl8nSSsYyAXCNxSOs8vfz4QF3ykJpUmhfG051E6A4o3pt4fU5y2vxOr7tQxbMFCS/vPRwAomzJGfFR7gKP8FTyclz4VJCH4xN+6wN5/+F1iK3RiS7BhDUn2ht6SkSXFhEZBglR+fVniQPEtnf15UT75W0UmmhTfho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2yE/WWL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2yE/WWL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a07fac8aa1so71097845ad.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 06:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766672610; x=1767277410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9IYMret24pBGBbwNr9UIDhqJoSq0M0EW8YOiqUJqL4=;
        b=K2yE/WWL1XnF55hjUaFD3y3FsMLEJL0qYLQI6y/YR+y4mM2CtDe7A88XUXBb86EM63
         oJRRMHqDAyBUiApW9fr+H+iKxArs3HYKvjR9teblHrmgjjzt9zo0faWjbc1YvRuAD/PC
         /ZApAZk3czX/MJ7dtLFr4npQDphCPQhAWqnRnSY3jRzZoEVwBGUdecqxtb2DasPctTMu
         RBuuCS/JHZndzLmVozM6cU1Nz0yf4eKs8uRSR6pfGqH5s5tQ2RWoAtMphpUGLOVIRQEu
         n96s//i121zeimb3RzNPjqJIgyYj4XmSZhQoIizYfvjgXkMQRQGCwqg4noBFoJLiw8Y3
         CXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766672610; x=1767277410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9IYMret24pBGBbwNr9UIDhqJoSq0M0EW8YOiqUJqL4=;
        b=USvjYsLvZqpXA/kAcA7auPx16CLe2I44ScdaGA1u/7XxWfYfcXJvr5rmxC2i7y/Kv1
         NivwjjbkWtJg3+Q55rtNOWG6ZASnXT5X7hbZ/FCw5Te6dJsm1rlj2ySi5KmkoqpMRJYR
         pCOp1Z47jVFlWxngSR4Un8XkqGJZAX07UTjCFDHspbI2FAzUYILXEeNH9tikyCr/bS0/
         vjj35Oi0Cw/rdihbxxzqs8uyKsXngAOAhHI5BX2DVpTLfqWkU1bny5wlmoFdVWZy47Ys
         06kX7eT7vACGX0DbujEOgKq4oZMz5a2Nj6B9+DYXGn3ePCUftGNfVGPXUMsEc8SFtm0y
         mg5g==
X-Gm-Message-State: AOJu0YwZ6nkq3Wzn3WOs7aVeH2IEJd9NS7U5cI7rLAg9byI6ZOAA2asn
	IaPMTeYQuiKvIxbBuRg87lTNbvrfLik78CH4kNcXyXXn8L0Hjt0k9grJ
X-Gm-Gg: AY/fxX6Y3rd8s/4WNWIWIN5Z4Jqe3bxSYbsIdX3nhgFM5SbyjJpiGbb10P3SP6gFiyG
	7Mf8fZd3t4k3gX/UvWfhaSVTeTuIe65RuZlOTEwg1eGQ06z+QR9B5G7LLGDv1dO0et+exMxN+ev
	wrxV1jj+atNXtJCMMHo8XR96oOF4zA2Go0xfGsIZovfWXaeLgD+wj79KFbtk4w8DLZw2m8E1owh
	wxFDo+/Qg0UuJKyj98h7CcLh+geuhkduVcFNVkvsphkX2414R99XeugCoChU0BeaNxKdFsUZuwW
	cUUkcCCcmRaBrG9ZClKundTsYGwZqctVvTRBjgb1je5bUvXeGL8aUi+lcONPYqpA6Nc+3KTwp33
	UCufAXoBIZFH/+SbTq6YKakLc/1Eewhkpws0PxSvrF0i05d5M7mH1GNn31uK12QOc7jwyJltoXo
	3CvTjw3jVMlq0KZHpzUzU=
X-Google-Smtp-Source: AGHT+IEgldb1YbMp/0OQv2OCTDWpW3s/dO9277wG6owY+Nsb28UheLdhLl1FHUxCKCGvZ7TdCOVnQw==
X-Received: by 2002:a17:902:ef43:b0:2a0:945d:a195 with SMTP id d9443c01a7336-2a2f283beabmr201883465ad.45.1766672610532;
        Thu, 25 Dec 2025 06:23:30 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3da7dabsm180892195ad.25.2025.12.25.06.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 06:23:30 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH 0/2] platform/x86: hp-wmi: Add manual fan support for Victus S laptops 
Date: Thu, 25 Dec 2025 19:53:08 +0530
Message-ID: <20251225142310.204831-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for manual fan speed control and PWM reporting
for HP Victus S-style laptops.

The first patch refactors the hwmon implementation to use a per-device
private context for state tracking. It implements RPM-to-PWM conversion
using linear interpolation based on the laptop's internal fan tables
retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
to set specific fan speeds.

The second patch addresses a firmware-specific behavior where the
system reverts to "Auto" fan mode after a 120-second timeout if no WMI
fan commands are received. A delayed workqueue is implemented to act
as a keep-alive heartbeat, refreshing the fan state every 90 seconds
to ensure user-selected profiles remain active indefinitely.

Tested on: HP Omen 16-wf1xxx (board ID 8C78)

Krishna Chomal (2):
  platform/x86: hp-wmi: add manual fan control for Victus S models
  platform/x86: hp-wmi: implement fan keep-alive

 drivers/platform/x86/hp/hp-wmi.c | 287 ++++++++++++++++++++++++++-----
 1 file changed, 243 insertions(+), 44 deletions(-)

-- 
2.52.0

