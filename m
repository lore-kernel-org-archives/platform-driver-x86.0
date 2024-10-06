Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A7839AD6
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 11:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728212860; cv=none; b=G/VpY7s7/BgV4V3wFdAILbg7gOi1VCjgrqJuuQQNGeQe2t8wgDFQvD7eR9AK3QAx0q4Vpyt1GlYq84t+qKV4UXfZ4sgPtu9O+FZxKziT3Qtx+y2kkVAQdiu2qH33f1LFmmbsMAZtpOzlChxRnEgrs/YgrjWnIJM1pDz1ywP4SFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728212860; c=relaxed/simple;
	bh=Qcxjj234pIpZOfz5P472ZIKGo3Vd966nLGayQOANXmg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=bq0HhTnn0EHT/44EIT9zq+kKvSuk4qMwuSdH6obgDZpzY50IUdp4JAh8VrSaL2vN5XYPgqUuBZhgq9vL6qizC0pjJDZNF4nz2ybSbWmFZwDr73vFPnq7tyeGstZeCt6pmRZoREPkmIM3U3cqCt+DUYMhzxSM7XwSOBi9YIVSUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MuTdGPuC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MuTdGPuC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728212857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C5HhCG62PPs1E+U8cz4OCTWqVv8ereOedx5o6z48nJM=;
	b=MuTdGPuCrbE/aJ25UBf6nvBj0qEk/GNIhy20iTVFTYPGvCSPsHtBf8mtEwCKn3+TGJCMLJ
	0YC/Ek92wemj+5JUTZlaRCAxzJ+IrKzcDDNx1hZdjcs5VF7i06GTt7aMT3sHol8OL2JMbp
	XWn7jUOgPNBMVbe4QfdvToCTyWyJ6QI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-IMgTj7lIM4yD2lyqQNpKgg-1; Sun, 06 Oct 2024 07:07:35 -0400
X-MC-Unique: IMgTj7lIM4yD2lyqQNpKgg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37ccd0cf138so2742165f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 04:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728212854; x=1728817654;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C5HhCG62PPs1E+U8cz4OCTWqVv8ereOedx5o6z48nJM=;
        b=dvgWGPkVZ4Q/P5zczb1Y4GY+2iih0o+x/om5gIG3sEqR7ExokYuCiNU+gbJ0tKETRb
         y27e35TW9oYMxvwlvIRj+imliugN8sjLzJgf12lSteL8ihxFo6aSeKpZ0PE5eE+PEL9X
         lkakR5j/6mAukJhPk1Rg1/lp71bSjGXyDUhJPTTfPSkqh15EYjDFttFz4UWxHdf/DsLR
         a2z1AdAF+xEPwItL+qctjbQvUxJowm7Y7sG37sSY3PjrNDUrRTFfhYD9zlQlWz7Q/7jX
         9z1nTtVa+Klqe2GkjgJVTDeoIx3XfPJw0jhmE4/RBbnUovC7TzlqQlkq/rFVBAEgmkrz
         TFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXACqgixqf/oHt+c2YlZaXXlRNcDN9ElDEgStk0iDKhxinQAY/lNT9ooP+PY6oMg2tj9YhpjOSI3/Wgl6SYq/b2FXE5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/R2h5EEmz3HOx3iajuRGYdb5TfASx8/lrpgAy/K+fePFSoVN
	m5gnfL/zTXU7JtW+EFEBADmVcB2GnLF9Bf72pYerAnm7pN37h81duFlB+7iBcmQf6FcwPRW2CrL
	CmFiMmtKg1UEW4pMP16kXJNhB1c16lSBMRrFIYbmqZkoAYGXvRKiISNwK9+LCEPDqZLWYedw=
