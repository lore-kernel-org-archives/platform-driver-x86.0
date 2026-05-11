Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768728A3F8
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 18:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525634; cv=none; b=a72rALe5l2s1QevJgnfSkxki1M9+7JsjnKoGAoOrWMyklyLwhOUUozfgT9vQTg9JvRX5tEm97bKI1naqy4jFdf7AzFf9MWt9hcj8Dls8RqCwuEU9wR6vuYH+rGNDepcd5vLrzZ+PMTYeFDHqIFUP0Y0bkn/9xXQO/txyriCBlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525634; c=relaxed/simple;
	bh=sp0Hw8fi6fpvfkOdVUXwcYaLLWzyVLMDBInkM1wcVlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9BnI9bZQiWVNPhJU+RA4A9CyyOBiuG117lKgPpuecQzpQsDNy6ckyagiUJG2cJC+M1e/Y0PW9Qrbh0tan0OJOaOEU9R+llQVe7yGaoAi7lsiRzo9i+KrO4AzbcT5Vq5jPijo8oAvjo5qJAkeHG+IiF1OgEqZDOOdqNKTQzbo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVfDWTtU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVfDWTtU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C810AC2BCB0;
	Mon, 11 May 2026 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778525633;
	bh=sp0Hw8fi6fpvfkOdVUXwcYaLLWzyVLMDBInkM1wcVlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mVfDWTtUa7p/86YmfGeCEahKojoEhzgqnWyYEw7KO181UKSg8o8QDlYAVGPAb/u4A
	 jSSrD014KCRgEX8PLqiezAtl8V1A+hVxff9FhD0OZ/1A38ruCJdHGGATwwkkHvfC1Y
	 WaH0P6x++Yl9gapg4yS+VFvjUZnH4YZhAHDAzrLQAjjytwi9rtl9hFrFJpij5nXGAF
	 0mL2/FvHXz2J2DiCBc9u941z+8uHfkPrC+kh5cCcZ7iY0xwVdBmjc5tbr5Q1YLvIuv
	 C/gGCPw2DcBNnFbh1nkG9/dziPKh+8ztyUTIlMO++7BdI12zFqfWb8q2dGxWEWmIut
	 3KTNiJVW+bSiA==
Message-ID: <55294e45-ec2d-4506-8836-7fef99dd9698@kernel.org>
Date: Mon, 11 May 2026 20:53:51 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: add Acer battery control driver
To: Rong Zhang <i@rong.moe>, Jelle van der Waa <jelle@vdwaa.nl>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
 Frederik Harwath <frederik@harwath.name>
References: <20260510185017.316935-1-jelle@vdwaa.nl>
 <20260510185017.316935-2-jelle@vdwaa.nl>
 <aefaa595ac8566086002e50fafd4194ceab23f01.camel@rong.moe>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aefaa595ac8566086002e50fafd4194ceab23f01.camel@rong.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rong,

On 11-May-26 18:09, Rong Zhang wrote:
> Hi Jelle,
> 
> On Sun, 2026-05-10 at 20:50 +0200, Jelle van der Waa wrote:
>> Some Acer laptops can configure battery related features through Acer
>> Care Center on Windows. This driver uses the power supply extension to
>> set a battery charge limit
>>
> 
> What does it limit? If it limits the charge capacity, ...
> 
>>  and exposes the battery

<snip>

> I recently learned that POWER_SUPPLY_CHARGE_TYPE_LONGLIFE is not the
> correct uapi for charge capacity limit. See
> https://lore.kernel.org/r/09d21c9cee8af49fa1d5b568358db0c347668ee9.camel@collabora.com/

As first dicussed here and acked by Sebastian Reichel the
power-supply subsys maintainer using charge_types exposing
standard + long-life is the correct thing to do when there
is a boolean long-life on/off toggle rather then a configurable
stop-charging percentage setting, see:

https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/
https://lore.kernel.org/platform-driver-x86/20241209204051.8786-1-hdegoede@redhat.com/

and also here, which dicusses how upower now also supports
using charge_types for this.

https://vdwaa.nl/charge-types-api-upower.html

I've also replied in the thread.

TL;DR: your original approach to use charge_types in your
patch is correct.

Regards,

Hans


