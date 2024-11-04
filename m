Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6195290F
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717222; cv=none; b=LibEYoChtK8m2/C4yrfTpSbjzAi4OcBS47+x9YhOaOIkZLvuu8HpjRXVuy3NEaBu5L5keA15DLZ2CBNOjSTRmAhJ+mSt1JDod6Bd/4TpElLiuAXaJ3TW5ImohJ6+ZLkM+SJ61p3mCauIs9p4MmaQKOqwBigFNDK3L+aPhCiCrDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717222; c=relaxed/simple;
	bh=znDlNlhDLF8LiaSIxnUvyQOMPaVGqEcPgI2A33q2O/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9E04FntlxDdDYhvglaQdOfvOCikZ2AtQ6WtyiHlBMlMQh8wTuMlZY5uFagk/x/akUvgWJjd5eiRGc4LEpuTuL6mq7DkNzhs39ywXSG94W7aMcBVEJpXX4bBeyUG7xNA1FWyddvgLXDW6+8IYpDzJAZblpqr3ZeFN7A3nzssA3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V23SBcr/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V23SBcr/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730717218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+hkdWQe8ibu8pVOvCTLP9AWAh0w07UKxGQbiVeuepw=;
	b=V23SBcr/yPgfx9By9cuHznHOYGiPTC7G9uSfDy+ZOOjo31WxN+W/PUglecKqmchJDtN2Xj
	5Lxr+hna1rFTxpkn0h/tPCw9rOe0ywUIrf1EgyPf/vrwkW/2zbS5FGfyuqfsaFxfIk9Wjy
	BlPaQAwHbOuwO5gpjKb3cJlWS1ltWuU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-DiwCD77ePluakFq04zSpww-1; Mon, 04 Nov 2024 05:46:55 -0500
X-MC-Unique: DiwCD77ePluakFq04zSpww-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a9a194d672bso308813566b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 02:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717214; x=1731322014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O+hkdWQe8ibu8pVOvCTLP9AWAh0w07UKxGQbiVeuepw=;
        b=cObprJyNC7wXs6dtK5h0QfUD4hylllbLMjjSbU4p10dp5WpYtgoHPdWHwS0J+7U7+K
         G7sQttcv5EmB2TUnirMO9yYf/Z3T6iL2xTzuvP1OgoCH20Q9foM7Qt5rSfaviXfW+3V5
         9Xj1cvUjNZV4e8pjYFz3WCGRQrkGYhME7qJUnhmHFtoAfCyYLS9i3OgaOs7+Vr2fQPfE
         D18Ao6WswdVOeuk7W0LF/PJJCISbPfYZr4auSQzvr8RL0Fc/PRqenMAlyi9/5L9LxcNr
         alsuHk/Lao33GmU7zIaZS9oNzsECPmzXT50cUU6PfoNxGjfZx7CicOcAsZuASOX2FDbI
         7CFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeDk4QmoW35BoKmt0HZh40OnI+jdbMxSwcchEwmUbNWzLyBrZnCqSzUxQExG9Z/qLCGjtGo7rvjf/RbvZBe1VZXdRn@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwcyf+GGrWOeT+3yQM4IK0IyTnElLgT3nPRTsxHvubUNKkl/vg
	aopMwJCSEFxdYfYCCovni9xaQizdL5VhP0wkLvcYS1WoUJDBfgy1ZHIQ1ltwQnG4FfSsuYxnhZ/
	yuxzC9UKh4NmAm9Y0LJHq6mfaVlE9pbvr66HADV0YNXQ196mpbgWZIi9zre2fGX9d8lhsMuI=
X-Received: by 2002:a17:907:d2a:b0:a9a:4e7d:b0a1 with SMTP id a640c23a62f3a-a9e6587e1e9mr1002330266b.49.1730717214458;
        Mon, 04 Nov 2024 02:46:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDfTl5tvuDcOn7KCgg/lX7lyjkpiFsKsvgpOL5j5tZ4NzC1eSA8i9JSn3yh6ifeDA7/ue8mQ==
X-Received: by 2002:a17:907:d2a:b0:a9a:4e7d:b0a1 with SMTP id a640c23a62f3a-a9e6587e1e9mr1002329266b.49.1730717214100;
        Mon, 04 Nov 2024 02:46:54 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e56681a03sm534651766b.197.2024.11.04.02.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:46:53 -0800 (PST)
Message-ID: <4186a747-8564-463c-9dc7-f1a5251de770@redhat.com>
Date: Mon, 4 Nov 2024 11:46:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ideapad-laptop: add missing Ideapad Pro 5
 fn keys
To: Renato Caldas <renato@calgera.com>, platform-driver-x86@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>
References: <20241102183116.30142-1-renato@calgera.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241102183116.30142-1-renato@calgera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Nov-24 7:31 PM, Renato Caldas wrote:
> The scancodes for the Mic Mute and Airplane keys on the Ideapad Pro 5
> (14AHP9 at least, probably the other variants too) are different and
> were not being picked up by the driver. This adds them to the keymap.
> 
> Apart from what is already supported, the remaining fn keys are
> unfortunately producing windows-specific key-combos.
> 
> Signed-off-by: Renato Caldas <renato@calgera.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/ideapad-laptop.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index c64dfc56651d..c908f52ed717 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,9 @@ static const struct key_entry ideapad_keymap[] = {
>  	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
>  	/* Refresh Rate Toggle */
>  	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> +	/* Specific to some newer models */
> +	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> +	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
>  
>  	{ KE_END },
>  };

