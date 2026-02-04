Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007993101B4
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770227132; cv=none; b=gMf07J3ad8fidUEIWrrA5i8/oGZ7hvy1xlGLItpXXCBMTY7WmIYO1vAX8gJOCZlWYNrLEIkIVjYABWbZsXfEKxYdpgAqlc+SQ65o6Zmezjj5QAeA7hq2Q1awN1w4iig/DTW6rIIBmtitHi/nCsdvyLsCOdcFhWfYHH7YRPBMqak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770227132; c=relaxed/simple;
	bh=CzIFoSsDiDFqD00xSMNMp1SnbrJtYklBwOMwblYv5cc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=g73VNp8LCB/sn1ZLZz/zESdSgWyKkTMtL46R77KnGdj6KG27JYyTRpulfq2HKlEdRfQ4/ZV0sJ6Em53yvJcZyCxLxeg+k+OfArf/iV/q5fviCFmOtqdl1zwCJt2NxFGg4+MXPp6FGYpb2dsMIM3qW+fC3pvcThkGcFi+51RaIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i19IqBYt; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i19IqBYt"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1249b9f5703so252096c88.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 09:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770227131; x=1770831931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A84kFlhh+1WF5G32zd29LxFfWVffkWxxUVAyadyymOs=;
        b=i19IqBYt/8E+FmMqr1yt1tpkh2hippiBJHkV4FQJ/x08cskzBjeabzZ/6BYul+/YoL
         Q99rLo+2nncrGv9OIGComrodGjAHW9IV/Vt/PmiM13+1MEXhpXy9iQVwg8Ws72L/6gXh
         IngcUWUxul1yTINeoZOwM2rCmd7d8+NUU4lnbuHLL7jx85QYNI0aX4b7Go4p+sq933sE
         /xemxeOB78j1fSp8UtEWAePk2dD2o57NqKUNTJvUKsyey9Im+uKty8oZKvyRSOaFmhGC
         78bQPtZcES9liSQh+MPRGRjV9Ja0+gUCARmbV99jitpA3TzB4QEyIGyn/ItYVGhbkvZb
         K2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227131; x=1770831931;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A84kFlhh+1WF5G32zd29LxFfWVffkWxxUVAyadyymOs=;
        b=TC1Yulv5XaNsuyIEuWuBAnnVmCo6bRDepKrmn8F0dJDu9VNEYvmracT5J0ILxJFqNO
         FiYYPAapUAPvSsyBOqReZxAF7/W07ga6mn/g+zRUhiYUNHAoLcXb5No3ZiMvjrHSA16q
         /F+/LbB0VGNYPoz8eWGQoTVY9Sc6Tkon6KKqibS5GJmfHXTi3AtG6gnBv6qAKGwNqWdw
         IKCW2UB29hshODZd8K6Zrj/u8iPfJ8R8wh7YQlJPRrgu2pYRpPkkXtxRTFkaGmNWYozz
         GRZfrqKxlTJixgIK1sLMb0p5/460qhwlPv5Fu0wSYGqK5y94+ODi30RKOzQNvfO6/R+O
         6Vsw==
X-Gm-Message-State: AOJu0Yyag3WKxc+v/JhwOQRc6ZjoYu8/OSvxf0cSvDowcQr7IN+t8y3u
	t2hb2GIkJR0bBl1et+5r9IHKLKn2Ur2RLGAdAAOsn6YcvcugmvSYYNuW
