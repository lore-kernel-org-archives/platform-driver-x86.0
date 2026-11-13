Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794540390;
	b=4mGTXjNGhGh2tj/tryNeqHqxcLrmsLo07KsLQ6akDOKTCcKk41btoUWh+Z10X+xfo7ZJ
	 hV2rgWtQB3AjAwjBQM67XwbqbO6B0BV4N48QiilF2pdqQzcEBTUwbqnEUCpg/j6mVAI8R
	 68pdIcBq55E47zinpHB9bTym2xf761Kg+XT6mcAqlD8Jr8NxbB9U8miKOcZJYWbCbmUhY
	 ragOnICEFRmz9rV1Gb7ryN/KRaPpqU4QDXyjzOi/UADa9cofpM9OMSkeaDIAqwRNhj4jy
	 4Iy0+yP5lwq0XxEHzpZWf/zFHCQrxL6VSSyjMU56XQ4dvgc+3HtlvPdJix3U6dg9X2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794540390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
	b=XUvPnjlab2LNhMM5WLo543Uu4v9E4zJKADb5aobjOBy2oOC7pBQPpGj8MGB1gZwUeH5a
	 383oSAXdg+OFqejL21mL0HshFgLniYhAoQtiDc7vdyVEA7Xx3QQc71u2AybSkGm43PtRi
	 s5OpnWiiHoo2CqA6zaCkIbYF8MUMZhJlXvRv4i7TZz0/PMMuYYESxyX2inlmN8hf9kUJK
	 BXEB+Gyq1I/IACx1Dljr97P2IGz5vcP6gua4Qpy621yxw8gBX1QFEXv52WdXzmTM9C0u2
	 irPiX17cQqNMgn1Ri2QBLK6nlkYMs3hkSV/CqCGRf87LMYQmoax/45GFOAnhJ2ynrLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kxN73p8o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.122
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635DD606A323
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 03:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635DD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=kxN73p8o
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45D16405EC
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794540382;
	bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kxN73p8oSR5vGLoJc/vys9znvxLI91UCrlejOnyW+sCZDzxkkBoLWm97eknDcm3gd
	 xxCf9sjm1b8mJGHm3K5ee39RupQxZd7XAgy9xNG+WF80FYV67ZBjQCyMYTOjO2nAMF
	 LXCtbJXTAfaqYxDaHONyPxIZ5Kh03G+5b/FJ9nGMMpZz6KN+zpDzaiYvjjZxeMwDRi
	 ZlsBo77vx20S5G0KU7Ff/3brreORJSAuGxVtBC+84OirxLYxSAxbGRH7yeuUSui7UP
	 UG7xYtstKAQxuKxkcm0wpiVueaD/3ZSQ8zGrGn11wlyS3ZGEjtiPr33/KLNdJWdhDm
	 8cIludxtDIV3DOROfM2xcqoq1Gx5MSzLKfUoPZ4sP/PbCkWPBxMrcC0zficIAn6xu2
	 OsOGSg/PN9HCy4MCoVOpZ3+4t6CHxnwdckYfKiGWSSyHJr4Wq9/WPiXkE3BQVondPl
	 iY2eQFSXLUagkpTX1ShwJYXtb6l7Q1q9aaR7vBJG5DLNiLBSh4zeFqOrxoQSNoXGzN
	 aBy/Nc6tFTFHNWSOzCne4vkHfM0u38/Alyfez94vSjRJ5q7iiEpp+Zf8AOYP4yuDYq
	 bwOQZsxoeFz5PlYVtjqNEzVEI4Ra3yPQ3h9yarHNv1tDfl+EjKVtwDIPYyA8ohEGtW
	 VHVjI5jhlhifBqso6kfoh6qg=
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so618508eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 19:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794540380; cv=none;
        d=google.com; s=arc-20260327;
        b=nTYhEaenzthaEimoi06cFjNLZ1OUJo6ZR43O1hf1TnasSnJ6lPK1YtesQnrnPjoIw6
         nlX+qs03dvn2Rhxa41ujyX1Zf7cgeAHiH0GcSoDhCQo8ECkjbenst/egc71LGkMqUwn8
         1Cm4G/Gf1WQAG9e2wmhypp+k4Ssk7hF4ggzppRHOg9KxWrsaN6a/FPqUD0y7UqUj8ulL
         lyLDSwsGSXySl04Nc8ZVL+XMfMoXD1MO/LmYo1xR24jmgNHsJxwVP46FWWvadv+ZnGi+
         3X5Iutnc/hJ6lgQtQDQqvRx8o3tcqRt77bZ6OeRrmRkVlNKfNBjnyOfxxwKUj0PX/aIv
         foOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
        fh=fAllbZhQrNCLkKCnR8sFGHB6cRyNdp3lYQ9xUDPGhlE=;
        b=rgHjHLOE8ijrAvOpS+OQhlNKZuA4nZsrxhCBLYdg/2OBh+kfHBns2KB78V0S97nvcV
         pR5lfTpY/lbmVcUymkwn4Nfnalg1LFYPcOyoR+MG5P8pH9lfRK/mYvOO3uYlomtUsaYo
         kmdfq9Ii8Cf/UscRNThsa5xqD6Gr1VWrpeXZS+l4e4JLKPiS+I4T/FK0GlfHWQddRiLa
         DtjN9kUAYZdUiwyVmXErfCcP9LhisGpyDNciN2kly55cBqIHg/6/BCjfmh+rse28EAwc
         VHhBnfS0WeMQGglZsbfPlttn1yKwcX9+n5BxkhldK6T3hOonLre+4KP9tgPJf1xEFyea
         1lvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794540380; x=1795145180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+cxJBRP6clfl0UgZt6kvgyxnRvAdOtC4VBSGVkg8UpE=;
        b=g1amVjqUOzS9/K//TrXisVVKkTGe2HZjSPscOvVdM7Fq0uJhfPuH/JDsPKgtBqUQNT
         eYf8PZFjdzW0VpjrDVqJT+E+GO7xGQMe48EaeI5gXOr0CCljsgm6DeCZ4Xql4P84QaaY
         TCPVSjuqxGYlzGXawsH/kj+ZIoLSsiTfRQzkKDfuCHCZgJC8F/v8GDEFEY3DpqimxQbN
         NmQQx2tgCfJm6Gu/8IhHIoommJ0cYwLDqAT4GBJlX5SPr+CG0JSuWaCq70znYWWpEXPP
         aG7YM0NsUUvZUvzHX0b4n3tH4vPmIbhEMXCwSETb18wJp4Sn5BYI0OtYVcTrpbo766w3
         3ryg==
