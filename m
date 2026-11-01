Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793550226;
	b=AiI8fKWektsv0/QL+CYUp55fnGDuP3RRzeqpcu37zvmGCPvpiwer0QJuTg0rU+Z+wz0l
	 yW+YokIpR8KhXw0R/4n27J2mGUbWYDVZ11xCUEH+T3Wr9TYTDJoaStQ59J1H7PzkRc65y
	 fSALDd2GckJJ6s4wlOnodZ+qABYecLueEa3wg9Peeg98AfQIeSUHgrqQKkKmMwRBj43Uj
	 H196Q403PUZHQ5ZOMB2Q2hRgmQt7amKz3Y/1sbU/6PP/D5PZFhb3Bq3mOhMlaJDwALNlr
	 OJ4zB+KCMq0qi3y/xNEQvbE34i/xhXhsaN2CX+6/rnfGZ4w3rnrQ/9M4SD0oQBFfSwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793550226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
	b=Ry/gw46RNnjV49AZi3YZjpWTcF1abYSLTwyDv/qMoI3VaJlrnREVcj0zd0zZwcv9SfLF
	 uC7fp5grYG9lXx2svSjtyU02OhpnStNkbruf97L6d4oaTQC7+KOegyJgAOV6NBDHm9tNk
	 rs/P4VAmvUmiJ2RKEhxa1jS/YOVqjhqsKrg0Fehu2RmuXykN7jwyozl+LtWHDjngJJvk5
	 Wy3TpZHfjFOKoqU36Az3fPpBYN0nP+EX7gVdhjAgZdLBCHWNYL6eN84bGdZZN7ciJqOpU
	 nvo494J8dRTyiqgik3p5PRuC6GpSgRxWJ2LHNhe9f8M61zHw8OzadIASfsdfxetK3ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Aw6WD+I8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF4606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75DF4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=Aw6WD+I8
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6dd7070699eso1896272eaf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:23:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793550225; cv=none;
        d=google.com; s=arc-20260327;
        b=qJxrENC8wc4nbcTzKe0YRfJCU5E9oOnLns2lOMn5mfkOVYxIhGwqunrEqkhgdKWS12
         1GjfcYuKibksvlslTVFYgl8rG7vrDi242+6SgMFdB4Zc7vjD+pOk27J3JtVU4f2TBihO
         iBwB3N8a9yV8sILAdBLmjS8dgir5BwdzWJxuI8vRTuc3MlSv0yZGQ76Zf4gGn8KE3YCq
         6M58jvNEex1vEiCFbMem2vf+9sUF0jv5bHgKZAwFmlTLgIQSbO1XskWgl66bJHHuFlvY
         SQwnxkfIEYNMCksNWdBxuoXzMasx3fQLxW/yr24UfHsEKjmQbcVCXtn/YH87Q3hFCK0W
         L5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        fh=XPucYpESTfNluQfaEZy8yxIgT7P8JScqv4+inwwRdto=;
        b=QoFopoid2+o5FaSjDQIUXooHFsqID3I2m57eqqfTf8wwl4rITuz7kJyEUfDHlu7VWO
         LAGaxp2wkzu4jAbOFnAo3EamC9pA1BCdRCLR8+xmhaxmmD+X/CVtUsWgmWFJ8jK6mLhP
         Wn99PI93nbHtdTisGjZlPrTaytMjWp8rIWjKi0zaiPooUysU5WqeLVXllkEMzrQ0hymr
         r5BOCyhx+dsOlx76DjAV4UeOMWb94Z/AfpmOLvrQH2T6crqQ/Calxjy7YCU73RZ+hfUj
         4sTYHRVRccP5bvp7prMSKT5BtNC2YSng2eDItxqr1N3VB3d6WqQsRXQt9IEBX1e412ol
         Z5Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793550225; x=1794155025; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        b=Aw6WD+I8+hGhGpmj37eOAbN7b01ftVLyy2dsNnP3vlYepvtos54zJz0Cq9RYmGeldx
         ajlOaK9cWG3FJBZInPM3tgEp5KZISklpvCoW087NSk0LbVU++Tb5HN9P1L9GWcs97Y+g
         pzqFdw+FVaHZHIWJvrWOjzJJnZw9G8WvY/Qek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793550225; x=1794155025;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgj/KSeFXnUIsMDU1UeDAewCE+Y7GVovPQtA+KPbLss=;
        b=LPqwnEwV5nNdZ1vG7Hg+ENRiVO1mJ4E2C8VrCjMo9R+XyKMtdr/K/Fqd7keffkPMnj
         gBzyGxHnfgjz7G6JL83HF2BhGt/bryahZ8Yxnue37GP57tw2+e2Tqg9hZQvB9XSLZI7b
         8lIH1bkR4NbOacC5qi52E9RdeCgoHeei9CSMEbpnT7BUfDFLCwu103NNQFXPkrxfjqu1
         O2vf2qhkyNpfLHE9wJuW2XMoMuupLK/gcKbADuqfhWUV3sHxfqAp+4zspVC04k4FhWje
         1CdLprWREK5d2aSknkzPQI8qLygJSZiPlnJryplOAy9WtEGQuZYnBgrwBzBCe/NMfj6H
         bOew==
