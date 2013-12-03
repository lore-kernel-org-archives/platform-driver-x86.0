From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Tue, 3 Dec 2013 07:40:50 +0000
Message-ID: <20131203074050.GA323@srcf.ucam.org>
References: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
 <20131203070746.GA32248@srcf.ucam.org>
 <CAMz9Wg-hQx17hBN=RUrrrwR+LfSwgq=XTzLihK4k0KeEn=BN2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:52814 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751145Ab3LCHkx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 3 Dec 2013 02:40:53 -0500
Content-Disposition: inline
In-Reply-To: <CAMz9Wg-hQx17hBN=RUrrrwR+LfSwgq=XTzLihK4k0KeEn=BN2Q@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Dec 03, 2013 at 03:31:45PM +0800, AceLan Kao wrote:
> Hi Matthew,
> 
> Sorry, I don't understand what you mean.
> 
> Let me explain it again.
> The BIOS engineer refuse to remove the ACPI functions(_BCM) in BIOS code,
> so we'll have acpi_video0 interface be created under
> /sys/class/backlight/ and that interface doesn't work.
> This patch is equal to add this kernel command line "acpi_backlight=vendor"
> So that, there will be no acpi_video0 be create, and we will use
> intel_backlight interface instead.

Right. This isn't a Dell-specific problem. Windows 8 doesn't use the 
ACPI backlight interface, so any system that calls _OSI("Windows 2012") 
should use the Intel interface instead. It needs to be fixed in general, 
not in the platform drivers.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
