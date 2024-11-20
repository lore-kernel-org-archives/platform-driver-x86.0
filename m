Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361D017BB2E
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Nov 2024 12:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732104432; cv=none; b=QqzhZgePB2/O8uocXzNQ0UbzqD36Nz6McHmOOkMBsWYy5BKxeARUa5saVr7yQCM+QknH+Ou9EJRhp8Btq+fhe+5ovfI7T4pmUyV5iFOrNty8hSiXlLqM+uTNQOhkR8dOkCw8ivesH3djUOmAp5L1ax0huoKB2eCJ6/gm9wyrYEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732104432; c=relaxed/simple;
	bh=Ga9gOPpLo7YxEnJO5y2lqDswpU300m6I4+K8yJoyuPY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EO/nc9WP/uB+Vv+75L6gtnR8FqWITBKtuzVX1xk40rjx/O/XIGGhbFPkO7uR5mKg+7uV0YEN5kJqCSGJPaiPtUG2gsGG9v2bP/aK3PJDB9c6CINnT/fO/zGebqpkafrqlaSw8QZaeQHiOA1lQ0Cd+DfSgL9i4P6rOKWQ0TThlvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=F2qPtz7r; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="F2qPtz7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1732104419; x=1732709219; i=w_armin@gmx.de;
	bh=c/g555/61MXddcZJyi2oeEYJpsrSb0upCLCxYtUQAGc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=F2qPtz7rjIDnwI7m9LXStCE5L2xGf7xj7aJLN2M6WvNHeFlIJ+Y022tAiQkbdu3p
	 lFu3RRUEx4Qw9k9R+aULfDWZhaj6V59WkWjdUFBSly12Y9FXQhJdFCHw5yy0FrjyS
	 FCW9axSUaoDRhF4nli0oZTi4Oivaktnz7IXt5ZcLJYupEAkAWkqvO5FzFEGMv/8FY
	 x/TvAAnQtUIiVDUaMQhty9Bn4/JKvZblG0k1NNbqAP+kbc/wbbANqdfe/Sm0ZhCeR
	 /+ZgJFmCNuumFrCYRKBFr1v98/qu/xcgx50aEleDRL2x3zdaGMd0FOLXtHawhAYtj
	 q4x6LlUL9AAa084WYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYc0-1tbIBp0d8Y-00h7Yj; Wed, 20
 Nov 2024 13:06:59 +0100
Message-ID: <7ce64458-4390-4630-8d59-66e37d6f4521@gmx.de>
Date: Wed, 20 Nov 2024 13:06:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: alienware-wmi rework RFC
To: Kurt Borja <kuurtb@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>
References: <6m66cuivkzhcsvpjv4nunjyddqhr42bmjdhptu4bqm6rm7fvxf@qjwove4hg6gb>
 <bf238c08-1f49-4e16-b9ee-1d1a5e0b9763@amd.com>
 <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <uyzgfmsbd6dkeyx76fmstqpauj4ulnz2eqbww6dz7fwjxwxer6@vwuebqbtl5e5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bcn2P+DHVtYii7JZXv20NeeUdXubjjhgTdjpwRmMA+J8eQQOtnJ
 HxN1LVBc4Y1lAoTLmpvbDvESOgMmO55OZcvGWeczhGviWNlLKukw18rveJVjx5U7bAHRccd
 lRNuGmET9ldmptNwQraTyORVYrO7Q+O0mBcmRZW3uMJYBkXJxnUxoxE0c7hDffKnPSmmqMd
 lkO8aWgwdgtrzrWSAjiNw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q3t18BxwfbQ=;LONsz9dzpztNVEdjaFRvoixTUax
 6Mr9NXtjkA9IGaYmLpgg5BXtJAU+EPX7WzONRM+WfnejouBD+NVQYFcVnSMm5YHCmc/3ZFNzf
 yyAzHrOn1PECu5GHe6AXCfe17gAy7c8pzTGVgU+vykdVZfgeP8ukA2s/DJ75Df1x76tkhhuQB
 zIAb0HfBJGZvDaHphBTk55urF0Vzp7+4XPHsKMjivA8G10KIXMuD3NAu75Uzq9a9eAqm1SjWu
 XvtRDz22b9OdClAjqCNFza0xRaILsPjTJDUfGLtuqJfRbmtlmRf0WfZeVAvyOApwM2+19Sr5x
 J8i7HKgAtCAtuOspgk/0wVF8P/WNyudmPFGDtPhY12eFkW8av7HYck8mflMM2iCPs2/BvqXx7
 SvyxUZpeFXmMLbkeGPBY2UULf24K647Ymmw9pjHrtZWgV4y+o4a99yf/JnDYhSX6xriNsKMKd
 fOAeNe65mhcCVSPbXQeEUNGfjUg1O6uSCOYHJ5tOl2KhetUniERKy1THuelv199swDZfzTOkm
 1MhqCEGn6K7nIrawKHJTf7YlNuK3T74rgRsChCiiLT2SL52dmZHWwYZnEsaQc/mNjQUu+SnJS
 bT9DKCyohEC/nw+Ru/PyPFo6oKi/+TcYkybwW66O6i8/I4JqwQtAxswPUyhNKjzWMr1mfV924
 5CHmUGnkbe6fy0NfZUZF0ac7M7Vahy6B8LuK60P72AtEE6A0ZT6jh3ReHGAY60Vfc5V8v8ob/
 KW4IOQfxJnXC61ykF94olmoPJwGsA2N7cT6MaSC1JF019R69I5TtERtjMw77whJloCXR97qFL
 rS9TM+a2tAycJRb9uP7OpiwrwLjunP5kMjNMdoPVYR2ehq0Bu1vf9SrVS0gT5TQtUSAwdtfbU
 i442RPTbbj/GvKm3scNVQqZoqMqDK5TTdLUNUHPHRCAypI6oY3E6fzZRB

