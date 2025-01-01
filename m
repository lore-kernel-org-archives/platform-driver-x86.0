Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AF72110E;
	Wed,  1 Jan 2025 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735765096; cv=none; b=D6j6ScqGibx9+BcXj354k3A9s7VFMcmcatwt/oNk/9lCYe76KhirYGaLYoi8KrCkJHt7a08QjmZXpl3Bb2uWQBUG+NTU1hsV0MP20IYgivFfItD8GmyCilBjsMB+9L4k+nof+UIUL8DpgPZ21MYTd8kauv1NSVOH+33aREJNqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735765096; c=relaxed/simple;
	bh=RnSFaWcvqIQfIgL16iuyz+73WAMd9PKlRSFOjM1iWKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3nibmmX/Vgo8S67kbJoWARxMZeUQRwzi5rMhdEqACV5ppj6luAhunpr1Ku7FxTAfyWr2DeDGUzC+tpZvPXd/pRidp5yxuAzrIThFsahnohx5iTczUSoQDJe4LJ/LhHqzjQ3lGOham7/k+SbhcFCSKdUyF/2WglFFJXanGs0yG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Gn4cji3z; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Gn4cji3z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735765082; x=1736369882; i=w_armin@gmx.de;
	bh=7o598kJ0VXdBca/+2x8TO3sZbHQZtG/7KY0X46Xi7ys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Gn4cji3zPauGjMFTW+/HXGEKggz16hlhdM4LA45Jv39bSKQXvb/oShmnRT/Bfhv2
	 MqweF+ccSTh7mE9qbe089OinZakHtguVHcaSIYrtIjx57oF/p+krM7/fJ8d06u2Wv
	 9u9Kz80vZYVb1rxvwCs293ErdRge2Q3mnGQ+cjj1jckdsVIkJJenEBQpTW6L+tgOJ
	 BSAHD1gBApsSF6CPkT6akx0ts3FZBRv6Ytc7BzUKssACigmvNQS/QOgtieCDTr5aa
	 1wAxV1Wr9HGT4jkeOb1LFlWQAV+S101bP635o9KUZF3Ni6ca6q7g+TQYO6fK6uGEM
	 vlET2eMw1jJ1Ia4fbA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2V0H-1td9d71GJT-00ytEc; Wed, 01
 Jan 2025 21:58:02 +0100
