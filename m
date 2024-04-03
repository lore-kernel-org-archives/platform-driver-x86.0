Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBE6FE12
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Apr 2024 08:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133581; cv=none; b=pJuTtI3AK6gexNwU4adqwGES0ft/aouJDY7+lFVJ+4rfyGItVrPpgueHkJjLU4KT3yZHLsKlAz3UN5JEESeiHGMQsxBUkiZCN3DZue0/2hJ8r4hfP5mk1jNWePx/MIYvJfB1u6BDCZj3M+4+0yPqepHvDijYsO3KhiB4ZAJJoHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133581; c=relaxed/simple;
	bh=oX1f18o8YYXgxS133FsNouB7LDA9X+oiIEuwMjfh7cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QqToPBhXGGmYwqnVs9NE/lTiWrDU9wOiSOxEL5+wqtNwf9hR3x1UduM3hbosUYP+HJ+17MwuVowRnk8sVKeKFgx57VTdjRJjwR2kC4ICXzV5IlBWRSuNWpCxBMdTicLADFHFXjYZ0nzBRrpozXUwrxncvCO12taFa+g/xHhV1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZxM0Fzc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZxM0Fzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712133578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YOAN9UDBf2fvp2SNU3Z3PBO73HHDwz2R1xk7y6LptS8=;
	b=aZxM0Fzc7gvPYnHHBFLcdX4N6lBPA/+i54cbSx/zqnCvXStZ5Xi+x0MO3kj6QdopNedS36
	NToClnOHiyaCXhUDxuJjbqJLQ89w+V4EYqXA8jHd6FTU/QnRRpYlnMHFnuK6VPevhmPpOr
	V2rFjV3fRXILhyBxpi8tOGLQYYyKUc0=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-ADxXRc-SOjeqn1MpBykqvg-1; Wed, 03 Apr 2024 04:39:36 -0400
X-MC-Unique: ADxXRc-SOjeqn1MpBykqvg-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d6c8f170e2so61294591fa.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Apr 2024 01:39:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133575; x=1712738375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOAN9UDBf2fvp2SNU3Z3PBO73HHDwz2R1xk7y6LptS8=;
        b=qWlWHJSQrc41iQIyBbgIXV83Hdg36gWxcptG5pcaHJMUTDoehnWouA0oD2LX3SpuUN
         XqSfQlT7B3efVIAas1ROt9/X0u0LUeJSrF2BGWFlTaUQStf3bVaL+J5FhWIXYZj/wek1
         5pxJk3Np82ewdH6v1ETHL+PdXRZikZxxNToJeDIqTqwpVDENON6vr5MXi33OLFXz5Hno
         50ISJHW3qg7qqnY4BB9veJ/smLaGpqLwz3ZsLlVt+I4wcfVltQr/hr3Yseti+Tzv+Pij
         RoVe5wxJG8E6rUXy6qHu1BsrNUnf5F+8wIyt/JqECEu6R/Ycmp0ERT4OEmjYCyyBN/bi
         OuFg==
X-Gm-Message-State: AOJu0Yx2H+HLF9ymxkYM06uXLwCxoh1QbOq/HocRmyLVCVSbNPjGRSP7
	2rkpYbjSBemkDlA7LRSgbu90oJm7nYk8Bhoxi7IQwPWpOVSc0JHS/jCNYcUXmZlXCLyOGpss7uQ
	jIdcwJKByu2gtKsxTmYJQCwhCD+T3hqot4zFGSV6I+nz/0sKpLS8DVfhxmLmTwVRIgaFeiAY=
X-Received: by 2002:a19:5e03:0:b0:516:9ee4:72ca with SMTP id s3-20020a195e03000000b005169ee472camr3454538lfb.21.1712133575195;
        Wed, 03 Apr 2024 01:39:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuArrLUAVWnRMIygSAlLs5UMP2oskkC8LAqbo6b1gMKytLI0T2wbEK04cJ5pWLegUSDDUcWg==
X-Received: by 2002:a19:5e03:0:b0:516:9ee4:72ca with SMTP id s3-20020a195e03000000b005169ee472camr3454522lfb.21.1712133574736;
        Wed, 03 Apr 2024 01:39:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r20-20020a17090638d400b00a4e59587f63sm4421923ejd.193.2024.04.03.01.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:39:34 -0700 (PDT)
Message-ID: <4956933c-49c4-49ab-a91a-7e0efcc211d5@redhat.com>
Date: Wed, 3 Apr 2024 10:39:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: add LED_FUNCTION_FNLOCK
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
 <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
 <39acb3b9-a69f-4654-9749-a9af42fea39e@redhat.com>
 <368e9817-0000-4f69-9f09-568827466121@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <368e9817-0000-4f69-9f09-568827466121@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/3/24 10:36 AM, Krzysztof Kozlowski wrote:
> On 03/04/2024 10:31, Hans de Goede wrote:
>> Hi Krzysztof,
>>
>> On 4/2/24 3:55 PM, Krzysztof Kozlowski wrote:
>>> On 02/04/2024 15:21, Gergo Koteles wrote:
>>>> Newer laptops have FnLock LED.
>>>>
>>>> Add a define for this very common function.
>>>>
>>>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>>>> ---
>>>>  include/dt-bindings/leds/common.h | 1 +
>>>
>>> Do we really need to define all these possible LED functions? Please
>>> link to DTS user for this.
>>
>> It is useful to have well established names for common
>> LED functions instead of having each driver come up
>> with its own name with slightly different spelling
>> for various fixed function LEDs.
>>
>> This is even documented in:
>>
>> Documentation/leds/leds-class.rst :
>>
>> """
>> LED Device Naming
>> =================
>>
>> Is currently of the form:
>>
>>         "devicename:color:function"
>>
>> ...
>>
>>
>> - function:
>>         one of LED_FUNCTION_* definitions from the header
>>         include/dt-bindings/leds/common.h.
>> """
>>
>> Note this even specifies these definitions should go into
>> include/dt-bindings/leds/common.h .
>>
>> In this case there is no dts user (yet) only an in kernel
>> driver which wants to use a LED_FUNCTION_* define to
>> establish how to identify FN-lock LEDs going forward.
> 
> Ack, reasonable.
> 
>>
>> Since a lot of LED_FUNCTION_* defines happen to be used
>> in dts files these happen to live under include/dt-bindings/
>> but the dts files are not the only consumer of these defines (1).
> 
> Yes, but if there was no DTS consumer at all, then it is not a binding,
> so it should not go to include/dt-bindings.
> 
>>
>> IMHO having a hard this must be used in a dts file rule
>> is not helpful for these kinda files with defines shared
>> between dts and non dts cases.
>>
>> If we were to follow this logic then any addition to
>>
>> include/uapi/linux/input-event-codes.h
>>
>> must have a dts user before being approved too ? Since
>> that file is included from include/dt-bindings/input/input.h ?
> 
> Wait, that's UAPI :) and we just share the constants. That's kind of
> special case, but I get what you mean.
> 
>>
>> TL;DR: not only is this patch fine, this is actually
>> the correct place to add such a define according to
>> the docs in Documentation/leds/leds-class.rst :
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks. Is it ok for me to merge this through the pdx86
tree (once I've reviewed the other 2 patches) ?

Regards,

Hans



