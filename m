Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637615;
	b=CwDsNSjw8nxosZx0O4QG5ZAxvL2TMmZsXB7xqCX114GDMkxD6B/UY1neB2LnstAVm3My
	 CMCqg/uCib/mwUOjZf1blVDlvPmDSPh4EHnrejAp4FtjBF2nh6vnJKhc5yjkz/x5sBwHV
	 +V8prUC2IK9bnZwZOjc3J/cN2g7ifxu91EMxr5VaSTRGnXOx1c/Or+fLmaLPbyC540+RQ
	 moYQdCQ0QOjOX6mW9JvgBOe25y7SysCenKpemwQC9Dacvjh+xFDzAh79wZ7syDbZPHywN
	 bXZXZzzxrbB0DGaOoSiwkIBNRjjF32fMUjTzMs8IJifGGM3AiQcxDbIEfgEj2ZfGKnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
	b=BsxxB4BkaffRl/H6hjPsTnuS8cJ92yUMDz83WBRobbAQJYnglZcHF7GC2KT+RmZUt7Sd
	 Eb0yKnrF46VhLpRWQJ+w0FMh1bGFiPcUhOSNOpMaAv6rTzdXAePl7OTfpt80nkwMUbYwP
	 wsPCElutb8ViocECk/getEmWJHhNTYj3HPZtdn7Gpm6qpurfxbPlDUBKxx6uMkM2wKWvU
	 jWgjdoJL7b8Vr1fE7Nm5KCyESW6+nIaJr/fIoDOo6nD1uc9l8wsZod2JzinXdNFajOCGe
	 IHDr0dDju6osftnIqmrCtUBHQ4HV2vB0kNgQVscAJbXCxdtbjXPKVfXyzIVtFkmKa2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLHfSk5r;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC0606A88F
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DC0606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VLHfSk5r
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso871792a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637614; x=1795242414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
        b=VLHfSk5r3zezAWag9cJkqsAK8egkEX2cdFSYA/LZTrWyWnEMcQdNqXtbzbPQq/cBFh
         FiMIdIhp+WBAxCTJikQGiUAFYcUCK5fVM0DFuKknI5KI8Ch1l4OytOo11HmKqW6T9+dD
         SSzefxz5zBO4CVsOSGjGP7Cgx5QOwhFZca6nC6yejBc1XgPIMpdfR/UYE4/HWnsD6HSs
         dhUYaPX71/dZTwCrc38YyoCQbFUvQNwFzRdYR6TbtRch2qX9qGjEJI+5veMb8BEAI+zF
         6DcCuiwcbYnW5FVcMf02tG6AZoR4ZxJCyUpNuZv1lYDbkTCTO4Ja1dsW/5za7SsPuNdo
         mGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637614; x=1795242414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxBLjEs863AOQJyjFQT8wZX0uAHa+N/y/eBxALEdB90=;
        b=NTQqTlh16eEVDWoAqcz4XeielFs15Q59vO1pLBMdW5BiqVkjaDaKOhYhLOhHpqMXFb
         mVZyrD7yGOBfXboDfpOajoDs17TIorztHIDbghaOEU/TDK6sTvHZhtUT9NrQ2TV1NaDq
         pM76yCyxPugGv02ptch5uEDrB7Y6BDXkwYH63r+vEv1TwAHzQv0T5i9Lvs2D4EPff5xE
         G/w4Cpa1GzhlCq+Rt/8TiAwDbty2FRuNtNDpVofXEb1zb5VaqC0DmME3SBPLgASehxK1
         SXBUmrQDxKVP2bD4+o30Fl5gIiuMpvtM80rxTDnZtu0rIE8DlJciq3eZ/M36AcvGAnXA
         RCfw==
X-Gm-Message-State: APuU4Z8p3MLd1ZXSbBw5HFwqG1pnbLNVGArpk7/xlw3A9pjbjAlb4oK3
	ARqVjiP5OeMDc7MVPzmjRgR3O1fPlbY/6r9KkGMl4ZwZii2K45Xrl8Uq
