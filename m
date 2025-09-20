Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCC819D8AC
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 12:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758373057; cv=none; b=S1cmkHbIaDT27sle2OwQ5s6OUchOwCVGUoAt29ogmdrklIRtXK7YMvwb+KukdNTX5pXrNpDmYR8ryvP3CmO0xr/5QtF6eCo5dKXoS7nh0kuHFsFrrBwy8bhymLC9tD/IzvM8mE8vGkV/tqnJ1p9Tz/8qsViucvWp7Wmj8qBPQFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758373057; c=relaxed/simple;
	bh=qR/piaANZVx8aYLIJQ3ZhRB0K3UNoKpxkw339zrAJRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iDQNWTFHEB2uGvV6Zlx7CLDu0jk494hKESlmdx2lABvkuXeQ47ps0YsD+Yr/vAvycKKtYIgM2v8IPlq/SkdUL1EehrDj1Pgbd3XgpPnl5aDcT0zzpj/eZE5Wz1/TpQ58oKw+gu+eJYLU8Q4w4Lzp6O2IykcnsENkdusf3NS8hFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GjriluqY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GjriluqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49438C4CEEB;
	Sat, 20 Sep 2025 12:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758373056;
	bh=qR/piaANZVx8aYLIJQ3ZhRB0K3UNoKpxkw339zrAJRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GjriluqYnpOmiJQA+DGycyjCYIuSwgYnyc/T1nkbQrUGa5dNIblnM9JwXoWCXSbkF
	 +DhIMdbRVjHUzec9WngLKPb/5XE4Ifd8/9X5CQC5Q1A+4P8TwMIYDZZexIpw9yjQhP
	 fUImMMVvFeFUbm2evuWcW1+oZuvyVyHVGOoy4DuMv+SMbXm6yIYuh8pQBuHKPrub1A
	 q24+MCZfXXiYUv6ZsUuH2WZon2/HkQe5Y46BtexSPiRjuoc9BoCag/yD4ZLbZwqxzO
	 xNLr2R/gIOAU3pW7WUUxrYV7Gn32ZMBtB+wnwULVuvQ4m7IIixoPUn6RAj/jQBv2dA
	 N31cPfY9YJdYw==
Message-ID: <f4f5a904-9a2d-4fbb-b72d-d0c4e7e80991@kernel.org>
Date: Sat, 20 Sep 2025 14:57:33 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] platform/x86: x86-android-tablets: convert Yoga
 Tab2 fast charger to GPIO references
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann
 <arnd@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250919204742.25581-1-hansg@kernel.org>
 <20250919204742.25581-10-hansg@kernel.org>
 <CAHp75Vf6mzHPhm_sKZ68H=5nFCg2aEPdMke84ovB_knv4-+eJw@mail.gmail.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <CAHp75Vf6mzHPhm_sKZ68H=5nFCg2aEPdMke84ovB_knv4-+eJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 20-Sep-25 1:05 PM, Andy Shevchenko wrote:
> On Fri, Sep 19, 2025 at 11:48 PM Hans de Goede <hansg@kernel.org> wrote:
> 
>> Now that gpiolib supports software nodes to describe GPIOs, switch the
>> driver away from using GPIO lookup tables for the fast charger device
>> to using PROPERTY_ENTRY_GPIO().
> 
> ...
> 
>> +       /*
>> +        * Propagate pdev-fwnode set by x86-android-tablets to serdev.
>> +        * The pdev-fwnode is a managed node, so it will be auto-put on
>> +        * serdev_device_put().
>> +        */
>> +       device_set_node(&serdev->dev, fwnode_handle_get(dev_fwnode(&pdev->dev)));
> 
> I would rather split these two
> 
> /* Comment about propagating... */
> device_set_node(..., dev_fwnode(...));
> /* Comment about reference counting */
> fwnode_handle_get(dev_fwnode(&serdev->dev));
> 
> (note the parameter to fwnode_handle_get(), which seems to me aligned
> with the explanation given).

Ack, noted.

I've made the requested changes for the upcoming v4.

Regards,

Hans


