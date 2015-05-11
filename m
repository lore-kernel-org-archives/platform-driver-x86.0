From: Darren Hart <dvhart@infradead.org>
Subject: Re: [RFC v3] asus-wmi: add fan control
Date: Mon, 11 May 2015 10:55:55 -0700
Message-ID: <20150511175555.GB40110@vmdeb7>
References: <cover.1429653764.git.kastbernd@gmx.de>
 <20150510211238.GA30082@ASUS-Bernd>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150510211238.GA30082@ASUS-Bernd>
Sender: linux-kernel-owner@vger.kernel.org
To: Kast Bernd <kastbernd@gmx.de>
Cc: corentin.chary@gmail.com, Matthew Garrett <mjg59@srcf.ucam.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, May 10, 2015 at 11:12:38PM +0200, Kast Bernd wrote:
> This patch is partially based on Felipe Contrera's earlier patch, tha=
t
> was discussed here: https://lkml.org/lkml/2013/10/8/800
> Some problems of that patch are solved, now:
>=20
> 1) The main obstacle for the earlier patch seemed to be the use of
> virt_to_phys, which is accepted, now
>=20
> 2) random memory corruption occurred on my notebook, thus DMA-able me=
mory
> is allocated now, which solves this problem
>=20
> 3) hwmon interface is used instead of the thermal interface, as a
> hwmon device is already set up by this driver and seemed more
> appropriate than the thermal interface
>=20
> 4) Calling the ACPI-functions was modularized thus it's possible to c=
all
> some multifunctions easily, now (by using
> asus_wmi_evaluate_method_agfn).
>=20
> Unfortunately the WMI doesn't support controlling both fans on
> a dual-fan notebook because of an restriction in the acpi-method
> "SFNS", that is callable through the wmi. If "SFNV" would be called
> directly even dual fan configurations could be controlled, but not by=
 using
> wmi.
>=20
> Speed readings only work on auto-mode, thus "-1" will be reported in
> manual mode.
> Additionally the speed readings are reported as hundreds of RPM thus
> they are not too precise.
>=20
> This patch is tested only on one notebook (N551JK) but a similar modu=
le,
> that contained some code to try to control the second fan also, was
> reported to work on an UX32VD, at least for the first fan.
>=20
> As Felipe already mentioned the low-level functions are described her=
e:
> http://forum.notebookreview.com/threads/fan-control-on-asus-prime-ux3=
1-ux31a-ux32a-ux32vd.705656/
>=20
> Signed-off-by: Kast Bernd <kastbernd@gmx.de>
> Cc: Corentin Chary <corentin.chary@gmail.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>

Hi Kast,

Seeing a build warning on my merge:

C      drivers/platform/x86/asus-wmi.o
drivers/platform/x86/asus-wmi.c: In function =E2=80=98pwm1_enable_store=
=E2=80=99:
drivers/platform/x86/asus-wmi.c:1279:2: warning: ignoring return value =
of =E2=80=98kstrtouint=E2=80=99, declared with attribute warn_unused_re=
sult [-Wunused-result]
  kstrtouint(buf, 10, &state);
  ^
drivers/platform/x86/asus-wmi.c: In function =E2=80=98pwm1_store=E2=80=99=
:
drivers/platform/x86/asus-wmi.c:1237:2: warning: ignoring return value =
of =E2=80=98kstrtouint=E2=80=99, declared with attribute warn_unused_re=
sult [-Wunused-result]
  kstrtouint(buf, 10, &value);

Please be sure to watch for newly introduced warnings in the build befo=
re
submitting patches.

Also, missed two nits below which I'm bringing up mostly because you wi=
ll need
to respin to fix the warning above anyway.

