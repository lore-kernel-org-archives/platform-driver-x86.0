From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: support Acer Aspire/eMachines 4739z
Date: Fri, 09 Sep 2011 18:59:08 +0800
Message-ID: <1315565948.8674.209.camel@linux-s257.site>
References: <1315380728-22031-1-git-send-email-acelan.kao@canonical.com>
	 <1315387833.8674.62.camel@linux-s257.site>
	 <CAMz9Wg_xtTmhnQ8Kuj5hzom_iFP7GeOMco_0pNj2-1T=N_BJNw@mail.gmail.com>
	 <1315455875.8674.110.camel@linux-s257.site>
	 <CAMz9Wg_P2KpbMSW+mmkOSbzqCKZ-HoBuRypf8p6R+jdQ1FgFBQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:51430 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933532Ab1IILD4 (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Fri, 9 Sep 2011 07:03:56 -0400
In-Reply-To: <CAMz9Wg_P2KpbMSW+mmkOSbzqCKZ-HoBuRypf8p6R+jdQ1FgFBQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: AceLan Kao <acelan.kao@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com, jlee@suse.com

=E6=96=BC =E5=9B=9B=EF=BC=8C2011-09-08 =E6=96=BC 14:38 +0800=EF=BC=8CAc=
eLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> Hi,
>=20
> 2011/9/8 joeyli <jlee@suse.com>:
> > =E6=96=BC =E5=9B=9B=EF=BC=8C2011-09-08 =E6=96=BC 10:30 +0800=EF=BC=8C=
AceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> Hi,
> >>
> >> 2011/9/7 joeyli <jlee@suse.com>:
> >> > =E6=96=BC =E4=B8=89=EF=BC=8C2011-09-07 =E6=96=BC 15:32 +0800=EF=BC=
=8CAceLan Kao =E6=8F=90=E5=88=B0=EF=BC=9A
> >> >> There are 2 kind of 4739Z, the one that vendor name is ACER sen=
ts out
> >> >> the correct brightness key events, so we use the
> >> >
> >> > Current brightness key events means the Fn key direct send out k=
ey code
> >> > but not from wmi notify event?
> >> Currently, most of the machines send out the correctly brightness =
key
> >> code from EC,
> >> so we don't have to handle them. The video ACPI will capture the
> >> events and adjust
> >> the brightness.
> >> Acer Aspire 4739Z sends out the correct brightness key code as oth=
er
> >> machines do.
> >> Acer eMachines 4739Z doesn't sends out correct key codes, it sends=
 out
> >> meaningless
> >> key codes, so we have to capture the brightness event from WMI and=
 remapping to
> >
> > What's the number of meaningless key codes? Maybe we should remap i=
t in
> > udev but not in acer-wmi driver.
> brightness up is -
> brightness down is -
>=20
> The reason why we shouldn't remap the keys in udev is that when it
> comes to follow the
> Acer WMI spec., the BIOS engineer won't care about which key code wil=
l
> be submitted
> while the brightness key be pressed. So, the key codes might change i=
f
> there is a BIOS
> upgrade.
>=20

That's bad and not make sense they emit the same key code and wmi event
code on two brightness control keys.

> >
> >> the correct key code and raise the correct key events to ACPI.
> >>
> >
> > Transfer wmi notify event to key event is fine, but keep and mainta=
in
> > the current brightness level in acer-wmi is not a good idea, becaus=
e
> > BIOS also maintain a BRTL flag in DSDT.
> > If there have other userland application touch brightness level thr=
ough
> > _BCM, then will have risk causes the value out of sync.
> Yes, that's a problem.
> I don't have any idea to overcome it right now.
>=20

Could you please check with BIOS team for What's the implementation on
Windows 7?
Which component on Windows take care the brightness control job?

> >> We can choose any value we like other than, 0x62, 0x63, since we d=
on't care what
> >> key codes are reported, I just need a mapping entry here, so that
> >
> > But, why you enable 0x61? It not related to brightness control, whi=
ch
> > machine use it?
> It's for video toggle, both Aspire and eMachines 4739Z need that key =
event.
>=20

OK!

> >
> > Like I said, keep current brightness acer-wmi is not good idea and =
have
> > risk to conflict with acpi video driver if there have other userlan=
d
> > application change brightness level through _BCM.
> You are right, it's better to reconsider the implementation.
>=20
> >
> >> >
> >> >>  static int mailled =3D -1;
> >> >>  static int brightness =3D -1;
> >> >> @@ -310,6 +324,10 @@ static struct quirk_entry quirk_lenovo_ide=
apad_s205 =3D {
> >> >>       .wireless =3D 3,
> >> >>  };
> >> >>
> >> >> +static struct quirk_entry quirk_acer_aspire_4739z=3D {
> >> >> +     .brightness =3D 2,
> >> >> +};
> >> >> +
> >> >>  /* The Aspire One has a dummy ACPI-WMI interface - disable it =
*/
> >> >>  static struct dmi_system_id __devinitdata acer_blacklist[] =3D=
 {
> >> >>       {
> >> >> @@ -368,6 +386,24 @@ static struct dmi_system_id acer_quirks[] =
=3D {
> >> >>       },
> >> >>       {
> >> >>               .callback =3D dmi_matched,
> >> >> +             .ident =3D "Acer Aspire 4739Z",
> >> >> +             .matches =3D {
> >> >> +                     DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> >> >> +                     DMI_MATCH(DMI_PRODUCT_NAME, "AS4739Z"),
> >> >> +             },
> >> >> +             .driver_data =3D &quirk_acer_travelmate_2490,
> >> >> +     },
> >> >
> >> > Why "Acer Aspire 4739Z" set to quirk the same with travelmate 24=
90?
> >> > There only have a mailled capability flag in this quirk, why you=
 used
> >> > it?
> >> > Does that because Aspire 4739Z also have mail hotkey button?
> >> >
> >> > If the answer is NO, then don't need add a new quirk.
> >> Sorry, I missunderstanding it, there is no mailled on it, I'll rem=
ove it.
> >>
> >
> > I read your new patch, please direct remove whole Acer Aspire 4739Z
> > quirk block. Do you have any good reason to add the quirk block?
> Acer Aspire 4739Z needs the video toggling function and the key event
> is {KE_KEY, 0x61, {KEY_SWITCHVIDEOMODE} },
> that's why we need it's quirk here.
>=20

The keymap was setup when driver deteced wmi event guid, the quirk bloc=
k
doesn't have anything related to wmi event keymap setup. Please remove
the quirk block then test again.

> >> >>
> >> >>       switch (return_value.function) {
> >> >>       case WMID_HOTKEY_EVENT:
> >> >> +     case WMID_HOTKEY_BREAK_EVENT:
> >
> > Why add BREAK EVENT here? for which key?
> > Does it possible causes other machine run the same function key twi=
ce?
> For video toggling,
> {KE_KEY, 0x61, {KEY_SWITCHVIDEOMODE} },
>=20
> And yes, you are right, that might lead to the problem that switch th=
e
> output twice.
> I'll add one more check for this key.
>=20
> >
> >> >>               device_state =3D return_value.device_state;
> >> >>               pr_debug("device state: 0x%x\n", device_state);
> >> >>
> >> >> @@ -1558,6 +1596,29 @@ static void acer_wmi_notify(u32 value, v=
oid *context)
> >> >>                                                  1, true);
> >> >>               }
> >> >>               break;
> >> >> +     case WMID_BRIGHTNESS_CHANGE_EVENT:
> >> >> +             // to avoid the brightness event be handled twice
> >> >> +             if( quirks->brightness !=3D 2)
> >> >> +                     break;
> >> >> +             brightness_return_value =3D *((struct brightness_=
event_return_value *)&return_value);
> >> >> +             /* brightness is decreasing */
> >> >> +             if( cur_brightness > brightness_return_value.brig=
htness_level1)
> >> >> +                     key =3D sparse_keymap_entry_from_scancode=
(acer_wmi_input_dev, 0x63);
> >> >> +             /* brightness is increasing */
> >> >> +             else if( cur_brightness < brightness_return_value=
=2Ebrightness_level1)
> >> >> +                     key =3D sparse_keymap_entry_from_scancode=
(acer_wmi_input_dev, 0x62);
> >> >> +             /* brightness is already at the bottom */
> >> >> +             else if( cur_brightness =3D=3D 0)
> >> >> +                     key =3D sparse_keymap_entry_from_scancode=
(acer_wmi_input_dev, 0x63);
> >> >> +             /* brightness is already at the top */
> >> >> +             else if( cur_brightness =3D=3D 9)
> >> >> +                     key =3D sparse_keymap_entry_from_scancode=
(acer_wmi_input_dev, 0x62);
> >> >> +
> >> >> +             sparse_keymap_report_entry(acer_wmi_input_dev, ke=
y, 1, true);
> >> >> +             cur_brightness=3D return_value.key_num;
> >> >> +             break;
> >> >
> >> > The same,
> >> > why should you control the brightness level number in acer-wmi d=
river?
> >> > Does it not control by acpi video driver and _BCL/_BCM in DSDT?
> >> >
> >> > And, why choice 0x62, 0x63? The above 2 number is not from your =
wmi
> >> > notify result, why use them?
> >> The problem is that the BIOS/EC doesn't send out the correct brigh=
tness
> >> key events, the BIOS engineer just choose non-used values for thos=
e keys
> >> that are defined in Acer WMI spec. Because they think those key ev=
ents
> >> should be captured from WMI, not from BIOS/EC.
> >> So that, we have to read the brightness change event from WMI key =
events.
> >> And then use the ACPI way to adjust the brightness.
> >>
> >
> > After reviewed your DSDT, I thought _Q8E and _Q8F are mapping to yo=
ur
> > brightness up/down Fn key, please enable acpi debug message to conf=
irm
> > it.
> >
> > And, in _Q8E/Q8F:
> >
> >    Method (_Q8E, 0, NotSerialized)             /* Brightness up ? *=
/
> >    {
> >        If (CondRefOf (HBRT))
> >        {
> >            HBRT (0x03)
> >        }
> >
> >        If (IGDS)
> >        {
> >            If (And (0x04, DSEN))               /* when DSEn is 0x04=
 is 100 */
> >            {
> >                BRTN (0x86)                     /* ACPI_VIDEO_NOTIFY=
_INC_BRIGHTNESS 0x86  */
> >            }
> >
> > The machine emit standard ACPI_VIDEO_NOTIFY_INC_BRIGHTNESS event to
> > video device when IDGS is true and DSEN is 0x04.
> >
> > Please kindly check with BIOS team for what's the definition with I=
GDS
> > and DSEN, and why the DSEN should set to 100 (looks likes it need
> > disable automatically control the brightness level in BIOS).
> >
> > This is a good chance to ask BIOS team to know more useful informat=
ion
> > to us.
> I'm sorry that the BIOS team won't change anything for us.
> Acer Aspire 4739Z is already an shipping product, and
> Acer eMachines 4739Z only change the BIOS bootup logo and vendor name
> (and maybe mixed up some key codes), so they won't change anything
> from BIOS to avoid inducing problems to the product.
>=20

Please please check with BIOS team for:

What's the definition with IGDS and DSEN, and why the DSEN should set t=
o
100 (looks likes it need disable automatically control the brightness
level in BIOS).

This is the only moment for ODM's BIOS team can response us, please hel=
p
to check with them for how the implementation on Windows platform. I
didn't say need BIOS team modify anything, but we need dig more things
for how can they implement 2 keys used 1 event on Windows platform.

> And the ACPI log I gave you a month ago is Acer Aspire 4739Z, so
> the key codes are correct.
> The eMachine I have now is broken, I'm trying to reinstall it and dum=
p
> the eMachines' ACPI log to you later.
>=20

Thank's!

> >
> > I don't want maintain brightness level in acer-wmi, we can transfer=
 the
> > wmi event to key event, but maintain current brightness level is no=
t
> > good and dirty.
> Agree, I need more time to work out other solution.
> Talk to you later.
>=20

Please help to check with BIOS team and ODM for how did they implement
it on Windows platform, per current information from DSDT and BIOS team=
,
it's dirty and not make sense to maintain the current brightness value
outside ACPI space.


Thank's for your help!=20
Joey Lee
