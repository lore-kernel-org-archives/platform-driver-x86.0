Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E94EEC6
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cTzMhTZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704198255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1z2FIWF5xXoGle2BmUiqa1khMnkaoG7BkJVaJgp0ig=;
	b=cTzMhTZCK5C1qNaUJWGOvmBED5Lf36Z4briaTuZbeg3/c6Z2+DAa0SJmzezf26rO0aqx6u
	BucepWAfeM8rK4l6+lbrlK0aN2iHretpe6QMx//UYsobn3TcAU3IqSki8kGlsGs1SsFP1d
	C/IPJwXPnPShn7rcUhcrA5M1v4jpkIc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-84-Kn1NO7CYNVW6QX2y2Adm0Q-1; Tue, 02 Jan 2024 07:24:14 -0500
X-MC-Unique: Kn1NO7CYNVW6QX2y2Adm0Q-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-555bda8b4a1so1606526a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198252; x=1704803052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1z2FIWF5xXoGle2BmUiqa1khMnkaoG7BkJVaJgp0ig=;
        b=MraRBrLdtynjCXmu9hYKTO1JRVHN6TBt8Y28mqRXGocMGQDaz85FnexYuLzwWAlM15
         bQ97rHW65BBxh51operDtpGgauCWp+fE8eeNdSeLZFPJLn53liobS4UTuiB/wMAunprY
         9I1hZWvmWyusfq6XtZkfq/7HB56mvieByOefT0ecH6+3S+HQPAFhjr/8NI0WaA3Eyj44
         kHZ6VAJuk42dBvaHgUcuKCUPlclyf/XpOtA6CM4V3EUcYUfXVIWFyUlsJKNy0Ka3STvO
         /YOTcXSaFQUdH6hsJ2rf69JU+2Q93avOgFic7FymYTxcwjwLGLE7kCuepDlCmZvNOWSg
         bStQ==
X-Gm-Message-State: AOJu0YyC/5ChQaHc1DI0Icjl55N3AlUdl30yFBuOQcS/Vone2dC9GG5V
	BvbfX8tPRFCxfkXEryP4Ljnb/NNNPYJNEoNICWLnC3KdBkOwn6OFKKCKeL9D5F3Jw/AX6//F1na
	MOL5Cp5dsjjXYC6VPfveSPjERcGPgFKuBK6YR3MRpphBTM0MVNQ==
X-Received: by 2002:a50:cd56:0:b0:553:5dc1:47b3 with SMTP id d22-20020a50cd56000000b005535dc147b3mr10881336edj.26.1704198252208;
        Tue, 02 Jan 2024 04:24:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcripK3yS9e5YPfqQZdip7JgLSB+/48Vn7C8t0uzx9y9cLJqbSIvhtgkrFotZ0UPDSQB1SCA==
X-Received: by 2002:a50:cd56:0:b0:553:5dc1:47b3 with SMTP id d22-20020a50cd56000000b005535dc147b3mr10881331edj.26.1704198251904;
        Tue, 02 Jan 2024 04:24:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ez9-20020a056402450900b0055504002a5fsm9824333edb.72.2024.01.02.04.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:24:11 -0800 (PST)
Message-ID: <099d762f-6802-4646-865e-b61a85d04bb1@redhat.com>
Date: Tue, 2 Jan 2024 13:24:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: Remove "X86 PLATFORM DRIVERS - ARCH"
 from MAINTAINERS
Content-Language: en-US, nl
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Darren Hart <dvhart@infradead.org>
References: <20231222144453.2888706-1-andriy.shevchenko@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231222144453.2888706-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/22/23 15:44, Andy Shevchenko wrote:
> It seems traffic there is quite low and changes are often not related
> to PDx86 anyhow. Besides that I have a lot of other stuff to do, I'm
> rearly pay attention on these emails. Doesn't seem Daren to be active
> either. With this in mind, remove (stale) section.
> 
> Note, it might be make sense to actually move that folder under PDx86
> umbrella (in MAINTAINERS) if people find it suitable. That will reduce
> burden on arch/x86 maintenance.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans




> ---
>  MAINTAINERS | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index da022945e184..33d15e089ccb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23820,15 +23820,6 @@ F:	drivers/platform/olpc/
>  F:	drivers/platform/x86/
>  F:	include/linux/platform_data/x86/
>  
> -X86 PLATFORM DRIVERS - ARCH
> -R:	Darren Hart <dvhart@infradead.org>
> -R:	Andy Shevchenko <andy@infradead.org>
> -L:	platform-driver-x86@vger.kernel.org
> -L:	x86@kernel.org
> -S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/core
> -F:	arch/x86/platform
> -
>  X86 PLATFORM UV HPE SUPERDOME FLEX
>  M:	Steve Wahl <steve.wahl@hpe.com>
>  R:	Justin Ernst <justin.ernst@hpe.com>

