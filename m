Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35073BB54;
	Wed, 15 Jan 2025 19:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736968085; cv=none; b=WePxyFicvXyeyCdCaBJzUKjgeuVQuwHFJ3ZYGh56fwvEg0WvggsukpKMxCK+kJ6dUTacNML1Vs+pxvKqdQMXYHOmnPcEsFOgvUHYe2d2K6tThznOsTQLsB/nFo6Bogu/YpvAHOJlP2zuS6r7XyC6Lg5mL75hY/UhaX1fCU0jRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736968085; c=relaxed/simple;
	bh=yKHk27ysIJdLeF9Vydk2MFU/GIKZyyc6EzmE/vT/P4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv364HyVE4O29L4siwdYSuTYzqPxOGGQzppX+lOUrJHx93b6gOjoEB72xZheAkpF+4dtD3CscoRo3qrpiIkrtdx+4J+BnR579FgHnfT4sE5gQNo/UQ/yKOXF2gf7bafDERl2jGKUzBckPBMTftGuRg/Mzx0jYIQ+YF0lxn8w28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=heiYmWBY; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="heiYmWBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736968079; x=1737572879; i=w_armin@gmx.de;
	bh=TiSW3lXNKMYakqd5G9HxcSgDfSTEdZh7Q8EQ+SaH3SE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=heiYmWBYLgPMe7GRu47elZHENQnOEW5AEP7BwTrbGcmgy2EZNDFPUUAPvuHIVast
	 aPAF0zRPwFEYLC69Wp0op2E96XblSe3GV8yuohVnRJynuiHWs3xX6XVxaOfPEuD3F
	 m1fN3bTYeekHvXHVmBwhTjgIio1qt1syDjDCiHql6tZ8a8RiLptLYi67xwo0QEU9l
	 ++2jUypVviu7yiJsGBtHnOdGbN8c/FwvfYmFj5nu6PHw0ET02fIcFZsG0U8DHDEnI
	 /JygKwC6Vgpy5FHzH4k87O7YBp7oLiSkE9ExalQ7O7j4FcMHwckk6FINcqmwXe3/X
	 rIb8H7iBE/FlpQ+ogg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmDIo-1t7ugA39u4-00eBr6; Wed, 15
 Jan 2025 20:07:58 +0100
Message-ID: <71969195-db20-4e24-8caf-6fee389a7d70@gmx.de>
Date: Wed, 15 Jan 2025 20:07:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] platform/x86 acer-wmi: Improve platform profile
 handling
To: Hridesh MG <hridesh699@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Kurt Borja <kuurtb@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
 <173695186401.7584.2765000569734785177.b4-ty@linux.intel.com>
 <CALiyAonhojK1-z6iZSkHW=pnNOo7WGf_3ekxHnabDX0B4=xsvA@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CALiyAonhojK1-z6iZSkHW=pnNOo7WGf_3ekxHnabDX0B4=xsvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7qY7VvPofs84BO+K0sEJE0k1OWa8RnkHaqvEeSXDNW5oHHK3bNu
 7pmxgsbP3tzvQ1UlFI726Iovw5+eCbR6QGHwWQ0wqCdUlggUjfnFHlPrvGM8Thrnttrhupp
 hj9UeUArhLYwUNjVKNyzX88KdzzQBIciWmvqYm94ZGaXHhEg6r9vWuNtn6xcHeoAwWV3HdM
 fHwzYJftpe7F8sVrsdFqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fFUQXzlN0Yo=;3lcseFgYXZfJq3EFSjeirAdgGr7
 F9kTk26uaT9PIobNkXNCIbKLBzG9yV3yyzhELEupdquTWNd9tvgeTJgtH21BBjioIg41INNrN
 k0Mw9yY/dyMhlmCiBgAjnJ9oTq17bXV/yOo6MvXj0vQs2Ai70O3o3FWJGAcrbtut86lkkcJLm
 Hrj1sHK1dhpzaYaKdMPXbsqVek17zRFDt+dD3pfsr7agmvHglYPx+H3Rao6fCmvDO5y0BowkC
 oLmIEMuhYKOghdvT9Uf0N+A3UoCcBN4cfVDGHsanMsJvqzd5IpA21JL52REq0TQCcRkMkeHyX
 r2MhPYYFGLQjW9ESjT3QqiMobjNbKY6WQsSROL8CfkWMx7iBlKFMr4NwmN/bjkU/APNkp2Q3J
 93exnDeSrmuHBtqHO4qohBrznqEkqdCHPL0ZR7sbXuJOOZgPZG5uW0mM+mRIbur5KulF77ztc
 2Ldwd6I3KX9bHaX77tMjhvOf+O39G3BFRnYWp/jlBP1Ep/p/ZwD3eEQiEVAykGtQxsnyHxX6+
 4/UGZ817ZLCyiOsrCz4c8V63HGqNCvt3WqNG5YqS6A9HRGkydjsCzpSgApLtFddQuoTAtDAFV
 xRZTccBq4Yun+sYykYWi1K1NoaqiSVG9tWiXRdYl65mJwSPGeFZ/ZPNEIxA53DCYspjRyRMdz
 YSxRADubrRqjo5+EjsUe3VvgXIy1wcQNzzNgLCMY6Ai1HHi1uTtCRB+TcKHxtobrB6OHGzTSD
 LRlUzPy4iljBMdrUmMOiQVjL1RYYbt3hVYQhN+ndZn2bSn3qMXxGAZhXSwVO4tcWHtWJzYogP
 uL3HoC66VRRKvxdb6M549eTO27KXUmid7S+YSazSYpyd4OGr8R4LkT/FqwluDq68WOqd7+xyY
 FiITg84RWVPaLJ2IDerurPn1XQBq2BS81OJUj2hq0HYxaGTSqk7eUShZmWw5jaTRofTjiVqeb
 mGZJX6rIWJCR+6vNtymU/JGN9nTPbpo/lGha7xtE/2KEM1e6rFZ82oFwJkFm/hxBioHDRaVc6
 I1Lz6Qiq2p4w2v+2NPP+M8pCd8QImuGOdpXDJz9WGvAnW+0nlp3he0RIRXPYAEJ35CTbr8rvb
 yn97Vfta+0B9s7xuBK6rxrkLT3IVXNDsJRss05HBSDqh7pVq0NjNwnkoI/6tEB3CP5M1gIvMA
 NuhA95zZhj7kyEoJICcvraUSpftHRwfhDqytFLuvU5Q==

