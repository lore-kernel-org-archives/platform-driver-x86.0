Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2994C62B
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719659255; cv=none; b=EWkBV8j0TNECyrxvcI4bmKHfnOq3pVGkYl1hanLmwBqhINxqKEh4DlF7PU/31JgjmPcXflTpSpX5AccIoEXIgDQJm9g9B8k9dCALuVNJS/z/2KUA+v3zANsBSbkP4+9Z+Xbw4VtmXc8CLGYOTB52C/SPAqh/D2SROxgck1ZPcoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719659255; c=relaxed/simple;
	bh=NcxFNUMMQezM2LMdc1WYMgJDFmd3gJrEycPqfxG99F4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=U3I1P/1IwsCeoHdqyhLFh+1kauu6PPIKW5Jv/LITyT6P0ZBNd6jfiCIDhv6qQgY9hU4RpdrdHeKo1UvjYaVClxEiiOGHKDFw/i2SMbSpOYrbJaF6wjmZDnOL+luDVYNdc7k4aJsen/yKr+hjdOfseoFR5qIqIXUUAnAq2Ny1H8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e8hr2XI1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e8hr2XI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719659252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xeiu4yUjhxRvSoRvsElkoFHjxoTJHRpvHUxDn3uagD0=;
	b=e8hr2XI1ALzj4fuIXhQZWdEB9sr06O/QTBLUH0PB8GPiwGWWv3D8b/2fQFv6eIIiNoPGkm
	GZ1PCxaiN7HXJjV4og2rrmwTwynxKzx1qR53cm7HqMEKK5TC9c3nM7514RjhjSd/XIzVNC
	5OHGiQJbt7UY53KfYH1NcVWY0bsYvVk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-FVdrebw8PcyFMj6n-v6K3w-1; Sat, 29 Jun 2024 07:07:27 -0400
X-MC-Unique: FVdrebw8PcyFMj6n-v6K3w-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-57d5467c427so1090100a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2024 04:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719659246; x=1720264046;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xeiu4yUjhxRvSoRvsElkoFHjxoTJHRpvHUxDn3uagD0=;
        b=jueZ4jqndwPREwdubjPlnFSI4Ne3nCFXk/eCg0KmHIjAWYgA/9E7gvjn66mQOy7hl6
         JkOM9Jgu5PpiRUSl67mit0vysohtFLW4oHoo+hxMpDfc+NtigCZLmxtb8kcttIuSvyUX
         9M0Oq2x42/qfIf2Ulpjb8QHbn7Dga9DNOZkBOp1Orl7FRtfJqbp4zJOXPUSM5K+RAOmE
         rIgyZx/y8AiDlWP3nwTwbThMwAsjJHuZ3raaiEHVfnS8S2MMt2lX6BwTBFfa5aNj6zZy
         IytbbAy2i/hbfr3Ht473v9WsSVdsUb9teF93Wkgno9g3Pim4h80+PgXi5KOJiDAanz2m
         4/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWOrzeqTmvtupqR1HpatkX2fOkREdlHVY9EcXZQV+oDRFmxEqQMBUz3dYCYQnUcsOO90rhfhJQsnk7ci47nLl2noWXwDvH9EFxn009nrwFPHvroTA==
X-Gm-Message-State: AOJu0YxaA1lZ7u1nYv5VNQV6B40fqdUfP2V0F64KSqW4A7w6HpJsOLMk
	jkqhAQrz/1aNsptOzHgFWc45fl6uwANorY25wRki74Eqd5aH9i5OuqbFZx9kVgJ3nGVvmzLQTvK
	DVh4t5qjVa1WabjdZ8J9BANZbvRcCuEteXWkQwMpw0Divh+PxLW6r0Px8CyY7Ex2ZeMQkla3miR
	Isej0=
X-Received: by 2002:a05:6402:13c5:b0:57d:5ac:7426 with SMTP id 4fb4d7f45d1cf-5879f0c68dcmr617478a12.9.1719659245797;
        Sat, 29 Jun 2024 04:07:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKKZ2Whjr0POZ5x7iFcBXdDHfuXZ1a5911pCuil2ybmEGOUa7+r9+7NPJ1vu40qlVCKgzoqg==
X-Received: by 2002:a05:6402:13c5:b0:57d:5ac:7426 with SMTP id 4fb4d7f45d1cf-5879f0c68dcmr617463a12.9.1719659245292;
        Sat, 29 Jun 2024 04:07:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5861381756esm2154757a12.56.2024.06.29.04.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 04:07:24 -0700 (PDT)
Message-ID: <e472b2cb-a6bc-4959-9b3d-540930f8118a@redhat.com>
Date: Sat, 29 Jun 2024 13:07:23 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.10-4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is the third round of fixes for platform-drivers-x86 for 6.10.

Highlights:
 -  Fix lg-laptop driver not working with 2024 LG laptop models
 -  Add missing MODULE_DESCRIPTION() macros to various modules
 -  nvsw-sn2201: Add check for platform_device_add_resources

Regards,

Hans


The following changes since commit 77f1972bdcf7513293e8bbe376b9fe837310ee9c:

  platform/x86/amd/hsmp: Check HSMP support on AMD family of processors (2024-06-03 11:57:28 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.10-4

for you to fetch changes up to 7add1ee34692aabd146b86a8e88abad843ed6659:

  platform/x86: add missing MODULE_DESCRIPTION() macros (2024-06-24 13:33:20 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.10-4

Highlights:
 -  Fix lg-laptop driver not working with 2024 LG laptop models
 -  Add missing MODULE_DESCRIPTION() macros to various modules
 -  nvsw-sn2201: Add check for platform_device_add_resources

The following is an automated git shortlog grouped by driver:

add missing MODULE_DESCRIPTION() macros:
 -  add missing MODULE_DESCRIPTION() macros

lg-laptop:
 -  Use ACPI device handle when evaluating WMAB/WMBB
 -  Change ACPI device id
 -  Remove LGEX0815 hotkey handling

platform/mellanox:
 -  nvsw-sn2201: Add check for platform_device_add_resources

platform/x86/intel:
 -  add missing MODULE_DESCRIPTION() macros

platform/x86/siemens:
 -  add missing MODULE_DESCRIPTION() macros

wireless-hotkey:
 -  Add support for LG Airplane Button

----------------------------------------------------------------
Armin Wolf (4):
      platform/x86: wireless-hotkey: Add support for LG Airplane Button
      platform/x86: lg-laptop: Remove LGEX0815 hotkey handling
      platform/x86: lg-laptop: Change ACPI device id
      platform/x86: lg-laptop: Use ACPI device handle when evaluating WMAB/WMBB

Chen Ni (1):
      platform/mellanox: nvsw-sn2201: Add check for platform_device_add_resources

Jeff Johnson (3):
      platform/x86/siemens: add missing MODULE_DESCRIPTION() macros
      platform/x86/intel: add missing MODULE_DESCRIPTION() macros
      platform/x86: add missing MODULE_DESCRIPTION() macros

 drivers/platform/mellanox/nvsw-sn2201.c            |  5 +-
 drivers/platform/x86/amilo-rfkill.c                |  1 +
 drivers/platform/x86/firmware_attributes_class.c   |  1 +
 drivers/platform/x86/ibm_rtl.c                     |  1 +
 drivers/platform/x86/intel/hid.c                   |  1 +
 drivers/platform/x86/intel/pmc/pltdrv.c            |  1 +
 drivers/platform/x86/intel/rst.c                   |  1 +
 drivers/platform/x86/intel/smartconnect.c          |  1 +
 drivers/platform/x86/intel/vbtn.c                  |  1 +
 drivers/platform/x86/lg-laptop.c                   | 89 +++++++++-------------
 .../x86/siemens/simatic-ipc-batt-apollolake.c      |  1 +
 .../x86/siemens/simatic-ipc-batt-elkhartlake.c     |  1 +
 .../platform/x86/siemens/simatic-ipc-batt-f7188x.c |  1 +
 drivers/platform/x86/siemens/simatic-ipc-batt.c    |  1 +
 drivers/platform/x86/siemens/simatic-ipc.c         |  1 +
 drivers/platform/x86/uv_sysfs.c                    |  1 +
 drivers/platform/x86/wireless-hotkey.c             |  3 +
 drivers/platform/x86/xo1-rfkill.c                  |  1 +
 18 files changed, 56 insertions(+), 56 deletions(-)