X-Forwarded-Encrypted: i=1; AL+hErHr02AqG1kgInIrHHNoPGOtXfBwEFC/YbAd9db1WWyLOSN9BaFhL3ybJXwLcT7g1EFUvwOHK1o8+GTOKvgwiXBH4qXD@vger.kernel.org
X-Gm-Message-State: APuU4Z+oAiMx0wWNc/tVwhqbAV5KveyPMoaovyHKi1gnJ5mTa5TaRpAU
	QboGnJEXAyxhZUPDUCe37mnpH1yCPxjpfA3iJQ5f4imG2+AI5iL6Qc09LKXE4Qh2ZQi7LLoaQwC
	qao2EyMVHzuUtIyfaelRRR6QPUjfSnPRh9HHlA/Wzc9FKD4D2LM7GIusPT0XR3hnJHjZWtmrmv4
	pqoV1oSlH9xB9l/+2s/ZQF8ppcbz4xBprQwKGaNNtX0eu/5Q3cK+pw0sTZkF7fuC8WLw==
X-Gm-Gg: AYBFou0HA5VtfZEZaBCGRHkRMCSanBpiYOwJFv3rp2fjfyu0NH8v/r2nFV/i50o2f+P
	5lqtxkb9H06DTsOn6paUGFcAPT3v7w6yKZ/Bfu1GUcYUwmOrY9dkWRb92+cZHoL8SxA0utf0HSg
	9pmsNKs0TajPckhsvJreir99eq3cYUE7jBgTGJqUIWP3uY2dtqTBM8AZb8iyONOV4IvAHByVWrN
	tAv86XxT9wbd7WY4Meba9V+zxElgqfDBoKV0F1rUf/dHfLT5dHlqobqsSLjijoxIjXDtqY0WkBe
	3nTJzUKKEFpxxOlO+fXv2dxLTSGWWXD4yTXPZfT9pEZ2UfjhS1h+KfACdZGpOlfpKt5Bc7C2
