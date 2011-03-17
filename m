From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH] acer-wmi: use pr_<level> for messages
Date: Wed, 16 Mar 2011 19:15:57 -0600
Message-ID: <4D81FB7D0200002300029F1C@novprvlin0050.provo.novell.com>
References: <1300272756-32576-1-git-send-email-jlee@novell.com>
 <20110316164738.GB6974@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20110316164738.GB6974@core.coreip.homeip.net>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dmitry.torokhov@gmail.com
Cc: corentincj@iksaif.net, mjg@redhat.com, carlos@strangeworlds.co.uk, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=B8=89=EF=BC=8C2011-03-16 =E6=96=BC 09:47 -0700=EF=BC=8CDm=
itry Torokhov =E6=8F=90=E5=88=B0=EF=BC=9A
> On Wed, Mar 16, 2011 at 06:52:36PM +0800, Lee, Chun-Yi wrote:
> > acer-wmi: use pr_<level> for messages
> >=20
> > Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
> > Cc: Matthew Garrett <mjg@redhat.com>
> > Cc: Corentin Chary <corentincj@iksaif.net>
> > Cc: Dmitry Torokhov <dtor@mail.ru>
> > Signed-off-by: Lee, Chun-Yi <jlee@novell.com>
>=20
> Looks good, thanks for cleaning this up.
>=20
> Reviewed-by: Dmitry Torokhov <dtor@mail.ru>
>=20

Thank's for Dmitry's review :-)

Joey Lee

> > ---
> >  drivers/platform/x86/acer-wmi.c |   68 ++++++++++++++++-----------=
------------
> >  1 files changed, 28 insertions(+), 40 deletions(-)
> >=20
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86=
/acer-wmi.c
> > index d10b280..1953c70 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -22,6 +22,8 @@
> >   *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  0211=
1-1307  USA
> >   */
> > =20
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/init.h>
> > @@ -47,12 +49,6 @@ MODULE_AUTHOR("Carlos Corbacho");
> >  MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
> >  MODULE_LICENSE("GPL");
> > =20
> > -#define ACER_LOGPREFIX "acer-wmi: "
> > -#define ACER_ERR KERN_ERR ACER_LOGPREFIX
> > -#define ACER_NOTICE KERN_NOTICE ACER_LOGPREFIX
> > -#define ACER_INFO KERN_INFO ACER_LOGPREFIX
> > -#define ACER_WARNING KERN_WARNING ACER_LOGPREFIX
> > -
> >  /*
> >   * Magic Number
> >   * Meaning is unknown - this number is required for writing to ACP=
I for AMW0
> > @@ -846,7 +842,7 @@ static void type_aa_dmi_decode(const struct dmi=
_header *header, void *dummy)
> >  	has_type_aa =3D true;
> >  	type_aa =3D (struct hotkey_function_type_aa *) header;
> > =20
> > -	printk(ACER_INFO "Function bitmap for Communication Button: 0x%x\=
n",
> > +	pr_info("Function bitmap for Communication Button: 0x%x\n",
> >  		type_aa->commun_func_bitmap);
> > =20
> >  	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_WIRELESS)
> > @@ -1036,7 +1032,7 @@ static int __devinit acer_backlight_init(stru=
ct device *dev)
> >  	bd =3D backlight_device_register("acer-wmi", dev, NULL, &acer_bl_=
ops,
> >  				       &props);
> >  	if (IS_ERR(bd)) {
> > -		printk(ACER_ERR "Could not register Acer backlight device\n");
> > +		pr_err("Could not register Acer backlight device\n");
> >  		acer_backlight_device =3D NULL;
> >  		return PTR_ERR(bd);
> >  	}
> > @@ -1083,8 +1079,7 @@ static acpi_status wmid3_get_device_status(u3=
2 *value, u16 device)
> >  		return AE_ERROR;
> >  	}
> >  	if (obj->buffer.length !=3D 8) {
> > -		printk(ACER_WARNING "Unknown buffer length %d\n",
> > -			obj->buffer.length);
> > +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> >  		kfree(obj);
> >  		return AE_ERROR;
> >  	}
> > @@ -1093,7 +1088,7 @@ static acpi_status wmid3_get_device_status(u3=
2 *value, u16 device)
> >  	kfree(obj);
> > =20
> >  	if (return_value.error_code || return_value.ec_return_value)
> > -		printk(ACER_WARNING "Get Device Status failed: "
> > +		pr_warning("Get Device Status failed: "
> >  			"0x%x - 0x%x\n", return_value.error_code,
> >  			return_value.ec_return_value);
> >  	else
> > @@ -1309,7 +1304,7 @@ static void acer_wmi_notify(u32 value, void *=
context)
> > =20
> >  	status =3D wmi_get_event_data(value, &response);
> >  	if (status !=3D AE_OK) {
> > -		printk(ACER_WARNING "bad event status 0x%x\n", status);
> > +		pr_warning("bad event status 0x%x\n", status);
> >  		return;
> >  	}
> > =20
> > @@ -1318,14 +1313,12 @@ static void acer_wmi_notify(u32 value, void=
 *context)
> >  	if (!obj)
> >  		return;
> >  	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> > -		printk(ACER_WARNING "Unknown response received %d\n",
> > -			obj->type);
> > +		pr_warning("Unknown response received %d\n", obj->type);
> >  		kfree(obj);
> >  		return;
> >  	}
> >  	if (obj->buffer.length !=3D 8) {
> > -		printk(ACER_WARNING "Unknown buffer length %d\n",
> > -			obj->buffer.length);
> > +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> >  		kfree(obj);
> >  		return;
> >  	}
> > @@ -1337,11 +1330,11 @@ static void acer_wmi_notify(u32 value, void=
 *context)
> >  	case WMID_HOTKEY_EVENT:
> >  		if (!sparse_keymap_report_event(acer_wmi_input_dev,
> >  				return_value.key_num, 1, true))
> > -			printk(ACER_WARNING "Unknown key number - 0x%x\n",
> > +			pr_warning("Unknown key number - 0x%x\n",
> >  				return_value.key_num);
> >  		break;
> >  	default:
> > -		printk(ACER_WARNING "Unknown function number - %d - %d\n",
> > +		pr_warning("Unknown function number - %d - %d\n",
> >  			return_value.function, return_value.key_num);
> >  		break;
> >  	}
> > @@ -1370,8 +1363,7 @@ wmid3_set_lm_mode(struct lm_input_params *par=
ams,
> >  		return AE_ERROR;
> >  	}
> >  	if (obj->buffer.length !=3D 4) {
> > -		printk(ACER_WARNING "Unknown buffer length %d\n",
> > -		       obj->buffer.length);
> > +		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> >  		kfree(obj);
> >  		return AE_ERROR;
> >  	}
> > @@ -1396,11 +1388,11 @@ static int acer_wmi_enable_ec_raw(void)
> >  	status =3D wmid3_set_lm_mode(&params, &return_value);
> > =20
> >  	if (return_value.error_code || return_value.ec_return_value)
> > -		printk(ACER_WARNING "Enabling EC raw mode failed: "
> > +		pr_warning("Enabling EC raw mode failed: "
> >  		       "0x%x - 0x%x\n", return_value.error_code,
> >  		       return_value.ec_return_value);
> >  	else
> > -		printk(ACER_INFO "Enabled EC raw mode");
> > +		pr_info("Enabled EC raw mode");
> > =20
> >  	return status;
> >  }
> > @@ -1419,7 +1411,7 @@ static int acer_wmi_enable_lm(void)
> >  	status =3D wmid3_set_lm_mode(&params, &return_value);
> > =20
> >  	if (return_value.error_code || return_value.ec_return_value)
> > -		printk(ACER_WARNING "Enabling Launch Manager failed: "
> > +		pr_warning("Enabling Launch Manager failed: "
> >  		       "0x%x - 0x%x\n", return_value.error_code,
> >  		       return_value.ec_return_value);
> > =20
> > @@ -1636,7 +1628,7 @@ static int create_debugfs(void)
> >  {
> >  	interface->debug.root =3D debugfs_create_dir("acer-wmi", NULL);
> >  	if (!interface->debug.root) {
> > -		printk(ACER_ERR "Failed to create debugfs directory");
> > +		pr_err("Failed to create debugfs directory");
> >  		return -ENOMEM;
> >  	}
> > =20
> > @@ -1657,11 +1649,10 @@ static int __init acer_wmi_init(void)
> >  {
> >  	int err;
> > =20
> > -	printk(ACER_INFO "Acer Laptop ACPI-WMI Extras\n");
> > +	pr_info("Acer Laptop ACPI-WMI Extras\n");
> > =20
> >  	if (dmi_check_system(acer_blacklist)) {
> > -		printk(ACER_INFO "Blacklisted hardware detected - "
> > -				"not loading\n");
> > +		pr_info("Blacklisted hardware detected - not loading\n");
> >  		return -ENODEV;
> >  	}
> > =20
> > @@ -1678,12 +1669,11 @@ static int __init acer_wmi_init(void)
> > =20
> >  	if (wmi_has_guid(WMID_GUID2) && interface) {
> >  		if (ACPI_FAILURE(WMID_set_capabilities())) {
> > -			printk(ACER_ERR "Unable to detect available WMID "
> > -					"devices\n");
> > +			pr_err("Unable to detect available WMID devices\n");
> >  			return -ENODEV;
> >  		}
> >  	} else if (!wmi_has_guid(WMID_GUID2) && interface) {
> > -		printk(ACER_ERR "No WMID device detection method found\n");
> > +		pr_err("No WMID device detection method found\n");
> >  		return -ENODEV;
> >  	}
> > =20
> > @@ -1691,8 +1681,7 @@ static int __init acer_wmi_init(void)
> >  		interface =3D &AMW0_interface;
> > =20
> >  		if (ACPI_FAILURE(AMW0_set_capabilities())) {
> > -			printk(ACER_ERR "Unable to detect available AMW0 "
> > -					"devices\n");
> > +			pr_err("Unable to detect available AMW0 devices\n");
> >  			return -ENODEV;
> >  		}
> >  	}
> > @@ -1701,8 +1690,7 @@ static int __init acer_wmi_init(void)
> >  		AMW0_find_mailled();
> > =20
> >  	if (!interface) {
> > -		printk(ACER_INFO "No or unsupported WMI interface, unable to "
> > -				"load\n");
> > +		pr_err("No or unsupported WMI interface, unable to load\n");
> >  		return -ENODEV;
> >  	}
> > =20
> > @@ -1710,22 +1698,22 @@ static int __init acer_wmi_init(void)
> > =20
> >  	if (acpi_video_backlight_support() && has_cap(ACER_CAP_BRIGHTNESS=
)) {
> >  		interface->capability &=3D ~ACER_CAP_BRIGHTNESS;
> > -		printk(ACER_INFO "Brightness must be controlled by "
> > +		pr_info("Brightness must be controlled by "
> >  		       "generic video driver\n");
> >  	}
> > =20
> >  	if (wmi_has_guid(WMID_GUID3)) {
> >  		if (ec_raw_mode) {
> >  			if (ACPI_FAILURE(acer_wmi_enable_ec_raw())) {
> > -				printk(ACER_ERR "Cannot enable EC raw mode\n");
> > +				pr_err("Cannot enable EC raw mode\n");
> >  				return -ENODEV;
> >  			}
> >  		} else if (ACPI_FAILURE(acer_wmi_enable_lm())) {
> > -			printk(ACER_ERR "Cannot enable Launch Manager mode\n");
> > +			pr_err("Cannot enable Launch Manager mode\n");
> >  			return -ENODEV;
> >  		}
> >  	} else if (ec_raw_mode) {
> > -		printk(ACER_INFO "No WMID EC raw mode enable method\n");
> > +		pr_info("No WMID EC raw mode enable method\n");
> >  	}
> > =20
> >  	if (wmi_has_guid(ACERWMID_EVENT_GUID)) {
> > @@ -1736,7 +1724,7 @@ static int __init acer_wmi_init(void)
> > =20
> >  	err =3D platform_driver_register(&acer_platform_driver);
> >  	if (err) {
> > -		printk(ACER_ERR "Unable to register platform driver.\n");
> > +		pr_err("Unable to register platform driver.\n");
> >  		goto error_platform_register;
> >  	}
> > =20
> > @@ -1791,7 +1779,7 @@ static void __exit acer_wmi_exit(void)
> >  	platform_device_unregister(acer_platform_device);
> >  	platform_driver_unregister(&acer_platform_driver);
> > =20
> > -	printk(ACER_INFO "Acer Laptop WMI Extras unloaded\n");
> > +	pr_info("Acer Laptop WMI Extras unloaded\n");
> >  	return;
> >  }
> > =20
> > --=20
> > 1.6.0.2
> >=20
>=20
