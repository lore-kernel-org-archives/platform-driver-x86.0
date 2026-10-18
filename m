Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719553446AD
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 03:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792292584; cv=none; b=QQh0DORtCTwhhjoD7DRj5dT+C9f2FSZloe2VBlWdzlBenUxc4XtLmn1xTEQH4IOH4f2PBNOApWDmOgZoWJ33NaC8uXoSzDZOi9tmOKd6H6TFZSDjnNqdRlS/yxS442w5MQPR34/kalX3ym5exN79yCS64Zcrh0+iaFZmHSoLmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792292584; c=relaxed/simple;
	bh=ZITNZtXI1LEVNcddldEtZUUMUQQr3d4n2wmhbo8gnjI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=WAGfATgJMFKjiHSMCHlTXQbNQyTFL4TypzEwS8n9D/eYm5E4uV+SejZHQy64w+d92g4AstW+H7wL1Rz0B76QrvE2MQe+J/wGflRyz5fr7TRoi0wz241ah250//lld8Myc6LkvHMJlgVpAfmueX2UmETpEIhDGyWOQTl0Tbz4bJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lklahw+m; arc=none smtp.client-ip=74.125.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lklahw+m"
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35e37b4a43cso196240eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Oct 2026 20:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792292582; x=1792897382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=itgPlMiyJa1Z48u7pjVt4mWiUxVb/1ebtQBcGmzhbn0=;
        b=Lklahw+mVnpE8c+d6IMoubwHA/yZiwgoAJL3aE5evl5WWs0eGtnjunpVm8Nhuk82E+
         3JClLd4ep9kGmQztqp7HMuDoMGBjc6TLpkp2H/fc7mePB4kwGKj0zDfFRQSYqT/UK7LC
         U3y1+7LWxdL/GrRrDfj1tCVUSm+2igM8H+fm0aksQNE3Ne/cuvek1dxwqKKnaZQsVyx5
         hwKSsey99D7FnF9LSCJhTWHVCM5QMr1QLccUw4G2KxXieVqzFh1bIrAIkb8czKIYXVXc
         tpPmtYrHL8Yt5XjzY5EBjXxkfltD1uCk9wqeZXdMtnHqFR04uEaz+Ky9tMDPoBELr/9d
         XNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792292582; x=1792897382;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=itgPlMiyJa1Z48u7pjVt4mWiUxVb/1ebtQBcGmzhbn0=;
        b=MwnSu5WbeAkWojmUVbX2iw1Lq6/0tfHsJDKrT7DNfE3YxtyAzolC9Z5K4wGxefi8OH
         GYcarXXCCikkcKb819L1SuvRlbMoQSkiRWrWmE6BZWiChEOhpy33qyJ9I2Svm2STXeZj
         /I1cog4r8RGU5XsVR3rOBWGS+KDJOL/xAKU4TAg+T/kw696Qlldiidghe/a7pH+WhAxd
         ny67zNfPHMO8HMWpxGwBAlRmsRId33PBMr+/e1tc6yQdEpC19jEy4gkBWf0DY2B1zH2g
         c/NiYjDK+pZCA6SwET99vrk0CEtGzMuiwTOVZ4dSoFPii+EeEUbTxz2vDoktRJx8I4t/
         vS9Q==
X-Forwarded-Encrypted: i=1; AKwUvByXsWjGKM2ywDWiw0LpmN3j2J3lANznEmoDn8HsAs/pgMKZiLFw2enk4DRQyWcRPv8EdU9SX99E+6MbRS6H+LDbZARF@vger.kernel.org
X-Gm-Message-State: AFq9FYLyjxazNkQH6aAiTBQpWbbf/WE6//j//SgqzSMa6m/Ny82jBmED
	NrhdLm3f9vodmd11G5V1v54WychD//vzveYANCNUYZjjb2usf+700t5z
X-Gm-Gg: AYBFou1cCOw02B4/5NVGH4WUekIaTtxkpYRoAbKPuk+jcg4sCXINyIKTZG/6gdz3RKp
	UoNlFJXOcZnMtVMOOff83gCynNfr/eVR4NR3RtM3SY/fXvsP8HIJDTO7tJMY4iSTxQLh+tDl61r
	q0cry75YLN+rZ+d7VhpHmKCYaC9X65Y0ACCrnorVhhdj8lsswBVbJrPs278LJeA7zK7FTo/woaq
	mazTG7iL4GegMX6nH1bR0yXS11r7nRhRG3CMMElzWJfEBWTWgN+IpS/8wuu9zSO2pwr9akpJ41B
	DDxRAAwKKLol3ezRbcPNKeVt4BMugGTOS2mYeDLgdRyXK/svuFhQqMHz3udL3mwDR8NT70vM8MQ
	wJnA4GF8GkSh1fz8pH4iFMot87Ax+cQyX03eL0BqLwPF8NoTBJEBwOgGzKl1FDEeEhRl1eVe18b
	yigym4oJ2f7pibJs/04C12GGeobQL3ifTEl9su29QI/0RwIWEYsEU1H9rjbc8//CboQ09ZJQYTk
	CeLYZyvKCeOLACGcVCUSPwSyDIQtxUszzEYBzmDpBvXk+ikoMbd
X-Received: by 2002:a05:7301:2710:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-361a2053227mr5923201eec.7.1792292582456;
        Sat, 17 Oct 2026 20:03:02 -0700 (PDT)
Received: from ?IPV6:2607:f598:b3da:60:e5a8:1520:7d4c:f121? ([2607:f598:b3da:60:e5a8:1520:7d4c:f121])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0e5e6sm20383250eec.1.2026.10.17.20.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2026 20:03:02 -0700 (PDT)
Message-ID: <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Date: Sat, 17 Oct 2026 20:03:00 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bozhen Peng <bozhenpeng93@gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
To: Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, qby140326@gmail.com, ilya.gladyshev@linux.dev,
 chris@miget.com, kento@kekto.ru, wolf109909@outlook.com,
 vlku.milos.fun@gmail.com, btx342@gmail.com, zsanya322@gmail.com,
 i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
Content-Language: en-US
In-Reply-To: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Anton,

I tested your patch as posted on my MECHREVO WUJIE15 PRO
(WUJIE15 Series-HPT), using your stated for-next base: 

98f039265e580291d5e76a11b2072541fbb1c393

I booted the baseline and then the same kernel with only your patch
applied. On the baseline, kb_mode was present, but reading it returned
"Input/output error". With your patch, kb_mode was absent and I got:

  kb_mode not supported (-5), hiding it

The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
With your patch, the probe still reports the ACPI error, 
but kb_mode is correctly hidden.

I cycled the keyboard backlight with Fn+F7 from off through levels
1, 2 and 3, then back to off. All levels worked. During this check,
atkbd logged unknown scancode 0xf6 messages.

This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
is not RGB, so I didn't tested the supported RGB-mode case.

Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>

Thanks,
Bozhen
