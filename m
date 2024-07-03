Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19FD174EFF
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Jul 2024 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004288; cv=none; b=HSq+BiPWgqjsEOtTk5IAUcJGE+94ivos14uhcNcbJz+toBK3rswbAy5xnqU47piZa7HMYm5/0R6ez9CRGWz1dDRj+5+ECQzD6ARh9+52j+SKNW1JclCheUdKCETQ2N66IhAYhXX9doHh17dYUOOIqa5bva4XFmUTEuTvDJEpQ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004288; c=relaxed/simple;
	bh=31O4MI1qbEZRHg5azxrIZyeSMMRy0hxOIQBWbe5bO/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyKfqT7SIgcGM/2fDjvvNatNSzG3og04yRrX1fUyD/F3/6HqQ4QgFmhRLBDuLu14a4hEGoJcDwNvlzb+u5/8ElFSD5BAiqaAEn/e5hLr+SmCh7wqa+lxZJO2wilr4N3LoTtX5ZgVCBgSz+kyKlagaI/hKhrNX/khOAsplxr1zjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8WfKxvN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8WfKxvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720004285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wmWsAoG+lkXZowuDnJDAqFgCeapVjUys75g9nC6TYW8=;
	b=D8WfKxvNUODuxy30Fy0E9x5RLf0TYSUdPTHqZkHiKgnq6xHlLT+iiK5Z7pHsmsQyDN9are
	1i1WPPX/l6sLdkFo37mg35sN4dIrVonvLv7Eeb2y5Quz+IQeXM6/1QGA+dG3767RdolW3V
	h/Q1Pd1IChRgbGb4Xd0GKWqMLreNKwc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274--UR_i_zJM9qe10PAhlmBRg-1; Wed, 03 Jul 2024 06:58:04 -0400
X-MC-Unique: -UR_i_zJM9qe10PAhlmBRg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a725a1c6c3eso364637266b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Jul 2024 03:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720004283; x=1720609083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmWsAoG+lkXZowuDnJDAqFgCeapVjUys75g9nC6TYW8=;
        b=KDNiqC68Q8YNhWOBYKIEdfZFWTRe3P6ffprR19CTf+IsoPhYPC+5SuFnF6MQ/YC3TD
         Y3Ariuo1O5QyzyozND87ZVMKP4saOwQBrAdwGyjRuVLWgv0bnFxWXZuBOwP521ooSX2X
         ADwISWeq+x4aYxOlR8NTU3IqwqBt1ayQf84jNlBMoHDV9qgTtyxZU1Rce7ddDXB2YHUb
         H5J1AxizyDAgq6DJnFqFCTSZKaPJQ9UTvky1Bm4KQJO8m8ghntlUKlUOz8N5aY6dDFzs
         shV2KyV/LfK4gTRCsf0YCwMBvP2AMi1KTo4qFwX5hATdujejB9Z17eux9RFyY8b9nznY
         6Pkw==
X-Forwarded-Encrypted: i=1; AJvYcCX6uLoNPyDrTqo4Rp4H3gAYJbxxXAkTmrVWKXrqQ1/FYssfEXJg36TvPHFA9EIZaOpBqNSmAx3e5U3I/VB8NNHDk6a7AbgdVwvq7EkDCXGlcMEb5Q==
X-Gm-Message-State: AOJu0YxxdylKL4pqnXdUr64aJYjmZkDH7JZk8OTRdHQaWy10+hqiw70E
	QLylfJr5RdIqB5Ep865gvpugF0jwF9Jwe309+MURIq2Lf5AtmPc2hsOpXsUvR3dFNxhquxTZ0uw
	/d2wRp5Qv2QCguKufyy4JSNXV+m7TYoVacBAvsL+Hq/mwZ3QfgzNs5uKprz0/OsUCdNzKHJs=
X-Received: by 2002:a17:906:590:b0:a72:6ff6:b932 with SMTP id a640c23a62f3a-a75144a27f1mr622401166b.51.1720004283226;
        Wed, 03 Jul 2024 03:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBlfqzjAaMyJIf6auxmROjQBDOa8a+YzkHWXo8dsZDzHLeKzoRHXUqB+oF/vrYfMCOe4Szcg==
X-Received: by 2002:a17:906:590:b0:a72:6ff6:b932 with SMTP id a640c23a62f3a-a75144a27f1mr622399766b.51.1720004282780;
        Wed, 03 Jul 2024 03:58:02 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf5a612sm500246966b.51.2024.07.03.03.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 03:58:02 -0700 (PDT)
Message-ID: <a6a554d1-2cdb-4e34-ac07-2778d534b558@redhat.com>
Date: Wed, 3 Jul 2024 12:58:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] i2c-i801 / dell-lis3lv02d: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-lis3lv02d
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240624111519.15652-1-hdegoede@redhat.com>
 <20240624182812.fa6akymygv3qolug@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240624182812.fa6akymygv3qolug@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/24/24 8:28 PM, Pali Rohár wrote:
> On Monday 24 June 2024 13:15:12 Hans de Goede wrote:
>> Hans de Goede (6):
>>   i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
>>   i2c: i801: Use a different adapter-name for IDF adapters
>>   platform/x86: dell-smo8800: Move SMO88xx acpi_device_ids to
>>     dell-smo8800-ids.h
>>   platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
>>     from i2c-i801 to dell-lis3lv02d
>>   platform/x86: dell-smo8800: Add a couple more models to
>>     lis3lv02d_devices[]
>>   platform/x86: dell-smo8800: Add support for probing for the
>>     accelerometer i2c address
> 
> Patches 1-5 looks good. There are just a few minor things, but you can add
> Reviewed-by: Pali Rohár <pali@kernel.org>

Thank you.

> For patch 6 as I mentioned previously I'm strictly against this change
> until somebody goes and politely ask Dell about the current situation of
> the discovering of accelerometer's i2c address.

Dell is on the Cc and not responding...

> And if there is no other
> option than start discussion if Dell can include this information into
> DMI / ACPI / WMI or other part of firmware data which they can send from
> BIOS/UEFI to operating system.

AFAIK newer Dell laptops don't have a freefall sensor anymore since
everything has moved to nvme. Even the bigger laptops seems to simply
have multiple nvme slots rather then room for a 2.5" HDD. Note I did not
research this, this is is my observation from 3 newer Dell laptops which
I have access to.

Regards,

Hans




>>  drivers/i2c/busses/i2c-i801.c                | 133 +-------
>>  drivers/i2c/i2c-core-base.c                  |  18 +-
>>  drivers/platform/x86/dell/Makefile           |   1 +
>>  drivers/platform/x86/dell/dell-lis3lv02d.c   | 331 +++++++++++++++++++
>>  drivers/platform/x86/dell/dell-smo8800-ids.h |  26 ++
>>  drivers/platform/x86/dell/dell-smo8800.c     |  16 +-
>>  6 files changed, 379 insertions(+), 146 deletions(-)
>>  create mode 100644 drivers/platform/x86/dell/dell-lis3lv02d.c
>>  create mode 100644 drivers/platform/x86/dell/dell-smo8800-ids.h
>>
>> -- 
>> 2.45.1
>>
> 

