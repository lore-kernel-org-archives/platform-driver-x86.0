Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE2C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Mar 2022 08:54:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbiCRI4H (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Mar 2022 04:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbiCRI4F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Mar 2022 04:56:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6B86A1F51A1
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Mar 2022 01:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647593685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7HWeZEMEGqeavewyZo9xEKkkuF2oYbesigQSr2n3rD8=;
        b=CfbcVT3nk/DBMU4ZRiSgzAzLXJ3V5gfZN+J8x6GSWwsw94fdeYFyAn0EKe7w7yQmmnck/C
        1Vby6GNBYjuZJplnx9BNRoXz1dYAybHkEzLl1QHdN9rfdH1zgYoNsE+938Bs1kvBZNnF5Y
        rimjRe90IZpwygIa4Jf2wlb600k7LJY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-hqoBnLuLPlGpnT5txPGi0w-1; Fri, 18 Mar 2022 04:54:43 -0400
X-MC-Unique: hqoBnLuLPlGpnT5txPGi0w-1
Received: by mail-ed1-f72.google.com with SMTP id d28-20020a50f69c000000b00419125c67f4so294094edn.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Mar 2022 01:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=7HWeZEMEGqeavewyZo9xEKkkuF2oYbesigQSr2n3rD8=;
        b=R/WZgyhslPPUnRQCHfRGbxo0wapOMQClXdvM3xFYDpOUiM5aUPAMgAC0Ws75Qa3qgb
         XR50LsOh7pr4BTNZjzC6tgE2NTV7S4miJtSlsRjSWByunR0cYT8+jn8gOEeG3bURu5s5
         52Z3jhrPLq4gkBlak8bGAEtmy1L7sk20st7ja+mtI+NCzgOuFn/BFRwOtJb/S2Ubdt7u
         zQLVkRTRQaw5PDg2jUoVYkQipL6dUtQKQFTx6HJ2Mht94/5VsUJtBLLs8np7p27fuxHs
         PTZl3hUVAkURvDSi/HB0MBM/65U1vhmUxHUGe8mQ+mQVHR3lOy+5EKCypfSLApLcxT0B
         l4kA==
X-Gm-Message-State: AOAM533SILEO9djX5WlPk9EBwwrW9kLqQMhfpsf1D5nIXeYp0pK4X6x6
        fbFoFsYU4JYKEKX5yxyPS1kfvwI4VZCj3jEt0Ki2dkcLru3s5dtZ99UpJLzH+fDqGf0yVLIJqhu
        ZCOxS0I6U5iZsrFHGxYH8shGVfTKKX1lftw==
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id cw12-20020a170906478c00b006df6b35156dmr7957515ejc.578.1647593679647;
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsXvTobev8ekDmCXMyLZm4Ixi/HitCEGGFxxCXfM+2lFdhiFrZC7EyPUeQPNh8CCeSG3v9+A==
X-Received: by 2002:a17:906:478c:b0:6df:6b35:156d with SMTP id cw12-20020a170906478c00b006df6b35156dmr7957502ejc.578.1647593679411;
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906778f00b006df84c19995sm2898424ejm.224.2022.03.18.01.54.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 01:54:39 -0700 (PDT)
Message-ID: <d1192588-8993-5052-6018-7a2f8393cff9@redhat.com>
Date:   Fri, 18 Mar 2022 09:54:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: Dell laptop touchpad disabling?
To:     Randy Dunlap <rdunlap@infradead.org>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Stuart Hayes <stuart.w.hayes@gmail.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Perry Yuan <Perry.Yuan@dell.com>
References: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Content-Language: en-US
In-Reply-To: <b9d9171d-1287-e5aa-46d2-2475817074ba@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

<attempt 2, fat-fingered send>

Hi Randy,

On 3/18/22 01:32, Randy Dunlap wrote:
> Hi all,
> 
> I have a Dell Inspiron 15 5510 laptop. Of course, it has a touchpad
> (which I think of as a nuisance pad).
> I would like to be able to disable the touchpad easily.
> 
> Are there any best practices or suggestions for how to do this?
> (I am using xfce4 as the desktop environment if that matters.)
> 
> 
> Sometimes the touchpad is discovered as a PS/2 Generic Mouse on
> the i8042 AUX port, and sometimes it is discovered as this
> touchpad: "DELL0B24:00 04F3:3147 Touchpad" on some I2C device:
> "i2c-DELL0B24:00". (The different discoveries might have something
> to do with my kernel configuration/builds, but I don't know that
> for sure.)
> 
> I have some very hackish scripts that I can run to toggle the
> 'inhibited' flag in sysfs (/sys/class/input/ for the I2C device or
> or /sys/devices/platform/i8042/ for the i8042 AUX port device),
> but that requires root (sudo), so that does not qualify as "easily"
> IMO.
> 
> E.g.,
> $ sudo toggle-aux-mouse
> or
> $ sudo toggle-i2c-touchpad
> 
> depending on which configuration the device is in.

The touchpad is supposed to be always recognized as, well a touchpad,
so you want it to show up as "DELL0B24:00 04F3:3147 Touchpad", as
you said this likely depends on your kernel config.

And then usually the desktop environment will give you an option
to disable it. At least GNOME offers a clear on/off toggle see e.g. :

https://blog.separateconcerns.com/img/gnome-touchpad-settings.jpg

Or you could use xinput properties to set the matching xinput
device, to disabled which you can do by device-name:

https://linuxhint.com/change_mouse_touchpad_settings_xinput_linux/

And then change the "Device Enabled" property.

Regardless of the method, the kernel's responsibility here is
to make sure the touchpad gets seen as a touchpad and after that
"disabling" it is a userspace problem.

Regards,

Hans

