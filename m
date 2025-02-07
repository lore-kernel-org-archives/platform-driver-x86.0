Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7CF33EC
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Feb 2025 12:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738932070; cv=none; b=BYtwdr780D6PcJQXafhH+WMjYtnd6SWtR7wOCKkAPb/GD1ZnR6Xnuu/NER7MON/CrbrGh79RM4hy0VUup6L2XqzcTEXdTAsxxc5AQ6hih+8bSRPwJwrwasdTTLHtR87lbE1X5cfF3o7c18iJkgHSi2OP5JNnyvZQ/35W6x/MxX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738932070; c=relaxed/simple;
	bh=nn6zUh5mP73h6zr47u9YdA8m87mX8oGNU5giWtrs4Yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=H7eT6IBGp7FE3tt+IyxPap8AQ6v2aTxuEcyOys53IKPqWKeQsjICe0mByC/4myjlek/PIiTE9EL3q+X69wLvT7k8gky7r2b3KXEcl4cUO3hKwaTRogBhymIHltoB9GtQjPe2Asf4rprts7p3JGplMd0XCX2EDkJPEErXwollb90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QHK6T/CZ; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QHK6T/CZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738932065; x=1739536865; i=w_armin@gmx.de;
	bh=nn6zUh5mP73h6zr47u9YdA8m87mX8oGNU5giWtrs4Yo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QHK6T/CZGhYkztN+sthTDZxgsQLnBXpSVlgz6/v24G8tQAFlstjcTkDDG26mF/AH
	 ZxEV7eF+V7se5isdzicJkJJvl810Ed3+rFhBIiHWBqELb0Z3rJBAvkjxBR9v8p7Ga
	 IL2795MVPtGF/cakGm5zuXCm695reoymVZFfuSeq8mDO48SFXqIRUZFb0R7wlfRSh
	 OkJLkVbRXyUvVHSM7ii+NNEHBbK+REBV7nw0FvM6KG1YvhyLBH2LJyeBJe4T+9fKL
	 hunvshS/yZdhQ+LXe5pm9KvP2SxiC5Xxpzb28QdX8jE0iM2mhgIBAZ/vPd85oP9EU
	 bzhw1W7bN3WKaUSZjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2mFY-1tGpSe3cUe-00yard; Fri, 07
 Feb 2025 13:41:04 +0100
Message-ID: <e430d262-8c1e-4c8f-88eb-98a71117e8bf@gmx.de>
Date: Fri, 7 Feb 2025 13:41:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help fixing turbo button and power profiles on Acer Predator
 Helios Neo 16 (PHN16-72)
To: Sourajyoti Basak <basak.sb2006@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <e0f625f4-9c55-4021-ba43-668edb9fe80d@gmail.com>
 <083e0184-19e9-4473-bebf-5536b3d5ec10@gmx.de>
 <4d281c36-4996-4518-9db3-e11780f6fbfe@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <4d281c36-4996-4518-9db3-e11780f6fbfe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ojvj5DRnNgSgSTaeKOu8rDXTdWzD8dSlG80Pau76jZG4wDeZUtz
 +Od4ux0/VfNO5cWoLfAqoUBvxe3hWpHITZv1gBKneu33THBVbz8l88+5OC+3L3TpUgFUEOs
 TMH+WgahsG6q6rPjiDRoAsbbfwZsO5a7D8gHnudzQlVDy0r5sNidZ89OxzvkEiy9yFZD9v+
 PP+QUPyvx4biU4zgIHPZg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:O77giQwHwHQ=;u0wa5SrM96oZVyosi9zkK+wP+Nb
 m1oJcNYJ6kYFd6n8gaw2Iqdo9JvF5EoSKrK81RpxirovG2YDK8C8tmHArmgawyl7KXzf+Jodu
 4lmHfZ8EFaNOztaQgyD3zQzOy3ADjvdCljMXc1kL/DRSF3ilB25O8MWDuxl/5cfhDAi/x0+iY
 EdTtOcnNbMieFUoVxzYC94UVpBg8HYBiMuZGMEJinUyhvpoMWcvkTjZsyMbwVUuMfIleqpGeo
 Aao4jUVx4LfNaCPWXgaLmCUViE+8CFy01LBcV9asD1ZTqsR/vVVfY2UTKgOWMRLwuMuN1lxrt
 jxAggZ5F24lzp+OS9oosF2UUJ3pBWJfo1UbJoYVimpBfz6mWc3LWIIi6MUzxP0HB6JXmiGtnm
 N/JZnz2wPZXFSno/8ZTwQMYe0O0dFjwrTD2BOAKmAYpsuEk3xdicC5ZucDzwEKqyeqUCoHhma
 47a0ss9IU8VEGyZ9c6iZtQhxY4nuvXePJQj+fiqrz6eKawBpzYRAoxqGbZVHMBffZwSf/Oi1I
 QbNETyGSzeEwTYem9IYoMwH9Wog5xCDMwHPBQ4Z5DEWN1GcQEw9gtE8B67QmFDZZvej/aee2B
 zrV0VjlnKGl/xItN7n2WL+Qdefr7tSHx6Ev6az+14ucy4z4cwfVIBafXREjoXnA2FU5rw8HiI
 Za5/gFEKV74n3GjVYNMgrHkD2x+NzeZ9/uuOINuZgDMpR5et1RfDZnIH/Br8CK8BHsnMARPAP
 BU+AWCj3l+mjsFdOyudDcCvTwc6uEp3Xc44y6JuEa0lIVlHS27Xy06mr1BFpXw68g3SSTB5l8
 YO+mufmFwbg343xNQ2zAJ+tlbnzpoIewiSBPg2G0qyWK+QZlkbaaphSs5TUFWwFAmc0FLMhKi
 ppce2E2AdHWDME+B3Z4YruzHvSecM5Zwc6BtQSZnFgI2VFYOhzuWcwuNSsLH4Eo/hXcKr5acj
 oL4Q9f/0PQHYedgFHj7RcqultIGnuSkabxLS3FYr/Vx3NKujq012ROKW3ytJqKWrdZFEE3B8O
 /dMi+ZsZF5DPBKxOdqR0cdgDqkZxvcMWHF6g1udrXfqIPD2++uf0UomTUZj6t5mcqkOus8tm1
 FRQS8oZfWCAB5cw7e0VlUAJwM+RENv2Weqmlas1wl1wp/rs9ujPlLWqzPAEJJ73RnwG74XJHg
 y6f8dP0cHyzpF1ETJkl5mIkxIQPOaVxad+edSS0An2wi1AJwt6ljMXD8IOg58Uj1F53Pmoy3b
 bgz4/sBUA6FJc9JXI2xWyKEMgvjtibKJ+6o+U/CCTKQfaBTmcKNvwsVnM47df+iYWHzI2HqjC
 Lbz2pFstG3fXB1gf1I004Fs2xFfGrZKT0RmIfyLlTArrSSo2CJ/h8Wy3ahLPlqGz1Dqa+u01+
 Vi2nGslfaAbYUYK78ZrEYVWXWTcjg+e9Nsu1keZH6F5OhataWxiyLUZju1Y9+/RUUJSiaoVWv
 +e8fPQIJWmSGpe4R7DRrW9kEV0tQ=

Am 07.02.25 um 06:40 schrieb Sourajyoti Basak:

> Hi all,
>
> I initially replied only to Armin by mistake. Resending this to the
> mailing list for visibility.
>
> > On 25/01/25 3:08 am, Armin Wolf wrote:
> > Please share the results of the following commands (needs root
> privileges):
> >
> > ```
> > busybox devmem 0xFE0B085B 8
> > busybox devmem 0xFE0B085C 8
> > ```
>
> I tried running these commands, but `busybox` on EndeavourOS does not
> support the `devmem` applet. Instead, I used the
> [`devmem`](https://aur.archlinux.org/packages/devmem) package from the
> AUR.
>
> Here are the outputs:
>
> ```
> # devmem 0xFE0B085B b
> /dev/mem opened.
> Memory mapped at address 0x760fdfaae000.
> Value at address 0xFE0B085B (0x760fdfaae85b): 0x0
>
> # devmem 0xFE0B085C b
> /dev/mem opened.
> Memory mapped at address 0x7f5ba88f8000.
> Value at address 0xFE0B085C (0x7f5ba88f885c): 0x0
> ```
>
> > Regarding the clocking issue: I have no clue why the CPU speed goes
> up to 3 GHz. Did you install the Intel thermal daemon (`thermald`)?
>
> Yes, `thermald` was installed on the live USB when I performed the tests=
.
>
> Thanks for your time and assistance.
>
> Best regards,
> Sourajyoti Basak
>
Alright, the values seem useless to me, so we have to try something differ=
ent.

Can you dual-boot into Windows? If yes then you can use wmie2 (https://git=
hub.com/vinaypamnani/wmie2) to execute WMI methods.

I this case i would like you to execute the "GetGamingFanBehavior" method =
of the "AcerGamingFunction" object located inside the root/WMI namespace.
This method take a single parameter called "gmInput". Please check what ha=
ppens if "gmInput" is set to 0, 1, 4, 8 and 16 and share the result of eac=
h
method call.

Thanks,
Armin Wolf

