Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13993F164A
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 16:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147974; cv=none; b=GvJglO+2rlUa54STpmOT2d4Bc+TXafAyJUkAmkHmpnln7AL6drH5Tp7weTp+NF31wqOFTr/9a8OC0o4blbABlylLLOJIi/Ne2zleoq9vlbT2f1AEqCqZRqB9GDtVnNEf2addlX98fP1pR8KoM/qbm3S194WJl1LTIEZd4CQr+kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147974; c=relaxed/simple;
	bh=+POvXfTOUMtNiB+FhzwUh3PO82On4Bq0tlYheDATb80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YG8lKIgTOQAJ+jjAu3LhXAm6P3VgfP4dz6czw8F5L20IslZ8SX5D200BA4QILLXl0WvEQLQ978w2f3ouQvqxc+/TbihCA5bZbgIy/NH9MUwk0pBOi5M2yMEeRPuL3R7+IoIZEHXZVMJ9QG/gQDCPop5EvGX7SjWvjjuQ5AdnuH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tMOcxxBB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMOcxxBB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4337AC2BCAF
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 16:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147974;
	bh=+POvXfTOUMtNiB+FhzwUh3PO82On4Bq0tlYheDATb80=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tMOcxxBBBAPtG6dO1Qmnfy5eDNIJzGp45IrnhGlDd7hgpYPFxUHg4FkBVeGnyEpjp
	 acwSR7QkgICNEwUG0EjPwn00JQLruFmljM3vhCpZH2ODR0yyFKe7AxnEcPEjYA0EYl
	 twvCP5dqeEUdFc8HLmH5tKlrCJYC/GfKuDdf+kDeK9+LB8r6mrRlqR0cp/4YNxed3n
	 XTnZLTL6hOctLrHAffYTU1C04a3FWoyRPnpLaIhrOqQYgf+qIk09wF4pe2iKlt2Csd
	 aFkDGPj1xwoeIDpsrRVQjL4h+6QOsLoMSiTjEvhR0qPVxE2MRB5D2q+IrdIebbg3EG
	 O3zOBKDtUWWBA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2c9932781so888459e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 09:39:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWf4B5InMaT4Z3Jvco7JqMXIHH7nAeQDgN88xpfIDTiqYlbNxLhoynn7zOE8wI3EtZfAGK4FLZbmDO/dOu2BBx3yA+U@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1mMJluec3gnX0DlUKwiVThSQVPxl4kctCfH3KFEghyAYy0Zai
	dgjMgVnoo82RWaKhjeisTnbrb7FDy9ojcSntmNrL8i92APKv7qsS/2uVKW/oWhidddy4N/WWUBq
	9E+n/OGmyxaOi/rPjlqIu6MU4rneEIIRHFnHXwp46dA==
X-Received: by 2002:a05:6512:31c2:b0:5a1:357d:8d5c with SMTP id
 2adb3069b0e04-5a2c8d8f9aamr1311614e87.16.1775147972949; Thu, 02 Apr 2026
 09:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
 <acx9veIH-t5cCVc_@google.com> <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
 <ac6OpN-pfcdAhdEj@google.com>
In-Reply-To: <ac6OpN-pfcdAhdEj@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:39:16 +0200
X-Gmail-Original-Message-ID: <CAMRc=McbuVrw5eNp6vhF1DJP=5YM8BA4yTM6wf_1Dcg_T2gBhQ@mail.gmail.com>
X-Gm-Features: AQROBzAuf3_51afMzuyEgiNhaJW2sVszFdH7rZi4YRleZQkF5XsJ7Y4IY0Khwro
Message-ID: <CAMRc=McbuVrw5eNp6vhF1DJP=5YM8BA4yTM6wf_1Dcg_T2gBhQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to its
 target GPIO device
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 5:53=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Apr 02, 2026 at 01:29:35AM -0700, Bartosz Golaszewski wrote:
> > On Wed, 1 Apr 2026 04:09:21 +0200, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> said:
> > > On Tue, Mar 31, 2026 at 01:28:19PM +0200, Bartosz Golaszewski wrote:
> > >> The software node representing the GPIO controller to consumers is
> > >> "dangling": it's not really attached to the device. The GPIO lookup
> > >> relies on matching the name of the node to the chip's label. Set it =
as
> > >> the secondary firmware node of the platform device to enable proper
> > >> fwnode-based GPIO lookup.
> > >>
> > >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm=
.com>
> > >> ---
> > >>  drivers/platform/x86/barco-p50-gpio.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platfor=
m/x86/barco-p50-gpio.c
> > >> index 2a6d8607c402..5f4ffa584295 100644
> > >> --- a/drivers/platform/x86/barco-p50-gpio.c
> > >> +++ b/drivers/platform/x86/barco-p50-gpio.c
> > >> @@ -365,6 +365,8 @@ static int p50_gpio_probe(struct platform_device=
 *pdev)
