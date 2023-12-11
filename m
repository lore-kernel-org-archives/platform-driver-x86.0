Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LFdgWwwc"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A4C3E8
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702290299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkHNWKGI03k4jt/36VeYdeQHQ4kAe1Ed9JP4ATBzPOI=;
	b=LFdgWwwce4ac2xCOxLPA8q1vbNce3fBo/C1HBSdxTSkYMoLshbYaRqQOumAIVqmK1DCalP
	qr1FQoLf5XvbVp9CLjFhptn0OYzrofWaP6cf8nM8U9JToTkLoklnq3Qti2wrKOvupXJzk7
	bHMb2V5j06ZvtXwC3TkW08QAJC8IS6w=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-HCL5wf3tPp6RKzA5EiDH3g-1; Mon, 11 Dec 2023 05:24:57 -0500
X-MC-Unique: HCL5wf3tPp6RKzA5EiDH3g-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a1c989d460eso252679866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 02:24:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290296; x=1702895096;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkHNWKGI03k4jt/36VeYdeQHQ4kAe1Ed9JP4ATBzPOI=;
        b=jzf2n9o797AxkgEvdvdAOGWpvvxZOpF2WYiRH9sugf4ggcS5CEexZuaTeTrdomFc/l
         HuUqUCnYDx735dc2WE5iwcNMTwG2Jjlar88wwiiD1FTRsfIcoqvFVCu011am6g7IWowF
         VRJfbF+VSfN28uHptk2j+0H1H+AHziOdv39tK/022hMu/bmTqco1pZZuF2KP/HjsD1ux
         OKHmHttnfY0hGXvC4OoBrzJVZtmvHqsvE99aXbjZLEa72GM8kf4qAzWhdPAvYJXLXzn2
         t0bIbDGtV/EFEySnrj0bOM1A/VERrn6K+t1QhNiizo7XTsUf0+2088H2lyioHFzzwDpw
         aBng==
X-Gm-Message-State: AOJu0Yx1rLWJL0uLZl7dTwv+fMB80LrVH0b89uh8bSPdyHpequK88WYZ
	2jOsnjPQVso9PbS/2G5HHnSOALPGoyIyp9zBtw87dt61lYAx+6WujRzeY2qVPZAlH8n7Fbw5+tG
	j8tbQUG6E2IYnk9IkvUVBrM60EgBpVccMWw==
X-Received: by 2002:a17:907:968c:b0:a1b:70fe:e896 with SMTP id hd12-20020a170907968c00b00a1b70fee896mr2295358ejc.130.1702290296343;
        Mon, 11 Dec 2023 02:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbHvDvDfb1Na+EoFufMVnvnALvsHRom59hQf/K126GVY985lax337NZg5MQOJhwcifefHmYw==
X-Received: by 2002:a17:907:968c:b0:a1b:70fe:e896 with SMTP id hd12-20020a170907968c00b00a1b70fee896mr2295346ejc.130.1702290296030;
        Mon, 11 Dec 2023 02:24:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un7-20020a170907cb8700b009fc42f37970sm4634457ejc.171.2023.12.11.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 02:24:55 -0800 (PST)
Message-ID: <29bc74c3-b73a-4a5a-abca-3999e70fe71f@redhat.com>
Date: Mon, 11 Dec 2023 11:24:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] platform/x86: wmi: Cleanup obsolete features
Content-Language: en-US, nl
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com, corbet@lwn.net
Cc: Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231210202443.646427-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231210202443.646427-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/10/23 21:24, Armin Wolf wrote:
> This patch series removes three features deemed obsolete:
> - the debug_dump_wdg module param:
>   - suffers from garbled output due to pr_cont()
>   - functionality is better provided by "fwts wmi"
> - the debug_event module param:
>   - pr_cont() usage
>   - uses the deprecated GUID-based API
>   - largely replaced by the ACPI netlink interface
> - ioctl interface
>   - used only by a single driver, no adoption otherwise
>   - numerous design issues
> 
> Since the ioctl interface is actually used by userspace programs,
> the only user (the dell-smbios-wmi driver) was modified to implement
> the necessary pieces itself so that no regressions are expected.
> 
> The series depends on
> commit cbf54f37600e ("platform/x86: wmi: Skip blocks with zero instances"),
> which is currently in the "fixes" tree.
> 
> All patches where tested on a Dell Inspiron 3505 and work without
> issues.

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







> Changes since v1:
> - add Reviewed-by to patches 1, 2 and 5
> - drop patch adding the driver development guide
> - rework error handling in dell-smbios-wmi
> 
> Armin Wolf (5):
>   platform/x86: wmi: Remove debug_dump_wdg module param
>   platform/x86: wmi: Remove debug_event module param
>   platform/x86: dell-smbios-wmi: Use devm_get_free_pages()
>   platform/x86: dell-smbios-wmi: Stop using WMI chardev
>   platform/x86: wmi: Remove chardev interface
> 
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 173 ++++++++----
>  drivers/platform/x86/wmi.c                  | 285 +-------------------
>  include/linux/wmi.h                         |   8 -
>  3 files changed, 132 insertions(+), 334 deletions(-)
> 
> --
> 2.39.2
> 

