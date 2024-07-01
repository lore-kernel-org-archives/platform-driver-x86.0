Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D85EEB5
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jul 2024 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719849670; cv=none; b=GcI/3kKQrvu9dtka0qk+MyGIMJbGx/cv4DbsU5z7q1UKI+cOqikaBF+twdLwb+XQmo6Bt8qmmyGAuv7i7jMJwrCULZv8Fj0Q/Tnz/KiAbQQyHgtK3kX5iWZzMz3SugBaEvQyyf/T7BZN7uqCqWzH+XVSLAahp5R45mIWyZ98p3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719849670; c=relaxed/simple;
	bh=S+qFvWjuDi2hiRL0B3pixwCmJFvfijJeZroNlcGUZzE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=NG8f5TfVstMjH0UIjfyHDtLp4TFYu0lkqMMdE98BzKry7hrwEiWcXicNSqWu/7Dl6wq4ZtPuwhEqwMW2c2SbOP3OwosEEpc3CyTItoRqDo0okcRdEMuUhUcTTY5wh3131nNmpSLrtvlUz/3qPw93DsPUVkZrfbxdpwlA0CJYCMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lFBJWyKz; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lFBJWyKz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1719849659; x=1720454459; i=w_armin@gmx.de;
	bh=S+qFvWjuDi2hiRL0B3pixwCmJFvfijJeZroNlcGUZzE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lFBJWyKzAKbSPx6D4hQzDo2ZTMvtwSeQMmqVC1bFYgqQrNzHVRYKqkdrJnL8uV+W
	 3nj2rnBS3tlQOhWRQcsXCX20tYjk4Hv4t+y/JI1E0QYHjgBkhI5p5O3w5odqUMbTo
	 DdA0lbvmKyPuxGtaLRAqvoOBJnSJRxA5XW8so3R7x5bQKpGZbBAbCH1H+rnNm5tPp
	 rmGszXjvIsGBIbQci5kYz4Zn+OXiBJxEztUs1GNUeAyX6wHsaHP3KCHq4ENBeBOSK
	 rHm0VPozP01KulsU4tEYRspF6+1t5Be9ZbDGv90KDI185UTYfGq2UDUg3w/FFuqaL
	 jihhH3DgeQNBYHE+jA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZCbB-1stKrS0cBl-00Lzmx; Mon, 01
 Jul 2024 18:00:59 +0200
Message-ID: <7b2d2f5d-a1b8-403b-a9eb-b05fa074cfee@gmx.de>
Date: Mon, 1 Jul 2024 18:00:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv7] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
From: Armin Wolf <W_Armin@gmx.de>
To: Alexis Belmonte <alexbelm48@gmail.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com
Cc: platform-driver-x86@vger.kernel.org
References: <ZoLEnl9y99fff4xp@alexis-pc>
 <7f058c69-8a3c-479d-bebf-9878a5d64f06@gmx.de>
Content-Language: en-US
In-Reply-To: <7f058c69-8a3c-479d-bebf-9878a5d64f06@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JZQvYw4H6RGFTG3b2pqT2Zo2c870/2YVe/GkMr5FimIem0BiZC2
 FpDUszosFjoKpeAR9pRwf+TROIFO/mgZHZ3DtsAXAWUlrTd9tKpIEDzM98t7l/QmaYFEnac
 7KvEJ9CNObTHN/WlIfLNLXP7EpCpn7DtkkfMWPePK19u3iKfY8S+2m7eRsIeVSAe8Nptgtl
 sdbxNvw8yy7eakWJta++A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Poe/3E0Z5Pc=;EuZUoxqyNy3ukwpv//0ywjCi2Qg
 CamEamOohK24rcAr+yIx8LoAF5xQtuY+fqd1P28KEJxvzHle4Hm7mJVUeLDLl3/z6UqnND1/+
 hF14YCEWCK/XAlbduvtOgdGUS7U+Cm/0ru2TwycYqbxASbnQ+07qaoT6BIW0TRATTygBDj1E4
 vjo1WkVYHaWnCLVZFtIy5DRvgneIiaHm2+M5QQ7x01LJQ1JsHunYmQseZR177O9qjDmTTldum
 ns4qPwdlA4PrXm7OTj70mYBPK1+9gb7LFr8iDD9IKORt4Q4yfIsK5w0EMLvUj6vYEIkEZkJr2
 WfD0glEIV0MfS6S4fc1syEyMV4VVvJJriCbruLt9WWVhkQ7z8uzti21wM3Nl3raMUpTziU9cb
 AqmmY9/kx04ym2I3otz0SEUxoLQAFEDlMmNdnMwAb4zlIhCadGzxA9ywNAZmwlDi56T+Cpq+p
 wXYKvf3aEcOwX8BNOMlwVcuJsrX3KgLkzSVNu8+9uoRnpsNwxIHGXF/J7zQd8CiDTw07kNSy4
 nlwPQPNKnqt8g9FikH+Y3shCMUZkngQs9DpMXCvdH8Kh4ALTocQZeFwVP2cdU2iFSW834joGn
 KIzNPZ++mgxf3Km9UmJPDmX3jnvjIwRfeZOJlViVCHGtsOdjIwh8FJU+cjqMK/SqIahBpgRzL
 AX8HMEgg9MYxQiCMoPi5vlbG2xx9LqXjrwSaDjsmSW0QakwTBVP5ZT20M88ZnthFx0xCTYsT9
 dFkMKsqziBctwu27TDAqoJ2kBzVNXsvtB4JRrQ2cpuc9ypfcmFKb3ydlM9tXQDka8aBR34kOq
 JccCTMIpzFeRppjd+bDQs9P8j/sHQKa6J7awRfBpyQy1U=

