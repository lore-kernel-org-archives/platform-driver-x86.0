Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EhDBRr6A"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B92B0
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700922341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=om4cvqrGNZzHK5IOYrkm/sbDp+3pBIkDlxOhjKXyvVM=;
	b=EhDBRr6Asfwd6LYDWFuuqN3343/qYSL8v7EvAqnp9KgcL7BhSELCMuC9eMnqgNHrV96a9s
	IMcUMTgmwUOVlz+DLfMlgU6QKL1hXyrR9bzDsmaA//e+YaLfxGPsgo2liQb++W5icqgCc9
	fCtWtCy1FE/ZwmU8lwmdV2bioTUunEU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-05YDdftLM7yWMwE_kFsGmg-1; Sat, 25 Nov 2023 09:25:40 -0500
X-MC-Unique: 05YDdftLM7yWMwE_kFsGmg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9fa63374410so216689466b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Nov 2023 06:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700922339; x=1701527139;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=om4cvqrGNZzHK5IOYrkm/sbDp+3pBIkDlxOhjKXyvVM=;
        b=WOql+k+6cqA9fdDOVjvtKR4fvkF8jraAOVJ2MdNbe7VpKJ8rHM0Wc4ndY1NYASiPoL
         J9MLClnO0n5PHVAmtE+tQke6leVpfDBtaAYI+P/QSuCk5YidnIsa+J43ZKjbMdzCbsdd
         WIUi0q8kAnyA72iILXzFnKDnjw4abKFRYup1cJgA7MEKhp8bWnDhNlkJ4eTlyIUY/vnh
         yC6cUhHDdh3PrXU/6iW1prut3iMrg7EhpRmd+xZpNbfkEHffcPJsUKRSASwFMMwGmy+s
         LTEsWzfslF2G/rLiHT8SfVfQknVKh+kVsbxjfjjhS9DhKOfEDI784vqdl17S77T37k1I
         93fA==
X-Gm-Message-State: AOJu0YxXcB6mDBF5VqniSwyDu1/PKl4WPjwMMc32Ha4u+uARvRJ8SBGZ
	zbAkrHoJWyrfwDyzIb9HpjAQzDiLW/fa46AtiCiXV5GyNXT7JLU8MZrAu0YKIO1yB6+2FnEG0qY
	kte1vafpZlAkk9C0SQlBPRbouCeSnDU6V5g==
X-Received: by 2002:a17:906:70c8:b0:9e2:9647:9a54 with SMTP id g8-20020a17090670c800b009e296479a54mr4234188ejk.3.1700922338915;
        Sat, 25 Nov 2023 06:25:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8LAMzqHV72/uJJykgz950zBAk5qr79oAXl9xvpuJp/nDkfaAgbKs5Y+jL+8RUfj/FPMd8Mw==
X-Received: by 2002:a17:906:70c8:b0:9e2:9647:9a54 with SMTP id g8-20020a17090670c800b009e296479a54mr4234179ejk.3.1700922338608;
        Sat, 25 Nov 2023 06:25:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gg6-20020a170906e28600b00a090b36d618sm2299670ejb.60.2023.11.25.06.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 06:25:37 -0800 (PST)
Message-ID: <77b3eed7-825d-41c5-a802-ea891a16f992@redhat.com>
Date: Sat, 25 Nov 2023 15:25:36 +0100
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1884918.tdWV9SEqCh@dividebyzero.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Juri,

On 11/24/23 16:54, Juri Vitali wrote:
> Hi,
> Unfortunately those patches have broken the backlight reporting on older 
> laptops, which do rely on the old mechanism.

Thank you for reporting this and sorry about the regression.

And thank you for writing a good bug report with as much info
included as possible, that is much appreciated.

> For instance, on my Asus UX32A/VD when pressing the backlight up/down button 
> the backlight changes accordingly,

Ok, so the embedded-controller (EC) is adjusting the brightness
itself in reaction to the key presses, which means that
the old behavior of sending KEY_BRIGHTNESSDOWN / 
KEY_BRIGHTNESSUP was not really correct because that will
cause e.g. GNOME to then increase the brightness itself
which means that if the new brightness is correctly reflected
when reading it GNOME may increase the brightness an
additional step on top of the step it has already been
increased by the EC itself.

Which makes me wonder how to properly solve this,
so I have a bunch of questions:

