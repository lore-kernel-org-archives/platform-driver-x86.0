Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C581DEFF5
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 12:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730894797; cv=none; b=HIfDgsJCf/yoEVBe396ssqJrIbrTAGraHl/xfCWhLNFGuyYJ1lY/Cc8dyTcny/m2uwqassqkQ3pJEGtGjkgK+miTAUK0HcmA/NLqE4FgSsWuNWjATqHBKOklZnaHc2p5e2QQ1q16qtTpNQmqh8rTNMWCl5zAg4y+doOtkU6hP8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730894797; c=relaxed/simple;
	bh=Yy/+mSJcBc7tyuo5LXH1ldEPxnUnvjR7l0iv2NzqSpw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Zk4geQrenMEbntPrNV6gh7shtJP2qnoGuoe9Je44HxXstmXqCexsOF5vPaLt1wesPphKY78Q+/MHwV0NB2p0Z5dS1qu5WHFxOCe2ycObc/C/D0/CiMiDlv7zlzZr3mQ2KM1wa0Zf+6ekLC1q7FP+hZ7gQaArbnSJ1YQqFnPP1G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZxMXs5vK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZxMXs5vK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730894794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I4uByD/scs2lHdN8SG8oJgSjpalWT5ZD06eUL1OlA/Q=;
	b=ZxMXs5vK56r6iziRzlCWtXLVVqv+llXvg301FL7qxO//biUa15DFnCcc2riDD9rPSn+NjB
	RIeW7tJGEPoXGvfJBi/A3bVkD2qaBVYKHI3xolfjALCalwWLXT11Xqe8eZ3nJcSawGZ9f6
	Qeythk/nuW7gC8nCV5FrQuITUcqjcmE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-jn5toyOyPS-D6cjGuIaBtA-1; Wed, 06 Nov 2024 07:06:33 -0500
X-MC-Unique: jn5toyOyPS-D6cjGuIaBtA-1
X-Mimecast-MFC-AGG-ID: jn5toyOyPS-D6cjGuIaBtA
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-539e294566dso4031995e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Nov 2024 04:06:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894792; x=1731499592;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4uByD/scs2lHdN8SG8oJgSjpalWT5ZD06eUL1OlA/Q=;
        b=GmKoRn6N8WEjbG5oSWfJ78q7PBp3pAkIieaRgaQo7P4rlTA0mDRBHcsV4feoQeobl6
         j/ZpFIm1Cu5UFTIheH6TbC33RvHz3Ihzh9FGB1u6sKmKHO3/+Dv35Y1AtINs8hZnA2od
         e5Q6Ikd+RiKD8ZRt5U/DZIDzTHs3iUc5qBJfC7PWGntvX+bKrDdYJYSFuUk0nwiLMHfR
         k4PT6XoCdwQcA+zFL12dQxZUGTPQUGZtkoorHa4/FU6Sj7lPsgRUyYIctc5yTEIp69Ls
         d9yuyv8/XjgULiZk7Nngg0f71Z5bIDUve50wnxAYeCNbTL1kz9vjOo7qNCIlJxZt+qOr
         SScg==
X-Forwarded-Encrypted: i=1; AJvYcCWcaBnyswki8NDAUNGs2UPw9w9uL2Q+2VtBGKnZWeGqxJx1Za2CPOJVf1KgLxYofgPB/j6Sd25KQ50UjwTuq0I4DhEE@vger.kernel.org
X-Gm-Message-State: AOJu0Yysd3BBjmibGCFLqubO8oK+FonNfVS1m0VZbUyNdFI3fh5Qlwze
	/9d1StyPWTBEaU+I2N87B11r0J6FY6d2KfcJt896/prEknKRggDvAyDiewrJO/r2O1B1SoWNR88
	PvxpzTdlVo30AahaCvHz/lmEJgY1vbS8nLyAXiJxEcl39pnTAnZ9S6PuY8DVR6x82uEsTBdW+go
	4qUJ8=
