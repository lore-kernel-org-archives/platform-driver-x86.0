From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Do not load on Asus T100TA and
 T200TA
Date: Fri, 8 May 2020 21:54:29 +0200
Message-ID: <bcb4d40a-8971-22d6-959b-14b2d329cfd4@redhat.com>
References: <20200422220559.99726-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200422220559.99726-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Corentin Chary <corentin.chary@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

On 4/23/20 12:05 AM, Hans de Goede wrote:
> asus-nb-wmi does not add any extra functionality on these Asus
> Transformer books. They have detachable keyboards, so the hotkeys are
> send through a HID device (and handled by the hid-asus driver) and also
> the rfkill functionality is not used on these devices.
> 
> Besides not adding any extra functionality, initializing the WMI interface
> on these devices actually has a negative side-effect. For some reason
> the \_SB.ATKD.INIT() function which asus_wmi_platform_init() calls drives
> GPO2 (INT33FC:02) pin 8, which is connected to the front facing webcam LED,
> high and there is no (WMI or other) interface to drive this low again
> causing the LED to be permanently on, even during suspend.
> 
> This commit adds a blacklist of DMI system_ids on which not to load the
> asus-nb-wmi and adds these Transformer books to this list. This fixes
> the webcam LED being permanently on under Linux.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Because of the BYT/CHT work which I do as a side project I have a bunch
of BYT/CHT based 2-in-1s as test devices, including the T100TA and T200TA.

So recently I've been looking into properly reporting SW_TABLET_MODE
state to userspace to let userspace know if the keyboard of these
detachables is attached or not; and guess what, the Asus models
report this through WMI. So blacklisting is not the right thing to do
here after all :|  I do have a plan for another fix for this
(which will also involve DMI matching)...

Andy, Darren, I see that you have already added this to the for-next
branch of linux-platform-drivers-x86. I'm not sure what your vision
on forced pushed there is. If forced pushes are ok, please drop this
patch. If not let me know and I will send out a revert.

Regards,

Hans



> ---
>   drivers/platform/x86/asus-nb-wmi.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6f12747a359a..c4404d9c1de4 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -515,9 +515,33 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
>   	.detect_quirks = asus_nb_wmi_quirks,
>   };
>   
> +static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst = {
> +	{
> +		/*
> +		 * asus-nb-wm adds no functionality. The T100TA has a detachable
> +		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
> +		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
> +		 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
> +		},
> +	},
> +	{
> +		/* The Asus T200TA has the same issue as the T100TA */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
> +		},
> +	},
> +	{} /* Terminating entry */
> +};
>   
>   static int __init asus_nb_wmi_init(void)
>   {
> +	if (dmi_check_system(asus_nb_wmi_blacklist))
> +		return -ENODEV;
> +
>   	return asus_wmi_register_driver(&asus_nb_wmi_driver);
>   }
>   
> 
