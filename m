From: "Joey Lee" <jlee@novell.com>
Subject: Re: [PATCH 03/23] acer-wmi: pr_<level> cleanups
Date: Thu, 31 Mar 2011 00:41:35 -0600
Message-ID: <4D94BCCF020000230002AA3B@novprvlin0050.provo.novell.com>
References: <cover.1301436234.git.joe@perches.com>
 <4c2d34198b3331f0df654f2e75e4e85d6d1b50cb.1301436234.git.joe@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <4c2d34198b3331f0df654f2e75e4e85d6d1b50cb.1301436234.git.joe@perches.com>
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joe@perches.com
Cc: mjg@redhat.com, carlos@strangeworlds.co.uk, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

=E6=96=BC =E4=BA=8C=EF=BC=8C2011-03-29 =E6=96=BC 15:21 -0700=EF=BC=8CJo=
e Perches =E6=8F=90=E5=88=B0=EF=BC=9A
> Convert pr_warning to pr_warn.
> Add some missing newlines to pr_<level> uses.
>=20
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   32 ++++++++++++++++-------------=
---
>  1 files changed, 16 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 5ea6c34..0b23b75 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -1081,7 +1081,7 @@ static acpi_status wmid3_get_device_status(u32 =
*value, u16 device)
>  		return AE_ERROR;
>  	}
>  	if (obj->buffer.length !=3D 8) {
> -		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> +		pr_warn("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return AE_ERROR;
>  	}
> @@ -1090,8 +1090,8 @@ static acpi_status wmid3_get_device_status(u32 =
*value, u16 device)
>  	kfree(obj);
> =20
>  	if (return_value.error_code || return_value.ec_return_value)
> -		pr_warning("Get Device Status failed: "
> -			"0x%x - 0x%x\n", return_value.error_code,
> +		pr_warn("Get Device Status failed: 0x%x - 0x%x\n",
> +			return_value.error_code,
>  			return_value.ec_return_value);
>  	else
>  		*value =3D !!(return_value.devices & device);
> @@ -1317,7 +1317,7 @@ static void acer_wmi_notify(u32 value, void *co=
ntext)
> =20
>  	status =3D wmi_get_event_data(value, &response);
>  	if (status !=3D AE_OK) {
> -		pr_warning("bad event status 0x%x\n", status);
> +		pr_warn("bad event status 0x%x\n", status);
>  		return;
>  	}
> =20
> @@ -1326,12 +1326,12 @@ static void acer_wmi_notify(u32 value, void *=
context)
>  	if (!obj)
>  		return;
>  	if (obj->type !=3D ACPI_TYPE_BUFFER) {
> -		pr_warning("Unknown response received %d\n", obj->type);
> +		pr_warn("Unknown response received %d\n", obj->type);
>  		kfree(obj);
>  		return;
>  	}
>  	if (obj->buffer.length !=3D 8) {
> -		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> +		pr_warn("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return;
>  	}
> @@ -1356,11 +1356,11 @@ static void acer_wmi_notify(u32 value, void *=
context)
>  		}
>  		if (!sparse_keymap_report_event(acer_wmi_input_dev,
>  				return_value.key_num, 1, true))
> -			pr_warning("Unknown key number - 0x%x\n",
> +			pr_warn("Unknown key number - 0x%x\n",
>  				return_value.key_num);
>  		break;
>  	default:
> -		pr_warning("Unknown function number - %d - %d\n",
> +		pr_warn("Unknown function number - %d - %d\n",
>  			return_value.function, return_value.key_num);
>  		break;
>  	}
> @@ -1389,7 +1389,7 @@ wmid3_set_lm_mode(struct lm_input_params *param=
s,
>  		return AE_ERROR;
>  	}
>  	if (obj->buffer.length !=3D 4) {
> -		pr_warning("Unknown buffer length %d\n", obj->buffer.length);
> +		pr_warn("Unknown buffer length %d\n", obj->buffer.length);
>  		kfree(obj);
>  		return AE_ERROR;
>  	}
> @@ -1414,11 +1414,11 @@ static int acer_wmi_enable_ec_raw(void)
>  	status =3D wmid3_set_lm_mode(&params, &return_value);
> =20
>  	if (return_value.error_code || return_value.ec_return_value)
> -		pr_warning("Enabling EC raw mode failed: "
> -		       "0x%x - 0x%x\n", return_value.error_code,
> -		       return_value.ec_return_value);
> +		pr_warn("Enabling EC raw mode failed: 0x%x - 0x%x\n",
> +			return_value.error_code,
> +			return_value.ec_return_value);
>  	else
> -		pr_info("Enabled EC raw mode");
> +		pr_info("Enabled EC raw mode\n");
> =20
>  	return status;
>  }
> @@ -1437,9 +1437,9 @@ static int acer_wmi_enable_lm(void)
>  	status =3D wmid3_set_lm_mode(&params, &return_value);
> =20
>  	if (return_value.error_code || return_value.ec_return_value)
> -		pr_warning("Enabling Launch Manager failed: "
> -		       "0x%x - 0x%x\n", return_value.error_code,
> -		       return_value.ec_return_value);
> +		pr_warn("Enabling Launch Manager failed: 0x%x - 0x%x\n",
> +			return_value.error_code,
> +			return_value.ec_return_value);
> =20
>  	return status;
>  }

OK to me.

Acked-by: Lee, Chun-Yi <jlee@novell.com>
