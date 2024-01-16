Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729418AF0
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jan 2024 10:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZolPxPOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705401179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O106YIfnVWdh4mXjGyHTWPZx6xc/H9v5ma5I9J/+uJM=;
	b=ZolPxPOB6pb9jYj2IXYtfDIgWORSPPLYJHGLUMc10wTg9sKCxR+ovNWWq32MG+vJkEuoQX
	D9KkzOO4jDxtsP509QMuFDA2i+2y/IJnbDcwjlXy2MRdcHsubVqnoPFP+j/0fa1nGrMEKf
	tpErQgoRJa1k6Up/to6lsAtCOkCU47M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-kK-tAeoOPFmYKpiuZA7_xA-1; Tue, 16 Jan 2024 05:32:55 -0500
X-MC-Unique: kK-tAeoOPFmYKpiuZA7_xA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a2bc65005feso332111266b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jan 2024 02:32:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705401175; x=1706005975;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O106YIfnVWdh4mXjGyHTWPZx6xc/H9v5ma5I9J/+uJM=;
        b=MbW3L17pmO55CRTdOgHpqLF35Tk0G8ETeda6B0B8J5YRmWKQiEPzSI1pYAdq+EaZay
         +9NQkdd0QlhSncmiJbfzMQhkDAqsP13vVxyXtduQZ0Lm2PODbSPPJj40zI/513BTilbW
         DJ7bXhfM58bJI4c8EZJQ+xfQx271C1JQsstJlhqDc7ABXj2O5tbak0mHLvf3KfaC3agE
         H5VrOklKj0Hdj62yiTGZ9F4YjA0rhylpet7yAGU7guUb79Wc/Ghwy4297ZTpAsg8TAW7
         v/1yt/R4jXGbpcRjsUV53nd290tM8f8ln+/tvG9Bng1/1/FxIu5mb5oa1707KKIaNux8
         eNRw==
X-Gm-Message-State: AOJu0YzjVPA0KS6sLzkTKaQ3mjb1Jx5NO32psOyqPJQvNdJ4wAWxbAdr
	0LwrDE8mOAYbU+01rqm6GYu98sSMLWXS6Ts9+wBwBNJ+r9myUopxUhUWuUNZnFwVG4cMTAoi2J2
	NkP7iMsScgWLnUEcAm6swZzKponSHSvkoOCWVDZ5dnw==
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id h13-20020a170906260d00b00a2c72e4efb1mr3089066ejc.139.1705401174820;
        Tue, 16 Jan 2024 02:32:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLMR2PGM/GnJ+fk71EEYuew5GIcCNmIWxwkHlhcYHIOkV8jJ0XKG9Ii13NlH3XjKpYJvZBlg==
X-Received: by 2002:a17:906:260d:b0:a2c:72e4:efb1 with SMTP id h13-20020a170906260d00b00a2c72e4efb1mr3089062ejc.139.1705401174545;
        Tue, 16 Jan 2024 02:32:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b00a2e98f4c687sm76083ejb.164.2024.01.16.02.32.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 02:32:54 -0800 (PST)
Message-ID: <0b9b08a2-69c6-4068-a2cf-6aac1cc52387@redhat.com>
Date: Tue, 16 Jan 2024 11:32:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add Luke Jones as maintainer for asus
 notebooks
Content-Language: en-US, nl
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20240115211829.48251-1-luke@ljones.dev>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240115211829.48251-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/15/24 22:18, Luke D. Jones wrote:
> Add myself as maintainer for "ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS
> DRIVERS" as suggested by Hans de Goede based on my history of
> contributions.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5c2450fa4ec..e7843beaa589 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3147,6 +3147,7 @@ F:	drivers/hwmon/asus-ec-sensors.c
>  
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
> +M:	Luke D. Jones <luke@lones.dev>
>  L:	acpi4asus-user@lists.sourceforge.net
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained

