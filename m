Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829C3D6CC4
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jun 2026 07:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769504; cv=none; b=cBTqyBmLhjjwFGeReqjz2fBm3m0HwOZRWVVMff+s353d8b9znQ/J6sFSXKo6N6uEt/VgXy+bd1FbMMCVx6Ad995UhKFb7bSmstsq5DrvY9dc8Hfs4ibx1KwN9g2V6DvHdq69j2e3xxT+EwzlMWTVCKZxAKiNwwMjiCEl3UkQ/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769504; c=relaxed/simple;
	bh=aPLytLZbXb/kFJqEbfieuDgd6shZ/WDHUIfcjvAi/VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gnl1ncvvleOulzHNmER1NHWDwmTOly0fUsWfjPEGJr0j0TnmOS55FLKnqHfPvMJEK0HSi3nqCCJXBFtA0SwZjdb1bziy+aMdJY+x8/i9VKz5THV/4Qx+aJtliFohk+6ra1nvmurU59GDweEPe8fSzFnQJ4NRaxTXOQ0UKQmnUnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PbDVTE62; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbDVTE62"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso16855405e9.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jun 2026 00:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781769502; x=1782374302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxP5lF2tMLYlezjZbuDxBAYkmeQ7b1wHJx/dctbQth0=;
        b=PbDVTE62zqb5wqN1P9ZLo5WQmyTpzVLkA5Sx+VCInEHKMTTkuggzuSd49BTM/9/euW
         c2P8fuUFe64KLvOmlkkT0BwqiizMyVcSQJxu9kTvCVPoDXvzXsw33qUyCKU2o1EHef1T
         PmEZwAmuLdVl+KONT8A9BQ0PgLiB9xT5Sy248EGHy3d12b6KXDSMUaBgzNOtxxEM8/Hs
         8+inLqEOACGaqNoTDe0kuK+Kicpjos83QYBv6rfhWYOYhzTFmo5wdcK07DTs0EyyFbYH
         ukZG+psO41OyKuPgsvR4jpHtHSjkr6fG4yC1YMOSZFCk3LCfOA3R05e4EELwKX+C0j4e
         aWAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769502; x=1782374302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxP5lF2tMLYlezjZbuDxBAYkmeQ7b1wHJx/dctbQth0=;
        b=YU49G/1eQQ6NosfCOEOfjlbC3Lgv8a+g8PuR3Yhw26j0zu2WbUkj+JPdHQeFcmvljo
         MU4ZlHHuc2nLx3qE2BRe/PqWZZnvimn/CqjwLIfqFSzdMB8T9Bli5/6gLJYJOdfT/1fv
         xezUKjYWrNbgmsyWxuok900sMpQkt3DL4QavGqcv6+SxfTu+nbCZ4SQMZJwZlKRhxf9Q
         KZffJRH9EXOgYiM1ibVDNGpdUUU+K9WBIDDM14irNgfoWK/ayiugFt+kvYnnXUfvXVWk
         QLdk+TWwXwpHH2wCH7LhR/VUlyijIdnp/nGJVuVC9HisU6Uh0CwBwAqC80b1dHQaH0sM
         7gTA==
X-Forwarded-Encrypted: i=1; AFNElJ9pplP8O3bHQ9jH15r6vzV567m+5HShrNlBZ0CZFqMD4q9ILH0hXQqWC4Amu8d9TwJnOpCXBA5rMW3lK/0IY9Q6YFeU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6L9tWSCWTBefDnTVdZt9YVNVwr2KknBZSQAKN/+h2xdgqMx1S
	Mfxgw+HQ8FR6n7qdaIESadH2YWf8d0EKjTLW9bjv3e+VfU5GGwWCxkHo
