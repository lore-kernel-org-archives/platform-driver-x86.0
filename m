Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795571452;
	b=Wdu8k/ayzNDTX43YUXpu3mQsaPETl+Kqku+c1sdr/jaYtA17lHgD6ptAnaYwogWHxxwo
	 koGdx8NVD6vlCx9741AxpUq+mi0YSl6SuS3fKkxznuDRO82CUhJr5HyAqPqzhNj1MblyI
	 hhWXN5ObVEZIKeX0wi9YylMY7F8P4hT7LHQQzFaA4RF/NfLCtekqIzxwKxweAFNbWV7uw
	 2WoMTuGkrxLPXi+nSgwMGmxWBONy9ixa5bmzF7ryp2lrfPtxgdpbIGwDNdAFj+5y9oPTh
	 BnpLL/j7mPiwTWeoYRglD/k7rCj2CLfFZE09bqtoIgxrmb341baal7O8OxId4NsfI5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
	b=VMXe+5UNCiDE8xJL+/wn+h7F1Dt2mZxDt5mh0ImGvxhOUld4fJBtb3Jvyan9RZR4ET5P
	 6B47Xdc1X4OqQdD72FDltraJOA1csNs9BiH8dyQlrrpP54msjyjfoa9ETeGNl+rcCfyyz
	 Azp0qwxIbBNO3l+tOY1niq6cTUKLaQqKPgYF6nKIkX6hVsXaagKi4qrGv5Rf/s+BXpW8l
	 HXT2tJyoANhZJnVSRl9Fr+5cOuh00gsp0QXOLb5N0y78qELB+FgWHdWK4jQFZg9lo9RZC
	 V4fbmR4wP1kZudabUSDzJ6IFM7FTy94gktjJjbdRHPnLKRhsm8kXcBgTuR27HfX3C4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLWEAXV7;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC0606A31E
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 01:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36FC0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nLWEAXV7
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so2460164c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 17:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795571451; x=1796176251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
        b=nLWEAXV7HwfQBgkKbWyEqPROWngeUh7Z9dnSIcRJLqz3TMCVmwxNwlyrVU4z4tVfY8
         sTV09JeSfyI25AuDZpdxdMJO+scIi4dVp7UDl8G2crgEekzODaMg7E0fh/zAzynHOFO/
         Ec3ylglXtFSaHnr3j9209/RyJBzfw3ZY+3Y6m5BT2TNJV+p+rfhsvkCwK9of1dLEVFcX
         fIae/lNcgzivVcD+CfSz01n2aYGBMN93YhJe/jbD/cDv0J1qHxa+EiO63E5mcPSHn8a0
         RHAK1xhmfBxl8CwDGmGbEzsWJyiCGYBmEZ8YshJLM1Q8y2emkHvVhhHFli9IP4QVmE/W
         ETuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795571451; x=1796176251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g6ajiaLX79xZ2pP8/AqPpiIp3ujXvfjF+l+DxCu09WU=;
        b=fLM1w0+Q3MvY5P0poCpMfsToLlNvxyQR4Jssj23D39u6vVYt6uwYMAqHuy+LxI0Fmi
         0LmLErt+N/OWEPuugULpQqoMsUMV6+RHa3bL8wvodGWgJ4F2U15yH3e2Iyk8j/cdrcL5
         FCvEwCF6rG5B6lJSfW5a3SM56jlpeTdHW2prUiN/sbxbm15vPQLnP+VFR7ucNO90bzuw
         zdsbXks5aRpJOWqNsHirhb35qzDIaCLEY1ODFqbKvOQVMGNoJ9glPiNw4nkTG2PN4cua
         +7bo42dEVbhTyJuRyp0FFALk1AKa+GbPacFYCy9fWGD5z3pZyyAibCwp0TJra7bEVNNV
         EJww==
X-Forwarded-Encrypted: i=1; AL+hErGHGxLwYZhqlKlhnAyXEg+Ab0dYrS+4Z7fJ8eZrawAJPxz63W46rGTkZ93iRwH1YmFWSrJFDX2JIlIAN5QdFTgWznCM@vger.kernel.org
X-Gm-Message-State: APuU4Z87yq9jkiDFnhk0qRJ0gkvWcJZ8031e3t6CrEUwz0/Ylxez5uZA
	laXnzB91lOnh60zaj9FdsPLOMhXGaS2/Y/PcOW1aSh05DYK3OD+LuzO/
