Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F72647;
	Thu, 26 Dec 2024 16:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735229310; cv=none; b=G7MlxcQn3uHVDf7EiA/AVBSBwOIM6gZqkA4BBDK8GWvYaMnvsahADlKbIrusb4LLkbQaw202OcdOJeVQ0Bj5naz9dldrXtor2qvjZ2fMYCKn9DanFIRXIfX2/9h+6dM5mXTYfeGRwsCiDHYwGh/aEyY6Fqzw1HAHucYv3MiboFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735229310; c=relaxed/simple;
	bh=tbTZDMPPHbKy4KYERWbLt6yjZwM7Jrzj4liy2enA1io=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msO7C34+yylf9k3OP7pFYqiI4pAm/6v5E47+zdG/0NnALKqeeN4i81HipAjwe52u0iHwlDw2PtE3j7hcVCKHn6bTH7w/Muiz/AtNbbErdzuALF252oxomE/ts2pk02vsVntSZsKHgBK/hlym/nEUcv+u3xemev9xtVcMniRJ90Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=joshuagrisham.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3a8f1c97ef1so21835165ab.2;
        Thu, 26 Dec 2024 08:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735229305; x=1735834105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TA1/Ar8ydSa+9gCDaaHBRCvZ/iUA+ufOprlYsP/S4Vg=;
        b=nyPOKWHQ6SlOr8usj8rHxqWMT91YX6CtA8uBmrUw6CyV9+yPeq/tNVno8fzx6VlRuU
         2ymPpxhCl7nUsxERMlAaR9qkzssRAt6njY7PBytNmU0FMV3Q60AO7zckHyww4bkmxvHt
         aH3asaa/2SyP5kKmc8teFYaghXFA/L4hMg7rUF/KvAcQnwUONI4Gl0CVmcLoXpg4t7j3
         wDwjNsMZnUBf5E9PuPglMtAN50o53WcJn7edt+EVCKu0zV10IOBsmjr+oIQI3b3lKrRF
         bGB9ypjtGnwBh3APObgofpzX3BZ5oO7GDbe397XZ82zkaxwVm6ay+uT82GcbXZrEIaHy
         wH/g==
X-Forwarded-Encrypted: i=1; AJvYcCUYnxLuj5jT75hUibwvJ+WKNvxaVAw+nOrDaNaQz8tDH3ZtrD73HQFf59MfFoGY08UFbENauvEco+Eg2fX2JqH6GM9PjA==@vger.kernel.org, AJvYcCVgzBnsxPiChs7CQ2FKH+f2WlSgVxX+RY9SKHTFGnpCbM7iujrcd1+uI5+nVeJ1HL8Bu6NrhuDeCvc=@vger.kernel.org, AJvYcCXjO9AiDFkLeSYbuFLYJadftG7fTd6zTQLhZ+ey86OJrnX1APgnBZM+oyjjFD5yRWGhPIE7uMTURKFbo2uh@vger.kernel.org
X-Gm-Message-State: AOJu0YyvUea+ZoWiHooH/omTkZHFAWvU3pmMJB3UhTF3VSqNkTABQk8X
	7kWPi5Izh3JBsvEyePZNfM9B9RUzuNfMGkjMagm9ya4KYG8LmxSDOyIWKelFENQ=
X-Gm-Gg: ASbGncvbn3tYP60xvwd5jBybBFcFs7pGKXE+t12W6FqI4uixyqS/yQw11wOD3nhBfer
	BHaNXFNZw0HCIybg80yRLtDRZQW6tN9HDw62TzrajiMw37y1ScEJYTKrXwR+SP0rJT8xy3jtDRI
	xCgSroCJ542cmMjlTxUMA02P9H04N+5/+BBYuep/feFpzrgMvvZRdDzv+Xm1jE1/Ed1bfCYoslj
	UUjuFDkyZ0/P2A03Rnz4wgLebAxZs2qTaSluqYyuWawoeeOxY7kmghf/pTKNKPyQhpdz79A3Elf
	BVzbh9CU7mQruUmZidoPNPxwiA==
X-Google-Smtp-Source: AGHT+IGUnnpYWKO6vaQnE+nDmPIgCLsHfI/Sdxl8igwkOWqacwjxlB4EFYHz+tDfVO3/Vo/fNGoKbQ==
X-Received: by 2002:a05:6e02:188d:b0:3a7:e452:db5 with SMTP id e9e14a558f8ab-3c2d4c8314dmr204741575ab.15.1735229305140;
        Thu, 26 Dec 2024 08:08:25 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0decceef7sm40464475ab.24.2024.12.26.08.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 08:08:24 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a8f1c97ef1so21835075ab.2;
        Thu, 26 Dec 2024 08:08:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUQXNkeqSS5QS+DjiMvymOSLRNgNwnlYJgrshO+5wosryrsk6qYWpN2+P9E/4CRqQiPpcNsWpqb2UU=@vger.kernel.org, AJvYcCUdX1gLpTUJ6ZG55XIYsdA+fUWs86nlM7ICNYlGlb8Ep9MewAyi2Ih5/zSs0k/rVTwJUTf5hww2zded4VC6@vger.kernel.org, AJvYcCWR2yQY4/+wUxNWxx2B3cvNfmba6ENQuJ5sDYVjSGp0gF4cWJHD7ZID/6ZwZaZLgWENyadPWlC3b+eOoAzhvl2zpKpq6Q==@vger.kernel.org
