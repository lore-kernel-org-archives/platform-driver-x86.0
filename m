Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C171E871;
	Sun,  5 Jan 2025 11:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736076009; cv=none; b=FenPsJ9zWWWBLO0hXpytmwhWifA2qwcFo/vF9TAenT7HK8YFy1/ycM4bhlfoa3CHjBxVuZma4zY2ec5CQHn/DQCquhJTLRERaM4TST9CDcHXvfVlYFX6SyUxnCcQDLldFzukmf3FedDMR1npVR3r2Q/dbQ7ButrRQ080Wn0VZRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736076009; c=relaxed/simple;
	bh=yqt73AQHZp03wcagbtEoZzx3r5EAfISIEeekuTa8tEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPSfl5+Z67gz6yId3ljlK8vVGOx0WGrHbsMCtFLauX+S7N3QJqmP0+j/of3bFCKhyL859Lh+m9Rx1ODAeE9q+4oxLBQQT8dN57nnYIjF/1iQgzfk1eYcOZDYeDnG7zzlp8axhvs0q5l5Ql9+V6+YUIgXbeRmH94aID82HNLaMCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5DzocRD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5DzocRD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef89dbd8eeso14231381a91.0;
        Sun, 05 Jan 2025 03:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736076007; x=1736680807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcFudN0qGm4Wk2NwW6EMdBn0HnMifrIBrLznz0/9rgk=;
        b=H5DzocRDziSfADK7U0OdORlBZZw/qpdZ+P2uYTD501LTDpATDAQ2o4sEaahq2+g2eq
         WxjhrbKy5XLCiRRQc3nm+OpdxFJ40lLQ7JgbLrWxPsEoEaKFmUmdLNlgyQAvPFFauW6j
         EQY/13AB3aJkD7MPuu176qVFY13/NB8k385iOofIO5bnkyX8FIUzdEiXlOdWOrHsv3SZ
         jmnDO/hrdYmsuVrBd3RAnRpmLe4cyH0jYYehn5oiPUL30/aZRtMev5EPKejF/n1yjLCL
         Cs6rQDRidPVe72KCXRTnMqoJhgSs4w/6UUffR2r7ygTaP+0sGmD88mqwty+BiHV1qi0a
         rcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736076007; x=1736680807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcFudN0qGm4Wk2NwW6EMdBn0HnMifrIBrLznz0/9rgk=;
        b=SUjY2vYU5LJf+Ndtu32P1tBrz0Z88kWdWlBOfx/3fHm3iF4juPGN7OEVvaj8dSyT1r
         uZAr2n8IPjvy/ujDzfCkbRaGl9a5K5P6HoYkjG9PctBMjJ1H0IIi3uV4MNLHdpLrdSqw
         tVWj3UTXF2tMdn+F8jjw1poa4dR2VilkSwGDrjj5/ZIZ5xM5k6JI/Ld5QNLn+oZ0uE+A
         o2LFY4JW2aMGYjrriNfuwEQCTJNTffZp+89y/YYZ1FWojYd0MI8LNB/fgQRbOTzs3jeY
         H3x6kLI6tfb1ZCJ+8qhdPpEslSf09I6TZjJdgQKM1J+mUasf8GlvS40HNM0gA2nOQ+y6
         bxxg==
X-Forwarded-Encrypted: i=1; AJvYcCVKs7QUPaJzH7ejmGvGgKZHf3gUwJTB+BUO0wS0h4eCqpBbtzqiSYwc26Dhu9e/+G/1yiCC6cc2T8upay5WqD9dc+2IaA==@vger.kernel.org, AJvYcCXWgwK3xvEF6t0zm/5mHtMfE/PF/32uEGmKlnoteJdP+Ig2ahQLuBJepfv6AKUqPUSVOkQi83BX8Hc6Mqc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy4S6xvA03Gn8RwAXAnm6iwSw+AsmKYL+aXb1+3wSXauK3JQrQ
	Imt7SzfXd4LBggac3jljADtsVFa1RJlZVKbfUl1XlP0Y1rAQy4dE16L1pCgkFZNq4RVYZ2xt5mC
	/qfd79H6vbMVjYq17fg75ZEL4Qgc=
X-Gm-Gg: ASbGncsJdJIFeAlEtjXWkBMl2+pZkrxR7Sp4Gd4FkXwM5WwCFnDYbnjFK/goyMHpPit
	GG4eMhojaj8LZHIxOgU9GqfYz9FML1Ja5oFSBjAg=
