Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40641D1F5B
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 10:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729940362; cv=none; b=oRH1yfTYduYIGqzNdZ2UcA6AnQ2uR7+fyqtWpTCC1AZo1FFHdm74urrXfneHxPgs0aeqx0OM//4/knhJHviGx23yspENVGvjFcz9cfsgvsGacyio0IZkqs0FervrFj7vfzZualy/GDnnGGDYL5oQ8F34EufA/38M8Cykswey+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729940362; c=relaxed/simple;
	bh=zS7mj7hdjCBvOTVAbvWesFfTrKGcV4fUeLW7KN64+9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pEgbamJ6VARymU11PreJd5fKz9hp4t/6w143XwN5jfpm4RYMeDH3NNIMz9qCt3wNT3aa9v8hg9VEkbHSaGRwgsYS0MiIC5wQCmtB4LE1ivyFRTF3yZXN1mWxU6x7lQ2ciuAHpIOPhjSJxiAqa5Rknxe5bbH7B6xQ1i2uXvtHr2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUIE1LXZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUIE1LXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729940357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBSV0C3arTErZVTFPrG+KchoTJoeLyT57cb5GKLGcMM=;
	b=DUIE1LXZ7W1SLSwUZXwxWkH8HCHLEsvNTfdgHcdIRhUw6JHC1ONggwtLgp98n6AN8jnxKR
	p8QfWnWOk+IKlWzzqq1PNtu7wSo/HrbOvVL33qSwstXgZJvvxTmbwZ7+Mmgvn78OsoMFQA
	KjYdTK2nCvqTR2WrU42d2rlJNXjkg0g=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-WKHpotluN7OEn7qQ4dRNuQ-1; Sat, 26 Oct 2024 06:59:14 -0400
X-MC-Unique: WKHpotluN7OEn7qQ4dRNuQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a9a22a62e80so203921566b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 03:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729940353; x=1730545153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBSV0C3arTErZVTFPrG+KchoTJoeLyT57cb5GKLGcMM=;
        b=bOx5dVxpZOPxKggyPZf33++EgNyRfJz9FuSuEX4DyHwECotlIpTyfhaVgxq/+Jhqdz
         OnqDECMXoKUGGvHiCdsnk21ftFb2M7NKbmqjG/bj+zv/Y4k6H9tL/FhO8mfIkHzXNDhb
         8wUs+NvFLHm1mWXLcos77VD+JMKPk0JoELMRd9fARyO7BOPi5BgqEY92lzuKGIdXG8ex
         DnxWqv6QMO9/dTJrQIgaQKfZoJZ03qIha8NPfDCWH/TWsTp1Y/jUck2rnXL7p5rjrnVm
         4BE/k+xsAFv1xA7S8+YPek/42QfisL11w6a2WiEXheeoDxydBjPjjThjqNPhv6Xph4Ud
         87NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUvEJUhvlwQOlPkBGnPdcYAVSx+EUtNQ8fo2XuPtluaBQNXeEPyc0Iei0d6x7vXP+jG0vFocgSP6xMZmgNbhmWTj+D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9UcpdEsqCEnO6XvHE7+gzcEY/vje959AgDvFxBjn7QTiO8O4C
	eCy0tOF/RmKAGvozFan3pxcPDKXuoJu5gRP6/NGETzrGcJiHAfTC3nrSZr0d7JeiiFFMnkqfGI7
	59TLUbFEf4ezODbZD4W4MWdXKfw53skOv1TTeIa8xGqA6xt1Zx24c9ePQEeYlWaTOc5cavzk=
X-Received: by 2002:a17:906:c112:b0:a99:f71a:4305 with SMTP id a640c23a62f3a-a9de5ce4681mr208608366b.18.1729940352896;
        Sat, 26 Oct 2024 03:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9ay4nTZp7eDBsuOki0emQ4am01SGr7qGcwjNI9r5JJ1uCWFVPr1Sne91sB/OYqgWbkxF+nQ==
