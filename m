Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB1B665
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Feb 2026 23:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770248018; cv=none; b=AGv49RB/kxVrgrm+aqlMvVU+ItdhTGkCxzZBaA/ZifUAnqY6ur/7Q6XLxRsOGx4QaYhxBCvUtFKXOmak4OJ/lvIYmBbm+yyCnS/vapWdJjjufV2Xk3HaRS6xREviZJ1zKJm38z4L4xdTCStFO+P1VhVZxQhh2WK1tjZJFfeBKQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770248018; c=relaxed/simple;
	bh=dP2/aoSIWf9YB50lSeibgAeTMP2KPrsXdCMpaMP779o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=rSWurzuRlGzLqoUx8pNe843VTMAzbJwSCLZVihtiJirB9JHWCxHZK1IUZTL9QgxNbYWW1VwwG8h0ye1nRoTU492yufZ9mY9ujJmtPd7Ues4eN3U1k8/WmdGdq0ShMrV4dY5HyMqyQRlb0UbREbemjf9AbVc5PdEL8Xe/tRfNZqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apMaViTc; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apMaViTc"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-948bfb6b6bcso94567241.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Feb 2026 15:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770248017; x=1770852817; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfNDV6H6kxEj2A90s4cKmy0W1BITbHHyH6k/y3RKFx8=;
        b=apMaViTccMkYgkt2DZ+6svJMaULWARECKagsMG+ZyxGHqyQsNOkgMlNlPa6X/LxxnH
         BFXnW5p1Nxr9mR9EI4IREnaL71hUdsnsUjlq1LKbtXRxMlGhMgblfTxuXGKVT7JCS5oR
         T0Q6DbfMwkB/L0gTq/gaf+eSLdRnYcg9ddtfiAeXcZLdU9wWzAzkyuAjZkZt/Rhjjc9g
         gIh9Bwj9mKP9rXwW/coM2pXOzYPXqhGENS68Hf+LqT9i1uRxVG6+cqEW2pj9g5R8k7ZJ
         kkxgCZfx7mfvrlhbhTPbbe0NLSh0cbYSnt6DZiskSROcjNVvK6pVXRBUDP1ZCX+PtXz/
         gnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770248017; x=1770852817;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LfNDV6H6kxEj2A90s4cKmy0W1BITbHHyH6k/y3RKFx8=;
        b=VerekOt1vJqocAoKxK0+3DOZA/R1G3ZtEsBYiqLmDKD2G21v8qossMzTgtJMQmG1Ty
         ZwfU5VNdfiT2KrX0F7miZ5dOJu6/rAC7i2fkirMi9n+0YtaYcw5e7JAk76NRkBz3+zii
         Jtfmf2EojnSyXkmFD1OTBI7A3yg99mt9C560miNQtGPjOvkNXMmcjeepY41mGZq+TKgr
         orknMc0qY/kA7mJWnerLniseDp6jW6JY8CJ5lejkB438drwz23UK1X7F7xyKthZsOhGs
         ULG1okUzjo5d0T/eqJMH1xajslSSkFcsxcAUcTv4NkGmFneVbzI4rkwHlK83fG38xRl4
         bwUg==
X-Gm-Message-State: AOJu0Ywc9IO169cFNHQRPRgM/A0MQYPkET7cU0OtGSBibpHHBJHpW8hQ
	q3RNtZAQpE70lFxu92pfFtmTFWCbPV6J5onTlaER6yfEegbBm7SDBVyo
X-Gm-Gg: AZuq6aLPYRcwMeLOKMVqTdS2nZGALqpNjgHTvg1rmDljYLNbJ8YXaETpmCSJDJSD1f6
	cGDgqED+aHOeSMZVFcdJ8on1yA+bpr6LDBXwEZ0evxIAA0jomluO//zpLz1dD2xBhJ51pImaBiq
	M25w39Avr+bw8tgMPO9GakQA+Nl5ZQ3hwC/nKUz5vX65VK9SVr7tnWpj1y1W4RX9xQi4WBSKi5u
	Bqr7TyDxcKECgmMA9OkIGDH9T60s/wF+dgC2VAf55dlsOkafwHV4fxp1Sf1YRlhJYRNj1zKmodC
	Kh1q4n5I4CR1ZV+lGH+nyPyIVcRjYDcm9fGI742k+X7eP2a2rDrlDZ4SoN7g/bGRMHIGy+3Lc1U
	bXnwX75Rzzcs4R6znuOATcoLO9t1nqyi+Zm46KcOKjPOZFS7E0gB/3DhsFVrJOLlMri0cpwbTS0
	h819vqy7E=
