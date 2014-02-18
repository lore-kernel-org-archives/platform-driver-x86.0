From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] thinkpad_acpi: Add mappings for F9 - F12 hotkeys on T440s
Date: Tue, 18 Feb 2014 18:11:06 +0100
Message-ID: <5303942A.4070602@redhat.com>
References: <1392726999-30382-1-git-send-email-hdegoede@redhat.com> <1392739256.29766.2.camel@x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:20968 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751355AbaBRRLY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 Feb 2014 12:11:24 -0500
In-Reply-To: <1392739256.29766.2.camel@x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <matthew.garrett@nebula.com>
Cc: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, "btissoir@redhat.com" <btissoir@redhat.com>, "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi,

On 02/18/2014 05:00 PM, Matthew Garrett wrote:
> On Tue, 2014-02-18 at 13:36 +0100, Hans de Goede wrote:
>> /* Extra keys found on the T440(s) */
>> +		KEY_CONFIG, KEY_SEARCH, KEY_SCALE, KEY_COMPUTER,
>
> My recollection is that KEY_SCALE was initially intended for "Toggle
> whether my 640x480 desktop is scaled or letterboxed on my 1280x1024
> display". Is this the most appropriate key?

linux/input.h says:

#define KEY_SCALE		120	/* AL Compiz Scale (Expose) */

And Lenovo describes the purpose of the key as "show all programs"
which is exactly what expose does. With that said I'm open to
suggestions for a better mapping.

Regards,

Hans
