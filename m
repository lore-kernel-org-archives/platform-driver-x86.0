From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Fri, 26 Jun 2015 16:56:21 +0200
Message-ID: <20150626145621.GU2890@pali>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: dvhart@infradead.org, corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi!

On Wednesday 24 June 2015 10:57:51 Alex Hung wrote:
> ASUS introduced a new approach to handle wireless hotkey
> since Windows 8.  When the hotkey is pressed, BIOS generates
> a notification 0x88 to a new ACPI device, ATK4001.  This
> new driver not only translates the notification to KEY_RFKILL
> but also toggles its LED accordingly.
>=20
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

=2E..

> +static int asus_radio_led_set(bool blocked)
> +{
> +	acpi_status status;
> +	union acpi_object arg0 =3D { ACPI_TYPE_INTEGER };
> +	struct acpi_object_list args =3D { 1, &arg0 };
> +	unsigned long long output;
> +
> +	arg0.integer.value =3D blocked;
> +	status =3D acpi_evaluate_integer(asus_rbtn_device->handle, "HSWC",
> +				       &args, &output);

What is this ACPI call doing? Just set LED control? Or something more?

> +	if (!ACPI_SUCCESS(status) || output =3D=3D 0) {
> +		pr_err("fail to change wireless LED.\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int asus_rfkill_set(void *data, bool blocked)
> +{
> +	radio_led_state =3D blocked ? 0 : 1;
> +
> +	return asus_radio_led_set(radio_led_state);
> +}

In my opinion this is not good idea that "rfkill block" call from
userspace just change LED on/off state and nothing more...

If above ACPI call just change LED, then should not be this in LED
subsystem instead rfkill one? Or why do you prefer to use rfkill
interface instead led?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
