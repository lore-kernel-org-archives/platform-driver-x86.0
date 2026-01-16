Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC664334C17
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768573442; cv=none; b=qfLbv6j2502kttBPs73qIODWAPEl139Ad9r+mo4t8OAXoxz3KffLPqcJRjAyFEKyT9lDXkAGKjTcGZTthMgNm0KWpJfKcCk0Qqzg3nH+Pc6xPgFHYQ65LwP0UgNdqd6CC2Ea/Q6fLVJjt9IY8J2QUJaWQvNT1UT+N+nd3tl9GBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768573442; c=relaxed/simple;
	bh=AJ5ilNTXCmFbN1sZhiRyoXMZdR4/AegoKc+oZ70VIQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuDYOA46NaCaY4NIxYuqWN9ej/5oOivmdKzTXVr2dZCAKB++aVs62gP9Bs1tSdfbVrxxGTkmwB0jS/b6Rw4tmYNB+fBlbltjFtlBPAHo/OaoMnQulD2TYS1kgoihXXAeTiIH1UF3HSYjCfqB4XgaGkQ/KfFZ1gAiIMxsL1LyJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpGPc+NC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpGPc+NC"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81345800791so1306929b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 06:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768573440; x=1769178240; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HPArp3drtMpT9gYIdrY05DfxOakcVV49Lx9C4/UTM/k=;
        b=fpGPc+NCCcfBJMAJ+5hSdA8ocPZ+qAuhrZDGxa+3cUri3CHvs5bvNPAa0uT8O5LIoM
         nDj9NXmdaTeEs1YoC+Zr6IftsQR79MGmKFasP832ltVuFi/qnjzqqOcJZYKIvoUJSsCP
         u4PeX/dX1hqjHwZJYX3umzHJ2Dm7DHMIM/ztM53DlywqQYblZrdndr/zVVxXQ8GQvpdf
         GK26WoJQGPBHMkRSkoNtKHbdKfLPF49tdf/vf1KMi4PpfS3dSPP1brRSltylhXysxawb
         L9vSz44CcQ1gcWN9mSg5thv+5f+NpuvHdIbChcrlYP2UXjgsA2bUrMncrYMeOq6/Aasd
         N+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768573440; x=1769178240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HPArp3drtMpT9gYIdrY05DfxOakcVV49Lx9C4/UTM/k=;
        b=ZjEbfmVX9EeVkJdMGod8aWARTPxGqKrROia3JBpxIaKd2ldlTTJvU++/u2LQsPXT7O
         48Qk9sSet/Kfo+NuB23UGUaI/BIBOZ4izgbsUSGpm+QDJSXpEYD/2BcykS1rncQtYiZo
         DcMR8yrep/zXtFnygd9Osv2KqvJBsG/WtiugsBUfvxCNqSGMI1tX9kn3z3ONE+4a+Nqe
         6tQqgo0EbNIKfRESQQxXdRTeD/16FTDLerfIFGcCAeymcaz39wQF3GVUjYiasHIBcVO9
         v4GHnm9xCSg8YzlIrvltEUTgOVf9fLVNJwvhZlMW0ZfP1mnuCYhk/h+re19p0Dj6Rgm+
         Z/cQ==
X-Gm-Message-State: AOJu0YzRpf/C1dnJf+Fu3MOEXtiIkY2J6bjlx6yIzSXmn/l0f+oa4G9n
	B/EgXT1bx40W24FMI5C51nhrkzcDA/QkPmV5tYhZR0AqAMk6Hz1uTzcF
X-Gm-Gg: AY/fxX6Vy5QquMtwxUToWPn8nqUW22dqCoJUSVAqu6QbAsjCEr9tlvMHpsmVbtZp296
	i0JM8vevsnnv6m4dF8kZqk2aXV/Ze2yq0KJFuX/yAj5IHZeTcTuHIW5rJ35JAvoaXB763g1FoEb
	4IIxSa/nYd+b5DZWmJhn+Vchgnxa/dkdtaa6ooBG5hrcmQzlckO+reI0SiU+yAhKJ9YrEJN1fce
	w/0aQBpRqbdk9Ty/5mcIMSgAXWF3WM8gs586r0yj1CLvutARWZ+e8bI3I7Tw5UE7PWSULUXQlUG
	p1FyVtbXSfLoqa83/XKhyFd4EwcDcigBZYdY2rJYd+u8RlYMKigBP2sXyZWty/zM3CIELmcXz5l
	BKcqWG/Sn9qpGsCkVeRQn5ILiXChBl+uUbdVXWUrYhZP2yHhUWLL+9Xa3oSZigpZ6/Hq24FPLFv
	Lp9qRpU04pmuIepgs0qYk=
X-Received: by 2002:a05:6a20:2203:b0:366:14b0:4b09 with SMTP id adf61e73a8af0-38e00d7bd9dmr3180311637.69.1768573440025;
        Fri, 16 Jan 2026 06:24:00 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf32d68asm2228914a12.18.2026.01.16.06.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 06:23:59 -0800 (PST)
Date: Fri, 16 Jan 2026 19:53:53 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, hansg@kernel.org, linux@roeck-us.net
Subject: Re: [PATCH v3 0/3] platform/x86: hp-wmi: Add manual fan support for
 Victus S laptops
Message-ID: <aWpJcv5MOlxjb7A2@archlinux>
References: <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20260113123738.222244-1-krishna.chomal108@gmail.com>
 <176848473669.15451.499475802697727364.b4-ty@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176848473669.15451.499475802697727364.b4-ty@linux.intel.com>

On Thu, Jan 15, 2026 at 03:45:36PM +0200, Ilpo Järvinen wrote:
>On Tue, 13 Jan 2026 18:07:35 +0530, Krishna Chomal wrote:
>
>> This series adds support for manual fan speed control and PWM reporting
>> for HP Victus S-style laptops.
>>
>> The first patch is a trivial fix for ordering the include headers.
>>
>> The second patch refactors the hwmon implementation to use a per-device
>> private context for state tracking. It implements RPM-to-PWM conversion
>> using linear interpolation based on the laptop's internal fan tables
>> retrieved via WMI. It also introduces PWM_MODE_MANUAL, allowing users
>> to set specific fan speeds.
>>
>> [...]
>
>
>Thank you for your contribution, it has been applied to my local
>review-ilpo-next branch. Note it will show up in the public
>platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>local branch there, which might take a while.
>
>The list of commits applied:
>[1/3] platform/x86: hp-wmi: order include headers
>      commit: 60f2d5d0f04365c41ad4f9eddf48c80dcd0b01c9
>[2/3] platform/x86: hp-wmi: add manual fan control for Victus S models
>      commit: 46be1453e6e61884b4840a768d1e8ffaf01a4c1c
>[3/3] platform/x86: hp-wmi: implement fan keep-alive
>      commit: c203c59fb5de1b1b8947d61176e868da1130cbeb
>
>--
> i.
>

Thank you