Am 15.01.25 um 16:23 schrieb Hridesh MG:

> On Wed, Jan 15, 2025 at 8:07=E2=80=AFPM Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>> On Mon, 13 Jan 2025 18:44:08 +0530, Hridesh MG wrote:
>>
>>> This patch improves the platform profile handling for laptops using th=
e
>>> Acer Predator interface by making the following changes -
>>>
>>> 1) Using WMI calls to fetch the current platform profile instead of
>>>     directly accessing it from the EC. A new helper function is
>>>     introduced for this purpose.
>>> 2) Simplifying the cycling of platform profiles by making use of
>>>     platform_profile_cycle()
>>> 3) Using an ACPI bitmap to dynamically set platform_profile_choices to
>>>     better reflect the supported profiles.
>>>
>>> [...]
>>
>> Thank you for your contribution, it has been applied to my local
>> review-ilpo-next branch. Note it will show up in the public
>> platform-drivers-x86/review-ilpo-next branch only once I've pushed my
>> local branch there, which might take a while.
>>
>> The list of commits applied:
>> [1/5] platform/x86: acer-wmi: use WMI calls for platform profile handli=
ng
>>        commit: 2d76708c2221dde33d86aeef19f6d7d5f62148b4
>> [2/5] platform/x86: acer-wmi: use new helper function for setting overc=
locks
>>        commit: cd44e09bb89d4a33514b9ec3d972f0d2d13f5cfd
>> [3/5] platform/x86: acer-wmi: simplify platform profile cycling
>>        commit: 61c461a90fbfc038d9663713f293d60fcb58c41d
>> [4/5] platform/x86: acer-wmi: use an ACPI bitmap to set the platform pr=
ofile choices
>>        commit: 191e21f1a4c3948957adc037734449f4a965dec5
>> [5/5] platform/x86: acer-wmi: add support for Acer Nitro AN515-58
>>        commit: 549fcf58cf5837d401d0de906093169b05365609
>>
>> --
>>   i.
>>
> Awesome, thanks a lot! I would like to once again thank Armin Wolf and
> Kurt Borja for their guidance and help in creating this patchset, this
> is my first meaningful [ to me atleast :) ] contribution to the kernel
> and I'm quite proud of it. Working on this issue was pretty fun and I
> learnt a lot regarding different things, it really did make me
> appreciate kernel developers even more.
>
Thank you :).

Your patch will not only be meaningful to you, since all other users of ac=
er-wmi will now
enjoy improved platform profile support for their machines.

Thanks,
Armin Wolf

