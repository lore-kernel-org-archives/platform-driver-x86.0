Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD1533373B
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Feb 2026 11:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328537; cv=none; b=i2xSoa+gs5AAWdcr2+0soINZA58GtuoKCTACiTnPpzQQpNWAc1sXmcHH2gqNqk7GukjKbrX9jDEGLb+APJCwxri7PCGzT1SfHY56LEK+wymQI688M2GTb8EPNFRw8FzJ0FvaZLCdnntHURsvj6uKdyajLI0EIVSSe0ZpV0uwQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328537; c=relaxed/simple;
	bh=h1TV1QrLmc8hnHpaO/AEnBmYXf/nAbdw7DU4/BcA5Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a3UlhyC0Bd3oPf3GqYi3QJWub575wooRYh4uW5y1WllNMGJL/zS3EqObf1LPvtIBVdmuqfW0JinDurF6U2Da9bAKdLLeBJsQV5qMC+QilA72aieJAnjq+Fh0hytT/+4RJCRvPm7l8Lq8GT7tdyvakI1keqrssszxTd0juCrZbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWVgl3Yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWVgl3Yd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BB7C4CEF7;
	Tue, 17 Feb 2026 11:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328536;
	bh=h1TV1QrLmc8hnHpaO/AEnBmYXf/nAbdw7DU4/BcA5Go=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DWVgl3YdfzFyHdsGFtBaSlEnEF8lkH9FtBkGpcmqUPDHrt9ksEmb/w1naSbpRbHQJ
	 AyC7tTsUNIoX56KwYPLFg6UZa1pngukqvhYBK7gKu7Mpd/Tx6Xv1IT19iL9jEvZw/b
	 HOmPyo9y+QLxW+jYc7h8XfQPCo6tHYhJWgG944KEgoeOXnFE0rjOW0JzezsUuqQnh2
	 FgaZq1EY5Tn/b+gDU2092MBifX/C3xAFnwZNCDfMuHgbZV4E4qHNw9+b+fzpAw5i1B
	 JEvROvOX1Hqj5qBvpSDBrOYDGKK/2GLU3XDYb9lRhLbDMie1wCQhFMe7zbjs6WNBeE
	 h9mVDysp7qPow==
Message-ID: <ef96006e-ca94-4525-9727-4a6011fde7e1@kernel.org>
Date: Tue, 17 Feb 2026 12:42:13 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pcengines_apuv2: LEDs/Input fails since v6.18
To: Tj <tj.iam.tj@proton.me>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "metux IT consult\"" <info@metux.net>, platform-driver-x86@vger.kernel.org
References: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <b553243c-9ec6-4016-9fd6-d33f549a3dad@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 16-Feb-26 20:01, Tj wrote:
> Installed v6.19 recently and realised the heartbeat/network LED 
> configuration I'd set wasn't working. Checking the log I see:
> 
> kernel: platform gpio-keys-polled: deferred probe pending: 
> gpio-keys-polled: failed to get gpio
> kernel: platform leds-gpio: deferred probe pending: leds-gpio: Failed to 
> get GPIO 'apu2-leds/led-1'
> 
> Looking through commits I found b8754092dfed4fc2fc
> 
> platform/x86: pcengines-apuv2: Use static device properties
> 
> After reverting it the LEDs operate as expected. This entered in v6.18 
> so will affect it as well.
> 
> In v6.17 I see:
> 
> kernel: platform gpio-keys-polled: deferred probe pending: 
> gpio-keys-polled: unable to claim gpio 0
> 
> that is a slight variation on the v6.19 report. I've not pin-pointed the 
> cause yet.

This should be fixed by this patch:

https://lore.kernel.org/linux-gpio/20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com/

If possible, please give a kernel with that patch added a spin
and confirm if it fixes things.

Regards,

Hans


