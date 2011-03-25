From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT Home/Express Gate key
Date: Fri, 25 Mar 2011 14:05:18 +0000
Message-ID: <AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR__15139.0143939809$1301061964$gmane$org@mail.gmail.com>
References: <20110324195720.GB31713@thinkpad-t410>
	<1300997035-14104-2-git-send-email-seth.forshee@canonical.com>
	<AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:56577 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753160Ab1CYOFU convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 25 Mar 2011 10:05:20 -0400
In-Reply-To: <20110325135311.GA14328@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kern
Cc: Seth Forshee <seth.forshee@canonical.com>

On Fri, Mar 25, 2011 at 1:53 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> On Fri, Mar 25, 2011 at 01:28:30PM +0000, Corentin Chary wrote:
>> > +static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi=
, int *code,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *value, int *autorelea=
se)
>> > +{
>> > + =C2=A0 =C2=A0 =C2=A0 struct eeepc_wmi_driver *eeepc =3D to_eeepc=
_wmi_driver(asus_wmi);
>> > + =C2=A0 =C2=A0 =C2=A0 int is_press;
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 /*
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The following behavior is used for =
T101MT "Home" key:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On press: =C2=A0 No event se=
t
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On hold: =C2=A0 =C2=A0KEY_PR=
OG2 press sent once w/o autorelease
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 On release: If key was held,=
 KEY_PROG2 release sent.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Otherwise KEY_HOME press sent w/ autorelease.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0* The simple state machine below impl=
ements this behavior.
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0*/
>> > + =C2=A0 =C2=A0 =C2=A0 switch (*code) {
>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_PRESS:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 eeepc->home_key=
_state =3D HOME_PRESS;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *code =3D ASUS_=
WMI_KEY_IGNORE;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_HOLD:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (eeepc->home=
_key_state =3D=3D HOME_HOLD) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *code =3D ASUS_WMI_KEY_IGNORE;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 eeepc->home_key_state =3D HOME_HOLD;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *value =3D 1;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *autorelease =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 case HOME_RELEASE:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (eeepc->home=
_key_state =3D=3D HOME_RELEASE) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_warn(&asus_wmi->platform_device->dev,
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Unexpected home key relea=
se event\n");
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *code =3D ASUS_WMI_KEY_IGNORE;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *code =3D eeepc->home_key_state;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 eeepc->home_key_state =3D HOME_RELEASE;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 is_press =3D (*code =3D=3D HOME_PRESS);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *value =3D is_press;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *autorelease =3D is_press;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> > +}
>> > +
>>
>> Why not something simpler like this ?
>>
>> static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, i=
nt code,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int *value, int *autorelease)
>> {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (code =3D=3D 0xe4) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D 1=
;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorelease=
 =3D 0;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (code =3D=3D 0xe5) {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *value =3D 0=
;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *autorelease=
 =3D 0;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> }
>>
>> with this keymap :
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe4, { KEY_HOME } }, /* Home K=
ey Down */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xe5, { KEY_HOME } }, /* Home K=
ey Up */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ KE_KEY, 0xea, { KEY_PROG2 } }, /* Home =
Key hold more than one second */
>>
>>
>> This sounds simpler and we don't loose information (key down and key
>> up both event reported at the right time).
>> 0xe5 is *always* sent after 0xe4 right ?
>
> I guess it depends on what key events we want on a press-and-hold.
> Remember that you're going to get a scan code sequence like "0xe4 0xe=
a
> 0xea ... 0xea 0xe5", so with my implementation you get
>
> =C2=A0KEY_PROG2 press
> =C2=A0KEY_PROG2 release
>
> With yours
>
> =C2=A0KEY_HOME press
> =C2=A0KEY_PROG2 press
> =C2=A0KEY_PROG2 release
> =C2=A0// KEY_PROG2 press/release repeats every 0.5 secs while button =
held
> =C2=A0KEY_HOME release
>
> At minimum I'd think we'd want to only send a single PROG2 press/rele=
ase
> for button hold. My thought was that you'd only want to get the code =
for
> 0xe4 or 0xea, not both, but I suppose that's debatable.

If you keep a keyboard key pressed, you want multiple events, not one r=
ight ?
I think it's important not to loose informations. If someone keep this
key pressed more than 1.5 second, I think it's good idea to send
multiple KEY_PROG2.

About KEY_HOME press / release, and filtering KEY_HOME after
KEY_PROG2, I'm not sure. So if you really want it, and nobody
complains, I'll be happy to accept your patch.

> And back to the question of KEY_HOME -- that's not really what you wa=
nt,
> is it? As in "move cursor to start of line"?

Ho .. right, that's what mean KEY_HOME :/. So no, I don't want that...
What about:
- KEY_CYCLEWINDOWS
- KEY_COMPUTER
- KEY_HOMEPAGE
- KEY_DASHBOARD

I think KEY_HOMEPAGE is the best choice.

--=20
Corentin Chary
http://xf.iksaif.net
