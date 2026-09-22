Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A63E51FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 08:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790064813; cv=pass; b=s0VarsWGyhaQ9xO3HtktIDa6UyQ23j/SMSMXDzoQ2AqqMbp58lOyghacXUok/ORcKdGa854U9ZMmJOBZyITNzAEanXwSUWKSIDlpyxqZDh0N8oJjra0AqzL9wBLAdPluZMTrHbC0bXaaqha+DlpUUwXyAAYW0hqb1y21Pkpxtz8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790064813; c=relaxed/simple;
	bh=z4yJ4d/PQ9eEbkDFB5YDhTveMk44MET3fVjIGIItEhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdG6UtsbtUBgGTEjfKe6/UqsDb3Qb8u4xJIzXRLlLjUkUYNsG1v9M097cvP63rx68/yp4NwtevAY1KC/saf3qb2LS47GwN7OpVmQArKodX3CSnqlCFEx/6bgq4d2AM6FL8zLQjpBOs89Ff2GEFPAavgxqAnHJQnt3WApCrv/5So=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CumDQ3+V; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CumDQ3+V"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1b327so2935990d50.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 01:13:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790064810; cv=none;
        d=google.com; s=arc-20260327;
        b=heiA0v3Gh6RBKeBwis/JVzS8tazt9KejhKTJAtOAGOXCNeQl3CeVhqgarHnOfnfxPO
         6MQHwBxM2guC/OcRRthhBJCtURZ5QrhnY4Ku+gxFmHRKvyi5shXoZIncfB2ewJhmtOcj
         gE9dTpkBf97Unn2B7ZPBVVJc0xIP8AscmaLPM723oAQQS//ZjJSrAriw/oSb8pc+neSv
         qQO7Cijy46fa34/G01hEAYVOpyARtmXZduYDoNvYjNlZL8GfETeKbR2LUid4ala3t/ug
         1/jP0JsLpa5p8gWcFCtts369zQCYaa3m71SSVF3VyeTzh0CLeMtoorhlEOrLjdfcxAX3
         gexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        fh=6eZhWUh+8Fc6SscT7P1LXQR/+vrdM9qFd/0ijQc1ou4=;
        b=W0w6cG6YpT+ln7oyb12oaaO8Ii8d/b9vvmu1CVaZcrwwahz+tr7MEoFvKrAfAbSJDE
         IEvv/t0VMzcLKN2EqLZJKuF3CQR4XzH3JvknIm+t1BFOJWfAJ+viBU3bKqsZvJo++i6i
         pl2WUaAg1LaNbET1TPxw7zqF/d2AarC4GtQKzl7glcM4G5Ju5CPlrg/WFKj6IaOR2FJ+
         eJNOf6RX3oYQi02ph2zhPBkkrQc2hsnaLrdnSZo3nmGXM+mtdaCFHGsO9Xt6zoNI2F3O
         DUkRoxUHOufygREvfwuKWWnZqtTv/c590LQTlHmgOpz9Ny7mwyvws0eYWB3a7Epfzii3
         5sPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790064810; x=1790669610; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        b=CumDQ3+VaWCfRAs+HRcvq/AzKHnhOr/Rj0MD+YQk4F3cQ2sJB06TZPqyScRcjdLmr9
         JVzPilfNhHcGu6dZNJkcW6VNxmV+O7fzVaYssQJX9X0BTtmzbJD5aZiS7/wbGMJ83D+L
         6rtop9AoOuw8RoLC+pDt0JQFtekfmuRGrEMO6u1WFDm7Tdt2AJ0m3nfKsD1m9izTA1eB
         lfRlB0wWGy0J0f5bzLREieD7wOVb1ceQy6ckjeUAez0B1Nbf2gfbGbPeE9NK0FpGbIpo
         kmKMAR4EERHXZchyCoNI6DbWYm2QijgPOVF6H4bEIjibkOF8gUd4js+7LWTPko3UIQJe
         02Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064810; x=1790669610;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi+eaHvPeGF3Sdq7zvAZY/QjCGqMSzvenzOG4HC773o=;
        b=Mg9aqD1CUCQKAn7jCbV1tmuzE+F9QDXe+mWMK38M0dM5lNHtPUncN0qVH8pBQFb3qF
         j+feuDLg4E5C2mmPE8F4c3R1WMH34wJJxayR0qZO76ONev49Qgy7mYe4ukXCV8tep8J2
         bmN+0bVmLsjRgH7ib2G6WMC3Q0PWOUMh1f6+PTgyXSbMERhlFItiONKsE2/DZ5mozpEp
         sWjpvw7iV7njYsYrAK5AAOxSsBuJFO7fIfHRMmJ8Fc3VEScaKMbEKL7J4pwAupJVHSWp
         v/sOm568ZbPbqDLp0fobYTJeXGB/qtp1IN8nVi6TPSBcwhUyoE9md7o+65z1pFRrT/wq
         FMrQ==
X-Gm-Message-State: AFuF++nWTVjKFNRTo/F14eMgL5QcVOdCLslnedsC1qKNOy1Uox7XkN4d
	L7nLpJzH+pwwaLDicJ8gjj2FSNJGDpmiFTei/xjkHi+ADmJi1LVj3M2yD5tvB430X+Q/aNUA6IE
	9wXtMIoIEd289e0zXxPzcjcc/NjamOHg=
X-Gm-Gg: AYBFou0h5FocLO26FMZzXanMav7KGsfQBbcseks21XYvE7QfX6Z5uQ0YgGLXO2kOOnh
	3r/VWRHgQ3J4tQZdMsQ1o5AarWMO4dfT+4dzJ/CBz2fWF5QMUWkYZ9d9+CaGf0k2+MvYc+lekzG
	9mDjqhDkujfKspblif6kDklJGIcZjxiAHqKDbS5+hyweSnqmGNhYklR3y0wEdPvfBOVxzAyb1aU
	bR8vX/rZ/H3fo17U55FcMvHnAMXGrbQOlJOOybsvSr0W8/MClJp++zDOCmxZrMhYwea5VVOO6rs
	VuehuWlyJ+3JcTAgejmdy3LQOZucoS0TyLG5g38D3TTpo5QfSc1VhLg4tg==
X-Received: by 2002:a05:690e:80d:10b0:671:1a13:99fa with SMTP id
 956f58d0204a3-6717fcde0a7mr2703957d50.27.1790064810342; Tue, 22 Sep 2026
 01:13:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921075312.120983-1-lgs201920130244@gmail.com> <cdb67eed-9e75-4310-ae4f-21ca67f20bd2@web.de>
In-Reply-To: <cdb67eed-9e75-4310-ae4f-21ca67f20bd2@web.de>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 16:13:17 +0800
X-Gm-Features: AcwNN1WgyEuKR8AButHilBQBtiaREfERPd_f4BSEyPirEeQ1c0aH3J078-wD1lE
Message-ID: <CANUHTR9+rLuPrd1aifKws++POOKSm+2jxBaJaC1iF5z5x0e13Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: simatic-ipc: fix platform device leak on
 registration failure
To: Markus Elfring <Markus.Elfring@web.de>
Cc: platform-driver-x86@vger.kernel.org, 
	Bao Cheng Su <baocheng.su@siemens.com>, 
	Benedikt Niedermayr <benedikt.niedermayr@siemens.com>, Hans de Goede <hansg@kernel.org>, 
	Henning Schild <henning.schild@siemens.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Tobias Schaffner <tobias.schaffner@siemens.com>, stable@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

Thanks for the suggestion.

On Mon, 21 Sept 2026 at 18:10, Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> =E2=80=A6
> > +++ b/drivers/platform/x86/siemens/simatic-ipc.c
> =E2=80=A6
> > @@ -118,8 +119,11 @@ static int register_platform_devices(u32 station_i=
d)
> >                       platform_device_register_data(NULL, pdevname,
> >                               PLATFORM_DEVID_NONE, &platform_data,
> >                               sizeof(struct simatic_ipc_platform));
> > -             if (IS_ERR(ipc_batt_platform_device))
> > -                     return PTR_ERR(ipc_batt_platform_device);
> > +             if (IS_ERR(ipc_batt_platform_device)) {
> > +                     ret =3D PTR_ERR(ipc_batt_platform_device);
> > +                     ipc_batt_platform_device =3D NULL;
> > +                     goto err_unregister;
> > +             }
> =E2=80=A6
>
> How do you think about to avoid duplicate checks and variable resets
> in such a function implementation?
>
> Regards,
> Markus

Would it make sense to share the cleanup path and rely on
platform_device_unregister() handling NULL/ERR_PTR, like this?

+static void unregister_platform_devices(void)
+{
+        platform_device_unregister(ipc_wdt_platform_device);
+        platform_device_unregister(ipc_led_platform_device);
+        platform_device_unregister(ipc_batt_platform_device);
+}
+
 static int register_platform_devices(u32 station_id)
 {
        u8 ledmode =3D SIMATIC_IPC_DEVICE_NONE;
        u8 wdtmode =3D SIMATIC_IPC_DEVICE_NONE;
        u8 battmode =3D SIMATIC_IPC_DEVICE_NONE;
        char *pdevname;
+       int ret;
        int i;

        ...

-       if (IS_ERR(ipc_batt_platform_device))
-               return PTR_ERR(ipc_batt_platform_device);
+       if (IS_ERR(ipc_batt_platform_device)) {
+               ret =3D PTR_ERR(ipc_batt_platform_device);
+               goto err_unregister;
+       }

        ...

-       if (IS_ERR(ipc_led_platform_device))
-               return PTR_ERR(ipc_led_platform_device);
+       if (IS_ERR(ipc_led_platform_device)) {
+               ret =3D PTR_ERR(ipc_led_platform_device);
+               goto err_unregister;
+       }

        ...

-       if (IS_ERR(ipc_wdt_platform_device))
-               return PTR_ERR(ipc_wdt_platform_device);
+       if (IS_ERR(ipc_wdt_platform_device)) {
+               ret =3D PTR_ERR(ipc_wdt_platform_device);
+               goto err_unregister;
+       }

        ...

        return 0;
+
+err_unregister:
+       unregister_platform_devices();
+       return ret;
 }

 ...

 static void __exit simatic_ipc_exit_module(void)
 {
-       platform_device_unregister(ipc_led_platform_device);
-       ipc_led_platform_device =3D NULL;
-
-       platform_device_unregister(ipc_wdt_platform_device);
-       ipc_wdt_platform_device =3D NULL;
-       platform_device_unregister(ipc_batt_platform_device);
-       ipc_batt_platform_device =3D NULL;
+       unregister_platform_devices();
 }

Would this be closer to what you had in mind?

If so, I'll follow Krzysztof's suggestion and organize the related
patches into a proper patch series before sending v2.

Thanks,
Guangshuo
