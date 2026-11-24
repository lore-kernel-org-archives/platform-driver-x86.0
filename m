Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504421;
	b=rRNLQD3PzP5tNu/2dt1lCgq/GVtpwHKxed66kP0/aFx38+U8RhbZogNVze+Qs/3FE+6p
	 efYzfYncmPUitKxgKxFq5Pi0OEro6Z156NhZMHggaNAJu9fjmngtj47yc3fBCKBm2f4lU
	 FRHGR4K/+HUDYyF8aQfYG6OiXYxQ6+0HBPHA/x5MzgMpyZxFUi08bm47+Y0gvzRV+BBvq
	 eVVIkjp2aOR1N+o5qkoJtOVni7dLjyOd5Rphjkg1+MhJMUwXqBHqw4iLfFFGUaAy4q3jC
	 BkTccwcI/KCkFByhHk3AF2ISOPFv4r1NlqCr4PgPjj+/o4s5aean3QmhvnqaUleRMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
	b=1quf/P7TMJx3UaGBIX8fwHe37/ZXmQlKtPaUE5B/R3XmK/6LqSkStTZprx5G4OBid8Xc
	 2h298UBnprayL9nGVo8svSAN+Ta7bJ6fZUtFOtAfkNTSZrDx3qvhWkEzU9RaA/558uau1
	 K+hmpAFMBlLB33sDy+f0FzCDuUFCswfFGZiqsqAI0x/qSznn5QP9b9q0di/8RsEqW20A7
	 GOsX/OVANDmHlTPq+5B1y0CI4GZSrpvH3npBmKCJzUoyuynY0cfIz8fHfHK52JDWAWRUq
	 QVWXbmrXmI+xQOvoUkxDSfwMtQ0ihhJgxmLFx7s68VpDv3piEBw4sOyM8bw1pAykQ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kalp+CyM;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF8606A330
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 07:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30FF8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kalp+CyM
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso1702546a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 23:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504420; x=1796109220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
        b=kalp+CyMZbk28V1CAWfask1PI+LtBLcDCm4Taq1wYbpn9GWr9UDoi/PKaFFdrz9fqI
         M/1I3aP4arxnk3vBp8XZRna+NRwcu95K0CtVPZU1fYQBc9Kx6Nt8Rsx54EN+3wJobgn2
         NDVnUxxNTYdeJlkqO8Rd8eRy5rKmD/NMVBwVgdaDTp67kTC6E4RI3epMT0k6DlNFVr4Z
         SW5YaABGBZyHs+i4+85oArUoasC/UTUoF8W6kNfKLL+6zefwFrQcmdTHiZvLg5/s34rW
         9fWRdLzt/FVzakR0CiJUVRgX7w/uxE5qn0mRCCIia0tYeAFiEQG3HHzB+mODn1eK/5T9
         3JtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504420; x=1796109220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc2Ja2JUG5wbQDezjA0JUnZUWQF9I7pDq5BAs+s6d6I=;
        b=SziT2mgwUg9zdZEAURNK1uVFYzGYkyaNK9chMyaXfQpivHphf08PWANuUUw+NFEAc+
         n4G8RW84EmYPlV+Fi8jL9kA9ooZWrPYfhgoaMe9lJnQL6hZ8vYHi3Y6/ftRthhAdWpsf
         sl4olz+FJunhcIKouwHV5pHZwNjxMlvu7g+ReUDQZBg5snAIcFrYPWv25Z5bmGA3ou/7
         VqXq3hPGHl9M1W6XkciG1yWSazl1ypKp18PtXQUXmj48OyapvvlT0U2VmZkZmkxpJB0C
         eeAy7FF4X+PXHKzHSWxzyx+TUBBsOVGgFnrdTH2pzICcDE65vnnezffWDEQ+jKA500F8
         mY+w==
