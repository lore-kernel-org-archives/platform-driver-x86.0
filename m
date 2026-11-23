Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795462767;
	b=pkTOHwdr6Bdjy9qLVeNp+kSsM94/KqdBuhROeyxxL+fbd8/jIQVVC0ETWZx+dG5G94Jo
	 Za+BHF/U6rW1ePbY9tHkPWncgav7tmxDK42vcCKOBV1z6Bg66tPLPejBHwzWrArGyHhq/
	 OoWeQ1TtGxj9p8cP0cpWN1E4/gf5GY7nObsAbR0XCQZAPOfIJGtpiSyS75InOv6fXhOGE
	 M3mGbUeSRjWk7Gv9KeKfA3TSytfjN8EUPXxPGo5Y/L0EtFsrpwQkmi9brSp5wAthdhIE/
	 4UuYEDv0PQ+ghCdfwYJLUiI8nU81yDYrp3+9AGJi6UnzihRyZtvpOEqUQaEloTlbShw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795462767;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:User-Agent;
	bh=JZmdPRi7D9mB7B1aqnmqXb+WPP4wMjy+Gqb8hrvXIPc=;
	b=eJzneVb9rBp4Iz+SkBEkvZYyg+mACOObKDTbxQUJAUgVFsCgLBPc0sQys0YrdMYC96fd
	 QDKHu4wV2TeOmKoS64rUpxsaTnDyTR006VqaXuVGkaMr2q77dHm3BPocVViWwObfMsjoq
	 t89AnzzUJEDWz4Bn2qE864Wdonuuq9nvDM9Y5PlHWEaG3sO1K27c1SxGr2LOya+1/+1im
	 Ht+S8mklmr/YiBm9z1tPX5LGTorhbVl5iJRTIb8B9c6h9VZZyfKSEdLM2uFoQ+CNiOoJb
	 CKEamzLpdOXcdHitoDI+xGjScgWAPito26lckDyJWNEuHXelwgJjL4tE1M4qpEC34Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqSH3SSr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D256D606A31A;
	Mon, 23 Nov 2026 19:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqSH3SSr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309E01F000D8;
	Mon, 23 Nov 2026 19:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795462767;
	bh=JZmdPRi7D9mB7B1aqnmqXb+WPP4wMjy+Gqb8hrvXIPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lqSH3SSrx3xjSBsuo+CArmnU2K4nmBbnK8pVewuWW3T9vUl94UNOufRi4Q0gW3H6M
	 +JZ9RGtf+eO9EGL/gTVoNf4Rz9Whk2+pYq4P2UgCqma5Cndj6F37UaZPYCe7wuhvZh
	 UfbMluCoyy/p7p8nuWjg1D043MfYUenjo7Xx7uAWJm0wKKbIU/UUo+nWLHArQfoQkx
	 v037h2bJ8OGxbn5ZxYu1c5ikCKaUmU3eH60JfqFrxbebB4C+pK8qPDVOjnI6a569xs
	 Rk+qov5kYkp5eBEo+h6SUrEiauXjuvkI0chuTYxUPTK8DqGF6P8Jlel2rdabQflwVH
	 jqUfnXOFmvKow==
Received: by pali.im (Postfix)
	id EFEC7A3B; Mon, 23 Nov 2026 20:39:23 +0100 (CET)
Date: Mon, 23 Nov 2026 20:39:23 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Brian Mak <bmak@nvidia.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Kurt Borja <kuurtb@gmail.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Lyndon Sanche <lsanche@lyndeno.ca>, Armin Wolf <W_Armin@gmx.de>,
	Prasanth Ksr <prasanth.ksr@dell.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"Dell.Client.Kernel@dell.com" <Dell.Client.Kernel@dell.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] platform: dell: Allow DELL_LAPTOP to be
 arch-independent
Message-ID: <20261123193923.cl2i62lgute6li3u@pali>
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-5-bmak@nvidia.com>
 <20261121004828.rk2k2cq4id2ixkal@pali>
 <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af13cde2-6407-453d-81db-1778b30f4763@nvidia.com>
