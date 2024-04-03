Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C016F067
	for <platform-driver-x86@vger.kernel.org>; Wed,  3 Apr 2024 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133087; cv=none; b=uV09ydkaVRSuHiFjL5tQXya7aPI1e+uBf2G91G0sVmpOYxvdM5WzjBj8FYIMlgEposPTCwsmO2MBXK80OYCgutQsqalTY9D4/NCYA+Q0oJLKFcI2NeB5ZXXtIGvmzz4z2o1Ds1qMlg634gMUukRTnFucUBxiEzOJUgc1bWLCgNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133087; c=relaxed/simple;
	bh=+vVNIkL30xXBEaWxi3EBVw+q/A/bX52+6zrF25jw+3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mXGUuUGS5PTqG/WaBHKbvm+OTlDwpWf3pX8VDyV4OYMMg8fJ04gpntJwWabOwPTQSy07ZDM1ITe5M2FimqlQcKrelhmEmKtn6doc2toMzw0nFUkdfjkh1I6JjrC7IYsW3AvUQkCnd6a4JxfyIRzb7bZQenbahwtKu6vG+iQVeMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhAYbErC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhAYbErC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712133084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VLWFcXSG4rlX1A4JD4WkEdD7OkmVurYSG5NUffi+fW4=;
	b=ZhAYbErCEdwlhfmmkY36OSTGd+ry65g0+hvhN0Um4vPYD2UQca6VCSu6dNULc7zzIc0jez
	sVi2yHOnKIo0lueLOewJfi15iauK87JX+lpy1HNSK+wv3VlBwO6+UQyd7B10t9rhyURkfm
	KpNJcXnS5idZ9XPj2/BPMcBgBe+jgmE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-CEsarF7lPLScgoKh7x2WUw-1; Wed, 03 Apr 2024 04:31:22 -0400
X-MC-Unique: CEsarF7lPLScgoKh7x2WUw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56c079c74d1so2802486a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Apr 2024 01:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712133081; x=1712737881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLWFcXSG4rlX1A4JD4WkEdD7OkmVurYSG5NUffi+fW4=;
        b=uFrzbExqH/JzEtZXJo356C20OjS7xyW5lgsj5sH/kCwMYcXzxRxwZ1fsid3JpVCNB2
         tb/fdg0dc5p2XaQbkh3/zZBFg/Uo59nvA0dN+R5N5PB46susviwGTmDuC28f/0UutbQP
         6zGRzBeE4LIkHYT+dAaDTY0DtvaWA0X0oO2Z0palGYeEraB1Cu97VR9U8lfhSoTH39NP
         vkxYuFojl3Zoz4D9/zoPbmxAyQCWkr7kaPeThNE2hDH2M3vdND6R5aJ7Wex0KnAGM2+S
         DrnNuvT3VDmjvlOWwPLy95UMT96n9zIIMQVED34SZxvWttEvcyAXMtlTpdsUDu5l6hoa
         k+dA==
X-Gm-Message-State: AOJu0YwWABsLafSnL2ASj5HAYGzF4oWTpCxxPQ+4MzNC+HP8Af9ps8Rc
	0xek1SULpJ/RaGl4onDgrTkoI9D9sNqPvNwb755FkGiclt7Fer9drwQqn9YTZLKXuQ9JBqTZZgm
	mTmQFS+j3AkxIbY+hA8KmlvQG7gtWxrAWJz6A4mxKBxHqBk9ZVO8JtAGcMNPCQIDxARaEhoY=
X-Received: by 2002:a05:6402:254a:b0:56b:e089:56ed with SMTP id l10-20020a056402254a00b0056be08956edmr14504324edb.39.1712133081189;
        Wed, 03 Apr 2024 01:31:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEVJhrcQkid/ww0Wnkt8Pd/Xp1RBCh4HcViBRk6/ugNOQ7Eel0eDd8Ak45ekBXiFn9o3cr3g==
X-Received: by 2002:a05:6402:254a:b0:56b:e089:56ed with SMTP id l10-20020a056402254a00b0056be08956edmr14504269edb.39.1712133080261;
        Wed, 03 Apr 2024 01:31:20 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id cn20-20020a0564020cb400b0056dfc8d12fasm820692edb.21.2024.04.03.01.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:31:19 -0700 (PDT)
Message-ID: <39acb3b9-a69f-4654-9749-a9af42fea39e@redhat.com>
Date: Wed, 3 Apr 2024 10:31:19 +0200
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
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 4/2/24 3:55 PM, Krzysztof Kozlowski wrote:
> On 02/04/2024 15:21, Gergo Koteles wrote:
>> Newer laptops have FnLock LED.
>>
>> Add a define for this very common function.
>>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>> ---
>>  include/dt-bindings/leds/common.h | 1 +
> 
> Do we really need to define all these possible LED functions? Please
> link to DTS user for this.

It is useful to have well established names for common
LED functions instead of having each driver come up
with its own name with slightly different spelling
for various fixed function LEDs.

This is even documented in:

Documentation/leds/leds-class.rst :

"""
LED Device Naming
=================

Is currently of the form:

        "devicename:color:function"

...


- function:
        one of LED_FUNCTION_* definitions from the header
        include/dt-bindings/leds/common.h.
"""

Note this even specifies these definitions should go into
include/dt-bindings/leds/common.h .

In this case there is no dts user (yet) only an in kernel
driver which wants to use a LED_FUNCTION_* define to
establish how to identify FN-lock LEDs going forward.

Since a lot of LED_FUNCTION_* defines happen to be used
in dts files these happen to live under include/dt-bindings/
but the dts files are not the only consumer of these defines (1).

IMHO having a hard this must be used in a dts file rule
is not helpful for these kinda files with defines shared
between dts and non dts cases.

If we were to follow this logic then any addition to

include/uapi/linux/input-event-codes.h

must have a dts user before being approved too ? Since
that file is included from include/dt-bindings/input/input.h ?

TL;DR: not only is this patch fine, this is actually
the correct place to add such a define according to
the docs in Documentation/leds/leds-class.rst :

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




1) These defines are also used in:

drivers/hid/hid-playstation.c
drivers/hid/hid-nintendo.c
drivers/platform/x86/ideapad-laptop.c
drivers/leds/leds-cht-wcove.c
drivers/leds/simple/simatic-ipc-leds.c
drivers/leds/simple/simatic-ipc-leds-gpio-core.c



