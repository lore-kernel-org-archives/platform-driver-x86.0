Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3169715921E
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746829; cv=none; b=PT8q1qcMQnElrBLfBnuFa8cQOpqhBTYX80E1HnCCahy8eBZsAqsvHDz1w3Q5ztXHVjw3rsFZYGPLV2kluiGn18zVj/DasKhQdX5PEPBdW7+hCyq0HxtWDN9tlMVR4XNVZLbZmp4Lq/CL27H66jpxnzXJ/KPOICXmUU51lI/u4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746829; c=relaxed/simple;
	bh=TRbv3m5WRpUW/kPuUQ9Lt5c9hgvwOcwmU6Rb0Cht/0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lyS01VNBwjOz45nOorYsJXqezEHKESYoTz8Y6ghHpM8kp+IJLQJay6B6y/hC3n/w/IBtws+mEHWiWUc3POnZ6bBcEPd8tmenle3IVICoZUQnyPrnHbsTWGVibBdKbgWLsxHKv5rZ3D/cS74EGFjT2UVcHzhwv9X7ZXIJciGDg00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YOkFV1Ar; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YOkFV1Ar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712746827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FAN6eh8bu67NKq/ARd7vlUpySDLdLJHrs4fZKNdTOc=;
	b=YOkFV1ArBakA8PgaQSh4we6K2fn/41ug9oBGOe3KmPcSysO05ZX30crI12807TN4KtnOFc
	wRHdHsDYMw3cQmRd4toK7oUY7g6ucHN6ttMqbBkWVidErkq80zDb1J1WZF3T/PaqSiuKPU
	M20SJgn1RECgBEmAFlAujRzNojcJVsM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-nJ8X4LiIOpeQX3zWpagxIw-1; Wed, 10 Apr 2024 07:00:25 -0400
X-MC-Unique: nJ8X4LiIOpeQX3zWpagxIw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-515d5dcd75cso5643180e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 04:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712746823; x=1713351623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8FAN6eh8bu67NKq/ARd7vlUpySDLdLJHrs4fZKNdTOc=;
        b=hTlWDYcbpEQ9bU5HBVP2lIBsiCsJ3Jz1n7z9SLmExge9Lt8RM5CP0+k7Bgyjbic4Qc
         G+81Z7lOoCwVk22Wq31pOcfXqC6+Ba6ZL9tliA4UQpUArwFsD4NULaSCcnhr1iezGNJJ
         wPsCuyLoUrhROql40voQm4CRU1htgVKZeHiudb59hRB5AzSuEUGEqxqAHdPgcOAKubgE
         vDynLIqHyTHVJMmg2MXI7TaZ5XPqNoda6uGg39CIK9ZksMMFHfruodBtw5fZAKmXD5As
         g1gLSo26LzwE2XNM3Rm0CEMwar5UI1TZIJs0SRLNM6dZTMVd9i4YM/WGYZhQlSheLEDS
         lmHw==
X-Gm-Message-State: AOJu0YyukokCgavJzXMSRygTwalAneH0Fo+DSx8sLdIST4omfXdc/XEP
	aryolfM9UgEKjwFQcEydEcKM/hcc/SMreA3yqHMH9Hg/dlUG+OJXie2z8d31tvWqTvdhZw0d6qN
	7JRcS3lisLlTSM9h8iK0IAJjy7zy07APjc/JJhXn1LOPTfnBkslSH8SUlaE9F6lh1dP+8mOOEcC
	sv4+U=
X-Received: by 2002:ac2:4213:0:b0:515:8c3e:5665 with SMTP id y19-20020ac24213000000b005158c3e5665mr1549504lfh.27.1712746822809;
        Wed, 10 Apr 2024 04:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtRBcodkfAPVzHzR6rAgLYuyNguGaz5aoTqXtK2sLX0oISN7HiFpdxmAXTvLXYwNeQOn8Lvg==
X-Received: by 2002:ac2:4213:0:b0:515:8c3e:5665 with SMTP id y19-20020ac24213000000b005158c3e5665mr1549484lfh.27.1712746822304;
        Wed, 10 Apr 2024 04:00:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ak2-20020a170906888200b00a51dccd16d9sm3222697ejc.99.2024.04.10.04.00.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 04:00:21 -0700 (PDT)
Message-ID: <a510f246-1f3e-4674-9825-e1dee11c3ee9@redhat.com>
Date: Wed, 10 Apr 2024 13:00:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86/intel: atomisp2: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20240403105511.558395-1-andriy.shevchenko@linux.intel.com>
 <609652ce-0336-4d69-ab79-f84c8a8506e5@redhat.com>
 <ZhV3zUgZjAMUZ0yD@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZhV3zUgZjAMUZ0yD@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/9/24 7:15 PM, Andy Shevchenko wrote:
> On Mon, Apr 08, 2024 at 06:20:03PM +0200, Hans de Goede wrote:
>> On 4/3/24 12:55 PM, Andy Shevchenko wrote:
> 
> ...
> 
>> As mentioned in the description of DEFINE_RUNTIME_DEV_PM_OPS()
>> DEFINE_RUNTIME_DEV_PM_OPS() is NOT a 1:1 replacement for
>> UNIVERSAL_DEV_PM_OPS() specifically it uses pm_runtime_force_suspend() /
>> pm_runtime_force_resume() .
> 
> Right.
> 
>> Specifically pm_runtime_force_suspend() may NOT get set (and in this case
>> will not set) needs_force_resume skipping a resume + suspend cycle
>> after a system suspend, which is a problem if firmware has touched
>> the state of the device during the suspend/resume cycle since the device
>> may now actually be left powered on.
> 
> I see, thanks for explaining me this. So this driver is kinda very special.
> Still the old question, can we get rid altogether of these atomisp "drivers"
> in PDx86?

At some time in the future yes. I've recently done some improvements to
the staging atomisp driver so that it will run in a pm-only mode when
the firmware is missing so that the ISP still gets turned off properly
in this case and the driver now supports both BYT + CHT in a single
build so in a way it is ready to replace the atomisp2 pm driver.

But it is still in staging, so distros are unlikely to enable it
and without a atomisp2-pm driver the battery drains much to quickly
especially when suspended.

So I think we are getting there, but now is not the right moment
to drop this driver.

>> It seems there is no direct replacement for UNIVERSAL_DEV_PM_OPS()
>> without a behavior change.
> 
> Correct.
> 
> ...
> 
> Btw, have you seen a few cleanup patches against AtomISP v2 by me?

Yes I have a bit of a backlog, I have just processed them,
thank you for those patches.

Regards,

Hans






