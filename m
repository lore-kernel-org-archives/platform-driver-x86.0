Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933A657C6
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712590471; cv=none; b=dXuiqSy0ZVO5vmZmPz/N4FBc0j534udNZScV5EI42jyNNFLctrGoGbSExvutf0PT5jOPxyQ99YLj4reTmj4gggiUbI8YxTs/n2m2xBCYlmg+fqa7o0j4tockNAB9jIN4Kld6B8Jq0GYKbMI3i1Ox7ugdkiGPq0v1GCxyAdS/8Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712590471; c=relaxed/simple;
	bh=bfYX38G8ZCRAM95tWDoR4rAezj/cF0A0MNt+qc7albI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMtN9HtclpzrILYxT/riO/SKB6qRyoPEnpEHAZb/qOqrtYDcMHG/9KM04vIiJQuQyHWpfnlj641RjDLPV/VAfbX/hIDJn4V75c4jc1CMQRV7H66a04uQqG/FKTa90BzwSmXs0v+PBMkG16P2kGwLJm15sbgLkhXN4zlhwL0Cgp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQl1/lFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQl1/lFw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712590469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H15iF3YBdHoWrpI4d3uQlDTh+WNqb2wWNfa+ukHkBrg=;
	b=DQl1/lFwXQip493eESOC49Y2npyT8shqtsCEtFTP0aaVNqOV09UaCxF7V0eKE+FKIKkBC6
	dEg9AXt5rVXsF4YhWWhEEyjG93qhXdzIQM6JGIbqJ6mdK8AnQM6hZUDeNm/AEmzM+1TsaR
	iAY3eCx2Wa2+b4NLUypoW9GBqvaUr08=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-Mw1rnqHTNhqlyG3hFoswgA-1; Mon, 08 Apr 2024 11:34:26 -0400
X-MC-Unique: Mw1rnqHTNhqlyG3hFoswgA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-51701401bd4so778052e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 08:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712590464; x=1713195264;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H15iF3YBdHoWrpI4d3uQlDTh+WNqb2wWNfa+ukHkBrg=;
        b=h2LA4cd3+gSXgoO04PxsFwLo5DhNt061MGRnpwn1xTldbDj7CUn0tQhmnAoDwgyhmo
         aIiRvrqSJOymCo0yPs6gblkbxj2HiWmpMhSbbQF1LoyzGYAVZOrGVBgyRWswss6zq0Ud
         TaUNaPAMFUD+17OIacUiFixSbJP7UfRV6p7db6jyrKciJ1pV6WPmnJXqK8TV7praJIGi
         aX+HA5U+J0N7pm5LsVZQCvR9RKyFBf+swAqO4EzyAtlWpjoLntw+FNsPcHpoNDw6VKbA
         fTArev8oY2n0tH9aYd0mUItWeEsV9VG4vM/t5nyHBlPNj2MsmAmc+lR/iAMf9BEy6qVR
         Mt1g==
X-Gm-Message-State: AOJu0YxwrIOlHOn/uL8dm9wCzvm7OdUyrLI8Rc2HmaAj+1kLmJE0eal0
	xsVlYIj35Rh29vPWgUZTSxo0wAvwz8ggH6OXb1t2Fe8wbqnk1ETeqmlbVRi5yes1ftNI1qiI/DC
	f/cigN/d+bLZQ4HQf5CAb3e7W9xHH3qA8UI+jGW0cGRgDnQ0uHYp/amSh0UWyqwGFoG6C0WQ8w/
	H0GMFzDQ==
X-Received: by 2002:ac2:5215:0:b0:513:84b6:6915 with SMTP id a21-20020ac25215000000b0051384b66915mr5365406lfl.20.1712590464709;
        Mon, 08 Apr 2024 08:34:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKdgrSbHUIiEqhrc/rnbcG5tjdxk2AqLa3rWq4Ma9jCdnXKziSMJbzdP/I3BZjfjXfcU1utQ==
X-Received: by 2002:ac2:5215:0:b0:513:84b6:6915 with SMTP id a21-20020ac25215000000b0051384b66915mr5365307lfl.20.1712590461556;
        Mon, 08 Apr 2024 08:34:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a59-20020a509ec1000000b0056bc0c44f02sm4354441edf.96.2024.04.08.08.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:34:20 -0700 (PDT)
Message-ID: <bdaf73fa-7aef-4f54-8eb5-c932785fc96c@redhat.com>
Date: Mon, 8 Apr 2024 17:34:20 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Silence logging for some
 events
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240402124351.167152-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240402124351.167152-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/2/24 2:43 PM, Hans de Goede wrote:
> Stop logging unknown event / unknown keycode messages on suspend /
> resume on a Toshiba Portege Z830:
> 
> 1. The Toshiba Portege Z830 sends a 0x8e event when the power button
> is pressed, ignore this.
> 
> 2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
> suspend, ignore this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans



> ---
>  drivers/platform/x86/toshiba_acpi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 2a5a651235fe..16e941449b14 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -270,6 +270,7 @@ static const struct key_entry toshiba_acpi_keymap[] = {
>  	{ KE_KEY, 0xb32, { KEY_NEXTSONG } },
>  	{ KE_KEY, 0xb33, { KEY_PLAYPAUSE } },
>  	{ KE_KEY, 0xb5a, { KEY_MEDIA } },
> +	{ KE_IGNORE, 0x0e00, { KEY_RESERVED } }, /* Wake from sleep */
>  	{ KE_IGNORE, 0x1430, { KEY_RESERVED } }, /* Wake from sleep */
>  	{ KE_IGNORE, 0x1501, { KEY_RESERVED } }, /* Output changed */
>  	{ KE_IGNORE, 0x1502, { KEY_RESERVED } }, /* HDMI plugged/unplugged */
> @@ -3553,9 +3554,10 @@ static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
>  					(dev->kbd_mode == SCI_KBD_MODE_ON) ?
>  					LED_FULL : LED_OFF);
>  		break;
> +	case 0x8e: /* Power button pressed */
> +		break;
>  	case 0x85: /* Unknown */
>  	case 0x8d: /* Unknown */
> -	case 0x8e: /* Unknown */
>  	case 0x94: /* Unknown */
>  	case 0x95: /* Unknown */
>  	default:

