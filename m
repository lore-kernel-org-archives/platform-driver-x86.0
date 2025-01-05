Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF9913D600;
	Sun,  5 Jan 2025 13:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736082138; cv=none; b=Ogfe2JayPHQb1H2Jlf4Gipb9cFYkLr0sBMaBGTSQepABxgEcM5B8UprjtNttUcOwuTDt6SxKeJXVek9G9dLhcNm5cjePGER/ZjU96bDzjLh3hfE4S+PZRedZdygbUzEPnLpODcu2Dq1x4CTBXgZRl07vmPRRwBlQQMRkWZIMaCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736082138; c=relaxed/simple;
	bh=SuGShFybcAMuxbSLbjI1VdEstTN+l4vQsMExoHB1P64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re6vNsgM4RvLawPFzV4zOidHLsroCRBHKBjFFpj2aDTzbG4Qn1fgzJ3VNJYK9Y1sDyKFRIaaVfPA5xktBYLwHHpFkbBqnV88zMywFGIANAV/qVjra1VwhXsUEyWCMXuNAHzoLUeOTPqmY6hN9X+6MPiDZcgsr78+bYXla4x00rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=iFyVlV9j; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="iFyVlV9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736082127; x=1736686927; i=w_armin@gmx.de;
	bh=zaD+faQPKKU8JMN6u66kckDxZT6201BzDltgneMQOGw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=iFyVlV9j4ygyIEhjqehP8fZ4cFihaSIIXUPailrRkYJsLF4YFe+POxqvIUBuXh2Q
	 C8cSfNhRJC1GVBP9F9BKQ690oJJS1XbOUPSEbNpqACAR8zn0VeAr3YykQNxgKlnSF
	 MJAljkZmJBhAiqdMMP1eXvADcFGMWQRzAWXgnhXt98pv2n4R1hsKMhUqkjU74MGRY
	 zVCnYV9nxbQcpPEyX3RNYKNNVizJRnCFBe6wAus5nmOfGAu2ERaKi07wUFTw1I300
	 1oVqdbiPPvETnHFcL9lN7CPbD/7g3O4NueZNB8jzIC5OPIROyTqkz0HG2ZYPdDaOB
	 Saf7EwLhnoCIRLbaYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MxUs7-1tfecx317x-00yCkY; Sun, 05
 Jan 2025 14:02:06 +0100
Message-ID: <9bce3f5c-ad07-40df-94ef-871f74dead75@gmx.de>
Date: Sun, 5 Jan 2025 14:02:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] platform/x86: acer-wmi: use WMI calls for platform
 profile handling
To: Hridesh MG <hridesh699@gmail.com>, Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-1-b58164718903@gmail.com>
 <uizjjmxs44ajzekcndb2qfkuqctvgi3nolmoeg6zdq5lteewxs@ztj5jp6wrakj>
 <CALiyAomC-QXuMWs2i50SK2f=F7Te5QTbx1f1i-MWhF=STLmmEw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAomC-QXuMWs2i50SK2f=F7Te5QTbx1f1i-MWhF=STLmmEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XHlXJJOi1t9yQ5kBVGyq5fk9BL+2QsT3e87ic8xuce+mspsTmRi
 SeWCyMa/thvKlu9Cfzo7a65SJRfDL6QKYkvJJPvwGP/lgwRysAsYs2lVjYc++2XdImwbX/f
 tfSIQ0Auv21/mUycngQ3QzYFbPcQO2ftM9KYdH7SANXHNEpZnchTzGaWCw0bDpa0NZ0fjMp
 xJeGKtpoJUYhzjloXzJOw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wTu2KFjHFGA=;w0ktvyRJ1hJ5XwZV6YXTp2enu2q
 lnP8rPefhrFUpsy3SWaULrTuxR/iyMnq/vzAvg2gqc8pqQog7jeosbGXFhl4pMpp0p5nLbrc9
 jKoFomdLM1QfRn+2xVuYVfbSyyOBONRbT00y2gijC+bsGWAkiW+XG5dF0Fy0OuKGsjXA/Cm+Z
 EGZUFc05HYvT4sZsa3inl27d3ZthcqLMqYmA+tQF0ecO6k9ewS1bAPagDliH9APsBay9XA3x0
 mV8SeXPm04zFoWUHAnXCmsqqnNwi5csWB+sPvaUUAAAroZZZErMnh/ItU1zwu1UdlIfnhgYAX
 /Zxco+dzkuu/qZ0MErYdigl3HslYP2VyKoKt7I5uT82nWgLarStb1yHHcz4eADLqi9fBEGkm3
 H6qIzhdK1hYm2thk5EUbM3fohkMtTrRxlrgPG95YJgGJiQvJhRVpIYFJ9RJPsElHefuwMCqyj
 Giw1WKFJsHAEBFFD6UOmx6j2p+xsrjt6lF8U8OGPdQKgXfx7B/KnC27hSHTftZ0FKZ0YSqAhS
 Fhl7Tiecg3fsZ8imEhEa5TXxjWW/eKVSOBY3uUB2GHLmJvB2LwapRpmdOhtyTu1W/jIeT6maR
 R5dxv4gCA4ilKvmMRRteJpwiVfJbI45YrB20p3JR1IAP7y+xSuBT/Yjb32nxahtwGI2FOkzS3
 ivvglxA/3Ub9s+Ty1dxv6Wp6lsj1GzaS0o/nwurjL5a+HONC6CxoZhtSjFoS8ez8NmpKaTwNj
 Y9A1AKmM+ncoP86BXlbJO31Z78JNBMeytvgKYdS8HiQOmQYwHsSdUfZXqFF1MXXIlQn5sO/C7
 +H59Y86glQhUtL/mMBp1WQYOdy+bVcBqJ7PatansvNQ7gr1hYdHuEQjYTs5emzBjQjrGsc8XR
 cHnVsxoWYVB8DYGllz2uTW5R8viaQrDqk+wUmCQgbkuMAk64tBqm2ENylJB6/zBf6Z2yfLDv1
 Qky1q1PTABhGQOfTIAFqsv0D5/pa23wITfBZkyk/9HZATHCEMJeWF7yYZ6uCtsTDnnvTCjADM
 lc/STMHOQThPQbLTgDOpRBMtu9ZiTmcjl9hAVQM1Y8ws/1mGnFDv7ZCbTHKNw+IbRJsLShDHk
 qjuEncy59Onm7BUq4AllYyCl/Z+/Mx

