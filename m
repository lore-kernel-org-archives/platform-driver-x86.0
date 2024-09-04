Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B5D1DA319
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 18:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474105; cv=none; b=BsvPetT6mQkHJkzmbPm7oubLWCIGcoWhjFLCTWpTO3HanTuqHPFltY+BCRJsKCl7+YNe3XXcqW4Ub49TWXWbB6X19KORYRxmqZDozHKQZObO8YaFsN2UInp/vzug3bfPPjjtRgeNjhZvkiNrc+2Qkl+yyttI5UOkKobV6vkoev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474105; c=relaxed/simple;
	bh=zdL/LzjlEW0mFJYDtvzs5usFXQ1tNMz5mBn3uONMuds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb1rmb2XCmpAAB81hzb1F9T6LNXrk/QgtWH2H2wANKVLHhI/ltGCqNAVeY/7e3j+fa9jUlED9912llXopfYIinSaO/sdO1XMAu+Tbqbsce5RAkjK51K2CgNjNfiMyz+FbL6JASRwT3UsV9XKffA+UvyVDAwxPw26NcyxT+OlwaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FtGQ7+GA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FtGQ7+GA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725474102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NM9oFEc8UiVyv381Cv8nBEcn00Qnvr9uFfx5c4jzXmk=;
	b=FtGQ7+GAI7Gfb2+WbbrnYcMuZPyI7Oke47bw4WvFwO1GSTfiXq4sUf7zc+l5AZf7E5Ifcg
	yT1STsO270M1rvnIcEoKmHKOAXUowlSRJrXMzW1xzWOwQdhZ7DLoez6y3VLCEtIgMZc2yc
	cpgwyrgwaY3d0Z/uTj1ZLIgle6CD2qk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-haOHe357NhaepGJHwjf56A-1; Wed, 04 Sep 2024 14:21:40 -0400
X-MC-Unique: haOHe357NhaepGJHwjf56A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5c2486f1f14so3317102a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 11:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474100; x=1726078900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NM9oFEc8UiVyv381Cv8nBEcn00Qnvr9uFfx5c4jzXmk=;
        b=X4HtkD0PgLvvsEs+SkrfZwxEqpln7j7jo4ibRk3m1Lcyv9WDlF78dHiOGTpQ4HRR2D
         OcYsWQVFr6QIMy5nrSj1pa7tXzq0OHpDJce7J+ajdl/UnRY2PRRZ+ntHnaSncG91ZvOp
         IyT4myt4jHq8XKuYrapKF/qs3dZ9S5gp2oJVcuqjt4LsOyxv3K8fcg0UXTu+fMUhHuoB
         xgJus6aEnIlqBz9m3qmA8US3k8RXPXUkcf2xDjiS7MltI+MopcO7XgrE+xsQI8D7ZjT8
         4UQNCueFR166pQ6cfQ+XFGGp2j21ks8Wf6E6oV6M4d2Ei6rmWtWXPH0q2k3unDTwXULq
         JN7A==
X-Forwarded-Encrypted: i=1; AJvYcCXqyPoWJ4RvQsFc+4/Qo5UiiYCQRmhP1eMrCiaFKajxn7cPc4neApZmlhaiQt+nAvOtC/+Ohe1ciz9oAYo53g0WX2i/@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy8nyd5Hr+aUdmZyv+1XVFflqqPnaj5jaowmjpD84RAw7qcNSy
	HtJ3Isbcqt6mqIyVt4e54xmksk8q0hW4nI4dCNcodcJCcO+UMKwU06bSOr/NfKs5PhP+5rntctl
	SSQnPmgCsBfaUvWh1OpPGJZd7QkHljxcs2+XMJrYzQzpcGgFxPQ0ZluF1CtVxY+9kTG4io4A=
X-Received: by 2002:a17:907:9495:b0:a86:97e5:8d4e with SMTP id a640c23a62f3a-a8a1d2c8600mr668059666b.23.1725474099676;
        Wed, 04 Sep 2024 11:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnkq/Or86Xk1uFga4JK0hoM5tphs0VBsX/+HBCClglLDo/I8UIpOHiN4idr4Nb8kvVk2qCWg==
X-Received: by 2002:a17:907:9495:b0:a86:97e5:8d4e with SMTP id a640c23a62f3a-a8a1d2c8600mr668057666b.23.1725474099226;
        Wed, 04 Sep 2024 11:21:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a62045e44sm21528266b.78.2024.09.04.11.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:21:38 -0700 (PDT)
Message-ID: <f14605cb-5bcd-4565-a02f-4b19dc1c8e25@redhat.com>
Date: Wed, 4 Sep 2024 20:21:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/platform/geode: switch GPIO buttons and LEDs to
 software properties
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Mark Gross <mgross@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-geode@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org
References: <ZsV6MNS_tUPPSffJ@google.com>
 <a2366dcc-908e-41e9-875e-529610682dc1@redhat.com>
 <595fe328-b226-4db5-a424-bf07ad1890b4@redhat.com>
 <20240904132104.GDZthewNjCZ4iLgEoD@fat_crate.local>
 <57bbca66-4d84-46c1-a638-1347ee6a222a@redhat.com>
 <ZtijvdOiA-RF_2RO@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZtijvdOiA-RF_2RO@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 9/4/24 8:15 PM, Dmitry Torokhov wrote:
> On Wed, Sep 04, 2024 at 06:01:30PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 9/4/24 3:21 PM, Borislav Petkov wrote:
>>> On Wed, Sep 04, 2024 at 03:02:17PM +0200, Hans de Goede wrote:
>>>> Or I can merge it through platform-drivers-x86.git/for-next
>>>> with an ack from one of the x86 maintainers.
>>>
>>> Acked-by: Borislav Petkov (AMD) <bp@alien8.de>
>>
>>
>> Thank you.
>>
>> I've applied this patch to my review-hans branch now:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in my review-hans branch once I've pushed my
>> local branch there, which might take a while.
>>
>> Once I've run some tests on this branch the patches there will be
>> added to the platform-drivers-x86/for-next branch and eventually
>> will be included in the pdx86 pull-request to Linus for the next
>> merge-window.
> 
> Hans, could you squash the following bit into the original patch please:

Ah right, I think I remember a lkp report about this, thank you.

I've squashed this in now.

Thanks & Regards,

Hans




> diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
> index 8f365388cfbb..d35aaf3e76a0 100644
> --- a/arch/x86/platform/geode/geode-common.c
> +++ b/arch/x86/platform/geode/geode-common.c
> @@ -14,7 +14,7 @@
>  
>  #include "geode-common.h"
>  
> -const struct software_node geode_gpiochip_node = {
> +static const struct software_node geode_gpiochip_node = {
>  	.name = "cs5535-gpio",
>  };
>  
> 

