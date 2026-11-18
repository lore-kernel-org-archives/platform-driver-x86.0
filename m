Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975964;
	b=OimY8gyQ/NjbjQykOSJKnq0tWGBbHrHoMTu5MA0m0dDfZ4dRQwbS2tGZxD4IUpsmRFYt
	 cbLrpxJ2Eu7tVbzO6mTJ8wxY3crr6zMc5sLoOzRbHiuSmFztbGzQ3QJ3JxaYeAvpGceCb
	 Oe4qA5w1tBpsDm0G5ZeQcNFo1XsfSHn+3i/VQkoKLd1F9YdzIQXxyvPtAjzkKeFqAlLi/
	 WvQGp8v134mP/ytRqH4Y7+DKTGuchv8BeMSVD0CGldd/TdDK/hMzrGbbq6ohov9zNQgTi
	 0TDKUDoXfgYUgSQgPuTJOYotag/cVZjsz12tWyUUvuh+yZTZie5PrEYpJzAx2gxr4+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kC5P7rvn0fFLIbqgLvQsvXwjFBSzBtI9wgZf2LZRhW0=;
	b=TJYTZSatjaz8olU2D/+Lv8V6niEQt1H7iZecBzXcZX7Zeylh9TtVagNrzTOwFA+EN/SW
	 ahs9anEHlay2RxygEGFvKqTNxhbY0ssIVxJPJmDNLzaXaawB9+xNIc6PBXz33MxO99vMM
	 wr/2zYfH0oug4tz82xzpT/HZ/+2SZXxtJgcEHilPcCgfxII83w8xmaLcNwGqJKx68BLT8
	 4Tz/+9qtVyZjt6HeHMojN5wiSY4cvEZpxzEekDlEOZ67zTTej8f0Asms+4pD8Apwl0OVP
	 Qw36VPDUYX59VYuvqrOtN271oXH4U6n8RqrFb6VhnhOzDG86oex2LUcsVglMmk9eM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbf44uQP;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B87606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06B87606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jbf44uQP
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ee1b65fdbcso2204065ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975963; x=1795580763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC5P7rvn0fFLIbqgLvQsvXwjFBSzBtI9wgZf2LZRhW0=;
        b=jbf44uQP91l4pwemg5+3ZealOmOHY88a8eJokazItuTspHunjIrdy35iZgo0tnlZhG
         2Tfn/asvq577FzS+8Xb9/ivnJBhKKwImMgB2bcGXr2H2VFFt+VSRUnLr1ETwQXcrV6kx
         9F/9bzUx8PD9nUq1JnjmtkaVM8rgCtSRtl00gt2B6hWEWzrjBPsoZ9CPmmhLd3yhqgX1
         /6e8bnnnKXuGEkinv5gAQ7t1zqaC6ZQRicmcP2m3+CGZuMFH+SsaTEQcfwQypBiWfLAh
         qEMeO89r/VfHkSz6pxAq5EtDEUnAhGjNvR/butnjdRITH1kHZK0+RUtyagOK07dPOC/q
         7b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975963; x=1795580763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kC5P7rvn0fFLIbqgLvQsvXwjFBSzBtI9wgZf2LZRhW0=;
        b=Mzfj74wBSYb4nEHWb8TPoPYs5eNlr7DxRTcQ7PgMxutVbe7ndXTct/YsQTrIkrqkvG
         eH9s+1BgQy/7sML7J0TdgItaFSuUaPvGv9X3ikxqtOf+/OS2M1nr46pK4Vjgo6S2ohTU
         +ngpabMNfgoqnMhLMTE3eJOsKC3Y8EiuOBswwfSCpdR0KO0S2fVfJxq8QU6/ViNMuZXH
         vIP1F+4VgMbk+ph/mS1OsMczmz+UDy+SGMSYXvm53qoU0OObS9ni9YwLvjo4Pjy9Dhvk
         uERjY2t+HPegqUKFr8swOZvGaaxCkBx3rbw9qiXdrSCSnaIvv54HVQO5uwf+GxHcFZXJ
         HsDQ==
X-Gm-Message-State: APuU4Z9y9yoNu3NA9oWaodXGrAXxj5vVbmYDMlyioznfkNaP3K5uH7tw
	pvyaDoFESUYI7vbUTe7oPTfANT5FeCR7xOYwLWtQFsfYXKF8BPxmFER6
X-Gm-Gg: AZFdTZfC5uJPTlqt7Ay6SXdZSVQit5WXHa82g1t+hyaKaMbWZPD1saCJRnW2cpcr4y1
	kUtrPGA3HLIw/5vEVUo2+7UQkDyQk54x5C1Y7Ic1dZfkaqGv10ExTgCsd+DhUowok3pbb1Mq1OC
	GZcMNut0NpjLYVotx6GjJYxZHhFCtGgm9KgZwgWh7Rdxxc+T7Sbf6SWIzwrFMKgGslN676EViZL
	sMlOwY6zlQ5zAMqckdIQkHHPNVfaiaYt829iAYzvmrCIiXtinylvkUsoXVLOvZYtFLiW/z7Qjwk
	H0253uQG361fHNHhF7PmyF2JvqMXbdj92yq/HFlJBNh5WuS9DXKmeoSETFrR7CWhuMx7rmKUJbh
	SrUPEXmnocrnKUovvFqK3A9fWL/q9ltkqwoy+gFSt0RXKGQ7VygAOc6AywJYyOePjKCsrM8Fm3J
	/JCCkB9kxvZAFDuVYnGEHEXnDdO8dWopIX7mQKLmaf8azBSL9QLNA2mbPR+m5JXJBFdltFq0Nml
	Tbn+oipPvurvhTRF9j9+LHHb4W8fpHJ1iGqfOqtpy8h/5UIDqvmM5KM4ilk3U4jfLWAGB8ekYhT
	7cf9pqJITv83CSg+oY8KY4xiGsAlgWvDuAKRHbolqxwYlEFYgzPUPS43uTAUQTib5AFNRQ9h34r
	oiBeO/IapxmKi0GszQFIBJUNUvt7Qc4Mfoqs07sDvvnl0SsmIfjWbqN76XPdBJgMtcK95hJBP7L
	yfMA==
X-Received: by 2002:a17:903:1a2f:b0:2ed:146c:cbad with SMTP id d9443c01a7336-2eff752971bmr15172075ad.19.1794975963458;
        Tue, 17 Nov 2026 20:26:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:26:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 16/16] platform/x86: dell-smbios: Drop smbios_mutex from module exit
Date: Tue, 17 Nov 2026 20:25:38 -0800
Message-ID: <fd6eb45ba3e44be83b19ad08df70a891d2913777.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

smbios_mutex protects the list of dispatcher backends. By the time
dell_smbios_exit() tears down the token sysfs group and frees the
tokens, both backends are unregistered and no module that uses
dell-smbios is loaded, so there is nothing to protect.

No functional change.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 8770f2e22442..7e399dbb106e 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -683,7 +683,6 @@ static void __exit dell_smbios_exit(void)
 {
 	exit_dell_smbios_wmi();
 	exit_dell_smbios_smm();
-	mutex_lock(&smbios_mutex);
 	if (platform_device) {
 		if (da_tokens)
 			free_group(platform_device);
@@ -691,7 +690,6 @@ static void __exit dell_smbios_exit(void)
 		platform_driver_unregister(&platform_driver);
 	}
 	kfree(da_tokens);
-	mutex_unlock(&smbios_mutex);
 }
 
 module_init(dell_smbios_init);
-- 
2.56.1

