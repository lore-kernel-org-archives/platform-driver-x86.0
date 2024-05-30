Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B85718756B
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 18:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717093851; cv=none; b=I5eN/ee9YculZTa/PsJCoaapo/ua+rLcErDSMabKI7bd5SrtC3glMe+kOtKT1k7J/12AWeKH0nEh4SW3reo5Qy/iPXKI0QJ2nIf8E0DkLCeEboQAPWkquJvrqjnrLx0nEZk7h0HJ8W2klk+hOMn/ha2ueUczr7oX67Hy5BRehr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717093851; c=relaxed/simple;
	bh=33L6s4vKy97GaN4BZzqEE5/renpH8a2GYzMSjcrPTFQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=SqAwO7jcIPKAG4Ts1mCj+E1zJl7x3z3zuRyIn5KYBfmmar36c8bAwF1RaSS5n4Lrm9rkK71VJNmUVqVgYsm0q0BlyRFVmFuK0zyxzb1WoxSJ/HeDz/OpzRhm2y+kUwolfxgjRTWpYCmIHPCc3zliLYRO9xeafOsgZLn799Ick48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZZRepBe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZZRepBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717093849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nd2gyK4ZonhwCOT/Y7f2LA/uGx9MOgzn7+cShk0mQFA=;
	b=JZZRepBe9hLUgaZpGjkHVRG3SQNCHYuSdOtuukcY9Qy2Wwr39jR8hpSAnLZHvDMo51w7DR
	DGCoZH0+2VJ7Qnt3haHd9NItB29xUzaqKoWGoKJ7II0K+tIH7Gh1TXaC3lthwv8caTuSb0
	cKBxevxlcezQcQwTP8WNiD8MpFxEjJg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-YGyS-cImNHeZAIlRb8LKhg-1; Thu, 30 May 2024 14:30:47 -0400
X-MC-Unique: YGyS-cImNHeZAIlRb8LKhg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52af478a4cbso781930e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 May 2024 11:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717093846; x=1717698646;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nd2gyK4ZonhwCOT/Y7f2LA/uGx9MOgzn7+cShk0mQFA=;
        b=wQ2sA08cy1wy1W/VjTLk3g3u/GjtWTBNYZpnVippbv1nQl7YwbhuAP/MIl605bbt+A
         q4n2VS7lHd9MtFToVM+IvTVueEs6ux5k7cIgP0/F/1VqeaAUfvib9PBCi34ZpWFt4g+N
         H69MeAiSXup1LKISW4x6G9UJy5cjScj74jdZ7N1hBD5WTK+iw66Z99zKUWPcfkIaIhTn
         X9uZIrQQXhdhNrphvYzCoZjWWkzOZVJIfO6/FiBKgA4azzdUDAGP+w6IpWclyw4mo9nt
         8yRt4XABDOaiOlouobjvuAsO9Ej34BKW5VboZtPOWBmwnrJuiTWNw69oBl4fKhVw/bki
         s7bQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1FQHdjiDQPsVPXjYicF0P/tb9m86Zb5LDDOSRzeITqflY5LSgKsGdLdwa6MASwiZhAjVALywVr79Y4xdi6ZorKl51bVUPaLWnTgxuYckpFzbUcQ==
X-Gm-Message-State: AOJu0Yzn9Ui9J7408OODS2hi/mtLKSVtvf195vSGKdsh4aRnKlF8Q/4C
	jkmtsu3c59PLAQj05wDvInyrDH3jJ+3yC6llAJdavFfa3XkmwYHqYN8zhec51rKpvEIEhoFkb43
	/vRg706IFKvwrMD7qZUZHY/XXGmQVMuCPHQaoFz7iRov0930p/0wwl1gQtr1o45nk9yR0dg4=
X-Received: by 2002:ac2:52ad:0:b0:52b:68e3:6e02 with SMTP id 2adb3069b0e04-52b7d4263ffmr1732275e87.27.1717093845819;
        Thu, 30 May 2024 11:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGm6WIHSy1XP/kCjJRfi19l9VpuwmnbTkKAggfM+5EFREAwdT4X0ElY/xJHa6zOBTaduJM7Wg==
X-Received: by 2002:ac2:52ad:0:b0:52b:68e3:6e02 with SMTP id 2adb3069b0e04-52b7d4263ffmr1732263e87.27.1717093845326;
        Thu, 30 May 2024 11:30:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eb344426sm2429566b.215.2024.05.30.11.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 11:30:44 -0700 (PDT)
Message-ID: <470d8b3d-1c9a-475e-a6fb-4fcc4b9ef98e@redhat.com>
Date: Thu, 30 May 2024 20:30:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.10-2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.10.

Highlights:
 -  A use-after-free bugfix
 -  2 Kconfig fixes for randconfig builds
 -  Allow setting touchscreen_dmi quirks from the cmdline for debugging
 -  touchscreen_dmi quirks for 2 new laptop/tablet models

Regards,

Hans


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.10-2

for you to fetch changes up to 3050052613790e75b5e4a8536930426b0a8b0774:

  platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro (2024-05-27 11:43:03 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.10-2

Highlights:
 -  A use-after-free bugfix
 -  2 Kconfig fixes for randconfig builds
 -  Allow setting touchscreen_dmi quirks from the cmdline for debugging
 -  touchscreen_dmi quirks for 2 new laptop/tablet models

The following is an automated git shortlog grouped by driver:

ISST:
 -  fix use-after-free in tpmi_sst_dev_remove()

thinkpad_acpi:
 -  Select INPUT_SPARSEKMAP in Kconfig

touchscreen_dmi:
 -  Add info for the EZpad 6s Pro
 -  Add info for GlobalSpace SolT IVW 11.6" tablet
 -  Add support for setting touchscreen properties from cmdline

x86-android-tablets:
 -  Add "select LEDS_CLASS"

----------------------------------------------------------------
Hans de Goede (2):
      platform/x86: x86-android-tablets: Add "select LEDS_CLASS"
      platform/x86: touchscreen_dmi: Add support for setting touchscreen properties from cmdline

Harshit Mogalapalli (1):
      platform/x86: ISST: fix use-after-free in tpmi_sst_dev_remove()

Steven Rostedt (Google) (1):
      platform/x86: thinkpad_acpi: Select INPUT_SPARSEKMAP in Kconfig

hmtheboy154 (2):
      platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6" tablet
      platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro

 Documentation/admin-guide/kernel-parameters.txt    |  22 ++++
 drivers/platform/x86/Kconfig                       |   1 +
 .../x86/intel/speed_select_if/isst_tpmi_core.c     |   2 +-
 drivers/platform/x86/touchscreen_dmi.c             | 117 ++++++++++++++++++++-
 drivers/platform/x86/x86-android-tablets/Kconfig   |   2 +
 5 files changed, 139 insertions(+), 5 deletions(-)