X-Received: by 2002:a05:6e02:1c05:b0:3a7:4eee:b7b9 with SMTP id
 e9e14a558f8ab-3c2d2975e44mr162550965ab.13.1735229304720; Thu, 26 Dec 2024
 08:08:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216103855.18457-1-josh@joshuagrisham.com>
 <13184052-baf2-4e7d-b8ef-9ba3f34d475a@t-8ch.de> <66897a27-5f81-46fc-898d-682456d7f37f@redhat.com>
 <CAMF+KeZ3uAWZuuPJcrrvTJS-TgyxkqXOY_w=wNw7eZQiUkV5YA@mail.gmail.com>
 <c2b5e0c8-651f-426e-ae96-13857313997a@t-8ch.de> <a4ad8907-34e3-4785-a62a-a1f41ddd6e1e@gmx.de>
In-Reply-To: <a4ad8907-34e3-4785-a62a-a1f41ddd6e1e@gmx.de>
From: Joshua Grisham <josh@joshuagrisham.com>
Date: Thu, 26 Dec 2024 17:08:13 +0100
X-Gmail-Original-Message-ID: <CAMF+KeYEarSLRyhS1o4AA7-Uy40_v0k2Bebhjzo9yKF=2k0jQQ@mail.gmail.com>
Message-ID: <CAMF+KeYEarSLRyhS1o4AA7-Uy40_v0k2Bebhjzo9yKF=2k0jQQ@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Armin Wolf <W_Armin@gmx.de>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Joshua Grisham <josh@joshuagrisham.com>, Hans de Goede <hdegoede@redhat.com>, 
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Armin,

Den ons 25 dec. 2024 kl 21:23 skrev Armin Wolf <W_Armin@gmx.de>:
>
> Harmonization with other platform driver regarding the firmware attribute names will
> likely not result in any benefits. I am not aware of any utility profiting from such
> a thing.
>

I just posted a v4 of the patch where I have moved the device sysfs
attributes to firmware-attributes as requested by both Thomas and
Hans. With this change, I did try to "harmonize" the names as best as
I could anyway, recognizing that there are several device drivers in
the tree which have actually currently implemented these as device
sysfs attributes instead, but in theory they could be moved over to
use the same firmware attribute instead ? e.g. all of the ones that
have a usb_charge or usb_charging device attribute could be moved to
use this new usb_charging firmware-attribute if it is desired at a
later time?

Here were the examples I could find online for different devices that
drove my rationale for the names that I picked:

1) and maybe easiest to start with: for what I had as
"allow_recording" I thought would be better to change to be a "block"
as per Samsung's own documentation and implementation, but then to
also try and harmonize how it would be interpreted by other tools
including this switch input event, I chose to switch this entire
feature to the name "camera lens cover". Hopefully this is ok! The
only "weird" thing in my opinion is that on this particular device,
there is a side-effect that the microphone is also blocked as well
(which is not obviously indicated by this naming, but not totally hard
to understand, either).

2)  for what I had called "start on lid open", I found the following
vendors with various names for the same kind of feature:
HP: "Power On When Lid is Opened"
Dell/Alienware: "Power On Lid Open"
Huawei: "Auto Power On"
Samsung Galaxy Book: "Startup when Lid is Opened"
Lenovo: "Flip to Start"

So for this, I tweaked my driver's name slightly to try and fit the
middle ground between all of these, and went with the name
power_on_lid_open

3) for what I had called "usb charge":
Lenovo: Always On USB
Asus: USB power delivery in Soft Off state (S5)
Dell: USB PowerShare
Razer: USB Charge Function
Existing drivers for Chrome, LG, and samsung-laptop call it "USB
Charge" (long name "USB Charge in Sleep Mode")
Fujitsu Lifebook: "Anytime USB Charge"
Acer: "Power-off USB Charging"
HP: "USB Charging"
Samsung Galaxy Book series: "USB Charging"

In effort to make this as descriptive as possible and mostly fit all
of these, I went with the name usb_charging

All 3 of these I have added to the ABI-Testing documentation and
removed my local documentation for them.

Anyway I am hoping that all of this makes sense and helps, but please
feel free anyone to say if I got any of this wrong :)

> [...]
>
> Can you send me the acpidump of your machine (with the fan bug)? I can check how the
> ACPI battery handles this case internally.
>

I looked further into this one as well. What I see is that the battery
device itself actually also receives a notification when this happens
(so 3x events are generated for the same thing on this device; a
keypress on the keyboard device, an ACPI notification on their "SCAI"
settings device, and an ACPI notification on the battery device
itself), and based on what I can tell in the code in ACPI core is
already "updating" status based on what is read from _BST from the
battery device. I think then that the "real" problem is that my
device's _BST is not reporting these parts correctly as per
https://uefi.org/specs/ACPI/6.5_A/10_Power_Source_and_Power_Meter_Devices.html#bst-battery-status
and especially in regards to the part about reporting Battery Charge
Limiting state.

So for now I have made it so that this driver will aim that the
notification to the battery device is the one that "matters": the
keyboard event is now filtered away, and I removed any special
handling of the extra ACPI settings device notification (but do send
the notification along as an ACPI netlink event in case anyone really
wants to create their own notification or action from it). I thought
to also try to take this one up with Samsung; though I am skeptical
that they would fix it for existing devices like mine,  maybe it will
help with newer or future devices! In the end it is not too big of a
deal as the device works well, it is only the icon and status that are
not being updated correctly.

> Thanks,
> Armin Wolf
>

There are lots of other adjustments in the v4 of this patch in attempt
to address all of the issues brought up by everyone, so everyone is of
course welcome to take a look and see if I managed to catch everything
or not, and I can adjust from there!

Thanks again!

Best regards,
Joshua
