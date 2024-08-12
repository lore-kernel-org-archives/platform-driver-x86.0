Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FB5174EEB
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723472613; cv=none; b=OSZkl7S/0Nil0ElMJWNvuo8Keuo2ATizd5SsJUErUEahiL/CoC7oFKmtKLIjEOD5jUoC7romVYOV3ulhjwrDWdBShBXqHPPdGK9TphCE9L9mmn2TVkx62VfwfUbFWhGpojRh/zJJIfIY0s3eln7DwfW9oTdEaSTZRZBHzXybQao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723472613; c=relaxed/simple;
	bh=712qkD3w2B1MunNmovSNulgnINg6FgnsQ94E4m8hR3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dMRGZow1BV4dDNlTL8JJv/D4oN8Rr5jQ7PrOvnd02INgCVfDYre5fFNivb34HbufrocTQ00Sle/IvwJ7SHq4muiHQvo0O9Oxj9vKeOLjB+xBkOnFCHbbvDrzus+hAA1/lv/if0hgnzqwq0XHjj8e+mTzuSjhZS/IS5irXVJkNSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ASdEEfgd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASdEEfgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723472610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AvD1fQXjUL7GetyMaeC5mByTFEMKL1YNf7XvnMmgciM=;
	b=ASdEEfgd3kuo5vX6h5dCKn6++uhDroRAUus/Erce/n8S6Z2nLr52wjq59IEuxDQNx7fLYH
	r6nqiV/z+sDH27H+3qs9SrUnJrFVt5Mo0lN5vV+FoiG639K8LaukP0O4Pl44SBDskIlU6T
	Kz5URD/uCNm8n3vhNNBkPd95IJVmbd8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-M_-sYo8COwOlIfnpX1poWA-1; Mon, 12 Aug 2024 10:23:29 -0400
X-MC-Unique: M_-sYo8COwOlIfnpX1poWA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5bb35b28f82so3164630a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 07:23:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723472608; x=1724077408;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvD1fQXjUL7GetyMaeC5mByTFEMKL1YNf7XvnMmgciM=;
        b=rGLoQBuH8IAyKT5La4vKEcJWJ+T3M9AwKNFBLCMQTlS9dikXM2NAd68jQaj+wMOnKW
         FiOLY3L+n49OBDiIagP9i0I9XeDRW1/jkFlPDMPnTm1Uo1KGblGh/3LZ+6O/09+ERrQP
         j3AcWvKcrD0yR+fVnnIdtsQbCQU6d/K3NoeU5nL7/tuYoGKJ3Tfjk/Wx1WYWohkbW3Qn
         T1rutNdvr4Mg7MAaqpDH4jlcwKOTywNUk1O0gV8KJaDeYe14bAJwMishlAE19OH9Ex8n
         FTn8tEFPn5kJqoeIyD7b5WZ6ZfDKzoZ05CpfhC0pu9xnn1Z0PIvOD1b6JVmS8xJLWtjh
         Wstg==
X-Forwarded-Encrypted: i=1; AJvYcCUeK2dJrbREeDTgmvjDnhuls8LVQPhx8qwUfAvpOK/JrMWTXilRa/sfnxIRDgWoXrXQbQT00C7ABs0cWP2Vkoek5Y6yAJ9QXecqdarkDBVr5SozFQ==
X-Gm-Message-State: AOJu0Yy6MBp2+vMt4SCxYCx2B7JIGxxR4zqQZJyiYmeIPBrv16r9G1+N
	nnubt0DOW+lbN46PXJ+Sa/DKwYUb7mDHFhgjmbZvwzowf8qk0s5qPAfkl38kfScYD7DxhK2oAKd
	RpGUluvw2HHJYYB+Li8nF3809Qdt4JG67ZesktJdvX4X12vLT6dQXvKbJBzXCMCQEhfTQyA0=
