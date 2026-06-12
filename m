Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBD41E515;
	Fri, 12 Jun 2026 21:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781300828; cv=none; b=QR8LaPjKpBzY/+L3cNzkUBp5mbqvxRdXZbAScG+Iu9sL5FVgElWr2HSqmnPuu9shNS6R4/iWBYzEcUhde3aC96jdKF94ze7RlpXerN31Yy1uOphg6cdpRng666HWXMNLS7GYs+dk9QjaC9pb2/WSyDhMoDavn1gxteOWc8gWtbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781300828; c=relaxed/simple;
	bh=pqkIrrnKChBYFT+LCYRvEfIZe4CRvvDx0Guaes9uc4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bTtjrusAGoOx7rC50XprHBvRgFtjt3SuA6jFj8fF7reHxsyMXEp/jCtgUAQcmACNcxuwOxiIZT8xcJuEIzCLzBR2AzTBjgl8gKGcXTJDNusk1xMY8ONe3gjtVxvFkdyCmCkDQnxCTFzbjqdW+vAUmRnq0g/ajxFl4MyL1dASZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tWOTcMD4; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tWOTcMD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781300814; x=1781905614; i=w_armin@gmx.de;
	bh=EEOzAZFG4okzTsQM3tjESLguB8FEEwLqVTAQI3X2Fow=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tWOTcMD4C9d4EjdvH/Cqn1nolZX0M6t+GQOFf+xH1ODHHMyNDGHuEAYZjw1FgAw5
	 b0NfTpvhGstQMIcHDhwJbLYQh3kzfit3C5jzAKIRp87IZUrmPVxxxXmW6jrINckTW
	 60OG1A/G+09rYETytuwBz8REltnjUOWqt+RJrKLOKpTZ7qEmVH/7ka6RPcMcfv4ip
	 yMylNbAg3LgQLyveBewfAIWrD6v4oS7dpi0A26CEVZ34hw6EBiUsIzRRl+JZYsDDS
	 6MLWDxwPYJOp5J/bV3YtM7WmcmtdlvJWgj7ikjXC8qPwNMcZOfEgoWgTeN+b/YNFN
	 4V6pifDSFgZ3sflcGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MkYbu-1wvtQ01N1S-00aN5S; Fri, 12
 Jun 2026 23:46:54 +0200
Message-ID: <6100b6c3-2bee-48ec-918a-d6bc1862cde7@gmx.de>
Date: Fri, 12 Jun 2026 23:46:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: msi-wmi: Add MSI Claw M-Center keys
To: Derek John Clark <derekjohn.clark@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
 <20260611223920.1679438-3-derekjohn.clark@gmail.com>
 <30e344d9-014f-4bac-895e-52576d2a73f9@gmx.de>
 <CAFqHKTn37uDm6ah-7XLtv-w6UCZKYxk5Tv7tbss-YmgsAYOqLA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAFqHKTn37uDm6ah-7XLtv-w6UCZKYxk5Tv7tbss-YmgsAYOqLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:V1/0UmRlHbtgAyGP3cB8smbJRt+4ZDknpthNz1UhXb9xybZBV3D
 ar4ok4r5G5ie4UT/S90Oc/21+ATIXXZk3Jude6w5aAlh3mqkHmDgvvU03bZ8DJMO3Tu2fiF
 XmeFerkjbraxcJYlJC9NFtK2BSTaEJPst0J1V9yaulHXmYp/n6bL/W7GmDpK2nNUNe96xGi
 B+pRXHWqirHCT/2ULXiiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8SSmE/6E1mk=;5xWtDtwadaLPfZw7pUqPo3tKNdx
 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