X-Received: by 2002:a5d:4b4b:0:b0:374:c7a5:d610 with SMTP id ffacd0b85a97d-37d0e8daf56mr7650569f8f.43.1728212854596;
        Sun, 06 Oct 2024 04:07:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqV7rEFAdRSmfxg2aB/sQA0wW2C3g/6PDO0oKR32MFZfVdo9fErm3V+MYLUbBoAgK9DCQR7A==
X-Received: by 2002:a5d:4b4b:0:b0:374:c7a5:d610 with SMTP id ffacd0b85a97d-37d0e8daf56mr7650545f8f.43.1728212854242;
        Sun, 06 Oct 2024 04:07:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e78498fsm241786866b.107.2024.10.06.04.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 04:07:33 -0700 (PDT)
Message-ID: <280a792b-ec54-419d-8cca-17b020a38d3f@redhat.com>
Date: Sun, 6 Oct 2024 13:07:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.12-2
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.12.

Highlights:
 -  Intel PMC fix for suspend/resume issues on some Sky and Kaby Lake laptops
 -  Intel Diamond Rapids hw-id additions
 -  Documentation and MAINTAINERS fixes
 -  Some other small fixes

Regards,

Hans


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.12-2

for you to fetch changes up to 2fae3129c0c08e72b1fe93e61fd8fd203252094a:

  platform/x86: x86-android-tablets: Fix use after free on platform_device_register() errors (2024-10-06 12:50:50 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.12-2

Highlights:
 -  Intel PMC fix for suspend/resume issues on some Sky and Kaby Lake laptops
 -  Intel Diamond Rapids hw-id additions
 -  Documentation and MAINTAINERS fixes
 -  Some other small fixes

The following is an automated git shortlog grouped by driver:

ISST:
 -  Add Diamond Rapids to support list
 -  Fix the KASAN report slab-out-of-bounds bug

MAINTAINERS:
 -  Update Intel In Field Scan(IFS) entry

dell-ddv:
 -  Fix typo in documentation

dell-laptop:
 -  Do not fail when encountering unsupported batteries

dell-sysman:
 -  add support for alienware products

intel/pmc:
 -  Disable ACPI PM Timer disabling on Sky and Kaby Lake

platform/x86/intel:
 -  power-domains: Add Diamond Rapids support

wmi:
 -  Update WMI driver API documentation

x86-android-tablets:
 -  Fix use after free on platform_device_register() errors

----------------------------------------------------------------
Anaswara T Rajan (1):
      platform/x86: dell-ddv: Fix typo in documentation

Armin Wolf (2):
      platform/x86: dell-laptop: Do not fail when encountering unsupported batteries
      platform/x86: wmi: Update WMI driver API documentation

Crag Wang (1):
      platform/x86: dell-sysman: add support for alienware products

Hans de Goede (2):
      platform/x86:intel/pmc: Disable ACPI PM Timer disabling on Sky and Kaby Lake
      platform/x86: x86-android-tablets: Fix use after free on platform_device_register() errors

Jithu Joseph (1):
      MAINTAINERS: Update Intel In Field Scan(IFS) entry

Srinivas Pandruvada (2):
      platform/x86: ISST: Add Diamond Rapids to support list
      platform/x86/intel: power-domains: Add Diamond Rapids support

Zach Wade (1):
      platform/x86: ISST: Fix the KASAN report slab-out-of-bounds bug

 Documentation/driver-api/wmi.rst                          | 11 +++++------
 Documentation/wmi/devices/dell-wmi-ddv.rst                |  4 ++--
 MAINTAINERS                                               |  2 +-
 drivers/platform/x86/dell/dell-laptop.c                   | 15 ++++++++++++---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c        |  1 +
 drivers/platform/x86/intel/pmc/spt.c                      |  2 --
 .../platform/x86/intel/speed_select_if/isst_if_common.c   |  5 ++++-
 drivers/platform/x86/intel/tpmi_power_domains.c           |  1 +
 drivers/platform/x86/x86-android-tablets/core.c           |  6 ++++--
 9 files changed, 30 insertions(+), 17 deletions(-)

