Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB76353A9E
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967734; cv=none; b=hecK++9XX0zpH3c0ssAs8Geqt5deckSiQB67Z3lYYyGnvekpOdneisr9hcO162yR0BVoanI7rkm/IyjNNaa0mW5FwZXqJrf2FoVlRBKXZyD1W33em9PihMq61DW9CSTsQqruZWTz4WiMzMSMhv6XzE1iOkmoXDtOoqlhJW/Zq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967734; c=relaxed/simple;
	bh=1nvoc3prO7MC5cWrITaRX5Z2IKkcfguUYoYngS3HgaQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:Subject:From:Content-Type; b=dsIkx1ZYTX+Rjo45Dj8oiuWzzYx/WhPWBkvUuvwMSdPG356KNn4RMdrI2fcJySn2ibaQDa8Dw2I+hGZXiD26xytLDkJ1VJwp4dkAdn5FSkIoQwtCuGZNSofJNeJWwEktqVL62hvI8HLIUicgZOYFNyiU/6XgzTPdks+BskTLCH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca; spf=pass smtp.mailfrom=ethicsbowl.ca; dkim=fail (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b=d42sOUCZ reason="key not found in DNS"; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ethicsbowl.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ethicsbowl.ca header.i=@ethicsbowl.ca header.b="d42sOUCZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc73e322dbso39602495ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ethicsbowl.ca; s=google; t=1783967732; x=1784572532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z5LhU8VY08zumCZgfACpSYa1j3Ing/19bKNqru9qpHM=;
        b=d42sOUCZNPQjBXFd2pLO0Q1PinvxwWAdMvGiWkeYZUh9/mOqDhKN9i1Nhow8DmMwxu
         3La2TF5b9VCmtd5Io7Ohfo/uzA2OGA6jHcOjDUeYIOJ9atye3R4A9hk9vcntoKA2GQRd
         sP47Kfu6sMfkkBEcTfhH/62Qm4rrnNERCknUgRd17fMOJbI6Pg1taW3ZQJKcN9hou6nY
         NogR4FXEsBe3z6SfxCnB3Dnponk6FollNW647u1NHa5AvOcJgz46SLZNFzsjKRXAUl1g
         SuhiFJ31wJWK6Xqz9sqaNI6mi6ISn5Imz+lygH/GHrWSdVg7j/uZ6oRcNRAU0E7zujE5
         gF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783967732; x=1784572532;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5LhU8VY08zumCZgfACpSYa1j3Ing/19bKNqru9qpHM=;
        b=OBVQkWpW/IuebZOmev2fj3BgAdLUkIf63gAkBXWLZyVAIrd+vcPs+s/Ebb9pzP8tBv
         /NYX3++hBTE9tK+Idsu6Gpsr204EcoqlKlanOUM4KmbVQLABfB08c7HaRDk8v18HpPpM
         DEQ6FNT+2M4p0PgEo63pdyrx9KuvnhHv+KNvSmyv6VDQ+FiukWBygzN0Y6i8voexVPeT
         2TkKJYFzfPuhuVyWztp/EKoOW9Gl05TbkBzicqKlb8NhAK6ywgeJSLD8SYK0cpIeWWPd
         IR/czHcof8J3vr1h6TbPqZGYPQV47Tyl0LyANPkkL3T9vUMLOIj1YqgzELfPUazuU2kQ
         1KyQ==
X-Gm-Message-State: AOJu0YzPSueqX/mCOE+SCBvmWDQDgaGCDrFO5y/jzL2k4R5t87akMAlY
	C1/cDr4K2Cry1ksW7/fYcsCydh9phlwXOIDgq1OU4b22wzG03HvmwJRiJ7B7Ohwui4s=
X-Gm-Gg: AfdE7cnoHfpSuBEjP0v/8IFsE5thtVpaSgDOooORIFzoUFfdC6jPPc0sljaT0S6NywR
	/RPVm99rYJetyYiOWxruqmiVXsj+64bhTFGxQLW0byc8yFP8hkT6/1saog7KeXkAfiNFBJ+yVqI
	7Pbk6PwOV5yEIwAPwlQ6jsfbqGhHcgneUurmcoq2ef7IJeY59uj9FMlWGC90OorgaWVYwpUD5B1
	HSao3JJdiOXXhZkdkYWEabRZc6Yv3y+53YdTFmTO2vS0+iRMd35tlOT08fM19TnQAOhNBTX0GTW
	OofPzuKwOyov5lKfx+Pj3Lla3Jax+3ScybiqA4I6GWCcJg4bi1QK+FVBm0K4qy+3FqfMt3V3Llj
	TECuRKE1RDUtSEZHE9PlMAuc/XrX1b0bzaQ9FruLkKzaZMOkh2Ra1TrJOXgbFn++WNE7Q9DhHTs
	XZHUeg0fDl8yMGY79K/o3ul6WdMP4vJrwqakkszC6RoMEfdWv13mI9gH8+c6g=
X-Received: by 2002:a17:903:120b:b0:2ca:52ce:6f74 with SMTP id d9443c01a7336-2ce9f01d374mr101337545ad.29.1783967731778;
        Mon, 13 Jul 2026 11:35:31 -0700 (PDT)
Received: from [142.232.93.124] (ip-142-232-93-124.ptr.bcit.ca. [142.232.93.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm105146865ad.76.2026.07.13.11.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 11:35:31 -0700 (PDT)
Message-ID: <ae3f4f58-0326-45a2-bbee-b71ec44cd28a@ethicsbowl.ca>
Date: Mon, 13 Jul 2026 11:35:30 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: qby140326@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted but
 profile remains balanced on Redmi Book Pro 14 2022
Content-Language: en-US
From: Robert Munro <robert.munro@ethicsbowl.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

To: Mingyou Chen <qby140326@gmail.com>, Hans de Goede 
<hansg@kernel.org>, Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: [REGRESSION] bitland-mifs-wmi: power-saver write is accepted 
but profile remains balanced on Redmi Book Pro 14 2022

Hello,

Linux 7.1's new bitland-mifs-wmi driver binds on my TIMI Redmi Book Pro 
14 2022 (TM2107) and exposes platform profiles, but selecting 
power-saver is silently ineffective. The userspace request returns 
success while the sysfs profile never leaves "balanced".

This reproduces without KDE:

     $ cat /sys/class/platform-profile/platform-profile-0/name
     bitland-mifs-wmi

     $ cat /sys/firmware/acpi/platform_profile_choices
     low-power balanced balanced-performance performance

     $ cat /sys/firmware/acpi/platform_profile
     balanced

     $ powerprofilesctl set power-saver
     $ echo $?
     0

     $ powerprofilesctl get
     balanced

     $ cat /sys/firmware/acpi/platform_profile
     balanced

     $ cat 
/sys/devices/system/cpu/cpufreq/policy0/energy_performance_preference
     balance_performance

I repeated the request while polling platform_profile every 50 ms. The 
only observed value was "balanced"; no transient "low-power" state 
appeared. The request completed in 162 ms with exit status 0. 
power-profiles-daemon also persisted Profile=balanced afterward. There 
were no relevant kernel or daemon log messages.

Expected result:

The advertised low-power profile is selected, platform_profile reads 
"low-power", and the AMD P-State EPP becomes power-oriented.

Actual result:

The operation reports success, but firmware, power-profiles-daemon, and 
all AMD CPU policies remain balanced.

System information:

     Distribution: CachyOS
     Kernel: 7.1.3-2-cachyos
     DMI vendor/product/board: TIMI / Redmi Book Pro 14 2022 / TM2107
     BIOS: TIMI RMARB4B0P1010, 2023-06-28
     CPU: AMD Ryzen 5 6600H with Radeon Graphics
     bitland_mifs_wmi srcversion: 0C0A58A1AE25437010C0B5E
     power-profiles-daemon: 0.30-3
     Power source during reproduction: AC online
     Active profile holds: none
     Other power managers (TLP, TuneD, auto-cpufreq): none

powerprofilesctl identifies both drivers:

     power-saver:
       CpuDriver: amd_pstate
       PlatformDriver: platform_profile

The kernel taint value is 512 because of an unrelated AMDGPU display 
warning during boot (dcn31_program_compbuf_size); bitland_mifs_wmi 
itself is not tainted and emitted no warning during reproduction.

This began after the 2026-06-24 update from Linux 7.0.12 to 7.1.1, which 
introduced bitland-mifs-wmi (dc1ec4fa86b2). Power Saver worked before 
that update. My installed 6.18 LTS kernel does not contain this driver, 
but I have not yet performed an LTS or vanilla-mainline A/B test, so I 
am explicitly reporting this as reproduced on a CachyOS kernel.


Regards,
Robert

Assisted-by: OpenAI Codex:GPT-5

Robert Munro
Director, Executive Team
robert.munro@ethicsbowl.ca <mailto:robert.munro@ethicsbowl.ca>
ethicsbowl.ca <https://ethicsbowl.ca>
Ethics Bowl Canada
