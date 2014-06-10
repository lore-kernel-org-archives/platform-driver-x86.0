From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add no backlight quirk for Asus
 H87I-PLUS Motherboard
Date: Tue, 10 Jun 2014 12:17:43 -0400
Message-ID: <1402417063.670.2.camel@x230>
References: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>
	 <1400146779-5607-2-git-send-email-hdegoede@redhat.com>
	 <1402417012.670.1.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:42121 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835AbaFJQR5 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 10 Jun 2014 12:17:57 -0400
In-Reply-To: <1402417012.670.1.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "hdegoede@redhat.com" <hdegoede@redhat.com>
Cc: "karel.macha@karlitos.net" <karel.macha@karlitos.net>, "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "corentin.chary@gmail.com" <corentin.chary@gmail.com>

On Tue, 2014-06-10 at 16:16 +0000, Matthew Garrett wrote:
> On Thu, 2014-05-15 at 11:39 +0200, Hans de Goede wrote:
> > https://bugzilla.redhat.com/show_bug.cgi?id=1097436
> 
> I'm not especially keen on this - if this seems like a general problem,
> adding boards piecemeal to a DMI table will never solve it for most
> people. What does performing the backlight calls actually do?

Or, alternatively, check the DMI chassis type and just skip desktop
boards?

-- 
Matthew Garrett <matthew.garrett@nebula.com>