X-Gm-Message-State: AFq9FYL0OevyclgFgQzv+faqdtoFyKio9dFWhEqo6esqfyYpNM5zpOv6
	BIZzDNq5VlL8HpV0ChQnC6yHT1niuLJJZtXWL5lX+KNA6clX0lHWBdBQne8UU8u6Cor/l8KBkAR
	1hJe3mm5NCWCYEfQMPmZ8Wi7GUvUlxwu+am+z3rHUEA==
X-Gm-Gg: AYBFou2aKz44Mg6wwzv8P9r+cFCttyZf9g0sIkiTnsxcghcgyBy4FAvloIzGqfiBFoy
	gRZsfTpEo5ESqeUFCky7tMjYBCMFp0xCcnu/PjOOXqHxMqw19IkFltvDXkYjzomu2+y/bFJAJ80
	ug6m8afF2eSHqwQSzpUiNUz2ubvFR0nLWMO0TEnr0sYKriOYZvr7cOFlSzdDyjPi4ivsfZ0mMGD
	mOo7FspIpzfW53lcV8+1hPxjK8yHNPqeknzf3ul8hC1k2PamobuEotpWoPcd3HkTqUO6JlUt8W5
	tajTAgrDA9adafYL1wWnHYrtjCWD5JBWrtNIZ6xRTerCosV1EdGNxnB9+p3kgj1Vc939lEQY+5k
	4FQldtSpBjzofINdmFIef81w2udIMP9AfKzhk1gB9c6scN48oLJ6o3EseTc2LmITfVx2ZnSsxvG
	39zjxCxodr2MnC2AipWwI5ALUPOg==
X-Received: by 2002:a05:6820:168a:b0:6f3:6cf9:f182 with SMTP id
 006d021491bc7-714f2480119mr4740296eaf.50.1793550225315; Sun, 01 Nov 2026
 08:23:45 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101144100.1043263-1-chris@miget.com>
In-Reply-To: <20261101144100.1043263-1-chris@miget.com>
From: Chris Taraszka <chris@miget.com>
Date: Sun, 1 Nov 2026 17:23:34 +0100
X-Gm-Features: AclHuK87kASEY1WffJQPQfxYIXO7Fza9xMyxIm6YyAKQG5rdvxp0M3XzA3a9A9s
Message-ID: <CAAcRvKOZMnZqPhTdktNm4RtxU02k4QFZGyOG0aXw654iU94Mmg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mingyou Chen <qby140326@gmail.com>, Ilya Gladyshev <ilya.gladyshev@linux.dev>, 
	Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is now patch 4 of v3, please drop this one:
https://lore.kernel.org/all/20261101161814.1325847-1-chris@miget.com/

Thanks,
Chris


