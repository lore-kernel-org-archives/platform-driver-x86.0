Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F59F3F23D1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195703; cv=none; b=Pt/9oongmICr+5aUbza4kqdKpjjKNzRxnsqr9sbM8Uv1lt4FeCTYxirsi5ND5M4ZNMoek9rbqpG1ZYNpKLPv1Z6+o9+vI1A7IMjPvtpKMxQEtlL7+JL4sSyMKfSFmeUTVFL2ARTc3nYwZJy73k/I13R949a0+jaE7vvL2+mfako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195703; c=relaxed/simple;
	bh=SC1fJHlOoMt+W/9WtP32IWJIk5SJbSdEBAKoRtriuMw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TDuCSH/NzLhAvgTEAm7kUDKqVvLjp8rsyxnE2D1KYk3hCfLuRJMCUkASg8kUbhwLZAG69/5u+sbTgCKQG+XVSiIFy9edDv6rPK8gGNUyIPiGUlJnexSmvnIxsGOLXMHG4cK0lQZWTII6cUVVUs7sNBsscssOcZw/0hadMiwakD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9wCqXf3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9wCqXf3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c15e62c695cso51047166b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195697; x=1784800497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RWgLpdLDZU9Qh7kU+g+f+q7Zxd++Ns04w98UB8GYq14=;
        b=f9wCqXf3+5Q6Fd7B8Bw+gnX3oGWSnNZjT4VPCsNm+/IFw/dU94uXtyzuEANTjg3wBP
         pUIb+VWiZ5qyi8seURMzH0ya5jQu69sG257hbh8iaehwQYx7Qsj3l6u4scL4QM42BAmL
         7Rm9nzfFiV4xBDUCg3+uSHJUhI49xO/Ql0brJnd0AwNZJ+CPi+nkCZ/WVOYEwjUtHfMl
         aWnKtB/Yt5nFx1eoDGsLyKZA83N3MEGCBUuixlGvmLDKvklkJaTt2w94rY0X/EDm2MOI
         jq80dPrsn+aSGWIBgoapPKJR7FbuWUGPllrjfR/Z2384k9VdHY+TqcUdC5bB48ETh9il
         wA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195697; x=1784800497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RWgLpdLDZU9Qh7kU+g+f+q7Zxd++Ns04w98UB8GYq14=;
        b=iwLezHs7GSc88FZkEK5n4niPSQH5w0OBjvEZTtLUJqp8cV0Pu51/hjIrXdYVOtobEn
         /bdeDlH8omlfqa3NQfxo1nXwLedA/kTGs8fy/P7NsIef6FOlyfgsDRBdPwLJDqfivhzh
         zOaGzPCSZ8rUF79tHEc5DPVYUkNTzPPNkK1S6KHc9Tck0Zu8Uqb5jpgUFllyzNonhqoc
         eMoapZCVMSGzyWbopjGPwTgS7ysQlWO4xKLGFVlfMW9V1CHRRcH1i4Fz/yR0izpfsDLK
         hAaeAYpO7ClZbOpc4GZ8lUgw2briZWLep82pCxwgyd4wxl3BVcy61BuWkNocpyWOEGyv
         i/KA==
X-Gm-Message-State: AOJu0Yyw+YPt+bikfm5B2Mq91zc+uGPfy5VCfe+thPXCPxfiQdtvUe5r
	kT30TnPWnUV1xp7gQ1p5XYBC/QLVzb2zKw714cFydUcSwo3bbCcvQ4Pviz7P629WZz64tQ==
X-Gm-Gg: AfdE7clM5FHf20/lJHwtfJRp994/VoThAP+ZDbasx9QAT4rSmKXR/410B8R4CGt6ijg
	O3w0dycGmhl6OD2wdv5DBAeGmLEOqn5aB74uV+7lGR+i/gfMggs8uwBMEIUBIbOll9f08c7wg84
	hftw67+Zs0N02D+YtBLIAlAm/VJQtgosODFR35lX0gpTkdzzDHKG4Tt05LSz0liK0A7bSHNIA1U
	cyMji/yBAu0wPzEXAi70tkGDDiRRQaqFET8CyGCWm3xTOdJYQ340mDTIHitWBJGRcijS7H7QpFH
	kvPZvcO12VWfGCr+Q7CcCDS45HqcJj7DMnZVLj2bnl2OSeE1Fjwfbx78mnzpNGE0PIkPW6R3svJ
	nA5ZmJZ/KTsP3ASueRMCbUJuci0pgVym+gtb5jx3+z6bh1zOo1AhSYWdYSRRyLhlPJ7HyxGy78A
	4chDU=
X-Received: by 2002:a17:907:3e21:b0:c16:1290:11a7 with SMTP id a640c23a62f3a-c161e923432mr638052466b.1.1784195696648;
        Thu, 16 Jul 2026 02:54:56 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:54:56 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 0/5] platform/x86: hp-wmi: Fix WMI error handling
Date: Thu, 16 Jul 2026 12:54:13 +0300
Message-ID: <cover.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several places where hp-wmi either trusts an undersized firmware
response or mistakes a positive HP firmware error for success.

The affected paths handle the common WMI response header, tablet-mode
switch updates, the OMEN key event, Victus GPU thermal modes and Victus
fan-speed control.  Each patch is independent and can be applied on its
own.

Emre Cecanpunar (5):
  platform/x86: hp-wmi: validate WMI response header size
  platform/x86: hp-wmi: handle firmware errors in tablet mode query
  platform/x86: hp-wmi: handle errors in the OMEN key event
  platform/x86: hp-wmi: normalize GPU thermal mode errors
  platform/x86: hp-wmi: report fan speed command failures

 drivers/platform/x86/hp/hp-wmi.c | 64 +++++++++++++++++++++-----------
 1 file changed, 43 insertions(+), 21 deletions(-)


base-commit: 2b3a5dabe89e330413af403246b648c1890f368f
