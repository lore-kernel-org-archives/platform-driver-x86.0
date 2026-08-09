Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623EC245008
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786284390; cv=none; b=d7BMHZtnp8YIxTzDalQ/j+7SyyH0vQgCFZP1WOMfiJkg7g1W9H1jfq0xM5WZOZUnejLEt51YJwE3KGrRFRJt+CABKbtfX1AlvP2ySS+iUhzxAKtzvs5Eh4/fDwPdD52Vcim8nSumBWkolXUEXuPHLa4N0OG9p3RRoUJYUOrtU2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786284390; c=relaxed/simple;
	bh=B1ad0+VjyuqxpRMYSjL0LpzVavM6QZKZKG/2Vzp4UUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCV4oYuppFClIAUjT7tsAU5dmEC5tAv4+/WUFVGd1y6X5i6ds1aiNCuqSsJl9awDDGzGLmLEXyfqfqEqsrydkMVsXRcF30r/1KCvbfG+/ZYj/S1ryYhofmXJQPdQD/H5jOQthkspvTvm0DR4C6+p55ifaa5aFiUKjIPcidoY+gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtUAokQ4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtUAokQ4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caed617615so12292445ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 09 Aug 2026 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786284389; x=1786889189; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B1ad0+VjyuqxpRMYSjL0LpzVavM6QZKZKG/2Vzp4UUY=;
        b=QtUAokQ4WeViYbLnDqlL+qYyK/PDlj2loVX8IxjWhLWLOhxUYyZPjscuTnh8piht7Z
         ExawR0b0fNbtHtRl8o7jUYbGfrAWX1HXJMDYMfZUiI519mkc5SCANEcdSiZqA011ZC+Z
         1oZPOZPriqJJdcyjxO2PoaLACm0NN5ipRNtqPAZZdaXwNnZrmUILKuET0itYP8VQt2Jd
         Dm/TPwlhz7HYSoTZLEqqt1EvWcjVIJ8oGRtWY6VvYLx+KjNtyvmrF3bS/1f90xeGuvpL
         O2GRv45DYP+rj92tGcp6Iv/Zz8Wv475l4CL6XSfJNAhoNIgf6Ik+eDlOdrHbqhml6t7y
         cAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786284389; x=1786889189;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B1ad0+VjyuqxpRMYSjL0LpzVavM6QZKZKG/2Vzp4UUY=;
        b=ZpatQ11rCZr0umGiDLxt6YOGICzGFS2VGusHxlBCVM9wX3FPJrP34T+FV69xjOga7I
         jv2TUTkvfPlaWZ1cbeMqeRwh9DQH90gP8NnUwskGyI129RnNcCCb5tlpCSOaCovVKvlq
         Q0+3m3DhBUx59kAMTZ1wy8ksmAWyNn4FHtMYl7Ew3FbI7Wv/hTyuialFVm8TscOh9+wg
         xpW2pNIxJQOcLanIC36HYj3fLu3xZ82z5WA/rJE+/17O8CN+GRa+vV+WxYmu6mTqY1zB
         vzxtn/dizngF5QtFKIoh6a3tmGKErMqLYL6n1AFHbJ1vRHN6mw850Qlip2uiGrTcNNu2
         Y76g==
X-Gm-Message-State: AOJu0Yxl33yIDZ8u6I4+W/7OhY0UdAwpjBq0+kkljSukbt8Twxz0HziC
	qil4AHjelkx+dzApnS4h9BFplSYI//EvXqt7Fq9i94VGDog8ahxWN5tqAolfq7eT
X-Gm-Gg: AR+sD12F/64942H28d+947yrdnzm17+LcMsKTsPcCjZ+HYqu7XAu0m2xji4rtO8E/0z
	gSkNGuulMtKwwr61bchwO0FevPVvi0O+vAadRCD5EeP6cDd/5JDuXd1Nuhj+Q6BHirfqfaBJAHX
	dKM8gaI21U7JY+DFvNs8mQtkYGdTkAXNl5AiWHBfNwvDDd5gJdJkGPYY9aZ2HLc4dZY4MMZfnQg
	17/7ibMzk8DsoSGppwZ3yIEjb0CKRyg8XpNXbskOZ0J1AlAczfrg/sAdK3CSG+eZTT7YMI3j58G
	WGNXFI1VO9mmxX5mZjPH9ya0Af4hm7ItcD5cZVbNCCkW+tfg0/0ikMXFoLq03u6y2CuSJY7Pc+z
	MFOCvXc5bycEEt9HZxYRRnZnYnXTin02Pk48ZT0h4s4Gkgz9NHxJUvmNaGIGKpI1LPTu2OPuDK1
	jYkaTosdZOwdj24WJHlhavZPUV//qd3dNRbmMSaG3BF1Z8bl4pbSiX9i9hmygzPA6Wkrx0Y7bOZ
	RhrYvwwXQaLg5r5R2Zs6sWmNHLrpflo5RPU58cRTe9rL0+5QM30nTYe+XUOR247jrjIfw==
X-Received: by 2002:a17:902:f54d:b0:2ca:ecf6:9104 with SMTP id d9443c01a7336-2d0ca711c8emr393981745ad.4.1786284388555;
        Sun, 09 Aug 2026 07:06:28 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb87d3bsm33326686eec.14.2026.08.09.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 07:06:28 -0700 (PDT)
Date: Sun, 9 Aug 2026 19:36:11 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Kobeto zebida <kobetozebida0@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: Re: HP OMEN 16-am0xxx: GPU power limit stuck at 95W (needs hp-wmi
 cTGP unlock)
Message-ID: <aniHYZwsb6Q1-mjg@archlinux>
References: <CABAdX2pkcpuC8PdkebmiZ7B+iNP_VN+5tWEy_DbffNOa7k6B6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABAdX2pkcpuC8PdkebmiZ7B+iNP_VN+5tWEy_DbffNOa7k6B6A@mail.gmail.com>

On Sun, Aug 02, 2026 at 10:04:08PM +0300, Kobeto zebida wrote:
>Hi,
>
>My OMEN Gaming Laptop 16-am0xxx with RTX 5060 Laptop GPU cannot reach
>its full 115W power limit on Linux. It's stuck at 95W.
>
>This appears to be the same issue reported for OMEN Max 16 models:
>the hp-wmi driver needs to send the HPWMI_SET_GPU_THERMAL_MODES_QUERY
>(0x22) WMI call to unlock the GPU TGP, but this board isn't in the
>supported list.
>
>nvidia-powerd starts but never negotiates Dynamic Boost — it just
>idles on DBus without raising the power limit.
>
>Windows with OMEN Gaming Hub works fine (115W available).
>
>Full logs attached.

Hi Kobeto,

Yes you are right, this is likely because your board isn't listed in
the hp_wmi_feature_boards[] array. Can you share the output of:

Embedded Controller:
# modprobe ec_sys
# xxd /sys/kernel/debug/ec/ec0/io

DMI information:
# dmidecode

ACPI tables:
# acpidump

I think these should be sufficient to build a patch for you to test.

>Please CC me on any patches. I can test kernel builds.
>
>Thanks,
>Medo