User-Agent: NeoMutt/20180716

On Monday 23 November 2026 19:11:00 Brian Mak wrote:
> On 11/20/26 16:48, Pali Rohár wrote:
> > On Friday 20 November 2026 16:05:50 Brian Mak wrote:
> >> CONFIG_DELL_LAPTOP is currently not available on ARM64, due to a
> >> dependency on CONFIG_SERIO_I8042. This dependency is actually not
> >> necessary, as there is a fallback. Make it optional.
> > 
> > i8042 is used for controlling touchpad LED and for receiving rfkill
> > events when the dell-rbtn is not supported on the particular machine.
> > 
> > Touchpad led is available on more Vostro and Inspirion machines and
> > there is no fallback or detection of i8042 at all. Even there is no
> > error checking.
> > 
> > And for receiving rfkill events it is same situation.
> > 
> > So the dell-laptop driver expects that the SERIO_I8042 is enabled and
> > compiled in.
> > 
> > If none of these functionality is available on arm64 HW, then it makes
> > sense to make the SERIO_I8042 only for x86. And then in the dell-laptop
> > driver marking the x86 specific dependency via ifdefs. Which allows to
> > compile driver on arm64 without those specific functionalities.
> 
> SERIO_I8042 already can't be enabled on arm64,

That makes sense. i8042 is x86 specific.

> as ARCH_MIGHT_HAVE_PC_SERIO is not set. With the current patch, the driver 
> builds on arm64, but as you mentioned, there's a couple gaps that need 
> to be addressed with rfkill and touchpad LED.
> 
> For rfkill currently, the driver fails to probe, due to a failed 
> i8042_install_filter call, if the device is a Latitude or a Precision 
> (checked by DMI) or force_rfkill is enabled, SMBIOS reports an rfkill 
> switch, and dell-rbtn is not supported. That doesn't apply for the XPS 
> 16 Creator Edition, but it may for an ARM64 Latitude or Precision 
> product. For v2, if dell-rbtn and i8042 are both unavailable, I can make 
> rfkill setup fail without failing probe.

Well, here the main point is: who (from HW point of view) will report
the rfkill event? It cannot be i8042 because this controller is not
present on arm64. My guess is that dell-rbtn interface is also not
present as I was told that Dell abandoned this interface even on x86.

So for arm64 platform there has to be some other source of rfkill
events. Or rfkill is not provided at all.

I do not know... because I do not have this hardware. So this question
is for somebody who is writing drivers for this platform...

In any case, it does not make any sense to provide "fake" or "dummy"
device by linux just to make driver compilable.

> For the touchpad LED currently, the i8042_command() stub will return 
> -ENODEV and do nothing. This will register an LED that does nothing. For 
> v2, I can gate the LED registration behind a SERIO_I8042 ifdef.

I think that this is correct way. The i8042 touchpad led should not be
enabled when the i8042 HW is not present at all. And that touchpad led
is only for few models based on whitelist.

> For the Kconfig, since i8042 is required on some x86 Dell platforms, I 
> can change the Kconfig dependency to be like such, to ensure that 
> SERIO_I8042 is required on x86 and optional elsewhere (in case there's 
> another arch introduced by Dell that supports i8042 in the future):
> 
> depends on SERIO_I8042 || (SERIO_I8042 = n && !X86)
> 
> Please let me know if these changes are good with you.
> 
> Thanks,
> Brian

My personal opinion is to make i8042 dependency only on x86. And do not
even try to enable i8042 on non-x86 platforms. All dell drivers were in
x86 subdirectory which cause that explicit x86 was not written in
Kconfig (as it was not needed).

Now when you are moving dell drivers out of the x86 subdir, maybe it
could make sense to check if there are some other config options which
have also hidden dependency on x86.

Anyway, I highly doubt that any new platform / device (which is designed
from scratch; not rebranded or evoluted) would use i8042 for any such
API. Nowadays all those functionalities are based on ACPI or WMI APIs.
