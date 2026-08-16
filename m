Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120A23CF1F0
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786862297; cv=none; b=Fx737BOQn6TDChQC9VW6hHociUumnPZDcGyD/S1yoVEgcc4Mi1h+1SusWNEb37YKjDKNfjtBVETpNOwPNnSIWhdDxVEJPne8i8lAw+De/MDmADbvl9a0xOj6R8eX67k59C86gqydw+6jEa64yItuXhzXiBAdQsbjWQsbAR4d2Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786862297; c=relaxed/simple;
	bh=Cc7N/DASirQc8Vnf1QsLcrPN1w/aNvwB5BKzajnY7BU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svFiWygi/17A77q7THzAjwJlPkYey4J1b7TguMkLT4wDAk+47U0i0Edw3LbT9z7RtapMNqx9TL8S6gVNOXAGonNiI81fyExIbx25h5q/ikaJD1fYrQA2GknjeLw7IchQQne9H3DSu/aMkNa+9fSF0Rffu4pY6ql3vUGenQaQxsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkAVqI8M; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkAVqI8M"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbed97fa26fso1430287a12.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 23:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786862295; x=1787467095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJCq/P5nUBoAI0/gyzz3Rba9CnEb3gphxbyTfWhwb58=;
        b=hkAVqI8M2LJuteN2Vt3Xy0c+i3SH1YyVVn8M1xH5xcjMM6T+rtnHfv/2EfboOm4b9c
         uNVGuAxM6hkIvy4KNPJUsM4D81zcVb5AA1vQXTFvooFwT1OxJbVBLCgqcnOZEiFu+Mis
         MIloZa68IuMusKyufX8wWtq1k1vI9X04n+uaHEoHapcnuprs6ZwYs+yF2IkETqyVqc9R
         HnM9zCEsWsedno+t42DnM6KjnkQhJVJZ2O8txH8i2LfwTTVsYfsjv+nA4MVulNJ5kQ+M
         UNJMt+YCjl0usgAwlZQQoSEzFVmk0SXStZYZ4RC4clnI6NFX7RXny28GjEoaYr/HBPcn
         FFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786862295; x=1787467095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJCq/P5nUBoAI0/gyzz3Rba9CnEb3gphxbyTfWhwb58=;
        b=kzkyO3BQNO8jQetKT2OyZ+H3b6hQRr4JpIAbbH7OcPkMVRTP36AfkqDDL9WuXH6m6b
         NLfVJ0AIoiCc/dgMFP410VB8UjRPaVFRPOIncNoRVYEfKqWZHP7iFJcWE3KRgTwJYaMa
         NGmlBeu57E7AWj9PyQM/Dk9Dh+KPHL3NsGjwaqTID2hnIeBhLzrCvc7+uDlQZfSWAZIg
         lg44QUUnoEOvNan8LwVdXHcEZy0Piavep5lLqYy0PKhrbEbk2j8ZXYvaOeLiL8rWbqJk
         roLgpaa6IPQdwkGFoLPfgQMdzHUltnJGjMnaDwYEr+UChiDITLKoS+1CeBpwPc+4FcAt
         Yytw==
X-Gm-Message-State: AOJu0YxxO8s2xyQRomreC4Xo+4Ctw+e3H+dbBYSpWiNHLpZAuIMllVc8
	DW1HudqvwnecPjJWkwG1JhzPqOZvCxvN3HUrLfPMKH0yhTZmjAM5HqbU
X-Gm-Gg: AR+sD10U6x1nQLodIZ8EBiRgamuHya6Z2/2BIjyISWDFrEK2BHFWr+kHjdmBqTe3u8l
	0sob75w1I7YRwSedj2oNVVIvoPunt/g/xPt6iUQdMxCithA2ZpUArecP8kZyj6wjuZPwKhRvkgs
	+cClZhTCjD+BUzp9/HnFE5LHHQXUUxbJy9UxN4eAJO0FtYYfxidIU7RqlcvxuxVsxJizOmpmfYe
	R4jQOdJqi2GP536SzxSUb8qBguvwSFgsZyZjNUxpFwpUM+ucoOcBp9rPVmNCmnidwwapYk5y44M
	W+qD0WCRmytBX/pZq6IWZtEhQrn4/d7LNuZs626ClvRlavRiJ4mj66EXOHC7G6Klu+Pi1HRAqYn
	mjB+0n3r9dUGgPABYJxzRB3vdDU7ZMYRa7q56375DRz3fQomLOYvrFX2UZ1qRUd+d2uUl5DmJaq
	jIraCNPPmfASlpwwzJ8v6NH1Feh5YlyR7V+/I=
X-Received: by 2002:a05:6a21:3381:b0:3c4:3672:b86 with SMTP id adf61e73a8af0-3cc704e5028mr15797578637.3.1786862295350;
        Sat, 15 Aug 2026 23:38:15 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc095a1fbe7sm2122247a12.21.2026.08.15.23.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 23:38:14 -0700 (PDT)
Message-ID: <46295e2a-0e27-4936-a04a-2f8c71560740@gmail.com>
Date: Sun, 16 Aug 2026 14:38:12 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] bitland-mifs-wmi: Power profiles not working on Xiaomi Mi
 NoteBook Ultra
To: Bheda Rahul <rahulbheda131313@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
 <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com>
 <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/16/26 2:32 PM, Bheda Rahul wrote:
>
> I unloaded |redmi_wmi| but the issue is still not resolved.
>
> Regarding the patch: for testing it, do I only need to compile the 
> driver module itself, or do I need to build the full kernel? Sorry for 
> the beginner question.
>
> Thanks!"
>
You need to compile the entire kernel.

By the way, for speeding up the build, you could run:

     make localmodconfig

to generate a kernel config that suit your machine.

Then run the following commands to build and install the kernel:

     make -j$(nproc) && sudo make modules_install && sudo make install