On Sun, Nov 1, 2026 at 3:41=E2=80=AFPM Chris Taraszka <chris@miget.com> wro=
te:
>
> On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> the firmware does not change SystemPerMode itself. The event is a
> request that the vendor software acts on; without that software Fn+K
> does nothing on Windows either, and on Linux it is currently logged as
> an unknown event.
>
> Add a quirk for this and call platform_profile_cycle() from the control
> device when the event arrives, so Fn+K cycles through the profiles that
> all platform profile handlers support. Models without the quirk keep
> ignoring the event.
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>     Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) on AC,
>     with Mingyou's v15 and my two TM2424 patches, loaded on v7.3: four Fn=
+K
>     presses step performance -> low-power -> balanced -> performance ->
>     low-power. The bitland and SoC Power Slider handlers and SystemPerMod=
e
>     (EC 0x68) follow each press within a second, and power-profiles-daemo=
n
>     picks up the change.
>
>     Depends on Mingyou Chen's v15 "Merge redmi-wmi into bitland-mifs-wmi"=
 [1]
>     and on my "platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support=
"
>     v2 [2].
>
>     [1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gma=
il.com/
>     [2] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.co=
m/
>
>  drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x=
86/bitland-mifs-wmi.c
> index a72569d810e3..8a994f5b089e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -99,6 +99,9 @@ struct bitland_mifs_quirks {
>
>         bool return_code_at_end;
>         bool skip_ac_type_check;
> +
> +       /* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to =
the OS */
> +       bool cycle_profile_on_key;
>  };
>
>  static const struct bitland_profile_entry default_profile_entries[] =3D =
{
> @@ -125,6 +128,7 @@ static const struct bitland_mifs_quirks tm2424_quirks=
 =3D {
>         .profile_entries =3D tm2424_profile_entries,
>         .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
>         .skip_ac_type_check =3D true,
> +       .cycle_profile_on_key =3D true,
>  };
>
>  static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> @@ -168,6 +172,7 @@ enum bitland_mifs_event_id {
>         WMI_EVENT_MIC_MUTE              =3D 33,
>         WMI_EVENT_RESERVED_23           =3D 34,
>         WMI_EVENT_OPEN_APP              =3D 35,
> +       WMI_EVENT_PERFORMANCE_CYCLE     =3D 40,
>  };
>
>  enum bitland_mifs_event_type {
> @@ -216,6 +221,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
>  enum bitland_notifier_actions {
>         BITLAND_NOTIFY_KBD_BRIGHTNESS,
>         BITLAND_NOTIFY_PLATFORM_PROFILE,
> +       BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
>         BITLAND_NOTIFY_HWMON,
>  };
>
> @@ -792,6 +798,10 @@ static int bitland_notifier_callback(struct notifier=
_block *nb,
>         case BITLAND_NOTIFY_PLATFORM_PROFILE:
>                 platform_profile_notify(data_ctx->pp_dev);
>                 break;
> +       case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> +               if (data_ctx->pp_dev)
> +                       platform_profile_cycle();
> +               break;
>         case BITLAND_NOTIFY_HWMON:
>                 fan_info =3D data;
>
> @@ -921,6 +931,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_de=
vice *wdev, u32 payload)
>  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>                                     const struct wmi_buffer *buffer)
>  {
> +       struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
>         const struct bitland_mifs_event *event =3D buffer->data;
>         struct bitland_fan_notify_data fan_data;
>         u8 brightness;
> @@ -949,6 +960,15 @@ static void bitland_mifs_wmi_notify(struct wmi_devic=
e *wdev,
>                                              NULL);
>                 return;
>
> +       case WMI_EVENT_PERFORMANCE_CYCLE:
> +               if (!data->quirks->cycle_profile_on_key)
> +                       break;
> +
> +               blocking_notifier_call_chain(&bitland_notifier_list,
> +                                            BITLAND_NOTIFY_PLATFORM_PROF=
ILE_CYCLE,
> +                                            NULL);
> +               return;
> +
>         /*
>          * The device has 3 fans (CPU, GPU, SYS),
>          * but there are only the CPU and GPU fan has events
>
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
> prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
> prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
> prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
> prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
> prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
> prerequisite-patch-id: 36137eee73ea8cee3db81af887f1f0859ef02b3a
> prerequisite-patch-id: f0ba644539dc52241b96a74d6e32a6f06241e577
> --
> 2.56.0
>