> > >>    if (ret)
> > >>            return dev_err_probe(&pdev->dev, ret, "failed to register=
 software nodes");
> > >>
> > >> +  set_secondary_fwnode(&pdev->dev, software_node_fwnode(&gpiochip_n=
ode));
> > >> +
> > >>    led_info.fwnode =3D software_node_fwnode(&gpio_leds_node);
> > >>    p50->leds_pdev =3D platform_device_register_full(&led_info);
> > >>    if (IS_ERR(p50->leds_pdev)) {
> > >
> > > I looks like http://sashiko.dev patch critique is on point:
> > >
> >
> > Ok, let's unpack it.
> >
> > > "
> > > Is the software node attached too late to take effect?
> > >
> > > In the probe function, devm_gpiochip_add_data() is called before this
> > > set_secondary_fwnode() call. During GPIO chip registration, the gpiol=
ib
> > > core snapshots the parent device's fwnode.
> > >
> >
> > What does it mean "to snapshot" the parent's fwnode?
> >
> > What happens is this:
> >
> > static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *g=
c)
> > {
> >       if (gc->fwnode)
> >               return gc->fwnode;
> >
> >       if (gc->parent)
> >               return dev_fwnode(gc->parent);
> >
> >       return NULL;
> > }
> >
> > gc->fwnode is NULL so we set gc->parent as the GPIO controller's fwnode=
.
>
> However if parent does not have fwnode assigned (dev->fwnode is NULL)
> this will return NULL as well. This effectively severs the link between
> the gpiochip and the parent device.
>
> >
> > > Because the secondary fwnode is not yet set on pdev->dev when this sn=
apshot
> > > happens, the GPIO device is registered with a NULL fwnode, which seem=
s to
> > > defeat the purpose of enabling fwnode-based lookups.
> > >
> >
> > Sashiko is completely wrong here: not only is the device registered wit=
h the
> > parent's fwnode assigned, the secondary fwnode is a property of the *fw=
node*,
> > not of the device. We set the secondary fwnode of the parent's real fwn=
ode.
> > This is carried over to the GPIO controller's device properties even af=
ter
> > it's been created.
>
> I do not think it is wrong. If the parent does not have fwnode assigned
> (and it does not) then you do not have a fwnode object to attach a
> secondary node to. The node you are attaching as a secondary becomes
> primary, but it is *too late*. The link has been severed, gpiochip's
> fwnode is a NULL pointer and has no idea that the parent now has a valid
> fwnode.
>
> I think this woudl be a better approach:
>
> @@ -426,7 +419,6 @@ MODULE_DEVICE_TABLE(dmi, dmi_ids);
>
>  static int __init p50_module_init(void)
>  {
> -       struct resource res =3D DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_=
PORT_CMD + 1);
>         int ret;
>
>         if (!dmi_first_match(dmi_ids))
> @@ -436,7 +428,15 @@ static int __init p50_module_init(void)
>         if (ret)
>                 return ret;
>
> -       gpio_pdev =3D platform_device_register_simple(DRIVER_NAME, PLATFO=
RM_DEVID_NONE, &res, 1);
> +       gpio_pdev =3D platform_device_register_full(&(struct platform_dev=
ice_info){
> +               .name =3D DRIVER_NAME,
> +               .id =3D PLATFORM_DEVID_NONE,
> +               .res =3D (const struct resource[]){
> +                       DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD=
 + 1),
> +               },
> +               .num_res =3D 1,
> +               .swnode =3D &gpiochip_node,
> +       });
>         if (IS_ERR(gpio_pdev)) {
>                 pr_err("failed registering %s: %ld\n", DRIVER_NAME, PTR_E=
RR(gpio_pdev));
>                 platform_driver_unregister(&p50_gpio_driver);
>
> This way you start with the right node right away.
>
> Thanks.
>
> --
> Dmitry

Ah, maybe sashiko wasn't wrong after all but it definitely could do a
better job explaining the actual issue. I missed the fact that this is
not a device described in firmware and as such doesn't have a firmware
node. I see it now. Ok, I'll fix it in v2. In fact, I'll probably wait
until v7.1-rc1 and use the new .swnode field.

Bart