X-Forwarded-Encrypted: i=1; AL+hErHNhO+KYpMFQlYmu5TRYou4D3/iiugzyr//CvPfznewuLfRM5nuo3q49OQrFuoGu/z/h+h4SRtgDuQ83uoJC0JPl84U@vger.kernel.org
X-Gm-Message-State: APuU4Z9Lx9YV57vqn3EXEIqkV9b20nEpEU1kANIgDSLtMZoVS/l3Kpyx
	HsZTrkroDX+b1LRw9H4ndphRI+XF0Vh/uAPUyxCWZzKMmFDnu+zWJ6la
X-Gm-Gg: AZFdTZfDsBOdq6++iLwzDkr43W3Al+Fu/ss6Iga0RtKbThwByD9lFJ3VJpBTX4HH7rS
	ZePo9/sCf8dXNNPGSO4Ssmf+/PvpejbhqyArAHTU9x5v/LuEQhHRSNjUjyJF4OpQLPl3Kx/PAOh
	CB2FpEyu+SfAFhdVvVgw22mlulJ6DxSkXefutycTtRSFpSMAcj5OZtrSjAd+iGj3FerhhN9iS4Z
	zomINJWmG/TclGcFlsaLjgC6Pgi6z+6IqVtV6XTgdP0NbWk0M5QjLrysY/z4q3BEs6xsJ6fc8f+
	40DYrwmxmHtNPYGlBt7IRaqjkC20vHG2IiJmykir2yAhKA504ah/rCevo6UtZ7bXSFlboZY4sWY
	r3+36b4a+52D7mTqUSLO4HhPoDniUgvWeqDBSUqNUt3rhcsEqKWS7DrTVmLLk8/4KNV/FaRqCdO
	Db9Sw8ukUy7tfqIDOh0VmLgdTxZu06ScXbsubQ3lMrP+uBGOx2SOz2Ku6Fy0pe5pNsmdvy4Z/kC
	cBkKZnSbcO8HFjHBYFaQnQOjL0trnliECiFNuJLGSMNrntSmhqCa9EH2LGbo9lKISB7qJZTFz+r
	SakoUGrsBCwyYtKay4U/
X-Received: by 2002:a17:90b:17cd:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b41c95b6bcmr12189973a91.43.1795504420433;
        Mon, 23 Nov 2026 23:13:40 -0800 (PST)
Received: from fedora ([103.156.164.95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1276c5sm68236315ad.67.2026.11.23.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:13:39 -0800 (PST)
From: Mulky Fauzan <qapkyy3@gmail.com>
To: qapkyy3@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	jlee@suse.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: acer-wmi: Add support for Acer Nitro ANV16-71
Date: Tue, 24 Nov 2026 14:12:58 +0700
Message-ID: <20261124071258.31780-1-qapkyy3@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123155520.121595-1-qapkyy3@gmail.com>
References: <20261123155520.121595-1-qapkyy3@gmail.com>
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

Hi,

I did some additional testing of this patch on an Acer Nitro
ANV16-71 (BIOS v1.09) running Fedora with Linux
7.3.4-300.fc45.x86_64, with the patched acer-wmi built as an
out-of-tree module. This is in addition to my earlier testing on
7.4-rc4. I verified the exposed interfaces down to the WMI and EC
register level.

DMI and driver load:
 - The DMI product name matches "Nitro ANV16-71" and acer-wmi loads
   without any ACPI/WMI errors.

Hardware monitoring and manual PWM fan control:
 - CPU (fan1_input) and GPU (fan2_input) speeds are reported correctly.
 - Manual control (pwm1_enable=1 / pwm2_enable=1) works independently
   for both fans and returns to automatic control with =2.

Platform profiles (WMI and EC verification):
 - All five profiles (low-power, quiet, balanced,
   balanced-performance, performance) are accepted by the firmware via
   WMI method 22 (SetGamingMiscSetting, index 0x0b) with status 0x00,
   including performance (turbo). WMI calls were traced with bpftrace.
 - Reading the EC (read-only, via ec_sys), the thermal profile
   register 0x2C updates consistently:
     quiet                -> 0x00
     balanced             -> 0x01
     balanced-performance -> 0x04
     performance          -> 0x05
     low-power            -> 0x06

Tested-by: Mulky Fauzan <qapkyy3@gmail.com>

Thanks,
Mulky Fauzan