X-Received: by 2002:a17:907:7e8a:b0:a7a:c197:8701 with SMTP id a640c23a62f3a-a80ed264d56mr34719766b.31.1723472607970;
        Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKNVohbOvCoibpNzNENyqGS2424RB1Ghh2P0JJ6aFOlwWJWi9VNXDR/UXA5kaxLBz6Wt3vPg==
X-Received: by 2002:a17:907:7e8a:b0:a7a:c197:8701 with SMTP id a640c23a62f3a-a80ed264d56mr34717166b.31.1723472607442;
        Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80bb243c55sm231218266b.220.2024.08.12.07.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 07:23:27 -0700 (PDT)
Message-ID: <bdc2990c-b09f-4e63-9961-9752324afb47@redhat.com>
Date: Mon, 12 Aug 2024 16:23:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] Support PMT features in Xe
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 matthew.brost@intel.com, andriy.shevchenko@linux.intel.com
References: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240725122346.4063913-1-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/25/24 2:23 PM, Michael J. Ruhl wrote:
> DG2 and Battlemage have the Intel Platform Monitoring Technology (PMT)
> feature available, but not in the "standard" (pci endpoint) way.
> 
> Add support to the vsec and Xe drivers to allow access to the PMT space
> for the DG2 and BMG devices.
> 
> The intel_vsec_register() function allows drivers to provide telemetry
> header information (usually found at probe time), to allow the PMT
> driver to probe the telemetry features.
> 
> Battlemage has a shared memory area (selected by index), so a callback
> function is required to access the appropriate PMT data.

Thank you for your patch-series, I've applied patches 1-3 to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

For patches 4 - 6 please address the review remarks and post
a v10 based on top of my review-hans branch.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> 
> V2:
>   Re-worked DG2 support patches using a base_adjust rather than a
>   quirk.
>   Updated GUID decode, for correct decode.
> v3:
>   Fixed a documentation issue for the pmt struct.
> v4:
>   Fixed a documentation issue in the xe_vsec.c module
> v5:
>   Addressed review comments for patch 4 (Xe driver)
>   Add r/b for the first three patches
> v6:
>   Added kernel doc to moved data structure
>   Added required include files
>   Correct usage for FIELD_PREP()/FIELD_GET()
>   Whitespace clean up
>   Removed unnecessary type cast
> v7:
>   Commit message updates
> v8:
>   Added some r/b (patch 2 and 3).
>   Updated kernel doc patch 2 (priv_data) patch 5 (base_adjust)
> v9:
>   Add r/b for the Xe driver patches
> 
> David E. Box (3):
>   platform/x86/intel/vsec.h: Move to include/linux
>   platform/x86/intel/vsec: Add PMT read callbacks
>   platform/x86/intel/pmt: Use PMT callbacks
> 
> Michael J. Ruhl (3):
>   drm/xe/vsec: Support BMG devices
>   platform/x86/intel/pmt: Add support for PMT base adjust
>   drm/xe/vsec: Add support for DG2
> 
>  MAINTAINERS                                   |   3 +-
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/xe_device.c                |   5 +
>  drivers/gpu/drm/xe/xe_device_types.h          |   6 +
>  drivers/gpu/drm/xe/xe_vsec.c                  | 300 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vsec.h                  |  13 +
>  drivers/platform/x86/intel/pmc/core_ssram.c   |   2 +-
>  drivers/platform/x86/intel/pmt/class.c        |  28 +-
>  drivers/platform/x86/intel/pmt/class.h        |  11 +-
>  drivers/platform/x86/intel/pmt/crashlog.c     |   2 +-
>  drivers/platform/x86/intel/pmt/telemetry.c    |  21 +-
>  drivers/platform/x86/intel/sdsi.c             |   3 +-
>  drivers/platform/x86/intel/tpmi.c             |   3 +-
>  drivers/platform/x86/intel/vsec.c             |   9 +-
>  .../vsec.h => include/linux/intel_vsec.h      |  50 ++-
>  15 files changed, 428 insertions(+), 29 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
>  create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
>  rename drivers/platform/x86/intel/vsec.h => include/linux/intel_vsec.h (61%)
> 

