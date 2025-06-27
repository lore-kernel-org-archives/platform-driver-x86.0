Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57943146A60
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034629; cv=none; b=PHpJG6kfji842d/1AOTyXIPLZl3Zc/hGhtacAYEeYnSWD/qSXzDrfYT4hpua+24SrWWIMhmCGQYLDA4AqGVLfWwuGZSXSoDX9BjpokyVtNojv39Qg7t8PeaZd2x4qygai3oTKpuPwL4LL9UiaBwIxr3TqSx9SiLXWKBXYw1vl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034629; c=relaxed/simple;
	bh=BP1aNHjShi+e39c/aFfUx1aim1ekDAXTnmMS+GJu9Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jnLVZSXoPiIbhKh2YAHmNr+dn1iKyQNDHO30W/N1ttX7Y5DNj/IG4XYS9Eig12mdldW3nhpYVVANzSdFJRE0ysbJz8Lj++PldfMoTxXcvPsDM+gEYf6S5ks0zn7s1Twl3xE805OzHS6vcJpoPsIElHfGezPgo10Ds03Wth6x75E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNtflJD7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNtflJD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9CBC4CEE3;
	Fri, 27 Jun 2025 14:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751034629;
	bh=BP1aNHjShi+e39c/aFfUx1aim1ekDAXTnmMS+GJu9Jc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CNtflJD79SWPhFhmyL012vJdW7NJLdcBAeucmWULdFQgDbXFJKGS9tz1h5lYqffkw
	 qyzhkJWGiuSJBG8VOev7k02NLhrFZhyajhcnc3OtquRslQmEgwO6J9gJA9FLkFdafK
	 ter79ts4gOIzgYigsf6uYnWfF4qVB9lasJ1pAiCmgfqe/JtnXz5nhNzGT997Q/57hP
	 JDNBaMrWQiTo2NNLoKMDYRkVJD4ijPLdvKb9nvYyc6O4r5mrxUhq44d16/bGekyhs7
	 WduM0/RKGqp7jiy1H7M+DhxVsD9WKPzfimnSzdkLSiEI+ZGBXF9c51bDqaVqEIDikH
	 fL90lNf6IyqlQ==
Message-ID: <98f55bc2-c996-4784-b9be-203984b03bc2@kernel.org>
Date: Fri, 27 Jun 2025 16:30:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hid.c - need enable_5_button_array=1 for hardware volume buttons
To: thysupremematrix@tuta.io,
 Platform Driver X86 <platform-driver-x86@vger.kernel.org>
References: <OTkZ4I6--F-9@tuta.io>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <OTkZ4I6--F-9@tuta.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 27-Jun-25 10:45 AM, thysupremematrix@tuta.io wrote:
> Hi,
> I'm running Arch Linux on my HP ProBook x360 440 G1 but I couldn't get the hardware volume keys to work, though they worked in kernel versions older than 5.5. I found that after some digging, sudo modprobe intel_hid enable_5_button_array=1 seemed to work. The documentation at https://github.com/torvalds/linux/blob/master/drivers/platform/x86/intel/hid.c said to contact this email.
> 
> I think this affects a lot more HP laptops, I found a forum post on Fedora forum https://discussion.fedoraproject.org/t/hardware-volume-buttons-not-responding-on-hp-laptop/97611 that said that this affected them. Maybe we need to apply the fix to every HP laptop that has volume controls? Thoughts?

Almost every HP laptop will have volume-buttons, but if you
change your statement to "HP laptops which have a volume
rocket on the side" then yes it might be a good idea
to set enable_5_button_array=1 through a quirk on all of them.

So maybe do a DMI match for vendor==HP product_name=*x360* .

But first we should check if we can get the auto-detection to work.

Can you run:

sudo acpidump -o acpidump.txt

And attach the generated acpidump.txt file to your next email ?

Also if you can build your own kernel, can you add some
debugging prints to drivers/platform/x86/intel/hid.c: 
button_array_present(), seeing if either of
the intel_hid_evaluate_method() calls there succeeds and
if yes then also print the returned caps ?

Regards,

Hans

