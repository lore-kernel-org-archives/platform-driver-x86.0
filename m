Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A42C8C46CA1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Sep 2023 15:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbjIRPT0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Sep 2023 11:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjIRPT0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Sep 2023 11:19:26 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543C2172B
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:18:01 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-530fa34ab80so2827227a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Sep 2023 08:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1695050279; x=1695655079; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9zireYzfZqPvtmuSRJPvpYJD83Rj6yAr7QXhkyH79c=;
        b=GFFjoodceEGHsL0oPmkU3LHvjt+cOLyt7b+zW+pVfKhdcMbnznFfprwGOZvTpBzcSE
         3Rz/q/Ygnsb4HMdM+7qmw0bRvBPjOKlgA/qd9YzaBIg/YbKP45D5H/zVpsMCf13+hf53
         tTkBLfp7I10j/cvxgF9CJECtv2+Isp7nZHMDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695050279; x=1695655079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9zireYzfZqPvtmuSRJPvpYJD83Rj6yAr7QXhkyH79c=;
        b=aJ9F6WHQZgHKHwiIkhinp2cG1G6P1NfZY7+VtRpqVo/Mh/Ioxjn7n7LomKUE5ThOqU
         32LAQZBWjhOPP0tZWxKac4NQhc+C8lKz6jiyg0qAK0mAqG4FLCh7oaYKD5kYDDqinLb7
         7ckdCBeUV78WsroYy4EO3DQHpPOKFnCEnrmRGYyfkslzUTZuaqy6DF99PjZ1RKCz/sik
         0XDbJofaPMle0yMOgSXsPFtrXU7/CxaSrO8gF6IgRhVahB3UBuke4uBvXf/tIWQXZBmP
         xMWuXFyoxYX0lmmwukf1zOjwIkHOm8Tj+LgAabNvIu+0vJwJjg7HrQnDPoLg1O1w7Xvk
         VjVw==
X-Gm-Message-State: AOJu0YyMJ40kITMg4SdaC9TvCRCrXnyQj8LPOq2rN4V3E8I55ZgkE8uQ
        YGe/hjjDLm69m6kCw5nkVqvovvWiMj2BrP9L1w4XrA==
X-Google-Smtp-Source: AGHT+IG85HoCQwWQ+0t5nMcdQfG4+rFMbC0pjWDcLyJx5ppNu+YRsczWqfK45z60KXWJ0QobOv5rxA==
X-Received: by 2002:a17:906:fe4a:b0:9a1:e0b1:e919 with SMTP id wz10-20020a170906fe4a00b009a1e0b1e919mr16662172ejb.4.1695048523437;
        Mon, 18 Sep 2023 07:48:43 -0700 (PDT)
Received: from [172.16.11.116] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id o15-20020a1709061d4f00b009a1e73f2b4bsm6555817ejh.48.2023.09.18.07.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 07:48:42 -0700 (PDT)
Message-ID: <c6caae28-01fc-2354-6c7a-3f515a0e1402@rasmusvillemoes.dk>
Date:   Mon, 18 Sep 2023 16:48:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 2/2] platform/x86: think-lmi: Use strreplace() to
 replace a character by nul
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Mark Gross <markgross@kernel.org>
References: <20230913092701.440959-1-andriy.shevchenko@linux.intel.com>
 <20230913092701.440959-2-andriy.shevchenko@linux.intel.com>
Content-Language: en-US, da
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
In-Reply-To: <20230913092701.440959-2-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 13/09/2023 11.27, Andy Shevchenko wrote:

> @@ -921,7 +913,7 @@ static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *at
>  static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
>  {
>  	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
> -	char *item, *value, *p;
> +	char *item, *value;
>  	int ret;
>  
>  	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
> @@ -934,8 +926,7 @@ static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *a
>  		ret = -EINVAL;
>  	else {
>  		/* On Workstations remove the Options part after the value */
> -		p = strchrnul(value, ';');
> -		*p = '\0';
> +		strreplace(value, ';', '\0');

So how do you know that the string contains at most one ';'? Same for
all the other replacements. If that's not guaranteed, this is not at all
equivalent.

Or maybe the result is just used a normal string afterwards, and it
doesn't matter at all how the content after the first ';' has been mangled?

It's certainly not obvious to me that this is correct, but of course I
know nothing about this code.

Rasmus

