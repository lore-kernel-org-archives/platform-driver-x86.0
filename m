From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] dell-wmi: Stop storing pointers to DMI tables
Date: Wed, 13 Jan 2016 14:28:18 -0800
Message-ID: <CALCETrWUJ+5DowyLFDp7N_iNLsday4uKX3iO3NMC8Pfqma=O7w@mail.gmail.com>
References: <119170b95d373bc943eb4f16818239bac9fa6c59.1451832667.git.luto@kernel.org>
 <CALCETrVZ23t8u34VtgC+VVQC4PQ0JAw2u27+W_MQiwS=BgMAXQ@mail.gmail.com> <20160112142538.GB11560@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33004 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751587AbcAMW2i convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Jan 2016 17:28:38 -0500
Received: by mail-ob0-f170.google.com with SMTP id is5so67768278obc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jan 2016 14:28:38 -0800 (PST)
In-Reply-To: <20160112142538.GB11560@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>

[cc: Jean Delvare]

On Tue, Jan 12, 2016 at 6:25 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Monday 11 January 2016 13:58:20 Andy Lutomirski wrote:
>> On Sun, Jan 3, 2016 at 6:52 AM, Andy Lutomirski <luto@kernel.org> wr=
ote:
>> > The dmi_walk function maps the DMI table, walks it, and unmaps it.
>> > This means that the dell_bios_hotkey_table that find_hk_type store=
s
>> > points to unmapped memory by the time it gets read.
>> >
>> > I've been able to trigger crashes caused by the stale pointer a
>> > couple of times, but never on a stock kernel.
>> >
>> > Fix it by generating the keymap in the dmi_walk callback instead o=
f
>> > storing a pointer.
>>
>> Quick ping: has anyone had a chance to look at this?
>>
>> --Andy
>>
>
> Hi Andy, I looked at this patch, but I think some people from -mm or =
DMI
> code should look at it as it is memory problem... We also has one in
> dell-laptop.ko (wrong API usage) and so -mm people could know it bett=
er.

Let's ask:

Jean, am I right that drivers must not store pointers to DMI tables
that they find through dmi_walk?  Is there any alternative interface
that could be used to get a longer-lived pointer to DMI tables, or
should drivers just parse them and copy out any info needed from the
dmi_walk callback?

There are at least two platform drivers (dell-wmi and dell-laptop)
that don't play well with the current interface.  This patch is
intended to fix one of them.

--Andy

