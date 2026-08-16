Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E193CB548
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 06:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786861297; cv=none; b=Zz5+CTMe+/0gF4hQuQCzZSiCnysYzKedeF0s+aXj4GdrTnhMye3TLQkfI5huPM+9mjbk9GJM8MvEFvb8hWOhrS4/W5/LO1mEZoj/NmQ/Ge8ldpOmBCNSJ0VAHc/WYfNbRAq4B8sckgi8vzlHZBn7sjNqi1DQyG+Qg9TJdAxiLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786861297; c=relaxed/simple;
	bh=laeV9at4Cg0ZdfV3bdDP2ipECAj7MtpRyjK9lceKJ78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kakQlozMjorfKzPhoFk1WzWOeIr9BHGTE5W+kY3ZgqhFoLe6qU4cHJxBEL28g0EeSBGqH7p26lUsBExLhdFfpXawePOlAHXMT48Dqt8VFrXISPDJB7Bw1z3Dua2kX7JsFVnaJGDa9/TmmQBjUgdSgps0hoHdIOcdNg+jIL7VQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGWWG2XX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGWWG2XX"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2903809a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786861295; x=1787466095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRUO/D5FOdb4mMofke3nTU3E5B21KgV6AwD1uBldejA=;
        b=XGWWG2XXJOowSVRyUy1k0/N2WZ5abjgPwHQOpbmlsA5ThBgt8GF6JP4Gd1a5KidSMc
         o08IyQurCRy1LT85vHkAEWsS2JIYlLOJhSt/fxhV94vC4ROsr8dlmzuepHEfhw6tGdwQ
         KEz8WPOdM3K4sCpUQdv/rY7OKQlAnbvua2R2GQxUcfSx4pNppe67MY8IutgKeGDVrrjo
         Fi08EhINwVZcvokb5q+iLP7RSw+0ZxL7p1Ea7D1y/fGWsujSh7ENIsInGxMrcv0ByCop
         Q2bCHe6bHcNhWaACEc8obM1Qw/18kRIykc8DdyYi56uGvcWRykR0l3WnJ05p9w0UGpk7
         9c7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786861295; x=1787466095;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kRUO/D5FOdb4mMofke3nTU3E5B21KgV6AwD1uBldejA=;
        b=V0xEx9Ro0IbmZx4mNB4dPSDpXtyBxbcPGuU+bF5+2NvuoC0AIbNbl/Xx5me4z9EgA1
         iewZSwsalFnYjq1R7bWgKimt0O0/4L6tY6eDdOICvSey+n6s+JczvW8NmM7I4AWZbq2d
         9gu54HhaMZKwjy1wdo1WHLW6WgDA85StZA2jbxw7RTriljF398LdMY2FtaetNik9faWh
         rCe/oSeWIX22M1+43PY+ioO5Z/KyDYF+pzsQG0gL0T99bupjN8J/tqwmJtFhW+TsV7+o
         vupYbV5FYbuytmmy+tmT/nyPkvY5x33vdQIMfHIwRE+6X6pas2P5Mqrcx2XC4ymzi+rB
         1qeA==
X-Gm-Message-State: AOJu0Yw2XqmjaNNRvExNIuHIdtgi5jaPoagCpKXfY6Zbgh2feuaLMyO+
	4Ci5w9B6I627jZCFCmGg9xHTVNC9phBEADOEArUHaeGzJWdoM11SazdeDTNnXGNB
X-Gm-Gg: AR+sD12jxwlur6+E2tH/0BIhgdovaeRpExOqerJ8iFYX1chLceV46KZGBsHbIr/4dYh
	uGRcrrq7m5lCOdV3Zro8uztKzfNcQrLpTc+5T7kKd/7QEshaTD5AQewRaig5Py75Hgd+9TeXS3b
	Rcew+D19SB3kcEi+BX3VVFx1SlG4RICgpOd+0O9AUq2iy63ote3zblBp22UGZu0dgKJ78dDxrai
	khXVkDVI/DJ8YIEe77aQGUwYwGifCSRhNIc68lO8GXidsKiL97Y8krgw72AUJFhsBFXdNwdFh8O
	vVqFD5J3OvK0djFKy2OaC90vqaIw4T3yn7j4N2/fN/oTzvDGK3GSUd1RSSM9mP9H6HXyx7aRut8
	XDSJFKWnRGRHtm1XCSrxHJjy4+wKNiCFwm/wLVxpd/oSdqzkHqMRWvRikhshiLLstqi0xd5d3fA
	jMFDgPuZLjlOfKst2GlwDKMjJFdtOhvb373sA=
X-Received: by 2002:a17:90b:582c:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-3933bad0d4cmr20439262a91.20.1786861294939;
        Sat, 15 Aug 2026 23:21:34 -0700 (PDT)
Received: from [28.0.0.1] ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39339d04382sm3697574a91.1.2026.08.15.23.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 23:21:34 -0700 (PDT)
Message-ID: <71f66925-9a2e-4d95-87fe-eb11de78b215@gmail.com>
Date: Sun, 16 Aug 2026 14:21:32 +0800
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
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAEX=435pEyPHPjJgQnJUJLL8JJD65RsRa7Sjbx4NedZFG80dtA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/16/26 2:19 PM, Bheda Rahul wrote:
> Hello,
>
> I'm running Fedora with Linux kernel 7.1.8 on my Xiaomi Mi NoteBook 
> Ultra, and the new bitland-mifs-wmi driver loaded automatically for my 
> system.
>
> i run
> cat /sys/firmware/acpi/platform_profile_choices it gives output
> low-power balanced balanced-performance performance
>
> If I try to switch to Performance mode (echo performance > 
> /sys/firmware/acpi/platform_profile), I get an error: Operation not 
> supported.
> If I try to switch to Quiet mode (echo low-power > 
> /sys/firmware/acpi/platform_profile), it doesn't give an error, but it 
> silently fails. If I check the file immediately after, it still says 
> balanced.
> I have attached my dmidecode output and my ACPI tables (acpidump) in 
> case you want to look at my hardware's specific implementation.
> (and also an AI analysis if u want to look otherwise forget it)
> Please let me know if there's any testing I can do to help get this 
> model supported!
>
> Thanks for your work on the driver.
>
Could you test my latest patch?

https://lore.kernel.org/platform-driver-x86/20260816001129.16998-1-qby140326@gmail.com/T/#t

