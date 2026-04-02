Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C130C63A
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775145234; cv=none; b=RY/URnqn+q/QJJObac7yGOKtcyBkx8gmQDXKcdc9lwaxPzBE0AueDnQkyjEyyt8eduRBE1HZuz38iLqkMf7Bo8sdQYabN9utnN8dZ2b9pknfU5bcbzyxVF6jrLNVK7YRFCt9g20CvKJU4RmzAErHCzBUW5nf8IB7jDf5naiorgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775145234; c=relaxed/simple;
	bh=FpxvnJ8xBjj+6gf6q2qKDpOtmvlTUDIXfg+/vStZ1+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gG04QLH+hGiqNwHlIkDA9Xf8jImf8HwjKCYho38jplpsu0ihkFqQNcHKB8Z+nP4ZAblx5CAmNR3ZsoytQnuSqpG3fCAyLzlMACmo6aJUCsIZLQ7O//dmzSAInQyEM3wAvkCbguv4a4Q8dLMmiuhZvBAtZ/i6T1sbWsWoOwtQ/rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hb31qHE7; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hb31qHE7"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c1632faeb9so2064122eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 08:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775145232; x=1775750032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gbXKujNeQw4fmWcbhBupJNqIEgoiL9nCv2NG6T/ZbEc=;
        b=Hb31qHE70lpWkrGJZm/DpjhBa5cca+InP3n68MyakEUiTrXXvIjxpjgRejT7usywNe
         n4rQWihT+3cO/foAbbjiY3LS/LB1F6PzpE3QKG8ZsZejXaf2CBxqiya+M8UvFrBjfQeS
         XVr1ILlr+vNwPl3k5tYCPTPMQ+FUy+YD585KG5jxDz7p6KE1xVfm+/j+cH5nT7sYmdoM
         6krcSbzsq5pYD/SqwoFpPF5IBUjNDtnfc0AnUxp5kbi/fgFS8zHkCGbEnnekotgvx9Tf
         Pfba5bR+x+O9e2Xhp9fW9f+KB9dhaBQq3aSB2ER1SoTidNXu99zF6AWp0F0qKbyeplkR
         xTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775145232; x=1775750032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbXKujNeQw4fmWcbhBupJNqIEgoiL9nCv2NG6T/ZbEc=;
        b=oJy/hj+bUwBiJ6PpzFcI5ahdSwnuSeEH3s4MSxizv94EROPO/JD9SeS2BNH+PseKCu
         m1HTxDi5Oecm8sWmt/ppsS40FB6jI6IupO0BE4DOWXxc3EdbkSzKDA+GrunEP8byxNRu
         PvXCMwc64UuRW6fkzC0nVuc5xXG1q3z5uz5JakNBubziGiqfT9UhFFSNgq39rEhp4VgS
         lELMOOoBRXk2KsTuJAwHnYNe1jIW6u25xEYCWwEG1cuJggowRiEN74BCKNJI/6HKEUyJ
         h7usNmXFEF4wP9BBOzZN2tudFYJliS/YRYRxvof3qZxQa2tux4GafK4QOQGnr+ZlPQmx
         SO9w==
X-Forwarded-Encrypted: i=1; AJvYcCV+pDpYIHitj+3K+jXU4YiOAGvy79jhOGrIeZ1O9YvESXskM7PX0sn85CCMRByKmJ83OwpHDnjvd7c1ENdWlJh1A1JL@vger.kernel.org
X-Gm-Message-State: AOJu0YzEx6v39Qsf/Itpd/oRVHQhyckQAYC6NE3rzxz3zMs+XZuuUmAX
	9lhdLOSbh0jWemoj+Pk/qKodnh90GS/oj1AeVjbUKuHj5CQZo7PS4SA/
X-Gm-Gg: AeBDietA6Wf5ihjWWUyesy7syyqUDbAzAn0TeG+k494hwXknSAnuvtWvLuWYcxaD1Lc
	d6bl3ijys7JNlZVXvUs5t28qgvlYyGBH1lhHSwjwDLEAvP/wwn0SRqX7Gaf2Eiure8/c/lR+5Wg
	u18O0caqy+2ulDH8fVdl2c1wp6s9iUKriGrCJmZJ7ad6SqJ8tyLyC2d1DfGHjbyw3fXPZQlwPV5
	V6tmYagsjiShQZ3X5hajGig3Gp+BDSMoFfRUXOj+r+Iq1zjy7UXBd6jRrGZj9MqPetCgPZ8mtZM
	FvZHDitTxgBpauyig8LNp4iUUtOUQfgbdkNkjva2+8ZxNuDeE2rYjndxG8z5y0dkrpTDCD8UcNE
	4Oc8fG384x5wWQlHRw+J8WGmuenT4UQboet4reEQpuO2OEDLbw+Pzds76Sd0J3WNx8Mu6GV7GBJ
	Ee3chNs5laJn3iKE1xGGqM4Q+GmURHqUB82jM0kDWBNrGVt6XIt8u2OTiSFJgvJag4
