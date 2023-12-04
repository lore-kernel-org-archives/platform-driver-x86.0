Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVGliCQ3"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A459990
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 05:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701698096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tdFDUUUxOwtqPAheyaZp8n0eSygz3dRJqXpqGDk9O5Q=;
	b=OVGliCQ3WV3fKpSCSWb+j2SDRu4UWkrUHSCjwmml9BhzUaYjN46Y8UyYHGi0sTyPXQcl7A
	+FDxAY9Dw13Dbk31QU+ScBnb5zcj1w8CqLY2KHNHpKE4KTlct7MFflw9yS7aM1DLvXYTvC
	Ta5Mfv7pZaQPxXIf6up0kzcqDY+i5TI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-Lkp6TTHpPgKy6OqgFimZvw-1; Mon, 04 Dec 2023 08:54:55 -0500
X-MC-Unique: Lkp6TTHpPgKy6OqgFimZvw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-54cd2281cd2so985076a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Dec 2023 05:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701698094; x=1702302894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdFDUUUxOwtqPAheyaZp8n0eSygz3dRJqXpqGDk9O5Q=;
        b=DuTFcC40lbAhe9uZPCmLEOSFdVW4EE5TYltou1t6flD+Me1VMkNBk97Jjb5/YD72On
         oRJAxOXTpHlPhGthBfKUxIXMzTXrWsnhuC8XV4jRBZlJRmrpEmFMC2rnEKdTWwzpkA6o
         tYc6w8E3Z4I+JuCxee/aUFM/WxYBq0xriL01xWQLh7yq+JdXqLqDNLJB9s2/XEQYZgHl
         Emnf7WCbVtCJAoHu9Ql2fmqtqdgQRiWfg38EzezCAx8LLJeE8g03+3syHg1lS8ACClYF
         JFPad6emWMpCn8Fs5eF5KN0NcwDWUWYKhHnfqtfwmYufAc0KY8xON/TphB8DTeQ7hXMK
         AyOg==
X-Gm-Message-State: AOJu0Yx1YUeLsHuYJiPWuRoFX1mztVrgigxHJ18UBvf3OJn4PfefFyl4
	5iduO0R+pp3E031sl9kP2gjZMdTggxMT+OFPEItuIkKta2c/l0eHEqbzqcz6vdx4J/Z2H8TZSlC
	iKzdolwWFv6YXXtcyYyShmjLsArOSlOimBAKPvFwudA==
X-Received: by 2002:aa7:d687:0:b0:54a:ff0f:78d6 with SMTP id d7-20020aa7d687000000b0054aff0f78d6mr5984857edr.0.1701698094338;
        Mon, 04 Dec 2023 05:54:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdHSKd36vR1S9KTgm43Ou5IlRgJNwlqoeCr0Zp/NxaBzJiQa38fIfp+9swWnt+ed9BqebUCw==
X-Received: by 2002:aa7:d687:0:b0:54a:ff0f:78d6 with SMTP id d7-20020aa7d687000000b0054aff0f78d6mr5984845edr.0.1701698094053;
        Mon, 04 Dec 2023 05:54:54 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g2-20020a056402320200b0054ca3697e2csm2146885eda.25.2023.12.04.05.54.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 05:54:53 -0800 (PST)
Message-ID: <93b172c0-79ad-47d0-9948-e286917c18bb@redhat.com>
Date: Mon, 4 Dec 2023 14:54:52 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS
 Lock and PrntScrn on Zenbook S 13 UX5304VA
Content-Language: en-US
To: juri@dividebyzero.it, James John <me@donjajo.com>,
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
 <07b057618b72f301142585844ccdcaab75a716fe@dividebyzero.it>
 <f656f81bb288e69878ca001ec3e27c3ad647e7ea@dividebyzero.it>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f656f81bb288e69878ca001ec3e27c3ad647e7ea@dividebyzero.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 14:06, juri@dividebyzero.it wrote:
> December 4, 2023 at 01:32, juri@dividebyzero.it wrote:
>>
>> Thank you for the reply, and sorry for the delay.
>>
>> As I was gathering the information you asked for I realized that the behavior has changed in the meantime, and I am not sure of the reason why (but I guess due to some package update, possibly unrelated to this).
>>
>> If I understand correctly, now the events are no longer reported by the Asus WMI driver, but by the Intel backlight driver. Because of this the backlight variations are once again reported by the DM (KDE Plasma 5, on Arch Linux) in 5% increments, and no longer seem to be under EC control (i.e. the backlight is no longer adjustable during boot, before the DE is up).
>> The new behavior persist even downgrading the kernel and the firmware package, so I'm not sure which package may be responsible for the change.
>>
> 
> Investigating further I found that that the change was not due to an updated package, but because I mistakenly removed a kernel cmdline argument, i.e. `"acpi_osi=!Windows 2012"`. Restoring it the behavior returns to the same as before. 
> 
>> Booting into Debian Bookworm (v6.1.0-13) the old behavior is restored (i.e. the one before the previous patches), with Asus-WMI once again in control (so I guess that at least the change do not persist across reboots).
>>
>> For the aforementioned reasons I can no longer reproduce the issue on the original environment (KDE Plasma 5 on Arch Linux) but the behavior on Gnome on Debian is basically the same as before, so I'll be using that.
>> In both cases (now on Debian, and previously on Arch) the brightness has a granularity on 10-ish steps (0-100% in increments of 10% for KDE Plasma on Arch, and 9 unnamed steps on Gnome on Debian), and no "double-change" seem to be occurring.
> 
>> On Debian: 
>>>
>>> $ ls -l /sys/class/backlight/
>>>  total 0
>>>  lrwxrwxrwx 1 root root 0 Dec 4 00:26 acpi_video0 -> ../../devices/pci0000:00/0000:00:01.0/0000:01:00.0/backlight/acpi_video0
>>>  lrwxrwxrwx 1 root root 0 Dec 4 00:26 acpi_video1 -> ../../devices/pci0000:00/0000:00:02.0/backlight/acpi_video1
>>>
>>
>> On Arch:
>>>
>>> ls -l /sys/class/backlight/ 
>>>  totale 0
>>>  lrwxrwxrwx 1 root root 0 4 dic 00.43 intel_backlight -> ../../devices/pci0000:00/0000:00:02.0/drm/card1/card1-eDP-1/intel_backlight
>>>
>>
>> On Debian:
>> * `max_brightness` is `10` on both devices;
>> * `brightness` goes from 1 to 10 following the screen brighness only for `acpi_video0`, while in `acpi_video1` it is stuck at `10`; 
>> * `actual_brightness` follows the screen brightness on both devices.
>>
>> On Arch:
>> * `max_brighness` is 4296;
>> * `brightness` changes in steps of 215 units for each 5% reported increment;
>> * `actual_brightness` is the same as `brighness`.
>>
>> Notice that before the latest change in behavior the output on Arch was IIRC the same as now on Debian, but unfortunately I haven't recorded it so I cannot say with absolute certainty.
> 
> Restoring `"acpi_osi=!Windows 2012"`, on Arch Linux the result is:
>> % uname -a                                                                                                                                                            
>> Linux Arch-Zenbook 6.1.64-1-lts #1 SMP PREEMPT_DYNAMIC Tue, 28 Nov 2023 19:37:35 +0000 x86_64 GNU/Linux
>> % ls -l /sys/class/backlight                                                                                                                                        
>> totale 0
>> lrwxrwxrwx 1 root root 0  4 dic 13.41 acpi_video0 -> ../../devices/pci0000:00/0000:00:01.0/0000:01:00.0/backlight/acpi_video0
>> lrwxrwxrwx 1 root root 0  4 dic 13.41 acpi_video1 -> ../../devices/pci0000:00/0000:00:02.0/backlight/acpi_video1
> 
> * `max_brightness` is `10` on both devices;
> * `brighness` is stuck at `10` on both;
> * `actual_brightness` goes from 0 to 10 only on `acpi_video1`, while is stuck at 10 on `acpi_video0`.
> 
> Notice that with this kernel and configuration I again have the `unknown key code` messages and no OSD feedback, which I wasn't able to replicate in the previous message.

Ok, that is good to know. Is there any specific reason why you are passing
"acpi_osi=!Windows 2012" on the kernel commandline?

Generally speaking passing any other kernel arguments then those used
to specify the root filesystem and things like "quiet" is not advisable.

Everything should just work without passing any special options and if things
do not work without special options then that is a bug which needs to be fixed.

Regards,

hans

