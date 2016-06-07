From: Lyude Paul <cpaul@redhat.com>
Subject: Re: [ibm-acpi-devel] [PATCH] thinkpad_acpi: Add support for HKEY
 version 0x200
Date: Tue, 07 Jun 2016 17:10:51 -0400
Message-ID: <1465333851.7166.46.camel@redhat.com>
References: <1465318938.7166.23.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52673 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932631AbcFGVKy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 7 Jun 2016 17:10:54 -0400
In-Reply-To: <1465318938.7166.23.camel@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "ibm-acpi-devel@lists.sourceforge.net" <ibm-acpi-devel@lists.sourceforge.net>, Dennis Wassenberg <dennis.wassenberg@secunet.com>
Cc: Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

Managed to find someone in the office with one of these laptops and it =
looks
like the adaptive keyboard works perfectly with this patch, so I can gi=
ve my t-
b:

	Tested-by: Lyude Paul <cpaul@redhat.com>

Cheers,
	Lyude

On Tue, 2016-06-07 at 13:02 -0400, Lyude Paul wrote:
> Since nothing's really happened with this patch for a while I figured=
 I'd take
> over trying to get this upstream.
>=20
> Regarding testing: This seems to work fine on the 60 series laptops, =
and works
> fine on previous generations. The one thing I haven't been able to te=
st is an
> X1
> carbon with an adaptive keyboard since I don't seem to have one readi=
ly
> available here. I'm doing a search around the office to try to find s=
omeone
> who
> didn't throw theirs away yet so hopefully I should be able to get bac=
k to you
> on
> that soon.
>=20
> To Dennis: I took the liberty of doing a review of your patch and som=
e
> testing.
> There's a few things that need changing, I've outlined them below: (f=
or the
> future, it's recommended to send patches for the kernel inline in ema=
ils to
> make
> them easier to review).
>=20
> >=20
> > From 8a67f5db1d2918c46b7fa2168e3d0aab2ba92731 Mon Sep 17 00:00:00 2=
001
> > From: Dennis Wassenberg <dennis.wassenberg@secunet.com>
> > Date: Wed, 13 Apr 2016 13:46:55 +0200
> > Subject: [PATCH] thinkpad_acpi: Add support for HKEY version 0x200
> >=20
> > Lenovo Thinkpad devices T460, T460s, T460p, T560, X260 use
> > HKEY version 0x200 without adaptive keyboard.
> >=20
> > HKEY version 0x200 has method MHKA with one parameter value.
> > Passing parameter value 1 will get hotkey_all_mask (the same like
> > HKEY version 0x100 without parameter). Passing parameter value 2 to
> > MHKA method will retrieve hotkey_all_adaptive_mask. If 0 is returne=
d in
> > that case there is no adaptive keyboard available.
> >=20
> > Signed-off-by: Dennis Wassenberg <dennis.wassenberg@secunet.com>
> > ---
> > =C2=A0drivers/platform/x86/thinkpad_acpi.c | 88 +++++++++++++++++++=
+++++++-------
> > --
> > -
> > =C2=A01 file changed, 64 insertions(+), 24 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/thinkpad_acpi.c
> > b/drivers/platform/x86/thinkpad_acpi.c
> > index a268a7a..0e72857 100644
> > --- a/drivers/platform/x86/thinkpad_acpi.c
> > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > @@ -2043,6 +2043,7 @@ static int hotkey_autosleep_ack;
> > =C2=A0
> > =C2=A0static u32 hotkey_orig_mask;		/* events the BIOS had enabled
> > */
> > =C2=A0static u32 hotkey_all_mask;		/* all events supported in fw */
> > +static u32 hotkey_adaptive_all_mask;	/* all adaptive events
> > supported
> > in fw */
> > =C2=A0static u32 hotkey_reserved_mask;	/* events better left disabl=
ed */
> > =C2=A0static u32 hotkey_driver_mask;		/* events needed by the
> > driver
> > */
> > =C2=A0static u32 hotkey_user_mask;		/* events visible to userspace
> > */
> > @@ -2742,6 +2743,17 @@ static ssize_t hotkey_all_mask_show(struct d=
evice
> > *dev,
> > =C2=A0
> > =C2=A0static DEVICE_ATTR_RO(hotkey_all_mask);
> > =C2=A0
> > +/* sysfs hotkey all_mask -----------------------------------------=
------ */
> > +static ssize_t hotkey_adaptive_all_mask_show(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > +			=C2=A0=C2=A0=C2=A0char *buf)
> > +{
> > +	return snprintf(buf, PAGE_SIZE, "0x%08x\n",
> > +				hotkey_adaptive_all_mask |
> > hotkey_source_mask);
> Make sure when you're indent function calls that split like this onto=
 another
> line you indent it like this:
>=20
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 return snprintf(buf, PAGE_SIZE, "0x%08x\n=
",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 hotkey_adaptive_all_mask | hotkey_source_mask);
>=20
> So that "hotkey_adaptive_all_mask" starts on the column after the sta=
rting
> paranthesis.
> 		=09
> >=20
> > +}
> > +
> > +static DEVICE_ATTR_RO(hotkey_adaptive_all_mask);
> > +
> > =C2=A0/* sysfs hotkey recommended_mask ----------------------------=
----------- */
> > =C2=A0static ssize_t hotkey_recommended_mask_show(struct device *de=
v,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0struct device_attribute *attr,
> > @@ -2985,6 +2997,7 @@ static struct attribute *hotkey_attributes[]
> > __initdata
> > =3D {
> > =C2=A0	&dev_attr_wakeup_hotunplug_complete.attr,
> > =C2=A0	&dev_attr_hotkey_mask.attr,
> > =C2=A0	&dev_attr_hotkey_all_mask.attr,
> > +	&dev_attr_hotkey_adaptive_all_mask.attr,
> > =C2=A0	&dev_attr_hotkey_recommended_mask.attr,
> > =C2=A0#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
> > =C2=A0	&dev_attr_hotkey_source_mask.attr,
> > @@ -3321,20 +3334,6 @@ static int __init hotkey_init(struct ibm_ini=
t_struct
> > *iibm)
> > =C2=A0	if (!tp_features.hotkey)
> > =C2=A0		return 1;
> > =C2=A0
> > -	/*
> > -	=C2=A0* Check if we have an adaptive keyboard, like on the
> > -	=C2=A0* Lenovo Carbon X1 2014 (2nd Gen).
> > -	=C2=A0*/
> > -	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
> > -		if ((hkeyv >> 8) =3D=3D 2) {
> > -			tp_features.has_adaptive_kbd =3D true;
> > -			res =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> > -					&adaptive_kbd_attr_group);
> > -			if (res)
> > -				goto err_exit;
> > -		}
> > -	}
> > -
> > =C2=A0	quirks =3D tpacpi_check_quirks(tpacpi_hotkey_qtable,
> > =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ARRAY_SIZE(tpacpi_hotkey_qt=
able));
> > =C2=A0
> > @@ -3357,30 +3356,71 @@ static int __init hotkey_init(struct ibm_in=
it_struct
> > *iibm)
> > =C2=A0	=C2=A0=C2=A0=C2=A0A30, R30, R31, T20-22, X20-21, X22-24.=C2=A0=
=C2=A0Detected by checking
> > =C2=A0	=C2=A0=C2=A0=C2=A0for HKEY interface version 0x100 */
> > =C2=A0	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
> > -		if ((hkeyv >> 8) !=3D 1) {
> > -			pr_err("unknown version of the HKEY interface:
> > 0x%x\n",
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hkeyv);
> > -			pr_err("please report this to %s\n", TPACPI_MAIL);
> > -		} else {
> > +		vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> > +			"firmware HKEY interface version: 0x%x\n",
> > +			hkeyv);
> The indenting here wasn't correct to begin with, but since we're chan=
ging it
> we
> might as well fix it.
>=20
> >=20
> > +		switch (hkeyv >> 8) {
> > +		case 1:
> > =C2=A0			/*
> > =C2=A0			=C2=A0* MHKV 0x100 in A31, R40, R40e,
> > =C2=A0			=C2=A0* T4x, X31, and later
> > =C2=A0			=C2=A0*/
> > -			vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_HKEY,
> > -				"firmware HKEY interface version: 0x%x\n",
> > -				hkeyv);
> > =C2=A0
> > =C2=A0			/* Paranoia check AND init hotkey_all_mask */
> > =C2=A0			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
> > =C2=A0					"MHKA", "qd")) {
> > =C2=A0				pr_err("missing MHKA handler, "
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"please report this =
to %s\n",
> > -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TPACPI_MAIL);
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"please report=
 this to %s\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0TPACPI_MAIL);