X-Received: by 2002:a17:906:c112:b0:a99:f71a:4305 with SMTP id a640c23a62f3a-a9de5ce4681mr208606266b.18.1729940352374;
        Sat, 26 Oct 2024 03:59:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f298dfcsm162711166b.127.2024.10.26.03.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:59:11 -0700 (PDT)
Message-ID: <5310edec-7f18-48f8-b733-145fec39d0aa@redhat.com>
Date: Sat, 26 Oct 2024 12:59:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Fix inconsistent use of
 thermal policies
To: Mohamed Ghanmi <mohamed.ghanmi@supcom.tn>, Armin Wolf <W_Armin@gmx.de>
Cc: corentin.chary@gmail.com, luke@ljones.dev,
 srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 Michael@phoronix.com, casey.g.bowman@intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025191514.15032-1-W_Armin@gmx.de>
 <20241025191514.15032-3-W_Armin@gmx.de> <ZxzIMsffFj2lvScb@laptop>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZxzIMsffFj2lvScb@laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Oct-24 12:45 PM, Mohamed Ghanmi wrote:
> On Fri, Oct 25, 2024 at 09:15:14PM +0200, Armin Wolf wrote:
>> When changing the thermal policy using the platform profile API,
>> a Vivobook thermal policy is stored in throttle_thermal_policy_mode.
>>
>> However everywhere else a normal thermal policy is stored inside this
>> variable, potentially confusing the platform profile.
>>
>> Fix this by always storing normal thermal policy values inside
>> throttle_thermal_policy_mode and only do the conversion when writing
>> the thermal policy to hardware.
>>
>> Fixes: bcbfcebda2cb ("platform/x86: asus-wmi: add support for vivobook fan profiles")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>  drivers/platform/x86/asus-wmi.c | 64 +++++++++++----------------------
>>  1 file changed, 21 insertions(+), 43 deletions(-)
> 
> the original patch that i submitted did actually have the remapping
> of the different fan profiles in the throttle_thermal_policy_write() methods 
> because it was the cleaner solution [1]. however after having a discussion with luke, 
> he shared that he might be planning to remove the throttle_thermal_policy sysfs interface 
> in favour of platform_profiles [2] because of a refactoring he had been working on.
> 
> currently to control fan profiles through this driver you could use
> either /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy
> (redundant and might get removed in the future) or through platform profiles which is the
> better way of doing things.
> 
> for the reasons mentionned above, I decided to keep
> throttle_therma_policy_write() unchanged and to move the remapping logic
> to the asus_wmi_platform_profile_set(). this adopts the approach of
> having a logical mapping stored in asus_wmi struct that has to be
> converted to a physical mapping whenever needed [3].
> 
> so, if luke thinks that this won't cause any merge conflicts with his
> work [4] then i see no problem with this approach even though it might cause an
> order change when calling throttle_thermal_policy_switch_next()

Talking about throttle_thermal_policy_switch_next() we also
have platform_profile_cycle() and since asus-wmi supports
platform-profiles now I'm wondering if it would not be better
to simply completely drop throttle_thermal_policy_switch_next()
and call platform_profile_cycle() instead?

This will also keep the cycle order the same for "normal" vs
vivo even after Armin's patch.

Anyways I'll go and apply patch 1/2 to pdx86/fixes since that one is
obviously correct and fixes th Lunar Lake performance issues.

And we can keep discussing what to do wrt 2/2 and maybe also drop
throttle_thermal_policy_switch_next() if favor of
platform_profile_cycle().

Regards,

Hans






> 
> Best Regards,
> Mohamed G.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20240421194320.48258-2-mohamed.ghanmi@supcom.tn/ # [1]
> Link: https://lore.kernel.org/platform-driver-x86/4de768c5-aae5-4fda-a139-a8b73c8495a1@app.fastmail.com/ # [2]
> Link: https://lore.kernel.org/platform-driver-x86/ZnlEuiP4Dgqpf51C@laptop/ # [3]
> Link: https://lore.kernel.org/platform-driver-x86/20240930000046.51388-1-luke@ljones.dev/ # [4] 
> 