Message-ID: <12ce2a4d-6a27-471e-b330-996753ff1bfb@gmx.de>
Date: Wed, 1 Jan 2025 21:58:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: acer-wmi: improve platform profile handling
To: Hridesh MG <hridesh699@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, onenowy@gmail.com
References: <20241231140442.10076-1-hridesh699@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241231140442.10076-1-hridesh699@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z5yvAKtn3LlqfLMq7fI5UO0fXp1gZbTAuKTdXpWdanMxQWm5F5Y
 dXXAnZam8t/6AcCSZU9w/7w5EilE3/g6fzX8fu57OwdGEvQtsIJViG0EskA2iTnRROeB+jp
 nP4cZOCy+0HIGuZwR3tiYYdJDOobePBnKjZ5DgysqO9sf8BQUiD3bpUM4/+kuC7jXB/qrNe
 7WTYDh+jyoRf2QCfNUqtQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:11PMpMm05L8=;Ad9HIXbwASrCfrTXzBNDtiMRtVE
 Bcee81mdBb4Z0LZlXwjtDEZ1v0CFZpWJc1UzpdaqzUKJ9SN/3iO7xPtQ9+CQgVac/NgZSfPac
 LA81u0mCvDeZqYp5Zb1zSkGBWpGBLQJbBbVgMdIBzIDhv9mXTr7bgT48wWtsjWpcKzNI3yehF
 cAupsBvQ3xJhbqrRYmKfIO6vLbYmFsZy8tzEqjnOYEMTQAi3cox05w2boNoKhaClzsPlaamnV
 ToBmZhV0Mbrn9n9e6T2bvRMQx2gWwJv3Un+9ysjpWS0WxNZ6YdvA0vM+2YZ2jbppKuetkKkyL
 NRuvP1AjVsaKf34UxO6hlg70oEXFM5M5wI/pbxH95c6N5+JJKN+7uyPq2A6bPDB3v93B2Ct1P
 BNqdJfq/k7y4kXyHHJ3L+EbnI1TH+dkxc0PCLfEKUYtLOkVCHIBlvZRigfAtjGO1/OxW58fVZ
 i/P/yYN03aLVrYh0REo8Zn89IhRBHNQ6weW42Gsgt4ZQIcIaiVDO/g3cVf5YTGGSgfcm65nhO
 5FTQ7960GhMGD1RwqeAMGVnqt1dyc5cYZN4ivyUhD2ZxR7KYW92b2cliufalxhQfbh9CLdVNd
 yabxhiqiwMb4OOjHWvixkQqhxF/ynQmRI27jBEsye1gX9J+5kePgL9ZyB7mx8FkeacgsTfxLZ
 +CVzgy1GWw3ixGT84iNzdpsuxkS05ItzGc2ECqskycMATdaIp4/uoLO/JaXAZrzqsxT9benU2
 jwyysIzZW9Jkj/Jjvc13F3T7Bj8CsQm6k/TgYW96y75g6UR7iJNMIsBMlQomO+ZtbTW4B93Jp
 epl0T6aSk1E87tfyhxth5ian28ORtxm0m/yN9cRr/qoec9gappwyvmGmQX79DkG/l7GRzZ8vw
 GGlOk17lYW0krK62/oNXJU6J0a+Vi5V55GgPnKE6h2uQ3bGUWTrMMsVVvj+lLah9nyoYD2eay
 DJOFAR/w557xb1yBVViSOopiUnB7dUCkLemNzfO5XNQz/fGAtrQQKPleRTEoIrarGVcldxSEy
 h7YIZMbjLn9U2IV/V2iM8wKSIFFIY3xQDB1nV785vX1R8Ee5bnopFuYENED4xkTVjftQlAH7D
 RlRefBeD86MvGtkpfayP+bKiXtsb0e

Am 31.12.24 um 15:04 schrieb Hridesh MG:

> Two improvements to the platform profile handling for laptops using
> the Acer Predator interface -
>
> 1) Use WMI calls to fetch the current platform profile instead of
>     directly accessing it from the EC since the EC address differs for
>     certain laptops.
> 2) Use the supported profiles bitmap to dynamically set
>     platform_profile_choices.

Hi,

can you please split the second part into a separate patch? This would mak=
e review easier.

> Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad1=
5-223a3fe67f80@gmx.de/
> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---
> This patch has been tested on an acer nitro AN515-58 laptop, it would be
> good if someone with a predator laptop could also test it
> ---
>   drivers/platform/x86/acer-wmi.c | 220 ++++++++++++++++++++++----------
>   1 file changed, 154 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer=
-wmi.c
> index b3043d78a7b3..37f629b6e3d3 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -31,6 +31,7 @@
>   #include <acpi/video.h>
>   #include <linux/hwmon.h>
>   #include <linux/units.h>
> +#include <linux/unaligned.h>
>   #include <linux/bitfield.h>
>
>   MODULE_AUTHOR("Carlos Corbacho");
> @@ -68,8 +69,11 @@ MODULE_LICENSE("GPL");
>   #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
>   #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
>   #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
> +#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
>
> -#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
> +#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
> +#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
> +#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
>
>   #define ACER_PREDATOR_V4_RETURN_STATUS_BIT_MASK GENMASK_ULL(7, 0)
>   #define ACER_PREDATOR_V4_SENSOR_INDEX_BIT_MASK GENMASK_ULL(15, 8)
> @@ -115,6 +119,13 @@ enum acer_wmi_predator_v4_sensor_id {
>   	ACER_WMID_SENSOR_GPU_TEMPERATURE	=3D 0x0A,
>   };
>
> +enum acer_wmi_gaming_misc_setting {
> +	ACER_WMID_MISC_SETTING_OC_1			=3D 0x0005,
> +	ACER_WMID_MISC_SETTING_OC_2			=3D 0x0007,
> +	ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES	=3D 0x000A,
> +	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		=3D 0x000B,
> +};
> +
>   static const struct key_entry acer_wmi_keymap[] __initconst =3D {
>   	{KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>   	{KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> @@ -751,20 +762,12 @@ static bool platform_profile_support;
>    */
>   static int last_non_turbo_profile;
>
> -enum acer_predator_v4_thermal_profile_ec {
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x04,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x03,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x02,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x01,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x00,
> -};
> -
> -enum acer_predator_v4_thermal_profile_wmi {
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI =3D 0x060B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI =3D 0x050B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI =3D 0x040B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI =3D 0x0B,
> -	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI =3D 0x010B,
> +enum acer_predator_v4_thermal_profile {
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x06,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x05,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x04,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x01,
> +	ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x00,
>   };
>
>   /* Find which quirks are needed for a particular vendor/ model pair */
> @@ -1477,6 +1480,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u64=
 *out)
>   	return status;
>   }
>
> +static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
> +{
> +	struct acpi_buffer result =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	struct acpi_buffer input =3D {
> +		.length =3D sizeof(in),
> +		.pointer =3D &in,
> +	};
> +	union acpi_object *obj;
> +	acpi_status status;
> +	int ret =3D 0;
> +
> +	status =3D wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, &resu=
lt);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj =3D result.pointer;
> +	if (obj && out) {
> +		switch (obj->type) {
> +		case ACPI_TYPE_INTEGER:
> +			*out =3D obj->integer.value;
> +			break;
> +		case ACPI_TYPE_BUFFER:
> +			if (obj->buffer.length < sizeof(*out))
> +				ret =3D -ENOMSG;
> +			else
> +				*out =3D get_unaligned_le64(obj->buffer.pointer);
> +
> +			break;
> +		default:
> +			ret =3D -ENOMSG;
> +			break;
> +		}
> +	}
> +
> +	kfree(obj);
> +
> +	return ret;
> +}
> +
>   static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
>   {
>   	u32 method_id =3D 0;
> @@ -1565,6 +1607,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode)
>   	WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER_CAP=
_TURBO_FAN);
>   }
>
> +static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_setti=
ng setting, u8 value)
> +{
> +	acpi_status status;
> +	u64 input =3D 0;
> +	u64 result;
> +
> +	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
> +	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value);
> +
> +	status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTING_ME=
THODID, input, &result);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	/* The return status must be zero for the operation to have succeeded =
*/
> +	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_setti=
ng setting, u8 *value)
> +{
> +	u64 input =3D 0;
> +	u64 result;
> +	int ret;
> +
> +	input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setting);
> +
> +	ret =3D WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETTING_M=
ETHODID, input,
> +					 &result);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* The return status must be zero for the operation to have succeeded =
*/
> +	if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> +		return -EIO;
> +
> +	*value =3D FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result);
> +
> +	return 0;
> +}
> +
>   /*
>    * Generic Device (interface-independent)
>    */
> @@ -1833,9 +1917,8 @@ acer_predator_v4_platform_profile_get(struct platf=
orm_profile_handler *pprof,
>   	u8 tp;
>   	int err;
>
> -	err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
> -
> -	if (err < 0)
> +	err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_P=
ROFILE, &tp);
> +	if (err)
>   		return err;
>
>   	switch (tp) {
> @@ -1865,36 +1948,33 @@ static int
>   acer_predator_v4_platform_profile_set(struct platform_profile_handler =
*pprof,
>   				      enum platform_profile_option profile)
>   {
> -	int tp;
> -	acpi_status status;
> +	int tp, err;
>
>   	switch (profile) {
>   	case PLATFORM_PROFILE_PERFORMANCE:
> -		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>   		break;
>   	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> -		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> +		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>   		break;
>   	case PLATFORM_PROFILE_BALANCED:
> -		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   		break;
>   	case PLATFORM_PROFILE_QUIET:
> -		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> +		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>   		break;
>   	case PLATFORM_PROFILE_LOW_POWER:
> -		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +		tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>   		break;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
>
> -	status =3D WMI_gaming_execute_u64(
> -		ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
> -
> -	if (ACPI_FAILURE(status))
> -		return -EIO;
> +	err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_P=
ROFILE, tp);
> +	if (err)
> +		return err;
>
> -	if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> +	if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>   		last_non_turbo_profile =3D tp;
>
>   	return 0;
> @@ -1904,6 +1984,7 @@ static int acer_platform_profile_setup(struct plat=
form_device *device)
>   {
>   	if (quirks->predator_v4) {
>   		int err;
> +		u8 supported_profiles;

Please order the variables in reverse xmas tree order, which means that th=
e long declarations come first.

>
>   		platform_profile_handler.name =3D "acer-wmi";
>   		platform_profile_handler.dev =3D &device->dev;
> @@ -1912,16 +1993,27 @@ static int acer_platform_profile_setup(struct pl=
atform_device *device)
>   		platform_profile_handler.profile_set =3D
>   			acer_predator_v4_platform_profile_set;
>
> -		set_bit(PLATFORM_PROFILE_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_BALANCED,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_QUIET,
> -			platform_profile_handler.choices);
> -		set_bit(PLATFORM_PROFILE_LOW_POWER,
> -			platform_profile_handler.choices);
> +		err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_SUPPORTED=
_PROFILES,
> +						   &supported_profiles);
> +		if (err)
> +			return err;
> +
> +		if (supported_profiles & 1 << 0)
> +			set_bit(PLATFORM_PROFILE_QUIET,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 1)
> +			set_bit(PLATFORM_PROFILE_BALANCED,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 4)
> +			set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 5)
> +			set_bit(PLATFORM_PROFILE_PERFORMANCE,
> +				platform_profile_handler.choices);
> +		if (supported_profiles & 1 << 6)
> +			set_bit(PLATFORM_PROFILE_LOW_POWER,
> +				platform_profile_handler.choices);

Please use the appropriated values from "enum acer_predator_v4_thermal_pro=
file" instead of those
magic numbers.

> +
>
>   		err =3D platform_profile_register(&platform_profile_handler);
>   		if (err)
> @@ -1931,7 +2023,7 @@ static int acer_platform_profile_setup(struct plat=
form_device *device)
>
>   		/* Set default non-turbo profile  */
>   		last_non_turbo_profile =3D
> -			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +			ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   	}
>   	return 0;
>   }
> @@ -1946,12 +2038,10 @@ static int acer_thermal_profile_change(void)
>   		u8 current_tp;
>   		int tp, err;
>   		u64 on_AC;
> -		acpi_status status;
> -
> -		err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET,
> -			      &current_tp);
>
> -		if (err < 0)
> +		err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_=
PROFILE,
> +						   &current_tp);
> +		if (err)
>   			return err;
>
>   		/* Check power source */
> @@ -1962,54 +2052,52 @@ static int acer_thermal_profile_change(void)
>   		switch (current_tp) {
>   		case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
>   			if (!on_AC)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   			else if (cycle_gaming_thermal_profile)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>   			else
>   				tp =3D last_non_turbo_profile;
>   			break;
>   		case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
>   			if (!on_AC)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   			else
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>   			break;
>   		case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
>   			if (!on_AC)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>   			else if (cycle_gaming_thermal_profile)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>   			else
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>   			break;
>   		case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
>   			if (!on_AC)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   			else if (cycle_gaming_thermal_profile)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   			else
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>   			break;
>   		case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
>   			if (!on_AC)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>   			else if (cycle_gaming_thermal_profile)
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>   			else
> -				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> +				tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>   			break;
>   		default:
>   			return -EOPNOTSUPP;
>   		}

This needs a bit more work, since you might accidentally select unsupporte=
d platform profiles this way.

Using platform_profile_cycle() would make sense here, but we still need to=
 handle "on_AC". I however wonder
if that is really necessary.

I CCed the original patch author hoping that he can give us some backgroun=
d information here.

Thanks,
Armin Wolf

>
> -		status =3D WMI_gaming_execute_u64(
> -			ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
> -
> -		if (ACPI_FAILURE(status))
> -			return -EIO;
> +		err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATFORM_=
PROFILE, tp);
> +		if (err)
> +			return err;
>
>   		/* Store non-turbo profile for turbo mode toggle*/
> -		if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> +		if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>   			last_non_turbo_profile =3D tp;
>
>   		platform_profile_notify(&platform_profile_handler);