> Changes for v3:
> 	suggested by Darren Hart:
> 		- changed formating of multi-line comment blocks
> 		- changed return paths
> 		- changed confusing variable name
> Changes for v2:
>         suggested by Darren Hart:
>                 - variable ordering from longest to shortest
>                 - fail label removed in asus_wmi_evaluate_method_agfn
>                 - removed unnecessary ternary operator
>                 - used NULL instead of 0
>                 - used DEVICE_ATTR_(RO|RW)
>         suggested by Corentin Chary:
>                 - asus_hwmon_agfn_fan_speed split to two functions
>                 - added some logging
>                 - used existing function to clamp values
>         suggested by both:
>                 - updated comments
>                 - tried to return proper error codes
>                 - removed some magic numbers
> I'm really sorry, that there are that many style issues in my code.=20
> Thank you, that you spent your time reviewing it, nevertheless.
>=20
>  drivers/platform/x86/asus-wmi.c | 331 ++++++++++++++++++++++++++++++=
+++++++---
>  1 file changed, 310 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 7543a56..c134b84 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -78,6 +78,7 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_METHODID_GPID		0x44495047 /* Get Panel ID?? (Resol)=
 */
>  #define ASUS_WMI_METHODID_QMOD		0x444F4D51 /* Quiet MODe */
>  #define ASUS_WMI_METHODID_SPLV		0x4C425053 /* Set Panel Light Value =
*/
> +#define ASUS_WMI_METHODID_AGFN		0x4E464741 /* FaN? */
>  #define ASUS_WMI_METHODID_SFUN		0x4E554653 /* FUNCtionalities */
>  #define ASUS_WMI_METHODID_SDSP		0x50534453 /* Set DiSPlay output */
>  #define ASUS_WMI_METHODID_GDSP		0x50534447 /* Get DiSPlay output */
> @@ -150,12 +151,39 @@ MODULE_LICENSE("GPL");
>  #define ASUS_WMI_DSTS_BRIGHTNESS_MASK	0x000000FF
>  #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
> =20
> +#define ASUS_FAN_DESC			"cpu_fan"
> +#define ASUS_FAN_MFUN			0x13
> +#define ASUS_FAN_SFUN_READ		0x06
> +#define ASUS_FAN_SFUN_WRITE		0x07
> +#define ASUS_FAN_CTRL_MANUAL		1
> +#define ASUS_FAN_CTRL_AUTO		2
> +
> +
>  struct bios_args {
>  	u32 arg0;
>  	u32 arg1;
>  } __packed;
> =20
>  /*
> + * Struct that's used for all methods called via AGFN. Naming is
> + * identically to the AML code.
> + */
> +struct agfn_args {
> +	u16 mfun; /* probably "Multi-function" to be called */
> +	u16 sfun; /* probably "Sub-function" to be called */
> +	u16 len;  /* size of the hole struct, including subfunction fields =
*/
> +	u8 stas;  /* not used by now */
> +	u8 err;   /* zero on success */
> +} __packed;
> +
> +/* struct used for calling fan read and write methods */
> +struct fan_args {
> +	struct agfn_args agfn;	/* common fields */
> +	u8 fan;			/* fan number: 0: set auto mode 1: 1st fan */
> +	u32 speed;		/* read: RPM/100 - write: 0-255 */
> +} __packed;
> +
> +/*
>   * <platform>/    - debugfs root directory
>   *   dev_id      - current dev_id
>   *   ctrl_param  - current ctrl_param
> @@ -204,6 +232,10 @@ struct asus_wmi {
>  	struct asus_rfkill gps;
>  	struct asus_rfkill uwb;
> =20
> +	int asus_hwmon_pwm;
> +	int asus_hwmon_num_fans;
> +	bool asus_hwmon_fan_manual_mode;

Declare in order of decreasing line length please:

	bool asus_hwmon_fan_manual_mode;
	int asus_hwmon_num_fans;
	int asus_hwmon_pwm;

> +
>  	struct hotplug_slot *hotplug_slot;
>  	struct mutex hotplug_lock;
>  	struct mutex wmi_lock;
> @@ -294,6 +326,35 @@ exit:
>  	return 0;
>  }
> =20
> +static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer ar=
gs)
> +{
> +	struct acpi_buffer input;
> +	u64 phys_addr;
> +	u32 retval;
> +	u32 status =3D -1;
> +
> +	/* Copy to dma capable address otherwise memory corruption occurs a=
s
> +	 * bios has to be able to access it.
> +	 */

Multiline comment blocks should have an empty /* line to start:

/*
 * First line.
 * Second line.
 */

See CodingStyle:Chapter 8:Commenting

Thanks,

--=20
Darren Hart
Intel Open Source Technology Center