>
>> >
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
>> > ---
>> >
>> > This seems to work on my laptop.  It applies to platform-drivers-x=
86/for-next.
>> >
>> > drivers/platform/x86/dell-wmi.c | 69 +++++++++++++++++++++++++----=
------------
>> >  1 file changed, 42 insertions(+), 27 deletions(-)
>> >
>> > diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x8=
6/dell-wmi.c
>> > index 57402c4c394e..52db2721d7e3 100644
>> > --- a/drivers/platform/x86/dell-wmi.c
>> > +++ b/drivers/platform/x86/dell-wmi.c
>> > @@ -116,7 +116,10 @@ struct dell_bios_hotkey_table {
>> >
>> >  };
>> >
>> > -static const struct dell_bios_hotkey_table *dell_bios_hotkey_tabl=
e;
>> > +struct dell_dmi_results {
>> > +       int err;
>> > +       struct key_entry *keymap;
>> > +};
>> >
>> >  /* Uninitialized entries here are KEY_RESERVED =3D=3D 0. */
>> >  static const u16 bios_to_linux_keycode[256] __initconst =3D {
>> > @@ -316,20 +319,34 @@ static void dell_wmi_notify(u32 value, void =
*context)
>> >         kfree(obj);
>> >  }
>> >
>> > -static const struct key_entry * __init dell_wmi_prepare_new_keyma=
p(void)
>> > +static void __init handle_dmi_table(const struct dmi_header *dm,
>> > +                                   void *opaque)
>> >  {
>> > -       int hotkey_num =3D (dell_bios_hotkey_table->header.length =
- 4) /
>> > -                               sizeof(struct dell_bios_keymap_ent=
ry);
>> > +       struct dell_dmi_results *results =3D opaque;
>> > +       struct dell_bios_hotkey_table *table;
>> >         struct key_entry *keymap;
>> > -       int i;
>> > +       int hotkey_num, i;
>> > +
>> > +       if (results->err || results->keymap)
>> > +               return;         /* We already found the hotkey tab=
le. */
>> > +
>> > +       if (dm->type !=3D 0xb2 || dm->length <=3D 6)
>> > +               return;
>> > +
>> > +       table =3D container_of(dm, struct dell_bios_hotkey_table, =
header);
>> > +
>> > +       hotkey_num =3D (table->header.length - 4) /
>> > +                               sizeof(struct dell_bios_keymap_ent=
ry);
>> >
>> >         keymap =3D kcalloc(hotkey_num + 1, sizeof(struct key_entry=
), GFP_KERNEL);
>> > -       if (!keymap)
>> > -               return NULL;
>> > +       if (!keymap) {
>> > +               results->err =3D -ENOMEM;
>> > +               return;
>> > +       }
>> >
>> >         for (i =3D 0; i < hotkey_num; i++) {
>> >                 const struct dell_bios_keymap_entry *bios_entry =3D
>> > -                                       &dell_bios_hotkey_table->k=
eymap[i];
>> > +                                       &table->keymap[i];
>> >
>> >                 /* Uninitialized entries are 0 aka KEY_RESERVED. *=
/
>> >                 u16 keycode =3D (bios_entry->keycode <
>> > @@ -358,11 +375,13 @@ static const struct key_entry * __init dell_=
wmi_prepare_new_keymap(void)
>> >
>> >         keymap[hotkey_num].type =3D KE_END;
>> >
>> > -       return keymap;
>> > +       results->err =3D 0;
>> > +       results->keymap =3D keymap;
>> >  }
>> >
>> >  static int __init dell_wmi_input_setup(void)
>> >  {
>> > +       struct dell_dmi_results dmi_results =3D {};
>> >         int err;
>> >
>> >         dell_wmi_input_dev =3D input_allocate_device();
>> > @@ -373,20 +392,26 @@ static int __init dell_wmi_input_setup(void)
>> >         dell_wmi_input_dev->phys =3D "wmi/input0";
>> >         dell_wmi_input_dev->id.bustype =3D BUS_HOST;
>> >
>> > -       if (dell_new_hk_type) {
>> > -               const struct key_entry *keymap =3D dell_wmi_prepar=
e_new_keymap();
>> > -               if (!keymap) {
>> > -                       err =3D -ENOMEM;
>> > -                       goto err_free_dev;
>> > -               }
>> > +       err =3D dmi_walk(handle_dmi_table, &dmi_results);
>> > +       if (err)
>> > +               goto err_free_dev;
>> >
>> > -               err =3D sparse_keymap_setup(dell_wmi_input_dev, ke=
ymap, NULL);
>> > +       if (dmi_results.err) {
>> > +               err =3D dmi_results.err;
>> > +               goto err_free_dev;
>> > +       }
>> > +
>> > +       if (dmi_results.keymap) {
>> > +               dell_new_hk_type =3D true;
>> > +
>> > +               err =3D sparse_keymap_setup(dell_wmi_input_dev,
>> > +                                         dmi_results.keymap, NULL=
);
>> >
>> >                 /*
>> >                  * Sparse keymap library makes a copy of keymap so=
 we
>> >                  * don't need the original one that was allocated.
>> >                  */
>> > -               kfree(keymap);
>> > +               kfree(dmi_results.keymap);
>> >         } else {
>> >                 err =3D sparse_keymap_setup(dell_wmi_input_dev,
>> >                                           dell_wmi_legacy_keymap, =
NULL);
>> > @@ -413,15 +438,6 @@ static void dell_wmi_input_destroy(void)
>> >         input_unregister_device(dell_wmi_input_dev);
>> >  }
>> >
>> > -static void __init find_hk_type(const struct dmi_header *dm, void=
 *dummy)
>> > -{
>> > -       if (dm->type =3D=3D 0xb2 && dm->length > 6) {
>> > -               dell_new_hk_type =3D true;
>> > -               dell_bios_hotkey_table =3D
>> > -                       container_of(dm, struct dell_bios_hotkey_t=
able, header);
>> > -       }
>> > -}
>> > -
>> >  static int __init dell_wmi_init(void)
>> >  {
>> >         int err;
>> > @@ -432,7 +448,6 @@ static int __init dell_wmi_init(void)
>> >                 return -ENODEV;
>> >         }
>> >
>> > -       dmi_walk(find_hk_type, NULL);
>> >         acpi_video =3D acpi_video_get_backlight_type() !=3D acpi_b=
acklight_vendor;
>> >
>> >         err =3D dell_wmi_input_setup();
>> > --
>> > 2.5.0
>> >
>>
>>
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Andy Lutomirski
AMA Capital Management, LLC
