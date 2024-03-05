Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF052F85
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 09:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631731; cv=none; b=ZfoS3VvDL420keTX79F1NXTtZuUeDo1wHQ04MECMUP9JWm/HquhjAAVslax4fFn5G1of71LwHv6StUlwl+yrhX63CUuZZbCR9+EIdU/mbjCgOL1k2+ecO7ERpgflDGo67Fj0c1AMfaUVfjWkSyr28+SbX9GibMlAlyIqs90eiKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631731; c=relaxed/simple;
	bh=j99ddBTiQ9lQxPqXZPMvZcO5f+DwjapqgNSi3KxFs4E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qR0a8/cuZoHl9+gNnyc49wejmTsJFYQ79iNGPcb+OueFOkaYG89wk17MdVqccBh8Bo+uUqTV7+35733hlU6O8DWGU7H5RfINJoQ4cTcFfUfF2Uzt2f44dpojp45SwcQdnfiUGocI4NGQxLt5M2U+rbrTSt9AQvvoLAi9HVgqlB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N8oi4Rek; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N8oi4Rek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709631728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wr0roZvWuOsUV+YvTOf0P3aaCM+zuRpbCTEDJoBeQ4c=;
	b=N8oi4RekrVIqShVUW8sEJUqMM0MzgXUD170SNOyDh+OAVZIcST8jYxCeHGNkF2Ci7kLgGA
	iFlDtqP3M2lXvpPSY1ix6WvzIcS7TcqrUi7yf4zEgCrXMMtI7U9Fe+pcPf+Av3Ncn7N9Is
	fzHauMEhvoo5zhlpi+tP2xpCP2WWlXY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-LAAqNvQXP5-RZqzxxAAHEA-1; Tue, 05 Mar 2024 04:42:07 -0500
X-MC-Unique: LAAqNvQXP5-RZqzxxAAHEA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40fb505c97aso31797365e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Mar 2024 01:42:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709631726; x=1710236526;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wr0roZvWuOsUV+YvTOf0P3aaCM+zuRpbCTEDJoBeQ4c=;
        b=HfejlXvyXMQYuAFUUaehagub3FvHKiGTH3OsCi+blbgkIu3TlWGSa47p7y54qrFccN
         Occ0IBGWF3yyUv0Iv754XNjwBDLeSpDfrJ6ju7WKwqgVuZFA2sdXD6y3y0nU7snPde5I
         eesT4gl+Ewb+LYu2PT1ty9zWvcZP7kMn/K/57ULrW5etRPt3lYcyk3vT+SOB/JEJINrX
         QvBBWz447Q/3zY+66B1AIE3UVc9yr81U25T4kqqmoZcf0smRYXpGFGRORYECnom/h2xX
         zSmbH7ie/Z9xJpwBihOyWs5HJlyQBUlOL8KT1ksjo3zHFyNlWwkkMQSfx2cDo3GhD3Yh
         jzQw==
X-Forwarded-Encrypted: i=1; AJvYcCV6HqMTBFhnMteiDFNu0+BP+txOPDrUUW59Bd6LbAa3n70NXblzGZSNhnEtDAnJpMdwSR3LUpFVMHvFOyxp1OTFZma1S6elRHAlgZDjz1Dsqc1lTg==
X-Gm-Message-State: AOJu0YyLzEdW2FS/1DK5nlC1qi9ZuU9e1RZ60X7zrTNGGgexw/FyZXpV
	FpKlG2djirDkks+C1qFFt5g/7/vzNvLpJ0Tp0bqaUyAnBz6aF5wtxE/vafsDy/9TOFNUv0tv85y
	pJbxeXtXtLYbILLDBtWHKOSXQ/clAJO+cZUnF94iASUOqpfZxUWeNMdtDKz8m60nfzn3Sctk=
X-Received: by 2002:a17:906:374c:b0:a45:8424:163d with SMTP id e12-20020a170906374c00b00a458424163dmr2143501ejc.17.1709631370709;
        Tue, 05 Mar 2024 01:36:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoYQkZSrR5bSpBqmOm1XmIkknblRMs/TxvEnFWo/B3gpC5Ka7h1SJRq8pzlbR5tYftd8e0nA==
X-Received: by 2002:a17:906:374c:b0:a45:8424:163d with SMTP id e12-20020a170906374c00b00a458424163dmr2143493ejc.17.1709631370440;
        Tue, 05 Mar 2024 01:36:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rp25-20020a170906d97900b00a3d665c6778sm5922772ejb.12.2024.03.05.01.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 01:36:10 -0800 (PST)
Message-ID: <cfc29d60-e11c-4d7f-9d9d-637ebde8f5fd@redhat.com>
Date: Tue, 5 Mar 2024 10:36:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.8-4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Here is the third round of fixes for platform-drivers-x86 for 6.8.

Highlights:
 -  Fix P2SB regression causing ACPI errors and high CPU load
 -  Fix error return path in amd_pmf_init_smart_pc()

Regards,

Hans


The following changes since commit 427c70dec738318b7f71e1b9d829ff0e9771d493:

  platform/x86: thinkpad_acpi: Only update profile if successfully converted (2024-02-20 14:35:36 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.8-4

for you to fetch changes up to 0314cebb29be2f961abb37bd0b01cb16899868f2:

  platform/x86/amd/pmf: Fix missing error code in amd_pmf_init_smart_pc() (2024-03-05 10:17:07 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.8-4

Highlights:
 -  Fix P2SB regression causing ACPI errors and high CPU load
 -  Fix error return path in amd_pmf_init_smart_pc()

The following is an automated git shortlog grouped by driver:

p2sb:
 -  On Goldmont only cache P2SB and SPI devfn BAR

platform/x86/amd/pmf:
 -  Fix missing error code in amd_pmf_init_smart_pc()

----------------------------------------------------------------
Hans de Goede (1):
      platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR

Harshit Mogalapalli (1):
      platform/x86/amd/pmf: Fix missing error code in amd_pmf_init_smart_pc()

 drivers/platform/x86/amd/pmf/tee-if.c |  4 +++-
 drivers/platform/x86/p2sb.c           | 23 ++++++++---------------
 2 files changed, 11 insertions(+), 16 deletions(-)

