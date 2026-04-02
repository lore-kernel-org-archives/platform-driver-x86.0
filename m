Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E73A4F33
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 08:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118579; cv=none; b=GDQnXjskETUUj6ULpVE7v/RmcyfaW03/TgcKW3zqDa7duJRjM1LGBeE+0gj4rRq6FYbp0PT60RshntzC30obUUH6yn7S9yjAWLyYAv+yFgR6auDqvL6f3Dv8laTO9QfPdNcVtQLZE9AmCxguH/C34EnF5k4H2vnf1S0uIStrFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118579; c=relaxed/simple;
	bh=cHrQtNfrtbP3fBvN1MrVCSGLj3o8hSmtn3keUs9z4QU=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3KnaEXhSZvYXgI5QIPh3OKkN3Pu/2u2CmGV3IJROHNl9QzSC4+pBjmWgKZ7VR7DFoIp7R6NX4mhdgpnpl8fP5TcM7ZMnVsSzznJi7kEYy9PhWZ9tGfs2NqVzaWne4HyVWYWns/SNPq/U29TkKdptZ5Twc+LWAP40IioJcd9ePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnAwL+EB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnAwL+EB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F36C2BCB8
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 08:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118579;
	bh=cHrQtNfrtbP3fBvN1MrVCSGLj3o8hSmtn3keUs9z4QU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=hnAwL+EBsr2et3b8BeEa/TZgZpkKfktKXmO2eZk25Qdfo0LVBj9zr+QMMMTzuSmF8
	 cGc3bH6IRpNtSpAKo5Dk3/FR4K6/+nORKyEI9Is5NAz5NxqhIb6k2fAA2kdzxDY8YI
	 +mYb24QqYF72yIizYUQhO0Upu7WwdNWJQiessAUe95ixxXPH9k9z+rrsAj4UfFD2js
	 FmqMV2aV3/VVXjOK3serGH5NAgGxn/HXW4MksZG17TPgcmJwm1CndanF3riHeo2NZ1
	 DbfUWCwvH8YQxr89laoVB7SyQ3RAjCfwNioxSm28opJrc+GLY/k46IKDMK2L1aalMJ
	 EQeqApQpAHi2A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso350391e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2026 01:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX9Uqd//UXigv5txqGrW0h6BGy3pZGisYOeW9w/LcmQ5oZcQtrJUqDcENcvTNtIBte1ZsG7kcQM1c+xXIC68knyxOSc@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe56f4rDy79nO8CbyYRgsQDzZGGyd/XoHmxcERtNFkRI3+t7UH
	gd8y4c6q/KZn9CceJYmnDr4zrIpkfDDsUwA/OwLYi0qQeJMCd/XHmtEx8QnXS1M+669Ro7Mr2xW
	yhXRVfCyHtSdvzsYCqz8wIg3hqHRupgOfCTbnV2DJwg==
X-Received: by 2002:a05:6512:ac9:b0:59e:57d2:75f0 with SMTP id
 2adb3069b0e04-5a2c7679896mr897511e87.32.1775118577970; Thu, 02 Apr 2026
 01:29:37 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 01:29:36 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Apr 2026 01:29:35 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <acx9veIH-t5cCVc_@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331112819.103298-1-bartosz.golaszewski@oss.qualcomm.com> <acx9veIH-t5cCVc_@google.com>
Date: Thu, 2 Apr 2026 01:29:35 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
X-Gm-Features: AQROBzCjloCS8MNCAKjIOWG2JfH3wXoBt5aj_eP8hQHnwf_xW6oKwo102RMDcTY
Message-ID: <CAMRc=MfCbKa2YZYPckV7bj-+kcOx1g+v9BjYL0v+SFxTVJTTLA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: attach software node to its
 target GPIO device
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Apr 2026 04:09:21 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> On Tue, Mar 31, 2026 at 01:28:19PM +0200, Bartosz Golaszewski wrote:
>> The software node representing the GPIO controller to consumers is
>> "dangling": it's not really attached to the device. The GPIO lookup
>> relies on matching the name of the node to the chip's label. Set it as
>> the secondary firmware node of the platform device to enable proper
>> fwnode-based GPIO lookup.
>>
>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>> ---
>>  drivers/platform/x86/barco-p50-gpio.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
>> index 2a6d8607c402..5f4ffa584295 100644
>> --- a/drivers/platform/x86/barco-p50-gpio.c
>> +++ b/drivers/platform/x86/barco-p50-gpio.c
>> @@ -365,6 +365,8 @@ static int p50_gpio_probe(struct platform_device *pdev)
>>  	if (ret)
>>  		return dev_err_probe(&pdev->dev, ret, "failed to register software nodes");
>>
>> +	set_secondary_fwnode(&pdev->dev, software_node_fwnode(&gpiochip_node));
>> +
>>  	led_info.fwnode = software_node_fwnode(&gpio_leds_node);
>>  	p50->leds_pdev = platform_device_register_full(&led_info);
>>  	if (IS_ERR(p50->leds_pdev)) {
>
> I looks like http://sashiko.dev patch critique is on point:
>

Ok, let's unpack it.

> "
> Is the software node attached too late to take effect?
>
> In the probe function, devm_gpiochip_add_data() is called before this
> set_secondary_fwnode() call. During GPIO chip registration, the gpiolib
> core snapshots the parent device's fwnode.
>

What does it mean "to snapshot" the parent's fwnode?

What happens is this:

static struct fwnode_handle *gpiochip_choose_fwnode(struct gpio_chip *gc)
{
	if (gc->fwnode)
		return gc->fwnode;

	if (gc->parent)
		return dev_fwnode(gc->parent);

	return NULL;
}

gc->fwnode is NULL so we set gc->parent as the GPIO controller's fwnode.

> Because the secondary fwnode is not yet set on pdev->dev when this snapshot
> happens, the GPIO device is registered with a NULL fwnode, which seems to
> defeat the purpose of enabling fwnode-based lookups.
>

Sashiko is completely wrong here: not only is the device registered with the
parent's fwnode assigned, the secondary fwnode is a property of the *fwnode*,
not of the device. We set the secondary fwnode of the parent's real fwnode.
This is carried over to the GPIO controller's device properties even after
it's been created.

> If the order is reversed, would we need to tie the software node
> registration to devres (e.g., via devm_add_action_or_reset)? Otherwise, a
> manual software_node_unregister_node_group() in the probe error path might
> free the software node while the devm-managed gpiochip still holds a pointer
> to it.
>

This one is valid. It should be a separate fix. remove() runs before devres
release.

> Additionally, could this leave a dangling pointer on probe failure or driver
> unbind?
>
> If a subsequent step fails (like registering keys_pdev), the probe error
> path calls software_node_unregister_node_group(p50_swnodes), which frees
> the underlying memory.
>

Scheduling devres actions following the initialization (reverse) order would
help.

> Because set_secondary_fwnode(&pdev->dev, NULL) is never called to clear it,
> pdev->dev.fwnode would point to freed memory. Any subsequent access to the
> device's firmware node could trigger a use-after-free.
> "
>

Makes sense too.

Bart