Am 19.11.24 um 05:29 schrieb Kurt Borja:

> On Mon, Nov 18, 2024 at 09:54:25PM -0600, Mario Limonciello wrote:
>> Loop Dell Client Kernel M/B for any comments.
>>
>> On 11/18/2024 21:47, Kurt Borja wrote:
>>> Hi!
>>>
>>> I'm planning on migrating the alienware-wmi driver to the new WMI
>>> interface, as it's currently using the deprecated one.
>> =F0=9F=8E=89

I like this :)

>>
>>> My plan is to:
>>>
>>> rename alienware-wmi.c -> alienware-wmi-base.c
>>> create alienware-wmi.h
>>> create alienware-wmi-legacy
>>> create alienware-wmi-wmax
>>>
>>> The last two files would not be independent modules, just includes for
>>> the base module. The base module would be in charge of initializing th=
e
>>> platform driver plus the correct wmi_driver backend, but the wmi probe=
s
>>> would register the platform device. This would be very similar to what
>>> other dell drivers already do. Aditionally I want to migrate everythin=
g
>>> to the state container design pattern.
>>>
>>> I would do this in such a way that the legacy and new code would be
>>> completely independent of each other (i.e. different state containters=
,
>>> dmi checks, etc).
>> As the original author of this driver when I was at Dell I'll add some
>> comments.
>>
>> The 'legacy' code was very narrowly focused for supporting a handful of
>> hardware specifically for lighting control.  One was the original Alien=
ware
>> steam machine, and then a few generations of the X51.
>>
>> I don't know how much of the driver continues to work on hardware since
>> then.  Maybe Dell guys I added to CC can comment on how much of this ha=
s
>> stuck around over the years and keeps working.
> My guess is that none of it works on new models. The LEGACY wmi device
> is not longer included on new machines, as all lighting control is done
> through an EC and the WMAX device was repurposed to fan/thermal control.
> I say this based on exploring quite a few acpidumps and a couple RGB
> control Windows open source alternatives.
>
>>> Pros:
>>>    - Modern interfaces and design patterns
>>>    - This is compatible with Mario's upcoming platform profile changes=
 as
>>>      the WMAX device would hold a reference to the platform device
>>>    - Would not break compatibility as legacy code is independent
>>>    - Easier to understand and develop in the future
>>>
>>> Cons:
>>>    - Initialy alienware-wmi-base.c would be almost completely legacy c=
ode,
>>>      as new features don't require a platform device (yet), so
>>>      alienware-wmi-base would basically just register the wmax wmi dri=
ver
>>>      on newer machines
>>>    - With this design users would not be able to completely exclude le=
gacy
>>>      code with CONFIG parameters
>> I wonder if you're better off just having the legacy driver as it's own
>> kernel object?  If it only supports a handful of systems, most people w=
on't
>> need it compiled.
> Yes! I'd like to do this but unfortunately some user space applications
> might depend on attributes being available to a platform device named
> "alienware-wmi". This is why I wanted to have a unified "alienware-wmi"
> platform driver.
>
> Thank you for your feedback!

It see, that is unfortunate. In this case having a single driver which han=
dles the platform device
and calls the right initialization function from the other two files sound=
s like a good choice to me.

Thanks,
Armin Wolf

>>> After this I want to add HWMON and sparse keymap capabilities to the
>>> wmax interface.
>> =F0=9F=8E=89
>>
>>> I'm sure there are things I'm not seeing so feedback is greatly
>>> appreciated!
>>>
>>> Regards,
>>> Kurt
