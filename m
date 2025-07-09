Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33660221F1C
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 16:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752080163; cv=none; b=or1YuC3UIzw7CG/3Q3oyG1JWChjFbbARYweU1ptYF2cbfjQ50PafhnLdG1ERlWXOFvnY9VkDkZ42Vxp0d7kKOoPCjAdSfDzyFOgTYZqo1XCaynoQZ2TWSqKvkmwYfYa3Joh63AxtnyUaF1PpdrCuhmAmh5rFpHRC6rBC1ZjkDOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752080163; c=relaxed/simple;
	bh=ohLnPvZhA0Myjj3bRajXZ8Pn/d5f8pTgaTAILvjPmHM=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=jdk5/toRKULQjP8UrlfkLxFq11HQYiStf63VpU5XyVVr4tSGyjZDAXa4kDCUKzBf4bxSDTFsjQ0leUJfFpbXgP3Q2kXorzYBKrVE9UjdWPO0AL8NeXjWC5si6TQnZGzp3CQp6XFiu3bNhfhgr4DqbPYMCApQsC7bkurS2q+f/dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=3YM5neut; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="3YM5neut"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id C4FB7A1CA71C
	for <platform-driver-x86@vger.kernel.org>; Wed,  9 Jul 2025 18:50:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752079817;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=ohLnPvZhA0Myjj3bRajXZ8Pn/d5f8pTgaTAILvjPmHM=;
	b=3YM5neutWw2deXccBp1gY6JkOksJ+ygJT4rQXS6TtbKMsIhdXlHV8qeYMXkp6T73
	QQBOol68rF/Fzhr0SFvTDHmuD61mZYUFks5QeD6n4OHw/cuXqjqrrL/u7rrtgZQcpOa
	4UnpYuHCRknMaBsOUvYXmagF1QCwITKMq87dpM5mWulwAp9/LCmDoCDYLKBJx2a3+JE
	eDsLO14Ul8o9ePtS7n1KacCd+ZUoav0vkUof2QRP9gyzvSgxLN88fN0CtV4xuf8Nk36
	7xSPZRpdsegTclEqLjIPsai1DmT8JfgbSsOAOhEjo9AAFehIYBBT3LrGhvIi5lAWJh0
	idrDcYJQYw==
Date: Wed, 9 Jul 2025 18:50:17 +0200 (CEST)
From: thysupremematrix@tuta.io
To: Hans de Goede <hansg@kernel.org>
Cc: Platform Driver X86 <platform-driver-x86@vger.kernel.org>
Message-ID: <OUk54Xd--F-9@tuta.io>
In-Reply-To: <98f55bc2-c996-4784-b9be-203984b03bc2@kernel.org>
References: <OTkZ4I6--F-9@tuta.io> <98f55bc2-c996-4784-b9be-203984b03bc2@kernel.org>
Subject: Re: hid.c - need enable_5_button_array=1 for hardware volume
 buttons
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Is there any update regarding this? I understand we're all volunteers here,=
 so I don't mind the wait =E2=80=94 just want to know if it's getting proce=
ssed. Also, another note that due to unforeseen circumstances I can't acces=
s my laptop for a few days until I reach the city.

Thanks,By Matrix :)



27 Jun 2025, 20:00 by hansg@kernel.org:

> Hi,
>
> On 27-Jun-25 10:45 AM, thysupremematrix@tuta.io wrote:
>
>> Hi,
>> I'm running Arch Linux on my HP ProBook x360 440 G1 but I couldn't get t=
he hardware volume keys to work, though they worked in kernel versions olde=
r than 5.5. I found that after some digging, sudo modprobe intel_hid enable=
_5_button_array=3D1 seemed to work. The documentation at https://github.com=
/torvalds/linux/blob/master/drivers/platform/x86/intel/hid.c said to contac=
t this email.
>>
>> I think this affects a lot more HP laptops, I found a forum post on Fedo=
ra forum https://discussion.fedoraproject.org/t/hardware-volume-buttons-not=
-responding-on-hp-laptop/97611 that said that this affected them. Maybe we =
need to apply the fix to every HP laptop that has volume controls? Thoughts=
?
>>
>
> Almost every HP laptop will have volume-buttons, but if you
> change your statement to "HP laptops which have a volume
> rocket on the side" then yes it might be a good idea
> to set enable_5_button_array=3D1 through a quirk on all of them.
>
> So maybe do a DMI match for vendor=3D=3DHP product_name=3D*x360* .
>
> But first we should check if we can get the auto-detection to work.
>
> Can you run:
>
> sudo acpidump -o acpidump.txt
>
> And attach the generated acpidump.txt file to your next email ?
>
> Also if you can build your own kernel, can you add some
> debugging prints to drivers/platform/x86/intel/hid.c:=20
> button_array_present(), seeing if either of
> the intel_hid_evaluate_method() calls there succeeds and
> if yes then also print the returned caps ?
>
> Regards,
>
> Hans
>

