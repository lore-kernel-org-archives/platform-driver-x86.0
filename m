From: =?ISO-8859-1?Q?Marco_Kr=FCger?= <krgsch@gmail.com>
Subject: Re: sony-laptop crash (Sony VPC SE 1V9E) for 3.8.0+
Date: Sun, 22 Sep 2013 08:47:50 +0200
Message-ID: <523E9296.2000303@gmail.com>
References: <51FE2F39.4080504@gmail.com> <20130804221454.GB7707@kamineko.org> <51FEF199.7050800@gmail.com> <20130808221742.GA27435@kamineko.org> <523E1206.8080001@gmail.com> <20130922031001.GA6901@kamineko.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bk0-f52.google.com ([209.85.214.52]:48679 "EHLO
	mail-bk0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752466Ab3IVGqr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 22 Sep 2013 02:46:47 -0400
Received: by mail-bk0-f52.google.com with SMTP id e11so727048bkh.25
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Sep 2013 23:46:45 -0700 (PDT)
In-Reply-To: <20130922031001.GA6901@kamineko.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mattia Dongili <malattia@linux.it>
Cc: platform-driver-x86@vger.kernel.org

The patch works as expected.
=2E..
[   49.590035] sony_laptop: Sony Notebook Control Driver v0.6
[   49.590104] input: Sony Vaio Keys as=20
/devices/LNXSYSTM:00/device:00/PNP0A08:00/device:01/SNY5001:00/input/in=
put8
[   49.590162] input: Sony Vaio Jogdial as=20
/devices/LNXSYSTM:00/device:00/PNP0A08:00/device:01/SNY5001:00/input/in=
put9
[   49.595169] sony_laptop: handle 0x014b: keyboard backlight setup=20
already done for 0x0143
[   49.595174] sony_laptop: couldn't set up keyboard backlight function=
=20
(-16)
[   49.595255] sony_laptop: brightness ignored, must be controlled by=20
ACPI video driver
=2E..

Issues left:
a)  The wrong gfx switch reading as mentioned in my last mail.

b) Different mapping for timeout settings:
Modinfo gives me:
"parm: kbd_backlight_timeout:set this to 0 to set the default 10 second=
s=20
timeout, 1 for 30 seconds, 2 for 60 seconds and 3 to disable timeout=20
(default: 0) (int)"

My mapping is: 0 -> disabled, 1-> 10 seconds, 2-> 30 seconds, 3 -> 60=20
seconds

thx

Am 22.09.2013 05:10, schrieb Mattia Dongili:
> On Sat, Sep 21, 2013 at 11:39:18PM +0200, Marco Kr=FCger wrote:
>> Hi Mattia,
>>
>> you are right!
>> If I comment out either one case  (0x0143/0x014b) no crash occurs. I
>> also recognized that the gfx switch value is wrong. Using the gfx
>> switch toggles the value, but it is the opposite to the actual
>> switch position. What can I do to help you solving this bug?
> apologies, this issue flew off my radar and I essentially forgot abou=
t
> it.
> I had prepared this patch back then, could you see if it also works?
>
> I think these checks should be extended to all handles not just the
> keyboard backlight one but that's a bigger patch.
>
> ---
> commit 0fcf192e1bdd396cb510bed918ee6c450396c8e4
> Author: Mattia Dongili <malattia@linux.it>
> Date:   Sun Aug 18 19:32:08 2013 +0900
>
>      sony-laptop: warn on multiple KBD backlight handles
>     =20
>      Some BIOS versions/Vaio models apparently ship with two nearly i=
dentical
>      functions to handle backlight related controls.
>      The only difference seems to be:
>              If (LEqual (BUF1, 0x40))
>              {
>                  Store (0x40, P80H)
>                  Store (BUF2, Local0)
>      -           And (Local0, One, Local0)
>      +           And (Local0, 0x03, Local0)
>                  Store (Local0, ^^H_EC.KLPC)
>              }
>     =20
>      Avoid erroring out on initialization and messing things up on cl=
eanup
>      for now since we never call into those methods with anything dif=
ferent
>      than 1 or 0.
>      This issue was found on a Sony VPCSE1V9E/BIOS R2087H4.
>     =20
>      Cc: Marco Kr=FCger <krgsch@gmail.com>
>      Signed-off-by: Mattia Dongili <malattia@linux.it>
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x8=
6/sony-laptop.c
> index 3a1b6bf..b5a7f3c 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -146,7 +146,8 @@ static void sony_nc_thermal_resume(void);
>   #endif
>   static int sony_nc_kbd_backlight_setup(struct platform_device *pd,
>   		unsigned int handle);
> -static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd=
);
> +static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd=
,
> +		unsigned int handle);
>  =20
>   static int sony_nc_battery_care_setup(struct platform_device *pd,
>   		unsigned int handle);
> @@ -1448,7 +1449,7 @@ static void sony_nc_function_cleanup(struct pla=
tform_device *pd)
>   		case 0x014b:
>   		case 0x014c:
>   		case 0x0163:
> -			sony_nc_kbd_backlight_cleanup(pd);
> +			sony_nc_kbd_backlight_cleanup(pd, handle);
>   			break;
>   		default:
>   			continue;
> @@ -1829,6 +1830,12 @@ static int sony_nc_kbd_backlight_setup(struct =
platform_device *pd,
>   	int result;
>   	int ret =3D 0;
>  =20
> +	if (kbdbl_ctl) {
> +		pr_warn("handle 0x%.4x: keyboard backlight setup already done for =
0x%.4x\n",
> +				handle, kbdbl_ctl->handle);
> +		return -EBUSY;
> +	}
> +
>   	/* verify the kbd backlight presence, these handles are not used f=
or
>   	 * keyboard backlight only
>   	 */
> @@ -1886,9 +1893,10 @@ outkzalloc:
>   	return ret;
>   }
>  =20
> -static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd=
)
> +static void sony_nc_kbd_backlight_cleanup(struct platform_device *pd=
,
> +		unsigned int handle)
>   {
> -	if (kbdbl_ctl) {
> +	if (kbdbl_ctl && handle =3D=3D kbdbl_ctl->handle) {
>   		int result;
>  =20
>   		device_remove_file(&pd->dev, &kbdbl_ctl->mode_attr);
