Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19546388E62
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874973; cv=none; b=r4/UgjhmGowgaDJ5Lu/y6hmAEJ20Q22A/jIjq17pN/+bVeUZzL2R47hJRGSzLFc0CjePmOUAXZQB96UWM8NOYr0mXGDch76THWheAZlevHj6u964w3ILRPg2pLMdXqERvVtQ4Wiuo78e9B/408mTR0m360dQSnciV4z5f4PX758=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874973; c=relaxed/simple;
	bh=HV34WXgN36Odxm2WVWI3pWKN7UEN/vAwfDbT2AwnuWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=BW77SIwVxzW9c8y+R7/HQOiX8d/JA27T7ItXeCX/dWZ6zW1nKwY1LAMRZoZXxss+flICgcRxoj/pmGckzh/8Xz2crXQ3EGTxE4xPmquflnHfwyKJX1oZkkN6flQ1T84uSzUMWsae/RoYMwuIMuA8Zy/suM0m5efoWY524beve+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=shEBkjJh; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="shEBkjJh"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1898335a91.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874971; x=1787479771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1eCtwtdeUg8fp338hyQj1YdUvy9cQ8prJB5MBLAU3Nc=;
        b=shEBkjJhQ4GbHaSkOlHMLUNBIJxWsgtKmRers7OKtjHM9Z4gHI2ymQWq5bvBQ3KGfP
         XmVzPBxwbSTG8ScPt8B67NaZ60sk6AZCc+/A8r04AbH50yP8MPX2OiuWMABlAs9/JiPo
         xOvsGgC2BTjujUVMZoq5g3r9sEGxztIsDbIPujeRTtacqx58i0Oiss3DMHCBgskvhdTs
         WBhMnhVxdX9MzgdheNqHLsH+y26XJaIXPcHZD6FFVUf1zw9ab3R83KT5FSoZpudDiVc4
         IXZ84qeKN/G84bkIkQeek4yRdV2uMCM4UOBBwUr23BjOYhyvyY/967Ur6h4CLO+kLTWh
         7g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874971; x=1787479771;
        h=content-transfer-encoding:content-type:in-reply-to:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1eCtwtdeUg8fp338hyQj1YdUvy9cQ8prJB5MBLAU3Nc=;
        b=XWg0EX8/CbXL7gz3DX5KLobvyKZW1AcrIfBbG7Soa98yLFtIrauVnEL8/cs1BJcOBb
         3PFay7cEP0hIdSLTuqXnzosAVyoPwS4QIiydmzsll1uougfKp9JI+u+U6UtA7t6GkjGj
         sUK5Jmr5itzrVWD6cUXVB3YEEYylx1CstfiM//X3TfCGs+sFRDtrb7PjCYoq7t+Wo5l1
         huwjQOi8L18oDIWRPTrE00hGUjIvUvqKESZfbTJFfLaStdBXwSXg1H7PM70AL/3t40+S
         xPTm1BIirH7McID1aSAsWXi8T6xPS+7qnBtTIuqsV2BmHdP1p24kKM8qZ9tNFvhZnUR+
         tApQ==
X-Gm-Message-State: AOJu0YzoAd29K3VXXo5+5yrF1YxyLS6ZVTUKjB3COGcvX6NP5//UT+Jd
	mIPuwSQU5kemWkjYQR52DhPLAgnHTa7YWkKP9gDxlbaYiA2/Gq1fsBRe
X-Gm-Gg: AR+sD12Mfx1+cKpxkukNcR4RtaoiYSHIeBlkTnEYLaIHlDpZsAzzxjvIS6QXx48X+0u
	Wgib/joxeTt8364AH3nlCSaB7MlgFg+D5YT3Dhh1BE/eDGProSlkBRe8NFRzLrix0VspIV/ymKU
	ptKbPPSYlSVMLdsLcaB+7PfbWe8e3I2wGjgyKDNXF/WKVhab0CldHu8uIe2XDHqMxK5zt3C17+q
	szSVDz7qkczO298IvDNDnf6jxDvRiEO4H8NnWifgjUFzwQok7ta1CeoGcpbrRpl66w0JkBAU0N2
	/xR3ayCA4MgalzcppZ0SlDy9Oz0crgBmQdIu2U0XhsjdpafWUuvCHSNs1F3jgzU9vWBP31GZ8/6
	UUUmqWDWGXUfyk30nbZM+oz6Z1XGtTEfPlQVFpNfo2GNuHZvcmQSUAScVPXdFlI5VIRq0ItozGb
	MZijOHltoEjuPCD9QPZA0Jn3VQ4OZsZyPglU4=
X-Received: by 2002:a17:90a:dfd0:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3933b792985mr18264209a91.8.1786874971271;
        Sun, 16 Aug 2026 03:09:31 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339ce3016sm3325581a91.1.2026.08.16.03.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2026 03:09:30 -0700 (PDT)
Message-ID: <83f9fcc0-f80c-4395-a513-34343162ef7e@gmail.com>
Date: Sun, 16 Aug 2026 18:09:28 +0800
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
References: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
 <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com>
 <CAEX=436pkA5eG7N2MXpgE6kPL-Cbue3XeiLHOMPc2kFaxVj7ng@mail.gmail.com>
 <46295e2a-0e27-4936-a04a-2f8c71560740@gmail.com>
 <CAEX=436MOAPVPdqsupWFk5=2naeB1ghgRFCYi8FiLeGk9MLZDw@mail.gmail.com>
 <77155747-5550-468f-b8af-c25b713e9c14@gmail.com>
 <CAEX=436Nzf_NiHmuYcN8NpEnD1PdgtEz6qzLk_9wu9XHeSKeRw@mail.gmail.com>
Content-Language: en-US
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAEX=436Nzf_NiHmuYcN8NpEnD1PdgtEz6qzLk_9wu9XHeSKeRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/16/26 5:51 PM, Bheda Rahul wrote:
>
> I installed your patch, but the behavior is still the same. However, I 
> noticed something new.
>
> When I press *F9*, which controls the keyboard backlight with three 
> levels — *Off, Medium, and Full* — the GNOME on-screen display appears 
> only when transitioning from *Full → Off*. When switching between the 
> other levels, nothing happens.(this does not happen before no osd is 
> there).
>
> rahul@fedora ~> sudo systemctl stop tuned
> [sudo] password for rahul:
> rahul@fedora ~> cat /sys/firmware/acpi/platform_profile
> balanced
> rahul@fedora ~> cat /sys/firmware/acpi/platform_profile_choices
> low-power balanced balanced-performance performance
> rahul@fedora ~> echo low-power | sudo tee 
> /sys/firmware/acpi/platform_profile
> low-power
> rahul@fedora ~> cat /sys/firmware/acpi/platform_profile
> balanced    am i missing something
>
Those patches were written with AI assistance, and I do not have a 
Xiaomi or Redmi laptop on hand.

I believe further reverse engineering work is required.

I made a mistake in the patches, the DMI vendor of Xiaomi devices are 
not "Xiaomi", please change it to "TIMI" (from your dmidecode.txt 
attachment) and retest the driver. (or use patch v6 that I sent to the 
mailing list)

And please use the Reply All feature in your mail client, otherwise 
others will not receive your email.

