Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA9193461
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720621384; cv=none; b=KLU7RTlEfPCix3Wv8185q4GNFB0F0+G0CObEC3E3glcFdlK2MvWzQsCTE38IhEFw6gQfLHRDClZaf+/X548WkxiJ9tlGFz/d0nl1Ucj2CHCVHn/krUKLx04EquxhBKXQU5MVbUC2loOz/o/dCTbLfgXmRd5/L8jSiKBPpGHLHng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720621384; c=relaxed/simple;
	bh=p0+EoZLb+ZwsOTVF8E7aiOGT0pHxopGnpdy4Sf0UvpM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=Nj1Jh80aPkKAiDxYD/hCuYNdu0y/WHqaM5JBOG6g6LAiJr/HVdYQb8sQlpjAb78Hhq8t1E6XkOKYOFAD0jDOwO38vMb6b2hX30wWzcLt0i70lS/RV2cBzuQeOp5NL9LtFybDm97ITgz7muKmSh5q8mWCnLhsFcpDhRtNKjqr8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZDDll7Kx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZDDll7Kx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720621381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0aeBWS3AAsVoK9IvRxT7ZLtZehhCNS8N1P662U6sOik=;
	b=ZDDll7KxnXSEINoYSGTUwkK+qSTk2VPmFgvoK5CVdpiWT3Mf+OhqxrONO8P6Ad90ufNfiS
	+0iBVNrtlob22QKGsMAM4LYngClrTn6JArc+46S1yjb0wsMUHmstXMK/k/uyxIoHq0AAWm
	XwYxAtK/eUczdzbF4If4D2lSd/zQE20=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-e7m5rMVFNnaIjNi2YeU3jg-1; Wed, 10 Jul 2024 10:22:58 -0400
X-MC-Unique: e7m5rMVFNnaIjNi2YeU3jg-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52ea96518beso6155937e87.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2024 07:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621376; x=1721226176;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0aeBWS3AAsVoK9IvRxT7ZLtZehhCNS8N1P662U6sOik=;
        b=TIH8omU2HRbKWBlKa3hzcBuYoqDvIrMLHLM6Y4JuXnym3SzV9vqW1e7b8Miz0C1tO/
         U31fWYFdNF+YCcaDMXVHWdbXyYgZAb76G9kwp47odLazL0kRbCTsKGWcvcNpcpMmwIMr
         vvaM1+TExMTKydI8gBCRzZR4A1F9oznbbJhYvyzpaWX8XrQBMb6tg2PfQRwrEaJ5RW6s
         s2mZBG+YKxVKgxypBVD/yFpVbR7xrwYl2N0FUv56D8m9jqin75fZ4VawhbSOyKWZoBHg
         f4tlNwDsDl+FL2BYzCzo/lCOVNSFxFc2Z2H/zvLV9WkjpzALMwMAGz27GJ+lMb74tIhY
         RojQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmx54BoPc0Wc1IZ0z0p6m4oVQSzMFPqt/FVaRLaCj83tBDSkTEURwcZu9qJuzmJuoY/sTURI4XMejwu0nnlFpWl2+QjS6Fk/1s646MrssmAg6QJg==
X-Gm-Message-State: AOJu0Yx0i/VvC7qq/GvemFpUwoMzeWq0L/MZVZOJkxLcEI9kL/p2Niao
	10bU0t1RBRHn1V4duUwaoAk6SYyZDfQSvOrWLGDgv7pE6etKxsoG5I1C5VNJ9zilC8VWxySEQC4
	OTl5J0N02r0Ie7zIk1pFjI0WT6A+NErSqtPuVENDPFQ1CSR5IUY4ueY8NZJsX0Bsy8PcuihA=
X-Received: by 2002:a05:6512:2349:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-52eb99d6033mr5542874e87.57.1720621376654;
        Wed, 10 Jul 2024 07:22:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOf2cWFowYkkgGMGqSxA/m5lpqwUkfnLlyd2jqlVEYpWrczj89+qz7lKFVt10/WOFCvZ85Tw==
X-Received: by 2002:a05:6512:2349:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-52eb99d6033mr5542854e87.57.1720621376273;
        Wed, 10 Jul 2024 07:22:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc876sm163398366b.5.2024.07.10.07.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 07:22:55 -0700 (PDT)
Message-ID: <4f4c8c2a-c7ae-46bc-babb-7c6df4501df5@redhat.com>
Date: Wed, 10 Jul 2024 16:22:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.10-6
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Linus,

Obviously I should not have jinxed things by saying that my previous pull-
request would be the last one for 6.10.

So here is one more 6.10 fixes pull-request with a 1 liner fix for
a dmi_system_id array in the toshiba_acpi driver not being terminated
properly. Something which somehow has escaped detection since being
introduced in 2022 until now.

Regards,

Hans


The following changes since commit e527a6127223b644e0a27b44f4b16e16eb6c7f0a:

  platform/x86: toshiba_acpi: Fix quickstart quirk handling (2024-07-02 16:01:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.10-6

for you to fetch changes up to b6e02c6b0377d4339986e07aeb696c632cd392aa:

  platform/x86: toshiba_acpi: Fix array out-of-bounds access (2024-07-10 16:12:12 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.10-6

Highlights:
 -  Fix missing dmi_system_id array termination in toshiba_acpi introduced in 2022

The following is an automated git shortlog grouped by driver:

toshiba_acpi:
 -  Fix array out-of-bounds access

----------------------------------------------------------------
Armin Wolf (1):
      platform/x86: toshiba_acpi: Fix array out-of-bounds access

 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