Am 12.06.26 um 20:25 schrieb Derek John Clark:
> On Fri, Jun 12, 2026 at 10:54=E2=80=AFAM Armin Wolf <W_Armin@gmx.de> wro=
te:
>>
>> Am 12.06.26 um 00:39 schrieb Derek J. Clark:
>>
>>> MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID f=
or
>>> some of their buttons. When pressed, these cause spam in the kernel. F=
or
>>> the majority of devices these events can be safely ignored as they are
>>> duplicated by the AT Translated Set 2 Keyboard device exposed as an
>>> evdev. For the MSI Claw A8 BZ2EM model's M-Center Menu button (left of
>>> the screen) there is no associated keyboard event, so this event must =
be
>>> exposed. Map this button to the same scancode produced by the AT
>>> Keyboard device on other models. This does cause double F15 events on
>>> the A1M, 7 AI+ A2VM, and 8 AI+ A2VM, but it appears to be harmless in =
my
>>> testing.
>>>
>>> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
>>> ---
>>>    drivers/platform/x86/msi-wmi.c | 22 ++++++++++++++++++++++
>>>    1 file changed, 22 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi=
-wmi.c
>>> index d00ced756581..73a4f0d2dc04 100644
>>> --- a/drivers/platform/x86/msi-wmi.c
>>> +++ b/drivers/platform/x86/msi-wmi.c
>>> @@ -46,6 +46,12 @@ enum msi_scancodes {
>>>        WIND_KEY_WLAN           =3D 0x5f, /* Fn+F11 Wi-Fi toggle */
>>>        WIND_KEY_TURBO,                 /* Fn+F10 turbo mode toggle */
>>>        WIND_KEY_ECO            =3D 0x69, /* Fn+F10 ECO mode toggle */
>>> +     /* MSI Claw keys */
>>> +     CLAW_KEY_VOLUMEDOWN     =3D 0x21,
>>> +     CLAW_KEY_CENTER         =3D 0x29, /* MSI M-Center main menu */
>>> +     CLAW_KEY_QUICK_LONG     =3D 0x2a, /* MSI M-Center quick access l=
ong hold */
>>> +     CLAW_KEY_VOLUMEUP       =3D 0x32,
>>> +     CLAW_KEY_QUICK_SHORT    =3D 0x58, /* MSI M-Center quick access s=
hort press */
>>>    };
>>>    static struct key_entry msi_wmi_keymap[] =3D {
>>>        { KE_KEY, MSI_KEY_BRIGHTNESSUP,         {KEY_BRIGHTNESSUP} },
>>> @@ -69,6 +75,15 @@ static struct key_entry msi_wmi_keymap[] =3D {
>>>        { KE_KEY, WIND_KEY_TURBO,               {KEY_PROG1} },
>>>        { KE_KEY, WIND_KEY_ECO,                 {KEY_PROG2} },
>>>
>>> +     /* These are MSI Claw keys, used for MSI M-Center in Windows */
>>> +     { KE_KEY, CLAW_KEY_CENTER,              {KEY_F15} },
>>> +
>>> +     /* These MSI Claw keys work without WMI. Ignore them to avoid do=
uble keycodes */
>>> +     { KE_IGNORE, CLAW_KEY_QUICK_SHORT },
>>> +     { KE_IGNORE, CLAW_KEY_QUICK_LONG },
>>> +     { KE_IGNORE, CLAW_KEY_VOLUMEUP },
>>> +     { KE_IGNORE, CLAW_KEY_VOLUMEDOWN },
>>> +
>>>        { KE_END, 0 }
>>>    };
>>>
>>> @@ -183,6 +198,13 @@ static void msi_wmi_notify(union acpi_object *obj=
, void *context)
>>>                eventcode =3D obj->integer.value;
>>>                pr_debug("Eventcode: 0x%x\n", eventcode);
>>>                break;
>>> +     case ACPI_TYPE_BUFFER:
>>> +             if (!obj->buffer.length)
>>> +                     return;
>>> +
>>> +             eventcode =3D obj->buffer.pointer[0];
>>> +             pr_debug("Eventcode: 0x%x\n", eventcode);
>>
>> Can you share the BMOF associated with this event? I suspect that the b=
uffer should
>> contain a u32.
>=20
> The GUID's don't appear to contain any bmof data:
>=20
> $ lsmod | grep bmof
> wmi_bmof               12288  0
> wmi                    32768  4 video,wmi_bmof,msi_wmi,msi_wmi_platform
>=20
> $ tree -l -L 2
> .
> =E2=94=9C=E2=94=80=E2=94=80 1E2A0DA0-2B9E-424F-9C87-B1DAC3F4E9DA-3 ->
> ../../../devices/pci0000:00/0000:00:02.3/0000:c3:00.0/PNP0C14:01/wmi_bus=
/wmi_bus-PNP0C14:01/1E2A0DA0-2B9E-424F-9C87-B1DAC3F4E9DA-3
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 notify_id
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../.=
./../bus/wmi
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
> =E2=94=9C=E2=94=80=E2=94=80 5B3CC38A-40D9-7245-8AE6-1145B751BE3F-1 ->
> ../../../devices/pci0000:00/0000:00:14.3/PNP0C09:00/PNP0C14:00/wmi_bus/w=
mi_bus-PNP0C14:00/5B3CC38A-40D9-7245-8AE6-1145B751BE3F-1
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 notify_id
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../.=
./../bus/wmi
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
> =E2=94=9C=E2=94=80=E2=94=80 ABBC0F6E-8EA1-11D1-00A0-C90629100000-0 ->
> ../../../devices/pci0000:00/0000:00:14.3/PNP0C09:00/PNP0C14:00/wmi_bus/w=
mi_bus-PNP0C14:00/ABBC0F6E-8EA1-11D1-00A0-C90629100000-0
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver -> ../../../../../../../.=
./bus/wmi/drivers/msi-wmi-platform
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 driver_override
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 expensive
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guid
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hwmon
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 instance_count
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 modalias
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 object_id
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 platform-profile
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 power
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../.=
./../bus/wmi
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 uevent
> =E2=94=94=E2=94=80=E2=94=80 B2526ED4-CB45-49FA-9230-8D2FE8AFB8EC-2 ->
> ../../../devices/pci0000:00/0000:00:02.3/0000:c3:00.0/PNP0C14:01/wmi_bus=
/wmi_bus-PNP0C14:01/B2526ED4-CB45-49FA-9230-8D2FE8AFB8EC-2
>      =E2=94=9C=E2=94=80=E2=94=80 driver_override
>      =E2=94=9C=E2=94=80=E2=94=80 expensive
>      =E2=94=9C=E2=94=80=E2=94=80 guid
>      =E2=94=9C=E2=94=80=E2=94=80 instance_count
>      =E2=94=9C=E2=94=80=E2=94=80 modalias
>      =E2=94=9C=E2=94=80=E2=94=80 object_id
>      =E2=94=9C=E2=94=80=E2=94=80 power
>      =E2=94=9C=E2=94=80=E2=94=80 subsystem -> ../../../../../../../../bu=
s/wmi
>      =E2=94=94=E2=94=80=E2=94=80 uevent
>=20
> 16 directories, 28 files
>=20
>=20
> I extracted the _WED event method from the DSDT. I don't have a lot of
> experience with interpreting ACPI, but my understanding is that it
> returns u8[2] with index 0 being the keycode and index 1 being the
> state. Since we don't get events on release, that is essentially
> unused. I can do a .length !=3D 2 in the validation step before I
> extract the keycode if desired.

Oh right, i forgot that the MSI software contains the necessary BMOF=20
data xd.

Anyway, here it is for the WIND event:

[WMI, Dynamic, Provider("WmiProv"), Local("MS\\0x409"),=20
Description("Event defined by MSI"),=20
guid("{5B3CC38A-40D9-7245-8AE6-1145B751BE3F}")]
class MSI_Event : WMIEvent {
   [key, read] string InstanceName;
   [read] boolean Active;
   [WmiDataId(1), read, write, Description("Event defined by MSI")]=20
uint32 MSIEvt;
};

So the event payload is indeed a plain u32. For some reason the Windows=20
WMI stack accepts 2 byte buffers even when at least 4 are necessary. I=20
have no idea why Windows does accept undersized data in this case, but
i suggest you do the same.

So a length < 2 check (not !=3D, we need to still accept oversized=20
buffers) like you described earlier should be enough. Just drop a=20
comment somewhere that explains the meaning of index 1.

Thanks,
Armin Wolf

>=20
> Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event, xx=3D0x00-0xFF
>              {
>                  If ((Arg0 =3D=3D 0xC0))
>                  {
>                      Name (EVRT, Buffer (0x02)
>                      {
>                           0x00, 0x00                                    =
   // ..
>                      })
>                      Name (TMPB, Zero)
>                      TMPB =3D WMRD (0xD8)
>                      EVRT [Zero] =3D TMPB /* \_SB_.PCI0.SBRG.EC__.SCM0._=
WED.TMPB */
>                      If ((TMPB =3D=3D 0x08))
>                      {
>                          EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
>                              )
>                      }
>=20
>                      If ((TMPB =3D=3D 0x56))
>                      {
>                          EVRT [One] =3D WMRD (0x2E)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x57))
>                      {
>                          EVRT [One] =3D WMRD (0x2E)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x5F))
>                      {
>                          EVRT [One] =3D WMRD (0x2E)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x60))
>                      {
>                          EVRT [One] =3D (WMRD (0xE4) & 0x07)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x62))
>                      {
>                          EVRT [One] =3D WMRD (0xD1)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x63))
>                      {
>                          EVRT [One] =3D WMRD (0xD1)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x73))
>                      {
>                          EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
>                              )
>                      }
>=20
>                      If ((TMPB =3D=3D 0x79))
>                      {
>                          EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
>                              )
>                      }
>=20
>                      If ((TMPB =3D=3D 0x7B))
>                      {
>                          EVRT [One] =3D WMRD (0x2E)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x84))
>                      {
>                          EVRT [One] =3D WMRD (0x2E)
>                      }
>=20
>                      If ((TMPB =3D=3D 0x02))
>                      {
>                          EVRT [One] =3D ((WMRD (0xE4) >> 0x03) & 0x1F
>                              )
>                      }
>=20
>                      WMWT (0xD8, Zero)
>                      Return (EVRT) /* \_SB_.PCI0.SBRG.EC__.SCM0._WED.EVR=
T */
>                  }
>=20
>                  Return (Zero)
>              }
>=20
>=20
> Also  the _WDG that points the Wind GUID to arg 0xC0:
>=20
> Name (_WDG, Buffer (0x64)
>              {
>                  /* 0000 */  0x6A, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1,
> 0x11,  // j.......
>                  /* 0008 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00,
> 0x00,  // ....)...
>                  /* 0010 */  0x41, 0x4B, 0x01, 0x01, 0x6B, 0x0F, 0xBC,
> 0xAB,  // AK..k...
>                  /* 0018 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9,
> 0x06,  // ........
>                  /* 0020 */  0x29, 0x10, 0x00, 0x00, 0x41, 0x4C, 0x01,
> 0x01,  // )...AL..
>                  /* 0028 */  0x6D, 0x0F, 0xBC, 0xAB, 0xA1, 0x8E, 0xD1,
> 0x11,  // m.......
>                  /* 0030 */  0x00, 0xA0, 0xC9, 0x06, 0x29, 0x10, 0x00,
> 0x00,  // ....)...
>                  /* 0038 */  0x41, 0x4A, 0x01, 0x02, 0x6E, 0x0F, 0xBC,
> 0xAB,  // AJ..n...
>                  /* 0040 */  0xA1, 0x8E, 0xD1, 0x11, 0x00, 0xA0, 0xC9,
> 0x06,  // ........
>                  /* 0048 */  0x29, 0x10, 0x00, 0x00, 0x41, 0x4D, 0x01,
> 0x02,  // )...AM..
>                  /* 0050 */  0x8A, 0xC3, 0x3C, 0x5B, 0xD9, 0x40, 0x45,
> 0x72,  // ..<[.@Er
>                  /* 0058 */  0x8A, 0xE6, 0x11, 0x45, 0xB7, 0x51, 0xBE,
> 0x3F,  // ...E.Q.?
>                  /* 0060 */  0xC0, 0x00, 0x01, 0x09
>        // ....
>            })
> ...
>=20
> Thanks,
> Derek
>=20
>> Thanks,
>> Armin Wolf
>>
>>> +             break;
>>>        default:
>>>                pr_info("Unknown event received\n");
>>>                return;
>=20