Am 05.01.25 um 12:19 schrieb Hridesh MG:

> On Sat, Jan 4, 2025 at 10:43=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wr=
ote:
>> On Sat, Jan 04, 2025 at 08:59:20PM +0530, Hridesh MG wrote:
>>> Improve the platform profile handling by using WMI calls to fetch the
>>> current platform profile instead of directly accessing it from the EC.
>>> This is beneficial because the EC address differs for certain laptops.
>>>
>>> Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-a=
d15-223a3fe67f80@gmx.de/
>>> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
>> Hi Hridesh,
>>
>>> ---
>>>   drivers/platform/x86/acer-wmi.c | 189 ++++++++++++++++++++++++++++--=
----------
>>>   1 file changed, 133 insertions(+), 56 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ac=
er-wmi.c
>>> index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..5370056fb2d03a768162f2=
f1643ef27dc6deafa8 100644
>>> --- a/drivers/platform/x86/acer-wmi.c
>>> +++ b/drivers/platform/x86/acer-wmi.c
>>> @@ -31,6 +31,7 @@
>>>   #include <acpi/video.h>
>>>   #include <linux/hwmon.h>
>>>   #include <linux/units.h>
>>> +#include <linux/unaligned.h>
>>>   #include <linux/bitfield.h>
>>>
>>>   MODULE_AUTHOR("Carlos Corbacho");
>>> @@ -68,8 +69,11 @@ MODULE_LICENSE("GPL");
>>>   #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
>>>   #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
>>>   #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
>>> +#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
>>>
>>> -#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
>>> +#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
>>> +#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
>>> +#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
>>>
>>>   #define ACER_PREDATOR_V4_RETURN_STATUS_BIT_MASK GENMASK_ULL(7, 0)
>>>   #define ACER_PREDATOR_V4_SENSOR_INDEX_BIT_MASK GENMASK_ULL(15, 8)
>>> @@ -115,6 +119,13 @@ enum acer_wmi_predator_v4_sensor_id {
>>>        ACER_WMID_SENSOR_GPU_TEMPERATURE        =3D 0x0A,
>>>   };
>>>
>>> +enum acer_wmi_gaming_misc_setting {
>>> +     ACER_WMID_MISC_SETTING_OC_1                     =3D 0x0005,
>>> +     ACER_WMID_MISC_SETTING_OC_2                     =3D 0x0007,
>> These OC settings should be added only if you add support for them.
>>
>> I noticed acer_toggle_turbo() uses these settings. For consistency, I
>> think it should be refactored to use WMID_gaming_set_misc_setting()
>> instead of WMID_gaming_set_u64().
> Yeah I agree. Actually, now that we have this function, this
> particular case in WMID_gaming_set_u64() is redundant, so can I remove
> it? (sorry if this is a dumb question)
>
>          switch (cap) {
>          case ACER_CAP_TURBO_OC:
>              method_id =3D ACER_WMID_SET_GAMING_MISC_SETTING_METHODID;
>              break;
>          }

Yes i think so. Please do the conversion of the OC settings in a separate =
patch so that
it is easier to review.

Keep in mind that you emulate the behavior of WMID_gaming_set_u64() and ch=
eck if the
interface has ACER_CAP_TURBO_OC before calling WMID_gaming_set_misc_settin=
gs() to change
the OC settings.

Thanks,
Armin Wolf

>>> +     ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES       =3D 0x000A,
>> This should be added in patch [2/3].
>>
>>> +     ACER_WMID_MISC_SETTING_PLATFORM_PROFILE         =3D 0x000B,
>>> +};
>>> +
>>>   static const struct key_entry acer_wmi_keymap[] __initconst =3D {
>>>        {KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
>>>        {KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
>>> @@ -751,20 +762,12 @@ static bool platform_profile_support;
>>>    */
>>>   static int last_non_turbo_profile;
>>>
>>> -enum acer_predator_v4_thermal_profile_ec {
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x04,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x03,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x02,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x01,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x00,
>>> -};
>>> -
>>> -enum acer_predator_v4_thermal_profile_wmi {
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI =3D 0x060B,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI =3D 0x050B,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI =3D 0x040B,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI =3D 0x0B,
>>> -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI =3D 0x010B,
>>> +enum acer_predator_v4_thermal_profile {
>>> +     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET          =3D 0x00,
>>> +     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED       =3D 0x01,
>>> +     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE    =3D 0x04,
>>> +     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO          =3D 0x05,
>>> +     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO            =3D 0x06,
>>>   };
>>>
>>>   /* Find which quirks are needed for a particular vendor/ model pair =
*/
>>> @@ -1477,6 +1480,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u=
64 *out)
>>>        return status;
>>>   }
>>>
>>> +static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out=
)
>>> +{
>>> +     struct acpi_buffer result =3D { ACPI_ALLOCATE_BUFFER, NULL };
>>> +     struct acpi_buffer input =3D {
>>> +             .length =3D sizeof(in),
>>> +             .pointer =3D &in,
>>> +     };
>>> +     union acpi_object *obj;
>>> +     acpi_status status;
>>> +     int ret =3D 0;
>>> +
>>> +     status =3D wmi_evaluate_method(WMID_GUID4, 0, method_id, &input,=
 &result);
>>> +     if (ACPI_FAILURE(status))
>>> +             return -EIO;
>>> +
>>> +     obj =3D result.pointer;
>>> +     if (obj && out) {
>>> +             switch (obj->type) {
>>> +             case ACPI_TYPE_INTEGER:
>>> +                     *out =3D obj->integer.value;
>>> +                     break;
>>> +             case ACPI_TYPE_BUFFER:
>>> +                     if (obj->buffer.length < sizeof(*out))
>>> +                             ret =3D -ENOMSG;
>>> +                     else
>>> +                             *out =3D get_unaligned_le64(obj->buffer.=
pointer);
>>> +
>>> +                     break;
>>> +             default:
>>> +                     ret =3D -ENOMSG;
>>> +                     break;
>>> +             }
>>> +     }
>>> +
>>> +     kfree(obj);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>>   static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
>>>   {
>>>        u32 method_id =3D 0;
>>> @@ -1565,6 +1607,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mod=
e)
>>>        WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, AC=
ER_CAP_TURBO_FAN);
>>>   }
>>>
>>> +static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_set=
ting setting, u8 value)
>>> +{
>>> +     acpi_status status;
>>> +     u64 input =3D 0;
>>> +     u64 result;
>>> +
>>> +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setti=
ng);
>>> +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value=
);
>>> +
>>> +     status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETT=
ING_METHODID, input, &result);
>>> +     if (ACPI_FAILURE(status))
>>> +             return -EIO;
>>> +
>>> +     /* The return status must be zero for the operation to have succ=
eeded */
>>> +     if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
>>> +             return -EIO;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_set=
ting setting, u8 *value)
>>> +{
>>> +     u64 input =3D 0;
>>> +     u64 result;
>>> +     int ret;
>>> +
>>> +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, setti=
ng);
>>> +
>>> +     ret =3D WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SET=
TING_METHODID, input,
>>> +                                      &result);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>> +     /* The return status must be zero for the operation to have succ=
eeded */
>>> +     if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
>>> +             return -EIO;
>>> +
>>> +     *value =3D FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result=
);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>   /*
>>>    * Generic Device (interface-independent)
>>>    */
>>> @@ -1833,9 +1917,8 @@ acer_predator_v4_platform_profile_get(struct pla=
tform_profile_handler *pprof,
>>>        u8 tp;
>>>        int err;
>>>
>>> -     err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp)=
;
>>> -
>>> -     if (err < 0)
>>> +     err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLAT=
FORM_PROFILE, &tp);
>>> +     if (err)
>>>                return err;
>>>
>>>        switch (tp) {
>>> @@ -1865,36 +1948,33 @@ static int
>>>   acer_predator_v4_platform_profile_set(struct platform_profile_handle=
r *pprof,
>>>                                      enum platform_profile_option prof=
ile)
>>>   {
>>> -     int tp;
>>> -     acpi_status status;
>>> +     int tp, err;
>>>
>>>        switch (profile) {
>>>        case PLATFORM_PROFILE_PERFORMANCE:
>>> -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
>>> +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
>>>                break;
>>>        case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>>> -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
>>> +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
>>>                break;
>>>        case PLATFORM_PROFILE_BALANCED:
>>> -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
>>> +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>>>                break;
>>>        case PLATFORM_PROFILE_QUIET:
>>> -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
>>> +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
>>>                break;
>>>        case PLATFORM_PROFILE_LOW_POWER:
>>> -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
>>> +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
>>>                break;
>>>        default:
>>>                return -EOPNOTSUPP;
>>>        }
>>>
>>> -     status =3D WMI_gaming_execute_u64(
>>> -             ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
>>> -
>>> -     if (ACPI_FAILURE(status))
>>> -             return -EIO;
>>> +     err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLAT=
FORM_PROFILE, tp);
>>> +     if (err)
>>> +             return err;
>>>
>>> -     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
>>> +     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>>>                last_non_turbo_profile =3D tp;
>>>
>>>        return 0;
>>> @@ -1923,6 +2003,7 @@ static int acer_platform_profile_setup(struct pl=
atform_device *device)
>>>                set_bit(PLATFORM_PROFILE_LOW_POWER,
>>>                        platform_profile_handler.choices);
>>>
>>> +
>> Please, drop this extra line.
>>
>> ~ Kurt
>>
>>>                err =3D platform_profile_register(&platform_profile_han=
dler);
>>>                if (err)
>>>                        return err;
>>> @@ -1931,7 +2012,7 @@ static int acer_platform_profile_setup(struct pl=
atform_device *device)
>>>
>>>                /* Set default non-turbo profile  */
>>>                last_non_turbo_profile =3D
>>> -                     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
>>> +                     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
>>>        }
>>>        return 0;
>>>   }
>>> @@ -1946,12 +2027,10 @@ static int acer_thermal_profile_change(void)
>>>                u8 current_tp;
>>>                int tp, err;
>>>                u64 on_AC;
>>> -             acpi_status status;
>>> -
>>> -             err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFS=
ET,
>>> -                           &current_tp);
>>>
>>> -             if (err < 0)
>>> +             err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETT=
ING_PLATFORM_PROFILE,
>>> +                                                &current_tp);
>>> +             if (err)
>>>                        return err;
>>>
>>>                /* Check power source */
>>> @@ -1962,54 +2041,52 @@ static int acer_thermal_profile_change(void)
>>>                switch (current_tp) {
>>>                case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
>>>                        if (!on_AC)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED;
>>>                        else if (cycle_gaming_thermal_profile)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
ECO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
ECO;
>>>                        else
>>>                                tp =3D last_non_turbo_profile;
>>>                        break;
>>>                case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
>>>                        if (!on_AC)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED;
>>>                        else
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO;
>>>                        break;
>>>                case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
>>>                        if (!on_AC)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
ECO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
ECO;
>>>                        else if (cycle_gaming_thermal_profile)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
PERFORMANCE_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
PERFORMANCE;
>>>                        else
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO;
>>>                        break;
>>>                case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
>>>                        if (!on_AC)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED;
>>>                        else if (cycle_gaming_thermal_profile)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED;
>>>                        else
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO;
>>>                        break;
>>>                case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
>>>                        if (!on_AC)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
BALANCED;
>>>                        else if (cycle_gaming_thermal_profile)
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
QUIET_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
QUIET;
>>>                        else
>>> -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO_WMI;
>>> +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_=
TURBO;
>>>                        break;
>>>                default:
>>>                        return -EOPNOTSUPP;
>>>                }
>>>
>>> -             status =3D WMI_gaming_execute_u64(
>>> -                     ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, =
NULL);
>>> -
>>> -             if (ACPI_FAILURE(status))
>>> -                     return -EIO;
>>> +             err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETT=
ING_PLATFORM_PROFILE, tp);
>>> +             if (err)
>>> +                     return err;
>>>
>>>                /* Store non-turbo profile for turbo mode toggle*/
>>> -             if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
>>> +             if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
>>>                        last_non_turbo_profile =3D tp;
>>>
>>>                platform_profile_notify(&platform_profile_handler);
>
>