X-Gm-Gg: AZFdTZfDgA+PRQCswzXO+HycEpMeAYtd0LfNA+LR40NKNnPdRIDM0Sxc4s8dSdsQn4h
	Pj/P8DucvsRW/S5xs9OquXUJ8/BFM1nj95Z+RNdLxIG7togY3B0frk1ydKqpgcF9lJcMNgDRGpf
	B2nCzbxToVL7kYJBOwMIncugJT8WqYOGHL57PBfSdhua2p1q4WOCN5OYrbIxvijnbi1xsUrR+rI
	d5nfquNERc7bUK8NB47np73D/n+sOj5yFmcbLa0+NluieaYWYBh3/i1C9tw6XieZYKTM1OJO4c+
	yZ11u1Xa46Stdr+LZdziXoKux6QJ7Qt1+6Rm0J7xAgVIW+K6h9IkUr/YWLaBcQZG/H23nReYaWh
	SNySxLimWs3HNf9iNFvPB5j3kjFzjemsQ+X72teB0ddT36kI+fdNHz26ByWc2IHqcIxQm2U0/lO
	JEMVztVqDkYQ3nzpkfF6Rtpstsp6EMvqu2wFUiWUG4jN8xF1bZxnWorO2oqF5YasyPIJfFPlb4h
	YDHHAdLvx2jmReS6rqK5cr0RzVuieMqigwrLobGmecKlSBIQGCdl5X2E0yPEAcnAxzxnToYOCDI
	cb/3pEO57BlmIw==
X-Received: by 2002:a05:7022:2207:b0:166:b307:5855 with SMTP id a92af1059eb24-1b556688160mr23952392c88.0.1795571451130;
        Tue, 24 Nov 2026 17:50:51 -0800 (PST)
Received: from arch ([2605:52c0:1:507:9873:d4ff:fe61:a965])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm43061705c88.5.2026.11.24.17.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:50:50 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/5] platform/x86: huawei-wmi: expose native firmware power profiles
Date: Wed, 25 Nov 2026 09:50:46 +0800
Message-ID: <20261125015046.23870-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
References: <4F34E5193B4633F6+20261124172651.37716-1-12313607@mail.sustech.edu.cn>
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

Hi Fuwei,

I retested RFC v3 (all 5 patches) on the same HONOR MagicBook Pro 14
(2025, Mainland China SKU C233, DMI: HONOR / FMB-P, Core Ultra 5 225H,
BIOS 1.16, Arch Linux 7.3.5-arch1-1, power-profiles-daemon 0.30). All
five patches applied cleanly to v7.3's drivers/platform/x86/huawei-wmi.c
and built with W=1 without warnings.

Results:
- WMI bus binding: huawei-wmi-method bound ABBC0F5B-...-5 and
  huawei-wmi-events bound ABBC0F5C-...-6 while keeping
  /sys/devices/platform/huawei-wmi intact.
- Capability probe found \GTUB/\STUB and registered platform_profile
  ("balanced performance") without changing the active mode (stayed
  performance / GTUB=1).
- Sysfs writes, powerprofilesctl (performance, balanced, power-saver),
  and Fn+P updated platform_profile, ppd 0.30, GTUB, and INTC1042:00
  odvp1/odvp2 cleanly, with no "Unknown key pressed" logs for
  0x02a0/0x02a1/0x02a6.
- Pure AC unplug from performance (without pressing Fn+P afterward)
  updated the cached platform_profile, ppd, GTUB, and ODVP to balanced,
  so FMB-P emits 0x2a0 on unplug and the cache does not go stale here.
- Writing "performance" on battery returned 0 in 0.4 ms (cached
  performance, GTUB=1), and by 51.0 ms 0x2a6 triggered the sync back
  to balanced (GTUB=0), with ppd following within 0.5 s and no warnings.
- Existing features (battery thresholds 70/90, fn_lock_state, micmute
  LED, debugfs call) and module unload/reload were clean.

Note: Gemini helped with the test scripts and
drafting this report; I performed the physical steps on the machine and
verified the results.

Tested-by: Zheng Shuyang <yhshzh0@gmail.com> # HONOR MagicBook Pro 14 (FMB-P), BIOS 1.16

Thanks,
Zheng Shuyang