X-Gm-Gg: Acq92OHa5K6c4gwZsDZraNq8+v0Lq7qE2zXfewxuofhjADORC1YPxQOk2shhPoidWpm
	B9LagOXstvhAjjB32coHLUg5GseKFlAAv2+No3JT76FozOtutMQFCG5gnxNe8eQd4lYZrbPx4OL
	hlSYW4EnNqlKLRmFOayEGHtl1bKuZh0u+fSlAqW+hnU2JlINvUjr96JWQxRMdI6IgUnsZbk6DMi
	H+M8pbhyCT1m4+o6RWw3v45MYVN1ChhODkkJDmp0U3P3CKCLheJfgj1QNsgbh5nZR3eEMvl+KdO
	BlYJ0uoDmDqyUWIz/eqUHkpNsJNwqCDp4e1dSR6X+vRtUnFAQePSnOBwTPsTdEwuRPpKTrWzdKS
	SmEMMLvcJV/V5bBZcQPQl8lVX0VhV/DWQJHyME2EZnNp0OrEH45v3CId8LzD1FVB3Sprrtv6SYh
	UOLwv28xTMrmlAFlO6JYNd0JOcGMzJcEeJdBak46N2z7NDIRhRK/ssQo3NqRi26EGlDhFWkVt3l
	A==
X-Received: by 2002:a05:600c:3e0e:b0:492:3767:6973 with SMTP id 5b1f17b1804b1-4923817448dmr33517915e9.9.1781769501545;
        Thu, 18 Jun 2026 00:58:21 -0700 (PDT)
Received: from [192.168.8.19] (host-79-10-200-194.business.telecomitalia.it. [79.10.200.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a9b45bsm193927105e9.15.2026.06.18.00.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:58:21 -0700 (PDT)
Message-ID: <c240369f-13e3-41ac-a5a6-761a5afafbbd@gmail.com>
Date: Thu, 18 Jun 2026 09:58:19 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
To: Marco Nenciarini <mnencia@kcore.it>, linux-media@vger.kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 sakari.ailus@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
 <ah_XLEAkqjV9HkSE@spark.kcore.it>
 <ceadef8a-7b9e-4137-b219-732b30bbf62e@gmail.com>
 <ai2NAS5EnLaLoN2W@spark.kcore.it>
 <dc00c5d0-124d-45c8-97d2-7f8fafca9795@gmail.com>
 <ai8NwzoU08AvD7Ve@spark.kcore.it>
 <396e4b0d-7a2c-4ba4-9569-0428ccd63267@gmail.com>
 <ai_TEj-_ije1XgYF@spark.kcore.it>
 <dee36707-3fc9-486e-b18b-d6a246edb67c@gmail.com>
 <ajOc0H8Pvvr4exL5@spark.kcore.it>
Content-Language: it
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
In-Reply-To: <ajOc0H8Pvvr4exL5@spark.kcore.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Marco,

Agreed on all counts, and thanks for closing the loop on it.

I won't push the standalone dvdd_second_sensor quirk: a field with no 
enabled board behind it is dead code, and the second_sensor mechanism is 
already there for whenever a board that actually needs it shows up. The 
validation stands on its own as a data point if that day comes.

I'll take the NVS topology issue to Dell through what channel I have -- 
the RGB-side PMIC (DSC1/LTH1/CLP1) being _STA=0 while only the IR-side 
DSC0 is live looks like a factory-config decision on the Linux SKU, not 
a hardware limit, since the Windows image drives the sensor fine. If 
they flip the gate (or expose the rails on a live instance), the 
existing int3472 paths should pick it up with no kernel change.

Thanks again to you, Hans and Sakari for the time on this one.

Samuele

Il 18/06/26 09:22, Marco Nenciarini ha scritto:
> Samuele,
> 
> The _STA dump settles it, thanks for running it down. With DSC1/LTH1/CLP1 all
> _STA=0 and only DSC0 (INT3472:0c) live, the OV02C10 has no live PMIC instance on
> the DA16250, and the gate is a BIOS/NVS config (CL01/C1TP read but never
> assigned, no _OSI branch), so acpi_osi spoofing can't reach it. avdd/dovdd/reset/
> clock have no live provider to key to.
> 
> That closes the kernel angle: there is nothing for int3472 to fix here, and the
> dvdd re-key, though correct, can't bring the sensor up. This is a Dell firmware
> matter (the RGB-side PMIC topology left disabled in NVS), worth reporting to them
> if you have a channel.
> 
> On the standalone dvdd second_sensor quirk: I'd hold off. The second_sensor
> mechanism already exists; a dvdd_second_sensor field with no enabled board behind
> it would be unused code, and the kernel doesn't carry a quirk that has no
> consumer. If a board turns up that actually benefits, the field and its DMI entry
> can land together in that series, with the consumer that justifies them. Until
> then there is nothing to upstream.
> 
> Thanks again for the thorough work on this one.
> 
> Marco
