Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2B74501A
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 20:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753476199; cv=none; b=a5Y7wXz8InLzX8Cii4F6SStgLeTaBORXBHu291gUqj4J8Mz0C5yn8tWe6FB2LIdJNVGtGsJBO/CvxmSWXmudI+s2KBdZD9zAcOmB5V9pvOaiR4nZZPg7yZBDSO8iwbeFv8WrRukBvvlBswI/OyTFH7SjhuOMvt5TKROGwvk+qzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753476199; c=relaxed/simple;
	bh=rrYFi09JWeqEsnD3+oC20zVzR5Tg/9MCfvG2fmwE49Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnfAXIn5lHLJc2h0r9EKpj/TG2Db9s7bhu8ygIUw9fhHwZv1FOkKL8GSWnROK+oMKDxigXTbq4qJKYsqjEtpUxSghzkTkiexA8nP1z3mO1tJ/ssKlkyi/zzz5T2oxSVLosvCMwNt0uNiszqqiIyoc7y+TFrrVCsiKtF5ujmT3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sI1OYFRu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sI1OYFRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D66C4CEE7;
	Fri, 25 Jul 2025 20:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753476199;
	bh=rrYFi09JWeqEsnD3+oC20zVzR5Tg/9MCfvG2fmwE49Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sI1OYFRuhOLKKGLDHWDMAso2EJ9Jw/yH6i7bFHxXbCl4pHqDn27ExAtbqUaQkn8rX
	 hhQyuqvX31QDgLwVoo9EIPOZ/wZY7YJOJhuVwjMrCzTLKMMuvpDZP6zYV46uOhGwfa
	 SoLi9zZZwoa9pfs0LbOvVK9Yh/U3xiRFznYfKOQhKH8xkyWK+awHaw+PFYSt2fCVjs
	 6kFG2FLGKOyuFreWGQdn0Zia9jbxDW8odlnAbGCr7GPDOLq8s8pgG/GG7ClrLelYn0
	 hxJfvyvwX0fhJLMO06LykeoZDZ9PMVqia5MWU6kQHYZEHILaRD9ax4D0M9ZykE8rqc
	 Ex4QdqDCt14LQ==
Message-ID: <c4b280a3-e621-483e-932c-1f0547be5e79@kernel.org>
Date: Fri, 25 Jul 2025 22:43:17 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: int3472: Increase ov08x40 handshake
 GPIO delay to 45 ms
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20250725144444.210043-1-hansg@kernel.org>
 <20250725144444.210043-3-hansg@kernel.org>
 <CAHp75Vf7yoLYNTQxgJFbA2FT2dqVJ5BBF0w-uTJsYooON7LqXQ@mail.gmail.com>
 <aIPDGsNVrd7tBvY8@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <aIPDGsNVrd7tBvY8@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 25-Jul-25 7:47 PM, Sakari Ailus wrote:
> Hi Hans, Andy,
> 
> On Fri, Jul 25, 2025 at 04:52:26PM +0200, Andy Shevchenko wrote:
>> On Fri, Jul 25, 2025 at 4:44 PM Hans de Goede <hansg@kernel.org> wrote:
>>>
>>> On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
>>> out of tree drivers is not enough. Testing has confirmed that 45 ms does
>>> work.
>>>
>>> Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to fix
>>> probing of the ov08x40 sensor failing on these laptops.
>>>
>>> Note this only impacts laptops which actually use an ov08x40 sensor with
>>> a handshake GPIO.
>>
>> ...
>>
>>> +       /*
>>> +        * ov08x40 sensor with a handshake pin needs a 45 ms delay on some HP laptops
>>> +        * https://bugzilla.redhat.com/show_bug.cgi?id=2333331
>>> +        */
>>> +       { "OVTI08F4", INT3472_GPIO_TYPE_HANDSHAKE, INT3472_GPIO_TYPE_HANDSHAKE,
>>> +         false, "dvdd", 45 * USEC_PER_MSEC },
>>>  };
>>
>> My gut feeling is that this might be needed for most of the cameras
>> with the handshake signal. Do you have ones that work without this
>> delay?

For those laptops with the CV chip that Sakari talks about below,
25 ms, which is what is currently the default delay seems to be
enough.

> I'd expect this to depend on the CV chip, if not solely then primarily at
> least (firmware could play a part maybe??). Isn't there a way to figure
> that out?

These HP laptops do not appear to use a CV chip at all, yet they do
have a handshake signal... Specifically there is no CV / USBIO chip
on the USB bus and the I2c and GPIOs for the camera sensor come
directly from the main SoC.

With that said, even if there were a CV chip, then given all
the problems we're having with those I do not expect us to be
able to get this info from the CV chip.

Just getting the basic IO-expander functionality upstream has
been and still is a very troublesome process.

Which includes very different behavior between USBIO chips which report
the exact same firmware version, it looks like the fw-version reported
over USB does not always get updated in fw updates...

Regards,

Hans






