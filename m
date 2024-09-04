Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C45107B6
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 16:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465697; cv=none; b=rkSeMzyL6f9VhC5C778vvCEUkydoH4VYYJ5QxsZc1eL/xgREnPgj1XSziZhzBUD64BVnpzJuMG/WEvknhPDg6Nw5sDP8DNF7AdSDwI33ihrWwqLp9927uKRafXHdfnkb3m6hbHl911SZVdKpKgxUykoCbYSmtvvOM94grFIXS/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465697; c=relaxed/simple;
	bh=p4eZFHggB5aNhAZn/MFpGw7ziZIRrPGeWmUFhN+0szg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JHR+Em5bjmDY3a0s7ReU69hlSSVem5o501u8yXjULqkIZj2MC/2HQoeJY3WOJ9QFwauPDURjSwrjfSknSODZsVLB18A2m/grVqyZoxRj5tKk8MrXUp12jNHQVTb2ZNhWPh1HDyeoujI79XYhpghAIy/6bRisbmMtO6x5FlUC38k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAzzUG/j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAzzUG/j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725465694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OetSPmWJm5A1BGVzI2Vh7JHG4DaICCY18tkvYSPZK9c=;
	b=cAzzUG/jai1d5A+AIkwlIQAoxy4TfBgKrHJvzn/qC7S/K9VTCaOpOHGGgd1xii3Mb+dLr+
	k5Rcyw9guFRmZ4ClKHA5cClqUWUufa2kUo4q8KBnngTIWJ+S9ZeLZlfjNdJLIg94vCdFL9
	z101AEunP0qk+veLqZ3wOLh4j5ZW4WU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-5jbZ8WjOMrWuuJXeUNvL-g-1; Wed, 04 Sep 2024 12:01:33 -0400
X-MC-Unique: 5jbZ8WjOMrWuuJXeUNvL-g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a869ee1755fso544959866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 09:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465692; x=1726070492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OetSPmWJm5A1BGVzI2Vh7JHG4DaICCY18tkvYSPZK9c=;
        b=S/p2PtOf8ycex7KEq4LOifOIop4S49KGEiDloglsWRVno7QkyAap2S//2e92Ep49Iu
         XFeuqVxreA6x9guD3kF4k+nxH+kX6u3Z92DrD25jRqwHMF2IHvmrtrbKFE0nTv6zEZGE
         c+f429cpGDAG+10s4KiWfFNenQOTzCiqCaVB+V7N3XO0xhNXZdfoF5dk/I1jtkzqx+nY
         STcYfONSxz6mf9pkgV7ZlHAjAKkIF/cjn+1Wp1I/CErMC2Qr0pt+GaYs+Df28aHdYV/e
         h7LEwwGx223sADK64rJmabtikMw1rJS5g79Qil+7ZgvCl4Mc5VKthnfI4vGUKNkpHQWJ
         nrtA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7tLxYOLtUSPKRL5djRzPJiprvYWo5giDewaiyOXcd/8Opy9imL0mhBdeA/qOXvqRTq73tb/toZh3XWfBf2eJGTA3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8s2RqQXBr7yTdHYj7LDO/k75e7UythjdSIOkFnz1Zf363JjsQ
	nqN4l+EqR5kJjrdGmV2pnnwTx9aayEtk+Lb0qhHCkNcCSW0LzsHK4RshS8rR+1eb8M87X7xbJSH
	fvN8Xixadip7zzb51T1L96GQFwW8Cr+e2SZYe0cqwaaGHYW+kJu6LuZNDeBJpH2XEjlu1Qzc=
X-Received: by 2002:a17:907:970f:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a89d8ab4ac9mr961474666b.58.1725465692391;
        Wed, 04 Sep 2024 09:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHNpTnFowFyZyjcnUwsK+oDNcuAEQELz84cvCvvgVrDb+AXFs3JWhSwanQmYxEM6yQLIJnlg==
X-Received: by 2002:a17:907:970f:b0:a86:7199:af37 with SMTP id a640c23a62f3a-a89d8ab4ac9mr961470066b.58.1725465691804;
        Wed, 04 Sep 2024 09:01:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623e3298sm7903866b.213.2024.09.04.09.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 09:01:31 -0700 (PDT)
Message-ID: <57bbca66-4d84-46c1-a638-1347ee6a222a@redhat.com>
Date: Wed, 4 Sep 2024 18:01:30 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform/geode: switch GPIO buttons and LEDs to
 software properties
To: Borislav Petkov <bp@alien8.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Mark Gross <mgross@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-geode@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <ZsV6MNS_tUPPSffJ@google.com>
 <a2366dcc-908e-41e9-875e-529610682dc1@redhat.com>
 <595fe328-b226-4db5-a424-bf07ad1890b4@redhat.com>
 <20240904132104.GDZthewNjCZ4iLgEoD@fat_crate.local>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240904132104.GDZthewNjCZ4iLgEoD@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 3:21 PM, Borislav Petkov wrote:
> On Wed, Sep 04, 2024 at 03:02:17PM +0200, Hans de Goede wrote:
>> Or I can merge it through platform-drivers-x86.git/for-next
>> with an ack from one of the x86 maintainers.
> 
> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>


Thank you.

I've applied this patch to my review-hans branch now:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


