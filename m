Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977408;
	b=rDu6HCtoTi7E5IajjlqRG5AJVwZ4GxgL+7HGV/BhKzKRqlEViBTYh+1NPpzPzUGk3uqH
	 2xZKC9tSBtVjuzZY42el0aq2r87WZQY9T7+p6rrH+tJrwNjRM7DAE9RJY/PQlSiohBWzi
	 Fkedt9WS+GxpnnNI8Pop7jv4sJ5EEtOFQfTC+UowOFJi1cWuEGnqpegOtlcn0FJ+3jafq
	 qvdVAyv4o9DmrQ1TPZe5vgLpTJRzY7AXn/1XDj1zbbdz6DPEkfXAdd375lRZSBeAE49gg
	 sakAvxH5Q8lejJARrPGE1HHUS0TnyZ3Uu8ojhhJTWOWE3Z5grQFGFMoqjDsSLlResYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
	b=MWJlR1CxkDJk0tsekxHTw6LV+zUlMy8Zsttx+wZiLhBiTKSFWuP+QU7k5p1qG5KhMBFT
	 LSXw4adNvh/eENsZ9gpvwKzJKPD72ZHvg/kNPpAm5kCjp1EprOY2Z6RSggzu4n8Tza1xK
	 FT3DnP+n7V8Qo/JUbH6WfgLnE7BNCM0jfx3BqM7dG9yLBk6XlVfpV8EbP3zTGl0BN3bk7
	 mtZaskGIFL5CZyLNxBrPCv/mxRvshqhmAtR5T3HCCx8ooDr7ACLcZYR6rLTUEKXPoqSWL
	 ZE1gBxoD/SOXYA1CPy3OIGe0ISSMt74RhLIbPtqjh3kgRzvtVZb2QqPZicfgaZMMvuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSM5cs8T;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2F606A32D
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 15:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF2F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DSM5cs8T
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e98798cbddso3500855ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 07:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977407; x=1794582207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
        b=DSM5cs8TWJxNt54mlaY7rzkEhtLYQugGZuG4lIUuE+2vLrlcrkkjbzemC1SOT3DmQR
         RFLbKEu82bm8zF2BFK7a3CMmI6bjiKkHCtmxZHRna1x9/ggfAZEfoj2598lcGDxcWuvQ
         zWCyJy6aFrj8rUXi+LWjCeJIJ46Ur27Xc/oR7wZKEhoRizqsz4UfH3j1RQFFJblyGmb2
         TAHxg6FLFP/6jU1exH7TbFBnm7rVIsl8Y9FA9MRrS16iP5ytTDeAQGhf6gplU3DPCGHg
         6QipybkXWLH3JXlLv1RgdbdnWXrt1iQs8kMYbeKdr3aSEpiYDnB4Pc6bdImBr24VZw/D
         MoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977407; x=1794582207;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I80ZPEWQB0WX5YXGTShdz3it+MT3nNR4B9Ty6wOKj28=;
        b=dIlrX6oTKW9doX62GUJ4WwgJ1X+uCEsFIozkRJx8Do38X67NTnzJhr3SM9u8t+lesV
         uE7CO/VSZkcAcj7yiZ+eLJHDnh76ID85Z8ZxsfnNIM0YxPRtQaXW7FTeQtkL5OqU9RvA
         x+RBYbM71rjLgEH95riS7Ul7A6aw2HKMcKXkZXZUqwhdrQWJ6XjOZvkfM7qN4A1zwJxl
         6u5sKHWFmIUlIQhK4b/d2JX1tWYCB8LIPPk5sVNn8e2DVceRFOR2akqW3KTNGSMzl1pw
         kpfbvI3HnllhNp22mCm3jtzeRJnQ9gA7j6Z0MSVu7lgkYRQ8xnLglHkC27pSoVyid2q1
         karg==
X-Forwarded-Encrypted: i=1; AL+hErHdbDDYZZGtttViu9WnzExsj83jJOEzUAyyowy0AR13NXkPFv12YWkvuUUp+szVADGvUhoGNO18kGXRa79zXwY5J6dB@vger.kernel.org
X-Gm-Message-State: APuU4Z+VJwNl9j8kbhsUhrHwhSpMB3hJTRtS4n/c5dYa+zdnQKACjzEJ
	g2ZoBwAJYPTVQ7DITeFKklzqGACd7GLnK8aIap99PHb3q01TlZFzk6rC
