Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2023839BD;
	Mon, 31 Aug 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207465; cv=none; b=hsI9/OYsy4ePhOE55F+0iBk4iBl0SXd6Pn7Vv3ujGUsyQyKdV/hw9ZRitfvcBcblkQEF0PxIeDLXaJccAWWXkuIiJAU1h3VDAI5awm9I8XxhIGijMgUXexyeQ0jQ8l6xEEBcaruWfJMy2jn5DrpYfYDgPMEuI5jgbEJ9OvFd6i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207465; c=relaxed/simple;
	bh=VVHy9yJE8KBseURrOMpZ1DppHAAJhZk5lcPmoaApDQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+OXxaGbAbLeBeOJLjKXdacmkjTAm58hepPaBPT46EqBkJekJtWp+QVpPw81NiMSc5dZ0Onx/mw0tNdXG7N1ZpOifZu3TEbgAFEgHUGaoCb4ZfTE6sXGTOZtguEvTuw5bGT/H11Q69bBC9WLZaSXhrrsI5o2KN7ZC8iNd9iO/ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVyLUhre; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVyLUhre"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F5E1F000E9;
	Mon, 31 Aug 2026 20:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207464;
	bh=/jpH7Hbqwf9G0jzF+iV1ISuAQ9swe6NTNMr3yy8MflI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=SVyLUhre9MaFw3aPfOUCyU7meJ6zSnuaUAxRpMymQt8VMd+KyWb1qeVPDC47dfjma
	 MiLDOdcMsP/k/oiz4iZsnIReMYOWh7XgCHcx2436ztHfYA0SPz7zoePAtGZhjmFH8Y
	 UglxMgDh19RdOuyzQZa40ld7yphORzgvtjLxMrTUWHJnVeFW590Cl9FMDy/VJCv9yA
	 O+0RSRUkYG9yESOXuGh2CKJ3YewggwfH8bLgyDS91VzRJbkM90TpO7amBRsoenyveD
	 iEGRmMaiSqQOD8NHbAyj1ozKp5krHR+dSs4tqHfVvJMyMFDW5wpwxmFtZ75t1++baJ
	 qbbsVQwVdhkkQ==
Message-ID: <5f5b802d-b0a4-493a-9816-e9bd91fd94df@kernel.org>
Date: Mon, 31 Aug 2026 22:17:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: x86-android-tablets: fix Arizona and
 Crystal Cove GPIO lookups
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Linus Walleij <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260830-x86-android-lenovo-swnode-v1-0-066a91acb4ba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30-Aug-26 13:15, Dmitry Torokhov wrote:
> When gpiolib dropped name-against-label matching in favor of firmware node
> identity mapping, lookups referencing unattached software nodes (such as
> arizona and gpio_crystalcove in x86-android-tablets) stopped working.
> 
> This series fixes the lookups and cleans up redundant software node
> registrations on Lenovo tablets:
> - Point Arizona GPIO property entries directly to the codec device software
>   node, which is attached to the parent device.
> - Hold a device reference in gpio_secondary_fwnode_init() to ensure safety
>   during devres action teardown.
> - Generalize gpio_secondary_fwnode_init() to accept a node group argument
>   and use it to attach crystalcove_gpiochip_node as a secondary firmware
>   node to INT33FD:00 on Lenovo Yoga Tab 2 models.
> - Drop redundant swnode group registrations on Lenovo Yoga Tab 3 and
>   Yoga Tab 2 models where codec software nodes are already registered when
>   attached to their respective devices.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

My initial testing report of success on the Yoga Tab 3 was a false negative
caused by me still running the older kernel.

There was a generic bug in the new gpio_secondary_fwnode_init() helper
which was causing all GPIO lookups for PROPERTY_ENTRY_GPIO() properties
in the x86-android-tablets code to fail.

I've send out a patch fixing this:

https://lore.kernel.org/platform-driver-x86/20260831201157.36397-1-johannes.goede@oss.qualcomm.com/

Note that patch applies *on top of* this series.

With that patch everything works fine on both a "Yoga Tablet 2 1380" as
well as on a "Yoga Tab 3" which covers all types of GPIOS (BYT SoC,
CHT SoC, CrystalCove PMIC, Arizona codec) used in the x86-android-tablets
code.

And the changes from this series look good to me too:

Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com> # Yoga tab 2 1380, yt3
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans




> ---
> Dmitry Torokhov (6):
>       platform/x86: x86-android-tablets: fix Arizona GPIO swnode references
>       platform/x86: x86-android-tablets: hold device reference for secondary fwnode teardown
>       platform/x86: x86-android-tablets: pass node group to gpio_secondary_fwnode_init()
>       platform/x86: x86-android-tablets: add Crystal Cove GPIO swnode support
>       platform/x86: x86-android-tablets: drop redundant swnode group on YT3
>       platform/x86: x86-android-tablets: use shared battery swnode group on Yoga Tab 2
> 
>  drivers/platform/x86/x86-android-tablets/core.c    | 35 +++++++++++++++-----
>  drivers/platform/x86/x86-android-tablets/lenovo.c  | 37 +++++++---------------
>  .../x86/x86-android-tablets/x86-android-tablets.h  |  2 ++
>  3 files changed, 40 insertions(+), 34 deletions(-)
> ---
> base-commit: f82a5da2f04960df9fb57489992d03dd5e64ec6f
> change-id: 20260829-x86-android-lenovo-swnode-785f4e165eb2
> 
> Thanks.
> 

