Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580726;
	b=j5JAjyG3EdX3wdY/S69eeewUaLUgTjxpEVb9lxDk2Gx+fTC7CaCFxgoShIjH7W8fYnw9
	 d19UMpw1SXtei3MGUAUN4Ghjlw8+UpqnV7K2kxACEAvHD5huCWJY6T9sLL9i6Rl8p01zj
	 pnZWFvnqZak/Ufh7Uh/R1o1Innc0YLDrVWZRkPEvKklIMBExF6IlemY09rOyEbu9L32Jc
	 /z6Hqyv5IPrOS1Np5OzXa3MxnFVPbOFWOnfkJ/GPHgWBhuogkdvRrghmcrowU1TqZHooM
	 JgYkZXZgUT1kCN6zk3RUjhZd/dBMtNzZa7+cDLk/geLPfaekRep2HB4gEBRsvNP6D/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
	b=pupP43+XTxSIFw0YzQmHmu6r7q5Cah8p+a7EdQ7nSq6SZ6W5P1Y7eusUW8bps+7th5MH
	 ZQTyxQWra6LQDXgA0f0LEC+zsoiSoQTh8HoolmNE9xfeeRjQFhXbY/Ae4Zf+JZXu36Bma
	 c5STKGJ4eoe6S8wlvW0UNHufA5xutOR8XRk+I7wmQc48AqSWkv6KBRSpBBDic7SPS9sRj
	 caAL2dP+7wfy5XMneJO3tMkj8JfMpIwkshKEoUsIbc5PhmBb7Ox5mxnxeyc+QhuBztmW+
	 OeXxJ/Fx3TBWYmAYtozFa+LW2PrKrjbE1kIuPLpgYfqDigqMNBspSs0+jVOWcxsJPcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+bwO0Yw;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205F606A88E
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 14:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4205F606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+bwO0Yw
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b7221c0f2cso2089580a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 06:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794580725; x=1795185525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
        b=i+bwO0YwHZSqJ/OWf2iNSXGIbyqr2rpBr/CULyfCzIOJnjMTIDzB5ToQY0j0CztL/2
         DdZg9Elp9IWS5Dp7dZpIC2Dc6S42UHUZRI6Hr+1HERjNC3YC3AA7/3ypHGnuY0WtTZwH
         Btl30lmFY+mOHVpm2Gi9T6rwSpUBt7Prf4KWapSWlJsspORZ0HYq/UQxRgq2U3mN9ESd
         GZ7b4c8onEagpGJYivd0serVF3MJCVfjTfa5Y8fX9OC9D7tesYGj4JACWIu8pjIUXBlG
         9LLRKeJ8u02+psgEao+Ash9ndndvC94ICGthRjHPgm+mcc2NTexbkR9t5zMG5OPfkpKn
         UMyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580725; x=1795185525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRWBGtqrZPXx8x92wU4vc4uRLqmLqWYndUt9UqAkaxw=;
        b=T5FLTBQ76FsqGEVCMHd50KjnNiFQy8d7SWoh/7QV5V3TD2K9ot+qPISQzHN4/enTld
         VC9eYyhkJEJ2OrBU2JbzLaQZr4N0xJIR1PlWqJflACitcHSdBoDOcBTwsJGDUo7T+YZ6
         C+FHjuMrAfJ0I6gQvWjVWA/7NSsaq0fCQ+oCrfbMt9+uAPcBTTK9kAAFLxy0c9yCGq7x
         WxS/GeKswugFaX2H/TLZ1U6XzCfXb8qd8Qgc5zrJ8MXaXDeJW1B30+YI40WJ21buJJlV
         tatp+nTh7Fn/ETTbXfD/yZu3orPn2EPv5xHKq1T5PQq3E09Pv4GFYh0Lj6fjXPKHVNOs
         Zmtw==
X-Gm-Message-State: APuU4Z+kvX1L6IXOOIolpUj0yEIFXpQVlqajhJrl61bwi4EUozk8zCbz
	yV3NJgExNt1aPhXcCc/8/ySGCp8C0BxVhgHRQAlYsXgVogXidM+UQVqV
X-Gm-Gg: AYBFou30IbQ+rna6EVrhDg5b4K2dw3G0Djl8AxEKibsYZtGyuCwyEWOwwA7DHfXkzdf
	CzbIyE80IF5oOuBbCWRz4+KrHJEBO+V0rNk6OOVITERaXTH9hlgP3WHJBSX5p1cYECEFjUQLFjc
	s3vJXAcGwztJ+O7DMXHuo33AdIdtYEbpxOX84WtRhF1Pu1nBTebbhJfDjLE9VU9OVrXH9wsvNEJ
	CRX+D60kp8X1kbcOipG4kYeXXgSP4hIGRExooPgyS5e+BLdzA1vtRLHfIs6eL+yNtqDkSwvBvy6
	o3z2r1qaKAZOGqi25HiLU5dQVm/T/Q6WXr3No3QJ8er+DNrMTMJcku6p45atdLNvqi2J08ivF5+
	GQTRdPj+qiGlrS8S1xPYkWVVZQwEfX+YXqyn34V+a3mgeFM8x6Ewbf6TY0GzWmk7LV+DKIA0TGx
	OsuCCdPyMU7CCXFAWOUUaU0lgeWs2klIBCulgKZzdgeGxZLUkoGL1uXxgbaECaQwSgus5ciGU0k
	NfZvzbWOZskmflFSFPoq3b2K7YbeRYzqWcQEMckf7ZzRBGnMWmLqBOAfMmffGj4nCVwpQeznoxM
	mPPK8evTcNYDmrOAtuMGHWDcfDsnnwSAAXbsk3/yxQ==
X-Received: by 2002:a05:6402:2350:b0:6b5:76fb:98d6 with SMTP id 4fb4d7f45d1cf-6b7c0bad1e1mr2454194a12.21.1794580724343;
        Fri, 13 Nov 2026 06:38:44 -0800 (PST)
Received: from fedora ([194.36.27.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5cc4sm1091364a12.3.2026.11.13.06.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:38:43 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: eric.piel@tremplin-utc.net,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH] hp_accel: add support for HP Pavilion Gaming Laptop
Date: Fri, 13 Nov 2026 17:38:35 +0300
Message-ID: <20261113143835.143209-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Accelerometer in that laptop uses inverted X axes.

Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/platform/x86/hp/hp_accel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp/hp_accel.c
index 40e1b9fb1b6d..46ae98deb919 100644
--- a/drivers/platform/x86/hp/hp_accel.c
+++ b/drivers/platform/x86/hp/hp_accel.c
@@ -233,6 +233,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
 	AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
 	AXIS_DMI_MATCH("HPZBook17G5", "HP ZBook 17 G5", x_inverted),
 	AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
+	AXIS_DMI_MATCH("HPPavilion15ec", "HP Pavilion Gaming Laptop 15-ec1xxx", x_inverted),
 	{ NULL, }
 /* Laptop models without axis info (yet):
  * "NC6910" "HP Compaq 6910"
-- 
2.56.0