X-Received: by 2002:a05:6102:2ac2:b0:5ef:b5fc:dd48 with SMTP id ada2fe7eead31-5f939469d70mr1228490137.9.1770248017006;
        Wed, 04 Feb 2026 15:33:37 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948dffaf5e5sm1221186241.14.2026.02.04.15.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 15:33:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Feb 2026 18:33:34 -0500
Message-Id: <DG6KJR1FONK7.2TL5QSPZ2A4GA@gmail.com>
Cc: <platform-driver-x86@vger.kernel.org>
Subject: Re: Report: lenovo_wmi_other FW attributes always read 0
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Rong Zhang" <i@rong.moe>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Armin
 Wolf" <W_Armin@gmx.de>, "Mark Pearson" <mpearson-lenovo@squebb.ca>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com>
 <C18EFC0C-741A-4DF3-85A9-E3DE9CBC1737@gmail.com>
 <DG6BU3U96TTS.1XNHFL5NRADT5@gmail.com>
 <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>
In-Reply-To: <4C43FF8D-A529-4645-93E8-DF5E6734328A@gmail.com>

On Wed Feb 4, 2026 at 12:45 PM -05, Derek J. Clark wrote:
> On February 4, 2026 8:43:56 AM PST, Kurt Borja <kuurtb@gmail.com> wrote:
>>On Wed Feb 4, 2026 at 3:36 AM -05, Derek J. Clark wrote:
>>> On February 4, 2026 12:00:12 AM PST, Kurt Borja <kuurtb@gmail.com> wrot=
e:
>>>>Hi all,
>>>
>>> Hi Kurt.
>>
>>Hi Derek,
>>
>>>
>>>>In my system (83KY Legion 7 16IAX1) the current_value of any of the
>>>>firmware attributes exposed by this driver always reads 0
>>>>
>>>>	$ ls /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/
>>>>	ppt_pl1_spl  ppt_pl2_sppt  ppt_pl3_fppt
>>>>
>>>>	$ cat /sys/class/firmware-attributes/lenovo-wmi-other-0/attributes/*/c=
urrent_value
>>>>	0
>>>>	0
>>>>	0
>>>>
>>>>After investigating my acpidump [1] I found that the argument passed to
>>>>the WMI method Arg2 is matched as a whole integer instead of individual
>>>>bytes (L: 49203)
>>>>
>>>>	If ((ToInteger (Arg2) =3D=3D 0x01010000))
>>>>	{
>>>>		Return (^^PC00.LPCB.EC0.F5E0) /* \_SB_.PC00.LPCB.EC0_.F5E0 */
>>>>	}
>>>>
>>>>	If ((ToInteger (Arg2) =3D=3D 0x01020000))
>>>>	{
>>>>		Return (^^PC00.LPCB.EC0.CCP1) /* \_SB_.PC00.LPCB.EC0_.CCP1 */
>>>>	}
>>>>
>>>>	If ((ToInteger (Arg2) =3D=3D 0x01030000))
>>>>	{
>>>>		/* This case (CPU FPPT) is actually just zero... */
>>>>		Return (Zero)
>>>>	}
>>>>
>>>>...and the driver always sets the second byte of Arg2 to the current
>>>>profile (mode), which is never zero!
>>>>
>>>>	attribute_id =3D
>>>>		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
>>>>		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
>>>>	-->	FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
>>>>		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
>>>>
>>>>So it never actually matches the attribute and falls back to zero :/
>>>>
>>>>This is however, not the case for all tunables. As you can see in the
>>>>acpidump, just bellow the block above, these are matched depending on
>>>>the current mode (second byte)
>>>
>>> This typically means that the method is stubbed so that it returns 0 on=
 is_supported. During development I forgot to go back and add a check for t=
his when adding the attributes. Per the spec, there is no profile that corr=
esponds to 0x00, so this is working as expected when showing an unsupported=
 attribute. If you add a debug print to the capdata driver when it is query=
ing the attributes you can see the entries are empty.=20
>>
>>Hmm it's weird because if I read
>>
>>	\_SB_.PC00.LPCB.EC0_.F5E0
>>	\_SB_.PC00.LPCB.EC0_.CCP1
>>
>>directly, they show the correct SPPT and SPL values shown in the windows
>>Legion Space app (under Custom mode).
>>
>>It seems like these are supported?
>
> Oh, that is strange, yeah. It also explains why some things just aren't w=
orking like they should. Once again the documentation is not completely acc=
urate for this interface, which is quite frustrating... I think I have a de=
vice with this problem as well that I haven't yet troubleshot in the new se=
ries, so I can work it locally.
>
> It sounds like I'll need to check if the current mode entry is present in=
 the cached data, and if not check if there is a  "no mode" present. Traver=
