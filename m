From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <kengyu@canonical.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad-acpi: disable alsa volume mixer
 for SL410/SL510
Date: Thu, 6 Oct 2011 11:50:49 +0800
Message-ID: <CADXHx7b36g1+vo9cjuiq7VnjN3LWiwQtgepHjGU1P74ZsdtwQw@mail.gmail.com>
References: <1300181106-20219-1-git-send-email-keng-yu.lin@canonical.com> <20110316185755.GC7918@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:61101 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753223Ab1JFDva convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Oct 2011 23:51:30 -0400
In-Reply-To: <20110316185755.GC7918@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <mjg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 17, 2011 at 2:57 AM, Henrique de Moraes Holschuh
<hmh@hmh.eng.br> wrote:
> On Tue, 15 Mar 2011, Keng-Yu Lin wrote:
>> The mute key on SL410/SL510 only works when the alsa volume mixer
>> is not enabled. This patch makes the alsa volume mixer disabled
>> on the matched SL410/SL510 EC versions.
>
> I'd like more data on this. =C2=A0Is this some sort of weird interact=
ion with
> userspace, or does the firmware actually changes behaviour when we
> enable the MUTE HKEY event in the event mask?
>

The firmware does not change its behaviour with the key enabled in the =
keymask.
The mute key (and the LED on it) of the two models works good without
thinkpad_acpi loaded. So in the patch I like to exclude the volume
control part for the two models.

>> =C2=A0#define TPACPI_VOL_Q_MUTEONLY =C2=A0 =C2=A0 =C2=A0 =C2=A00x000=
1 =C2=A0/* Mute-only control available */
>> =C2=A0#define TPACPI_VOL_Q_LEVEL =C2=A0 0x0002 =C2=A0/* Volume contr=
ol available */
>> +#define TPACPI_VOL_Q_IGNORE =C2=A00x0003 =C2=A0/* No Volume control=
 available */
>
> Change the comment to /* Blacklist volume control */, please. And nam=
e
> it TPACPI_VOL_Q_BLACKLIST.
>
>> @@ -6921,20 +6924,21 @@ static int __init volume_init(struct ibm_ini=
t_struct *iibm)
>> =C2=A0 =C2=A0 =C2=A0 if (volume_capabilities >=3D TPACPI_VOL_CAP_MAX=
)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>>
>> + =C2=A0 =C2=A0 quirks =3D tpacpi_check_quirks(volume_quirk_table,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(volume_q=
uirk_table));
>> +
>> =C2=A0 =C2=A0 =C2=A0 /*
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0* The ALSA mixer is our primary interface=
=2E
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0* When disabled, don't install the subdri=
ver at all
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> - =C2=A0 =C2=A0 if (!alsa_enable) {
>> + =C2=A0 =C2=A0 if (!alsa_enable || quirks & TPACPI_VOL_Q_IGNORE) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vdbg_printk(TPACPI_=
DBG_INIT | TPACPI_DBG_MIXER,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 "ALSA mixer disabled by parameter, "
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 "not loading volume subdriver...\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 alsa_enable =3D 0; /* re=
flect the quirk status in sysfs */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;
>> =C2=A0 =C2=A0 =C2=A0 }
>>
>> - =C2=A0 =C2=A0 quirks =3D tpacpi_check_quirks(volume_quirk_table,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARRAY_SIZE(volume_q=
uirk_table));
>> -
>> =C2=A0 =C2=A0 =C2=A0 switch (volume_capabilities) {
>> =C2=A0 =C2=A0 =C2=A0 case TPACPI_VOL_CAP_AUTO:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (quirks & TPACPI=
_VOL_Q_MUTEONLY)
>
> Do not overload error messages like that. =C2=A0It will now spill an
> incorrect message when the quirk list blacklists the volume control.
>
> Unfortunately, we're constrained by the unextensible alsa module comm=
and
> line ABI, so something more sensible (implementing "auto") is not
> available.
>
> Instead, please do it like this:
>
> 1. =C2=A0Do not move the quirks test or error message up.
>
> 2. =C2=A0After the quirk check, do this:
>
> if (quirks & TPACPI_VOL_Q_IGNORE) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_MI=
XER,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "ALSA =
mixer blacklisted for this model, not loading
> volume subdriver...\n");
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;
> }
>
> Note that it is a "dbg_printk", and NOT a "vdbg_printk".
>
> I'd much rather have something that allows the user to override the
> blacklisting, though. =C2=A0But it cannot be done through alsa_enable=
=2E =C2=A0Maybe
> you could be persuaded to add support for a "force_volume" parameter?
>
> If you do add support for "force_volume", please make it an unsigned =
int
> (not bool), use 0 for no, and 1 for yes, and leave the other values
> undefined. =C2=A0And add it to the documentation in
> Documentation/laptops/thinkpad-acpi.txt.
>

Thanks for the suggestion. I will be sending a new version of patches.