X-Gm-Gg: AZuq6aJQIoKMzfYTLPLzWMUY0lxPQ8hQhpiar94GfQxzCwqoXFaB9ATRYcJ2mbmz1br
	yZdLqG/aM7m7eh30wgal6SIUVOwRp/xGGi/8fZCMGWdNdLWIQO62/L5v5Zeow43mWAfpvXUeDQU
	z8cl94wjpj3prhgi5sZufZ7sM8U+8uJgbQ6l2L8Lz4eLQuUDg4HBDr05CbKA/fBqaq8mZ1anUr5
	31deEQAWvx9oeFc8FIf8CdAh3OpxpkbaVintvlHys+IlIw4FEQXlQWemskr4WCpzlsWNdtshPkw
	/U2cUzoG8flzzkJhBduO53wZV103f/iMN9oCYPHqZJ8bfbO9r2/T8s8iC1GEF+HJ8kl0hR6LL9t
	shwv+9KSLtmGd2t5ITsILAMxtJBZSbe84rHS0wz4yD+aviispH79NvXmAuJTgw6a5ez7VeZseqE
	mXrr0lesbk+FTdobRsjJEhSdcAP0jAiPN0S8ZYH8UG4TLuHkxxpE5uQcOVXrpd42lrrTW7iccEE
	8b9PHjqDw==
X-Received: by 2002:a05:7022:426:b0:11a:44d1:533a with SMTP id a92af1059eb24-126f4784b01mr1313141c88.12.1770227130873;
        Wed, 04 Feb 2026 09:45:30 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f4e05ce7sm2332563c88.1.2026.02.04.09.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:45:30 -0800 (PST)
Date: Wed, 04 Feb 2026 09:45:29 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Rong Zhang <i@rong.moe>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, Mark Pearson <mpearson-lenovo@squebb.ca>
CC: platform-driver-x86@vger.kernel.org
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
User-Agent: Thunderbird for Android
In-Reply-To: <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com> <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com> <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
Message-ID: <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail=2Ecom> wrote:
>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J=2E Clark wrote:
>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail=2Ecom> wr=
ote:
>>>Hi all,
>>
>> Hi Kurt=2E
>
>Hi Derek,
>
>>
>>>In my system (83KY Legion 7 16IAX1) the current_value of any of the
>>>firmware attributes exposed by this driver always reads 0
>>>
>>>	$ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/
>>>	ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>>>
>>>	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/*/c=
urrent_value
>>>	0
>>>	0
>>>	0
>>>
>>>After investigating my acpidump [1] I found that the argument passed to
>>>the WMI method Arg2 is matched as a whole integer instead of individual
>>>bytes (L: 49203)
>>>
>>>	If ((ToInteger (Arg2) =3D=3D 0x01010000))
>>>	{
>>>		Return (^^PC00=2ELPCB=2EEC0=2EF5E0) /* \_SB_=2EPC00=2ELPCB=2EEC0_=2EF=
5E0 */
>>>	}
>>>
>>>	If ((ToInteger (Arg2) =3D=3D 0x01020000))
>>>	{
>>>		Return (^^PC00=2ELPCB=2EEC0=2ECCP1) /* \_SB_=2EPC00=2ELPCB=2EEC0_=2EC=
CP1 */
>>>	}
>>>
>>>	If ((ToInteger (Arg2) =3D=3D 0x01030000))
>>>	{
>>>		/* This case (CPU FPPT) is actually just zero=2E=2E=2E */
>>>		Return (Zero)
>>>	}
>>>
>>>=2E=2E=2Eand the driver always sets the second byte of Arg2 to the curr=
ent
>>>profile (mode), which is never zero!
>>>
>>>	attribute_id =3D
>>>		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>>>		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>>>	-->	FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>>>		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>>>
>>>So it never actually matches the attribute and falls back to zero :/
>>>
>>>This is however, not the case for all tunables=2E As you can see in the
>>>acpidump, just bellow the block above, these are matched depending on
>>>the current mode (second byte)
>>
>> This typically means that the method is stubbed so that it returns 0 on=
 is_supported=2E During development I forgot to go back and add a check for=
 this when adding the attributes=2E Per the spec, there is no profile that =
corresponds to 0x00, so this is working as expected when showing an unsuppo=
rted attribute=2E If you add a debug print to the capdata driver when it is=
 querying the attributes you can see the entries are empty=2E=20
