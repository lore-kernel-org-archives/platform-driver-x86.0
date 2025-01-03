Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDF91474D3;
	Fri,  3 Jan 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937796; cv=none; b=rF311e84q5OLl4CS4ZbY1Rt5RbGqRUKts2F7BSsXveN/4S1JvTkVccy/wfcozTkLPGp4jsLNxVm9uwudZ4PQRZK8XajfSAZOQx1zqdE/iHFRx+eGYdrwUxP8UdiUOVGS/gRSMaefZpnAw1TcSad8OaE3ZP0NmtFxf/Ilez8e3Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937796; c=relaxed/simple;
	bh=YDIpz7o+3jkj2vWjXrL3ZXo9r/RAG7yfa+VzOT7QO8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/GvqePxansemTE7RalUg+8QiHoCoSkkn/tq7ShbY3h4fuQ/1qjLYGPkjiOD2fvCiHOxFG3APCrE4Vd7fMI0HhvcRHKVxxO7kcG8IjFZsOqB7ZbpdNN7nCOTvSMLILK53G3n+yF+Ta43367Jsn/6fL4T6l/4vgAWufP+t/efx5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ujc0oxyL; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ujc0oxyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735937775; x=1736542575; i=w_armin@gmx.de;
	bh=K8rV6pJnFwBRfhgUSIirbdIMMGiEjtwKRhlcN1Wj8jc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Ujc0oxyLYmPZOb9trnPp0mQpYuxXgan90y/l2MrfExJPBq/8mbGga+DkmO6tezWQ
	 14uVw/wjl4mtpIMPkMiBy7k01DMXvKj0+2zk8al/2ln7fvGxGIpAwse2d9GD0U7di
	 Jp7f5NyhP7bosCqEiu/7dfqnTxJz4zNmNwPW9i3yxmEsmjOSbRQXYR5NtTPHbGh2O
	 d0rOVZb7pZB7PUBnzcjUwDaERA4Jf6NXCEE4NiieYQOQlZnd3Pwag36B/BAXNaNex
	 WMrIdFeB533r0Jnsw+q9XdB4A4TZQwaveZJPxgcu6EoppUgMXuIFDp5R1ez5j204H
	 vgA37GWo8fPQ7x96ag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHXBp-1tGwfv3ICP-00EJ57; Fri, 03
 Jan 2025 21:56:14 +0100
Message-ID: <665df442-4970-49c3-aa95-5e83148b23e5@gmx.de>
Date: Fri, 3 Jan 2025 21:56:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Kurt Borja <kuurtb@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>
Cc: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com,
 platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241226153031.49457-1-josh@joshuagrisham.com>
 <mvp4rhnpzjdfyacuzczg2y5vms7hnarxxwbnk3pbtfx3mg3mrm@vzceo5cfjfl6>
 <CAMF+KebdvjTKYAxWqk0dMaUc=jtqw624GKyc=j4gHJ2PBQK1gA@mail.gmail.com>
 <v4ch4vicbofhr2sawc6synxzf552lxukr73f2qtothdedvoafh@or3ghcu3zqcm>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <v4ch4vicbofhr2sawc6synxzf552lxukr73f2qtothdedvoafh@or3ghcu3zqcm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5MPd//h6H1ZxNcGC+1khJu3KIowvQXL1OH4UuPSRkATsh3FiUlV
 /OhlYuU4ouMbsAjmfOTbEFXblfOcEJWkAlyIYFzUjU7ppoJ+BraWxXrpGcn0mkxmZZ7TqNS
 mOtnMk5URmA2UWahApDISGPXOiYyxiLu4ooaPl32JsTU+3oxf+DxQyCfU/UoAPhx4XBsVS/
 +IBoXH+fM1+o14tEbRyPQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1dKT4F93V04=;dXYq0vE2OQn8R2+f8wHMUS/V2eH
 CmkawbNcSD5kpOL+Ng599AEYCwdOqV6Ebi+kpWRhZKl/SPBStRwgjG/dF12BjRcTVuiLUmHn8
 FbtLsoGELR4Z7UUertNFiIeT6hUD/xdA1fpsQcX6nAtohjpqhvTUqQqGG9tuOVlzMcq+o741w
 cWK2/UrgzPJLzKANLzN24+DhWd00LlebUZWtaZn//W5ijdWzHAEZSM/2NzfTO0iC/R0lgXBVI
 tPPymBVWrYSecMMjJdXm/cnn/skP2a5/tdOy40G2CI0W3Mg3YSQFH3baIjUvRcNtYkgq2GDBh
 rpMRCRRZDpT4RUCs8VE2Dqs0jf2Bf/u4Oef/dGOcWmWxkmQfKsdpiX8y9G7SICGRkhKl3waJP
 i5lbOgHKvWU1BSsBnIpFYr1QCl5oG7g3/GzGXGpHURieYNSQdNyIYd4/LpgwP9vmPuWO/aLsN
 8gE+l4QBZoB837bk9rqf+YbLBP7ADLle5vzgc1Jh5pI59nzOCaOsx1zZ6rFy2TkQHZRWpCtaH
 twE5M1MUjLQnJG95RUKWWBrm72vnz+0s73+FeqXd3LIzbPUNBGrlkOU3TUQ6LvX5kPH5ECg1b
 XjKA7l2IVQGpLqV9J/RRDhSbkncyh24p35IZM2VOAYot6KJiwTXh9OLEigyETaYcoTxoAwIYR
 Vlsyc/WmnssGxJA+532ORReTCaNPQkLclIrAx/Tqa6umNcmQ7OVjZOQBmHzdBLVO90Hfq4INY
 BLAowFBq3JNHAsagIMjIMTmiMCK0TK3E+oVx9Yl08DG71G0sSjuSJNY5OzAZOceocIj3klDTl
 T7yIQcQyVy5Ja+fb6xNkhfTmHJz/BlOYlmlf3/26zSv5eQbFTVspgSjP8sMTv/CV5s2pcGvzt
 QFeIvC1iH1FPDHfrro25ueMIufqWSzvjYsmINYkevHg7yv82K0wFqofQLw4jpr5bbjnKY2fkl
 l7gzewe9Aw8mRLQCACzDL10re9TCLk00s6jVa8ZGbKWHK8EMKBFUPGA6cvlcjVeSTrwnlptpj
 FGNsWlIAFFjZnranwL8N456y5frdXWOWwCzTSrhVuSqR83ljVkwfLl+Hg0jtXq/S3wNwrat2K
 YiE21wuhDUCstNFAdHTzy+bPZpPi5k