> The indenting here doesn't need to be changed
>=20
> >=20
> > +				/* Fallback: pre-init for FN+F3,F4,F12 */
> > +				hotkey_all_mask =3D 0x080cU;
> > +			} else {
> > +				tp_features.hotkey_mask =3D 1;
> > +			}
> > +			break;
> > +
> > +		case 2:
> > +			/*
> > +			=C2=A0* MHKV 0x200 in X1, T460s, X260, T560, X1 Tablet
> > (2016)
> > +			=C2=A0*/
> > +
> > +			/* Paranoia check AND init hotkey_all_mask */
> > +			if (!acpi_evalf(hkey_handle, &hotkey_all_mask,
> > +				"MHKA", "dd", 1)) {
> > +				pr_err("missing MHKA handler, "
> > +					"please report this to %s\n",
> > +					TPACPI_MAIL);
> This indenting needs to be fixed as well
>=20
> Once all those fixes are made and I get that extra testing done we sh=
ould be
> ablew to send it upstream, assuming it doesn't break the X1=E2=80=A6
>=20
> Cheers,
> 	Lyude
>=20
> >=20
> > =C2=A0				/* Fallback: pre-init for FN+F3,F4,F12 */
> > =C2=A0				hotkey_all_mask =3D 0x080cU;
> > =C2=A0			} else {
> > =C2=A0				tp_features.hotkey_mask =3D 1;
> > =C2=A0			}
> > +
> > +			/*
> > +			=C2=A0* Check if we have an adaptive keyboard, like on
> > the
> > +			=C2=A0* Lenovo Carbon X1 2014 (2nd Gen).
> > +			=C2=A0*/
> > +			if
> > (acpi_evalf(hkey_handle,&hotkey_adaptive_all_mask,
> > +				"MHKA", "dd", 2)) {
> Indentation needs to be fixed here as well
>=20
> >=20
> > +				if (hotkey_adaptive_all_mask !=3D 0) {
> > +					tp_features.has_adaptive_kbd =3D
> > true;
> > +					res =3D sysfs_create_group(
> > +						&tpacpi_pdev->dev.kobj,
> > +						&adaptive_kbd_attr_group);
> > +					if (res)
> > +						goto err_exit;
> > +				}
> > +			} else {
> > +				tp_features.has_adaptive_kbd =3D false;
> > +				hotkey_adaptive_all_mask =3D 0x0U;
> > +			}
> > +			break;
> > +
> > +		default:
> > +			pr_err("unknown version of the HKEY interface:
> > 0x%x\n",
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hkeyv);
> > +			pr_err("please report this to %s\n", TPACPI_MAIL);
> > +			break;
> > =C2=A0		}
> > =C2=A0	}
> > =C2=A0
> > --=C2=A0
> > 2.1.4
> ---------------------------------------------------------------------=
---------
> What NetFlow Analyzer can do for you? Monitors network bandwidth and =
traffic
> patterns at an interface-level. Reveals which users, apps, and protoc=
ols are=C2=A0
> consuming the most bandwidth. Provides multi-vendor support for NetFl=
ow,=C2=A0
> J-Flow, sFlow and other flows. Make informed decisions using capacity=
=C2=A0
> planning reports. https://ad.doubleclick.net/ddm/clk/305295220;132659=
582;e
> _______________________________________________
> ibm-acpi-devel mailing list
> ibm-acpi-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel
