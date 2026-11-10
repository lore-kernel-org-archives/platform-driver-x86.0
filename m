Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794328392;
	b=aX6APKN1HqUNr5COdU9ytJsxvlZ21OKbo6LHV6Cz5IXB4Tq/s4sJUllqolzk37708aq3
	 Mw/96cn8WJK4ZrYyN9RoMkvArPEfCeKRy+LVyQX+uVF6gUJbD3b/xHPxCmL0T+2ipE4Gs
	 Rvb8A7SfAfvSts3erIVAFAI2Nd8V7tZp0Iq5Q6uuyTzr55Xgm+zejKUVF7GrLzZKw0fRX
	 yEQCJQ+TGYOQ0zACCaECKd9kCxOOLRzEBBzIY6ivcAwakmWWZz7opTR6yZb3GbuQlSJvB
	 +m+ubieleJFRvTMA/QR0j9eLpuADlaUYtuo2QS+VIXuc80TFSgRBdQdp6WvrTf+ZBqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
	b=bcbZYinqPBP0NBzJqmDVzFPPO5Q6MyVfMDmH24RXddssTfG0v1XNZz0eRlYshORARYc9
	 pvypTjuYLifZdIGt/7GI500dc2/3xPbx4FjnU4x/N1eyTuL5YTQSG24faIQh3DKp8ydRM
	 2PZeFrnFXyd4PGk8PmRuTOtPowh98vbOALY3KL3f4pbHYtPovqF4gG/a5OWI6uQ3ukLgZ
	 oHKH/NlhP1Cc8w7D9zIcYbXPhf2qhuk78pnoFzsgJ84TSORDmB9IEbYO0Gx60RkdvzaZ0
	 4hP9c6P0dRCqpPrA0D/yN/aDyZmR/l7Hkqt1et/xQ6IU63M/kRYx7YDtvG2PdlqEpwg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=gM7oiizs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.51
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B07606A213
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 16:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03B07606A213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=gM7oiizs
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1514357fac.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Nov 2026 08:33:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794328391; cv=none;
        d=google.com; s=arc-20260327;
        b=BPS9kNVm9o8x0KLECRD3tgzKlfYjOzBZ9eM6Mws9rdyJ2g7Ws238eWzU/lJ4/lO3Ny
         77xUlXLATUzcy9dgkFYdRjXBb6XOVulCPK62XyptzT9Uv9MIGkfxP8xUjA6/0SLkVdpO
         1c8WScDJowWjr22FIoO6vR29bLQ/8CDX5KJoroabZCUsd8gsG/m4PQF/oz22KjygeZ1q
         nDntajFS1QYEhNrnknTmDW+JkLRgibdLIllDBIyxJNgyd2cbx0DGzRNPeX9oN5xqfwz8
         cbJcPYswTt+GsLIB9ewUxls92aL5WX0yAxiPhSm5rvhFxyrQ6vMzRk64c5+RRYTvp+hY
         aw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        fh=DwlvwD2XyKkeccJbRUoVquRg2sQEDkNLFsSxYmaQV0U=;
        b=VFq88mQbXaGyB4207MpHUWXJAiM5WzAnGmvVJb0D/kFgDWPCG0LoISjOHoqV/3fPdJ
         ywnWXZWx2RaCgWdekhAM0N/ktTXnplNSC2qVNgWy7fejEk6RVF28GpgC1xlC+pjz4Ify
         G8iAA2n6XL8bSy8QtKXtJZMJ/6HNesj3jSd5/UwahX1mzGygp7eSCAuqFBecSLX/b3on
         M7eZVq+X/z0MAnNhhuOY/yncsIUTSe05UCxaN/vglx0jd8NCFw7JHAGZGdCAlhmKSkJC
         UrBLnrAAuOZcOAtsQ38utV22XYJnQVfdSy8G8GuNJZbC3JvzjBATmOjdQJPaPdKAZ1pd
         F+MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794328391; x=1794933191; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        b=gM7oiizs1Y/eHxO9y2LzImxy+byQm3osR5kRdqeM6jplZ3ADuh/iqdwr+0GWZ2K7SL
         ej7aFo4wTYwixvNkLRa+8VYo00iXcwfz4aPhix+7cT18J9l+u+XZnBcHinV4FyVYakj1
         qnHf94iwwHC/qZlmTQJ8wrzRFbjg5oc6nTeFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328391; x=1794933191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJRcidEACEQ5dkYBEnEP8dA7XCk9V+VFTojDk1xSHTI=;
        b=t2Y2aKXqD2QW1WfBcAmOnJQe9vksMPrDUMX/xeajMhrXBEGICS0hy4frItW7vNRC0H
         xRLg/0o4rz6v8ngg9tkFhUrTQuUY0MX8BoJ8FqyxxajiNIc5WHy7LKYO9P+9NgjWvGjX
         aDc3LlOtWyL0BGF9mVuhs0hFiOIKMT9nobk2BFF71bmBd01ohMYIvqzmWQhqenFCx4K9
         AzCgpcBndGLR2LdipE1mq/sF+VzzBnQiCSIyPuXUFgjMI8R6/869TZkSUUUyO//jph9J
         F+47IbtwGKQLAcnuutAzubM6cEgUdK+nTVxmsri9Drn1fAKg8bUEojaqkt33Jiq/bNnK
         ILoA==
X-Forwarded-Encrypted: i=1; AL+hErGYOIdV+Ehsopo/RozM6n/WiTBlzwRk5m6ZyhPXFQZ+t87CajiWQmedDafHXTrpIAu9Dst/gSXojPOiVmzuRre31iSs@vger.kernel.org
X-Gm-Message-State: APuU4Z/st6qmX5uva1bNOkW9AFsblxsi+m24VzmM4MId0VqQqUSzh67y
	anjca2vZA/n72BRt7MXAJ7h0UJDNEne3IiQO/UUo4AITLrmX4a6WlD97GSeB835bmibtMocdweE
	MX2lB+pG5DpQSt/QZXqqfLOH/bywgXb2sMZr6fli59g==
X-Gm-Gg: AYBFou3q8Dp8HrNkUYlVAjpS0iGyq/zQ8Jd7l/lvKBOMIX+HwAWyIv1vJs8oB6YjpYr
	bDB6pUXgxVj49fRb1j2mFjQ7ofBR7fUSZ1WqlnrAMX3Je12pi0XeXdwnRMKBjJnNBFMTYCFcG+h
	lcw0JZyrluwiDJYczZ9Q/4L2rV2pt/RXNMpEJMBg+dzTyJl0gvqThHNqGdgjKUy9aV3f6ebRaxb
	Ta61fWAF98xAk1EGHJ0SFVZ39bJci6IhRZN/+j/qIAb3Cen9EqeIwBqqzQCh7F8FSFmWmb08sB5
	GGgtE8gbffY1zYCldKnP7cLSENtWmmNTKkHF2Xf3occ+gym6OYzAORPZjXv37aELdwH1h37Lw+5
	ik4+0lVQiDLbX/4+s8WR7+5Oqn5dG05gCcnREK1NZ1/7Olt4K65iMjBbJSc61FY61FCc1IJ6kmm
	e8zw8ryS+PaLqd/Talk5XuDtJ51kg=
X-Received: by 2002:a05:6808:124d:b0:4b9:a829:f015 with SMTP id
 5614622812f47-5683cc4629fmr2122822b6e.33.1794328390808; Tue, 10 Nov 2026
 08:33:10 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106114300.936782-1-chris@miget.com> <20261106114300.936782-5-chris@miget.com>
 <7e925ef8-7cdd-4e16-8761-dbceea94826f@gmail.com>
In-Reply-To: <7e925ef8-7cdd-4e16-8761-dbceea94826f@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Tue, 10 Nov 2026 17:32:57 +0100
X-Gm-Features: AclHuK-uCOw37m1lP8LAlTd9DiIEMIt7OUjsd4bZo0FVIGHft-PwaDPipOW28c4
Message-ID: <CAAcRvKPYjUoGxHPeKTc7qRKZmHMC8KT7a8DE117_qUO+O2suoA@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>, Arsenova <7z0423arsenova@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Nov 2026, Mingyou Chen wrote:
> Does this quirk entry really necessary?
>
> Since only supported hardware sends 0x28. And 0x28 is not used for other
> proposes.

No, I'll drop it in v5 and cycle on 0x28 for every model, so the TM2424
patch stays as it is and keeps your Reviewed-by. Retested without the
flag on v7.4-rc1, on battery: three Fn+K presses from low-power set
0x09, 0x03 and 0x02, each followed by a single 0x16.

I'll send v5 on top of your next version of the merge series, or on
v15 if it stays.

Thanks,
Chris


On Fri, Nov 6, 2026 at 2:19=E2=80=AFPM Mingyou Chen <qby140326@gmail.com> w=
rote:
>
> On 11/6/26 19:43, Chris Taraszka wrote:
> > On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> > the firmware does not change SystemPerMode itself. The event is a
> > request that the vendor software acts on; without that software Fn+K
> > does nothing on Windows either, and on Linux it is currently logged as
> > an unknown event.
> >
> > Add a quirk for this and call platform_profile_cycle() from the control
> > device when the event arrives, so Fn+K cycles through the profiles that
> > all platform profile handlers support. Models without the quirk keep
> > ignoring the event.
> >
> > Suggested-by: Hans de Goede <hansg@kernel.org>
> > Signed-off-by: Chris Taraszka <chris@miget.com>
> > ---
> >
> > Notes:
> >      Unchanged since v3.
> >
> >   drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform=
/x86/bitland-mifs-wmi.c
> > index 4d02cd9e8a6b..84d1223d0ec6 100644
> > --- a/drivers/platform/x86/bitland-mifs-wmi.c
> > +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> > @@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
> >
> >       bool return_code_at_end;
> >       bool skip_ac_type_check;
> > +
> > +     /* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to =
the OS */
> > +     bool cycle_profile_on_key;
>
> Does this quirk entry really necessary?
>
> Since only supported hardware sends 0x28. And 0x28 is not used for other
> proposes.
>
> >   };
> >
> >   static const struct bitland_profile_entry default_profile_entries[] =
=3D {
> > @@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quir=
ks =3D {
> >       .profile_entries =3D tm2424_profile_entries,
> >       .num_profile_entries =3D ARRAY_SIZE(tm2424_profile_entries),
> >       .skip_ac_type_check =3D true,
> > +     .cycle_profile_on_key =3D true,
> >   };
> >
> >   static const struct dmi_system_id bitland_mifs_dmi_table[] =3D {
> > @@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
> >       WMI_EVENT_MIC_MUTE              =3D 33,
> >       WMI_EVENT_RESERVED_23           =3D 34,
> >       WMI_EVENT_OPEN_APP              =3D 35,
> > +     WMI_EVENT_PERFORMANCE_CYCLE     =3D 40,
> >   };
> >
> >   enum bitland_mifs_event_type {
> > @@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list=
);
> >   enum bitland_notifier_actions {
> >       BITLAND_NOTIFY_KBD_BRIGHTNESS,
> >       BITLAND_NOTIFY_PLATFORM_PROFILE,
> > +     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
> >       BITLAND_NOTIFY_HWMON,
> >   };
> >
> > @@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifi=
er_block *nb,
> >       case BITLAND_NOTIFY_PLATFORM_PROFILE:
> >               platform_profile_notify(data_ctx->pp_dev);
> >               break;
> > +     case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> > +             if (data_ctx->pp_dev)
> > +                     platform_profile_cycle();
> > +             break;
> >       case BITLAND_NOTIFY_HWMON:
> >               fan_info =3D data;
> >
> > @@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wm=
i_device *wdev, u32 payload)
> >   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> >                                   const struct wmi_buffer *buffer)
> >   {
> > +     struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev=
);
> >       const struct bitland_mifs_event *event =3D buffer->data;
> >       struct bitland_fan_notify_data fan_data;
> >       u8 brightness;
> > @@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_d=
evice *wdev,
> >                                            NULL);
> >               return;
> >
> > +     case WMI_EVENT_PERFORMANCE_CYCLE:
> > +             if (!data->quirks->cycle_profile_on_key)
> > +                     break;
> > +
> > +             blocking_notifier_call_chain(&bitland_notifier_list,
> > +                                          BITLAND_NOTIFY_PLATFORM_PROF=
ILE_CYCLE,
> > +                                          NULL);
> > +             return;
> > +
> >       /*
> >        * The device has 3 fans (CPU, GPU, SYS),
> >        * but there are only the CPU and GPU fan has events
