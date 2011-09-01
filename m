From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] Platform: Brightness quirk for samsung laptop driver
Date: Thu, 1 Sep 2011 15:44:32 -0700
Message-ID: <20110901224432.GA18879@kroah.com>
References: <1314115527-6063-1-git-send-email-dh.herrmann@googlemail.com>
 <20110824231053.GA7697@kroah.com>
 <4E55C11E.8000704@gmail.com>
 <20110826000348.GB1314@kroah.com>
 <4E576E50.4070500@gmail.com>
 <CANq1E4SgFWtMyps18c7MZp87uTCZO0T2q21FZ3eqR1TehNA-YQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out4.smtp.messagingengine.com ([66.111.4.28]:58462 "EHLO
	out4.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932384Ab1IAWry (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 1 Sep 2011 18:47:54 -0400
Content-Disposition: inline
In-Reply-To: <CANq1E4SgFWtMyps18c7MZp87uTCZO0T2q21FZ3eqR1TehNA-YQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: David Herrmann <dh.herrmann@googlemail.com>
Cc: Jason Stubbs <jasonbstubbs@gmail.com>, platform-driver-x86@vger.kernel.org, mjg@redhat.com

On Fri, Aug 26, 2011 at 01:31:38PM +0200, David Herrmann wrote:
> On Fri, Aug 26, 2011 at 11:58 AM, Jason Stubbs <jasonbstubbs@gmail.co=
m> wrote:
> > From: Jason Stubbs <jasonbstubbs@gmail.com>
> >
> > On some Samsung laptops the brightness regulation works slightly di=
fferent.
> > All SABI commands except for set_brightness work as expected. The b=
ehaviour
> > of set_brightness is as follows:
> >
> > - Setting a new brightness will only step one level toward the new =
brightness
> > =A0level. For example, setting a level of 5 when the current level =
is 2 will
> > =A0result in a brightness level of 3.
> > - A spurious KEY_BRIGHTNESS_UP or KEY_BRIGHTNESS_DOWN event is also=
 generated
> > =A0along with the change in brightness.
> > - Neither of the above two issues occur when changing from/to brigh=
tness
> > =A0level 0.
> >
> > This patch adds detection and a non-intrusive workaround for the ab=
ove issues.
> >
> > Signed-off-by: Jason Stubbs <jasonbstubbs@gmail.com>
> >
> > ---
> >
> > diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platfo=
rm/x86/samsung-laptop.c
> > index ee68c1c..b193bf0 100644
> > --- a/drivers/platform/x86/samsung-laptop.c
> > +++ b/drivers/platform/x86/samsung-laptop.c
> > @@ -226,6 +226,7 @@ static struct backlight_device *backlight_devic=
e;
> > =A0static struct mutex sabi_mutex;
> > =A0static struct platform_device *sdev;
> > =A0static struct rfkill *rfk;
> > +static bool has_stepping_quirk;
> >
> > =A0static int force;
> > =A0module_param(force, bool, 0);
> > @@ -382,6 +383,17 @@ static void set_brightness(u8 user_brightness)
> > =A0{
> > =A0 =A0 =A0 =A0u8 user_level =3D user_brightness + sabi_config->min=
_brightness;
> >
> > + =A0 =A0 =A0 if (has_stepping_quirk && user_level !=3D 0) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* short circuit if the specified l=
evel is what's already set
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* to prevent the screen from flick=
ering needlessly
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (user_brightness =3D=3D read_brigh=
tness())
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> > +
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sabi_set_command(sabi_config->command=
s.set_brightness, 0);
> > + =A0 =A0 =A0 }
> > +
> > =A0 =A0 =A0 =A0sabi_set_command(sabi_config->commands.set_brightnes=
s, user_level);
> > =A0}
> >
> > @@ -390,6 +402,34 @@ static int get_brightness(struct backlight_dev=
ice *bd)
> > =A0 =A0 =A0 =A0return (int)read_brightness();
> > =A0}
> >
> > +static void check_for_stepping_quirk(void)
> > +{
> > + =A0 =A0 =A0 u8 initial_level =3D read_brightness();
> > + =A0 =A0 =A0 u8 check_level;
> > +
> > + =A0 =A0 =A0 /*
> > + =A0 =A0 =A0 =A0* Some laptops exhibit the strange behaviour of st=
epping toward
> > + =A0 =A0 =A0 =A0* (rather than setting) the brightness except when=
 changing to/from
> > + =A0 =A0 =A0 =A0* brightness level 0. This behaviour is checked fo=
r here and worked
> > + =A0 =A0 =A0 =A0* around in set_brightness.
> > + =A0 =A0 =A0 =A0*/
> > +
> > + =A0 =A0 =A0 if (initial_level <=3D 2)
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_level =3D initial_level + 2;
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 check_level =3D initial_level - 2;
> > +
> > + =A0 =A0 =A0 has_stepping_quirk =3D false;
> > + =A0 =A0 =A0 set_brightness(check_level);
> > +
> > + =A0 =A0 =A0 if (read_brightness() !=3D check_level) {
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 has_stepping_quirk =3D true;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_info("enabled workaround for brigh=
tness stepping quirk\n");
> > + =A0 =A0 =A0 }
> > +
> > + =A0 =A0 =A0 set_brightness(initial_level);
> > +}
> > +
> > =A0static int update_status(struct backlight_device *bd)
> > =A0{
> > =A0 =A0 =A0 =A0set_brightness(bd->props.brightness);
> > @@ -796,6 +836,9 @@ static int __init samsung_init(void)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0}
> >
> > + =A0 =A0 =A0 /* Check for stepping quirk */
> > + =A0 =A0 =A0 check_for_stepping_quirk();
> > +
> > =A0 =A0 =A0 =A0/* knock up a platform device to hang stuff off of *=
/
> > =A0 =A0 =A0 =A0sdev =3D platform_device_register_simple("samsung", =
-1, NULL, 0);
> > =A0 =A0 =A0 =A0if (IS_ERR(sdev))
> >
> >
>=20
> Thank you, Jason.
> Tested-by: David Herrmann <dh.herrmann@googlemail.com>
>=20
> And Greg, could you actually "git add" the new samsung patches in you=
r
> repository? You added them to "series" but didn't submit the actual
> patch files. That would be great.

Now done, sorry about that.

greg k-h
