From: joeyli <jlee@suse.com>
Subject: Re: [Fwd: Re: A problem about acer-wmi]
Date: Wed, 07 Sep 2011 10:33:08 +0800
Message-ID: <1315362788.17536.347.camel@linux-s257.site>
References: <4E440A530200002300030503@novprvlin0050.provo.novell.com>
	 <CAMz9Wg_B8ZQ9_6=62N-h0FWsA2csDbwxbYwS+s+u-jVSujKysQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:39467 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754802Ab1IGChv (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Tue, 6 Sep 2011 22:37:51 -0400
In-Reply-To: <CAMz9Wg_B8ZQ9_6=62N-h0FWsA2csDbwxbYwS+s+u-jVSujKysQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan@gmail.com>
Cc: Joey Lee <jlee@novell.com>, platform-driver-x86@vger.kernel.org

Hi AceLan,=20

I am tracing a issue related to hotkey define.
Could you please share dmidecode to me on your machine?


Thank's a lot!
Joey Lee

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-08-11 =E6=96=BC 15:45 +0800=EF=BC=8CAc=
eLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> Dear Joey,
>=20
> Good, that looks more reasonable to me.
>=20
> Yes, my machine has wifi module on it, but the wifi hotkey event is
> handled by BIOS, so the wifi toggle works as expected.
> I still got the failed message, but we can take it as a BIOS bug and
> leave it there.
>=20
> BTW, your patches work well on my machine, thanks for your hard work.
> You can have my signature on your patches.
> Tested-by: AceLan Kao <acelan.kao@canonical.com>
>=20
> Best regards,
> AceLan Kao.
>=20
> 2011/8/11 Joey Lee <jlee@novell.com>:
> > =E6=96=BC =E5=9B=9B=EF=BC=8C2011-08-11 =E6=96=BC 03:30 +0000=EF=BC=8C=
joeyli(Joey Lee) =E6=8F=90=E5=88=B0=EF=BC=9A
> >> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-08-11 =E6=96=BC 10:48 +0800=EF=BC=
=8CAceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> > Dear Joey,
> >> >
> >> > This is the dmesg log.
> >> > [ 9010.944053] acer_wmi: Acer Laptop ACPI-WMI Extras
> >> > [ 9010.944071] acer_wmi: Function bitmap for Communication Butto=
n: 0x1
> >
> > Per this log, the 0x1 means your machine have wifi hardware module =
and
> > BIOS detected it then write information to SMBIOS area.
> >
> >> > [ 9010.944075] acer_wmi: Brightness must be controlled by generi=
c video driver
> >> > [ 9010.944996] input: Acer WMI hotkeys as /devices/virtual/input=
/input21
> >> > [ 9010.947095] acer_wmi: Set Device Status failed: 0xe2 - 0x0
> >> >
> >
> > But,
> > here have problem when acer-wmi driver try to set the state by
> > WMID_GUID3 method, the wmi function response 0xe2.
> >
> >> > And after adding my quirk, the set device status still failed, b=
ut
> >> > except that, everything works well.
> >> >
> >>
> >> So, you machine have wifi hardware module or not?
> >>
> >> > The "failed" comes from acer_rfkill_init(), it'll call
> >> > acer_rfkill_register() with ACER_CAP_WIRELESS parameter without
> >> > checking the capability.
> >> > I don't know why only wifi doesn't check the capability and call
> >> > acer_rfkill_register() directly, but it doesn't hurt the system.
> >> >
> >> > =3D=3D=3D
> >> > static int acer_rfkill_init(struct device *dev)
> >> > {
> >> >         wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_TYP=
E_WLAN,
> >> >                 "acer-wireless", ACER_CAP_WIRELESS);
> >> >         if (IS_ERR(wireless_rfkill))
> >> >                 return PTR_ERR(wireless_rfkill);
> >> > =3D=3D=3D
> >> >
> >> > Best regards,
> >> > AceLan Kao.
> >> >
> >>
> >> I checked the history, looks like it's just a original design in o=
ld
> >> patch.
> >>
> >> Yes, you are right, add ACER_CAP_WIRELESS check is better. I am do=
ing
> >> generate a patch to add ACER_CAP_WIRELESS check.
> >> Will attached patch on mail.
> >>
> >>
> >> Thank's
> >> Joey Lee
> >>
> >
> > Please let me know does there have any wifi module in your machine =
when
> > you test?
> > If yes, then you need contact with BIOS team for why the WMID_GUID3
> > method response 0xe2 when set device state, because this function w=
orks
> > find on my TravelMate 8572 machine.
> >
> > On the other hand,
> > The following is patch to check the ACER_CAP_WIRELESS before genera=
te
> > wireless rfkill.
> >
> >
> > Thank's
> > Joey Lee
> >
> > >From 18c20f2b40bc64ec72b52ae2e4d994237173f982 Mon Sep 17 00:00:00 =
2001
> > From: Lee, Chun-Yi <jlee@suse.com>
> > Date: Thu, 11 Aug 2011 12:49:53 +0800
> > Subject: [PATCH] acer-wmi: check wireless capability flag before re=
gister rfkill
> >
> > There will be better to check the wireless capability flag
> > (ACER_CAP_WIRELESS) before register wireless rfkill because maybe
> > the machine doesn't have wifi module or the module removed by user.
> >
> > Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
> > ---
> >  drivers/platform/x86/acer-wmi.c |   64 +++++++++++++++++++++++++--=
-----------
> >  1 files changed, 42 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index 712a505..b4078c4 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -1289,12 +1289,13 @@ static void acer_rfkill_update(struct work_=
struct *ignored)
> >        u32 state;
> >        acpi_status status;
> >
> > -       status =3D get_u32(&state, ACER_CAP_WIRELESS);
> > -       if (ACPI_SUCCESS(status)) {
> > -               if (quirks->wireless =3D=3D 3) {
> > -                       rfkill_set_hw_state(wireless_rfkill, !state=
);
> > -               } else {
> > -                       rfkill_set_sw_state(wireless_rfkill, !state=
);
> > +       if (has_cap(ACER_CAP_WIRELESS)) {
> > +               status =3D get_u32(&state, ACER_CAP_WIRELESS);
> > +               if (ACPI_SUCCESS(status)) {
> > +                       if (quirks->wireless =3D=3D 3)
> > +                               rfkill_set_hw_state(wireless_rfkill=
, !state);
> > +                       else
> > +                               rfkill_set_sw_state(wireless_rfkill=
, !state);
> >                }
> >        }
> >
> > @@ -1362,19 +1363,24 @@ static struct rfkill *acer_rfkill_register(=
struct device *dev,
> >
> >  static int acer_rfkill_init(struct device *dev)
> >  {
> > -       wireless_rfkill =3D acer_rfkill_register(dev, RFKILL_TYPE_W=
LAN,
> > -               "acer-wireless", ACER_CAP_WIRELESS);
> > -       if (IS_ERR(wireless_rfkill))
> > -               return PTR_ERR(wireless_rfkill);
> > +       int err;
> > +
> > +       if (has_cap(ACER_CAP_WIRELESS)) {
> > +               wireless_rfkill =3D acer_rfkill_register(dev, RFKIL=
L_TYPE_WLAN,
> > +                       "acer-wireless", ACER_CAP_WIRELESS);
> > +               if (IS_ERR(wireless_rfkill)) {
> > +                       err =3D PTR_ERR(wireless_rfkill);
> > +                       goto error_wireless;
> > +               }
> > +       }
> >
> >        if (has_cap(ACER_CAP_BLUETOOTH)) {
> >                bluetooth_rfkill =3D acer_rfkill_register(dev,
> >                        RFKILL_TYPE_BLUETOOTH, "acer-bluetooth",
> >                        ACER_CAP_BLUETOOTH);
> >                if (IS_ERR(bluetooth_rfkill)) {
> > -                       rfkill_unregister(wireless_rfkill);
> > -                       rfkill_destroy(wireless_rfkill);
> > -                       return PTR_ERR(bluetooth_rfkill);
> > +                       err =3D PTR_ERR(bluetooth_rfkill);
> > +                       goto error_bluetooth;
> >                }
> >        }
> >
> > @@ -1383,30 +1389,44 @@ static int acer_rfkill_init(struct device *=
dev)
> >                        RFKILL_TYPE_WWAN, "acer-threeg",
> >                        ACER_CAP_THREEG);
> >                if (IS_ERR(threeg_rfkill)) {
> > -                       rfkill_unregister(wireless_rfkill);
> > -                       rfkill_destroy(wireless_rfkill);
> > -                       rfkill_unregister(bluetooth_rfkill);
> > -                       rfkill_destroy(bluetooth_rfkill);
> > -                       return PTR_ERR(threeg_rfkill);
> > +                       err =3D PTR_ERR(threeg_rfkill);
> > +                       goto error_threeg;
> >                }
> >        }
> >
> >        rfkill_inited =3D true;
> >
> > -       if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
> > +       if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
> > +           has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_C=
AP_THREEG))
> >                schedule_delayed_work(&acer_rfkill_work,
> >                        round_jiffies_relative(HZ));
> >
> >        return 0;
> > +
> > +error_threeg:
> > +       if (has_cap(ACER_CAP_BLUETOOTH)) {
> > +               rfkill_unregister(bluetooth_rfkill);
> > +               rfkill_destroy(bluetooth_rfkill);
> > +       }
> > +error_bluetooth:
> > +       if (has_cap(ACER_CAP_WIRELESS)) {
> > +               rfkill_unregister(wireless_rfkill);
> > +               rfkill_destroy(wireless_rfkill);
> > +       }
> > +error_wireless:
> > +       return err;
> >  }
> >
> >  static void acer_rfkill_exit(void)
> >  {
> > -       if (ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID))
> > +       if ((ec_raw_mode || !wmi_has_guid(ACERWMID_EVENT_GUID)) &&
> > +           has_cap(ACER_CAP_WIRELESS | ACER_CAP_BLUETOOTH | ACER_C=
AP_THREEG))
> >                cancel_delayed_work_sync(&acer_rfkill_work);
> >
> > -       rfkill_unregister(wireless_rfkill);
> > -       rfkill_destroy(wireless_rfkill);
> > +       if (has_cap(ACER_CAP_WIRELESS)) {
> > +               rfkill_unregister(wireless_rfkill);
> > +               rfkill_destroy(wireless_rfkill);
> > +       }
> >
> >        if (has_cap(ACER_CAP_BLUETOOTH)) {
> >                rfkill_unregister(bluetooth_rfkill);
> > --
> > 1.6.0.2
> >
> >
> >
> >
>=20
>=20
>=20
> --=20
> Chia-Lin Kao(AceLan)
> http://blog.acelan.idv.tw/
> E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