X-Gm-Gg: AYBFou2Nh7TN3oEwKuXq9hDC3tpeCKSp+LEOyA0cqtIvThVqD4QjQmYn630AUfWTVeR
	OmmIqvXiVEzX3kpztG2LSOzHOvx6YCzyloRPqmR/ZJ/+Fwbm+gg/j82Z/ZycX/fUkpurqMVmzdP
	woyXfrIe8/LeBVPhj2Tk/yt7yWZ3e4abGfL2mFNqMhsxbEIb55WtO5bYSDu9tDe6WmDsrNbYTXg
	Qm+gfMa5ocy+c5r7VtIBkw3Xxr0LE9J2f6O/Z5Si54/B9NWegqfqLSvM6zIN3qm6WBa1nzLs1Xa
	Tm9hOAnWU59lQcGzHzuIYDTJuKmugaNdjDns/B8dGsQ9258MUS4+2lx4fStML2xzRFtr3TGds++
	O5r6ejn90Qi/XKcGvKQRO9CWTvAbNqFmxtbonYnl4uF7n5opMOxwz2BdxQk9Ae6E4P1i5qvibno
	mvZkOPfSVme5u9uM1TOg1iMawb1AdtiVhcAwYbsGtYmJTAf04SmA394+nqvxHCf90MlBmwNFG9Y
	ze33J+J1pxifcXdvW6WRcypXoFL+u/EzdYNACfKgYvYz91o1bnC4zNVy9TAhCuZHclZKENwey9P
	7cfS+BSMwxc8U3h+cQfnlB2XKvzWlS4Tyh4eh2v3AlPqBO0hxWPsG3B0H/U9qRoI4VHh+Tew4Ca
	qjL5youGtnZyu32XajIsNQeNxgGu3USGioQTyrwnpXA7J5JQWQFEZRKSLGEpmcM1+ZU2LE693Xe
	kK/g==
X-Received: by 2002:a17:90b:1d03:b0:3ab:c80:9365 with SMTP id 98e67ed59e1d1-3b1b0b4cdf7mr4172862a91.42.1794637614509;
        Fri, 13 Nov 2026 22:26:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197b76ccesm12817446a91.0.2026.11.13.22.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:26:54 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Lyndon Sanche <lsanche@lyndeno.ca>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-pc: Read the AAC mode from cbRes3
Date: Fri, 13 Nov 2026 22:26:46 -0800
Message-ID: <4fa7525f8f8d4c85aff4ee7320e5b5a86e79cda8.1794633180.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

thermal_set_mode() keeps the current Active Acoustic Controller (AAC)
mode when changing the thermal mode, by reading it back with
thermal_get_acc_mode() and passing it in byte 1 of cbArg2. As
documented at the top of the driver, and as libsmbios'
smbios-thermal-ctl implements it, the current AAC mode is byte 2 of
cbRes3, which is output[2]. thermal_get_acc_mode() reads output[3]
(cbRes4) instead, so every profile change, including the one done at
probe to sync the mode, writes back an AAC mode taken from the wrong
register.

Read it from output[2].

Fixes: 996ad4129810 ("platform/x86: dell-pc: Implement platform_profile")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: switching between all four platform profiles works.
I did not independently verify the AAC value read back.

 drivers/platform/x86/dell/dell-pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-pc.c b/drivers/platform/x86/dell/dell-pc.c
index becdd9aaef29..3b2089e5cf6c 100644
--- a/drivers/platform/x86/dell/dell-pc.c
+++ b/drivers/platform/x86/dell/dell-pc.c
@@ -162,7 +162,7 @@ static int thermal_get_acc_mode(int *acc_mode)
 	ret = dell_send_request(&buffer, CLASS_INFO, SELECT_THERMAL_MANAGEMENT);
 	if (ret)
 		return ret;
-	*acc_mode = FIELD_GET(DELL_ACC_GET_FIELD, buffer.output[3]);
+	*acc_mode = FIELD_GET(DELL_ACC_GET_FIELD, buffer.output[2]);
 	return 0;
 }
 

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

