Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF913CFA6
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Feb 2025 05:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738906837; cv=none; b=U6Gm5e6sY9Ds+eg2+o8GVlkPJagjXMMTlkm27PTbji+vpdFmwZCWX9PeQqFJFUJ5c0o8ZmNzTkApKzrxbwGi0BRf83i8O+IslKhQ6TUgcLVE39xNp7MSff3Od0AbUzvrGu9J7lOYH53Df/mv1mKyNK7qRBQQATqWbA+DmL1f5to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738906837; c=relaxed/simple;
	bh=TE3ZkntdWZY1tJD+ylejE+pOPsaxni1UYah5iPCiO2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=of/vEAUs5Fl1o807gLeXbbrEKJORoghqdYFWQgIVKkgkgmFiLfMXvpMFHBJm9K0SvCUTcQWmJZ1Uo1+A2zS/pakSUp1RRYNqzfU75CeVyXzahuxFI+GZMV9r6B8CcJhYh40MDzhMU0/5dZyhq5HyG5lW9RgV0dxd+tROxenc938=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DC6xILfI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DC6xILfI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2f9e415fa42so3015259a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Feb 2025 21:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738906835; x=1739511635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KUwompBu1IwxxBZZchUvDtpIHsBnqr6cs+KLUlA5Hc=;
        b=DC6xILfIycxEGKTZyD3JtkfRsYYoC2yF65Tx2KO1FyXYE6qJyZy+w1MBl6neR+u+Y2
         E4Nmm1WiAPAzqYg9gT5nm2QClr0/lQB8N7fC/+xOJgju2FZfISzCRIWZUojQm0hIgnO7
         ZAuNs236IX/ehROEP+d4szHDiojvrRMYHGyAUjuQ6G1UskvvPFOGV+ZrhCMipmWLjsQM
         TsHnWuhSCHdqAvyQlCSJjOfCacNdN8aEv97uZRh/dqexfW8R90qqAjspKuUSV6/OQyE4
         95zkS/zdL0Jhxk+sN6A+6Rq7sbZndS2CUMBNSrdMNZk8kEfAJWgx+bNJswqOUWoHBjnj
         YSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738906835; x=1739511635;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7KUwompBu1IwxxBZZchUvDtpIHsBnqr6cs+KLUlA5Hc=;
        b=cJ9Y9uG73XjuIeQQG4DKER+WBuY13+2aHbz/vo8piA9tjmCJ0HODt5i4St8CWOs7aO
         lxcc2N7XH7VkeXXtw2FWOwxTM9KPyNaVpkuzpQXEaPoWX4ZUzTA/nxjiTtyQyCTN/wIg
         +WewOpAwUNUM2q2Oa4KNSWrlbRxz8KuUdTA7zfC1SKvnxbx1I7HB3slbbC8YnN3mQJjM
         MeqQJtzN6PmNVRWrFS+rHL0DWo/rK7c1ZfF2I1M1G2YaUu+Xm8uzNHG2WAOlKgxa2WOS
         opKMF36zJrIZmcB/cV6BJOAb8cNHKMQTzTPDNCF0idybk4//aEt/Xy2xIAK0ricLaL3W
         bzjg==
X-Forwarded-Encrypted: i=1; AJvYcCUCEZJFLhqjH39IV1xMuLXEXv1lbFCk9h1i6Clbt3txeKILFl+JKtosg0nJeQh9dPmJILqCwHBSDY+EnXnv5mo658cA@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzMTnF49WwjOPYnotx3zzOKh3f0yohOaWQfueAQU75RkH+sL0
	Q0MgFAwexWwjPvsyFI/78J8mzpR4b9Va04shoYhmGDyJQAqUwXoM4GfZCg==
X-Gm-Gg: ASbGnctis/wbcxLpJOEyL8vkaEG2BgJmQytYAqFHjWv9TiJol5DaYLLhyYkX48ZN5q/
	hDfbZro9x/TrMF20QceTzCVHBJmb3ZhINEN9iJzAq1BDKHSdyKLzttvGiBJMiQuWhPwKwLdcr15
	ZrOsQoK9u5maVFqKz+1BnG5z33odu6lnkwsKIdkwOdKg3WwD8HQ2IGN5//eWNKNQivTzf9109tB
	kicZdlXAABLJQtxGg2ZyNnRV+/mdiLekbpL098feMkdZpM4vWwdbukWK8Mtp2kq4xIOVP5dLPuL
	p6YaEvDF8FpluwKxk13GKkfFHVluMupaDidpaMXeMpXXsfqddxpf6Be3K6qCvoIcvF/k3w==
X-Google-Smtp-Source: AGHT+IGf7gIhVDh1udg/WSmnB1eiYq5StBbW5R5hItDUJy1UBnmabvxlq/TNRE38AhCwQKF+2xOR7A==
X-Received: by 2002:a17:90b:5282:b0:2fa:b84:b31f with SMTP id 98e67ed59e1d1-2fa243e9f8dmr2986760a91.25.1738906835247;
        Thu, 06 Feb 2025 21:40:35 -0800 (PST)
Received: from ?IPV6:2401:4900:6299:3a25:4b7c:a6b6:9696:10e1? ([2401:4900:6299:3a25:4b7c:a6b6:9696:10e1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a1848asm2456971a91.12.2025.02.06.21.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 21:40:34 -0800 (PST)
Message-ID: <4d281c36-4996-4518-9db3-e11780f6fbfe@gmail.com>
Date: Fri, 7 Feb 2025 11:10:30 +0530
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help fixing turbo button and power profiles on Acer Predator
 Helios Neo 16 (PHN16-72)
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
 <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
Content-Language: en-US
From: Sourajyoti Basak <basak.sb2006@gmail.com>
In-Reply-To: <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I initially replied only to Armin by mistake. Resending this to the 
mailing list for visibility.

 > On 25/01/25 3:08 am, Armin Wolf wrote:
 > Please share the results of the following commands (needs root 
privileges):
 >
 > ```
 > busybox devmem 0xFE0B085B 8
 > busybox devmem 0xFE0B085C 8
 > ```

I tried running these commands, but `busybox` on EndeavourOS does not 
support the `devmem` applet. Instead, I used the 
[`devmem`](https://aur.archlinux.org/packages/devmem) package from the 
AUR.

Here are the outputs:

```
# devmem 0xFE0B085B b
/dev/mem opened.
Memory mapped at address 0x760fdfaae000.
Value at address 0xFE0B085B (0x760fdfaae85b): 0x0

# devmem 0xFE0B085C b
/dev/mem opened.
Memory mapped at address 0x7f5ba88f8000.
Value at address 0xFE0B085C (0x7f5ba88f885c): 0x0
```

 > Regarding the clocking issue: I have no clue why the CPU speed goes 
up to 3 GHz. Did you install the Intel thermal daemon (`thermald`)?

Yes, `thermald` was installed on the live USB when I performed the tests.

Thanks for your time and assistance.

Best regards,
Sourajyoti Basak