Am 03.01.25 um 19:52 schrieb Kurt Borja:

> On Fri, Jan 03, 2025 at 07:19:51PM +0100, Joshua Grisham wrote:
>> Hi Kurt, thanks for the comments! Will respond inline below...
>>
>> Den m=C3=A5n 30 dec. 2024 kl 18:50 skrev Kurt Borja <kuurtb@gmail.com>:
>>>> +     if (err)
>>>> +             goto return_with_dbg;
>>>> +
>>>> +     galaxybook->has_kbd_backlight =3D true;
>>>> +
>>>> +     return 0;
>>>> +
>>>> +return_with_dbg:
>>>> +     dev_dbg(&galaxybook->platform->dev,
>>>> +             "failed to initialize kbd_backlight, error %d\n", err);
>>>> +     return 0;
>>> Return `err` here.
>>>
>> I actually intentionally want to return 0 here -- the feature is "not
>> enabled" but other features of the driver can be (so probe should not
>> fail and unload the module). Not all devices that have these ACPI IDs
>> will have keyboard backlight (or various other features that are
>> supported by this module), but do have other features, so those
>> features that exist on the specific device should "work" ideally while
>> others are not made available. This logic matches the behavior from
>> before but just slightly refactored now to clean it up a bit. Per some
>> other comments from Armin I will change a bit of this so the debug
>> messages will be more clear at "point of use" so hopefully it will be
>> even more clear; does this seem ok or should there also be a comment
>> or clear text in the debug message that it will continue without
>> failing the probe?
> I thought this might have been the case, but you do propagate errors
> from this method to the probe, even though it always returns 0, so it
> seems that you wanted to return err instead.
>
> To me it would be better to make this method void like
> galaxybook_profile_init() or galaxybook_battery_threshold_init(). But
> I'd like to hear Armin's opinion.

I am OK with returning 0 in case some errors are expected and should not c=
ause a probe error.

However errors coming from other subsystems (e.g. error during subsystem r=
egistration) should usually
be propagated so that the driver either registers all supported interfaces=
 or none.

Thanks,
Armin Wolf

>>>> +     int mapped_profiles;
>>>>   [...]
>>>> +             /* if current mode value mapped to a supported platform=
_profile_option, set it up */
>>>> +             if (mode_profile !=3D IGNORE_PERFORMANCE_MODE_MAPPING) =
{
>>>> +                     mapped_profiles++;
>>> mapped_profiles is uninitialized!!
>>>
>> Thank you! A total miss on my part .. and feels like just random
>> chance that I have not had an issue so far (it seems like it has
>> always grabbed fresh memory / a value that was already 0) but I will
>> fix this :)
> Thankfully, I think there are kernel configs to auto-initialize stack
> variables to 0. That may be why you didn't encounter problems.
>
>>>> +     err =3D galaxybook_i8042_filter_install(galaxybook);
>>>> +     if (err)
>>>> +             return dev_err_probe(&galaxybook->platform->dev, err,
>>>> +                                  "failed to initialize i8042_filter=
\n");
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static void galaxybook_remove(struct platform_device *pdev)
>>>> +{
>>>> +     if (galaxybook_ptr)
>>>> +             galaxybook_ptr =3D NULL;
>>> Please someone correct me if I'm wrong.
>>>
>>> Device resources get released after calling the .remove callback,
>>> therefore there is a small window in which the i8042 filter is *still*
>>> installed after this point, which means you could dereference a NULL
>>> pointer.
>>>
>>> I suggest not using devres for the i8042 filter.
>>>
>> I believe you are correct, and I checked some of the driver core code
>> and was able to pinpoint the exact sequence to confirm. This was also
>> mentioned by Armin in a comment. My intention is that I will actually
>> fold everything to do with this global pointer into the i8042 init /
>> remove functions since it is the only thing that uses it, so hopefully
>> all will work out ok. Also my intention further is if Armin's changes
>> to add a context pointer to the i8042 filter hook get accepted and
>> merged then I will move to that and remove this global pointer
>> entirely :)
> Yes, I'm also waiting for it to get merged. I want to implement a filter
> in alienware-wmi.
>
>> Thanks again for looking into this, and please feel free to say if
>> there is anything else you find or something I responded with here
>> that does not sound good!
> Sure :)
>
> ~ Kurt
>
>> Joshua
