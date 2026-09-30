Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FB0327C08
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 01:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733281; cv=none; b=E1Uqdrki3lLL9PDWkbIYghpAlr4v1wf7PJVk7rROY/ABM7BN4NB6RzWzHmh5iEF7ZMYLwsGHZEurvx5zdCb1hyxcaZyCUEN6W8UK6pGNqKb+6/hVj/SL5aat0RZ2K9yWs5k306Ckur+cPqG6J3M8B5kf+puGJmpPGq0AeA58w28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733281; c=relaxed/simple;
	bh=22EAsRtIugCfhz8Or01nJdxLPEtPClXMezlZkuUu8nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nxi2My6o2jFEUbnvT2iIU+ByBBJnjd4mPs4KTsHi6qsZ8XxqgYqSfmbwVyiEE5b5Hi7J+HC/lltJDboyHc8/9+JnltQxusRaHa0MXjE2AsFYnhpoCoKe8/X3dsMVrsk+G7bhXreG/TX0674K2tNpP9Z0BA6YdzmLmlnOm/dKxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMwvgBIH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMwvgBIH"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso7206941fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 18:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733278; x=1791338078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89ZecEDPkVxdgfsZnGb4glnfiTdHK0W7K/z1VS8tLk0=;
        b=jMwvgBIHDI7N2ckgImodf/JjyRvyjVqsJNmQALqdLPva55m/2Kk2L+86/bo1TZLOhJ
         UbDdKR8n3iki4El2hQrAWxjsuU785sfBICUzR6GvoWzctD5/ZrWhVkjC9g+I4OBodzMh
         Mrkqdn2qGH+SRxywjEGqBiYgnUjGu3FGdJPiFZzTZ1Zx5yGXPERFdi6lYVmddE8zkh7a
         /hj5D9JOqvw/LS6Mr4N2zZz6G8HtNd0mCqrAno6ciE/5l649uHzQ/L0jT7RrWvF/cUk8
         IcxvLsEbkUmCR5EU0cHcO4SfoOtJKKk9htqzJAUjzygTO7zCPPF0kIrzQ1zbLc/Q5yOa
         NddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733278; x=1791338078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89ZecEDPkVxdgfsZnGb4glnfiTdHK0W7K/z1VS8tLk0=;
        b=IGVrNOaxXcFzDv578didZ/nn+Yu/ezycc1oQ2Bif2uya2FPRvO/FaiJVKUp/T3xsVn
         SeaTJfw6UGVuEKWlmrTYBn712EdO2UAtFvUOKfZYg1AGCmidi4FNZDJLIv2NfAr+kkix
         GKhmbNFYZp/7cQwr0HvXfTN+Gm4IoafBEcU7dhPA2Q3nLdyuL+CqVHjwQcAvWoOmcyDi
         273POmg51UiOGcmSxl2det3zW4emmLZKCCN+n0+mp287gR3Bur8gSVDJ2kRROEOjLRrs
         ottcuxzbzdVQiosa21nyoIHqKqoDY/12sIfANw7aMC1r+dgGD2PF3PLL8zjDNF4GTd4B
         IgcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaj30kjHDHzYXBzA1MiokjpzU26HddfZmnopcjmKXnKzo96yKAeLvAeAWkT9AJH2/YYNv/BJ2doyVK5MsCGTVH+Kzo@vger.kernel.org
X-Gm-Message-State: AFq9FYK/dstYqNeF3V/yu8VPJ3QY42hDZXC6ZNliWo0JiQ9TYMR/64iH
	ugUUiZcZ3VEYoag2r4JXIpYG2hvZxzINyVlaNV71Lp/D2Yyix/NW2g5/
