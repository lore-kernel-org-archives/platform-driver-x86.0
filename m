From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add no backlight quirk for Asus H87I-PLUS
 Motherboard
Date: Thu, 12 Jun 2014 09:48:23 +0200
Message-ID: <53995B47.7080705@redhat.com>
References: <1400146779-5607-1-git-send-email-hdegoede@redhat.com>	 <1400146779-5607-2-git-send-email-hdegoede@redhat.com>	 <1402417012.670.1.camel@x230> <5398605F.3000009@redhat.com> <1402502627.9762.0.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:11012 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932194AbaFLHsk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Jun 2014 03:48:40 -0400
In-Reply-To: <1402502627.9762.0.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "karel.macha@karlitos.net" <karel.macha@karlitos.net>, "acpi4asus-user@lists.sourceforge.net" <acpi4asus-user@lists.sourceforge.net>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "corentin.chary@gmail.com" <corentin.chary@gmail.com>

Hi,

On 06/11/2014 06:03 PM, Matthew Garrett wrote:
> On Wed, 2014-06-11 at 15:57 +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 06/10/2014 06:16 PM, Matthew Garrett wrote:
>>> On Thu, 2014-05-15 at 11:39 +0200, Hans de Goede wrote:
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1097436
>>>
>>> I'm not especially keen on this - if this seems like a general problem,
>>> adding boards piecemeal to a DMI table will never solve it for most
>>> people. What does performing the backlight calls actually do?
>>
>> The user has reported no adverse effects from the backlight control being
>> present, other then gnome3 showing a brightness control in its system
>> menu which is undesirable on a desktop machine.
>
> Sorry, yeah, I wasn't clear. What results do we get from the calls? If
> they just return 0s then we should alter the driver to skip backlight
> registration in that case.

The acpi_video0 backlight interface reports a max_backlight of 100, so it
appears to be functional, unlike the asus-wmi interface which is present but
appears non functional.

Regards,

Hans
