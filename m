From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] Lenovo IdeaPAD ACPI driver
Date: Thu, 12 Aug 2010 13:49:40 +0200
Message-ID: <AANLkTikC3_YgMabbDeJnFi66VvQQHp1CcyKgFUT_ji7h@mail.gmail.com>
References: <1281480758.5887.33.camel@localhost>
	<AANLkTin=Dwbe3gPDGd89Oc25mfOVVvc2_goP77sSVNeo@mail.gmail.com>
	<1281533999.3236.8.camel@localhost>
	<AANLkTinBqq+0rDE8DM0wz-FvUQqzH2Rf0F=YJgqVLHqM@mail.gmail.com>
	<1281606151.12475.57.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:60779 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053Ab0HLLtm convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 Aug 2010 07:49:42 -0400
Received: by fxm13 with SMTP id 13so646253fxm.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Aug 2010 04:49:41 -0700 (PDT)
In-Reply-To: <1281606151.12475.57.camel@localhost>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Thu, Aug 12, 2010 at 11:42 AM, David Woodhouse <dwmw2@infradead.org>=
 wrote:
> On Wed, 2010-08-11 at 15:51 +0200, Corentin Chary wrote:
>> And you should probably make it a platform driver (being the parent =
of
>> acpi, wmi, input, backlight, rfkill, etc..).
>>
>> Is there a lot of thing hidden in ACPI / WMI on these models (like
>> hotkeys, backlight, light sensors) =A0?
>
> I hooked up something (below) to dump the AE or IO WMI blocks each ti=
me
> we get a notification on the VPC2004 device. Although the notificatio=
n
> happens when we press a key, nothing ever changes in either of them.

They is probably something interesting in the u32 event var.
To get wmi events, you need to use wmi_install_notify_handler.

=46or example, the hardware rfkill state may change due to some keypres=
s,
and an event may be sent via acpi or wmi, but if you don't catch it, th=
e rfkill
class won't be updated.

Could you send the output of acpidump ?

> I *did* notice that we're actually getting proper keycodes for the
> hotkeys though, so for now I've lost what little interest I already h=
ad
> in doing anything with WMI. If anyone (Florian?) wants to do more, I'=
d
> be happy to do some testing.

keycodes are sent from the keyboard input device for all specials keys
? (especially Fn+Fx keys) ?

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
