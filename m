Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFC019D07E
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783647956; cv=pass; b=j0C2D4aj5+NFe2ht8uy9PTFbp5FtSsArNJ95V1NUon8lR5WF/VJew6f0/mvULBthgvPrze1EtbwzUfCsu6fYm8ceUgm/At1J3sGMHsmPs6BHoMCuvwpf7/g7vyBKGrONWUEtCjfhvm1Ug5bQLruWpoYyK6R9HNo2XSE7mzBpLJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783647956; c=relaxed/simple;
	bh=XMca5hM2/rcAVM08czFhp/H98ET0Kr1FZxBtzqzDmd8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nDiVOc6zmSWi6Ug/RJncAG2wQLaE4mBoc3EFm7hSiDCdN2mDeCKJ7q8yp8W+M/oEPi1RdlS/1EVtusNiZr2vaQuzN4a/wz/RudDdczTQ1n5jI2XVhwVDsYZ24ucZTZN3OITc7xXPQ7TMp2NHWuFK6KecXxBYP7VzPznm3nI9d9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba8nOd0r; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba8nOd0r"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso573022a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 18:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783647953; cv=none;
        d=google.com; s=arc-20260327;
        b=LvS0RN1UubqFDXb7VZIdYD86HSB3aSL0m02bVIr6NLbYaA7EsMi8IysyEs5BDUWd3+
         D/ctGvt5Eu7HcW8xljU4jl9dsdV7BnIxqAu+jO5rSft5B8gdxsx1E0rmBgCHmcXptQui
         pZuOcEiHUvugnPe0DvhvXXO5wxPY7QtryVsktj2Z4Kvd8tx5ds43yJ/VXYf7upO7MGFN
         xs0DkHFzUzf1Pc+RlxZmsLiA1i1k3LZeTX+C2LY9gGG0cgSOic/C4CAgsU5rvP3g9IdT
         OLUWAdW3hsifP0eQIkn2WWG7Zpi2dguZP3K3HO6Cx9f5UMDBBQhkBwyZl6EGicA85e3P
         5JzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=SQOj1nH4WftxQs3zQeIVfop9vnH1wT1CfwSzsO03rk8=;
        fh=8e/kz/de6juE1HVuGBPpByiPTaFYXpAF3IC5dd+kx8Y=;
        b=YFMtuqaQJVOH1vjASQd4pOUdSS/AIWHamF5Z6fcRqXpSqh/gbEIwciWseM4kFa8X0E
         HLxjrdMh3yrTqi76h4afa2naOIp/s41IHJicrmhLg8Jt6sjp40FtyEn9FE2F1J7nUogA
         QL2qY0Z43x/7ajbSgKmkIrs3FjjxNbotaDUQf+ZhcJe92HSD+cIXBnewF+jVMMTrCBUF
         o1dngzX4sW2+ZiIiD9ial/jRWx+5EVsGsuL2a2jzRAPQ11lTXQwnZ5rzd5lKjq1J+TVp
         j5Yl4dbjNwnWRKCaKQg83MxqAf+ByW1gR9dL49bRa8K0KwjV0Ua4TENMMyPm48A9u4al
         nMWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783647953; x=1784252753; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SQOj1nH4WftxQs3zQeIVfop9vnH1wT1CfwSzsO03rk8=;
        b=ba8nOd0rVTljkKK1PopHYdRmlfuPI0ZcofK7xIP50pdPjMRH4FOx7reH0zbe9BvZzo
         G0PkoQXpIC27D9W/hT/xe3RiLXIYbztknQWoYeBQKbzd+kEat0Tz79Y8xBS0pTSrQvlv
         bpHmbk0D6XqJSSwqM2v0gUF+ifSAT8SPk/z1zxLR2wO1HxCH3PMe0uPJW892Ls0DUiGb
         Pvj/L+up2OKOdWAQ5Qya3E6y51PjhCBwHTt1uuHBQPPxifnHAqdoeDreROdcUCpyDMmT
         5NMMxRVw/XGYyW++8+Uk1qwbwnayJqBe/DAMtDTPfp+WNOtIwIsdRHQolGxdfLhwfX1h
         0XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783647953; x=1784252753;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SQOj1nH4WftxQs3zQeIVfop9vnH1wT1CfwSzsO03rk8=;
        b=IttgTfuuajOzrIcpLXZPiETBsZMOrx2JaTzngTHmOFZx/TtdIh+87p2tRE00iqRys/
         O196SnujSkVd1I5heo8CjvzUYaYICRkAnpZH/p721TG3r7H4+MhmNnf1r1O2ONeyIb4z
         MXfrTDVm32qbBnLIG8TlJltVmWgbtZuVcMQ3B1elBwX1JIQrf9PWoXNUDagWCS/CAmds
         bCRhPEwgeMTQlRoUWgkr107TPakc6EsiuwEPbbS+huXqJh0WClx88TnWOCk52TGGxBaE
         6Hn/KoQqaGVwWIRuFn+DKjCNMXfOBr5DHIz/iFWeHb6WaMu66I96NYGhqTB2SfLseo+7
         rzDA==
X-Forwarded-Encrypted: i=1; AHgh+RqEAZ9Ah6CLxZ97wJYrh9b2xv3t1uqQuCOCD03ZQS5FWzemKprZcJzYpwayb4wYArNjqAwotYHD6Sn/Rnhxy287V8YW@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw12QRCul/2uIgwGFuzhwRPqiJ3VwyqXVpLj3BSsfGmh2D/6zf
	wgSYb3n9Tm1J1MmjtSHUy3z7rLRLTC0ARQcLq++FaozIGKggGLq3U/FcHF0hQN2GwHR7pJ05KY6
	Ei0WisrZbKXbSIege/LxwqcDCMVY45KU=
