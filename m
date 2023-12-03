Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0oxA0m/"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02898F2
	for <platform-driver-x86@vger.kernel.org>; Sun,  3 Dec 2023 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701618266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z0TnsgLS6gynRXupSaJmtAZlDUzUBcMDxPmId5EPD54=;
	b=Q0oxA0m/t560Z44OcuRDjSKdbOHDxi9bW0IVyWyJr+dEYPxs1IuiG0LjO01noq4z3z9cuL
	cFdNf2d6tYbh4zJyAlzca8f83an6rn3CNK30eKXs7jrU8VjxCEto/Oo9Rp22cUkIkRl8R1
	Fdx2Lq/N835UTpwzbaGDr4rlcfgMswI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-n32fc-jlO86WnJEh-6hhSw-1; Sun, 03 Dec 2023 10:44:19 -0500
X-MC-Unique: n32fc-jlO86WnJEh-6hhSw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a0009a87651so294649766b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Dec 2023 07:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701618258; x=1702223058;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0TnsgLS6gynRXupSaJmtAZlDUzUBcMDxPmId5EPD54=;
        b=v+A53DjYHBacy6BF8ccT6erFXFPt/jWDSV9mwgvlTsVTAypGPYNI/zvjfy4O/IBeDX
         mbvq392XrJOEqOoTeqC/r6eEvAblNDuPsX57f8/hyF2rNtR4umcJXlAwWSmwH2qGV/PV
         6k8Uto9jOAIr4PPRYgD5XP56axkzwzSRPvb6PNQSxd0BXjS2Spcf52V+sW0Wi92IZsKb
         LXbQXR/f7rrcv55w7sj1XhxsLJJPEb+qYOJ/g7KPb80cSJAola3eDtETOnBsjUyxx7Dz
         d95wNFNi5NuPc4P/SV7kedGnI+BDOc41U8uPYfufMqRdm8x/agxuFD7ykJMiJqJ1V2dI
         ivyw==
X-Gm-Message-State: AOJu0YzC6CGu5p7ydFWTYSdmeFrMYX2+CsILwlH8YpUSiJl9JG1ipCaT
	Rj1ZapfZXogY9xSTnjbsgJeakxvtWcwHejO2rPM/dut0zTDJIyXbGnfXtHOYd88gWURbDQHGK4w
	+ydpBYvxDGxLAxJq3Qcww9G3KEMzbsqtmmg==
X-Received: by 2002:a17:906:1b:b0:a19:a19b:c708 with SMTP id 27-20020a170906001b00b00a19a19bc708mr2785421eja.88.1701618258810;
        Sun, 03 Dec 2023 07:44:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFc8fLNGP7C/FfmnVLvgzSx4x2N9FxHfAsU3Oi9MREguhMZqzmR4BspLW7Uo9hWu95DWs8IMw==
X-Received: by 2002:a17:906:1b:b0:a19:a19b:c708 with SMTP id 27-20020a170906001b00b00a19a19bc708mr2785413eja.88.1701618258551;
        Sun, 03 Dec 2023 07:44:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ox11-20020a170907100b00b009920a690cd9sm4271312ejb.59.2023.12.03.07.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Dec 2023 07:44:17 -0800 (PST)
Message-ID: <a20c201e-7e81-4575-ab12-76f872c96499@redhat.com>
Date: Sun, 3 Dec 2023 16:44:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
To: Juri Vitali <juri@dividebyzero.it>, James John <me@donjajo.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>
Cc: platform-driver-x86@vger.kernel.org,
 acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
 <39b5f902-3a7e-fc04-254e-776bf61f57e2@redhat.com>
 <024c4ad4-1a73-8c24-5e6f-f8c9f2f7b98f@redhat.com>
 <1884918.tdWV9SEqCh@dividebyzero.it>
 <77b3eed7-825d-41c5-a802-ea891a16f992@redhat.com>
In-Reply-To: <77b3eed7-825d-41c5-a802-ea891a16f992@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Juri,

On 11/25/23 15:25, Hans de Goede wrote:
> Hi Juri,
> 
> On 11/24/23 16:54, Juri Vitali wrote:
>> Hi,
>> Unfortunately those patches have broken the backlight reporting on older 
>> laptops, which do rely on the old mechanism.
> 
> Thank you for reporting this and sorry about the regression.
> 
> And thank you for writing a good bug report with as much info
> included as possible, that is much appreciated.
> 
>> For instance, on my Asus UX32A/VD when pressing the backlight up/down button 
>> the backlight changes accordingly,
> 
> Ok, so the embedded-controller (EC) is adjusting the brightness
> itself in reaction to the key presses, which means that
> the old behavior of sending KEY_BRIGHTNESSDOWN / 
> KEY_BRIGHTNESSUP was not really correct because that will
> cause e.g. GNOME to then increase the brightness itself
> which means that if the new brightness is correctly reflected
> when reading it GNOME may increase the brightness an
> additional step on top of the step it has already been
> increased by the EC itself.
> 
> Which makes me wonder how to properly solve this,
> so I have a bunch of questions:
> 
> 1. What desktop environment are you using ?
> 
> 2. Assuming you are using GNOME (for now) I guess that with older
> kernels you got an on-screen-display (OSD) notification about
> the brightness changing? Do you notice any difference in how
> many total steps you have going from min to max with older
> kernels vs the new kernel ?  If the double increase problem
> happens I guess you only get 5 brightness levels in GNOME /
> 4 steps from going from minimal to maximum ?
> 
> 
> Note below questions should all be answered with the new kernel
> with the unknown key messages in dmesg.
> 
> 
> 3. Can you do:
> 
> ls /sys/class/backlight
> 
> And let me know the output, I wonder what method is being
> used to control backlight on your machine.
> 
> 4. Can you do:
> 
> cat /sys/class/backlight/$name/max_brightness
> 
> What does this say?
> 
> With $name being the name from 3.
> 
> 5. Can you do:
> 
> cat /sys/class/backlight/$name/brightness
> 
> And then change the brightness using the keys, and then
> again do:
> 
> cat /sys/class/backlight/$name/brightness
> 
> What are the values shown before / after changing it ?
> 
> 6. Can you repeat 5 but then do:
> 
> cat /sys/class/backlight/$name/actual_brightness
> 
> 7. Can you run:
> 
> sudo acpidump -o acpidump.txt
> 
> And then email me the generated acpidump.txt file
> in a private email ?

I guess you have not been able to make some time to answer
the above questions yet.

Any chance you can make some time to gather this info soon ?

Regards,

Hans


