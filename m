From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] dell-wmi: Add quirk for Dell Inspiron 3138
Date: Wed, 4 Dec 2013 11:15:00 +0000
Message-ID: <20131204111500.GA1613@srcf.ucam.org>
References: <1386053407-7972-1-git-send-email-acelan.kao@canonical.com>
 <20131203070746.GA32248@srcf.ucam.org>
 <CAMz9Wg-hQx17hBN=RUrrrwR+LfSwgq=XTzLihK4k0KeEn=BN2Q@mail.gmail.com>
 <20131203074050.GA323@srcf.ucam.org>
 <CAMz9Wg_CF1un4i_FKhGkJ4=adB0VxennFDy+zrrMD_8bOYGoXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:47423 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755557Ab3LDLPD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 4 Dec 2013 06:15:03 -0500
Content-Disposition: inline
In-Reply-To: <CAMz9Wg_CF1un4i_FKhGkJ4=adB0VxennFDy+zrrMD_8bOYGoXg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Wed, Dec 04, 2013 at 04:14:15PM +0800, AceLan Kao wrote:

> It does what you say above.
> But, the variable use_native_backlight is false by default, and user
> has to enable this by adding one kernel parameter
> video.use_native_backlight=1
> I don't see this do any difference with acpi_backlight=vendor as user
> has to add the kernel command line explicitly to get rid of the broken
> acpi_video0.

Right. The default needs to be changed.

> We always encourage OEM BIOS to follow the ACPI spec., if not, we'll
> ask them to remove _BCL, _BCM, _BQC functions.
> And Dell Inspiron 3138 is the first one that they refuse our request,
> so I would like to fix it in the kernel.

The best thing to do is to send a patch that flips the default on 
Windows 8 systems and get it pushed through the drm-next tree in order 
to work out the remaining bugs in the intel backlight driver.

> So, I think we probably need some quirks to disable acpi_video0 by the
> mean while before use_native_backlight is default true.

Sorry, I'm not adding any machine-specific quirks to fix generic 
problems.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