sing the list twice seems tedious & slow, so I'll probably refactor the cap=
data side to check for a match in bytes 0, 1, and 3, and if byte 2 is 0 in =
the data then return that, but if it is missing continue to search for the =
match? They have historically been in ascending order (though, at this poin=
t I don't know if that can be trusted) I'm curious if any devices have both=
 a 00 entry and mode specific entries, because that pattern would possibly =
break them. I could perhaps save the index of the 00 entry separately when =
it is seen, then keep looking for the exact match and, if not found, fall b=
ack to the saved index. That guarantees a maximum O(n) search every time, w=
hich isn't great either.

I checked the captada buffers in my device and the "mode" byte is never
zero :/ In fact every tunable is listed once for each mode, which I
think is just normal behavior.

Can you send me an acpidump of a device which enforces the mode byte for
each tunable? I want to see how other devices do it.

>
> I'd like to hear everyone else's thoughts, perhaps there's a more clever =
way we can do this efficiently and accurately.

I think my firmware's behavior is just non-compliant with the
specification. In that case a quirk approach should work? The only
problem would be the tunables that DO enforce the mode byte in my
system.

Another possibility is that there are some tunables that do not enforce
modes (but don't necessarily reject them either).

Maybe a workaround for non-compliant attributes could work. Something
dirty like

zero_fallback:
	attribute_id =3D LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->featu=
re_id,
				    mode, tunable_attr->type_id);
	ret =3D lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
	if (ret)
		return ret;
=09
	...

	if (value =3D=3D 0) {
		mode =3D 0;
		goto zero_fallback;
	}

I wonder how Legion Space deals with my device...

>
> I assume these values are also tunable in Legion Space in Windows and not=
 just viewable?
>
> Thanks,
> Derek
>
>>
>>>
>>> Coincidentally, I'm planning on submitting a series this week that adds=
 the missing check for is_supported and also adds the not yet implemented a=
ttributes. If you want to take an early preview, it can be found here:
>>>
>>> https://github.com/pastaq/linux/tree/pastaq/6.18/lenovo/wmi-next
>>>
>>> With this you should only see attributes that are supported.
>>
>>Same problem, see bellow
>>
>>	$ fwupdmgr get-bios-settings
>>
>>	gpu_oc_stat:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the GPU overclocking status
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>	cpu_temp:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU thermal load limit
>>	  Read Only:            False
>>	  Minimum value:        85
>>	  Maximum value:        105
>>	  Scalar Increment:     1
>>
>>	gpu_nv_ac_offset:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the Nvidia GPU AC total processing power bas=
eline offset
>>	  Read Only:            False
>>	  Minimum value:        10
>>	  Maximum value:        80
>>	  Scalar Increment:     1
>>
>>	gpu_nv_cpu_boost:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the Nvidia GPU to CPU dynamic boost limit
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>	gpu_temp:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the GPU thermal load limit
>>	  Read Only:            False
>>	  Minimum value:        75
>>	  Maximum value:        87
>>	  Scalar Increment:     1
>>
>>	ppt_pl1_spl:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU sustained power limit
>>	  Read Only:            False
>>	  Minimum value:        50
>>	  Maximum value:        110
>>	  Scalar Increment:     1
>>
>>	cpu_oc_stat:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU overclocking status
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>	ppt_cpu_cl:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU cross loading power limit
>>	  Read Only:            False
>>	  Minimum value:        30
>>	  Maximum value:        75
>>	  Scalar Increment:     1
>>
>>	ppt_pl2_sppt:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU slow package power tracking limit
>>	  Read Only:            False
>>	  Minimum value:        60
>>	  Maximum value:        168
>>	  Scalar Increment:     1
>>
>>	ppt_pl1_tau:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the CPU sustained power limit exceed duratio=
n
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>	gpu_nv_ppab:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the Nvidia GPU power performance aware boost=
 limit
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>	gpu_nv_ctgp:
>>	  Setting type:         Integer
>>	  Current Value:        0
>>	  Description:          Set the GPU configurable total graphics power
>>	  Read Only:            False
>>	  Minimum value:        0
>>	  Maximum value:        0
>>	  Scalar Increment:     0
>>
>>Also it still shows SPPT and SPL as supported (which is coherent with
>>Legion Space).
>>

--=20
Thanks,
 ~ Kurt
