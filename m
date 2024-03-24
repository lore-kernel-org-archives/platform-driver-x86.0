Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7851318622
	for <platform-driver-x86@vger.kernel.org>; Sun, 24 Mar 2024 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711292138; cv=none; b=Gc991hgyVcoUUinHAPoUMnpoGZCERF9WHaa12eL7qetcYyyu58rTvqQl/RzcPjO/dDhPI14KzeEYYVVaSBaAs7DF9D0Wg3ijJR7OAJczhVOqDxSmDAIGkxzL4PKjKAEPC9f5GrRPCazrQwyf7mdrFMZ4VbkZUt5FNqtlpvHiS0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711292138; c=relaxed/simple;
	bh=WJoWst2zWLDtp8+Lu77pigv3C7PxlCT5Xd4GOWz6EAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fSPTczuzIvXl3Dczp8aGzhDlZmBcSvthNLn1UHzbNtkIXezpiFPnlJYuSAvEb1RXl9PyZefXU/szyfLOIeluc/2NWic0zN/DGaHCs6SYDAYvVHtbQSRPxrxbHzrp0goKYQFnjui8GVt+tbkztqxe7al02lVZlhTXhAKqTtPsz6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvuPsJ6g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvuPsJ6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711292135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoWkPYMgfn83U/WIpgmkyv2XVlLKQD/eNN6maIkW/vQ=;
	b=GvuPsJ6gXVDN0FGmJt09sK5Q+ymbLRg0n1/WF9lpLGffy0JBqu/1pLAN58XQHagxj5ZeZd
	tvOqxJjC18IeNyP/6vmEPj6ESGoANnXWQKY8HK79za/lrHrMFuIGfjfkzrVKeHFjjQaqta
	pNEHRk6qqdQndP4Xbol981tj9yPa82Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-101EHallPBePiUIyCZW87g-1; Sun, 24 Mar 2024 10:55:33 -0400
X-MC-Unique: 101EHallPBePiUIyCZW87g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4921e09cebso14613766b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Mar 2024 07:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711292132; x=1711896932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoWkPYMgfn83U/WIpgmkyv2XVlLKQD/eNN6maIkW/vQ=;
        b=HaWcmuvpF0Tce1f4Ad0sJZykr1TAxOwf1ofzaAtZir+5YeivcfVzF8qiEI6hFMbcNM
         bXZP9R+3b42Od4o0ifXDpmAqPqGCkbup/whQdnrNb8U3PCRSoPyLq7rE+oz2Lny2rqhE
         zPvEvfJzXbFoUtl4kNuObOYX1VeQR992DXaXESvXrisHtIgjXhRVyB8TYviLO1lvxXJz
         BoJDXYyL4nocuetLxmK9t4dcmszou3ZZk/kH4M85BH8Py/foQ4MG2CSjcYWhGN4cI5sY
         TE4UCYeDdOTEiZEo8aam2rfK61uyQnYPparZip+cq+4ijpawmeuZaUzwq/LYFgGOAm2W
         rBTg==
X-Forwarded-Encrypted: i=1; AJvYcCXqamO0UGHKrZbL5FodC3HELo2SjNJAfe6pcg8WXQNax0YD5lgM9AKfCBVl/ucVAzaasCsv3oJdGVP8k9qtTUaxAnTnfNoFIKrjv3McObHDWNiuHA==
X-Gm-Message-State: AOJu0YwkEfedFQC+NS+QIVNMHBCWciacKt8ziavt4B+RyMEdZWtk57A9
	anl6+Ui2LvRy2jZWQ7z3peXDWKApzmVOFSckzQ2xPW+6p+5MUK/RjPNae/U2CO0TCvLSiYdjoAq
	lSIX+j9utErrMIUYEFgcyDAo+Bzx5LnXuuVnLGtlNy/53W0+edpdblzsluUnCzSdIYJg4dXHeaz
	sytcI=
X-Received: by 2002:a17:906:110d:b0:a46:967b:7c94 with SMTP id h13-20020a170906110d00b00a46967b7c94mr2972930eja.18.1711292131899;
        Sun, 24 Mar 2024 07:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxZZIYrtutRgtQNAdaEoOkVNvYIb+8XyS6Fs70snfoHYWImMZPXg0HmOlQNNF4auSy32WHxQ==
X-Received: by 2002:a17:906:110d:b0:a46:967b:7c94 with SMTP id h13-20020a170906110d00b00a46967b7c94mr2972924eja.18.1711292131571;
        Sun, 24 Mar 2024 07:55:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id b2-20020a1709062b4200b00a4725e4f53asm2031403ejg.40.2024.03.24.07.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Mar 2024 07:55:31 -0700 (PDT)
Message-ID: <c1b08bbb-ad57-4f41-9b7b-40a6aeb3da9b@redhat.com>
Date: Sun, 24 Mar 2024 15:55:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: Add ACPI quickstart button driver
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, dennisn@dennisn.mooo.com, lkml@vorpal.se,
 ilpo.jarvinen@linux.intel.com
Cc: coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240131111641.4418-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240131111641.4418-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin and Arvid,

On 1/31/24 12:16 PM, Armin Wolf wrote:
> This patch series adds support for the ACPI PNP0C32 device as
> proposed in 2022 by Arvid Norlander. The first patch adds support
> for the device itself, while the second patch was taken from the
> original series.
> 
> Both patches are compile-tested only.

Armin, thank you for creating a new cleaned up driver for the
quickstart button support.

I have managed to get my hands on a Toshiba Portege Z830 and
I have successfully tested this series. That is this makes
the 2 quickstart application and the toggle-touchpad button
work when the system is running normally.

Neither the quickstart buttons, nor the touchpad-toggle button
which also uses the PNP0C32 interface, work to wakeup
the system from sleep though.

I've also review both patches and they look good to me:

Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

So I plan to merge this series into pdx86/for-next once
6.9-rc1 is out.

Regards,

Hans



> Armin Wolf (1):
>   platform/x86: Add ACPI quickstart button (PNP0C32) driver
> 
> Arvid Norlander (1):
>   platform/x86: toshiba_acpi: Add quirk for buttons on Z830
> 
>  MAINTAINERS                         |   6 +
>  drivers/platform/x86/Kconfig        |  13 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/quickstart.c   | 225 ++++++++++++++++++++++++++++
>  drivers/platform/x86/toshiba_acpi.c |  36 ++++-
>  5 files changed, 280 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/platform/x86/quickstart.c
> 
> --
> 2.39.2
> 
> 

