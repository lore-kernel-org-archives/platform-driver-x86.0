Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWwaAl/M"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB36CB8
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702289065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OcYrBNviJmQqeZj6rGf99udo6YED76FBmbtM04WwxNY=;
	b=bWwaAl/Mpfn0ru9q6LgX2CYDqW0ji3q/GMQfjj6DjX5wbrJYhLRa0/zA9Wh8huYHj3mtRk
	C02TyNgZ9YHewLQFk8+b9wI6gR1YtAJfq9FpbUwKdKlyDbiUUEdhJlnPi5USb9TQRCDNE7
	vyNl1qSxZ5LQxjG9TDYTc6i6Pt2yM/Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-tgqXokfpMce-kmyJsI35VQ-1; Mon, 11 Dec 2023 05:04:23 -0500
X-MC-Unique: tgqXokfpMce-kmyJsI35VQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1f93205e60so10840066b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702289062; x=1702893862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OcYrBNviJmQqeZj6rGf99udo6YED76FBmbtM04WwxNY=;
        b=GFNtIGoUh5wk1bxBVOZRJIgdV2716/lMdJyN2XfRqQj6PA4+PRwwFNSNzY4UYT39GI
         vkhCjYCXu+rE7IWQCLPy8Mjy/JQ1UHf8ATBMCjlw9bp9Aauuqmc5LNYvFXa13lQfelci
         Y3qCSqXi/ejAzeAl0i3+GK/ErBeJhg+98UpuvOru19fvjEPK/iyFrNt8FEFUZdeCDPdY
         NwunyyfKH7wTwx/f0PRX5stUbdI5LGw13Q6jNIVJJn2FYIDklJgNul5+x1w1+N/y/n+Q
         gw8by3ytRUZFsBDnE60vx6gAnkWLgCX7XDedNbkyoPVcDuLmhH/S4RJNNxlnCkENJ2Zm
         7trQ==
X-Gm-Message-State: AOJu0Yz/xXThZFq/f9JDo4GSk83nu6fOXMkLCD6zomAqvrLrdxMDmbV0
	H6RZFBOE+YIl3wv/IPAghDU/lllxIPyXEoZgWrIOdQfFwZP2UGtgeZrBvmmrjeNZZHz0x28aEPf
	NstaoFPyn+4vYxmu1llh8M0aMUfkweYkLnA==
X-Received: by 2002:a17:906:598b:b0:a19:a1ba:8cd3 with SMTP id m11-20020a170906598b00b00a19a1ba8cd3mr1553257ejs.113.1702289062367;
        Mon, 11 Dec 2023 02:04:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFdkVKvaLrI4hS/LMA4k4v2r7sUuKXFEknzV28h/dctl37WCkqs5k6ZH/yvWtOvAOLJQGjUlQ==
X-Received: by 2002:a17:906:598b:b0:a19:a1ba:8cd3 with SMTP id m11-20020a170906598b00b00a19a1ba8cd3mr1553243ejs.113.1702289062098;
        Mon, 11 Dec 2023 02:04:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ss20-20020a170907c01400b00a18850d2240sm4661237ejc.143.2023.12.11.02.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:04:21 -0800 (PST)
Message-ID: <175daa6f-5778-4138-afdf-6475c11bfb3c@redhat.com>
Date: Mon, 11 Dec 2023 11:04:20 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Convert to platform remove callback
 returning void (part II)
Content-Language: en-US, nl
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Corentin Chary <corentin.chary@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rishit Bansal <rishitbansal0@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Jonathan Singer <jes965@nyu.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 SungHwan Jung <onenowy@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
References: <cover.1701726190.git.u.kleine-koenig@pengutronix.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <cover.1701726190.git.u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/4/23 22:52, Uwe Kleine-König wrote:
> Hello,
> 
> back when I sent a series to convert all platform drivers below
> drivers/platform to use .remove_new()[1] I missed the two drivers
> converted here.
> 
> The two patches have no dependency, so each can be picked individually
> if needed by the driver maintainers. (But I won't say no if Hans picks
> up both patches together :-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> Best regards
> Uwe
> 
> [1] https://lore.kernel.org/r/20230927081040.2198742-1-u.kleine-koenig@pengutronix.de
> 
> 
> Uwe Kleine-König (2):
>   platform/x86: asus-wmi: Convert to platform remove callback returning
>     void
>   platform/x86: hp-wmi: Convert to platform remove callback returning
>     void
> 
>  drivers/platform/x86/asus-wmi.c  | 5 ++---
>  drivers/platform/x86/hp/hp-wmi.c | 6 ++----
>  2 files changed, 4 insertions(+), 7 deletions(-)
> 
> base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b