>
>Hmm it's weird because if I read
>
>	\_SB_=2EPC00=2ELPCB=2EEC0_=2EF5E0
>	\_SB_=2EPC00=2ELPCB=2EEC0_=2ECCP1
>
>directly, they show the correct SPPT and SPL values shown in the windows
>Legion Space app (under Custom mode)=2E
>
>It seems like these are supported?

Oh, that is strange, yeah=2E It also explains why some things just aren't =
working like they should=2E Once again the documentation is not completely =
accurate for this interface, which is quite frustrating=2E=2E=2E I think I =
have a device with this problem as well that I haven't yet troubleshot in t=
he new series, so I can work it locally=2E

It sounds like I'll need to check if the current mode entry is present in =
the cached data, and if not check if there is a  "no mode" present=2E Trave=
rsing the list twice seems tedious & slow, so I'll probably refactor the ca=
pdata side to check for a match in bytes 0, 1, and 3, and if byte 2 is 0 in=
 the data then return that, but if it is missing continue to search for the=
 match? They have historically been in ascending order (though, at this poi=
nt I don't know if that can be trusted) I'm curious if any devices have bot=
h a 00 entry and mode specific entries, because that pattern would possibly=
 break them=2E I could perhaps save the index of the 00 entry separately wh=
en it is seen, then keep looking for the exact match and, if not found, fal=
l back to the saved index=2E That guarantees a maximum O(n) search every ti=
me, which isn't great either=2E

I'd like to hear everyone else's thoughts, perhaps there's a more clever w=
ay we can do this efficiently and accurately=2E

I assume these values are also tunable in Legion Space in Windows and not =
just viewable?

Thanks,
Derek

>
>>
>> Coincidentally, I'm planning on submitting a series this week that adds=
 the missing check for is_supported and also adds the not yet implemented a=
ttributes=2E If you want to take an early preview, it can be found here:
>>
>> https://github=2Ecom/pastaq/linux/tree/pastaq/6=2E18/lenovo/wmi-next
>>
>> With this you should only see attributes that are supported=2E
>
>Same problem, see bellow
>
>	$ fwupdmgr get-bios-settings
>
>	gpu_oc_stat:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the GPU overclocking status
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>	cpu_temp:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU thermal load limit
>	  Read Only:            False
>	  Minimum value:        85
>	  Maximum value:        105
>	  Scalar Increment:     1
>
>	gpu_nv_ac_offset:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the Nvidia GPU AC total processing power bas=
eline offset
>	  Read Only:            False
>	  Minimum value:        10
>	  Maximum value:        80
>	  Scalar Increment:     1
>
>	gpu_nv_cpu_boost:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the Nvidia GPU to CPU dynamic boost limit
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>	gpu_temp:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the GPU thermal load limit
>	  Read Only:            False
>	  Minimum value:        75
>	  Maximum value:        87
>	  Scalar Increment:     1
>
>	ppt_pl1_spl:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU sustained power limit
>	  Read Only:            False
>	  Minimum value:        50
>	  Maximum value:        110
>	  Scalar Increment:     1
>
>	cpu_oc_stat:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU overclocking status
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>	ppt_cpu_cl:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU cross loading power limit
>	  Read Only:            False
>	  Minimum value:        30
>	  Maximum value:        75
>	  Scalar Increment:     1
>
>	ppt_pl2_sppt:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU slow package power tracking limit
>	  Read Only:            False
>	  Minimum value:        60
>	  Maximum value:        168
>	  Scalar Increment:     1
>
>	ppt_pl1_tau:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the CPU sustained power limit exceed duratio=
n
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>	gpu_nv_ppab:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the Nvidia GPU power performance aware boost=
 limit
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>	gpu_nv_ctgp:
>	  Setting type:         Integer
>	  Current Value:        0
>	  Description:          Set the GPU configurable total graphics power
>	  Read Only:            False
>	  Minimum value:        0
>	  Maximum value:        0
>	  Scalar Increment:     0
>
>Also it still shows SPPT and SPL as supported (which is coherent with
>Legion Space)=2E
>