X-Gm-Gg: AfdE7cmLANHA32PnCiuPVAJEAIYi5y3HKNffC3WypmbWmwFAVrysesb4aNwns/AUIuz
	8s3ut5pDPdPzR7h5q+hMmEQRF0+pfARmEjFhPP3jYON4xdZJ6MJCkQhNSwRewXBPVa45uJ5qu74
	nwtmYbCFzuJYqdaFORmg1nYbjKXugUqeFsl99vUVmE8hlTUy6kWBDBsiZ40P2jwCH9vVZrNR8j5
	ciFVgW6xE9gX5iy6prm3kXgl0QMKSOinOOQ+5LDMcMcgDIYvIBO2VkiGmTJ5g+x5JNh8d4gD2Uh
	WBh+BsdVyKWXK9GTvYYZpHU326NoJBE2sMHiZQ+gpTdWin9XuCplOX3B9RWm8RWzDDPrmP/5N26
	n9pkqnsPRvkjw
X-Received: by 2002:a05:6402:1f8f:b0:697:4fff:b90a with SMTP id
 4fb4d7f45d1cf-69ab4453a63mr3794621a12.4.1783647952849; Thu, 09 Jul 2026
 18:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Nabil Danial <nabildanial.93@gmail.com>
Date: Fri, 10 Jul 2026 09:45:39 +0800
X-Gm-Features: AUfX_mwn6SsOMsGYmdPBF_B2_vZnup_cY5OpXude3xRlp1jbAhfbGwZZgYmb9uA
Message-ID: <CAJW3z-g3kn+-EFZ+0nEA49B2DYxc8LK639yzYMgcrR-0mF7G4A@mail.gmail.com>
Subject: [BUG] platform/x86: bitland-mifs-wmi: Hibernation fails with error
 -22 on Xiaomi Redmi Book Pro 14 2025
To: qby140326@gmail.com
Cc: W_Armin@gmx.de, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am experiencing a hibernation (suspend-to-disk) failure on my laptop
since upgrading to kernel 7.1. Hibernation worked without issues on
kernel 7.0, but consistently fails now when the newly introduced
"bitland-mifs-wmi" module is loaded.

I notice that both redmi_wmi and bitland_mifs_wmi are currently loaded
on my system. I understand there is an active patch series to
deprecate redmi_wmi in favor of bitland_mifs_wmi for these platforms.

However, on this specific hardware (Redmi Book Pro 14 2025),
bitland_mifs_wmi fails to establish its platform profile during boot,
resulting in multiple "Failed to get profile for handler" warnings in
dmesg. Consequently, during the PM freeze transition, the suspend
callback fails with -EINVAL (-22), which blocks the system freeze
phase and aborts hibernation.

Unloading the "bitland-mifs-wmi" module bypasses this issue and allows
hibernation to successfully complete. It seems the new driver's
suspend routine might need to be made robust against profile
initialization failures, or require a fix to successfully register the
platform profile on this hardware variant.

Below are the details of the hardware, boot logs, failure logs, and
the successful hibernation sequence after removing the module.

### System Environment
- Hardware: XIAOMI REDMI Book Pro 14 2025
- OS: Chimera Linux (musl-based)
- Kernel: 7.1.3

### dmidecode System Information
Handle 0x0001, DMI type 1, 27 bytes
System Information
        Manufacturer: XIAOMI
        Product Name: REDMI Book Pro 14 2025
        Version:
        Serial Number: 63081/25U700201
        UUID: 07082025-fcb3-aacd-4be6-fcb3aacd4bea
        Wake-up Type: Power Switch
        SKU Number: TM2411-63081
        Family: Mi Laptop

### dmesg platform_profile warnings on boot
[   15.103125] platform_profile: Failed to get profile for handler
bitland-mifs-wmi
[   15.107027] platform_profile: Failed to get profile for handler
bitland-mifs-wmi
[   17.109653] platform_profile: Failed to get profile for handler
bitland-mifs-wmi

### dmesg log when hibernation fails (with bitland-mifs-wmi loaded)
[   68.005811] printk: Suspending console(s) (use no_console_suspend to debug)
[   68.010452] bitland-mifs-wmi
B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: dpm_run_callback():
bitland_mifs_wmi_suspend [bitland_mifs_wmi] returns -22
[   68.010469] bitland-mifs-wmi
B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4: PM: failed to freeze: error
-22
[   68.316796] nvme nvme0: D3 entry latency set to 10 seconds
[   68.382440] nvme nvme0: 14/0/0 default/read/poll queues
[   68.501502] PM: hibernation: Basic memory bitmaps freed
[   68.502346] OOM killer enabled.
[   68.502348] Restarting tasks: Starting
[   68.503286] Restarting tasks: Done
[   68.509265] PM: hibernation: hibernation exit
[   68.509644] e-hibernate[1885]: Failed to put system to sleep.
System resumed again: Invalid argument
[   68.526064] e-hibernate[1885]: e-hibernate: shutdown_or_sleep
failed: Invalid argument

### Workaround (Unloading module)
Running "sudo rmmod bitland_mifs_wmi" allows the system to enter
hibernation successfully:

[  110.414050] PM: hibernation: Basic memory bitmaps freed
[  110.415952] OOM killer enabled.
[  110.415953] Restarting tasks: Starting
[  110.417919] Restarting tasks: Done
[  110.420194] PM: hibernation: hibernation exit
[  110.420288] e-hibernate[2690]: System returned from sleep operation
'hibernate'.

---

Please let me know if there are any other logs, DSDT tables, or test
patches you would like me to try.

Best regards,
Nabil Danial