Am 01.07.24 um 17:56 schrieb Armin Wolf:

> Am 01.07.24 um 17:00 schrieb Alexis Belmonte:
>
>> Fix a platform profile option switch/getter bug on some Omen and Victus
>> laptops dismissing userspace choice when selecting performance mode in
>> inadequate conditions (e.g. by being disconnected from the AC power
>> plug)
>> by
>>
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 hooking an ACPI notify handler through the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 omen_register_powersource_notifier=
_handler method that listens
>> to AC
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power source changes (plugging in/=
out the AC power plug)
>>
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 keeping an intermediate active_platform_prof=
ile variable that is
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set when userspace changes the pla=
tform profile setting
>>
>> =C2=A0=C2=A0=C2=A0 -=C2=A0 restoring the selected platform profile kept=
 in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 active_platform_profile when AC po=
wer is plugged back into the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 laptop, unless if the user decided=
 to alter the platform profile
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mid-way
>>
>> This ensures that the driver follows the principles defined in the
>> Platform Profile Selection page of the Kernel documentation on those
>> kind
>> of laptops; which is to not "(...) let userspace know about any
>> sub-optimal conditions which are impeding reaching the requested
>> performance level".
>>
>> Since the Omen and Victus laptops share the same embedded controller
>> system, the fix is applicable to both categories of laptops.
>>
>> This patch also provides improvements to how the driver sets/gets the
>> platform profile through the embedded controller, by introducing
>> intermediary functions to leverage code from
>> platform_profile_omen_set and
>> callers.
>>
>> Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
>> ---
>> V1 -> V2: - Use register_acpi_notifier and unregister_acpi_notifier
>> instead of
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 hooking straight through ACPI node \\_SB.ADP1
>> V2 -> V3: - Rely on power_supply_is_system_supplied() instead of an
>> EC-specific
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 field to determine if the laptop is plugged in
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Refactor=
 omen_powersource_notify_handler to
>> omen_powersource_event
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Refactor=
 omen_powersource_register_notifier_handler to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 omen_register_powersource_event_handler
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Use a mu=
tex to protect the active_platform_profile
>> variable from
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 being altered while the handler is executed
>> V3 -> V4: - Remove the unnecessary enum declaration remains from the
>> initial
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 implementation
>> V4 -> V5: - Drop unnecessary modifications from the patch
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Call pla=
tform_profile_omen_get in
>> platform_profile_victus_get to
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 avoid code duplication
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Give-up =
module initialization if we fail to register the
>> ACPI
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 notifier handler
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fix code=
=20style issues reported by checkpatch.pl --strict
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Add inte=
rmediary/helper platform_profile_omen_set_ec and
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 platform_profile_victus_set_ec functions to leverage
>> code from
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 platform_profile_omen_set and callers, thus simplifying
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 omen_powersource_event
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Fix dead=
-lock when restoring active_platform_profile
>> when the AC
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 power is plugged back into the laptop
>> V5 -> V6: - Drop unnecessary modifications from the patch
>> V6 -> V7: - Drop EC platform profile readback after set
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Lock the=
 active_platform_profile mutex unconditionally
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Drop the=
 usage of ACPI_FAILURE in favor of a simpler
