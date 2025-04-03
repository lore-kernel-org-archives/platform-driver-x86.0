Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE1924337D
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Apr 2025 10:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676497; cv=none; b=VTq95aTxBsHb/xKWKMVWsCf7lXpXXSBi5pbAOAauMeQqvWXqqwUxkbpS2MylNhHhYx/ifjSAX/FoCqeR4dN1qL5uWv3aCUHRGeXZv95hpL5PuriUVan4ywtdkZ8HoCDjTeeTl2tyWsgbk0l6MULKiCeJhGzKi3DZNj9rX1DFKes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676497; c=relaxed/simple;
	bh=JWjH3araMHJyRJybQvGPkZR0l7mrqd/uAk9wpPAMIoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=shheKoQu5SUc3voTmoWFrcj+X7HCvxRCJkcvz0iFph4LQ9lautTs7v2UijA5yPBYXukRPXXkg41XdCL+ftyevPN1o/gFhCOSi0EeNayCgjBMzKTwLftESDmz8VsmMRr5wxdHNLm7X6h6Ko7F+Oj9OgpjY6MvBOvwDlUjgxW/28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RfQ/BD8t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RfQ/BD8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743676494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jvjWEQ8sEQQuYaIo555XN8rmhMxRr1kV4nr4IOqNXrI=;
	b=RfQ/BD8t2zbKIID5FZOmXPPlCtXreVesWBXk0TrDquyFDIGcQd/UV09e+2bxeBuSjdkAyM
	SkEiz1azo+Rc98vDPwwPISxhwl9Og93IdpGh7I1BuYKTOP3V5Ne69SeXIWNamcLAvj8hCz
	mq8fqNvHRJ2ie0YQhiLj/pvUqxv9JVk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-Y9B_OSx9Ppy6nDoQq333mw-1; Thu, 03 Apr 2025 06:34:53 -0400
X-MC-Unique: Y9B_OSx9Ppy6nDoQq333mw-1
X-Mimecast-MFC-AGG-ID: Y9B_OSx9Ppy6nDoQq333mw_1743676492
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac25852291cso41590266b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Apr 2025 03:34:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676491; x=1744281291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvjWEQ8sEQQuYaIo555XN8rmhMxRr1kV4nr4IOqNXrI=;
        b=IGqtp9zywqT6YFCC97WHYdDo3oTaoo+KBLNQVzyemArYh9dOupFC/QE00zNPAlRxZW
         gPxGaDRl3riBJgnHbhg5TKnRY7AnA3ktj/WswidrUo1oAxHhhrp+/HDU1iZItUV6+ZkE
         /86q4R3CzWjNws8+z8F8wegoVtjvAqeLrPnVkndIKwQOpeuK2J5+ckf7qodAXuPMWVwI
         HmIXEfU0iF80cJ3ML1HRwnfC8wlc01XhdMlYPdx7ndPGplw7fGVWmnLJFuGStTY3PU2D
         fqWrwT21gtRfb92Qoxd3tT9Kifa4/1ywAd8e9YCRo+BgJ4S6VpGzxSdci3hoGwuR3lfF
         LK6w==
X-Gm-Message-State: AOJu0YxfiGZo5J1ZKYfS6jdDA2kXQLS7RlNzGpXgmzaTbUebXjpHJlFG
	tII1aQlPC6gnP7n8gbt5ThYOTcn7/1DZjNh/XupYS/BqflVOsoRYH3WATWzdcD7e1Pz1QtTXuSx
	yDUV9oJD9phgbY2wrAlW3vDFJPD50zPRH4DAVgWSj5+RPB4AZn1wqEAtXnKnazHO52ULKVnPJO5
	yEtAM=
X-Gm-Gg: ASbGncvncxwBCxxZ68vGI1NqNx51hH21SIQNmUAR3zqfEZKxZLtsuMZHIC7UZQann43
	1ebccUsf6TIxJvNgbExaH1HFlOgUKiKL16oBOZSZQnflROpjZgBDT5UZGcBpaRhPVGUSGvhHrGN
	y80r7sQXzxTZ+kpZ8uD2DAtK0mpbwZHlkaiiGJt/sBJTaT0WokdPA9MEfggahj1bOBzWVndDmhP
	J+RqVBRSpcDdKOES0fYXn9N7fUwD279VruL207vjaYlbhkFK8x25xcMNPvXdD9o18lRNK6xvBmG
	PyaMYjGLZ+d7QHRO46JWuZaRjmvkWDfmar0QHLlmzFCV7fwckV9Qfd1P7brIQzc8mx6ijYRELsN
	xaQIUm3+22CsgvThUUi5c46exd3yHvMQAp0EaJWckKb7F2+oS0WJikzLfJYTXM2AGAQ==
X-Received: by 2002:a17:907:2ce4:b0:ac1:db49:99a3 with SMTP id a640c23a62f3a-ac738bad2ddmr1776293466b.40.1743676491571;
        Thu, 03 Apr 2025 03:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9kqM2fvr3dgrzxDAcnZomUginkKGwga5ewxQTlULhVie4CjOX1vVbwHtHl//Gj5hWaxmNDA==
X-Received: by 2002:a17:907:2ce4:b0:ac1:db49:99a3 with SMTP id a640c23a62f3a-ac738bad2ddmr1776292366b.40.1743676491234;
        Thu, 03 Apr 2025 03:34:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013dfd6sm72418266b.90.2025.04.03.03.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:34:50 -0700 (PDT)
Message-ID: <dbb95bde-8163-4799-8414-c60ba1c69aa5@redhat.com>
Date: Thu, 3 Apr 2025 12:34:50 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad-acpi: Add support for new hotkey
 for camera shutter switch
To: Nitin Joshi <nitjoshi@gmail.com>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 mpearson-lenovo@squebb.ca
References: <20250403053127.4777-1-nitjoshi@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250403053127.4777-1-nitjoshi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nitin,

On 3-Apr-25 7:31 AM, Nitin Joshi wrote:
> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
> has new shortcut on F9 key i.e to switch camera shutter and it
> send a new 0x131b hkey event when F9 key is pressed.
> 
> This commit adds support for new hkey 0x131b.
> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>

Does the EC also actually enable/disable the camera in response to
this new hotkey, or is this purely a request to userspace / the OS
to enable/disable the camera?

And if this is purely a request is there some other thinkpad ACPI
calls we can make to actually disable the camera or should this
be fully handled in software in the OS / desktop-environment /
camera stack ?

Regards,

Hans



> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 0384cf311878..80f77f9c7a58 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -182,6 +182,7 @@ enum tpacpi_hkey_event_t {
>  						   * directly in the sparse-keymap.
>  						   */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_CAMERASHUTTER_TOGGLE = 0x131b, /* Toggle Camera Shutter */
>  	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile in 2024 systems */
>  	TP_HKEY_EV_PROFILE_TOGGLE2	= 0x1401, /* Toggle platform profile in 2025 + systems */
> @@ -3271,6 +3272,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
>  	 * after switching to sparse keymap support. The mappings above use translated
>  	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
>  	 */
> +	{ KE_KEY, TP_HKEY_EV_CAMERASHUTTER_TOGGLE, { KEY_CAMERA_ACCESS_TOGGLE } },
>  	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
>  	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
>  	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },

