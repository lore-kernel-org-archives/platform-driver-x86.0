Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872B370D5E
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 03:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785554006; cv=none; b=KKcYNIVQIeOdkmAQ+nSXopG+QI3pdd6NAismNhEoaM/2A3PQxE8kZlwFyxJqbmB5UveKZX+AM60onhrZDHiSbRpmv4E6aLmHOEe58tQd4fC1PhUaof6YWmb0E/lLuKanUDkq5zrhTuZzsswAaeeOLd/TF0ZUthjhQBcAvPhxO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785554006; c=relaxed/simple;
	bh=M/NbgXygmZlvsXYn7JhUqYNmLBcTfBFy6CdYk+FSEBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKNpHK7p2FU8/8+STUlaPdYqUIWy5AanV9KG6cCL93Tw3m/ttgetbqc6n8uKyc3oQcmP/RqRVAfH9vqRLl8meeuxzs7Q4s7fEKDH3ODMotdg+nQ0+Q8GMHqmWOnUUAM3yaLGZ1hy6h0s1dUp4NSBSC6yBSmTfnsyAu2Lc6J98Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fawJ/OTC; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fawJ/OTC"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c2a76536bso15300751cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 31 Jul 2026 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785554004; x=1786158804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=fawJ/OTCEqwj1b+9IreOCR+Eg2dKb1+wyflIumzePNtRi3G/tG3PCaXujRFKogzvTB
         TQX1n22PjLKVe1kXIttkQq9ixIBGZpamZgvtkx0u3b7tQBy9BDdjrVZGP7nzMjrpISCm
         ZNk9uEOt+W9863tZ+VvU9sf20hrYQebuchvuc2fxLyIZfamqu5nw4YMFmAXJPi8SqHZL
         7xquiDuNUvixhtaNvcvRvPQ6AQ9lAxfpXbTJ6CMwE1kJVKSRapT5cB+4KbzsaYTrlntS
         XYinKqnphIiu7ei9fKCX7X8HC1fw9rEhpejG4zpbFx3ov5nC5UD/3voCPrbrcH4to4+6
         Ck6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785554004; x=1786158804;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3OFQi86wobJiii7OnOtEvTy6WOJzLS6xjh5R9rXpZtc=;
        b=MLC+LoX5KajK6BPseAIEVfZs+CrdS8OIiTYOLSHHnaY5a+YONx8j63mLr/p3f2WLrd
         WR/b+EVG1YARe+8D+W5BY3m/huRxBx0/XtiO662ehgxJHfhtWVRmuqzVH0EeNKRbptD4
         rCEHAFwtPqkKfrIFZ7YD1rIi6O8vODvq6/ZCsCFZn9oxbt679wJK3koyP6GNKDK0XVVT
         6Sg9FQ27ZlpRDg9tSg8plFXsUUSePmojNM/BUtw7kaAoYLXYQSvMljhbDTzzc8JWWHdQ
         w/Tbu94wdjxrARnqBA6NszI3ylvw6HvWbxg6iSTHChMyj5xeqT7w6Fw2DIWmV+VBM3P5
         KJdg==
X-Gm-Message-State: AOJu0Yz2IlGi4Hb3rUC/Dr8s9/+tHhAxYohKmMviR3jZrjF1Ce//d6J7
	pM4ZxmVbsR8HzFqOOWMGtGAnHnzzjgAFyNkkP6vCiJzSd8FhrBAOvwZsUtQpaNhIujo=
X-Gm-Gg: AR+sD12q6hwAbR+a80y5UI8d746DOQTtG5kwlxK5HKoy2lJK7H/W2koHVqZfseMkOdR
	wFnk/LazcGdzFnNNnYgCpqwm7Q8U/X/fH18j2kaWWqEyKVMEz3p+D64St0rGVX/0aeArRzUqv5Y
	+46v+pVaTjVeWjiqlU9UuszOQOrUS7xMVFKzHD0fV1IBoOd/3HO6Qg41frbhE3LOm5nQ1ddgqWX
	nq7s5cBuejGMCgsdzIaKNtctkqRRAEqodQAhsxHuoujYMKAkSNkzNb5THXRldyTiwWk31zQEhOO
	LH06iTX074yvl4oObu0RPNJk5uSPGI1vAfgtiuB1TcfTnwnv8jPTbVDXnCEGOYgA2w35xbXQy8w
	qoK6enPEJ6RyBORRy++vZB9DpYnak2RQt3np53FosLfex330S9IWSg/vqjA/LTxZ+joAWoJI0FV
	jE+k91So3oKb8zDt+Bvm1wrEaeQvv+1oyQRGFE/lL3HA/7EJJIIvbMCObKOfS0mfZjaQgxPBi4/
	/V/YJlfX8ZKqdBU8NyRT1GUpBmZdp/jKXD0+d5/Ylw9edOy
X-Received: by 2002:ac8:58cb:0:b0:51c:88b:d7e3 with SMTP id d75a77b69052e-52b5666b75emr44233251cf.3.1785554004223;
        Fri, 31 Jul 2026 20:13:24 -0700 (PDT)
Received: from [192.168.60.12] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908436072d7sm24632176d6.49.2026.07.31.20.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 20:13:23 -0700 (PDT)
Message-ID: <4ac9ffe4-0f14-45d7-9a62-7a5fe7c40bf3@gmail.com>
Date: Sat, 1 Aug 2026 11:13:14 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v8] platform/x86: panasonic-laptop: add fan speed mode
 for newer models
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <20260729044332.382862-1-alexyeo362@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello everyone,

Please disregard this patch.

What I have found is not just a fan control method, but a set of methods 
to control active and passive cooling policies for the cooling device + 
a way to cap processor power and unlock it.

The reverse engineering notes are still relevant, but I had clearly 
missed the part where the fan code is in proximity to the code that 
toggles the power limit.

Given this, I no longer think this belongs in thermal or hwmon. 
platform_profile appears to be the appropriate fit, although I will 
continue investigating.

Apologies for the confusion. I will redo the patch with further testing 
and data.

If I do move forward with this approach, I plan to submit this as a 
completely new patch instead since the current subject "add fan speed 
mode for newer models" no longer applies.

Thank you,
Alex
