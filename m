From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add no backlight quirk for Asus H87I-PLUS
 Motherboard
Date: Wed, 11 Jun 2014 16:13:00 +0200
Message-ID: <539863EC.8090501@redhat.com>
References: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>	 <1400146779-5607-2-git-send-email-hdegoede@redhat.com>	 <1402417012.670.1.camel@x230> <1402417063.670.2.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42722 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755501AbaFKONT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jun 2014 10:13:19 -0400
In-Reply-To: <1402417063.670.2.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: "karel.macha@karlitos.net" <karel.macha@karlitos.net>, "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "corentin.chary@gmail.com" <corentin.chary@gmail.com>

Hi,

On 06/10/2014 06:17 PM, Matthew Garrett wrote:
> On Tue, 2014-06-10 at 16:16 +0000, Matthew Garrett wrote:
>> On Thu, 2014-05-15 at 11:39 +0200, Hans de Goede wrote:
>>> https://bugzilla.redhat.com/show_bug.cgi?id=1097436
>>
>> I'm not especially keen on this - if this seems like a general problem,
>> adding boards piecemeal to a DMI table will never solve it for most
>> people. What does performing the backlight calls actually do?
> 
> Or, alternatively, check the DMI chassis type and just skip desktop
> boards?

That might work, note that part of the problem is the BIOS exporting
an acpi-video interface. So we would either need to do this check
in the acpi-video driver, or alternatively do it in the asus-wmi driver
and call acpi_video_dmi_promote_vendor() when the check fails.

I'm not 100% sold on adding this check in general, because it assumes
that the chassis type will be reliable, which seems like a long shot,
ie what if an all in one, with a backlight, uses 3 / Desktop as chassis
type ?

Note that once the acpi-video interface is disabled by using e.g.
acpi_backlight=vendor, then the asus-wmi driver will create a backlight
control with a max_brightness of 0, which seems like a bug in the asus-wmi
driver. I did not do a patch for this because I was afraid that not
registering the asus-wmi brightness control when the max_brightness == 0
might cause regressions (e.g. it will also remove the bl_power function,
what if in some cases max_brightness == 0, but we want / need bl_power ?) .

Regards,

Hans