X-Google-Smtp-Source: AGHT+IGW2/B/EQWW9WKmCPK7iLdAAXSA0yjVZ478dofpq/TB3EKG0ett8Ah0bGCiLYRFqQebDErpBG5IeQWIwL382z8=
X-Received: by 2002:a17:90b:2c84:b0:2ee:bbe0:98c6 with SMTP id
 98e67ed59e1d1-2f452dfcb28mr89212435a91.8.1736076006408; Sun, 05 Jan 2025
 03:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-1-b58164718903@gmail.com> <uizjjmxs44ajzekcndb2qfkuqctvgi3nolmoeg6zdq5lteewxs@ztj5jp6wrakj>
In-Reply-To: <uizjjmxs44ajzekcndb2qfkuqctvgi3nolmoeg6zdq5lteewxs@ztj5jp6wrakj>
From: Hridesh MG <hridesh699@gmail.com>
Date: Sun, 5 Jan 2025 16:49:30 +0530
Message-ID: <CALiyAomC-QXuMWs2i50SK2f=F7Te5QTbx1f1i-MWhF=STLmmEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/x86: acer-wmi: use WMI calls for platform
 profile handling
To: Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 10:43=E2=80=AFPM Kurt Borja <kuurtb@gmail.com> wrote=
:
>
> On Sat, Jan 04, 2025 at 08:59:20PM +0530, Hridesh MG wrote:
> > Improve the platform profile handling by using WMI calls to fetch the
> > current platform profile instead of directly accessing it from the EC.
> > This is beneficial because the EC address differs for certain laptops.
> >
> > Link: https://lore.kernel.org/platform-driver-x86/d7be714c-3103-42ee-ad=
15-223a3fe67f80@gmx.de/
> > Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Hridesh MG <hridesh699@gmail.com>
>
> Hi Hridesh,
>
> > ---
> >  drivers/platform/x86/acer-wmi.c | 189 ++++++++++++++++++++++++++++----=
--------
> >  1 file changed, 133 insertions(+), 56 deletions(-)
> >
> > diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/ace=
r-wmi.c
> > index b3043d78a7b38a7b773da5ecd4846ca11e8595f5..5370056fb2d03a768162f2f=
1643ef27dc6deafa8 100644
> > --- a/drivers/platform/x86/acer-wmi.c
> > +++ b/drivers/platform/x86/acer-wmi.c
> > @@ -31,6 +31,7 @@
> >  #include <acpi/video.h>
> >  #include <linux/hwmon.h>
> >  #include <linux/units.h>
> > +#include <linux/unaligned.h>
> >  #include <linux/bitfield.h>
> >
> >  MODULE_AUTHOR("Carlos Corbacho");
> > @@ -68,8 +69,11 @@ MODULE_LICENSE("GPL");
> >  #define ACER_WMID_GET_GAMING_SYS_INFO_METHODID 5
> >  #define ACER_WMID_SET_GAMING_FAN_BEHAVIOR 14
> >  #define ACER_WMID_SET_GAMING_MISC_SETTING_METHODID 22
> > +#define ACER_WMID_GET_GAMING_MISC_SETTING_METHODID 23
> >
> > -#define ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET 0x54
> > +#define ACER_GAMING_MISC_SETTING_STATUS_MASK GENMASK_ULL(7, 0)
> > +#define ACER_GAMING_MISC_SETTING_INDEX_MASK GENMASK_ULL(7, 0)
> > +#define ACER_GAMING_MISC_SETTING_VALUE_MASK GENMASK_ULL(15, 8)
> >
> >  #define ACER_PREDATOR_V4_RETURN_STATUS_BIT_MASK GENMASK_ULL(7, 0)
> >  #define ACER_PREDATOR_V4_SENSOR_INDEX_BIT_MASK GENMASK_ULL(15, 8)
> > @@ -115,6 +119,13 @@ enum acer_wmi_predator_v4_sensor_id {
> >       ACER_WMID_SENSOR_GPU_TEMPERATURE        =3D 0x0A,
> >  };
> >
> > +enum acer_wmi_gaming_misc_setting {
> > +     ACER_WMID_MISC_SETTING_OC_1                     =3D 0x0005,
> > +     ACER_WMID_MISC_SETTING_OC_2                     =3D 0x0007,
>
> These OC settings should be added only if you add support for them.
>
> I noticed acer_toggle_turbo() uses these settings. For consistency, I
> think it should be refactored to use WMID_gaming_set_misc_setting()
> instead of WMID_gaming_set_u64().
Yeah I agree. Actually, now that we have this function, this
particular case in WMID_gaming_set_u64() is redundant, so can I remove
it? (sorry if this is a dumb question)

        switch (cap) {
        case ACER_CAP_TURBO_OC:
            method_id =3D ACER_WMID_SET_GAMING_MISC_SETTING_METHODID;
            break;
        }

> > +     ACER_WMID_MISC_SETTING_SUPPORTED_PROFILES       =3D 0x000A,
>
> This should be added in patch [2/3].
>
> > +     ACER_WMID_MISC_SETTING_PLATFORM_PROFILE         =3D 0x000B,
> > +};
> > +
> >  static const struct key_entry acer_wmi_keymap[] __initconst =3D {
> >       {KE_KEY, 0x01, {KEY_WLAN} },     /* WiFi */
> >       {KE_KEY, 0x03, {KEY_WLAN} },     /* WiFi */
> > @@ -751,20 +762,12 @@ static bool platform_profile_support;
> >   */
> >  static int last_non_turbo_profile;
> >
> > -enum acer_predator_v4_thermal_profile_ec {
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO =3D 0x04,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO =3D 0x03,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE =3D 0x02,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET =3D 0x01,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED =3D 0x00,
> > -};
> > -
> > -enum acer_predator_v4_thermal_profile_wmi {
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI =3D 0x060B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI =3D 0x050B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI =3D 0x040B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI =3D 0x0B,
> > -     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI =3D 0x010B,
> > +enum acer_predator_v4_thermal_profile {
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET          =3D 0x00,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED       =3D 0x01,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE    =3D 0x04,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO          =3D 0x05,
> > +     ACER_PREDATOR_V4_THERMAL_PROFILE_ECO            =3D 0x06,
> >  };
> >
> >  /* Find which quirks are needed for a particular vendor/ model pair */
> > @@ -1477,6 +1480,45 @@ WMI_gaming_execute_u64(u32 method_id, u64 in, u6=
4 *out)
> >       return status;
> >  }
> >
> > +static int WMI_gaming_execute_u32_u64(u32 method_id, u32 in, u64 *out)
> > +{
> > +     struct acpi_buffer result =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +     struct acpi_buffer input =3D {
> > +             .length =3D sizeof(in),
> > +             .pointer =3D &in,
> > +     };
> > +     union acpi_object *obj;
> > +     acpi_status status;
> > +     int ret =3D 0;
> > +
> > +     status =3D wmi_evaluate_method(WMID_GUID4, 0, method_id, &input, =
&result);
> > +     if (ACPI_FAILURE(status))
> > +             return -EIO;
> > +
> > +     obj =3D result.pointer;
> > +     if (obj && out) {
> > +             switch (obj->type) {
> > +             case ACPI_TYPE_INTEGER:
> > +                     *out =3D obj->integer.value;
> > +                     break;
> > +             case ACPI_TYPE_BUFFER:
> > +                     if (obj->buffer.length < sizeof(*out))
> > +                             ret =3D -ENOMSG;
> > +                     else
> > +                             *out =3D get_unaligned_le64(obj->buffer.p=
ointer);
> > +
> > +                     break;
> > +             default:
> > +                     ret =3D -ENOMSG;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     kfree(obj);
> > +
> > +     return ret;
> > +}
> > +
> >  static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
> >  {
> >       u32 method_id =3D 0;
> > @@ -1565,6 +1607,48 @@ static void WMID_gaming_set_fan_mode(u8 fan_mode=
)
> >       WMID_gaming_set_u64(gpu_fan_config2 | gpu_fan_config1 << 16, ACER=
_CAP_TURBO_FAN);
> >  }
> >
> > +static int WMID_gaming_set_misc_setting(enum acer_wmi_gaming_misc_sett=
ing setting, u8 value)
> > +{
> > +     acpi_status status;
> > +     u64 input =3D 0;
> > +     u64 result;
> > +
> > +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, settin=
g);
> > +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_VALUE_MASK, value)=
;
> > +
> > +     status =3D WMI_gaming_execute_u64(ACER_WMID_SET_GAMING_MISC_SETTI=
NG_METHODID, input, &result);
> > +     if (ACPI_FAILURE(status))
> > +             return -EIO;
> > +
> > +     /* The return status must be zero for the operation to have succe=
eded */
> > +     if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +static int WMID_gaming_get_misc_setting(enum acer_wmi_gaming_misc_sett=
ing setting, u8 *value)
> > +{
> > +     u64 input =3D 0;
> > +     u64 result;
> > +     int ret;
> > +
> > +     input |=3D FIELD_PREP(ACER_GAMING_MISC_SETTING_INDEX_MASK, settin=
g);
> > +
> > +     ret =3D WMI_gaming_execute_u32_u64(ACER_WMID_GET_GAMING_MISC_SETT=
ING_METHODID, input,
> > +                                      &result);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /* The return status must be zero for the operation to have succe=
eded */
> > +     if (FIELD_GET(ACER_GAMING_MISC_SETTING_STATUS_MASK, result))
> > +             return -EIO;
> > +
> > +     *value =3D FIELD_GET(ACER_GAMING_MISC_SETTING_VALUE_MASK, result)=
;
> > +
> > +     return 0;
> > +}
> > +
> >  /*
> >   * Generic Device (interface-independent)
> >   */
> > @@ -1833,9 +1917,8 @@ acer_predator_v4_platform_profile_get(struct plat=
form_profile_handler *pprof,
> >       u8 tp;
> >       int err;
> >
> > -     err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSET, &tp);
> > -
> > -     if (err < 0)
> > +     err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTING_PLATF=
ORM_PROFILE, &tp);
> > +     if (err)
> >               return err;
> >
> >       switch (tp) {
> > @@ -1865,36 +1948,33 @@ static int
> >  acer_predator_v4_platform_profile_set(struct platform_profile_handler =
*pprof,
> >                                     enum platform_profile_option profil=
e)
> >  {
> > -     int tp;
> > -     acpi_status status;
> > +     int tp, err;
> >
> >       switch (profile) {
> >       case PLATFORM_PROFILE_PERFORMANCE:
> > -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI;
> > +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO;
> >               break;
> >       case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> > -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE_WMI;
> > +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE;
> >               break;
> >       case PLATFORM_PROFILE_BALANCED:
> > -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> >               break;
> >       case PLATFORM_PROFILE_QUIET:
> > -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET_WMI;
> > +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET;
> >               break;
> >       case PLATFORM_PROFILE_LOW_POWER:
> > -             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO_WMI;
> > +             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_ECO;
> >               break;
> >       default:
> >               return -EOPNOTSUPP;
> >       }
> >
> > -     status =3D WMI_gaming_execute_u64(
> > -             ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, NULL);
> > -
> > -     if (ACPI_FAILURE(status))
> > -             return -EIO;
> > +     err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_PLATF=
ORM_PROFILE, tp);
> > +     if (err)
> > +             return err;
> >
> > -     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> > +     if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> >               last_non_turbo_profile =3D tp;
> >
> >       return 0;
> > @@ -1923,6 +2003,7 @@ static int acer_platform_profile_setup(struct pla=
tform_device *device)
> >               set_bit(PLATFORM_PROFILE_LOW_POWER,
> >                       platform_profile_handler.choices);
> >
> > +
>
> Please, drop this extra line.
>
> ~ Kurt
>
> >               err =3D platform_profile_register(&platform_profile_handl=
er);
> >               if (err)
> >                       return err;
> > @@ -1931,7 +2012,7 @@ static int acer_platform_profile_setup(struct pla=
tform_device *device)
> >
> >               /* Set default non-turbo profile  */
> >               last_non_turbo_profile =3D
> > -                     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED_WMI;
> > +                     ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED;
> >       }
> >       return 0;
> >  }
> > @@ -1946,12 +2027,10 @@ static int acer_thermal_profile_change(void)
> >               u8 current_tp;
> >               int tp, err;
> >               u64 on_AC;
> > -             acpi_status status;
> > -
> > -             err =3D ec_read(ACER_PREDATOR_V4_THERMAL_PROFILE_EC_OFFSE=
T,
> > -                           &current_tp);
> >
> > -             if (err < 0)
> > +             err =3D WMID_gaming_get_misc_setting(ACER_WMID_MISC_SETTI=
NG_PLATFORM_PROFILE,
> > +                                                &current_tp);
> > +             if (err)
> >                       return err;
> >
> >               /* Check power source */
> > @@ -1962,54 +2041,52 @@ static int acer_thermal_profile_change(void)
> >               switch (current_tp) {
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO;
> >                       else
> >                               tp =3D last_non_turbo_profile;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_PERFORMANCE:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_BALANCED:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_E=
CO;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_P=
ERFORMANCE_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_P=
ERFORMANCE;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_QUIET:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               case ACER_PREDATOR_V4_THERMAL_PROFILE_ECO:
> >                       if (!on_AC)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_B=
ALANCED;
> >                       else if (cycle_gaming_thermal_profile)
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_Q=
UIET_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_Q=
UIET;
> >                       else
> > -                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO_WMI;
> > +                             tp =3D ACER_PREDATOR_V4_THERMAL_PROFILE_T=
URBO;
> >                       break;
> >               default:
> >                       return -EOPNOTSUPP;
> >               }
> >
> > -             status =3D WMI_gaming_execute_u64(
> > -                     ACER_WMID_SET_GAMING_MISC_SETTING_METHODID, tp, N=
ULL);
> > -
> > -             if (ACPI_FAILURE(status))
> > -                     return -EIO;
> > +             err =3D WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTI=
NG_PLATFORM_PROFILE, tp);
> > +             if (err)
> > +                     return err;
> >
> >               /* Store non-turbo profile for turbo mode toggle*/
> > -             if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO_WMI)
> > +             if (tp !=3D ACER_PREDATOR_V4_THERMAL_PROFILE_TURBO)
> >                       last_non_turbo_profile =3D tp;
> >
> >               platform_profile_notify(&platform_profile_handler);



--=20
Thanks,
Hridesh MG