X-Received: by 2002:a05:701b:2094:10b0:19e:1ad9:1c2 with SMTP id a92af1059eb24-1b5030eb08fmr1338579c88.38.1794540380521;
        Thu, 12 Nov 2026 19:26:20 -0800 (PST)
X-Received: by 2002:a05:701b:2094:10b0:19e:1ad9:1c2 with SMTP id
 a92af1059eb24-1b5030eb08fmr1338552c88.38.1794540379945; Thu, 12 Nov 2026
 19:26:19 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112074823.853819-1-aaron.ma@canonical.com> <68B20AF1-0037-4810-98B8-49E3CBF17E92@gmail.com>
In-Reply-To: <68B20AF1-0037-4810-98B8-49E3CBF17E92@gmail.com>
From: Aaron Ma <aaron.ma@canonical.com>
Date: Fri, 13 Nov 2026 11:26:08 +0800
X-Gm-Features: AclHuK9NY09oDT-JYI6FSoxGBV8nu19hty2L1c694GHrFMFgqBAzTGZC1cOlY7U
Message-ID: <CAJ6xRxWvxd72y5zAsEC-Qs2_R8fBekVTJas3OfYe8owEvE39Dg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: lenovo-wmi-other: Deconflict battery
 with thinkpad_acpi
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Rong Zhang <i@rong.moe>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:46=E2=80=AFPM Derek J. Clark
<derekjohn.clark@gmail.com> wrote:
>
> On November 11, 2026 11:48:23 PM PST, Aaron Ma <aaron.ma@canonical.com> w=
rote:
> >ThinkPads expose battery charge thresholds and charge_behaviour through
> >thinkpad_acpi's ACPI battery hook using raw sysfs attribute groups. The
> >Lenovo WMI "Other Mode" driver also registers a power_supply_ext for
> >charge_behaviour and charge_types on systems advertising those WMI
> >capabilities.
> >
> >When lenovo-wmi-other registers first, thinkpad_acpi fails to create a
> >duplicate charge_behaviour sysfs attribute and unregisters its battery
> >extension. Conversely, registering or updating any power_supply_ext on
> >the same battery runs sysfs_update_groups(), which removes standard
> >power-supply attributes not owned by power_supply_core and wipes out
> >thinkpad_acpi's charge_control_start_threshold,
> >charge_control_end_threshold, and charge_behaviour files.
> >
> >Deconflict both ideapad_laptop (VPC2004 with GBMD and SBMC) and
> >thinkpad_acpi (LEN0268, LEN0068, or IBM0068 with BDSG and BICG) via a
> >table check when the corresponding driver is enabled in Kconfig, and
> >update the force_load_psy_ext description accordingly.
> >
> >Fixes: 9ca8fc065b88b ("platform/x86: lenovo-wmi-other: Add WMI battery c=
harge limiting")
> >Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>
> Hi Aaron,
>
> Looks good, thanks. I'll test it in a couple of days. I have one question=
 below but it's not blocking for me, I just want to check my assumption is =
correct.
>
> Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
>
> >---
> >Changes in v2:
> >- Consolidate IdeaPad and ThinkPad deconfliction into a table of ACPI
> >  device IDs, method pairs, and driver configuration checks, as suggeste=
d
> >  by Derek J. Clark.
> >- Check GBMD and SBMC for IdeaPads, and BDSG and BICG for ThinkPads,
> >  instead of relying only on ThinkPad ACPI device presence.
> >- Check whether the corresponding driver is enabled before looking up
> >  its ACPI device, including for ideapad_laptop.
> >- Update the force_load_psy_ext description to cover both drivers.
> >
> >v1: https://lore.kernel.org/platform-driver-x86/20261111083529.727285-1-=
aaron.ma@canonical.com/
> >
> > drivers/platform/x86/lenovo/wmi-other.c | 51 ++++++++++++++++++-------
> > 1 file changed, 38 insertions(+), 13 deletions(-)
> >
> >diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/=
x86/lenovo/wmi-other.c
> >index bd64e7b44669d..14b2c3f4cc7ae 100644
> >--- a/drivers/platform/x86/lenovo/wmi-other.c
> >+++ b/drivers/platform/x86/lenovo/wmi-other.c
> >@@ -189,10 +189,10 @@ MODULE_PARM_DESC(relax_fan_constraint,
> > static bool force_load_psy_ext;
> > module_param(force_load_psy_ext, bool, 0444);
> > MODULE_PARM_DESC(force_load_psy_ext,
> >-      "This option will skip checking if the ideapad_laptop driver will=
 conflict "
> >+      "This option will skip checking if the ideapad_laptop or thinkpad=
_acpi driver will conflict "
> >       "with adding an extension to set the battery charge behavior and =
battery charge "
> >       "control end threshold. It will also skip checking if the BIOS re=
ports that "
> >-      "those features are fully supported. It is recommended to blackli=
st the ideapad "
> >+      "those features are fully supported. It is recommended to blackli=
st the conflicting "
> >       "driver before using this option.");
> >
> > /* =3D=3D=3D=3D=3D=3D=3D=3D HWMON (component: lenovo-wmi-capdata 00 & f=
an) =3D=3D=3D=3D=3D=3D=3D=3D */
> >@@ -905,17 +905,32 @@ static acpi_status lwmi_acpi_match(acpi_handle han=
dle, u32 lvl,
> >       return AE_CTRL_TERMINATE;
> > }
> >
> >+struct lwmi_psy_deconflict {
> >+      const char *hid;
> >+      char * const *methods;
> >+      bool driver_enabled;
> >+};
> >+
> >+static char * const lwmi_ideapad_psy_methods[] =3D { "GBMD", "SBMC" };
> >+static char * const lwmi_thinkpad_psy_methods[] =3D { "BDSG", "BICG" };
> >+
> >+static const struct lwmi_psy_deconflict lwmi_psy_deconflict_list[] =3D =
{
> >+      { "VPC2004", lwmi_ideapad_psy_methods, IS_ENABLED(CONFIG_IDEAPAD_=
LAPTOP) },
> >+      { "LEN0268", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+      { "LEN0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+      { "IBM0068", lwmi_thinkpad_psy_methods, IS_ENABLED(CONFIG_THINKPA=
D_ACPI) },
> >+};
> >+
> > /**
> >  * lwmi_om_psy_ext_init() - Hooks power supply extension to device batt=
ery
> >  * @priv: Pointer to the lwmi_om_priv drvdata.
> >  *
> >- * Checks if the ideapad_laptop driver is going to manage charge attrib=
utes first,
> >- * then if not, hooks the battery to our WMI methods if they are suppor=
ted.
> >+ * Checks if the ideapad_laptop or thinkpad_acpi driver is going to man=
age
> >+ * charge attributes first, then if not, hooks the battery to our WMI m=
ethods
> >+ * if they are supported.
> >  */
> > static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
> > {
> >-      static const char * const ideapad_hid =3D "VPC2004";
> >-      acpi_handle handle =3D NULL;
>
> I'm assuming this was moved to avoid handling cleanup each loop?
>

 Hi Derek,
Thanks for the review.
moving `handle =3D NULL` into the loop ensures it is reset on each iteratio=
n.

Thanks,
Aaron


> Thanks,
> - Derek
>
> >       unsigned int props =3D 0;
> >       int ret;
> >
> >@@ -928,14 +943,24 @@ static void lwmi_om_psy_ext_init(struct lwmi_om_pr=
iv *priv)
> >       if (force_load_psy_ext)
> >               goto load_psy_ext;
> >
> >-      /* Deconflict ideapad_laptop driver */
> >-      ret =3D acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, N=
ULL);
> >-      if (ret)
> >-              return;
> >+      for (unsigned int i =3D 0; i < ARRAY_SIZE(lwmi_psy_deconflict_lis=
t); i++) {
> >+              const struct lwmi_psy_deconflict *entry =3D &lwmi_psy_dec=
onflict_list[i];
> >+              acpi_handle handle =3D NULL;
> >
> >-      if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(=
handle, "SBMC")) {
> >-              dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages =
battery for device\n");
> >-              return;
> >+              if (!entry->driver_enabled)
> >+                      continue;
> >+
> >+              ret =3D acpi_get_devices(entry->hid, lwmi_acpi_match, &ha=
ndle, NULL);
> >+              if (ret || !handle)
> >+                      continue;
> >+
> >+              if (acpi_has_method(handle, entry->methods[0]) &&
> >+                  acpi_has_method(handle, entry->methods[1])) {
> >+                      dev_dbg(&priv->wdev->dev,
> >+                              "ACPI device %s manages battery for devic=
e\n",
> >+                              entry->hid);
> >+                      return;
> >+              }
> >       }
> >
> > load_psy_ext:
>
