Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C01A7259
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104013; cv=none; b=c5EmXGSy8uT8Oa/E+iCjzP06wgJYzfNII7e5AYCrI+9owOaLOPI0okL6C9Ap3MeycM3kbby6DdEWSiBiSuD0fOx6kFvDPqbUS5OIZImixu6NxOmNcYRS4mxYsfhaOgfabz80+HXT3Pog9yq0sG7Npk5oCq6IFBJqYRSgY7qwvuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104013; c=relaxed/simple;
	bh=foWy3N3npQUGPSA9PvOvib0+VD9PxwrtceYNEQVVXv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q61/g1j0yvRmHiduXhrBZbli1jwS0/ddlG+pq2rQZl+5XsH7zbqChf7PGjUugP7wjNlwodC8qKCsNVCaTfoTNlC8TlTAGNbWGdMMtsUQ4V3fE/TfXLEZLf9UQJbbPGqXI+yPx0kaRiJ+LWa+i7fAqkOwDZnELVKefMwkVyGJmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=k0FBjOAc; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="k0FBjOAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732103995; x=1732708795; i=w_armin@gmx.de;
	bh=foWy3N3npQUGPSA9PvOvib0+VD9PxwrtceYNEQVVXv8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=k0FBjOAcaSloyLQRKlIJ62PSsAePXhEG9mc/AZHpkaTs95m8CIe0o2UXm96QqjE3
	 +F/ImmOyXJjKJcyFcCIDX0y7CJ70hvqTlLhAuFtwCEFWA8bCDiGHkLUf6JGJoOOVp
	 YFETvOH4YwPpUCfaCsq3jm8nNCS0rz0rUiKkq7pd+drXLsyJkZkpSWQu5Dl9FrmcR
	 uYXPpLLWsC6X5l9EQAczujvkwOnE6Fw3UQiQBaqqzORCQANhHV23I6C//Hhh2x6C9
	 t5HYjYB1VhQimeQvrK8s2zyVlok9I1nm/mEeH/iwhMOr0HpxLMnk5BsQgnmtqIUvg
	 dVy5u1YTO3i3NdbxNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1tzfBq2Edt-010bmA; Wed, 20
 Nov 2024 12:59:55 +0100
Message-ID: <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
Date: Wed, 20 Nov 2024 12:59:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding a new platform driver samsung-galaxybook
To: Joshua Grisham <josh@joshuagrisham.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:SI+/qz9o0sqlvv71nCY4YmUWXGl+ouY/pN/UE4js8scFIWTQ8PH
 umPxrynXIZqL2isaFpmkw/Ff9e00Y0XiXVLbasnyaTiMZN4uAVM3LWy0f4QzsfmBTFmD+IM
 Qk5oTOgoxAwEMb5ZwwqLusK2MpEoG54eGRThj+jLQPbJymJ1TzsGgYkoXIbeEJ1IezWGVcr
 l9TbE2cJzKPKCV2cPuiPg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Mi2a+lEic4U=;fqx2oDx5nlySFvL3RSRd62Y02a+
 OIkTzOVxjtStinhh2ZmMghchOhfGuNUzXbdmLbRusfEx+EPyG2rfO9HkovmB0+i95eGz4+v6g
 UWcfWksOVu4j1KP6obRp8mAQFgjgpaDiS1ETy+WPvsJ88o0NLd5qKcKD+3IZsKHbFXq95qbv9
 RFMdvAPAuV9gtAm8yiS7TlcyOjZWn9JQQhiYmMuNO46S5M8aD5VGXPB3gCkSiFjT+O7J+Yy6k
 ZumreVOJBF5eBpezXQ2FMWJhn5YUty9DcyJbrPdji88YIR5HQiXZcJQvdLokeSoOT80nzYC2C
 UCVS0l91mfWmfYSoHc1HnURv3plpcnV04Vsn4Itqvbyww77n3ZkrlMk5bS7FzT5j7rD7douXt
 jHTrXkoqJVytu6lNxIbDewKsXkArrYm6KStcIpAZvKFkzkoTEzvxWUZ7tL4HEaTDpI3nOX6eD
 IJdiYosbHGiBRPooAFRC8KEe0HzjqeXBkqhjgGR8sTR6ejKCdECiO/TkZNORmxuUEaiKJYYKA
 ePW1uBfv8RY4b+pkDMjgMHGsEV8SBFT782h4ralkrCaqoOioMlljOp3Dke5cWbi1KPIZm3vB4
 ujnkn8TAZC+E6lNgUGspx3wE+OE2I50hPgMOV7KJmM6sk7xW5mtXnqHsrf7/rFLnc3DaFSflb
 n2LHEHkna6TjqrE2Y6kWLfpGja4jYCHTGMjnCQdXNIguOidHaFVXJN1tLkbZVCB392Hatha9X
 mT6kYMoFXcFYzEku6l0C30NCInoS3HxENMmbItGtwewt5Q5sxhCPnG9bEWxGweihaYuMHRTag
 7EwBuWrtH9tAHCmfcZv4X29J+otZ+qbaF0gHpJpZTcIiCtbWAtpiEUo/r2PiyzZKqMAzeKEh9
 9vu7QFqYGelpFEqDAhhYPOj8rak2o4bolN1J9QSKvm2PUwCarsfkgpnUW

Am 18.11.24 um 14:51 schrieb Joshua Grisham:

> Hello! I have created a platform driver for Samsung Galaxy Book series
> notebooks which has now gone through several iterations and
> contributions from several other community members. Based on stars and
> community involvement I would guess that the usage of the driver is
> more than at least 100 users (if not more?) across multiple different
> generations of devices and many different distributions, so hopefully
> we have ironed out a lot of issues by now!

Nice work! Improving the hardware support for notebooks under linux is always
welcomed.

> The existing driver samsung-laptop is of course somewhat
> famous/notorious for how it works, but on newer devices (primarily
> Samsung Galaxy Book series devices but does include a few others),
> Samsung is using a new ACPI device called "SCAI" which is what this
> new driver is built on, and the functionality is totally different.
> There are only a few ACPI methods on this device that then actually
> control a lot of different features; the "magic" is in building
> various payloads to steer all of these different functionalities even
> though it is often using the same ACPI method.
>
> It is my opinion that, as we now have achieved some level of stability
> with this driver, it would be good to try and get it added to mainline
> as having it in mainline will add a lot of benefits (even larger
> number of users who will gain benefit from this, better quality and
> standardization with involvement from maintainers and the larger
> community, etc).

I support your initiative to upstream your driver. Having such a piece of software
upstream helps everyone.

> I have myself tried to adhere to many of the existing patterns that
> exist within other pdx86 drivers and the community has helped to find
> and ensure (and in some cases even directly contributed to that)
> various features are using standard interfaces such as with the
> battery extension, platform profile, etc, in a way that seems to be
> unified with existing platform drivers as well.
>
> The driver code is currently located here:
> https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/samsung-galaxybook.c
>
> As there are a few variants of what features are supported on
> different devices (even devices with the same ACPI device id) then one
> of the key principles that I have tried to now follow with the driver
> is that each feature tries to check that it works or not (receives an
> error code in the payload from the ACPI method) before "enabling" the
> feature (creating a sysfs attribute or registering a new device etc)
> when the module is probed and loaded.

Sounds like a good strategy to me, being able to automatically detect which features are
available is usually better than having a very long quirk list.

> Instead of just sending the code as-is in a new patch then I thought
> to ask you all as the PDX86 maintainers if there is anything glaring
> that you would prefer should be changed or re-designed before we try
> to push this in as a patch and add this driver to the kernel?

After looking at the driver, i would advise you to drop the acpi_driver stuff and instead
implement the whole driver as a platform_driver. Does the kernel already create a suitable
platform device with the name "SAM04[number]:[number]"?

> You can see more background and what features are supported in the
> README file here:
> https://github.com/joshuagrisham/samsung-galaxybook-extras/blob/main/README.md
>
> A few potentially "controversial" bits that I can highlight already now:
>
> 1. various failure messages or "unsupported features" write a warning
> that directs users to create an issue in my own Github repository
> instead of in Bugzilla -- maybe this is ok at the beginning but assume
> it would be better to just remove some of this info from the message
> and/or direct users to create a new bug in Bugzilla under the right
> component there ?

As a general rule driver should be quiet if everything works, so unsupported features should not
result in a warning message. The other error messages should just contain the message without any
bugzilla/github links since stable kernel users might want to use the bugtrackers of their distro first.

>
> 2. some features where Kernel version are checked for handling some
> things different for older versions of the kernel, but all of this I
> would take away before submitting a patch

Yes, please remove any kernel version checks.

Thanks,
Armin Wolf

> 3. usage of the i8042 filter and ACPI hotkey notifications to handle a
> few of the hotkey actions within the driver itself instead of just
> emitting input events and allow userspace to handle the actions
> (namely cycling through keyboard backlight levels, performance modes,
> etc)
>
> This last item (executing hotkey actions in kernel space) is not
> totally unprecedented either, as I have seen there seems to exist
> similar i8042 filters driving hotkey actions in msi-laptop,
> toshiba_acpi, and dell-laptop and ACPI notifications from hotkeys
> driving actions in several x86 platform drivers as well (dell-laptop,
> acer-wmi, asus-laptop, ideapad-laptop, etc; this is an even more
> common pattern than using an i8042 filter, it seems).
>
> The problem with just emitting the "right" input events and relying on
> the userspace to handle this stuff in the right way is that 1) there
> are not really keycodes that exist for exactly the keys we want here
> (even though "Keyboard Backlight Cycle" and some kind of "Performance
> Mode" hotkeys are very common on laptops today) and 2) functionality
> for how to handle these kind of events do not really support these
> use-cases either (an example if you read through the discussion here:
> https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/issues/41 and
> especially several of the comments from Benjamin Berg, that
> implementation of "Keyboard Backlight Toggle" is just on vs off and
> does not cycle, and there should either be special handling of this or
> a new key is created specifically for this purpose... this was from
> 5-6 years ago and the state of this has not changed since then from
> what I can tell). It is because of these same problems that I assume
> the existing PDX86 drivers do in fact implement some of this hotkey
> action logic in the kernel space, in a similar way that I have tried
> to do in this new samsung-galaxybook driver. I am not sure the
> appetite for having even more of this pattern exist and/or if there
> are any details of the implementation that you all would wish that I
> should tweak a bit? I am very open to any kind of feedback on this.
>
> Any other discussion or questions are of course welcome! Otherwise
> and/or once things are to a point that is looking good then I can
> create and submit a patch for this new driver.
>
> Thank you!
>
> Best regards,
> Joshua Grisham
>
