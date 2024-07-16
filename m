Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F935336D
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 09:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121801; cv=none; b=gQZO+MXjBDQCxyAwbhLAhDH2YU19rvCWShPyIRVR924RLo7zZDx0+KcMKKIcNgeGo+AfJgjmmtwOYXySpSaXw1YESvvQALUm4cDUFEjElRdrn6cG3iky90DPhOhsC7aC5cmWBPiWO93xdZsxlIVbOZizQFT06FDPr3PgSzTULJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121801; c=relaxed/simple;
	bh=b+LcZOsf+EgRghjCEFoPbtWpwibpaIgxMtr9ZUJeKso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwWSo8gQlPF08xlaU0uKJ9KGo8ql8jhapMswHIDfMGFXHhsMNHttGrqcZWWY/CQlccURvR+6Nd9pZITcmZR82TY/qasWcsJccWE3MhUpC5DTA77QV/bl1wa1JyO54sEsTvlI2YhuVfbTgFuiUBofq7tvF2pmBNCEt3kP4AHdBSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uda/4qg6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uda/4qg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721121798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ANugUyElPB5pizHI+f9eYrm0/ZuIW1EZlaT5lKQ6IBg=;
	b=Uda/4qg6iMgU5t68fXWORfodoGFD47xbFKQMWtaNHnzEX5SWVBpv7BDRyXqPQ30kHQdz5s
	pSFIU3/7xGnxy4QJt4UXTIGlSIxFYLbIMWTYb2p5JDS2octlX6mnc7o2oYaJm9jFPKVv4Q
	xPAkxgOEbeMGG2LVfag9PRUsVuhzLRM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-cZO_SLsmObasLUIUoZbY3A-1; Tue, 16 Jul 2024 05:23:13 -0400
X-MC-Unique: cZO_SLsmObasLUIUoZbY3A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c5dfbd16so394694566b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 02:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121792; x=1721726592;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ANugUyElPB5pizHI+f9eYrm0/ZuIW1EZlaT5lKQ6IBg=;
        b=WTQo77JeFmraWSjOF3xGeYTltYZJMlI67uZf4UgF5Jeq3Rgmecjirf2DJ/pF7h/IRh
         Enh971ixAKThEsmFnyH53I7ufUKu2/q4YwK/eRhWpOR83LZ51DAI9YYGIY4rBQQlbnci
         XoI7jkEHaLBcd7xAiS42/0Zgpr01S6oRHHM2x1EotP2h6QTe3zn06n+kWdYcZ1sIRXKQ
         Z/nxgJCy61OWVM4/hCxBfn8iefX8/8PvDpP+a1Ip+O7zq/cCbFuYMz+97yoql2VqkoXW
         o0vu8GM+TLsg0ERcO6g3d2Un9McLfFr6+/mnzVslH3PI/olbMcrPn56G0j4C8ng7h1q6
         woYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbeVeJkPVKGKobYx37NKw7ttsgC58yz+pBfy21YvRQBwdTjITiTieSonovECCbMVN/HML0N/PK7W3xLtUS3VRvgjZ9y+yPnSYc9BnsK1Dn7xxs/w==
X-Gm-Message-State: AOJu0YwU/INqkNWUUkI7NrtrruCcrX794KdHphu5C/So5Vqhq9UGyM49
	QaerkOaKi4TQ9keI9rTR71SdSpS86a8x2VL9d6X8vgtwSRf7glxnkuzOteSzNazn7efm3yzlVFp
	nBdZ/hO1U8Sw1QxJAjZ2qJtIa5A5lrqdjouxE5cPD8wuMNsPTG2Of4AguUAUPc+0Qb0HvZaKIZN
	45SV4=
X-Received: by 2002:a17:906:1404:b0:a77:d52d:5c5f with SMTP id a640c23a62f3a-a79eaa304eamr102961866b.51.1721121792227;
        Tue, 16 Jul 2024 02:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVz6JIXFqEyDm1+K7DeOOJfZVTR0GwzFW7oY2oLmv2b5C9AII8aCAGaGqI0KbiKUrn3kFMPA==
X-Received: by 2002:a17:906:1404:b0:a77:d52d:5c5f with SMTP id a640c23a62f3a-a79eaa304eamr102960866b.51.1721121791895;
        Tue, 16 Jul 2024 02:23:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc5e8609sm288336866b.94.2024.07.16.02.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:23:11 -0700 (PDT)
Message-ID: <3171ddf0-0228-48e6-8351-f4a9e56b11a3@redhat.com>
Date: Tue, 16 Jul 2024 11:23:11 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] platform/x86: asus-wmi: fix TUF laptop RGB variant
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>
References: <20240716011130.17464-1-luke@ljones.dev>
 <20240716011130.17464-2-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240716011130.17464-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/16/24 3:11 AM, Luke D. Jones wrote:
> In kbd_rgb_mode_store the dev_get_drvdata() call was assuming the device
> data was asus_wmi when it was actually led_classdev.
> 
> This patch corrects this by making the correct chain of calls to get the
> asus_wmi driver data.
> 
> Fixes: ae834a549ec1 ("platform/x86: asus-wmi: add support variant of TUF RGB")
> Tested-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 7d87ff68f418..2b968003cb9b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -906,10 +906,14 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	struct asus_wmi *asus = dev_get_drvdata(dev);
>  	u32 cmd, mode, r, g, b, speed;
> +	struct led_classdev *led;
> +	struct asus_wmi *asus;
>  	int err;
>  
> +	led = dev_get_drvdata(dev);
> +	asus = container_of(led, struct asus_wmi, kbd_led);
> +
>  	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
>  		return -EINVAL;
>  

