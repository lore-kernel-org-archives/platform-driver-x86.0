From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Wed, 4 Dec 2013 16:14:15 +0800
Message-ID: <CAMz9Wg_CF1un4i_FKhGkJ4=adB0VxennFDy+zrrMD_8bOYGoXg@mail.gmail.com>
References: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
	<20131203070746.GA32248@srcf.ucam.org>
	<CAMz9Wg-hQx17hBN=RUrrrwR+LfSwgq=XTzLihK4k0KeEn=BN2Q@mail.gmail.com>
	<20131203074050.GA323@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:63154 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754690Ab3LDIOQ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Dec 2013 03:14:16 -0500
Received: by mail-ve0-f169.google.com with SMTP id c14so11962821vea.28
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2013 00:14:15 -0800 (PST)
In-Reply-To: <20131203074050.GA323@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Matthew,

I'm reading this commit
fbc9fe1 ACPI / video: Do not register backlight if win8 and native
interface exists

It does what you say above.
But, the variable use_native_backlight is false by default, and user
has to enable this by adding one kernel parameter
video.use_native_backlight=1
I don't see this do any difference with acpi_backlight=vendor as user
has to add the kernel command line explicitly to get rid of the broken
acpi_video0.

We always encourage OEM BIOS to follow the ACPI spec., if not, we'll
ask them to remove _BCL, _BCM, _BQC functions.
And Dell Inspiron 3138 is the first one that they refuse our request,
so I would like to fix it in the kernel.
I don't know if this kind of case will increase or not, but Windows
doesn't use ACPI is not from Win8, but Win7 or even earlier.
Taking into account that use_native_backlight is false by default,
that commit doesn't fix my issue, and I don't know when is the
suitable time to enable it by default in the future.
So, I think we probably need some quirks to disable acpi_video0 by the
mean while before use_native_backlight is default true.

Best regards,
AceLan Kao.

2013/12/3 Matthew Garrett <mjg59@srcf.ucam.org>:
> On Tue, Dec 03, 2013 at 03:31:45PM +0800, AceLan Kao wrote:
>> Hi Matthew,
>>
>> Sorry, I don't understand what you mean.
>>
>> Let me explain it again.
>> The BIOS engineer refuse to remove the ACPI functions(_BCM) in BIOS code,
>> so we'll have acpi_video0 interface be created under
>> /sys/class/backlight/ and that interface doesn't work.
>> This patch is equal to add this kernel command line "acpi_backlight=vendor"
>> So that, there will be no acpi_video0 be create, and we will use
>> intel_backlight interface instead.
>
> Right. This isn't a Dell-specific problem. Windows 8 doesn't use the
> ACPI backlight interface, so any system that calls _OSI("Windows 2012")
> should use the Intel interface instead. It needs to be fixed in general,
> not in the platform drivers.
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
