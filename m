Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D247328DA7
	for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jan 2024 15:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706370612; cv=none; b=jiPH9Y3FgpavEhlLDCrRgd1rujEcOksA164RlC3wraqvFXzapXRTz3oFlC7WM6Up+HdrpRryk8MxWCeMj+UrJIRmyf1ssd9SuSfFKgCGgHR+4IK73BaRP4zmK1wRK8BSrVkZhAUEnK3fpy66uP+WuV+aRZ8DzoMEpBfVFnbh+BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706370612; c=relaxed/simple;
	bh=OKPdxWyidDne3UMajumKxs0428TqhzDbCxV0XPkus2Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=tLmZ6UvHjOJKnFBhAj5FI3x3nJcJsANzLATu6MZsJnhVciicWwAgjYqnuXSnAnrmKvntpNQ6YYZ4+bO9dc8of2R8V9SO2DuRoObQ1FOoIXXAgbFX5LduZtjgqXgfDd9r9+OAGJwzn5ASB0/b0U0avwWdDBDCvhmY2rWr1fRbAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YTLw8YOM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YTLw8YOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706370608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P2NyTUKkE9da1Ima12SE8z8vDesj+rJJfrcXoSA4ZHE=;
	b=YTLw8YOMtz4tLFJOxI9iduenejHQvOzzzv3EU9DZRbEIlV4S824C/Mlt15PnrQlk5k+4LY
	d3w34kLmtE6lseob35Hh8wyRkN5YHzSwCrBPhm4DrJMlzgMlvQGBq0N5p0HryeDucUqg2Z
	eqi3++WqidZkNbWyBjCOnaqogYf2gYE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-DsDeQl7EMCuXDg6Nb93-2Q-1; Sat, 27 Jan 2024 10:50:06 -0500
X-MC-Unique: DsDeQl7EMCuXDg6Nb93-2Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a330b31c1fcso32356866b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Jan 2024 07:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706370605; x=1706975405;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2NyTUKkE9da1Ima12SE8z8vDesj+rJJfrcXoSA4ZHE=;
        b=SAFp3sdPNHydxoOe3oDap81fXaowbMropuqZoExlsOzN0xMH2G0OWtErutmb1D6Y/3
         1Z34H0nBi6YlS1OigRk2yWjwTI/1t+QDFmlMuz3CoPpZW1st20pclJQrFm1NegmXXqHv
         IJgXabT6GCvs09RHCGOggaLbgrvqPOM8rKe6i8q7E1xlsLELUhIENJ+Wlh2R3szk2Y4d
         +eM2Ev6CSnD/WwE8IHlOyu5Lek6KtFVjrSItyrcG5DRkPH78tHwoDagsgcIIJ8Q444wR
         d6iNLzPPf2oVvmmwdi2PjP0Qb4Rvo/jOe+n8QYPKE/oG5UbwUyg9tP9uA6Lg0xm+Qs69
         VkEw==
X-Gm-Message-State: AOJu0YwQeW0ouo2J2jE4QrVkCqFNUHw6JtvBb46ruGn+MUSPNBeJsC1p
	zpLUFodIKVpF9mdM3AgBPflm5qokM7z3tcnLr/HOE2cM5RcJ5nsM58QMxVyM5sYwqrJcZDv+Lwm
	ngn92ubEG0EnVZXSVrQk3wBI4w68Ri1QGaw+vkNqCjr6QpxwHZuEATnBJjxriyZZWt178S2I=
X-Received: by 2002:a17:906:4a12:b0:a31:7af3:f45d with SMTP id w18-20020a1709064a1200b00a317af3f45dmr1278053eju.28.1706370605258;
        Sat, 27 Jan 2024 07:50:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETDe6YFOfBBlWmcbkxTITwwhj0BlK5z58fR3FMVArsfDUGWAWsTAAuJxc/ElDOsx7Quu1OOg==
X-Received: by 2002:a17:906:4a12:b0:a31:7af3:f45d with SMTP id w18-20020a1709064a1200b00a317af3f45dmr1278046eju.28.1706370604945;
        Sat, 27 Jan 2024 07:50:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id st2-20020a170907c08200b00a351537aac7sm1355226ejc.71.2024.01.27.07.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 07:50:04 -0800 (PST)
Message-ID: <0a9cc4d2-6adb-4f79-a559-1a57a2b72de7@redhat.com>
Date: Sat, 27 Jan 2024 16:50:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.8-2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.8.

Highlights:
 -  WMI bus driver fixes
 -  Second attempt (previously reverted) at P2SB PCI rescan deadlock fix
 -  AMD PMF driver improvements
 -  MAINTAINERS updates
 -  Misc. other small fixes and hw-id additions

Regards,

Hans


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.8-2

