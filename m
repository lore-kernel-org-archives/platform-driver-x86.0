From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Sat, 14 Nov 2015 07:48:25 -0800
Message-ID: <CALCETrU9RDOGSOJVxmxu-6XxrovW2ugQRcNfy-fE8p8Qbu2uBg@mail.gmail.com>
References: <cover.1447479930.git.luto@kernel.org> <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
 <20151114092704.GA25957@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151114092704.GA25957@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Nov 14, 2015 1:27 AM, "Pali Roh=C3=A1r" <pali.rohar@gmail.com> wrote=
:
>
> On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
> > The XPS 13 Skylake has an rfkill button and a switchvideomode butto=
n
> > that aren't enumerated in the DMI table AFAICT.  Add a table listin=
g
> > extra un-enumerated hotkeys.  To avoid breaking things that worked
> > before, these un-enumerated hotkeys won't be used if the DMI table
> > maps them to something else.
> >
>
> Do you have any (Dell) documentation which specify list of these wmi
> codes send to dell-wmi driver?
>

No.  Do you know where to get that documentation?

> > This also adds the Fn-lock key as a KE_IGNORE entry.
> >
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > ---
> >  drivers/platform/x86/dell-wmi.c | 48 +++++++++++++++++++++++++++++=
++++++------
> >  1 file changed, 41 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86=
/dell-wmi.c
> > index f2d77fe696ac..5be1abec4f64 100644
> > --- a/drivers/platform/x86/dell-wmi.c
> > +++ b/drivers/platform/x86/dell-wmi.c
> > @@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256] __=
initconst =3D {
> >       0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
> >  };
> >
> > +/* These are applied if the hk table is present and doesn't overri=
de them. */
> > +static const struct key_entry dell_wmi_extra_keymap[] __initconst =
=3D {
> > +     /* Fn-lock -- no action is required by the kernel. */
> > +     { KE_IGNORE, 0x151, { KEY_RESERVED } },
> > +
> > +     /* Keys that need our help (on XPS 13 Skylake and maybe other=
s. */
> > +     { KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
> > +     { KE_KEY, 0x153, { KEY_RFKILL } },
>
> On more Dell laptops rfkill events are handed by ACPI driver
> dell-rbtn.ko. Are you sure that dell-rbtn.ko does not send keypress
> event and you really need it from dell-wmi? We already masked KEY_RFK=
ILL
> in dell-wmi to prevent double events...
>

Hmm, interesting.  I have DELLABC6, not DELLABCE.  I'll play around
with it a bit.  Are there Dell docs for this?

Regardless, we'll need something like this, but maybe with KE_IGNORE,
just to silence the warnings.

> > +
> > +             /*
> > +              * Check if we've already found this scancode.  This =
takes
> > +              * quadratic time, but it doesn't matter unless the l=
ist
> > +              * of extra keys gets very long.
> > +              */
> > +             for (j =3D 0; j < num_bios_keys; j++)
> > +                     if (keymap[j].code =3D=3D dell_wmi_extra_keym=
ap[i].code)
> > +                             goto skip;
>
> Rather move this code into separate boolean function and for return
> value here. This will prevent using hacky goto...
>

I'll do that in v2.

--Andy