>> error check
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 when registering/unregistering the ACPI notifier
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - Initiali=
ze active_platform_profile in thermal_profile_setup
>> ---
>> =C2=A0 drivers/platform/x86/hp/hp-wmi.c | 211 +++++++++++++++++++++++++=
=2B+++--
>> =C2=A0 1 file changed, 200 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/platform/x86/hp/hp-wmi.c
>> b/drivers/platform/x86/hp/hp-wmi.c
>> index 5fa553023842..6ffc9d7ad8c1 100644
>> --- a/drivers/platform/x86/hp/hp-wmi.c
>> +++ b/drivers/platform/x86/hp/hp-wmi.c
>> @@ -24,6 +24,7 @@
>> =C2=A0 #include <linux/platform_profile.h>
>> =C2=A0 #include <linux/hwmon.h>
>> =C2=A0 #include <linux/acpi.h>
>> +#include <linux/power_supply.h>

I nearly forgot: Please add "depends on POWER_SUPPLY" to the kconfig entry=
 of HP_WMI
in drivers/platform/x86/hp/Kconfig.

Thanks,
Armin Wolf

>> =C2=A0 #include <linux/rfkill.h>
>> =C2=A0 #include <linux/string.h>
>> =C2=A0 #include <linux/dmi.h>
>> @@ -42,6 +43,8 @@
>> MODULE_ALIAS("wmi:5FB7F034-2C63-45E9-BE91-3D44E2C707E4");
>> =C2=A0 #define HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET 0x63
>> =C2=A0 #define HP_OMEN_EC_THERMAL_PROFILE_OFFSET 0x95
>>
>> +#define ACPI_AC_CLASS "ac_adapter"
>> +
>> =C2=A0 #define zero_if_sup(tmp) (zero_insize_support?0:sizeof(tmp)) // =
use
>> when zero insize is required
>>
>> =C2=A0 /* DMI board names of devices that should use the omen specific
>> path for
>> @@ -259,10 +262,18 @@ static const struct key_entry hp_wmi_keymap[] =3D=
 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { KE_END, 0 }
>> =C2=A0 };
>>
>> +/*
>> + * Mutex for the active_platform_profile variable,
>> + * see omen_powersource_event.
>> + */
>> +DEFINE_MUTEX(active_platform_profile_lock);
>> +
>> =C2=A0 static struct input_dev *hp_wmi_input_dev;
>> =C2=A0 static struct input_dev *camera_shutter_input_dev;
>> =C2=A0 static struct platform_device *hp_wmi_platform_dev;
>> =C2=A0 static struct platform_profile_handler platform_profile_handler;
>> +static struct notifier_block platform_power_source_nb;
>> +static enum platform_profile_option active_platform_profile;
>> =C2=A0 static bool platform_profile_support;
>> =C2=A0 static bool zero_insize_support;
>>
>> @@ -1194,8 +1205,7 @@ static int __init hp_wmi_rfkill2_setup(struct
>> platform_device *device)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> =C2=A0 }
>>
>> -static int platform_profile_omen_get(struct platform_profile_handler
>> *pprof,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option *profile)
>> +static int platform_profile_omen_get_ec(enum platform_profile_option
>> *profile)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tp;
>>
>> @@ -1223,6 +1233,30 @@ static int platform_profile_omen_get(struct
>> platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> +static int platform_profile_omen_get(struct platform_profile_handler
>> *pprof,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option *profile)
>> +{
>> +=C2=A0=C2=A0=C2=A0 enum platform_profile_option selected_platform_prof=
ile;
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * We directly return the stored platform prof=
ile, as the embedded
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * controller will not accept switching to the=
 performance
>> option when
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the conditions are not met (e.g. the laptop=
 is not plugged in).
>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If we directly return what the EC reports, =
the platform
>> profile will
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * immediately "switch back" to normal mode, w=
hich is against the
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * expected behaviour from a userspace point o=
f view, as
>> described in
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * the Platform Profile Section page of the ke=
rnel documentation.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 *
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * See also omen_powersource_event.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&active_platform_profile_lock);
>> +=C2=A0=C2=A0=C2=A0 selected_platform_profile =3D active_platform_profi=
le;
>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return selected_platform_profile;
>> +}
>> +
>> =C2=A0 static bool has_omen_thermal_profile_ec_timer(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *board_name =3D dmi_get_syste=
m_info(DMI_BOARD_NAME);
>> @@ -1245,8 +1279,7 @@ inline int omen_thermal_profile_ec_timer_set(u8
>> value)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ec_write(HP_OMEN_EC_THERMAL_PROFI=
LE_TIMER_OFFSET, value);
>> =C2=A0 }
>>
>> -static int platform_profile_omen_set(struct platform_profile_handler
>> *pprof,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option profile)
>> +static int platform_profile_omen_set_ec(enum platform_profile_option
>> *profile)
>
> Hi,
>
> there is no reason anymore for profile to be a pointer, please fix this.
>
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, tp, tp_version;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum hp_thermal_profile_omen_flags flags=
 =3D 0;