X-Gm-Gg: AYBFou2xbXRT7AAuhCvfDrAL97AhK5dAkQYvONzES6UEzNsP7ty0WrnoA91T5iwv7V5
	9BjozH2RpckCM6mx3T1LIF+4vVGE64a8XjE7d3Sj+BE4XXRe+g+C/DfCMwAtPJilcv3A01kml3L
	PtLEjXs/4/WSspnBrqR8Wz0Uor1K5e0PLAiMPLvibdk0uQhPtJWSVWBN5QMC2SAxBXxe+zXj8a4
	l4cvJYcxk6KI5rkayP6UdRCj4p85B2dZnJMC1E4huGfTyNFsxLBtMNCsy6Zy4hqPri3dTKTQvia
	0LNZFEBZ8VMKXBFJL6WjyBzij5yUKdN0jtCTerkKjbx+W8vUulgi4EwSYm8WX2ZV61yMir5y99D
	wnWElqcl6oYbZvzrTZiaewaTkkTDexqVwf2ngDAaqTF7wIB+MXn+2Gv+DtB11rHTgjgpQnl2pB5
	fpXXeLN7GIzsUwUqycvu3OB1r6seszc3w+Hepm4AQ58JFmo7fyERWaMi0vDnXaas8q0WGZorhH5
	lTWZQwOFwDswfbxIUI+AU00Yfp+VnPas5bgK/z8MUDDq65KCfWVNsBKAXeuANK/g16A
X-Received: by 2002:a2e:a902:0:b0:3a7:635c:d56c with SMTP id 38308e7fff4ca-3a7791d7277mr62711fa.7.1790733278024;
        Tue, 29 Sep 2026 18:54:38 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b867f6asm347507e87.75.2026.09.29.18.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:54:37 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: W_Armin@gmx.de,
	martiya.ar@gmail.com,
	platform-driver-x86@vger.kernel.org
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Subject: Re: [BUG] Redmi Book Pro 16 2024 platform_profile write fails on Linux 7.1.7
Date: Wed, 30 Sep 2026 04:54:36 +0300
Message-ID: <20260930015436.3095516-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3b58a0ae-f050-4dd5-80f6-bf2cdfc20318@gmx.de>
References: <CAM-sYPpgNU+tmfHKWg0KHfVF8f-K8oaNvfYwj-vaUGsEvf1tjg@mail.gmail.com> <3b58a0ae-f050-4dd5-80f6-bf2cdfc20318@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin,

I have the same machine as Martiya (Redmi Book Pro 16 2024, DMI
XIAOMI / TM2309, BIOS RMAMT6B0P0B0B, which is the latest BIOS Xiaomi
publishes for this model). In case it is useful to have it on the list,
here is its full acpidump (all tables, acpidump -o):

  https://bugzilla.kernel.org/attachment.cgi?id=310971

What the tables say about the Mifs interface on this BIOS, and what I
verified on the machine:

- The method is \_SB.PC00.WMID.WMAA, in the SSDT with OEM Table ID
  XMCC1806. It implements only command 0x08 (GET and SET), 0x0a
  subcommand 5, and 0x10 (GET subcommands 1-3, SET subcommand 2 only).
  Other command IDs answer 0xE000, including WMI_FN_SYSTEM_AC_TYPE,
  which your "Treat WMI_FN_SYSTEM_AC_TYPE as optional" patch now
  handles; unhandled subcommands mostly return status 0.

- The SET branches set only the return code and leave the function id
  at 0; only the GET branches fill it in. So on this BIOS "Detect failed
  function calls" reports every SET as failed with -ENOMSG, although the
  firmware applies it -- the same as Chris reported for the Xiaomi Book
  Pro 14 in "Only check the function id of GET responses". Verified with
  the for-next driver built for 7.2.7: every profile write failed with
  -ENOMSG while the EC mode changed; with Chris's patch on top, all of
  them succeed.

- The mode values are not the Bitland ones. SET of 0x08 stores the value
  in the EC register QFAN as is, and NTDP in the DSDT maps QFAN to the
  DPTF variable \_SB.ODV1: 0/1 balanced (ODV1 0), 2 quiet (2), 3
  performance/Turbo (1), 4 full speed/Geek (4). With your two patches
  the AC type check now passes on AC, and the value "performance" writes
  (3) happens to be Turbo here; "balanced-performance" writes 1, which is
  balanced, and after Fn+K to balanced (QFAN 1) platform_profile reads
  back balanced-performance. On battery performance is still refused by
  power_supply_is_system_supplied(), although the firmware accepts Turbo
  there.

- Command 0x10 is the battery interface on this firmware (subcommand 2
  is the 80 % charge protection), which makes the existing kb_mode
  attribute dangerous: writing "fixed" to it turns charge protection off.
  Verified on the machine.

I have put the details, including the test results, in a reply to
[PATCH v6 5/5] of the redmi-wmi merge series, since that is where the
per-machine table is being discussed. I am happy to test patches on
this model.

Thanks,
Anton Karasev
