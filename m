Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8102E647
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346303; cv=none; b=cY3JLF9qyqY9DwTLWIYcPIMpCl7JR8mX98vuS+FXlu7dGSpnEnseCiy1Kf0vhURCMIYN9iw+QHNIp9IUZZ6sW9ymRtDBSCSZ2l2UsNifmP6TUTWrsFnEqGE6tpf9ChEJvCSq+XWzlbP17KzPpd3iNWLj1MScN0b+6Zor7Hzv8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346303; c=relaxed/simple;
	bh=gzjCQw/WkyJ81heO1U1AhwhMls24RaDiBVDZWODcvSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7RI+si1cNP88ctsYdNEyys6z3tbGcvS+CLfdGBr3/nHk/WVE5UoUYBh7jlm+XaVrzAbA3zWwZUfyYWXOjZESmt9qFWJm6rPlzGaHfSV02xis1A5ctjIy60hBya0FWxqMSi/bVrOBJ4VYOSksK5fokd9prCpyS63vnR1JZ0B244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lqtwvkjg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lqtwvkjg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708346300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yk2rigtIP1TrPPA5XNRdEMM1GL9bmAZcBohhgdFvSDI=;
	b=Lqtwvkjgd08IRgwSJGnymMLSyP4myvnkGEp21xt4fCrAhciiE3OyN+OfU72X/RKtYP+Qpb
	H0yZ/khHDs3LhH3TZcRM6GIZxg7kNHYFmp3dBVUS1ep66pLy9T8woWi4Tmx3q+pWIacUpU
	K1nQSpI0Km4lQ0xRrdn2NRcQn8YE/ic=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-PkWRgWLNM8qZbxE8-8AWng-1; Mon, 19 Feb 2024 07:38:18 -0500
X-MC-Unique: PkWRgWLNM8qZbxE8-8AWng-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-512bad7d985so618884e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346297; x=1708951097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yk2rigtIP1TrPPA5XNRdEMM1GL9bmAZcBohhgdFvSDI=;
        b=UqoWRPJY01wGeFDHtuzVGiEe1D+9NXhW3jYRoCGHlGvVXr5lLoVPEo4L74ZvlSODK/
         uq3xY6YcRzt1h3N5j/iHj5S1XyMXTeSl5M7hzG6A4zwtGTCK55ohSjrm2nxf3zvJXYKz
         vxqUztk4/t0S6yu6+2yocDqSYQudWz+usIKihjkoloc2sD7JAtC1GIu5zMnP892AXnjZ
         I2m9ETqdP0VySr1afDLfyjZgMHZtTWbgRtBDPkjsCHE/j1LSdEjB4IaZppf6ONjawkco
         lw8nhvSu79Ty3FKSLLLgmDJEEaij4+Kr0M9aYjVFTEabUpBEBPZvbatnGwZchzgPy4Xi
         +sCQ==
X-Gm-Message-State: AOJu0YyjESlQnR4O7Me2R3ACc1r4d4yTyn+pE5s3TzbdqdVZ5nsQ0u3K
	0Oe1+3tEFeDoI4+rGtzSyYr97LJtNmSi+E9b3mvKCKmtn9VuSZHsCyz6e5KBDP3ZceT4VuILcws
	0ZiEikv84zMx3WFaxGYn/FRA5UeWJ5K6xALxOSk751NHrc6XbJSM3Ufa5F5mQ4BCb3pV2aUJSCl
	t7RDg=
X-Received: by 2002:a05:6512:2312:b0:511:79ce:805d with SMTP id o18-20020a056512231200b0051179ce805dmr9233603lfu.7.1708346296963;
        Mon, 19 Feb 2024 04:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTIrJSMSE88u6rez8enAJWFXxtTIeYnpfd/46RCais8tXQSS6eAQbycVH8j6AMohdHKR/9Dw==
X-Received: by 2002:a05:6512:2312:b0:511:79ce:805d with SMTP id o18-20020a056512231200b0051179ce805dmr9233589lfu.7.1708346296662;
        Mon, 19 Feb 2024 04:38:16 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id wp1-20020a170907060100b00a3e2e03c155sm2363377ejb.155.2024.02.19.04.38.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:38:16 -0800 (PST)
Message-ID: <1d5dd3de-5561-4231-94bd-65ac05f1fc50@redhat.com>
Date: Mon, 19 Feb 2024 13:38:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] AMD PMF Smart PC error handling cleanups
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217014107.113749-1-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217014107.113749-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 02:41, Mario Limonciello wrote:
> While debugging the suspend issue for amd-pmf the initial bisect result
> pointed at red herrings of cleanup flow problems for
> amd_pmf_init_smart_pc().  The actual issue wasn't in this code, but still
> a lot of memory is allocated and not immediately released if any of the
> error branches are taken.
> 
> This series cleans that up so that every step is cleaned up. I believe
> this actually fixes driver bugs that "could" occur if a BIOS advertisd
> Smart PC as well as ITS auto or CNQF but didn't include a policy in the
> BIOS.
> 
> Mario Limonciello (2):
>   platform/x86/amd/pmf: Add debugging message for missing policy data
>   platform/x86/amd/pmf: Fixup error handling for amd_pmf_init_smart_pc()

Thank you for your patch-series, I've applied this series
to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