1. What desktop environment are you using ?

2. Assuming you are using GNOME (for now) I guess that with older
kernels you got an on-screen-display (OSD) notification about
the brightness changing? Do you notice any difference in how
many total steps you have going from min to max with older
kernels vs the new kernel ?  If the double increase problem
happens I guess you only get 5 brightness levels in GNOME /
4 steps from going from minimal to maximum ?


Note below questions should all be answered with the new kernel
with the unknown key messages in dmesg.


3. Can you do:

ls /sys/class/backlight

And let me know the output, I wonder what method is being
used to control backlight on your machine.

4. Can you do:

cat /sys/class/backlight/$name/max_brightness

What does this say?

With $name being the name from 3.

5. Can you do:

cat /sys/class/backlight/$name/brightness

And then change the brightness using the keys, and then
again do:

cat /sys/class/backlight/$name/brightness

What are the values shown before / after changing it ?

6. Can you repeat 5 but then do:

cat /sys/class/backlight/$name/actual_brightness

7. Can you run:

sudo acpidump -o acpidump.txt

And then email me the generated acpidump.txt file
in a private email ?

> but the event is not caught by the system 
> (more precisely, dmesg is complaining of unknown key codes):
> 
>> [ 3167.842213] asus_wmi: Unknown key code 0x29
>> [ 3168.105096] asus_wmi: Unknown key code 0x28
>> [ 3168.142526] asus_wmi: Unknown key code 0x27
>> [ 3168.178860] asus_wmi: Unknown key code 0x26
>> [ 3168.216027] asus_wmi: Unknown key code 0x25
>> [ 3168.256511] asus_wmi: Unknown key code 0x24
>> [ 3168.292907] asus_wmi: Unknown key code 0x23
>> [ 3168.329704] asus_wmi: Unknown key code 0x22
>> [ 3168.366554] asus_wmi: Unknown key code 0x21
>> [ 3168.406681] asus_wmi: Unknown key code 0x20
>> [ 3168.443330] asus_wmi: Unknown key code 0x20
>> [ 3168.480900] asus_wmi: Unknown key code 0x20
>> [ 3168.516326] asus_wmi: Unknown key code 0x20
>> [ 3168.554006] asus_wmi: Unknown key code 0x20
>> [ 3168.593320] asus_wmi: Unknown key code 0x20
>> [ 3168.630108] asus_wmi: Unknown key code 0x20
>> [ 3168.670110] asus_wmi: Unknown key code 0x20
>> [ 3168.943217] asus_wmi: Unknown key code 0x11
>> [ 3169.203349] asus_wmi: Unknown key code 0x12
>> [ 3169.243239] asus_wmi: Unknown key code 0x13
>> [ 3169.279881] asus_wmi: Unknown key code 0x14
>> [ 3169.316311] asus_wmi: Unknown key code 0x15
>> [ 3169.352887] asus_wmi: Unknown key code 0x16
>> [ 3169.392806] asus_wmi: Unknown key code 0x17
>> [ 3169.429301] asus_wmi: Unknown key code 0x18
>> [ 3169.465843] asus_wmi: Unknown key code 0x19
>> [ 3169.502404] asus_wmi: Unknown key code 0x1a
>> [ 3169.542308] asus_wmi: Unknown key code 0x1a
>> [ 3169.578938] asus_wmi: Unknown key code 0x1a
>> [ 3169.615506] asus_wmi: Unknown key code 0x1a
>> [ 3169.652002] asus_wmi: Unknown key code 0x1a
>> [ 3169.692280] asus_wmi: Unknown key code 0x1a
> 
> In this case it seems that the backlight-down codes go from 0x20 to 0x29 while 
> the -up from 0x11 to 0x1a, so assuming they are not clamped somewhere else 
> they should not conflict with the ones used on newer models.

Thanks, that (the codes not overlapping with newer models codes) is
useful information to have. With that it should be easy to restore
the old behavior of sending KEY_BRIGHTNESSDOWN / UP, my questions
above are mainly because I wonder if that is the right thing to do
taking into account that the EC already adjusts the brightness itself.

> By the way, I only found those codes to be reported by asus-wmi, while other 
> inputs remain silent while pressing those keys.

Yes that is expected, for unknown asus-wmi events no events
are send to userspace.

Regards,

Hans



