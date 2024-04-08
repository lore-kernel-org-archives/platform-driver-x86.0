Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CB170CDA
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582252; cv=none; b=WBUou699WlIzfz8ZCZgDJ1ej33HdvjVr+vIqoovGwnTQ0F0PEHd9zUih6bQCZ53fo9NEYW6beF98rRoYM6HE8Hkdiyf6ICoqMNZp1t8rgOmb8zSho6sFK8XCtJl9Hg6bkXt74u4UwlQ6NiNSAnFuWfa417SuFevqVyfNuI9NLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582252; c=relaxed/simple;
	bh=mCWa3WUaCGNp2y80LbJ8IOiEESU6tY7qt6cCZo9GdwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OsEz5ih/ZcX8RoAQSQk2I2lnIO/CDCEfziXTiy7x30QobT8GS+yRPsoI/SFIQ/KfqT7sEh2u9/HjT1DddujeD7uVE936gzEgcbspKPSP3IXRX0uPyu0nZTb9Fx8HHiz1UxlIcAbqBCuERY71ICJZscvvrwvyhzilIanBfz/G/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YJfb1JXT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YJfb1JXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712582249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXwA9nZasaelpq1o3Tixbgv2R7/btdmPlfdwIhrk8No=;
	b=YJfb1JXTN7pUDbW+zjqmL6n9QtC3DcOMWI5Aa1xEV8kPGc8rba0OEbaVbwgFD0CW8kFJei
	gfuTU/mgZLFfPprgJ9vaIhl//IYd6gL+7GCj10xNUvOVFU3+0R+yHT2aLdgHM0RT9I6u7s
	5PemPaibX2YHDwHeRssEXW5QZOSO0wI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-DfX5zDM8Op6HdTcUwgOG1Q-1; Mon, 08 Apr 2024 09:17:26 -0400
X-MC-Unique: DfX5zDM8Op6HdTcUwgOG1Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51c03c9b8bso61073866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582245; x=1713187045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MXwA9nZasaelpq1o3Tixbgv2R7/btdmPlfdwIhrk8No=;
        b=Drutd1EmEQcUuSH0XPkxpFwSds7KdKoRYmwi0BMVCcculiSBszMivqYsGKLMq6zhBC
         Cx/kGfbdlxCutzFEShXpLflwir1kY5cPzIuUBt7YjgJauckQnSgna1TcT15T7Z+m6PRa
         hrWtMIZb6tRiFRvH+lgr1PSwQkjHrCHy7Adc4pag92iUF1x8tkTeRrif/AavFLfLdXC4
         sRzkcvQ/n0PVYMYvC1vgdOD0KeDhu3Is8m/COhI5KQAqkwx/SGTCxu39nYwGQXMIj605
         uEZkUNw7nazEATaVwrg/6T0cblLBGUoTLh6xCJMDLHnLrXV4P8JITPdCHpMkNlsKbHm/
         ZDWA==
X-Gm-Message-State: AOJu0Yx/zLwc1oODigZM/b63MPmK2hQ4I8Xl/JweHPYwkdeoLESwT92p
	6usrx7U8JFn/8+McLOlDOq37rgdzAyRmSPD2XOdTCI+v0UpSQt3v+pmTeRj88MfAD6WV6DvFk/M
	RJ5uxn67FuHKn60vIXSvZZ1pPQs0ocC26WmLsDtTK0LrNfTMIYBMIjKh9v3toAeA6DOpGZ5OVvr
	qoTrdW0w==
X-Received: by 2002:a17:907:2ce3:b0:a51:dbd3:5ac4 with SMTP id hz3-20020a1709072ce300b00a51dbd35ac4mr1461168ejc.30.1712582245662;
        Mon, 08 Apr 2024 06:17:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTAJdv+ruTsI1FzHDp0HXIZ1bxFTASZDswH4N/wMTUhZplmtPNxGZK+fNfSQ5ToScO/vt1Sw==
X-Received: by 2002:a17:907:2ce3:b0:a51:dbd3:5ac4 with SMTP id hz3-20020a1709072ce300b00a51dbd35ac4mr1461152ejc.30.1712582245354;
        Mon, 08 Apr 2024 06:17:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gs41-20020a1709072d2900b00a51b5282837sm3379606ejc.15.2024.04.08.06.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:17:24 -0700 (PDT)
Message-ID: <3126da07-97f9-4685-ab37-2d5b4273e70a@redhat.com>
Date: Mon, 8 Apr 2024 15:17:24 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: intel-vbtn: Fix ASUS VivoBook boot
 state
To: Gwendal Grignou <gwendal@chromium.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20240329143206.2977734-1-gwendal@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240329143206.2977734-1-gwendal@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/29/24 3:32 PM, Gwendal Grignou wrote:
> While qualifying ASUS VivoBook Flip 14 (TP401NAS) for ChromeOS Plex,
> we notice it always boot in tablet mode, with the keyboard and touchpad
> disabled. We have to rotate its lid over 180 degree and back to get into
> clamshell mode, or put it into sleep and wake it up.
> 
> Disassembling the ACPI table, the virtual button/switch ACPI device is
> implemented as follow:
> 
>   Device (VGBI)
>   {
>       Name (_HID, EisaId ("INT33D6") /* Intel Virtual Buttons Device */)  // _HID: Hardware ID
>       Name (VBDS, Zero)
>       Method (_STA, 0, Serialized)  // _STA: Status
>       {
>           PB1E |= 0x20
>           If ((OSYS >= 0x07DD))
>           {
>               Return (0x0F)
>           }
> 
>           Return (Zero)
>       }
> 
>       Method (VBDL, 0, Serialized)
>       {
>           PB1E |= 0x20
>           VBDS |= 0x40
>       }
> 
>       Method (VGBS, 0, Serialized)
>       {
>           Return (VBDS) /* \_SB_.PCI0.SBRG.EC0_.VGBI.VBDS */
>       }
> 
>       Method (UPBT, 2, Serialized)
>       {
>           Local0 = (One << Arg0)
>           If (Arg1)
>           {
>               VBDS |= Local0
>           }
>           Else
>           {
>               VBDS &= ~Local0
>           }
>       }
>   }
> 
> Method UBPT is called when lid angle cross 180 degree boundary or when
> the device is woken up.
> 
> At boot, VBDS is set to 0 ("tablet mode") until UBPT or VBDL are called.
> 
> VBDL used to be evaluated before VGBS by the intel-vbtn driver probe
> routine, but since commit 26173179fae1 ("platform/x86: intel-vbtn: Eval VBDL after registering our notifier"),
> call to VGBS is delayed until after the notifier is register.
> 
> To bring back the expected behavior (device booting in clamshell
> mode), make sure we evaluate VGBS after VBDL.
> 
> While at it, use function acpi_has_method() when we only need to know if a
> method exist, as commit 26173179fae1 does.
> 
> Gwendal Grignou (2):
>   platform/x86: intel-vbtn: Use acpi_has_method to check for switch
>   platform/x86: intel-vbtn: Update tablet mode switch at end of probe

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Ilpo I consider this series a bugfix so can you pick this up as a fix for the
6.9 cycle please ?

Regards,

Hans