X-Received: by 2002:a05:7300:3708:b0:2c7:ea98:da0 with SMTP id 5a478bee46e88-2c9323b72c2mr4759468eec.19.1775145231911;
        Thu, 02 Apr 2026 08:53:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:902a:cd8d:1c0d:8926])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cb92ea0ef1sm638703eec.21.2026.04.02.08.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:53:51 -0700 (PDT)
Date: Thu, 2 Apr 2026 08:53:48 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to
 its target GPIO device
Message-ID: <ac6OpN-pfcdAhdEj@google.com>
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com>
 <acx9veIH-t5cCVc_@google.com>
 <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>

On Thu, Apr 02, 2026 at 01:29:35AM -0700, Bartosz Golaszewski wrote:
> On Wed, 1 Apr 2026 04:09:21 +0200, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > On Tue, Mar 31, 2026 at 01:28:19PM +0200, Bartosz Golaszewski wrote:
> >> The software node representing the GPIO controller to consumers is
> >> "dangling": it's not really attached to the device. The GPIO lookup
> >> relies on matching the name of the node to the chip's label. Set it as
> >> the secondary firmware node of the platform device to enable proper
> >> fwnode-based GPIO lookup.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> ---
> >>  drivers/platform/x86/barco-p50-gpio.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> >> index 2a6d8607c402..5f4ffa584295 100644
> >> --- a/drivers/platform/x86/barco-p50-gpio.c
> >> +++ b/drivers/platform/x86/barco-p50-gpio.c
> >> @@ -365,6 +365,8 @@ static int p50_gpio_probe(struct platform_device *pdev)
> >>  	if (ret)
> >>  		return dev_err_probe(&pdev->dev, ret, "failed to register software nodes");
> >>
> >> +	set_secondary_fwnode(&pdev->dev, software_node_fwnode(&gpiochip_node));
> >> +
> >>  	led_info.fwnode = software_node_fwnode(&gpio_leds_node);
> >>  	p50->leds_pdev = platform_device_register_full(&led_info);
> >>  	if (IS_ERR(p50->leds_pdev)) {
> >
> > I looks like http://sashiko.dev patch critique is on point:
> >
> 
> Ok, let's unpack it.
> 
> > "
> > Is the software node attached too late to take effect?
> >
> > In the probe function, devm_gpiochip_add_data() is called before this
> > set_secondary_fwnode() call. During GPIO chip registration, the gpiolib
> > core snapshots the parent device's fwnode.
> >
> 
> What does it mean "to snapshot" the parent's fwnode?
> 
> What happens is this:
> 
> static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *gc)
> {
> 	if (gc->fwnode)
> 		return gc->fwnode;
> 
> 	if (gc->parent)
> 		return dev_fwnode(gc->parent);
> 
> 	return NULL;
> }
> 
> gc->fwnode is NULL so we set gc->parent as the GPIO controller's fwnode.

However if parent does not have fwnode assigned (dev->fwnode is NULL)
this will return NULL as well. This effectively severs the link between
the gpiochip and the parent device.

> 
> > Because the secondary fwnode is not yet set on pdev->dev when this snapshot
> > happens, the GPIO device is registered with a NULL fwnode, which seems to
> > defeat the purpose of enabling fwnode-based lookups.
> >
> 
> Sashiko is completely wrong here: not only is the device registered with the
> parent's fwnode assigned, the secondary fwnode is a property of the *fwnode*,
> not of the device. We set the secondary fwnode of the parent's real fwnode.
> This is carried over to the GPIO controller's device properties even after
> it's been created.

I do not think it is wrong. If the parent does not have fwnode assigned
(and it does not) then you do not have a fwnode object to attach a
secondary node to. The node you are attaching as a secondary becomes
primary, but it is *too late*. The link has been severed, gpiochip's
fwnode is a NULL pointer and has no idea that the parent now has a valid
fwnode.

I think this woudl be a better approach:

@@ -426,7 +419,6 @@ MODULE_DEVICE_TABLE(dmi, dmi_ids);
 
 static int __init p50_module_init(void)
 {
-	struct resource res = DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD + 1);
 	int ret;
 
 	if (!dmi_first_match(dmi_ids))
@@ -436,7 +428,15 @@ static int __init p50_module_init(void)
 	if (ret)
 		return ret;
 
-	gpio_pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_NONE, &res, 1);
+	gpio_pdev = platform_device_register_full(&(struct platform_device_info){
+		.name = DRIVER_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.res = (const struct resource[]){
+			DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD + 1),
+		},
+		.num_res = 1,
+		.swnode = &gpiochip_node,
+	});
 	if (IS_ERR(gpio_pdev)) {
 		pr_err("failed registering %s: %ld\n", DRIVER_NAME, PTR_ERR(gpio_pdev));
 		platform_driver_unregister(&p50_gpio_driver);

This way you start with the right node right away.

Thanks.

-- 
Dmitry
