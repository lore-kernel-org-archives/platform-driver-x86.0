Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149FD1411DC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590850; cv=none; b=nwA/15UIhNYxWvIFp2HPXtyMYx6/eaplxtU/OnXgWMX4Kn/Y3f1jIEQqvU2pD/wZD2d2E/AzKr7X2RnxS+CCxOAMPbcmAfrBf/RyRTNvnkIn/GoypYyQalGLuArcspSepyEJCARwfBk/tMvzlDES2OhVWliSj7Wih710kGoKsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590850; c=relaxed/simple;
	bh=53u/ieqERkyf7mkrfcHCloeINDAbD0lTZhdu4LH8wOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ryklC0lKCuh79NJiCmt1tvPWZEzN9BTDSld0Zp8RkgCI1KbLZWJKWm7TisCCheUlp9tz3N2DzaG7ob8Zu7+YioZyQ8+VZWpiVgXE93n5QvEgzd7gJuRNE2FtYYPaZOucueL47ZWDd0on0WjEjSJ00RB/fGRLH4Z9qKxTsBz9xz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ab03kL58; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ab03kL58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712590848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qnh8e0FZeCXeuN57OAvQ7h9lJ3J1XV9u7rdXhlfnOms=;
	b=ab03kL58ekied4CFhTNHO4Tfbup6zz+HA920OL3Hn94qS5nZ2nhBndxnsIsKIrvIyz/GV/
	G4vo+c9PXiyS7PdMNlXcjwWjcSc1tF5bDeqeIh+o16tygXIrMif8C1o79dJVjFwebjG7Tm
	6kZjDowPpZe3pLM5O8pRM7zcdQ4uWkM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-PD066bD4OpeWNfRYhodGQQ-1; Mon, 08 Apr 2024 11:40:46 -0400
X-MC-Unique: PD066bD4OpeWNfRYhodGQQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51c76700adso121661666b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 08:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590845; x=1713195645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qnh8e0FZeCXeuN57OAvQ7h9lJ3J1XV9u7rdXhlfnOms=;
        b=wxwk76MHUpeOyXjy+Hg7MCUk4lxfQoEvSCCsSuiVHM8As5Yh9CJwg1B3jE5SSnXRb6
         QoWFXl3o5u6/lkFHRVWyX3+lh4eyLSvg/kCw7koBV5uS8EVWrRlNfuQjccT+1CkEYAdc
         kIeVicQCE13MXUp4AclW2EywQK59ZZKtQFJkxH6Go3q1p1N7yHA4p4kOpTBnmsorGMMz
         F1oYFcDdM/Y3/SUFGqt+DpRB1j4x/b+zz3sxMSf7XSO5cUDiuuGF0puaLfj9gYkDAlE2
         DgISiiS9omKvgie4QOo1f88HrYxd7YQpQ6afD7TYwNv/EEMS8AD72saE9Wuw/OFH5RV1
         etXg==
X-Forwarded-Encrypted: i=1; AJvYcCWzBS2OfC7U3IxRHslGsqPQB8RA5CLdYFkWVLRqPqVoZ26WgaszgJ4PMqBKTAhpGSNmjLl+dCVBH4eDgxz6s/spK5FOwZJL0jB6oYrxW/wX9f7wmg==
X-Gm-Message-State: AOJu0YxJJKxcHhm7RZx3/WaMzSiAhKSVEKLtncaCuUyYTKAmQp3fs+uH
	Pt0nIJIq97V60bOIRANhu7ymlFTPMVWdjGiXsx4tll4c+7n/MpEn+xLLZVRRQqBJdbj8o5iOooN
	RPB54VkzECdZ6cLezTNDY1XYpbPkwkf3Uq+jtR5a2AinB5551b/xxGMs6Z3/xXUWlo21SCtc=
X-Received: by 2002:a17:907:2687:b0:a51:e427:f418 with SMTP id bn7-20020a170907268700b00a51e427f418mr30717ejc.35.1712590845512;
        Mon, 08 Apr 2024 08:40:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqFndACzMzgue7oq/n2V6d4eUGU5nTF24UnlZxTj1ggn2kkYl8iT6pHsyvZaXtQ8vguwA9HQ==
X-Received: by 2002:a17:907:2687:b0:a51:e427:f418 with SMTP id bn7-20020a170907268700b00a51e427f418mr30684ejc.35.1712590845135;
        Mon, 08 Apr 2024 08:40:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709061ec800b00a46d2e9fd73sm4573031ejj.222.2024.04.08.08.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:40:44 -0700 (PDT)
Message-ID: <7d1cd4f6-118a-4dbf-a882-4c13386a0e18@redhat.com>
Date: Mon, 8 Apr 2024 17:40:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] platform/x86: wmi: Mark simple WMI drivers as
 legacy-free
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: corbet@lwn.net, sathyanarayanan.kuppuswamy@linux.intel.com,
 linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240402143059.8456-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240402143059.8456-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/24 4:30 PM, Armin Wolf wrote:
> The inspur_platform_profile driver and the xiaomi-wmi driver both
> meet the requirements for modern WMI drivers, as they both do not
> use the legacy GUID-based interface and can be safely instantiated
> multiple times.
> 
> Mark them both as legacy-free using the no_singleton flag.
> 
> Compile-tested only.
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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




> ---
> Changes since v1:
> - add Reviewed-by tag
> ---
>  drivers/platform/x86/inspur_platform_profile.c | 1 +
>  drivers/platform/x86/xiaomi-wmi.c              | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/inspur_platform_profile.c b/drivers/platform/x86/inspur_platform_profile.c
> index 743705bddda3..8440defa6788 100644
> --- a/drivers/platform/x86/inspur_platform_profile.c
> +++ b/drivers/platform/x86/inspur_platform_profile.c
> @@ -207,6 +207,7 @@ static struct wmi_driver inspur_wmi_driver = {
>  	.id_table = inspur_wmi_id_table,
>  	.probe = inspur_wmi_probe,
>  	.remove = inspur_wmi_remove,
> +	.no_singleton = true,
>  };
> 
>  module_wmi_driver(inspur_wmi_driver);
> diff --git a/drivers/platform/x86/xiaomi-wmi.c b/drivers/platform/x86/xiaomi-wmi.c
> index 54a2546bb93b..1f5f108d87c0 100644
> --- a/drivers/platform/x86/xiaomi-wmi.c
> +++ b/drivers/platform/x86/xiaomi-wmi.c
> @@ -83,6 +83,7 @@ static struct wmi_driver xiaomi_wmi_driver = {
>  	.id_table = xiaomi_wmi_id_table,
>  	.probe = xiaomi_wmi_probe,
>  	.notify = xiaomi_wmi_notify,
> +	.no_singleton = true,
>  };
>  module_wmi_driver(xiaomi_wmi_driver);
> 
> --
> 2.39.2
> 