>> @@ -1256,7 +1289,7 @@ static int platform_profile_omen_set(struct
>> platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tp_version < 0 || tp_version > 1)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSU=
PP;
>>
>> -=C2=A0=C2=A0=C2=A0 switch (profile) {
>> +=C2=A0=C2=A0=C2=A0 switch (*profile) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case PLATFORM_PROFILE_PERFORMANCE:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tp_version =
=3D=3D 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 tp =3D HP_OMEN_V0_THERMAL_PROFILE_PERFORMANCE;
>> @@ -1288,7 +1321,7 @@ static int platform_profile_omen_set(struct
>> platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return err;
>>
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (profile =3D=3D PLATFORM=
_PROFILE_PERFORMANCE)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*profile =3D=3D PLATFOR=
M_PROFILE_PERFORMANCE)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 flags =3D HP_OMEN_EC_FLAGS_NOTIMER |
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HP_OMEN_EC_FLAGS_TURBO;
>>
>> @@ -1300,6 +1333,25 @@ static int platform_profile_omen_set(struct
>> platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> +static int platform_profile_omen_set(struct platform_profile_handler
>> *pprof,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option profile)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 err =3D platform_profile_omen_set_ec(&profile);
>> +=C2=A0=C2=A0=C2=A0 if (err < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platfo=
rm_profile_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 active_platform_profile =3D profile;
>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> =C2=A0 static int thermal_profile_get(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return hp_wmi_read_int(HPWMI_THERMAL_PRO=
FILE_QUERY);
>> @@ -1381,8 +1433,7 @@ static bool is_victus_thermal_profile(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 board_name) >=3D 0;
>> =C2=A0 }
>>
>> -static int platform_profile_victus_get(struct
>> platform_profile_handler *pprof,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option *profile)
>> +static int platform_profile_victus_get_ec(enum
>> platform_profile_option *profile)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tp;
>>
>> @@ -1407,12 +1458,18 @@ static int platform_profile_victus_get(struct
>> platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> -static int platform_profile_victus_set(struct
>> platform_profile_handler *pprof,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platform_profile_=
option profile)
>> +static int platform_profile_victus_get(struct
>> platform_profile_handler *pprof,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platf=
orm_profile_option *profile)
>> +{
>> +=C2=A0=C2=A0=C2=A0 /* Same behaviour as platform_profile_omen_get */
>> +=C2=A0=C2=A0=C2=A0 return platform_profile_omen_get(pprof, profile);
>> +}
>> +
>> +static int platform_profile_victus_set_ec(enum
>> platform_profile_option *profile)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, tp;
>>
>> -=C2=A0=C2=A0=C2=A0 switch (profile) {
>> +=C2=A0=C2=A0=C2=A0 switch (*profile) {
>
> Same as above.
>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case PLATFORM_PROFILE_PERFORMANCE:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D HP_VICTUS=
_THERMAL_PROFILE_PERFORMANCE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> @@ -1433,10 +1490,124 @@ static int
>> platform_profile_victus_set(struct platform_profile_handler *pprof,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> +static int platform_profile_victus_set(struct
>> platform_profile_handler *pprof,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum platf=
orm_profile_option profile)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 err =3D platform_profile_victus_set_ec(&profile);
>> +=C2=A0=C2=A0=C2=A0 if (err < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platfo=
rm_profile_lock);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 active_platform_profile =3D profile;
>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static int omen_powersource_event(struct notifier_block *nb,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long value,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 void *data)
>> +{
>> +=C2=A0=C2=A0=C2=A0 struct acpi_bus_event *event_entry =3D data;
>> +=C2=A0=C2=A0=C2=A0 enum platform_profile_option actual_profile;
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (strcmp(event_entry->device_class, ACPI_AC_CLASS=
) !=3D 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>> +
>> +=C2=A0=C2=A0=C2=A0 pr_debug("Received power source device event\n");
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_lock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_om=
en_get_ec(&actual_profile);
>> +=C2=A0=C2=A0=C2=A0 } else if (is_victus_thermal_profile()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_vi=
ctus_get_ec(&actual_profile);
>> +=C2=A0=C2=A0=C2=A0 }
>
> If neither is_omen_thermal_profile() nor is_victus_thermal_profile()
> is true,
> then err is uninitialized here.
>
> Please return without an error if both conditions are not true.
>
>> +
>> +=C2=A0=C2=A0=C2=A0 if (err < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Failed to read cur=
rent platform profile (%d)\n", err);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Although we failed =
to get the current platform profile, we
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * still want the othe=
r event consumers to process it.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * If we're back on AC and that the user-chose=
n power profile is
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * different from what the EC reports, we rest=
ore the user-chosen
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * one.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 if (power_supply_is_system_supplied() >=3D 0 ||
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 active_platform_profile !=
=3D actual_profile) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platfo=
rm_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_debug("EC reports same p=
latform profile, no platform
>> profile update required\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_om=
en_set_ec(&active_platform_profile);
>> +=C2=A0=C2=A0=C2=A0 } else if (is_victus_thermal_profile()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_vi=
ctus_set_ec(&active_platform_profile);
>> +=C2=A0=C2=A0=C2=A0 }
>
> Same problem as above, please set err to zero if both conditions are
> not true.
>
>> +
>> +=C2=A0=C2=A0=C2=A0 if (err < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platfo=
rm_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Failed to restore =
platform profile (%d)\n", err);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NOTIFY_DONE;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 mutex_unlock(&active_platform_profile_lock);
>> +
>> +=C2=A0=C2=A0=C2=A0 return NOTIFY_OK;
>> +}
>> +
>> +static int omen_register_powersource_event_handler(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile())
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_om=
en_get_ec(&active_platform_profile);
>> +=C2=A0=C2=A0=C2=A0 else if (is_victus_thermal_profile())
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D platform_profile_vi=
ctus_get_ec(&active_platform_profile);
>
> I will say it again: active_platform_profile has to be initialized
> _before_ thermal_profile_setup()
> calls platform_profile_register().
>
> This is the wrong place to initialize active_platform_profile, its too
> late. Please drop this.
>
>> +
>> +=C2=A0=C2=A0=C2=A0 platform_power_source_nb.notifier_call =3D omen_pow=
ersource_event;
>> +=C2=A0=C2=A0=C2=A0 err =3D register_acpi_notifier(&platform_power_sour=
ce_nb);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (err < 0) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_warn("Failed to install =
ACPI power source notify
>> handler\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0;
>> +}
>> +
>> +static void omen_unregister_powersource_event_handler(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int err;
>> +
>> +=C2=A0=C2=A0=C2=A0 err =3D unregister_acpi_notifier(&platform_power_so=
urce_nb);
>> +
>> +=C2=A0=C2=A0=C2=A0 if (err < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("Failed to remove AC=
PI power source notify handler\n");
>> +}
>> +
>> =C2=A0 static int thermal_profile_setup(void)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int err, tp;
>>
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile() || is_victus_thermal_=
profile())
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 active_platform_profile =3D=
 PLATFORM_PROFILE_BALANCED;
>
> With "initializing active_platform_profile", i meant to actually read
> the current value from the EC.
>
> I think you can replace the calls of omen_thermal_profile_get() inside
> thermal_profile_setup()
> with platform_profile_omen_get_ec()/platform_profile_victus_get_ec()
> and use them to initialize
> active_platform_profile.
>
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile()) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tp =3D omen_ther=
mal_profile_get();
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (tp < 0)
>> @@ -1534,6 +1705,15 @@ static int __init hp_wmi_bios_setup(struct
>> platform_device *device)
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 thermal_profile_setup();
>>
>> +=C2=A0=C2=A0=C2=A0 /*
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Query the platform profile once to know whi=
ch last power profile
>> +=C2=A0=C2=A0=C2=A0=C2=A0 * was set.
>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
>> +=C2=A0=C2=A0=C2=A0 err =3D
>> platform_profile_handler.profile_get(&platform_profile_handler,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 &active_platform_profile);
>
> Again, this is too late, the platform profile is already registered.
> Please drop.
>
>> +=C2=A0=C2=A0=C2=A0 if (err < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>>
>> @@ -1758,6 +1938,12 @@ static int __init hp_wmi_init(void)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 goto err_unregister_device;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile() || is_victus_thermal_=
profile()) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 err =3D omen_register_power=
source_event_handler();
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 got=
o err_unregister_device;
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>
>> =C2=A0 err_unregister_device:
>> @@ -1772,6 +1958,9 @@ module_init(hp_wmi_init);
>>
>> =C2=A0 static void __exit hp_wmi_exit(void)
>> =C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 if (is_omen_thermal_profile() || is_victus_thermal_=
profile())
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 omen_unregister_powersource=
_event_handler();
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (wmi_has_guid(HPWMI_EVENT_GUID))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hp_wmi_input_des=
troy();
>>
>
