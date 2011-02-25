From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] eeepc-wmi: set the touchpad toggle key code to F21
Date: Fri, 25 Feb 2011 15:25:34 -0700
Message-ID: <4D68C70E02000023000290F5@novprvlin0050.provo.novell.com>
References: <1298611140-21573-1-git-send-email-keng-yu.lin@canonical.com>
 <AANLkTim_JKQU9J3OJ0FRQ_ZVPktAPbnzr2t8SvhL2Uzj@mail.gmail.com>
 <20110225071827.GA14053@core.coreip.homeip.net>
 <AANLkTinV+bnSBe+5CSuYYCU4gCq9Z2c9ELdy-LFAvdf0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <AANLkTinV+bnSBe+5CSuYYCU4gCq9Z2c9ELdy-LFAvdf0@mail.gmail.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: chris@cnpbagwell.com
Cc: keng-yu.lin@canonical.com, tyson.chen@canonical.com, corentin.chary@gmail.com, dmitry.torokhov@gmail.com, acpi4asus-user@lists.sourceforge.net, Joey Lee <JLee@novell.com>, mjg@redhat.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=94=EF=BC=8C2011-02-25 =E6=96=BC 09:14 -0600=EF=BC=8CCh=
ris Bagwell =E6=8F=90=E5=88=B0=EF=BC=9A
> On Fri, Feb 25, 2011 at 1:18 AM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> > On Fri, Feb 25, 2011 at 07:52:11AM +0100, Corentin Chary wrote:
> >> On Fri, Feb 25, 2011 at 6:19 AM, Keng-Yu Lin <keng-yu.lin@canonica=
l.com> wrote:
> >> > Signed-off-by: Keng-Yu Lin <keng-yu.lin@canonical.com>
> >> > ---
> >> >  drivers/platform/x86/eeepc-wmi.c |    2 +-
> >> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >> >
> >> > https://bugs.freedesktop.org/show_bug.cgi?id=3D31333
> >> >
> >> > diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform=
/x86/eeepc-wmi.c
> >> > index d399775..da00cbc 100644
> >> > --- a/drivers/platform/x86/eeepc-wmi.c
> >> > +++ b/drivers/platform/x86/eeepc-wmi.c
> >> > @@ -113,7 +113,7 @@ static const struct key_entry eeepc_wmi_keym=
ap[] =3D {
> >> >        { KE_KEY, 0x32, { KEY_MUTE } },
> >> >        { KE_KEY, 0x5c, { KEY_F15 } }, /* Power Gear key */
> >> >        { KE_KEY, 0x5d, { KEY_WLAN } },
> >> > -       { KE_KEY, 0x6b, { KEY_F13 } }, /* Disable Touchpad */
> >> > +       { KE_KEY, 0x6b, { KEY_F21 } }, /* Disable Touchpad */
> >> >        { KE_KEY, 0x82, { KEY_CAMERA } },
> >> >        { KE_KEY, 0x83, { KEY_CAMERA_ZOOMIN } },
> >> >        { KE_KEY, 0x88, { KEY_WLAN } },
> >>
> >> Hum, I'm not very comfortable with this patch now that we got
> >> KEY_TOUCHPAD_TOGGLE.
> >> I know, it doesn't work with current Xorg, but if we continue to
> >> workaround that, it'll never be fixed.
> >>
> >> Dmitry, Matthew, any advice ?
> >
> > I believe that the kernel should use KEY_TOUCHPAD_TOGGLE and usersp=
ace
> > should use udev's key re-mapping facilities while X is unable to pr=
ocess
> > keycodes above 255 to adjust to the keycode du jour. If all kernel
> > drivers were to use KEY_TOUCHPAD_TOGGLE then remapping would be muc=
h
> > easier (the utility would simply check capabilities for
> > KEY_TOUCHPAD_TOGGLE and do the remap).
>=20
> I submitted last month a patch to udev to do the scancode-to-F21
> mapping.  So that part should be covered for near term.
>=20
> I also agree if we are going to change kernel side, we should change
> to KEY_TOUCHPAD_TOGGLE in both eeepc-laptop and eeepc-wmi.
>=20
> http://git.kernel.org/?p=3Dlinux/hotplug/udev.git;a=3Dcommit;h=3D0d8b=
6be5f5238360d2d8e220d6da280f842c5358
>=20

=46ound acer-wmi also have Touchpad toggle but mapping to F22

        {KE_KEY, 0x82, {KEY_F22} },      /* Touch Pad On/Off */

Will also send patch to udev keymap first, then change the wmi driver
mapping to KEY_TOUCHPAD_TOGGLE.


Thank's
Joey Lee