X-Gm-Gg: AYBFou3dzyXqi6MbwoeQQInXOI+wFanIQda4VhHrxW4feWvURdou7MjPvovsbIzVK/0
	K9PyDVqM7huGkzKCqf31X34AZc5nDZxyuopQCMYMIQAUtJo+gLgxVHAx9doD5TEnEu8ToJvENdH
	AO0qr9X/DxHyw6uawsxONQwifJsKeQLnhtAoncXDnYbXYUA5o/1PRpjgZwqOPIkDuZygq8tyYSW
	T9977Qo8WZ25WpO8a0GwqjKhkaNYgqoEeeCjbekSj3NVT+fRGh12VhV9W8ausbcnl4BGyK4eYtV
	U0yhCIyFndsMT88K6xlw/WL3nHewa+NPoDMnfgE36gLty9hKpUzQheDoXmTCOCKFGm3uttefw3j
	qqsK7/ZwHuq73+bFRByl/uYEdipyfKn6SDtCyYm9B0IqVAUd2E6BuoPURK11TbCeNhlqIhhdC9J
	TlmmF+7JM6X69Nm8Q7pa/aN1PVOsoSXsCs/2+/4ooa1qOS2v3qn2zBKdalNrthnwAArr3h4TPbB
	qm4ESvzuoVOx+qZRfxKyZY+bBcyCzGNk1H11v0FP4sAOHhKOxTfyGMxLWeb+OFwFzU7J3iaypTZ
	U8uK9JDjhYHSJb7YJVPZycSdc4FpxZDW7GcV/N/U1Bbv5pIMRaardC8jHYqDY8pC+adz
X-Received: by 2002:a17:902:ced0:b0:2ed:3be3:c63c with SMTP id d9443c01a7336-2ed40c48300mr36584015ad.31.1793977407496;
        Fri, 06 Nov 2026 07:03:27 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:bfa8:849c:2010:a1c1? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed477a9baasm6161495ad.26.2026.11.06.07.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 07:03:21 -0800 (PST)
Message-ID: <da3a0f47-7e77-4bbb-a431-06c7ea6a78e3@gmail.com>
Date: Fri, 6 Nov 2026 23:03:13 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only expose kb_mode when
 it is supported
To: Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, chris@miget.com, kento@kekto.ru,
 wolf109909@outlook.com, vlku.milos.fun@gmail.com, btx342@gmail.com,
 zsanya322@gmail.com, i@rsplwe.com, martiya.ar@gmail.com, nika@nikableh.moe
References: <20261008-bitland-kb-mode-v1-uselessfire@gmail.com>
 <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <b2b8aeee-08a5-479b-bac4-a38ac606a037@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/26 11:03, Bozhen Peng wrote:
> Hi Anton,
>
> I tested your patch as posted on my MECHREVO WUJIE15 PRO
> (WUJIE15 Series-HPT), using your stated for-next base:
>
> 98f039265e580291d5e76a11b2072541fbb1c393
>
> I booted the baseline and then the same kernel with only your patch
> applied. On the baseline, kb_mode was present, but reading it returned
> "Input/output error". With your patch, kb_mode was absent and I got:
>
>    kb_mode not supported (-5), hiding it
>
> The GET produces an ACPI AE_NOT_FOUND for HEC.LEDM on this machine.
> With your patch, the probe still reports the ACPI error,
> but kb_mode is correctly hidden.
>
> I cycled the keyboard backlight with Fn+F7 from off through levels
> 1, 2 and 3, then back to off. All levels worked. During this check,
> atkbd logged unknown scancode 0xf6 messages.
>
> This confirms the unsupported-kb_mode case on HPT. My keyboard backlight
> is not RGB, so I didn't tested the supported RGB-mode case.
>
> Tested-by: Bozhen Peng <bozhenpeng93@gmail.com>
>
> Thanks,
> Bozhen

Hi,

Sorry for the late reply.

Attrs are not covered in this patch series.

I might start a new patch series for this after the currently one is merged.