X-Received: by 2002:a05:6512:33c8:b0:539:896e:46c9 with SMTP id 2adb3069b0e04-53c79e913famr12119925e87.45.1730894791671;
        Wed, 06 Nov 2024 04:06:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ8viotvbBZwWDeDBorwxrisTXP4YltWh4HSUAoXaKvMmYyBhXlRWwJiNtBfJ4MwMsXB58SA==
X-Received: by 2002:a05:6512:33c8:b0:539:896e:46c9 with SMTP id 2adb3069b0e04-53c79e913famr12119905e87.45.1730894791238;
        Wed, 06 Nov 2024 04:06:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6aae22esm2648579a12.20.2024.11.06.04.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 04:06:30 -0800 (PST)
Message-ID: <24e9383b-bc82-48bd-9de5-da0b8ae9b1f6@redhat.com>
Date: Wed, 6 Nov 2024 13:06:28 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.12-4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is another round of fixes for platform-drivers-x86 for 6.12.

Highlights:
 - AMD PMF: Add new hardware id
 - AMD PMC: Fix crash when loaded with enable_stb=1 on devices without STB
 - Dell: Add Alienware hwid for Alienware systems with Dell WMI interface
 - thinkpad_acpi: Quirk to fix wrong fan speed readings on L480
 - New hotkey mappings for Dell and Lenovo laptops

Regards,

Hans


The following changes since commit b012170fed282151f7ba8988a347670c299f5ab3:

  platform/x86: asus-wmi: Fix thermal profile initialization (2024-10-26 13:03:10 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.12-4

for you to fetch changes up to 1be765b292577c752e0b87bf8c0e92aff6699d8e:

  platform/x86: thinkpad_acpi: Fix for ThinkPad's with ECFW showing incorrect fan speed (2024-11-06 12:48:42 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.12-4

Highlights:
 - AMD PMF: Add new hardware id
 - AMD PMC: Fix crash when loaded with enable_stb=1 on devices without STB
 - Dell: Add Alienware hwid for Alienware systems with Dell WMI interface
 - thinkpad_acpi: Quirk to fix wrong fan speed readings on L480
 - New hotkey mappings for Dell and Lenovo laptops

The following is an automated git shortlog grouped by driver:

dell-smbios-base:
 -  Extends support to Alienware products

dell-wmi-base:
 -  Handle META key Lock/Unlock events

ideapad-laptop:
 -  add missing Ideapad Pro 5 fn keys

platform/x86/amd/pmc:
 -  Detect when STB is not available

platform/x86/amd/pmf:
 -  Add SMU metrics table support for 1Ah family 60h model

thinkpad_acpi:
 -  Fix for ThinkPad's with ECFW showing incorrect fan speed

----------------------------------------------------------------
Corey Hickey (1):
      platform/x86/amd/pmc: Detect when STB is not available

Kurt Borja (2):
      platform/x86: dell-smbios-base: Extends support to Alienware products
      platform/x86: dell-wmi-base: Handle META key Lock/Unlock events

Renato Caldas (1):
      platform/x86: ideapad-laptop: add missing Ideapad Pro 5 fn keys

Shyam Sundar S K (1):
      platform/x86/amd/pmf: Add SMU metrics table support for 1Ah family 60h model

Vishnu Sankar (1):
      platform/x86: thinkpad_acpi: Fix for ThinkPad's with ECFW showing incorrect fan speed

 drivers/platform/x86/amd/pmc/pmc.c           |  5 +++++
 drivers/platform/x86/amd/pmf/core.c          |  1 +
 drivers/platform/x86/amd/pmf/spc.c           |  1 +
 drivers/platform/x86/dell/dell-smbios-base.c |  1 +
 drivers/platform/x86/dell/dell-wmi-base.c    |  6 ++++++
 drivers/platform/x86/ideapad-laptop.c        |  3 +++
 drivers/platform/x86/thinkpad_acpi.c         | 28 +++++++++++++++++++++++++---
 7 files changed, 42 insertions(+), 3 deletions(-)

