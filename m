From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [patch 0/8] Samsung Laptop driver patches - resend
Date: Mon, 7 Nov 2011 23:57:58 +0100
Message-ID: <CAHR064jx4jWdLHRaKECEz-1Wauhm1xR+pGNLXsPPn7jYKJ81Uw@mail.gmail.com>
References: <20110920161743.GA32737@kroah.com>
	<CAHR064gzgKtLSNQ-NuoKWW9-Nv_S0myOusQT+-CxVVeyO5fMKA@mail.gmail.com>
	<20111107181209.GB5474@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58689 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751137Ab1KGW6B convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 7 Nov 2011 17:58:01 -0500
In-Reply-To: <20111107181209.GB5474@suse.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Greg KH <gregkh@suse.de>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, greg@kroah.com

On Mon, Nov 7, 2011 at 7:12 PM, Greg KH <gregkh@suse.de> wrote:
> On Sun, Nov 06, 2011 at 11:54:39PM +0100, Corentin Chary wrote:
>> Just got a 90X3A from Intel and I'll try to take a look at samsung-l=
aptop
>> since some features are missing (keyboard backlight for example).
>
> Try adding your device to this driver. =C2=A0Or, watch out, as newer =
Samsung
> devices support backlight control "properly" through acpi, which is
> good, and this driver is not needed by them at all.

I'm speaking about *keyboard* backlight here, not screen backlight
(which is already available using both the acpi driver and the intel
graphic driver). There is also a setting to enable USB power while
sleeping without having to change it in the BIOS, and it's probably
possible to control the sound and wlan led.

>> Do you have any doc on the vendor "interface" (other than just readi=
ng
>> the code :) ) ?
>
> I do not have any documentation for the interface, sorry. =C2=A0The c=
ode
> should be self-explanatory.

Arg... I can understand the code, I can easilly write ACPI and WMI
drivers, but the "SABI" thing will be harder to reverse engineer :).

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
