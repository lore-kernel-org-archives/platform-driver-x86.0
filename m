From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/3] ideapad: Add nodes in sysfs
Date: Thu, 2 Jun 2011 13:22:54 +0200
Message-ID: <BANLkTinEu20oGdX+9LwM7fswzgZaVkuf3yEfip-p9gTkUTzu5g@mail.gmail.com>
References: <1307006553-12667-1-git-send-email-ike.pan@canonical.com>
	<1307006645-12702-1-git-send-email-ike.pan@canonical.com>
	<BANLkTik+-wMXcCgSb8cCWx6wxrT0JgAbpnbGqizCpk+3F6Wx_g@mail.gmail.com>
	<4DE7629D.80205@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:54195 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752534Ab1FBLW4 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2011 07:22:56 -0400
In-Reply-To: <4DE7629D.80205@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, Randy Dunlap <rdunlap@xenotime.net>

On Thu, Jun 2, 2011 at 12:14 PM, Ike Panhc <ike.pan@canonical.com> wrot=
e:
> On 06/02/2011 05:48 PM, Corentin Chary wrote:
>> Hi Ike,
>> Why do you want to add /sys/devices/platform/ideapad/brightness and
>> =C2=A0 =C2=A0 /sys/devices/platform/ideapad/backlight ?
>> Both of these files should be handled by the generic backlight class
>> (using brightness and bl_power).
>
> This is within VPC2004. In DSDT they are different device from generi=
c
> backlight.
>
> and I try bl_power but can not turning off power of whole LCD. No ide=
a
> how screensaver do it, looks like just cut off video signal.

What I wanted to say is that you should use the generic backlight
class (!=3Ddriver) to expose these. You can look at asus-wmi.c to see
how it's done.
Then users will be able to choose the backlight implementation using
acpi_backlight=3Dvendor or acpi_backlight=3Dvideo.

--=20
Corentin Chary
http://xf.iksaif.net
