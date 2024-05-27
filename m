Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152DE13A3FE
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716802618; cv=none; b=lNzKxratgkYE8VEKQg97APLh6Ku4UjDfV2xnJRcuo4xOajEoTNrysGsMAWbHJX4pXbbCYoRSLg6BBDrxjhKaGMdenoH3CbOFJMyoL+cmiRPz1Uqo/w6uuGnf1enp3ptlQ8Kzy+JzeZ7NHMLk38fEWXBK3JtBcH1i0VMz+RG//Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716802618; c=relaxed/simple;
	bh=pONuB2N0icV89m84GnGVYyaHy5/egG5OysmUiwyUG9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8uYsiwnHHX/U7xVZpylJWxX6mmsLiAlzQyDmtsc0NU4pJ2UI8H4BdVWeTBsPwW/ZefTYqcToPsNIirWO2LwIyDUDBXfadOQ6tmWuawByFI7g4kFqN3Gjp8rBjPYl+A7PFPfzxiZWt7w89k/v0jfnkKpJMNwz4PFb5qkTVxOp/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ux2jBBrC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ux2jBBrC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716802616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g48pVnzZmByvmNDrw2COaqyGxkvUZ+X8LyhH4K0QdH8=;
	b=Ux2jBBrCyZMG+67omF8OSFyOXHdNgnRAjA405gOe86WkqdaSPiAH+Ox+w/BjwULtewJtsj
	0IcavDin5wkc2UmvkUpK74Qhy/43oPXiVDC4omRCqk4dLvCRizXWbjUyHQM/MI6peB359X
	LXgm1nHedISx5ooVMg2saZbiHpo+7Fc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-Gsb0T4f5OWiHB5N3Y6_zfA-1; Mon, 27 May 2024 05:36:53 -0400
X-MC-Unique: Gsb0T4f5OWiHB5N3Y6_zfA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a626603837cso111709666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 02:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716802612; x=1717407412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g48pVnzZmByvmNDrw2COaqyGxkvUZ+X8LyhH4K0QdH8=;
        b=nJPC3jgH9CUQXKkSNSxRRhlFwe1DWeTEr9U0fmWgpOwVoZ3eUUPJfWGZFOneynyBMt
         K7kuVa6jLAj3JmU+XqKLR7VsDUbKWkSyFsx2rwRXz8xxPeyBaSkYI2tyGp/L0hzxGOlF
         vIz0/j7B71HBpdUcoaYBQUxS/fGT9ZS4aaT3rTZOpQ0Waq4mrxPiFjDOZqvQaodKJfK/
         nd8qynYI3obJcYfh8JCr/KgyRQbc/xIRaASdZmppzNnn90S2nN1UR3goVtE2UB7KFbJS
         Lq9+0eRnTMCFc5Y/H3Fa6y3vUlIp4+CyR1zPf6svQ+OU6HQYaxfMhF6bqgNAdr4thdG4
         Ffig==
X-Forwarded-Encrypted: i=1; AJvYcCUINxyokYOQ+KzDLvlB/S+/HRB/cWoNN4p376XFPF0dzAkMTZl6azkbDWkAlw6NuWa037HSmj/R1euRbZPgkj24m5lglRJGcjNGyQKhownUJs5mcQ==
X-Gm-Message-State: AOJu0YzunUu6tgz1POf+ugxfIqXf+Gjljk1ruR8dRLRYEf1Q8wxYl0kc
	JTgU5USwcnRYN2KmV75CDIDaGMFThPY1pN4B+hZsmvAn6kki32+8Itz5x0lqGPVQGFzHutsq5OD
	15x7hk2RC2IVytx6AcZ+tfpuF+vAuDvKbVpIU9xGMmmEFWmyk1KfRPIr2KMgP91g1bFyfItEWg4
	zGGY4zyA==
X-Received: by 2002:a17:906:3ed1:b0:a59:c23d:85d8 with SMTP id a640c23a62f3a-a6264f15e2cmr560432366b.51.1716802611762;
        Mon, 27 May 2024 02:36:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgnDQyGBwkDquvdNVic47KIJCrAQDAglkmfLQhsDY/8SQaIjjaO/0PAHHn+zd7+cANKK2+YA==
X-Received: by 2002:a17:906:3ed1:b0:a59:c23d:85d8 with SMTP id a640c23a62f3a-a6264f15e2cmr560431066b.51.1716802611335;
        Mon, 27 May 2024 02:36:51 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda8cc5sm468649566b.222.2024.05.27.02.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 02:36:50 -0700 (PDT)
Message-ID: <a0ecfa63-b0ce-490c-938c-728934282684@redhat.com>
Date: Mon, 27 May 2024 11:36:47 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: touchscreen_dmi: Add info for 2 new
 models
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: hmtheboy154 <buingoc67@gmail.com>, Gregor Riepl <onitake@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <20240527091447.248849-1-hdegoede@redhat.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240527091447.248849-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/27/24 11:14 AM, Hans de Goede wrote:
> Hi All,
> 
> This series adds touchscreen parameters for 2 new models to
> touchscreen_dmi.c . The parameters for these 2 new models have been
> found by using the new "i2c_touchscreen_props=..." kernel commandline
> argument.
> 
> These 2 patches have been cherry-picked from:
> 
> https://github.com/android-generic/kernel_common/
> 
> which already as the "i2c_touchscreen_props=..." support merged.

Thank you for your patch series, I've applied this patch series
to my review-hans  branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> 
> Regards,
> 
> Hans
> 
> 
> hmtheboy154 (2):
>   platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6"
>     tablet
>   platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
> 
>  drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 

