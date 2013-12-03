From: AceLan Kao <acelan.kao@canonical.com>
Subject: Re: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Tue, 3 Dec 2013 15:31:45 +0800
Message-ID: <CAMz9Wg-hQx17hBN=RUrrrwR+LfSwgq=XTzLihK4k0KeEn=BN2Q@mail.gmail.com>
References: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
	<20131203070746.GA32248@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ve0-f169.google.com ([209.85.128.169]:52314 "EHLO
	mail-ve0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751871Ab3LCHbq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Dec 2013 02:31:46 -0500
Received: by mail-ve0-f169.google.com with SMTP id c14so10043131vea.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Dec 2013 23:31:45 -0800 (PST)
In-Reply-To: <20131203070746.GA32248@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Matthew,

Sorry, I don't understand what you mean.

Let me explain it again.
The BIOS engineer refuse to remove the ACPI functions(_BCM) in BIOS code,
so we'll have acpi_video0 interface be created under
/sys/class/backlight/ and that interface doesn't work.
This patch is equal to add this kernel command line "acpi_backlight=vendor"
So that, there will be no acpi_video0 be create, and we will use
intel_backlight interface instead.

Best regards,
AceLan Kao.

2013/12/3 Matthew Garrett <mjg59@srcf.ucam.org>:
> On Tue, Dec 03, 2013 at 02:50:07PM +0800, AceLan Kao wrote:
>> The acpi_video0 interface doesn't not work on Dell Inspiron 3138,
>> so using the vendor brightness interface, instead of the acpi one.
>
> No, this needs to be fixed properly by disabling the ACPI interface on
> Windows 8 systems.
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