for you to fetch changes up to 1abdf288b0ef5606f76b6e191fa6df05330e3d7e:

  platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet (2024-01-26 20:21:47 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.8-2

Highlights:
 -  WMI bus driver fixes
 -  Second attempt (previously reverted) at P2SB PCI rescan deadlock fix
 -  AMD PMF driver improvements
 -  MAINTAINERS updates
 -  Misc. other small fixes and hw-id additions

The following is an automated git shortlog grouped by driver:

MAINTAINERS:
 -  remove defunct acpi4asus project info from asus notebooks section
 -  add Luke Jones as maintainer for asus notebooks
 -  Remove Perry Yuan as DELL WMI HARDWARE PRIVACY SUPPORT maintainer

intel-uncore-freq:
 -  Fix types in sysfs callbacks

intel-wmi-sbl-fw-update:
 -  Fix function name in error message

p2sb:
 -  Use pci_resource_n() in p2sb_read_bar0()
 -  Allow p2sb_bar() calls during PCI device probe

platform/mellanox:
 -  mlxbf-pmc: Fix offset calculation for crspace events
 -  mlxbf-tmfifo: Drop Tx network packet when Tx TmFIFO is full

platform/x86/amd/pmf:
 -  Fix memory leak in amd_pmf_get_pb_data()
 -  Get ambient light information from AMD SFH driver
 -  Get Human presence information from AMD SFH driver

platform/x86/intel/ifs:
 -  Call release_firmware() when handling errors.

silicom-platform:
 -  Add missing "Description:" for power_cycle sysfs attr

touchscreen_dmi:
 -  Add info for the TECLAST X16 Plus tablet

wmi:
 -  Fix wmi_dev_probe()
 -  Fix notify callback locking
 -  Decouple legacy WMI notify handlers from wmi_block_list
 -  Return immediately if an suitable WMI event is found
 -  Fix error handling in legacy WMI notify handler functions

----------------------------------------------------------------
Armin Wolf (5):
      platform/x86: wmi: Fix error handling in legacy WMI notify handler functions
      platform/x86: wmi: Return immediately if an suitable WMI event is found
      platform/x86: wmi: Decouple legacy WMI notify handlers from wmi_block_list
      platform/x86: wmi: Fix notify callback locking
      platform/x86: intel-wmi-sbl-fw-update: Fix function name in error message

Cong Liu (1):
      platform/x86/amd/pmf: Fix memory leak in amd_pmf_get_pb_data()

Dan Carpenter (1):
      platform/x86: wmi: Fix wmi_dev_probe()

Hans de Goede (2):
      platform/x86: silicom-platform: Add missing "Description:" for power_cycle sysfs attr
      MAINTAINERS: remove defunct acpi4asus project info from asus notebooks section

Heiner Kallweit (1):
      MAINTAINERS: Remove Perry Yuan as DELL WMI HARDWARE PRIVACY SUPPORT maintainer

Jithu Joseph (1):
      platform/x86/intel/ifs: Call release_firmware() when handling errors.

Liming Sun (1):
      platform/mellanox: mlxbf-tmfifo: Drop Tx network packet when Tx TmFIFO is full

Luke D. Jones (1):
      MAINTAINERS: add Luke Jones as maintainer for asus notebooks

Nathan Chancellor (1):
      platform/x86: intel-uncore-freq: Fix types in sysfs callbacks

Phoenix Chen (1):
      platform/x86: touchscreen_dmi: Add info for the TECLAST X16 Plus tablet

Shin'ichiro Kawasaki (2):
      platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
      platform/x86: p2sb: Use pci_resource_n() in p2sb_read_bar0()

Shravan Kumar Ramani (1):
      platform/mellanox: mlxbf-pmc: Fix offset calculation for crspace events

Shyam Sundar S K (2):
      platform/x86/amd/pmf: Get Human presence information from AMD SFH driver
      platform/x86/amd/pmf: Get ambient light information from AMD SFH driver

 Documentation/ABI/testing/sysfs-platform-silicom   |   1 +
 MAINTAINERS                                        |   5 +-
 drivers/platform/mellanox/mlxbf-pmc.c              |   4 +-
 drivers/platform/mellanox/mlxbf-tmfifo.c           |  67 +++++++
 drivers/platform/x86/amd/pmf/Kconfig               |   1 +
 drivers/platform/x86/amd/pmf/spc.c                 |  36 ++++
 drivers/platform/x86/amd/pmf/tee-if.c              |   4 +-
 drivers/platform/x86/intel/ifs/load.c              |   3 +-
 .../uncore-frequency/uncore-frequency-common.c     |  82 ++++----
 .../uncore-frequency/uncore-frequency-common.h     |  32 ++--
 drivers/platform/x86/intel/wmi/sbl-fw-update.c     |   4 +-
 drivers/platform/x86/p2sb.c                        | 206 +++++++++++++++------
 drivers/platform/x86/touchscreen_dmi.c             |  35 ++++
 drivers/platform/x86/wmi.c                         | 181 +++++++++++-------
 14 files changed, 472 insertions(+), 189 deletions(-)

