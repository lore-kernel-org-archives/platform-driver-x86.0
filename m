Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEE1E748E9
	for <platform-driver-x86@archiver.kernel.org>; Sun,  1 Oct 2023 09:29:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbjJAJ3n (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 1 Oct 2023 05:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234660AbjJAJ3m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 1 Oct 2023 05:29:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B473C6
        for <platform-driver-x86@vger.kernel.org>; Sun,  1 Oct 2023 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696152533;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E7Zr1R8jrlALAOJwvEmr7pLCLH18EKSd3ED95EZwXq0=;
        b=Q5zrOxQfHGld6BtTrI0Dq/YQ85mV+LMd0oZdPy7LAbU3HGLZ3b4YpTjikcEMoGycxF7pll
        coeU5t0DlGN3jv9UbuPt2faEEvALPQSUJqVUcffwbLBLPdJIRUOk6zIjwOH+x47v3vpR2T
        eX+S7ylC1s+WlkajIJkdrniIndzfUEU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-QbKPGe_FN2Wc5QC0BZ39qA-1; Sun, 01 Oct 2023 05:28:45 -0400
X-MC-Unique: QbKPGe_FN2Wc5QC0BZ39qA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3231fceb811so9142740f8f.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Oct 2023 02:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696152525; x=1696757325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7Zr1R8jrlALAOJwvEmr7pLCLH18EKSd3ED95EZwXq0=;
        b=SGPVOVvSowPmzJXbVwi626WtLTq2j0w+5l0+Sz2AoxF5BkWJeupAp2gU7ohr24rc28
         Jp6eSBQag4Y1lVjNz+Tu338/OuLDr8A3RloDn3X8nLujbYRTqMF7E+gcqspc8XlVtLGB
         M9frmRYn9u9Zm0MvZCqheLR2DzXs/e9mnp7qYysKAoMVLwX+PYnu6BDe2wQx0C31h2aK
         S5tRiHVbMSqMNCelpsp3o4MyHMWeDw9IN66IkVM3BcCk0nuHTEve7VZF+spuXDYhys9V
         CpA9c6p1hkJ2yTjccwalNsc6TEku8Ve0NtpFxYgzsUrE3pXo6taGm2IwaWJxmUbwnnzy
         sYkw==
X-Gm-Message-State: AOJu0YwmwF65Dp+9U3LUwqJ+TeL85SiGuyv9ewFRhBACuMZoPtZgsRNz
        YlQ4uMQmnZ4I6KyIyPY5nM3LsHTwgEDt8EeJ4yEgd+4DDkId0yDztoJvfcSySJoeFNx9DPve0TD
        GYA6shNTkBtvW75GCuTkQKHne4K5+Uscexw==
X-Received: by 2002:adf:fd03:0:b0:31f:a16a:aecd with SMTP id e3-20020adffd03000000b0031fa16aaecdmr7889228wrr.68.1696152524839;
        Sun, 01 Oct 2023 02:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxhDc5+mcsVBArMqi9G588XHKKoqzdCxadNOYKAWWhGWvnJVdKwOK6bot1fRvbZo8D9u4mZA==
X-Received: by 2002:adf:fd03:0:b0:31f:a16a:aecd with SMTP id e3-20020adffd03000000b0031fa16aaecdmr7889220wrr.68.1696152524532;
        Sun, 01 Oct 2023 02:28:44 -0700 (PDT)
Received: from [10.10.158.202] ([213.144.205.82])
        by smtp.gmail.com with ESMTPSA id p17-20020a5d68d1000000b003217cbab88bsm6750330wrw.16.2023.10.01.02.28.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 02:28:43 -0700 (PDT)
Message-ID: <132feb67-c147-7ee6-b337-385e11786ec6@redhat.com>
Date:   Sun, 1 Oct 2023 11:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
Content-Language: en-US
To:     James John <me@donjajo.com>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi James,

On 10/1/23 10:11, James John wrote:
> Hello,
> 
> First of all, thank you very much for the work you do with maintaining these drivers and supporting systems. It is not an easy one.
> 
> I have debugged this bug down to the asus_nb_wmi module. When I disable this module, the problem goes away, but then other hotkeys are not recognized. Attached is a debug event from libinput, where I pressed the capslock twice
> 
> I have tried to dabble around with asus-nb-wmi.c codes to see if I could fix it by luck, by adding UX5304VA to `static const struct dmi_system_id asus_quirks[]` but to no avail. And I have a very little knowledge of what "quirks" are.
> 
> I have attached some information regarding my hardware and kernel. I will be available to provide any more information that might be needed to resolve this.
> 
> A related open thread: https://bbs.archlinux.org/viewtopic.php?pid=2123716

First of all lets confirm that the KEY_BRIGHTNESSDOWN events are really coming from asus_nb_wmi.

Please install evtest and then run "sudo evtest" and then select the "Asus WMI hotkeys" device
by typing its number followed by enter.

After this reproduce the bug and see if the log shows KEY_BRIGHTNESSDOWN.

Since you said you tried playing around with the quirks, I assume you can build
your own kernel, please let me know if that is wrong.

If this confirms the KEY_BRIGHTNESSDOWN events are coming from the "Asus WMI hotkeys" device,
then please edit /lib/udev/hwdb.d/60-keyboard.hwdb

And search for "Asus WMI hotkeys", this should find this section:

evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
 KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
 KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20

Change this to:

evdev:name:Asus WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
evdev:name:Eee PC WMI hotkeys:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
evdev:name:Asus Laptop extra buttons:dmi:bvn*:bvr*:bd*:svnASUS*:pn*:*
 KEYBOARD_KEY_6b=f21                                    # Touchpad Toggle
 KEYBOARD_KEY_7c=f20                                    # Remap micmute to f20
 KEYBOARD_KEY_20=unknown

And then run "sudo udevadm hwdb --update" followed by "sudo udevadm trigger",
that should filter out the spurious keypresses.

If that helps, please run:

cat /sys/class/dmi/id/modalias

So that a proper DMI based quirk to only to the filtering on your model
can be written.

Regards,

Hans

